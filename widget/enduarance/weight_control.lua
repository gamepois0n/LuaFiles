function FGlobal_Inventory_WeightCheck()
  if isFlushedUI() then
    return
  end
  if Panel_Window_StableList:GetShow() or Panel_Window_WharfList:GetShow() or Panel_Window_Repair:GetShow() then
    return
  end
  local self = PaGlobalPlayerWeightList
  local selfPlayerWrapper = getSelfPlayer()
  if nil == selfPlayerWrapper then
    return
  end
  self.weightText:SetPosX(self.weight:GetPosX() - self.weightText:GetTextSizeX() - 25)
  self.weightText:SetPosY(self.weight:GetPosY() - 4)
  local selfPlayer = selfPlayerWrapper:get()
  local s64_allWeight = selfPlayer:getCurrentWeight_s64()
  local s64_maxWeight = selfPlayer:getPossessableWeight_s64()
  local allWeight = Int64toInt32(s64_allWeight) / 10000
  local maxWeight = Int64toInt32(s64_maxWeight) / 10000
  local playerWeightPercent = allWeight / maxWeight * 100
  local s64_moneyWeight = selfPlayer:getInventory():getMoneyWeight_s64()
  local s64_equipmentWeight = selfPlayer:getEquipment():getWeight_s64()
  local s64_allWeight = selfPlayer:getCurrentWeight_s64()
  local s64_maxWeight = selfPlayer:getPossessableWeight_s64()
  local moneyWeight = Int64toInt32(s64_moneyWeight) / 10000
  local equipmentWeight = Int64toInt32(s64_equipmentWeight) / 10000
  local allWeight = Int64toInt32(s64_allWeight) / 10000
  local maxWeight = Int64toInt32(s64_maxWeight) / 10000
  local invenWeight = allWeight - equipmentWeight - moneyWeight
  local sumtotalWeight = allWeight / maxWeight * 100
  local totalWeight = string.format("%.0f", sumtotalWeight)
  if sumtotalWeight >= 90 then
    if self.repair_AutoNavi:GetShow() then
      self.weight:SetPosY(self.panel:GetSizeY() + 50)
    else
      self.weight:SetPosY(5)
    end
    if Panel_HorseEndurance:GetShow() or Panel_CarriageEndurance:GetShow() or Panel_ShipEndurance:GetShow() then
      self.weight:SetPosY(self.panel:GetSizeY() + 35)
    end
    if true == _ContentsGroup_RenewUI_Main then
      self.weight:SetPosY(self.panel:GetSizeY() + 50)
    end
    self.panel:SetShow(true)
    self.weight:SetShow(true)
    self.weightText:SetShow(true)
    self.weightText:SetPosX(self.weight:GetPosX() - self.weightText:GetTextSizeX() - 25)
    self.weightText:SetPosY(self.weight:GetPosY() - 4)
    self.weight:SetAlpha(0.8)
    self.weight:SetText(totalWeight .. "%")
    local tutorialMenuShow = PaGlobal_TutorialMenu:checkShowCondition()
    PaGlobal_TutorialMenu:setShow(tutorialMenuShow, tutorialMenuShow)
    if sumtotalWeight >= 100 then
      self.weight:SetFontColor(Defines.Color.C_FFF26A6A)
    elseif sumtotalWeight <= 99 then
      self.weight:SetFontColor(Defines.Color.C_FFC4BEBE)
    end
  else
    self.weight:SetShow(false)
    self.weightText:SetShow(false)
    local tutorialMenuShow = PaGlobal_TutorialMenu:checkShowCondition()
    PaGlobal_TutorialMenu:setShow(tutorialMenuShow, tutorialMenuShow)
  end
  if sumtotalWeight >= 100 and false == isOnEffect then
    self.weight:EraseAllEffect()
    self.weight:AddEffect("fUI_Weight_01A", true, -0.5, -1.3)
    isOnEffect = true
  elseif sumtotalWeight < 100 then
    self.weight:EraseAllEffect()
    isOnEffect = false
  end
end
registerEvent("FromClient_WeightPenaltyChanged", "FGlobal_Inventory_WeightCheck")
