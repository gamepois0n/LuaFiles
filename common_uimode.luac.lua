-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\common\common_uimode.luac 

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
      if CppDefine.ChangeUIAndResolution == true then
        local relativePosX = ToClient_GetUiInfo(panelId, 0, (CppEnums.PanelSaveType).PanelSaveType_RelativePositionX)
        local relativePosY = ToClient_GetUiInfo(panelId, 0, (CppEnums.PanelSaveType).PanelSaveType_RelativePositionY)
        panel:SetRelativePosX(relativePosX)
        panel:SetRelativePosY(relativePosY)
      end
    end
    do
      if isChangeSize then
        panel:SetSize(ToClient_GetUiInfo(panelId, 0, (CppEnums.PanelSaveType).PanelSaveType_SizeX), ToClient_GetUiInfo(panelId, 0, (CppEnums.PanelSaveType).PanelSaveType_SizeY))
      end
      if isChangePosition or isChangeSize then
        checkAndSetPosInScreen(panel)
      end
      do return true end
      return false
    end
  end
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

FGlobal_InitPanelRelativePos = function(panel, initPosX, initPosY)
  -- function num : 0_8
  if initPosX == panel:GetPosX() and initPosY == panel:GetPosY() then
    panel:SetRelativePosX(0)
    panel:SetRelativePosY(0)
  else
    panel:SetRelativePosX((panel:GetPosX() + panel:GetSizeX() / 2) / getScreenSizeX())
    panel:SetRelativePosY((panel:GetPosY() + panel:GetSizeY() / 2) / getScreenSizeY())
  end
end

FGlobal_PanelRepostionbyScreenOut = function(panel)
  -- function num : 0_9
  local posX = panel:GetPosX()
  local posY = panel:GetPosY()
  local sizeX = panel:GetSizeX()
  local sizeY = panel:GetSizeY()
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  if screenSizeX < posX + sizeX then
    panel:SetPosX(screenSizeX - panel:GetSizeX())
  else
    if posX < 0 then
      panel:SetPosX(1)
    end
  end
  if screenSizeY < posY + sizeY then
    panel:SetPosY(screenSizeY - panel:GetSizeY())
  else
    if posY < 0 then
      panel:SetPosY(1)
    end
  end
end

registerEvent("FromClient_SetGameUIMode", "FromClient_SetGameUIMode")

