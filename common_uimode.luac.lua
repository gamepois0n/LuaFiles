-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\common\common_uimode.luac 

-- params : ...
-- function num : 0
local isMovableMode = false
FromClient_SetGameUIMode = function()
  -- function num : 0_0
  SetUIMode((Defines.UIMode).eUIMode_Default)
  Panel_SkillCommand:SetShow(false)
end

checkAndSetPosInScreen = function(panel)
  -- function num : 0_1
  local posX = panel:GetPosX()
  local posY = panel:GetPosY()
  local sizeX = panel:GetSizeX()
  local sizeY = panel:GetSizeY()
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  if posX < 0 then
    panel:SetPosX(0)
  else
    if screenSizeX - sizeX < posX then
      panel:SetPosX(screenSizeX - sizeX)
    end
  end
  if posY < 0 then
    panel:SetPosY(0)
  else
    if screenSizeY - sizeY < posY then
      panel:SetPosY(screenSizeY - sizeY)
    end
  end
end

changePositionBySever = function(panel, panelId, isShow, isChangePosition, isChangeSize)
  -- function num : 0_2
  if ToClient_GetUiInfo(panelId, 0, (CppEnums.PanelSaveType).PanelSaveType_IsSaved) > 0 then
    if isShow then
      panel:SetShow(ToClient_GetUiInfo(panelId, 0, (CppEnums.PanelSaveType).PanelSaveType_IsShow))
    end
    if isChangePosition then
      panel:SetPosX(ToClient_GetUiInfo(panelId, 0, (CppEnums.PanelSaveType).PanelSaveType_PositionX))
      panel:SetPosY(ToClient_GetUiInfo(panelId, 0, (CppEnums.PanelSaveType).PanelSaveType_PositionY))
    end
    if isChangeSize then
      panel:SetSize(ToClient_GetUiInfo(panelId, 0, (CppEnums.PanelSaveType).PanelSaveType_SizeX), ToClient_GetUiInfo(panelId, 0, (CppEnums.PanelSaveType).PanelSaveType_SizeY))
    end
    if isChangePosition or isChangeSize then
      checkAndSetPosInScreen(panel)
    end
    return true
  end
  return false
end

FGlobal_PanelMove = function(panel, isOnlyMovableMode)
  -- function num : 0_3
  panel:addInputEvent("Mouse_LPress", "FGlobal_SaveUiInfo(" .. tostring(isOnlyMovableMode) .. ")")
end

FGlobal_SaveUiInfo = function(isOnlyMovableMode)
  -- function num : 0_4 , upvalues : isMovableMode
  if not isOnlyMovableMode or isMovableMode then
    ToClient_SaveUiInfo(false)
  end
end

FGlobal_SetMovableMode = function(isMovable)
  -- function num : 0_5 , upvalues : isMovableMode
  isMovableMode = isMovable
end

FGlobal_IsCommercialService = function()
  -- function num : 0_6
  if getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_Commercial then
    return true
  else
    return false
  end
end

FGlobal_PanelMoveIntoScreen = function(panel)
  -- function num : 0_7
  if panel:GetPosX() < 0 then
    panel:SetPosX(0)
  else
    if getScreenSizeX() <= panel:GetPosX() + panel:GetSizeX() then
      panel:SetPosX(getScreenSizeX() - panel:GetSizeX())
    end
  end
  if panel:GetPosY() < 0 then
    panel:SetPosY(0)
  else
    if getScreenSizeY() <= panel:GetPosY() + panel:GetSizeY() then
      panel:SetPosY(getScreenSizeY() - panel:GetSizeY())
    end
  end
end

registerEvent("FromClient_SetGameUIMode", "FromClient_SetGameUIMode")

