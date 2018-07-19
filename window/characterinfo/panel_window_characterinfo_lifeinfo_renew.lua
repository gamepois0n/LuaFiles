local _panel = Panel_Window_Life_Renew
local _mainPanel = Panel_Window_CharacterInfo_Renew
local CharacterLifeInfo = {
  _ui = {
    stc_LifeBG = UI.getChildControl(_panel, "Static_LifeBG")
  },
  defaultFrameBG_CharacterInfo_LifeInfo = nil,
  craftType = {
    gather = 0,
    fishing = 1,
    hunting = 2,
    cooking = 3,
    alchemy = 4,
    manufacture = 5,
    training = 6,
    trade = 7,
    growth = 8,
    sail = 9,
    levelText = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_CRAFTLEVEL")
  },
  detailCraftType = {
    gather = 1,
    fishing = 2,
    manufacture = 6,
    growth = 9
  },
  detailCraftType_gather = {
    felling = 1,
    sap = 2,
    hommy = 3,
    slaughter = 4,
    tanning = 5,
    mining = 6
  },
  detailCraftType_fishing = {normal = 1, harpoon = 2},
  detailCraftType_manufacture = {
    shaking = 1,
    griding = 2,
    firewood = 3,
    drying = 4,
    thinout = 5,
    heating = 6
  },
  detailCraftType_growth = {
    mushroom = 1,
    vegetable = 2,
    fruit = 3,
    grain = 4
  }
}
function CharacterLifeInfo:init()
  self._ui.stc_GatherBG = UI.getChildControl(self._ui.stc_LifeBG, "Static_GatheringBG")
  self._ui.stc_Gather = UI.getChildControl(self._ui.stc_GatherBG, "Static_Gathering")
  self._ui.txt_GatherFellingTitle = UI.getChildControl(self._ui.stc_GatherBG, "StaticText_Gathering_Felling_Title")
  self._ui.txt_GatherFellingTitle:SetText("\194\183 " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_FELLING"))
  self._ui.txt_GatherSapTitle = UI.getChildControl(self._ui.stc_GatherBG, "StaticText_Gathering_Sap_Title")
  self._ui.txt_GatherSapTitle:SetText("\194\183 " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_SAP"))
  self._ui.txt_GatherHommyTitle = UI.getChildControl(self._ui.stc_GatherBG, "StaticText_Gathering_Hommy_Title")
  self._ui.txt_GatherHommyTitle:SetText("\194\183 " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_HOMMY"))
  self._ui.txt_GatherSlaughterTitle = UI.getChildControl(self._ui.stc_GatherBG, "StaticText_Gathering_Slaughter_Title")
  self._ui.txt_GatherSlaughterTitle:SetText("\194\183 " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_SLAUGHTER"))
  self._ui.txt_GatherTanningTitle = UI.getChildControl(self._ui.stc_GatherBG, "StaticText_Gathering_Tanning_Title")
  self._ui.txt_GatherTanningTitle:SetText("\194\183 " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_TANNING"))
  self._ui.txt_GatherMiningTitle = UI.getChildControl(self._ui.stc_GatherBG, "StaticText_Gathering_Mining_Title")
  self._ui.txt_GatherMiningTitle:SetText("\194\183 " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_MINING"))
  self._ui.txt_GatherFellingValue = UI.getChildControl(self._ui.stc_GatherBG, "StaticText_Gathering_Felling_Value")
  self._ui.txt_GatherSapValue = UI.getChildControl(self._ui.stc_GatherBG, "StaticText_Gathering_Sap_Value")
  self._ui.txt_GatherHommyValue = UI.getChildControl(self._ui.stc_GatherBG, "StaticText_Gathering_Hommy_Value")
  self._ui.txt_GatherSlaughterValue = UI.getChildControl(self._ui.stc_GatherBG, "StaticText_Gathering_Slaughter_Value")
  self._ui.txt_GatherTanningValue = UI.getChildControl(self._ui.stc_GatherBG, "StaticText_Gathering_Tanning_Value")
  self._ui.txt_GatherMiningValue = UI.getChildControl(self._ui.stc_GatherBG, "StaticText_Gathering_Mining_Value")
  self._ui.stc_GatherLine1 = UI.getChildControl(self._ui.stc_GatherBG, "Static_Gathering_Line1")
  self._ui.stc_GatherLine2 = UI.getChildControl(self._ui.stc_GatherBG, "Static_Gathering_Line2")
  self._ui.stc_GatherLine3 = UI.getChildControl(self._ui.stc_GatherBG, "Static_Gathering_Line3")
  self._ui.stc_GatherLine4 = UI.getChildControl(self._ui.stc_GatherBG, "Static_Gathering_Line4")
  self._ui.stc_GatherLine5 = UI.getChildControl(self._ui.stc_GatherBG, "Static_Gathering_Line5")
  self._ui.stc_GatherProgressBG = UI.getChildControl(self._ui.stc_GatherBG, "Static_Gathering_ProgressBg")
  self._ui.progress2_Gather = UI.getChildControl(self._ui.stc_GatherBG, "Progress2_Gathering")
  self._ui.stc_GatherProgress2BarHead = UI.getChildControl(self._ui.progress2_Gather, "Progress2_1_Bar_Head")
  self._ui.txt_GatherTitle = UI.getChildControl(self._ui.stc_GatherBG, "StaticText_Gathering_Title")
  self._ui.txt_GatherValue = UI.getChildControl(self._ui.stc_GatherBG, "StaticText_Gathering_Value")
  self._ui.stc_ManufactureBG = UI.getChildControl(self._ui.stc_LifeBG, "Static_ManufactureBG")
  self._ui.stc_Manufacture = UI.getChildControl(self._ui.stc_ManufactureBG, "Static_Manufacture")
  self._ui.txt_ManufShakingTitle = UI.getChildControl(self._ui.stc_ManufactureBG, "StaticText_Manufacture_Shaking_Title")
  self._ui.txt_ManufShakingTitle:SetText("\194\183 " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_SHAKING"))
  self._ui.txt_ManufGridingTitle = UI.getChildControl(self._ui.stc_ManufactureBG, "StaticText_Manufacture_Grinding_Title")
  self._ui.txt_ManufGridingTitle:SetText("\194\183 " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_GRIDING"))
  self._ui.txt_ManufFirewoodTitle = UI.getChildControl(self._ui.stc_ManufactureBG, "StaticText_Manufacture_Firewood_Title")
  self._ui.txt_ManufFirewoodTitle:SetText("\194\183 " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_FIREWOOD"))
  self._ui.txt_ManufDryingTitle = UI.getChildControl(self._ui.stc_ManufactureBG, "StaticText_Manufacture_Drying_Title")
  self._ui.txt_ManufDryingTitle:SetText("\194\183 " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_DRYING"))
  self._ui.txt_ManufThinOutTitle = UI.getChildControl(self._ui.stc_ManufactureBG, "StaticText_Manufacture_ThinOut_Title")
  self._ui.txt_ManufThinOutTitle:SetText("\194\183 " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_THINOUT"))
  self._ui.txt_ManufHeatingTitle = UI.getChildControl(self._ui.stc_ManufactureBG, "StaticText_Manufacture_Heating_Title")
  self._ui.txt_ManufHeatingTitle:SetText("\194\183 " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_HEATING"))
  self._ui.txt_ManufPackingTitle = UI.getChildControl(self._ui.stc_ManufactureBG, "StaticText_Manufacture_Packing_Title")
  self._ui.txt_ManufPackingTitle:SetText("\194\183 " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_PACKING"))
  self._ui.txt_ManufShakingValue = UI.getChildControl(self._ui.stc_ManufactureBG, "StaticText_Manufacture_Shaking_Value")
  self._ui.txt_ManufGridingValue = UI.getChildControl(self._ui.stc_ManufactureBG, "StaticText_Manufacture_Grinding_Value")
  self._ui.txt_ManufFirewoodValue = UI.getChildControl(self._ui.stc_ManufactureBG, "StaticText_Manufacture_Firewood_Value")
  self._ui.txt_ManufDryingValue = UI.getChildControl(self._ui.stc_ManufactureBG, "StaticText_Manufacture_Drying_Value")
  self._ui.txt_ManufThinOutValue = UI.getChildControl(self._ui.stc_ManufactureBG, "StaticText_Manufacture_ThinOut_Value")
  self._ui.txt_ManufHeatingValue = UI.getChildControl(self._ui.stc_ManufactureBG, "StaticText_Manufacture_Heating_Value")
  self._ui.txt_ManufPackingValue = UI.getChildControl(self._ui.stc_ManufactureBG, "StaticText_Manufacture_Packing_Value")
  self._ui.stc_ManufLine1 = UI.getChildControl(self._ui.stc_ManufactureBG, "Static_Manufacture_Line1")
  self._ui.stc_ManufLine2 = UI.getChildControl(self._ui.stc_ManufactureBG, "Static_Manufacture_Line2")
  self._ui.stc_ManufLine3 = UI.getChildControl(self._ui.stc_ManufactureBG, "Static_Manufacture_Line3")
  self._ui.stc_ManufLine4 = UI.getChildControl(self._ui.stc_ManufactureBG, "Static_Manufacture_Line4")
  self._ui.stc_ManufLine5 = UI.getChildControl(self._ui.stc_ManufactureBG, "Static_Manufacture_Line5")
  self._ui.stc_ManufLine6 = UI.getChildControl(self._ui.stc_ManufactureBG, "Static_Manufacture_Line6")
  self._ui.stc_ManufProgressBG = UI.getChildControl(self._ui.stc_ManufactureBG, "Static_Manufacture_ProgressBg")
  self._ui.progress2_Manufacture = UI.getChildControl(self._ui.stc_ManufactureBG, "Progress2_Manufacture")
  self._ui.stc_ManufProgress2_1_BarHead = UI.getChildControl(self._ui.progress2_Manufacture, "Progress2_1_Bar_Head")
  self._ui.txt_ManufactureTitle = UI.getChildControl(self._ui.stc_ManufactureBG, "StaticText_Manufacture_Title")
  self._ui.txt_ManufactureValue = UI.getChildControl(self._ui.stc_ManufactureBG, "StaticText_Manufacture_Value")
  self._ui.stc_TrainingBG = UI.getChildControl(self._ui.stc_LifeBG, "Static_TrainingBG")
  self._ui.stc_Training = UI.getChildControl(self._ui.stc_TrainingBG, "Static_Training")
  self._ui.txt_TrainingHorseTitle = UI.getChildControl(self._ui.stc_TrainingBG, "StaticText_Training_Horse_Title")
  self._ui.txt_TrainingHorseTitle:SetText("\194\183 " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_TRAININGHORSE"))
  self._ui.txt_TrainingElephantTitle = UI.getChildControl(self._ui.stc_TrainingBG, "StaticText_Training_Elephant_Title")
  self._ui.txt_TrainingElephantTitle:SetText("\194\183 " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_TRAININGELEPHANT"))
  self._ui.txt_TrainingCamelTitle = UI.getChildControl(self._ui.stc_TrainingBG, "StaticText_Training_Camel_Title")
  self._ui.txt_TrainingCamelTitle:SetText("\194\183 " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_TRAININGCAMEL"))
  self._ui.txt_TrainingHorseValue = UI.getChildControl(self._ui.stc_TrainingBG, "StaticText_Training_Horse_Value")
  self._ui.txt_TrainingElephantValue = UI.getChildControl(self._ui.stc_TrainingBG, "StaticText_Training_Elephant_Value")
  self._ui.txt_TrainingCamelValue = UI.getChildControl(self._ui.stc_TrainingBG, "StaticText_Training_Camel_Value")
  self._ui.stc_TrainingLine1 = UI.getChildControl(self._ui.stc_TrainingBG, "Static_Training_Line1")
  self._ui.stc_TrainingLine2 = UI.getChildControl(self._ui.stc_TrainingBG, "Static_Training_Line2")
  self._ui.stc_TrainingProgressBG = UI.getChildControl(self._ui.stc_TrainingBG, "Static_Training_ProgressBg")
  self._ui.progress2_Training = UI.getChildControl(self._ui.stc_TrainingBG, "Progress2_Training")
  self._ui.stc_TrainingProgress2_1_BarHead = UI.getChildControl(self._ui.progress2_Training, "Progress2_1_Bar_Head")
  self._ui.txt_TrainingTitle = UI.getChildControl(self._ui.stc_TrainingBG, "StaticText_Training_Title")
  self._ui.txt_TrainingValue = UI.getChildControl(self._ui.stc_TrainingBG, "StaticText_Training_Value")
  self._ui.stc_FishingBG = UI.getChildControl(self._ui.stc_LifeBG, "Static_FishingBG")
  self._ui.stc_Fishing = UI.getChildControl(self._ui.stc_FishingBG, "Static_Fishing")
  self._ui.txt_FishingNormalTitle = UI.getChildControl(self._ui.stc_FishingBG, "StaticText_Fishing_Normal_Title")
  self._ui.txt_FishingNormalTitle:SetText("\194\183 " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_FISHINGNORMAL"))
  self._ui.txt_FishingHarpoonTitle = UI.getChildControl(self._ui.stc_FishingBG, "StaticText_Fishing_Harpoon_Title")
  self._ui.txt_FishingHarpoonTitle:SetText("\194\183 " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_FISHINGHARPOON"))
  self._ui.txt_FishingNormalValue = UI.getChildControl(self._ui.stc_FishingBG, "StaticText_Fishing_Normal_Value")
  self._ui.txt_FishingHarpoonValue = UI.getChildControl(self._ui.stc_FishingBG, "StaticText_Fishing_Harpoon_Value")
  self._ui.stc_FishingLine1 = UI.getChildControl(self._ui.stc_FishingBG, "Static_Fishing_Line1")
  self._ui.stc_FishingProgressBG = UI.getChildControl(self._ui.stc_FishingBG, "Static_Fishing_ProgressBg")
  self._ui.progress2_Fishing = UI.getChildControl(self._ui.stc_FishingBG, "Progress2_Fishing")
  self._ui.stc_FishingProgress2_1_BarHead = UI.getChildControl(self._ui.progress2_Fishing, "Progress2_1_Bar_Head")
  self._ui.txt_FishingTitle = UI.getChildControl(self._ui.stc_FishingBG, "StaticText_Fishing_Title")
  self._ui.txt_FishingValue = UI.getChildControl(self._ui.stc_FishingBG, "StaticText_Fishing_Value")
  self._ui.stc_GrowthBG = UI.getChildControl(self._ui.stc_LifeBG, "Static_GrowthBG")
  self._ui.stc_Growth = UI.getChildControl(self._ui.stc_GrowthBG, "Static_Growth")
  self._ui.txt_GrowthMushroomTitle = UI.getChildControl(self._ui.stc_GrowthBG, "StaticText_Growth_Mushroom_Title")
  self._ui.txt_GrowthMushroomTitle:SetText("\194\183 " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_MUSHROOM"))
  self._ui.txt_GrowthVegetableTitle = UI.getChildControl(self._ui.stc_GrowthBG, "StaticText_Growth_Vegetable_Title")
  self._ui.txt_GrowthVegetableTitle:SetText("\194\183 " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_VEGETABLE"))
  self._ui.txt_GrowthFruitTitle = UI.getChildControl(self._ui.stc_GrowthBG, "StaticText_Growth_Fruit_Title")
  self._ui.txt_GrowthFruitTitle:SetText("\194\183 " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_FRUIT"))
  self._ui.txt_GrowthGrainTitle = UI.getChildControl(self._ui.stc_GrowthBG, "StaticText_Growth_Grain_Title")
  self._ui.txt_GrowthGrainTitle:SetText("\194\183 " .. PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_LIFEINFO_CRAFTTYPE_GRAIN"))
  self._ui.txt_GrowthMushroomValue = UI.getChildControl(self._ui.stc_GrowthBG, "StaticText_Growth_Mushroom_Value")
  self._ui.txt_GrowthVegetableValue = UI.getChildControl(self._ui.stc_GrowthBG, "StaticText_Growth_Vegetable_Value")
  self._ui.txt_GrowthFruitValue = UI.getChildControl(self._ui.stc_GrowthBG, "StaticText_Growth_Fruit_Value")
  self._ui.txt_GrowthGrainValue = UI.getChildControl(self._ui.stc_GrowthBG, "StaticText_Growth_Grain_Value")
  self._ui.stc_GrowthLine1 = UI.getChildControl(self._ui.stc_GrowthBG, "Static_Growth_Line1")
  self._ui.stc_GrowthLine2 = UI.getChildControl(self._ui.stc_GrowthBG, "Static_Growth_Line2")
  self._ui.stc_GrowthLine3 = UI.getChildControl(self._ui.stc_GrowthBG, "Static_Growth_Line3")
  self._ui.stc_GrowthProgressBG = UI.getChildControl(self._ui.stc_GrowthBG, "Static_Growth_ProgressBg")
  self._ui.progress2_Growth = UI.getChildControl(self._ui.stc_GrowthBG, "Progress2_Growth")
  self._ui.stc_GrowthProgress2_1_BarHead = UI.getChildControl(self._ui.progress2_Growth, "Progress2_1_Bar_Head")
  self._ui.txt_GrowthTitle = UI.getChildControl(self._ui.stc_GrowthBG, "StaticText_Growth_Title")
  self._ui.txt_GrowthValue = UI.getChildControl(self._ui.stc_GrowthBG, "StaticText_Growth_Value")
  self._ui.stc_SailBG = UI.getChildControl(self._ui.stc_LifeBG, "Static_SailBG")
  self._ui.stc_Sail = UI.getChildControl(self._ui.stc_SailBG, "Static_Sail")
  self._ui.stc_SailProgressBG = UI.getChildControl(self._ui.stc_SailBG, "Static_Sail_ProgressBg")
  self._ui.progress2_Sail = UI.getChildControl(self._ui.stc_SailBG, "Progress2_Sail")
  self._ui.stc_SailProgress2_1_BarHead = UI.getChildControl(self._ui.progress2_Sail, "Progress2_1_Bar_Head")
  self._ui.txt_SailTitle = UI.getChildControl(self._ui.stc_SailBG, "StaticText_Sail_Title")
  self._ui.txt_SailValue = UI.getChildControl(self._ui.stc_SailBG, "StaticText_Sail_Value")
  self._ui.stc_CookingBG = UI.getChildControl(self._ui.stc_LifeBG, "Static_CookingBG")
  self._ui.stc_Cooking = UI.getChildControl(self._ui.stc_CookingBG, "Static_Cooking")
  self._ui.stc_CookingProgressBG = UI.getChildControl(self._ui.stc_CookingBG, "Static_Cooking_ProgressBg")
  self._ui.progress2_Cooking = UI.getChildControl(self._ui.stc_CookingBG, "Progress2_Cooking")
  self._ui.stc_CookingProgress2_1_BarHead = UI.getChildControl(self._ui.progress2_Cooking, "Progress2_1_Bar_Head")
  self._ui.txt_CookingTitle = UI.getChildControl(self._ui.stc_CookingBG, "StaticText_Cooking_Title")
  self._ui.txt_CookingValue = UI.getChildControl(self._ui.stc_CookingBG, "StaticText_Cooking_Value")
  self._ui.stc_HuntingBG = UI.getChildControl(self._ui.stc_LifeBG, "Static_HuntingBG")
  self._ui.stc_Hunting = UI.getChildControl(self._ui.stc_HuntingBG, "Static_Hunting")
  self._ui.stc_HuntingProgressBG = UI.getChildControl(self._ui.stc_HuntingBG, "Static_Hunting_ProgressBg")
  self._ui.progress2_Hunting = UI.getChildControl(self._ui.stc_HuntingBG, "Progress2_Hunting")
  self._ui.stc_HuntingProgress2_1_BarHead = UI.getChildControl(self._ui.progress2_Hunting, "Progress2_1_Bar_Head")
  self._ui.txt_HuntingTitle = UI.getChildControl(self._ui.stc_HuntingBG, "StaticText_Hunting_Title")
  self._ui.txt_HuntingValue = UI.getChildControl(self._ui.stc_HuntingBG, "StaticText_Hunting_Value")
  self._ui.stc_AlchemyBG = UI.getChildControl(self._ui.stc_LifeBG, "Static_AlchemyBG")
  self._ui.stc_Alchemy = UI.getChildControl(self._ui.stc_AlchemyBG, "Static_Alchemy")
  self._ui.stc_AlchemyProgressBG = UI.getChildControl(self._ui.stc_AlchemyBG, "Static_Alchemy_ProgressBg")
  self._ui.progress2_Alchemy = UI.getChildControl(self._ui.stc_AlchemyBG, "Progress2_Alchemy")
  self._ui.stc_AlchemyProgress2_1_BarHead = UI.getChildControl(self._ui.progress2_Alchemy, "Progress2_1_Bar_Head")
  self._ui.txt_AlchemyTitle = UI.getChildControl(self._ui.stc_AlchemyBG, "StaticText_Alchemy_Title")
  self._ui.txt_AlchemyValue = UI.getChildControl(self._ui.stc_AlchemyBG, "StaticText_Alchemy_Value")
end
function CharacterLifeInfo:updateData()
  local player = getSelfPlayer()
  if nil == player then
    return
  end
  local playerGet = player:get()
  local gatherLevel = playerGet:getLifeExperienceLevel(self.craftType.gather)
  local gatherCurrentExp = playerGet:getCurrLifeExperiencePoint(self.craftType.gather)
  local gatherMaxExp = playerGet:getDemandLifeExperiencePoint(self.craftType.gather)
  local gatherExpRate = Int64toInt32(gatherCurrentExp * toInt64(0, 100) / gatherMaxExp)
  self._ui.progress2_Gather:SetProgressRate(gatherExpRate)
  self._ui.txt_GatherValue:SetText(PaGlobalFunc_CharacterLifeInfo_CraftLevel_Replace(gatherLevel, self.craftType.gather) .. " " .. gatherExpRate .. "%")
  self._ui.txt_GatherFellingValue:SetText(playerGet:getLifeStat(self.detailCraftType.gather, self.detailCraftType_gather.felling))
  self._ui.txt_GatherSapValue:SetText(playerGet:getLifeStat(self.detailCraftType.gather, self.detailCraftType_gather.sap))
  self._ui.txt_GatherHommyValue:SetText(playerGet:getLifeStat(self.detailCraftType.gather, self.detailCraftType_gather.hommy))
  self._ui.txt_GatherSlaughterValue:SetText(playerGet:getLifeStat(self.detailCraftType.gather, self.detailCraftType_gather.slaughter))
  self._ui.txt_GatherTanningValue:SetText(playerGet:getLifeStat(self.detailCraftType.gather, self.detailCraftType_gather.tanning))
  self._ui.txt_GatherMiningValue:SetText(playerGet:getLifeStat(self.detailCraftType.gather, self.detailCraftType_gather.mining))
  local manufatureLevel = playerGet:getLifeExperienceLevel(self.craftType.manufacture)
  local manufatureCurrentExp = playerGet:getCurrLifeExperiencePoint(self.craftType.manufacture)
  local manufatureMaxExp = playerGet:getDemandLifeExperiencePoint(self.craftType.manufacture)
  local manufatureExpRate = Int64toInt32(manufatureCurrentExp * toInt64(0, 100) / manufatureMaxExp)
  self._ui.progress2_Manufacture:SetProgressRate(manufatureExpRate)
  self._ui.txt_ManufactureValue:SetText(PaGlobalFunc_CharacterLifeInfo_CraftLevel_Replace(manufatureLevel, self.craftType.manufacture) .. " " .. manufatureExpRate .. "%")
  self._ui.txt_ManufShakingValue:SetText(playerGet:getLifeStat(self.detailCraftType.manufacture, self.detailCraftType_manufacture.shaking))
  self._ui.txt_ManufGridingValue:SetText(playerGet:getLifeStat(self.detailCraftType.manufacture, self.detailCraftType_manufacture.griding))
  self._ui.txt_ManufFirewoodValue:SetText(playerGet:getLifeStat(self.detailCraftType.manufacture, self.detailCraftType_manufacture.firewood))
  self._ui.txt_ManufDryingValue:SetText(playerGet:getLifeStat(self.detailCraftType.manufacture, self.detailCraftType_manufacture.drying))
  self._ui.txt_ManufThinOutValue:SetText(playerGet:getLifeStat(self.detailCraftType.manufacture, self.detailCraftType_manufacture.thinout))
  self._ui.txt_ManufHeatingValue:SetText(playerGet:getLifeStat(self.detailCraftType.manufacture, self.detailCraftType_manufacture.heating))
  self._ui.txt_ManufPackingValue:SetText("0")
  local trainingLevel = playerGet:getLifeExperienceLevel(self.craftType.training)
  local trainingCurrentExp = playerGet:getCurrLifeExperiencePoint(self.craftType.training)
  local trainingMaxExp = playerGet:getDemandLifeExperiencePoint(self.craftType.training)
  local trainingExpRate = Int64toInt32(trainingCurrentExp * toInt64(0, 100) / trainingMaxExp)
  self._ui.progress2_Training:SetProgressRate(trainingExpRate)
  self._ui.txt_TrainingValue:SetText(PaGlobalFunc_CharacterLifeInfo_CraftLevel_Replace(trainingLevel, self.craftType.training) .. " " .. trainingExpRate .. "%")
  self._ui.txt_TrainingHorseValue:SetText("0")
  self._ui.txt_TrainingElephantValue:SetText("0")
  self._ui.txt_TrainingCamelValue:SetText("0")
  local fishingLevel = playerGet:getLifeExperienceLevel(self.craftType.fishing)
  local fishingCurrentExp = playerGet:getCurrLifeExperiencePoint(self.craftType.fishing)
  local fishingMaxExp = playerGet:getDemandLifeExperiencePoint(self.craftType.fishing)
  local fishingExpRate = Int64toInt32(fishingCurrentExp * toInt64(0, 100) / fishingMaxExp)
  self._ui.progress2_Fishing:SetProgressRate(fishingExpRate)
  self._ui.txt_FishingValue:SetText(PaGlobalFunc_CharacterLifeInfo_CraftLevel_Replace(fishingLevel, self.craftType.fishing) .. " " .. fishingExpRate .. "%")
  self._ui.txt_FishingNormalValue:SetText(playerGet:getLifeStat(self.detailCraftType.fishing, self.detailCraftType_fishing.normal))
  self._ui.txt_FishingHarpoonValue:SetText(playerGet:getLifeStat(self.detailCraftType.fishing, self.detailCraftType_fishing.harpoon))
  local growthLevel = playerGet:getLifeExperienceLevel(self.craftType.growth)
  local growthCurrentExp = playerGet:getCurrLifeExperiencePoint(self.craftType.growth)
  local growthMaxExp = playerGet:getDemandLifeExperiencePoint(self.craftType.growth)
  local growthExpRate = Int64toInt32(growthCurrentExp * toInt64(0, 100) / growthMaxExp)
  self._ui.progress2_Growth:SetProgressRate(growthExpRate)
  self._ui.txt_GrowthValue:SetText(PaGlobalFunc_CharacterLifeInfo_CraftLevel_Replace(growthLevel, self.craftType.growth) .. " " .. growthExpRate .. "%")
  self._ui.txt_GrowthMushroomValue:SetText(playerGet:getLifeStat(self.detailCraftType.growth, self.detailCraftType_growth.mushroom))
  self._ui.txt_GrowthVegetableValue:SetText(playerGet:getLifeStat(self.detailCraftType.growth, self.detailCraftType_growth.vegetable))
  self._ui.txt_GrowthFruitValue:SetText(playerGet:getLifeStat(self.detailCraftType.growth, self.detailCraftType_growth.fruit))
  self._ui.txt_GrowthGrainValue:SetText(playerGet:getLifeStat(self.detailCraftType.growth, self.detailCraftType_growth.grain))
  local sailLevel = playerGet:getLifeExperienceLevel(self.craftType.sail)
  local sailCurrentExp = playerGet:getCurrLifeExperiencePoint(self.craftType.sail)
  local sailMaxExp = playerGet:getDemandLifeExperiencePoint(self.craftType.sail)
  local sailExpRate = Int64toInt32(sailCurrentExp * toInt64(0, 100) / sailMaxExp)
  self._ui.progress2_Sail:SetProgressRate(sailExpRate)
  self._ui.txt_SailValue:SetText(PaGlobalFunc_CharacterLifeInfo_CraftLevel_Replace(sailLevel, self.craftType.growth) .. " " .. sailExpRate .. "%")
  local cookingLevel = playerGet:getLifeExperienceLevel(self.craftType.cooking)
  local cookingCurrentExp = playerGet:getCurrLifeExperiencePoint(self.craftType.cooking)
  local cookingMaxExp = playerGet:getDemandLifeExperiencePoint(self.craftType.cooking)
  local cookingExpRate = Int64toInt32(cookingCurrentExp * toInt64(0, 100) / cookingMaxExp)
  self._ui.progress2_Cooking:SetProgressRate(cookingExpRate)
  self._ui.txt_CookingValue:SetText(PaGlobalFunc_CharacterLifeInfo_CraftLevel_Replace(cookingLevel, self.craftType.cooking) .. " " .. cookingExpRate .. "%")
  local huntingLevel = playerGet:getLifeExperienceLevel(self.craftType.hunting)
  local huntingCurrentExp = playerGet:getCurrLifeExperiencePoint(self.craftType.hunting)
  local huntingMaxExp = playerGet:getDemandLifeExperiencePoint(self.craftType.hunting)
  local huntingExpRate = Int64toInt32(huntingCurrentExp * toInt64(0, 100) / huntingMaxExp)
  self._ui.progress2_Hunting:SetProgressRate(huntingExpRate)
  self._ui.txt_HuntingValue:SetText(PaGlobalFunc_CharacterLifeInfo_CraftLevel_Replace(huntingLevel, self.craftType.hunting) .. " " .. huntingExpRate .. "%")
  local alchemyLevel = playerGet:getLifeExperienceLevel(self.craftType.alchemy)
  local alchemyCurrentExp = playerGet:getCurrLifeExperiencePoint(self.craftType.alchemy)
  local alchemyMaxExp = playerGet:getDemandLifeExperiencePoint(self.craftType.alchemy)
  local alchemyExpRate = Int64toInt32(alchemyCurrentExp * toInt64(0, 100) / alchemyMaxExp)
  self._ui.progress2_Alchemy:SetProgressRate(alchemyExpRate)
  self._ui.txt_AlchemyValue:SetText(PaGlobalFunc_CharacterLifeInfo_CraftLevel_Replace(alchemyLevel, self.craftType.alchemy) .. " " .. alchemyExpRate .. "%")
end
function CharacterLifeInfo:registEvnet()
  registerEvent("FromClient_UpdateSelfPlayerLifeExp", "PaGlobalFunc_CharacterLifeInfo_Update")
end
function PaGlobalFunc_CharacterLifeInfo_Update()
  if nil == CharacterLifeInfo then
    return
  end
  self = CharacterLifeInfo
  self:updateData()
end
function PaGlobalFunc_CharacterLifeInfo_CraftLevelColor_Replace(lev)
  if lev >= 1 and lev <= 10 then
    levColor = Defines.Color.C_FFC4C4C4
  elseif lev >= 11 and lev <= 20 then
    levColor = Defines.Color.C_FF76B24D
  elseif lev >= 21 and lev <= 30 then
    levColor = Defines.Color.C_FF3B8BBE
  elseif lev >= 31 and lev <= 40 then
    levColor = Defines.Color.C_FFEBC467
  elseif lev >= 41 and lev <= 50 then
    levColor = Defines.Color.C_FFD04D47
  elseif lev >= 51 and lev <= 80 then
    levColor = Defines.Color.C_FFB23BC7
  elseif lev >= 81 and lev <= 100 then
    levColor = Defines.Color.C_FFC78045
  end
  return levColor
end
function PaGlobalFunc_CharacterLifeInfo_CraftLevel_Replace(lev, lifeType)
  if lev >= 1 and lev <= 10 then
    lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_1") .. lev
  elseif lev >= 11 and lev <= 20 then
    lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_2") .. lev - 10
  elseif lev >= 21 and lev <= 30 then
    lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_3") .. lev - 20
  elseif lev >= 31 and lev <= 40 then
    lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_4") .. lev - 30
  elseif lev >= 41 and lev <= 50 then
    lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_5") .. lev - 40
  elseif lev >= 51 and lev <= 80 then
    lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_6") .. lev - 50
  elseif lev >= 81 and lev <= 100 then
    lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_7") .. lev - 80
  end
  return lev
end
function FromClient_luaLoadComplete_Panel_Window_Character_LifeInfo()
  local self = CharacterLifeInfo
  self:init()
  self.defaultFrameBG_CharacterInfo_LifeInfo = UI.getChildControl(_mainPanel, "Static_LifeInfoBg")
  self.defaultFrameBG_CharacterInfo_LifeInfo:SetShow(false)
  self.defaultFrameBG_CharacterInfo_LifeInfo:MoveChilds(self.defaultFrameBG_CharacterInfo_LifeInfo:GetID(), _panel)
  deletePanel(_panel:GetID())
  self:registEvnet()
  self:updateData()
end
