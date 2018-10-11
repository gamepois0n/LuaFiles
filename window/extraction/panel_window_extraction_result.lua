local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
PaGlobal_ExtractionResult = {
  _uiResultMsgBG = UI.getChildControl(Panel_Window_Extraction_Result, "Static_Finish")
}
function PaGlobal_ExtractionResult:initialize()
  self._uiSlotBG = UI.getChildControl(self._uiResultMsgBG, "Static_ItemSlot")
  self._uiSubText = UI.getChildControl(self._uiResultMsgBG, "StaticText_Upper")
  self._uiMainText = UI.getChildControl(self._uiResultMsgBG, "StaticText_Lower")
  local slotConfig = {createBorder = true, createEnchant = true}
  if nil == self._uiSlot then
    self._uiSlot = {}
    SlotItem.new(self._uiSlot, "SlotItem", 0, self._uiSlotBG, slotConfig)
    self._uiSlot:createChild()
    self._uiSlot:clearItem()
  end
  self:resetPanel()
  self:resetChildControl()
  self:resetAnimation()
end
function PaGlobal_ExtractionResult:resetPanel()
  Panel_Window_Extraction_Result:SetSize(getScreenSizeX(), getScreenSizeY())
  Panel_Window_Extraction_Result:SetPosX(0)
  Panel_Window_Extraction_Result:SetPosY(0)
  Panel_Window_Extraction_Result:SetColor(UI_color.C_FFFFFFFF)
  Panel_Window_Extraction_Result:SetIgnore(true)
  Panel_Window_Extraction_Result:SetShow(false)
end
function PaGlobal_ExtractionResult:resetChildControl()
  self._uiResultMsgBG:SetSize(getScreenSizeX(), 150)
  self._uiResultMsgBG:ComputePos()
  self._uiSlotBG:ComputePos()
  self._uiSubText:ComputePos()
  self._uiMainText:ComputePos()
end
function PaGlobal_ExtractionResult:resetAnimation()
  self._uiResultMsgBG:ResetVertexAni()
  Panel_Window_Extraction_Result:ResetVertexAni()
  Panel_Window_Extraction_Result:SetAlphaExtraChild(1)
end
function PaGlobal_ExtractionResult:getShow()
  return Panel_Window_Extraction_Result:GetShow()
end
function PaGlobal_ExtractionResult:showResultMessage(mainText, subText, itemSSW)
  if nil == mainText or "string" ~= type(mainText) then
    return
  end
  if nil == subText then
    self._uiResultMsgBG:SetSize(getScreenSizeX(), 110)
    self._uiSlotBG:SetShow(false)
    self._uiSubText:SetShow(false)
    self._uiMainText:SetShow(true)
    self._uiMainText:SetText(mainText)
    self._uiMainText:SetPosY(self._uiResultMsgBG:GetSizeY() * 0.5 - self._uiMainText:GetTextSizeY() * 0.5)
  elseif nil == itemSSW then
    self._uiResultMsgBG:SetSize(getScreenSizeX(), 130)
    self._uiSlotBG:SetShow(false)
    self._uiSubText:SetShow(true)
    self._uiSubText:SetText(subText)
    self._uiSubText:SetPosY(self._uiResultMsgBG:GetSizeY() * 0.36 - self._uiSubText:GetTextSizeY() * 0.5)
    self._uiMainText:SetShow(true)
    self._uiMainText:SetText(mainText)
    self._uiMainText:SetPosY(self._uiResultMsgBG:GetSizeY() * 0.6 - self._uiMainText:GetTextSizeY() * 0.5)
  else
    self._uiResultMsgBG:SetSize(getScreenSizeX(), 190)
    self._uiSlotBG:ComputePos()
    self._uiSlotBG:SetShow(true)
    self._uiSlot:setItemByStaticStatus(itemSSW)
    self._uiSubText:SetShow(true)
    self._uiSubText:SetText(subText)
    self._uiSubText:ComputePos()
    self._uiMainText:SetShow(true)
    self._uiMainText:SetText(mainText)
    self._uiMainText:ComputePos()
  end
  Panel_Window_Extraction_Result:SetShow(true)
  Panel_Window_Extraction_Result:ResetVertexAni()
  Panel_Window_Extraction_Result:SetAlphaExtraChild(1)
  local ImageAni = Panel_Window_Extraction_Result:addColorAnimation(1.5, 3, CppEnums.PAUI_ANIM_ADVANCE_TYPE.PAUI_ANIM_ADVANCE_LINEAR)
  ImageAni:SetStartColor(UI_color.C_FFFFFFFF)
  ImageAni:SetEndColor(UI_color.C_00FFFFFF)
  ImageAni:SetHideAtEnd(true)
  ImageAni.IsChangeChild = true
end
function PaGlobal_ExtractionResult:setHide()
  Panel_Window_Extraction_Result:SetShow(false)
end
function PaGlobal_ExtractionResult_Resize()
  PaGlobal_ExtractionResult:initialize()
end
function PaGlobal_ExtractionResult:registMessageHandler()
  registerEvent("onScreenResize", "PaGlobal_ExtractionResult_Resize")
end
PaGlobal_ExtractionResult:initialize()
PaGlobal_ExtractionResult:registMessageHandler()
