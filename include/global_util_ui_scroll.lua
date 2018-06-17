if nil == UIScroll then
  UIScroll = {}
end
function UIScroll.SetButtonSize(scroll, configSlotCount, contentsCount)
  if configSlotCount < contentsCount then
    local size = configSlotCount / contentsCount
    local sizeResult = scroll:GetSizeY() * size
    if sizeResult < 50 then
      sizeResult = 50
    end
    scroll:GetControlButton():SetSize(scroll:GetControlButton():GetSizeX(), sizeResult)
    scroll:SetShow(true)
  else
    scroll:SetShow(false)
  end
end
function UIScroll.ScrollEvent(scroll, isScrollUp, row, contentsCount, startSlot, column)
  if contentsCount <= row * column then
    return 0
  end
  local returnStartSlot = startSlot
  local maxStartSlotCount = (contentsCount - row * column) / column
  local slotSize = 1 / maxStartSlotCount
  if nil ~= isScrollUp then
    returnStartSlot = UIScroll.ScrollPosition(isScrollUp, row, contentsCount, startSlot, column)
  else
    local currentScrollPos = scroll:GetControlPos()
    local starSlotIndexString = string.format("%.0f", currentScrollPos / slotSize)
    returnStartSlot = tonumber(starSlotIndexString) * column
  end
  scroll:SetControlPos(slotSize * returnStartSlot / column)
  return returnStartSlot
end
function UIScroll.ScrollPosition(isScrollUp, configSlotCount, contentsCount, startSlot, scrollCount)
  local returnStartSlot = startSlot
  local maxStartSlotCount = contentsCount - configSlotCount * scrollCount
  if isScrollUp then
    returnStartSlot = returnStartSlot - scrollCount
  else
    returnStartSlot = returnStartSlot + scrollCount
  end
  if returnStartSlot < 0 then
    returnStartSlot = 0
  end
  if maxStartSlotCount < returnStartSlot then
    returnStartSlot = maxStartSlotCount
  end
  return returnStartSlot
end
function UIScroll.InputEvent(scroll, functionName)
  scroll:addInputEvent("Mouse_LUp", functionName .. "()")
  scroll:addInputEvent("Mouse_LDown", functionName .. "()")
  scroll:addInputEvent("Mouse_UpScroll", functionName .. "( true )")
  scroll:addInputEvent("Mouse_DownScroll", functionName .. "( false )")
  scroll:GetControlButton():addInputEvent("Mouse_LDown", functionName .. "()")
  scroll:GetControlButton():addInputEvent("Mouse_LUp", functionName .. "()")
  scroll:GetControlButton():addInputEvent("Mouse_LPress", functionName .. "()")
  scroll:GetControlButton():addInputEvent("Mouse_UpScroll", functionName .. "( true )")
  scroll:GetControlButton():addInputEvent("Mouse_DownScroll", functionName .. "( false )")
end
function UIScroll.InputEventByControl(control, functionName)
  control:addInputEvent("Mouse_UpScroll", functionName .. "( true )")
  control:addInputEvent("Mouse_DownScroll", functionName .. "( false )")
end
