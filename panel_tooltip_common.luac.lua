-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\tooltip\panel_tooltip_common.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
Panel_Tooltip_Common:SetShow(false, false)
Panel_Tooltip_Common:setGlassBackground(true)
Panel_Tooltip_Common:SetIgnoreChild(true)
local _uiIcon = (UI.getChildControl)(Panel_Tooltip_Common, "Tooltip_Common_Icon")
local _uiName = (UI.getChildControl)(Panel_Tooltip_Common, "Tooltip_Common_Name")
local _uiTitle = (UI.getChildControl)(Panel_Tooltip_Common, "Tooltip_Common_Title")
local _styleDesc = (UI.getChildControl)(Panel_Tooltip_Common, "Tooltip_Common_Description")
local uiTextGroup = {_uiName = _uiName, _styleDesc = _styleDesc}
local getMaxRightPos = function()
  -- function num : 0_0 , upvalues : uiTextGroup
  local rightPos = 0
  for _,control in pairs(uiTextGroup) do
    if control:GetShow() then
      local currentControlRight = control:GetPosX() + control:GetTextSizeX()
      if rightPos < currentControlRight then
        rightPos = currentControlRight
      end
    end
  end
  return rightPos
end

local getMaxBottomPos = function()
  -- function num : 0_1 , upvalues : uiTextGroup
  local bottomPos = 0
  for _,control in pairs(uiTextGroup) do
    if control:GetShow() then
      local currentControlBottom = control:GetPosY() + control:GetTextSizeY()
      if bottomPos < currentControlBottom then
        bottomPos = currentControlBottom
      end
    end
  end
  return bottomPos
end

local currentIndex = -1
local isShow = false
TooltipCommon_Show = function(index, uiWedget, iconPath, name, title, desc)
  -- function num : 0_2 , upvalues : currentIndex, isShow, _uiIcon, _uiName, UI_TM, _styleDesc, getMaxRightPos, getMaxBottomPos
  if currentIndex == index and isShow then
    return 
  else
    currentIndex = index
    isShow = true
  end
  if iconPath ~= nil then
    _uiIcon:ChangeTextureInfoName("icon/" .. iconPath)
  else
    _uiIcon:ChangeTextureInfoName("")
  end
  _uiName:SetTextMode(UI_TM.eTextMode_AutoWrap)
  _uiName:SetText(name)
  _uiName:ComputePos()
  if desc == nil then
    _styleDesc:SetShow(false)
  else
    _styleDesc:SetText(desc)
  end
  local width = getMaxRightPos()
  local height = getMaxBottomPos() + 30
  if width ~= 0 and height ~= 0 then
    local posX = uiWedget:GetParentPosX() + uiWedget:GetSizeX() * 0.8
    local posY = uiWedget:GetParentPosY() - uiWedget:GetSizeY() * 1.8
    Panel_Tooltip_Common:SetPosX(posX)
    Panel_Tooltip_Common:SetPosY(posY)
    Panel_Tooltip_Common:SetSize(Panel_Tooltip_Common:GetSizeX(), height)
    Panel_Tooltip_Common:SetShow(true, false)
  else
    do
      Panel_Tooltip_Common:SetShow(false, false)
    end
  end
end

TooltipCommon_Hide = function(index)
  -- function num : 0_3 , upvalues : currentIndex, isShow
  if currentIndex ~= index or isShow == false then
    return 
  else
    currentIndex = -1
    isShow = false
  end
  Panel_Tooltip_Common:SetShow(false, false)
end

TooltipCommon_getCurrentIndex = function()
  -- function num : 0_4 , upvalues : currentIndex
  return currentIndex
end


