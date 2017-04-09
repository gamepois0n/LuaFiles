-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\customization\panel_customization_palette.luac 

-- params : ...
-- function num : 0
local colorStatic = {}
local rgbArr = {}
local Static_SelectMark = nil
local ColumnCount = 10
local imageSize = 25
local checkPalette = function(x, y, static)
  -- function num : 0_0
  panel_x = 0
  panel_y = 0
  frame = static:getParent()
  panel_x = frame:GetPosX()
  panel_y = frame:GetPosY()
  frame = frame:getParent()
  panel_x = panel_x + frame:GetPosX()
  panel_y = panel_y + frame:GetPosY()
  frame = frame:getParent()
  panel_x = panel_x + frame:GetPosX()
  panel_y = panel_y + frame:GetPosY()
  frame = frame:getParent()
  panel_x = panel_x + frame:GetPosX()
  panel_y = panel_y + frame:GetPosY()
  left = static:GetPosX() + panel_x
  top = static:GetPosY() + panel_y
  right = left + static:GetSizeX()
  bottom = top + static:GetSizeY()
  if left < x and top < y and x < right and y < bottom then
    return true
  end
  return false
end

UpdatePaletteMarkPosition = function(index)
  -- function num : 0_1 , upvalues : Static_SelectMark, ColumnCount, imageSize
  if index ~= -1 then
    Static_SelectMark:SetShow(true)
    Static_SelectMark:SetPosX(index % ColumnCount * imageSize + index % ColumnCount)
    Static_SelectMark:SetPosY((math.floor)(index / ColumnCount) * imageSize + (math.floor)(index / ColumnCount))
  else
    Static_SelectMark:SetShow(false)
  end
end

CreateCommonPalette = function(FrameTemplate, ftCollision, classType, paramType, paramIndex, PaletteIndex)
  -- function num : 0_2 , upvalues : Static_SelectMark, imageSize, ColumnCount, colorStatic
  clearPalette()
  local Frame_Content = (UI.getChildControl)(FrameTemplate, "Frame_Content")
  Static_SelectMark = (UI.getChildControl)(Frame_Content, "Static_SelectMark")
  Static_SelectMark:SetShow(false)
  local ftContent = (UI.getChildControl)(FrameTemplate, "Frame_Content")
  local count = getPaletteColorCount(PaletteIndex)
  for colorIndex = 0, count - 1 do
    local luaColorIndex = colorIndex + 1
    local tempStatic = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, ftContent, "Static_Color_" .. colorIndex)
    local color = getPaletteColorRGB(PaletteIndex, colorIndex)
    tempStatic:ChangeTextureInfoName("New_UI_Common_ForLua/Window/Lobby/cus_palette.dds")
    tempStatic:SetShow(true)
    tempStatic:SetSize(imageSize, imageSize)
    ;
    (tempStatic:getBaseTexture()):setUV(0, 0, 1, 1)
    tempStatic:SetPosX(colorIndex % ColumnCount * imageSize + colorIndex % ColumnCount)
    tempStatic:SetPosY((math.floor)(colorIndex / ColumnCount) * imageSize + (math.floor)(colorIndex / ColumnCount))
    tempStatic:setRenderTexture(tempStatic:getBaseTexture())
    local colorTemp = getPaletteColor(PaletteIndex, colorIndex)
    tempStatic:SetColor(Int64toInt32(colorTemp))
    tempStatic:addInputEvent("Mouse_PressMove", "UpdateCommonPalette(" .. classType .. "," .. paramType .. "," .. paramIndex .. ")")
    -- DECOMPILER ERROR at PC111: Confused about usage of register: R17 in 'UnsetPending'

    colorStatic[luaColorIndex] = tempStatic
  end
  ftCollision:ChangeTextureInfoName("New_UI_Common_ForLua/Window/Lobby/cus_palette.dds")
  ;
  (ftCollision:getBaseTexture()):setUV(0, 0, 1, 1)
  ftCollision:addInputEvent("Mouse_LPress", "UpdateCommonPalette(" .. classType .. "," .. paramType .. "," .. paramIndex .. ")")
  ftCollision:SetShow(true)
  ftCollision:SetPosX(FrameTemplate:GetPosX())
  ftCollision:SetPosY(FrameTemplate:GetPosY())
  ftCollision:SetAlpha(0)
  ftCollision:SetSize(imageSize * 10 + 9, (math.floor)(count / ColumnCount + 0.5) * imageSize + (math.floor)(count / ColumnCount + 0.5))
  ftCollision:setRenderTexture(ftCollision:getBaseTexture())
  FrameTemplate:SetSize(imageSize * 10 + 9, (math.floor)(count / ColumnCount + 0.5) * imageSize + (math.floor)(count / ColumnCount + 0.5))
  FrameTemplate:UpdateContentScroll()
  FrameTemplate:UpdateContentPos()
end

