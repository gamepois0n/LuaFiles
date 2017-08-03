-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\include\global_util_ui_scroll.luac 

-- params : ...
-- function num : 0
if UIScroll == nil then
  UIScroll = {}
end
-- DECOMPILER ERROR at PC7: Confused about usage of register: R0 in 'UnsetPending'

UIScroll.SetButtonSize = function(scroll, configSlotCount, contentsCount)
  -- function num : 0_0
  if configSlotCount < contentsCount then
    local size = configSlotCount / contentsCount
    local sizeResult = scroll:GetSizeY() * size
    if sizeResult < 50 then
      sizeResult = 50
    end
    ;
    (scroll:GetControlButton()):SetSize((scroll:GetControlButton()):GetSizeX(), sizeResult)
    scroll:SetShow(true)
  else
    do
      scroll:SetShow(false)
    end
  end
end

-- DECOMPILER ERROR at PC10: Confused about usage of register: R0 in 'UnsetPending'

UIScroll.ScrollEvent = function(scroll, isScrollUp, row, contentsCount, startSlot, column)
  -- function num : 0_1
  if contentsCount <= row * column then
    return 0
  end
  local returnStartSlot = startSlot
  local maxStartSlotCount = (contentsCount - row * column) / column
  local slotSize = 1 / maxStartSlotCount
  if isScrollUp ~= nil then
    returnStartSlot = (UIScroll.ScrollPosition)(isScrollUp, row, contentsCount, startSlot, column)
  else
    local currentScrollPos = scroll:GetControlPos()
    local starSlotIndexString = (string.format)("%.0f", currentScrollPos / slotSize)
    returnStartSlot = tonumber(starSlotIndexString) * column
  end
  do
    scroll:SetControlPos(slotSize * (returnStartSlot) / column)
    return returnStartSlot
  end
end

-- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

UIScroll.ScrollPosition = function(isScrollUp, configSlotCount, contentsCount, startSlot, scrollCount)
  -- function num : 0_2
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

-- DECOMPILER ERROR at PC16: Confused about usage of register: R0 in 'UnsetPending'

UIScroll.InputEvent = function(scroll, functionName)
  -- function num : 0_3
  scroll:addInputEvent("Mouse_LUp", functionName .. "()")
  scroll:addInputEvent("Mouse_LDown", functionName .. "()")
  scroll:addInputEvent("Mouse_UpScroll", functionName .. "( true )")
  scroll:addInputEvent("Mouse_DownScroll", functionName .. "( false )")
  ;
  (scroll:GetControlButton()):addInputEvent("Mouse_LDown", functionName .. "()")
  ;
  (scroll:GetControlButton()):addInputEvent("Mouse_LUp", functionName .. "()")
  ;
  (scroll:GetControlButton()):addInputEvent("Mouse_LPress", functionName .. "()")
  ;
  (scroll:GetControlButton()):addInputEvent("Mouse_UpScroll", functionName .. "( true )")
  ;
  (scroll:GetControlButton()):addInputEvent("Mouse_DownScroll", functionName .. "( false )")
end

-- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

UIScroll.InputEventByControl = function(control, functionName)
  -- function num : 0_4
  control:addInputEvent("Mouse_UpScroll", functionName .. "( true )")
  control:addInputEvent("Mouse_DownScroll", functionName .. "( false )")
end


