PaGlobal_SniperGame_Result = {
  _ui = {
    _panel = Panel_SniperGame_Result,
    _resultBg = UI.getChildControl(Panel_SniperGame_Result, "Static_Result_Bg"),
    _deviationMark = UI.getChildControl(Panel_SniperGame_Result, "Static_DeviationMark"),
    _impactPoint = nil,
    _resultMessage = UI.getChildControl(Panel_SniperGame_Result, "StaticText_ResultMessage")
  }
}
function PaGlobal_SniperGame_Result:Open()
  Panel_SniperGame_Result:SetShow(true)
end
function PaGlobal_SniperGame_Result:Close()
  Panel_SniperGame_Result:SetShow(false)
end
function PaGlobal_SniperGame_Result:OnScreenResize(screenSizeX, screenSizeY)
end
function PaGlobal_SniperGame_Result:ClearResult()
  local ui = self._ui
  ui._impactPoint:SetShow(false)
  self:UpdateResultText(3, nil)
end
function PaGlobal_SniperGame_Result:UpdateResultText(resultType, hitPartType)
  local ui = self._ui
  local textPosX = ui._deviationMark:GetPosX() + posX
  local textPosY = ui._deviationMark:GetPosY() + posY
  local resultMessage = ""
  local fontColor = Defines.Color.C_FF797979
  if 1 == resultType then
    if 1 == hitPartType then
      resultMessage = "Critical Shot!"
      fontColor = Defines.Color.C_FFE50D0D
    elseif 2 == hitPartType then
      resultMessage = "Hit!"
    elseif 3 == hitPartType then
      resultMessage = "Hit!"
    else
      resultMessage = "Miss"
    end
  elseif 2 == resultType then
    resultMessage = "Miss"
  else
    resultMessage = "???"
  end
  ui._resultMessage:SetText(resultMessage)
  ui._resultMessage:SetFontColor(fontColor)
  ui._resultMessage:ComputePos()
  ui._resultMessage:SetPosY(ui._resultBg:GetPosY() - ui._resultMessage:GetSizeY() - 10)
end
function PaGlobal_SniperGame_Result:UpdateBulletPos(isMissed, deviationDiameter, desiredScreenPos, hittedScreenPos)
  local ui = self._ui
  local deviationMarkX = ui._resultBg:GetPosX() + (ui._resultBg:GetSizeX() - deviationDiameter) / 2
  local deviationMarkY = ui._resultBg:GetPosY() + (ui._resultBg:GetSizeY() - deviationDiameter) / 2
  ui._deviationMark:SetSize(deviationDiameter, deviationDiameter)
  ui._deviationMark:SetPosXY(deviationMarkX, deviationMarkY)
  local errX = hittedScreenPos.x - desiredScreenPos.x
  local errY = hittedScreenPos.y - desiredScreenPos.y
  local errLength = math.sqrt(errX * errX + errY * errY)
  local aimPaperRadius = ui._resultBg:GetSizeX() / 2
  if errLength >= aimPaperRadius - 10 and true == isMissed then
    return false
  end
  local posX = (deviationDiameter - ui._impactPoint:GetSizeX()) / 2 + errX
  local posY = (deviationDiameter - ui._impactPoint:GetSizeY()) / 2 + errY
  ui._impactPoint:SetPosXY(posX, posY)
  ui._impactPoint:SetShow(true)
  return true
end
function PaGlobal_SniperGame_Result:UpdateMissResult(deviationDiameter, desiredScreenPos, hittedScreenPos)
  local isBulletPosSet = self:UpdateBulletPos(true, deviationDiameter, desiredScreenPos, hittedScreenPos)
  if true == isBulletPosSet then
    self:UpdateResultText(2, nil)
  else
    self:UpdateResultText(3, nil)
  end
end
function PaGlobal_SniperGame_Result:UpdateShootResult(deviationDiameter, desiredScreenPos, hittedScreenPos, hitPartType)
  self:UpdateBulletPos(false, deviationDiameter, desiredScreenPos, hittedScreenPos)
  self:UpdateResultText(1, hitPartType)
end
function PaGlobal_SniperGame_Result:Initialize()
  local ui = self._ui
  ui._impactPoint = UI.getChildControl(ui._deviationMark, "Static_ImpactPoint")
end
function MyTestFunc123(isShow)
  Panel_SniperGame_Result:SetShow(isShow)
end
