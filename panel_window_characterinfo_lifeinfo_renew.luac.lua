-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\characterinfo\panel_window_characterinfo_lifeinfo_renew.luac 

-- params : ...
-- function num : 0
local _panel = Panel_Window_Life_Renew
local _mainPanel = Panel_Window_CharacterInfo_Renew
local CharacterLifeInfo = {
_ui = {stc_LifeBG = (UI.getChildControl)(_panel, "Static_LifeBG")}
, defaultFrameBG_CharacterInfo_LifeInfo = nil, 
craftType = {gather = 0, fishing = 1, hunting = 2, cooking = 3, alchemy = 4, manufacture = 5, training = 6, trade = 7, growth = 8, sail = 9, levelText = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_CRAFTLEVEL")}
, 
detailCraftType = {gather = 1, fishing = 2, manufacture = 6, growth = 9}
, 
detailCraftType_gather = {felling = 1, sap = 2, hommy = 3, slaughter = 4, tanning = 5, mining = 6}
, 
detailCraftType_fishing = {normal = 1, harpoon = 2}
, 
detailCraftType_manufacture = {shaking = 1, griding = 2, firewood = 3, drying = 4, thinout = 5, heating = 6}
, 
detailCraftType_growth = {mushroom = 1, vegetable = 2, fruit = 3, grain = 4}
}
CharacterLifeInfo.init = function(self)
  -- function num : 0_0
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).stc_GatherBG = (UI.getChildControl)((self._ui).stc_LifeBG, "Static_GatheringBG")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_Gather = (UI.getChildControl)((self._ui).stc_GatherBG, "Static_Gathering")
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_GatherFellingTitle = (UI.getChildControl)((self._ui).stc_GatherBG, "StaticText_Gathering_Felling_Title")
  ;
  ((self._ui).txt_GatherFellingTitle):SetText("· " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_FELLING"))
  -- DECOMPILER ERROR at PC42: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_GatherSapTitle = (UI.getChildControl)((self._ui).stc_GatherBG, "StaticText_Gathering_Sap_Title")
  ;
  ((self._ui).txt_GatherSapTitle):SetText("· " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_SAP"))
  -- DECOMPILER ERROR at PC61: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_GatherHommyTitle = (UI.getChildControl)((self._ui).stc_GatherBG, "StaticText_Gathering_Hommy_Title")
  ;
  ((self._ui).txt_GatherHommyTitle):SetText("· " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_HOMMY"))
  -- DECOMPILER ERROR at PC80: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_GatherSlaughterTitle = (UI.getChildControl)((self._ui).stc_GatherBG, "StaticText_Gathering_Slaughter_Title")
  ;
  ((self._ui).txt_GatherSlaughterTitle):SetText("· " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_SLAUGHTER"))
  -- DECOMPILER ERROR at PC99: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_GatherTanningTitle = (UI.getChildControl)((self._ui).stc_GatherBG, "StaticText_Gathering_Tanning_Title")
  ;
  ((self._ui).txt_GatherTanningTitle):SetText("· " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_TANNING"))
  -- DECOMPILER ERROR at PC118: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_GatherMiningTitle = (UI.getChildControl)((self._ui).stc_GatherBG, "StaticText_Gathering_Mining_Title")
  ;
  ((self._ui).txt_GatherMiningTitle):SetText("· " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_MINING"))
  -- DECOMPILER ERROR at PC137: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_GatherFellingValue = (UI.getChildControl)((self._ui).stc_GatherBG, "StaticText_Gathering_Felling_Value")
  -- DECOMPILER ERROR at PC145: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_GatherSapValue = (UI.getChildControl)((self._ui).stc_GatherBG, "StaticText_Gathering_Sap_Value")
  -- DECOMPILER ERROR at PC153: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_GatherHommyValue = (UI.getChildControl)((self._ui).stc_GatherBG, "StaticText_Gathering_Hommy_Value")
  -- DECOMPILER ERROR at PC161: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_GatherSlaughterValue = (UI.getChildControl)((self._ui).stc_GatherBG, "StaticText_Gathering_Slaughter_Value")
  -- DECOMPILER ERROR at PC169: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_GatherTanningValue = (UI.getChildControl)((self._ui).stc_GatherBG, "StaticText_Gathering_Tanning_Value")
  -- DECOMPILER ERROR at PC177: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_GatherMiningValue = (UI.getChildControl)((self._ui).stc_GatherBG, "StaticText_Gathering_Mining_Value")
  -- DECOMPILER ERROR at PC185: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_GatherLine1 = (UI.getChildControl)((self._ui).stc_GatherBG, "Static_Gathering_Line1")
  -- DECOMPILER ERROR at PC193: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_GatherLine2 = (UI.getChildControl)((self._ui).stc_GatherBG, "Static_Gathering_Line2")
  -- DECOMPILER ERROR at PC201: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_GatherLine3 = (UI.getChildControl)((self._ui).stc_GatherBG, "Static_Gathering_Line3")
  -- DECOMPILER ERROR at PC209: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_GatherLine4 = (UI.getChildControl)((self._ui).stc_GatherBG, "Static_Gathering_Line4")
  -- DECOMPILER ERROR at PC217: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_GatherLine5 = (UI.getChildControl)((self._ui).stc_GatherBG, "Static_Gathering_Line5")
  -- DECOMPILER ERROR at PC225: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_GatherProgressBG = (UI.getChildControl)((self._ui).stc_GatherBG, "Static_Gathering_ProgressBg")
  -- DECOMPILER ERROR at PC233: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).progress2_Gather = (UI.getChildControl)((self._ui).stc_GatherBG, "Progress2_Gathering")
  -- DECOMPILER ERROR at PC241: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_GatherProgress2BarHead = (UI.getChildControl)((self._ui).progress2_Gather, "Progress2_1_Bar_Head")
  -- DECOMPILER ERROR at PC249: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_GatherTitle = (UI.getChildControl)((self._ui).stc_GatherBG, "StaticText_Gathering_Title")
  -- DECOMPILER ERROR at PC257: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_GatherValue = (UI.getChildControl)((self._ui).stc_GatherBG, "StaticText_Gathering_Value")
  -- DECOMPILER ERROR at PC265: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_ManufactureBG = (UI.getChildControl)((self._ui).stc_LifeBG, "Static_ManufactureBG")
  -- DECOMPILER ERROR at PC273: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_Manufacture = (UI.getChildControl)((self._ui).stc_ManufactureBG, "Static_Manufacture")
  -- DECOMPILER ERROR at PC281: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_ManufShakingTitle = (UI.getChildControl)((self._ui).stc_ManufactureBG, "StaticText_Manufacture_Shaking_Title")
  ;
  ((self._ui).txt_ManufShakingTitle):SetText("· " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_SHAKING"))
  -- DECOMPILER ERROR at PC300: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_ManufGridingTitle = (UI.getChildControl)((self._ui).stc_ManufactureBG, "StaticText_Manufacture_Grinding_Title")
  ;
  ((self._ui).txt_ManufGridingTitle):SetText("· " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_GRIDING"))
  -- DECOMPILER ERROR at PC319: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_ManufFirewoodTitle = (UI.getChildControl)((self._ui).stc_ManufactureBG, "StaticText_Manufacture_Firewood_Title")
  ;
  ((self._ui).txt_ManufFirewoodTitle):SetText("· " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_FIREWOOD"))
  -- DECOMPILER ERROR at PC338: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_ManufDryingTitle = (UI.getChildControl)((self._ui).stc_ManufactureBG, "StaticText_Manufacture_Drying_Title")
  ;
  ((self._ui).txt_ManufDryingTitle):SetText("· " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_DRYING"))
  -- DECOMPILER ERROR at PC357: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_ManufThinOutTitle = (UI.getChildControl)((self._ui).stc_ManufactureBG, "StaticText_Manufacture_ThinOut_Title")
  ;
  ((self._ui).txt_ManufThinOutTitle):SetText("· " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_THINOUT"))
  -- DECOMPILER ERROR at PC376: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_ManufHeatingTitle = (UI.getChildControl)((self._ui).stc_ManufactureBG, "StaticText_Manufacture_Heating_Title")
  ;
  ((self._ui).txt_ManufHeatingTitle):SetText("· " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_HEATING"))
  -- DECOMPILER ERROR at PC395: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_ManufPackingTitle = (UI.getChildControl)((self._ui).stc_ManufactureBG, "StaticText_Manufacture_Packing_Title")
  ;
  ((self._ui).txt_ManufPackingTitle):SetText("· " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_PACKING"))
  -- DECOMPILER ERROR at PC414: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_ManufShakingValue = (UI.getChildControl)((self._ui).stc_ManufactureBG, "StaticText_Manufacture_Shaking_Value")
  -- DECOMPILER ERROR at PC422: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_ManufGridingValue = (UI.getChildControl)((self._ui).stc_ManufactureBG, "StaticText_Manufacture_Grinding_Value")
  -- DECOMPILER ERROR at PC430: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_ManufFirewoodValue = (UI.getChildControl)((self._ui).stc_ManufactureBG, "StaticText_Manufacture_Firewood_Value")
  -- DECOMPILER ERROR at PC438: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_ManufDryingValue = (UI.getChildControl)((self._ui).stc_ManufactureBG, "StaticText_Manufacture_Drying_Value")
  -- DECOMPILER ERROR at PC446: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_ManufThinOutValue = (UI.getChildControl)((self._ui).stc_ManufactureBG, "StaticText_Manufacture_ThinOut_Value")
  -- DECOMPILER ERROR at PC454: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_ManufHeatingValue = (UI.getChildControl)((self._ui).stc_ManufactureBG, "StaticText_Manufacture_Heating_Value")
  -- DECOMPILER ERROR at PC462: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_ManufPackingValue = (UI.getChildControl)((self._ui).stc_ManufactureBG, "StaticText_Manufacture_Packing_Value")
  -- DECOMPILER ERROR at PC470: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_ManufLine1 = (UI.getChildControl)((self._ui).stc_ManufactureBG, "Static_Manufacture_Line1")
  -- DECOMPILER ERROR at PC478: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_ManufLine2 = (UI.getChildControl)((self._ui).stc_ManufactureBG, "Static_Manufacture_Line2")
  -- DECOMPILER ERROR at PC486: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_ManufLine3 = (UI.getChildControl)((self._ui).stc_ManufactureBG, "Static_Manufacture_Line3")
  -- DECOMPILER ERROR at PC494: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_ManufLine4 = (UI.getChildControl)((self._ui).stc_ManufactureBG, "Static_Manufacture_Line4")
  -- DECOMPILER ERROR at PC502: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_ManufLine5 = (UI.getChildControl)((self._ui).stc_ManufactureBG, "Static_Manufacture_Line5")
  -- DECOMPILER ERROR at PC510: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_ManufLine6 = (UI.getChildControl)((self._ui).stc_ManufactureBG, "Static_Manufacture_Line6")
  -- DECOMPILER ERROR at PC518: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_ManufProgressBG = (UI.getChildControl)((self._ui).stc_ManufactureBG, "Static_Manufacture_ProgressBg")
  -- DECOMPILER ERROR at PC526: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).progress2_Manufacture = (UI.getChildControl)((self._ui).stc_ManufactureBG, "Progress2_Manufacture")
  -- DECOMPILER ERROR at PC534: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_ManufProgress2_1_BarHead = (UI.getChildControl)((self._ui).progress2_Manufacture, "Progress2_1_Bar_Head")
  -- DECOMPILER ERROR at PC542: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_ManufactureTitle = (UI.getChildControl)((self._ui).stc_ManufactureBG, "StaticText_Manufacture_Title")
  -- DECOMPILER ERROR at PC550: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_ManufactureValue = (UI.getChildControl)((self._ui).stc_ManufactureBG, "StaticText_Manufacture_Value")
  -- DECOMPILER ERROR at PC558: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_TrainingBG = (UI.getChildControl)((self._ui).stc_LifeBG, "Static_TrainingBG")
  -- DECOMPILER ERROR at PC566: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_Training = (UI.getChildControl)((self._ui).stc_TrainingBG, "Static_Training")
  -- DECOMPILER ERROR at PC574: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_TrainingHorseTitle = (UI.getChildControl)((self._ui).stc_TrainingBG, "StaticText_Training_Horse_Title")
  ;
  ((self._ui).txt_TrainingHorseTitle):SetText("· " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_TRAININGHORSE"))
  -- DECOMPILER ERROR at PC593: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_TrainingElephantTitle = (UI.getChildControl)((self._ui).stc_TrainingBG, "StaticText_Training_Elephant_Title")
  ;
  ((self._ui).txt_TrainingElephantTitle):SetText("· " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_TRAININGELEPHANT"))
  -- DECOMPILER ERROR at PC612: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_TrainingCamelTitle = (UI.getChildControl)((self._ui).stc_TrainingBG, "StaticText_Training_Camel_Title")
  ;
  ((self._ui).txt_TrainingCamelTitle):SetText("· " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_TRAININGCAMEL"))
  -- DECOMPILER ERROR at PC631: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_TrainingHorseValue = (UI.getChildControl)((self._ui).stc_TrainingBG, "StaticText_Training_Horse_Value")
  -- DECOMPILER ERROR at PC639: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_TrainingElephantValue = (UI.getChildControl)((self._ui).stc_TrainingBG, "StaticText_Training_Elephant_Value")
  -- DECOMPILER ERROR at PC647: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_TrainingCamelValue = (UI.getChildControl)((self._ui).stc_TrainingBG, "StaticText_Training_Camel_Value")
  -- DECOMPILER ERROR at PC655: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_TrainingLine1 = (UI.getChildControl)((self._ui).stc_TrainingBG, "Static_Training_Line1")
  -- DECOMPILER ERROR at PC663: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_TrainingLine2 = (UI.getChildControl)((self._ui).stc_TrainingBG, "Static_Training_Line2")
  -- DECOMPILER ERROR at PC671: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_TrainingProgressBG = (UI.getChildControl)((self._ui).stc_TrainingBG, "Static_Training_ProgressBg")
  -- DECOMPILER ERROR at PC679: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).progress2_Training = (UI.getChildControl)((self._ui).stc_TrainingBG, "Progress2_Training")
  -- DECOMPILER ERROR at PC687: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_TrainingProgress2_1_BarHead = (UI.getChildControl)((self._ui).progress2_Training, "Progress2_1_Bar_Head")
  -- DECOMPILER ERROR at PC695: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_TrainingTitle = (UI.getChildControl)((self._ui).stc_TrainingBG, "StaticText_Training_Title")
  -- DECOMPILER ERROR at PC703: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_TrainingValue = (UI.getChildControl)((self._ui).stc_TrainingBG, "StaticText_Training_Value")
  -- DECOMPILER ERROR at PC711: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_FishingBG = (UI.getChildControl)((self._ui).stc_LifeBG, "Static_FishingBG")
  -- DECOMPILER ERROR at PC719: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_Fishing = (UI.getChildControl)((self._ui).stc_FishingBG, "Static_Fishing")
  -- DECOMPILER ERROR at PC727: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_FishingNormalTitle = (UI.getChildControl)((self._ui).stc_FishingBG, "StaticText_Fishing_Normal_Title")
  ;
  ((self._ui).txt_FishingNormalTitle):SetText("· " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_FISHINGNORMAL"))
  -- DECOMPILER ERROR at PC746: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_FishingHarpoonTitle = (UI.getChildControl)((self._ui).stc_FishingBG, "StaticText_Fishing_Harpoon_Title")
  ;
  ((self._ui).txt_FishingHarpoonTitle):SetText("· " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_FISHINGHARPOON"))
  -- DECOMPILER ERROR at PC765: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_FishingNormalValue = (UI.getChildControl)((self._ui).stc_FishingBG, "StaticText_Fishing_Normal_Value")
  -- DECOMPILER ERROR at PC773: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_FishingHarpoonValue = (UI.getChildControl)((self._ui).stc_FishingBG, "StaticText_Fishing_Harpoon_Value")
  -- DECOMPILER ERROR at PC781: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_FishingLine1 = (UI.getChildControl)((self._ui).stc_FishingBG, "Static_Fishing_Line1")
  -- DECOMPILER ERROR at PC789: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_FishingProgressBG = (UI.getChildControl)((self._ui).stc_FishingBG, "Static_Fishing_ProgressBg")
  -- DECOMPILER ERROR at PC797: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).progress2_Fishing = (UI.getChildControl)((self._ui).stc_FishingBG, "Progress2_Fishing")
  -- DECOMPILER ERROR at PC805: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_FishingProgress2_1_BarHead = (UI.getChildControl)((self._ui).progress2_Fishing, "Progress2_1_Bar_Head")
  -- DECOMPILER ERROR at PC813: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_FishingTitle = (UI.getChildControl)((self._ui).stc_FishingBG, "StaticText_Fishing_Title")
  -- DECOMPILER ERROR at PC821: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_FishingValue = (UI.getChildControl)((self._ui).stc_FishingBG, "StaticText_Fishing_Value")
  -- DECOMPILER ERROR at PC829: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_GrowthBG = (UI.getChildControl)((self._ui).stc_LifeBG, "Static_GrowthBG")
  -- DECOMPILER ERROR at PC837: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_Growth = (UI.getChildControl)((self._ui).stc_GrowthBG, "Static_Growth")
  -- DECOMPILER ERROR at PC845: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_GrowthMushroomTitle = (UI.getChildControl)((self._ui).stc_GrowthBG, "StaticText_Growth_Mushroom_Title")
  ;
  ((self._ui).txt_GrowthMushroomTitle):SetText("· " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_MUSHROOM"))
  -- DECOMPILER ERROR at PC864: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_GrowthVegetableTitle = (UI.getChildControl)((self._ui).stc_GrowthBG, "StaticText_Growth_Vegetable_Title")
  ;
  ((self._ui).txt_GrowthVegetableTitle):SetText("· " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_VEGETABLE"))
  -- DECOMPILER ERROR at PC883: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_GrowthFruitTitle = (UI.getChildControl)((self._ui).stc_GrowthBG, "StaticText_Growth_Fruit_Title")
  ;
  ((self._ui).txt_GrowthFruitTitle):SetText("· " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_FRUIT"))
  -- DECOMPILER ERROR at PC902: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_GrowthGrainTitle = (UI.getChildControl)((self._ui).stc_GrowthBG, "StaticText_Growth_Grain_Title")
  ;
  ((self._ui).txt_GrowthGrainTitle):SetText("· " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_GRAIN"))
  -- DECOMPILER ERROR at PC921: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_GrowthMushroomValue = (UI.getChildControl)((self._ui).stc_GrowthBG, "StaticText_Growth_Mushroom_Value")
  -- DECOMPILER ERROR at PC929: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_GrowthVegetableValue = (UI.getChildControl)((self._ui).stc_GrowthBG, "StaticText_Growth_Vegetable_Value")
  -- DECOMPILER ERROR at PC937: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_GrowthFruitValue = (UI.getChildControl)((self._ui).stc_GrowthBG, "StaticText_Growth_Fruit_Value")
  -- DECOMPILER ERROR at PC945: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_GrowthGrainValue = (UI.getChildControl)((self._ui).stc_GrowthBG, "StaticText_Growth_Grain_Value")
  -- DECOMPILER ERROR at PC953: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_GrowthLine1 = (UI.getChildControl)((self._ui).stc_GrowthBG, "Static_Growth_Line1")
  -- DECOMPILER ERROR at PC961: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_GrowthLine2 = (UI.getChildControl)((self._ui).stc_GrowthBG, "Static_Growth_Line2")
  -- DECOMPILER ERROR at PC969: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_GrowthLine3 = (UI.getChildControl)((self._ui).stc_GrowthBG, "Static_Growth_Line3")
  -- DECOMPILER ERROR at PC977: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_GrowthProgressBG = (UI.getChildControl)((self._ui).stc_GrowthBG, "Static_Growth_ProgressBg")
  -- DECOMPILER ERROR at PC985: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).progress2_Growth = (UI.getChildControl)((self._ui).stc_GrowthBG, "Progress2_Growth")
  -- DECOMPILER ERROR at PC993: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_GrowthProgress2_1_BarHead = (UI.getChildControl)((self._ui).progress2_Growth, "Progress2_1_Bar_Head")
  -- DECOMPILER ERROR at PC1001: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_GrowthTitle = (UI.getChildControl)((self._ui).stc_GrowthBG, "StaticText_Growth_Title")
  -- DECOMPILER ERROR at PC1009: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_GrowthValue = (UI.getChildControl)((self._ui).stc_GrowthBG, "StaticText_Growth_Value")
  -- DECOMPILER ERROR at PC1017: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_SailBG = (UI.getChildControl)((self._ui).stc_LifeBG, "Static_SailBG")
  -- DECOMPILER ERROR at PC1025: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_Sail = (UI.getChildControl)((self._ui).stc_SailBG, "Static_Sail")
  -- DECOMPILER ERROR at PC1033: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_SailProgressBG = (UI.getChildControl)((self._ui).stc_SailBG, "Static_Sail_ProgressBg")
  -- DECOMPILER ERROR at PC1041: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).progress2_Sail = (UI.getChildControl)((self._ui).stc_SailBG, "Progress2_Sail")
  -- DECOMPILER ERROR at PC1049: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_SailProgress2_1_BarHead = (UI.getChildControl)((self._ui).progress2_Sail, "Progress2_1_Bar_Head")
  -- DECOMPILER ERROR at PC1057: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_SailTitle = (UI.getChildControl)((self._ui).stc_SailBG, "StaticText_Sail_Title")
  -- DECOMPILER ERROR at PC1065: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_SailValue = (UI.getChildControl)((self._ui).stc_SailBG, "StaticText_Sail_Value")
  -- DECOMPILER ERROR at PC1073: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_CookingBG = (UI.getChildControl)((self._ui).stc_LifeBG, "Static_CookingBG")
  -- DECOMPILER ERROR at PC1081: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_Cooking = (UI.getChildControl)((self._ui).stc_CookingBG, "Static_Cooking")
  -- DECOMPILER ERROR at PC1089: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_CookingProgressBG = (UI.getChildControl)((self._ui).stc_CookingBG, "Static_Cooking_ProgressBg")
  -- DECOMPILER ERROR at PC1097: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).progress2_Cooking = (UI.getChildControl)((self._ui).stc_CookingBG, "Progress2_Cooking")
  -- DECOMPILER ERROR at PC1105: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_CookingProgress2_1_BarHead = (UI.getChildControl)((self._ui).progress2_Cooking, "Progress2_1_Bar_Head")
  -- DECOMPILER ERROR at PC1113: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_CookingTitle = (UI.getChildControl)((self._ui).stc_CookingBG, "StaticText_Cooking_Title")
  -- DECOMPILER ERROR at PC1121: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_CookingValue = (UI.getChildControl)((self._ui).stc_CookingBG, "StaticText_Cooking_Value")
  -- DECOMPILER ERROR at PC1129: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_HuntingBG = (UI.getChildControl)((self._ui).stc_LifeBG, "Static_HuntingBG")
  -- DECOMPILER ERROR at PC1137: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_Hunting = (UI.getChildControl)((self._ui).stc_HuntingBG, "Static_Hunting")
  -- DECOMPILER ERROR at PC1145: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_HuntingProgressBG = (UI.getChildControl)((self._ui).stc_HuntingBG, "Static_Hunting_ProgressBg")
  -- DECOMPILER ERROR at PC1153: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).progress2_Hunting = (UI.getChildControl)((self._ui).stc_HuntingBG, "Progress2_Hunting")
  -- DECOMPILER ERROR at PC1161: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_HuntingProgress2_1_BarHead = (UI.getChildControl)((self._ui).progress2_Hunting, "Progress2_1_Bar_Head")
  -- DECOMPILER ERROR at PC1169: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_HuntingTitle = (UI.getChildControl)((self._ui).stc_HuntingBG, "StaticText_Hunting_Title")
  -- DECOMPILER ERROR at PC1178: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_HuntingValue = (UI.getChildControl)((self._ui).stc_HuntingBG, "StaticText_Hunting_Value")
  -- DECOMPILER ERROR at PC1187: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_AlchemyBG = (UI.getChildControl)((self._ui).stc_LifeBG, "Static_AlchemyBG")
  -- DECOMPILER ERROR at PC1197: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_Alchemy = (UI.getChildControl)((self._ui).stc_AlchemyBG, "Static_Alchemy")
  -- DECOMPILER ERROR at PC1207: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_AlchemyProgressBG = (UI.getChildControl)((self._ui).stc_AlchemyBG, "Static_Alchemy_ProgressBg")
  -- DECOMPILER ERROR at PC1217: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).progress2_Alchemy = (UI.getChildControl)((self._ui).stc_AlchemyBG, "Progress2_Alchemy")
  -- DECOMPILER ERROR at PC1227: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_AlchemyProgress2_1_BarHead = (UI.getChildControl)((self._ui).progress2_Alchemy, "Progress2_1_Bar_Head")
  -- DECOMPILER ERROR at PC1237: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_AlchemyTitle = (UI.getChildControl)((self._ui).stc_AlchemyBG, "StaticText_Alchemy_Title")
  -- DECOMPILER ERROR at PC1247: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_AlchemyValue = (UI.getChildControl)((self._ui).stc_AlchemyBG, "StaticText_Alchemy_Value")
end

CharacterLifeInfo.updateData = function(self)
  -- function num : 0_1
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local playerGet = player:get()
  local gatherLevel = playerGet:getLifeExperienceLevel((self.craftType).gather)
  local gatherCurrentExp = playerGet:getCurrLifeExperiencePoint((self.craftType).gather)
  local gatherMaxExp = playerGet:getDemandLifeExperiencePoint((self.craftType).gather)
  local gatherExpRate = Int64toInt32(gatherCurrentExp * toInt64(0, 100) / gatherMaxExp)
  ;
  ((self._ui).progress2_Gather):SetProgressRate(gatherExpRate)
  ;
  ((self._ui).txt_GatherValue):SetText(PaGlobalFunc_CharacterLifeInfo_CraftLevel_Replace(gatherLevel, (self.craftType).gather) .. " " .. gatherExpRate .. "%")
  ;
  ((self._ui).txt_GatherFellingValue):SetText(playerGet:getLifeStat((self.detailCraftType).gather, (self.detailCraftType_gather).felling))
  ;
  ((self._ui).txt_GatherSapValue):SetText(playerGet:getLifeStat((self.detailCraftType).gather, (self.detailCraftType_gather).sap))
  ;
  ((self._ui).txt_GatherHommyValue):SetText(playerGet:getLifeStat((self.detailCraftType).gather, (self.detailCraftType_gather).hommy))
  ;
  ((self._ui).txt_GatherSlaughterValue):SetText(playerGet:getLifeStat((self.detailCraftType).gather, (self.detailCraftType_gather).slaughter))
  ;
  ((self._ui).txt_GatherTanningValue):SetText(playerGet:getLifeStat((self.detailCraftType).gather, (self.detailCraftType_gather).tanning))
  ;
  ((self._ui).txt_GatherMiningValue):SetText(playerGet:getLifeStat((self.detailCraftType).gather, (self.detailCraftType_gather).mining))
  local manufatureLevel = playerGet:getLifeExperienceLevel((self.craftType).manufacture)
  local manufatureCurrentExp = playerGet:getCurrLifeExperiencePoint((self.craftType).manufacture)
  local manufatureMaxExp = playerGet:getDemandLifeExperiencePoint((self.craftType).manufacture)
  local manufatureExpRate = Int64toInt32(manufatureCurrentExp * toInt64(0, 100) / manufatureMaxExp)
  ;
  ((self._ui).progress2_Manufacture):SetProgressRate(manufatureExpRate)
  ;
  ((self._ui).txt_ManufactureValue):SetText(PaGlobalFunc_CharacterLifeInfo_CraftLevel_Replace(manufatureLevel, (self.craftType).manufacture) .. " " .. manufatureExpRate .. "%")
  ;
  ((self._ui).txt_ManufShakingValue):SetText(playerGet:getLifeStat((self.detailCraftType).manufacture, (self.detailCraftType_manufacture).shaking))
  ;
  ((self._ui).txt_ManufGridingValue):SetText(playerGet:getLifeStat((self.detailCraftType).manufacture, (self.detailCraftType_manufacture).griding))
  ;
  ((self._ui).txt_ManufFirewoodValue):SetText(playerGet:getLifeStat((self.detailCraftType).manufacture, (self.detailCraftType_manufacture).firewood))
  ;
  ((self._ui).txt_ManufDryingValue):SetText(playerGet:getLifeStat((self.detailCraftType).manufacture, (self.detailCraftType_manufacture).drying))
  ;
  ((self._ui).txt_ManufThinOutValue):SetText(playerGet:getLifeStat((self.detailCraftType).manufacture, (self.detailCraftType_manufacture).thinout))
  ;
  ((self._ui).txt_ManufHeatingValue):SetText(playerGet:getLifeStat((self.detailCraftType).manufacture, (self.detailCraftType_manufacture).heating))
  ;
  ((self._ui).txt_ManufPackingValue):SetText("0")
  local trainingLevel = playerGet:getLifeExperienceLevel((self.craftType).training)
  local trainingCurrentExp = playerGet:getCurrLifeExperiencePoint((self.craftType).training)
  local trainingMaxExp = playerGet:getDemandLifeExperiencePoint((self.craftType).training)
  local trainingExpRate = Int64toInt32(trainingCurrentExp * toInt64(0, 100) / trainingMaxExp)
  ;
  ((self._ui).progress2_Training):SetProgressRate(trainingExpRate)
  ;
  ((self._ui).txt_TrainingValue):SetText(PaGlobalFunc_CharacterLifeInfo_CraftLevel_Replace(trainingLevel, (self.craftType).training) .. " " .. trainingExpRate .. "%")
  ;
  ((self._ui).txt_TrainingHorseValue):SetText("0")
  ;
  ((self._ui).txt_TrainingElephantValue):SetText("0")
  ;
  ((self._ui).txt_TrainingCamelValue):SetText("0")
  local fishingLevel = playerGet:getLifeExperienceLevel((self.craftType).fishing)
  local fishingCurrentExp = playerGet:getCurrLifeExperiencePoint((self.craftType).fishing)
  local fishingMaxExp = playerGet:getDemandLifeExperiencePoint((self.craftType).fishing)
  local fishingExpRate = Int64toInt32(fishingCurrentExp * toInt64(0, 100) / fishingMaxExp)
  ;
  ((self._ui).progress2_Fishing):SetProgressRate(fishingExpRate)
  ;
  ((self._ui).txt_FishingValue):SetText(PaGlobalFunc_CharacterLifeInfo_CraftLevel_Replace(fishingLevel, (self.craftType).fishing) .. " " .. fishingExpRate .. "%")
  ;
  ((self._ui).txt_FishingNormalValue):SetText(playerGet:getLifeStat((self.detailCraftType).fishing, (self.detailCraftType_fishing).normal))
  ;
  ((self._ui).txt_FishingHarpoonValue):SetText(playerGet:getLifeStat((self.detailCraftType).fishing, (self.detailCraftType_fishing).harpoon))
  local growthLevel = playerGet:getLifeExperienceLevel((self.craftType).growth)
  local growthCurrentExp = playerGet:getCurrLifeExperiencePoint((self.craftType).growth)
  local growthMaxExp = playerGet:getDemandLifeExperiencePoint((self.craftType).growth)
  local growthExpRate = Int64toInt32(growthCurrentExp * toInt64(0, 100) / growthMaxExp)
  ;
  ((self._ui).progress2_Growth):SetProgressRate(growthExpRate)
  ;
  ((self._ui).txt_GrowthValue):SetText(PaGlobalFunc_CharacterLifeInfo_CraftLevel_Replace(growthLevel, (self.craftType).growth) .. " " .. growthExpRate .. "%")
  ;
  ((self._ui).txt_GrowthMushroomValue):SetText(playerGet:getLifeStat((self.detailCraftType).growth, (self.detailCraftType_growth).mushroom))
  ;
  ((self._ui).txt_GrowthVegetableValue):SetText(playerGet:getLifeStat((self.detailCraftType).growth, (self.detailCraftType_growth).vegetable))
  ;
  ((self._ui).txt_GrowthFruitValue):SetText(playerGet:getLifeStat((self.detailCraftType).growth, (self.detailCraftType_growth).fruit))
  ;
  ((self._ui).txt_GrowthGrainValue):SetText(playerGet:getLifeStat((self.detailCraftType).growth, (self.detailCraftType_growth).grain))
  local sailLevel = playerGet:getLifeExperienceLevel((self.craftType).sail)
  local sailCurrentExp = playerGet:getCurrLifeExperiencePoint((self.craftType).sail)
  local sailMaxExp = playerGet:getDemandLifeExperiencePoint((self.craftType).sail)
  local sailExpRate = Int64toInt32(sailCurrentExp * toInt64(0, 100) / sailMaxExp)
  ;
  ((self._ui).progress2_Sail):SetProgressRate(sailExpRate)
  ;
  ((self._ui).txt_SailValue):SetText(PaGlobalFunc_CharacterLifeInfo_CraftLevel_Replace(sailLevel, (self.craftType).growth) .. " " .. sailExpRate .. "%")
  local cookingLevel = playerGet:getLifeExperienceLevel((self.craftType).cooking)
  local cookingCurrentExp = playerGet:getCurrLifeExperiencePoint((self.craftType).cooking)
  local cookingMaxExp = playerGet:getDemandLifeExperiencePoint((self.craftType).cooking)
  local cookingExpRate = Int64toInt32(cookingCurrentExp * toInt64(0, 100) / cookingMaxExp)
  ;
  ((self._ui).progress2_Cooking):SetProgressRate(cookingExpRate)
  ;
  ((self._ui).txt_CookingValue):SetText(PaGlobalFunc_CharacterLifeInfo_CraftLevel_Replace(cookingLevel, (self.craftType).cooking) .. " " .. cookingExpRate .. "%")
  local huntingLevel = playerGet:getLifeExperienceLevel((self.craftType).hunting)
  local huntingCurrentExp = playerGet:getCurrLifeExperiencePoint((self.craftType).hunting)
  local huntingMaxExp = playerGet:getDemandLifeExperiencePoint((self.craftType).hunting)
  local huntingExpRate = Int64toInt32(huntingCurrentExp * toInt64(0, 100) / huntingMaxExp)
  ;
  ((self._ui).progress2_Hunting):SetProgressRate(huntingExpRate)
  ;
  ((self._ui).txt_HuntingValue):SetText(PaGlobalFunc_CharacterLifeInfo_CraftLevel_Replace(huntingLevel, (self.craftType).hunting) .. " " .. huntingExpRate .. "%")
  local alchemyLevel = playerGet:getLifeExperienceLevel((self.craftType).alchemy)
  local alchemyCurrentExp = playerGet:getCurrLifeExperiencePoint((self.craftType).alchemy)
  local alchemyMaxExp = playerGet:getDemandLifeExperiencePoint((self.craftType).alchemy)
  local alchemyExpRate = Int64toInt32(alchemyCurrentExp * toInt64(0, 100) / alchemyMaxExp)
  ;
  ((self._ui).progress2_Alchemy):SetProgressRate(alchemyExpRate)
  ;
  ((self._ui).txt_AlchemyValue):SetText(PaGlobalFunc_CharacterLifeInfo_CraftLevel_Replace(alchemyLevel, (self.craftType).alchemy) .. " " .. alchemyExpRate .. "%")
end

CharacterLifeInfo.registEvnet = function(self)
  -- function num : 0_2
  registerEvent("FromClient_UpdateSelfPlayerLifeExp", "PaGlobalFunc_CharacterLifeInfo_Update")
end

PaGlobalFunc_CharacterLifeInfo_Update = function()
  -- function num : 0_3 , upvalues : CharacterLifeInfo
  if CharacterLifeInfo == nil then
    return 
  end
  self = CharacterLifeInfo
  self:updateData()
end

PaGlobalFunc_CharacterLifeInfo_CraftLevelColor_Replace = function(lev)
  -- function num : 0_4
  if lev >= 1 and lev <= 10 then
    levColor = (Defines.Color).C_FFC4C4C4
  else
    if lev >= 11 and lev <= 20 then
      levColor = (Defines.Color).C_FF76B24D
    else
      if lev >= 21 and lev <= 30 then
        levColor = (Defines.Color).C_FF3B8BBE
      else
        if lev >= 31 and lev <= 40 then
          levColor = (Defines.Color).C_FFEBC467
        else
          if lev >= 41 and lev <= 50 then
            levColor = (Defines.Color).C_FFD04D47
          else
            if lev >= 51 and lev <= 80 then
              levColor = (Defines.Color).C_FFB23BC7
            else
              if lev >= 81 and lev <= 100 then
                levColor = (Defines.Color).C_FFC78045
              end
            end
          end
        end
      end
    end
  end
  return levColor
end

PaGlobalFunc_CharacterLifeInfo_CraftLevel_Replace = function(lev, lifeType)
  -- function num : 0_5
  if lev >= 1 and lev <= 10 then
    lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_1") .. lev
  else
    if lev >= 11 and lev <= 20 then
      lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_2") .. lev - 10
    else
      if lev >= 21 and lev <= 30 then
        lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_3") .. lev - 20
      else
        if lev >= 31 and lev <= 40 then
          lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_4") .. lev - 30
        else
          if lev >= 41 and lev <= 50 then
            lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_5") .. lev - 40
          else
            if lev >= 51 and lev <= 80 then
              lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_6") .. lev - 50
            else
              if lev >= 81 and lev <= 100 then
                lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_7") .. lev - 80
              end
            end
          end
        end
      end
    end
  end
  return lev
end

FromClient_luaLoadComplete_Panel_Window_Character_LifeInfo = function()
  -- function num : 0_6 , upvalues : CharacterLifeInfo, _mainPanel, _panel
  local self = CharacterLifeInfo
  self:init()
  self.defaultFrameBG_CharacterInfo_LifeInfo = (UI.getChildControl)(_mainPanel, "Static_LifeInfoBg")
  ;
  (self.defaultFrameBG_CharacterInfo_LifeInfo):SetShow(false)
  ;
  (self.defaultFrameBG_CharacterInfo_LifeInfo):MoveChilds((self.defaultFrameBG_CharacterInfo_LifeInfo):GetID(), _panel)
  deletePanel(_panel:GetID())
  self:registEvnet()
  self:updateData()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_Panel_Window_Character_LifeInfo")

