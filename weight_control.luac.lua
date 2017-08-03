-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\enduarance\weight_control.luac 

-- params : ...
-- function num : 0
FGlobal_Inventory_WeightCheck = function()
  -- function num : 0_0
  if isFlushedUI() then
    return 
  end
  if Panel_Window_StableList:GetShow() or Panel_Window_WharfList:GetShow() or Panel_Window_Repair:GetShow() then
    return 
  end
  local self = PaGlobalPlayerWeightList
  local selfPlayerWrapper = getSelfPlayer()
  local selfPlayer = selfPlayerWrapper:get()
  local s64_allWeight = selfPlayer:getCurrentWeight_s64()
  local s64_maxWeight = selfPlayer:getPossessableWeight_s64()
  local allWeight = Int64toInt32(s64_allWeight) / 10000
  local maxWeight = Int64toInt32(s64_maxWeight) / 10000
  local playerWeightPercent = allWeight / maxWeight * 100
  local s64_moneyWeight = (selfPlayer:getInventory()):getMoneyWeight_s64()
  local s64_equipmentWeight = (selfPlayer:getEquipment()):getWeight_s64()
  local s64_allWeight = selfPlayer:getCurrentWeight_s64()
  local s64_maxWeight = selfPlayer:getPossessableWeight_s64()
  local moneyWeight = Int64toInt32(s64_moneyWeight) / 10000
  local equipmentWeight = Int64toInt32(s64_equipmentWeight) / 10000
  local allWeight = Int64toInt32(s64_allWeight) / 10000
  local maxWeight = Int64toInt32(s64_maxWeight) / 10000
  local invenWeight = allWeight - equipmentWeight - moneyWeight
  local sumtotalWeight = allWeight / maxWeight * 100
  local totalWeight = (string.format)("%.0f", sumtotalWeight)
  if sumtotalWeight >= 90 then
    if (self.repair_AutoNavi):GetShow() then
      (self.weight):SetPosY((self.panel):GetSizeY() + 50)
    else
      ;
      (self.weight):SetPosY(5)
    end
    if Panel_HorseEndurance:GetShow() or Panel_CarriageEndurance:GetShow() or Panel_ShipEndurance:GetShow() then
      (self.weight):SetPosY((self.panel):GetSizeY() + 35)
    end
    ;
    (self.panel):SetShow(true)
    ;
    (self.weight):SetShow(true)
    ;
    (self.weight):SetAlpha(0.8)
    ;
    (self.weight):SetText(totalWeight .. "%")
    PaGlobal_TutorialMenu:setShow(PaGlobal_TutorialMenu:checkShowCondition(), true)
    if sumtotalWeight >= 100 then
      (self.weight):SetFontColor((Defines.Color).C_FFF26A6A)
    else
      if sumtotalWeight <= 99 then
        (self.weight):SetFontColor((Defines.Color).C_FFC4BEBE)
      end
    end
  else
    ;
    (self.weight):SetShow(false)
    ;
    (self.weightText):SetShow(false)
    PaGlobal_TutorialMenu:setShow(PaGlobal_TutorialMenu:checkShowCondition(), true)
  end
  if sumtotalWeight >= 100 and isOnEffect == false then
    (self.weight):EraseAllEffect()
    ;
    (self.weight):AddEffect("fUI_Weight_01A", true, -0.5, -1.3)
    isOnEffect = true
  else
    if sumtotalWeight < 100 then
      (self.weight):EraseAllEffect()
      isOnEffect = false
    end
  end
end

registerEvent("FromClient_WeightPenaltyChanged", "FGlobal_Inventory_WeightCheck")

