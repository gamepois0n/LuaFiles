-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\tooltip\panel_tooltip_worker.luac 

-- params : ...
-- function num : 0
Panel_Worker_Tooltip:setMaskingChild(true)
Panel_Worker_Tooltip:setGlassBackground(true)
Panel_Worker_Tooltip:SetShow(false, flase)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_TM = CppEnums.TextMode
local UI_color = Defines.Color
local UI_QuestType = CppEnums.QuestType
workerInfoTooltip = nil
local controlWorkerTooltip = {_icon = (UI.getChildControl)(Panel_Worker_Tooltip, "StaticText_workerIcon"), _name = (UI.getChildControl)(Panel_Worker_Tooltip, "StaticText_workerName"), _actionPointTitle = (UI.getChildControl)(Panel_Worker_Tooltip, "StaticText_workerActionPoint"), _actionPointValue = (UI.getChildControl)(Panel_Worker_Tooltip, "StaticText_workerActionPoint_value"), _luckTitle = (UI.getChildControl)(Panel_Worker_Tooltip, "StaticText_workerLuck"), _luckValue = (UI.getChildControl)(Panel_Worker_Tooltip, "StaticText_workerLuck_value"), _efficiencyTitle = (UI.getChildControl)(Panel_Worker_Tooltip, "StaticText_workerEfficiency"), _efficiencyValue = (UI.getChildControl)(Panel_Worker_Tooltip, "StaticText_workerEfficiency_Value"), _moveSpeedTitle = (UI.getChildControl)(Panel_Worker_Tooltip, "StaticText_workerMoveSpeed"), _moveSpeedValue = (UI.getChildControl)(Panel_Worker_Tooltip, "StaticText_workerMoveSpeed_value")}
HandleOnWorkerTooltip = function(infoNodeKey, workerIndex, uiBase)
  -- function num : 0_0
  workerInfoTooltip = uiBase
  local waitWorkerCount = 0
  local isHouse = Panel_House_ManageWork:GetShow()
  local isPlant = Panel_Farm_ManageWork:GetShow()
  local isTown = Panel_manageWorker:GetShow()
  if isHouse == true then
    local houseInfo = housing_getHouseInfo(infoNodeKey - 1)
    if houseInfo == nil or isPlant == true or isTown == true then
      FGlobal_InitWorkerTooltip()
      return 
    end
    waitWorkerCount = getHouseWaitWorkerList(houseInfo, (WorldMapWindow.plantData).productCartegory, (WorldMapWindow.plantData).workableKey, sortMethod)
  else
    do
      if isPlant == true then
        local plantKey = ((WorldMapWindow.nodeDataList)[infoNodeKey]):getPlantKey()
        local plant = getPlant(plantKey)
        if plant == nil or isHouse == true or isTown == true then
          FGlobal_InitWorkerTooltip()
          return 
        end
        waitWorkerCount = getPlantWaitWorkerList(plant, (WorldMapWindow.plantData).productCartegory, (WorldMapWindow.plantData).workableKey, sortMethod)
      else
        do
          do
            if isTown == true then
              local plantKey, plant = nil, nil
              plantKey = (FGlobal_SelectedHouseInfo()):getPlantKey()
              plant = ToClient_getPlant(plantKey)
              if plant == nil or isHouse == true or isPlant == true then
                FGlobal_InitWorkerTooltip()
                return 
              end
              waitWorkerCount = getPlantWaitWorkerList(plant, 0)
            end
            local workerData = getWaitWorkerByIndex(workerIndex)
            local workerStaticStatus = workerData:getWorkerStaticStatus()
            FGlobal_ShowWorkerTooltip(workerData, uiBase)
          end
        end
      end
    end
  end
end

HandleOutWorkerTooltip = function(uiBase)
  -- function num : 0_1
  if uiBase == workerInfoTooltip then
    workerInfoTooltip = nil
  end
  FGlobal_HideWorkerTooltip()
end

FGlobal_ShowWorkerTooltip = function(workerData, uiBase)
  -- function num : 0_2 , upvalues : controlWorkerTooltip
  audioPostEvent_SystemUi(1, 13)
  local workerStaticStatus = workerData:getWorkerStaticStatus()
  ;
  (controlWorkerTooltip._icon):ChangeTextureInfoName(getWorkerIcon(workerStaticStatus))
  ;
  (controlWorkerTooltip._name):SetText(getWorkerName(workerStaticStatus))
  ;
  (controlWorkerTooltip._actionPointValue):SetText(tostring(workerData:getActionPoint()) .. " / " .. tostring(workerStaticStatus._actionPoint))
  ;
  (controlWorkerTooltip._luckValue):SetText(tostring(workerStaticStatus._luck / 10000) .. "%")
  local _efficiency = workerStaticStatus:getMaxEfficiency()
  local _npcWorkingBaseTime = ((Util.Time).timeFormatting)((math.floor)(getNpcWorkingBaseTime() / 1000))
  ;
  (controlWorkerTooltip._efficiencyValue):SetText(tostring((math.floor)(_efficiency / 1000000)) .. " /" .. _npcWorkingBaseTime)
  ;
  (controlWorkerTooltip._moveSpeedValue):SetText(tostring(workerStaticStatus._moveSpeed) .. "m/s")
  local posX = uiBase:GetParentPosX()
  local posY = uiBase:GetParentPosY()
  local parentSizeX = uiBase:GetSizeX()
  local parentSizeY = uiBase:GetSizeY()
  local tooltipSizeX = Panel_Worker_Tooltip:GetSizeX()
  local tooltipSizeY = Panel_Worker_Tooltip:GetSizeY()
  local scrnSizeX = getScreenSizeX()
  local scrnSizeY = getScreenSizeY()
  if scrnSizeX - posX - parentSizeX < posX then
    posX = posX - tooltipSizeX - 5
  else
    posX = posX + parentSizeX + 5
  end
  if scrnSizeY - posY - parentSizeY < posY then
    posY = posY - tooltipSizeY + parentSizeY + 5
  else
    posY = posY - 5
  end
  Panel_Worker_Tooltip:SetPosX(posX)
  Panel_Worker_Tooltip:SetPosY(posY)
  Panel_Worker_Tooltip:SetShow(true, false)
  Panel_Worker_Tooltip:setFlushAble(false)
end

FGlobal_HideWorkerTooltip = function()
  -- function num : 0_3
  if Panel_Worker_Tooltip:GetShow() and workerInfoTooltip == nil then
    Panel_Worker_Tooltip:SetShow(false, false)
  end
end

FGlobal_InitWorkerTooltip = function()
  -- function num : 0_4
  workerInfoTooltip = nil
  FGlobal_HideWorkerTooltip()
end