UpdateCommonPalette = function(classType, paramType, paramIndex)
  -- function num : 0_3 , upvalues : colorStatic, checkPalette
  posX = getMousePosX()
  posY = getMousePosY()
  for luaColorIndex = 1, #colorStatic do
    local colorIndex = luaColorIndex - 1
    if checkPalette(posX, posY, colorStatic[luaColorIndex]) == true then
      setParam(classType, paramType, paramIndex, colorIndex)
      UpdatePaletteMarkPosition(colorIndex)
      return 
    end
  end
end

local CheckControlArr = {}
CreateEyePalette = function(FrameTemplate, ftCollision, classType, paramType, paramIndex, paramIndex2, PaletteIndex, CheckControl1, CheckControl2)
  -- function num : 0_4 , upvalues : CheckControlArr, Static_SelectMark, imageSize, ColumnCount, colorStatic
  clearPalette()
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R9 in 'UnsetPending'

  CheckControlArr[1] = CheckControl1
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R9 in 'UnsetPending'

  CheckControlArr[2] = CheckControl2
  local Frame_Content = (UI.getChildControl)(FrameTemplate, "Frame_Content")
  Static_SelectMark = (UI.getChildControl)(Frame_Content, "Static_SelectMark")
  Static_SelectMark:SetShow(false)
  local ftContent = (UI.getChildControl)(FrameTemplate, "Frame_Content")
  local count = getPaletteColorCount(PaletteIndex)
  for colorIndex = 0, count - 1 do
    local luaColorIndex = colorIndex + 1
    local tempStatic = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, ftContent, "Static_Color_" .. colorIndex)
    local color = getPaletteColorRGB(PaletteIndex, colorIndex)
    tempStatic:ChangeTextureInfoName("New_UI_Common_ForLua/Window/Lobby/cus_palette.dds")
    tempStatic:SetShow(true)
    tempStatic:SetSize(imageSize, imageSize)
    ;
    (tempStatic:getBaseTexture()):setUV(0, 0, 1, 1)
    tempStatic:SetPosX(colorIndex % ColumnCount * imageSize + colorIndex % ColumnCount)
    tempStatic:SetPosY((math.floor)(colorIndex / ColumnCount) * imageSize + (math.floor)(colorIndex / ColumnCount))
    tempStatic:setRenderTexture(tempStatic:getBaseTexture())
    local colorTemp = getPaletteColor(PaletteIndex, colorIndex)
    tempStatic:SetColor(Int64toInt32(colorTemp))
    tempStatic:addInputEvent("Mouse_PressMove", "UpdateEyePalette(" .. classType .. "," .. paramType .. "," .. paramIndex .. "," .. paramIndex2 .. ")")
    -- DECOMPILER ERROR at PC117: Confused about usage of register: R20 in 'UnsetPending'

    colorStatic[luaColorIndex] = tempStatic
  end
  ftCollision:ChangeTextureInfoName("New_UI_Common_ForLua/Window/Lobby/cus_palette.dds")
  ;
  (ftCollision:getBaseTexture()):setUV(0, 0, 1, 1)
  ftCollision:addInputEvent("Mouse_LPress", "UpdateEyePalette(" .. classType .. "," .. paramType .. "," .. paramIndex .. "," .. paramIndex2 .. ")")
  ftCollision:SetShow(true)
  ftCollision:SetPosX(FrameTemplate:GetPosX())
  ftCollision:SetPosY(FrameTemplate:GetPosY())
  ftCollision:SetAlpha(0)
  ftCollision:SetSize(imageSize * 10 + 9, (math.floor)(count / ColumnCount + 0.5) * imageSize + (math.floor)(count / ColumnCount + 0.5))
  ftCollision:setRenderTexture(ftCollision:getBaseTexture())
  FrameTemplate:SetSize(imageSize * 10 + 9, (math.floor)(count / ColumnCount + 0.5) * imageSize + (math.floor)(count / ColumnCount + 0.5))
  FrameTemplate:UpdateContentScroll()
  FrameTemplate:UpdateContentPos()
end

UpdateEyePalette = function(classType, paramType, paramIndex, paramIndex2)
  -- function num : 0_5 , upvalues : colorStatic, checkPalette, CheckControlArr
  posX = getMousePosX()
  posY = getMousePosY()
  for luaColorIndex = 1, #colorStatic do
    local colorIndex = luaColorIndex - 1
    if checkPalette(posX, posY, colorStatic[luaColorIndex]) == true then
      if (CheckControlArr[1]):IsCheck() == true then
        setParam(classType, paramType, paramIndex, colorIndex)
      end
      if (CheckControlArr[2]):IsCheck() == true then
        setParam(classType, paramType, paramIndex2, colorIndex)
      end
      UpdatePaletteMarkPosition(colorIndex)
      return 
    end
  end
end

clearPalette = function()
  -- function num : 0_6 , upvalues : colorStatic, rgbArr
  for _,content in pairs(colorStatic) do
    content:SetShow(false)
    ;
    (UI.deleteControl)(content)
  end
  colorStatic = {}
  rgbArr = {}
end


