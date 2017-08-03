-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\regiontimebar\regiontimebar.luac 

-- params : ...
-- function num : 0
Panel_RegionBar:SetShow(true, false)
Panel_TimeBar:SetShow(true, false)
Panel_TimeBar:setMaskingChild(true)
local UI_RT = CppEnums.RegionType
local UI_color = Defines.Color
local regionType = (UI.getChildControl)(Panel_RegionBar, "regionType")
local regionName = (UI.getChildControl)(Panel_RegionBar, "regionName")
local timeNum = (UI.getChildControl)(Panel_RegionBar, "timeNum")
local timeLine = (UI.getChildControl)(Panel_TimeBar, "timeLine")
local timeElement = (UI.getChildControl)(Panel_TimeBar, "timeElement")
local timeElement_right = (UI.getChildControl)(Panel_TimeBar, "timeElement2")
;
(UI.ASSERT)(regionType, "regionType        nil")
;
(UI.ASSERT)(regionName, "regionName        nil")
;
(UI.ASSERT)(timeLine, "timeLine          nil")
;
(UI.ASSERT)(timeElement, "timeElement       nil")
;
(UI.ASSERT)(timeNum, "timeNum           nil")
;
(UI.ASSERT)(timeElement_right, "timeElement_right nil")
timeNum:SetShow(false)
Minimap_updateRegion = function(regionData)
  -- function num : 0_0 , upvalues : UI_RT, UI_color, regionName
  local regionType = (regionData:get()):getRegionType()
  if UI_RT.eRegionType_MinorTown == regionType or UI_RT.eRegionType_MainTown == regionType then
    regionType:SetFontColor(UI_color.C_FF76CAFF)
    regionType:SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_REGIONTIMERBAR_SAFETYZONE"))
  else
    if UI_RT.eRegionType_Hunting == regionType then
      regionType:SetFontColor(UI_color.C_FFFF5F5F)
      regionType:SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_REGIONTIMERBAR_BATTLEZONE"))
    else
      if UI_RT.eRegionType_Siege == regionType or UI_RT.eRegionType_Fortress == regionType or UI_RT.eRegionType_CastleInSiege == regionType then
        if (regionData:get()):isSiegeBeing() then
          regionType:SetFontColor(UI_color.C_FFFF3BF8)
          regionType:SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_REGIONTIMERBAR_SIEGEZONE"))
        else
          regionType:SetFontColor(UI_color.C_FFFF5F5F)
          regionType:SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_REGIONTIMERBAR_BATTLEZONE"))
        end
      end
    end
  end
  regionName:SetText(tostring(regionData:getAreaName()))
end

RegionData_IngameTime = 0
RegionData_ElementWidth = timeElement:GetSizeX()
local dayCycle = 1440
updateTime = function()
  -- function num : 0_1 , upvalues : dayCycle, timeNum, timeElement, timeElement_right
  local ingameTime = getIngameTime_minute()
  if dayCycle < ingameTime then
    ingameTime = ingameTime % dayCycle
  end
  if ingameTime == RegionData_IngameTime then
    return 
  else
    RegionData_IngameTime = ingameTime
  end
  local minute = RegionData_IngameTime % 60
  local hour = (math.floor)(RegionData_IngameTime / 60)
  local calcMinute = "00"
  if minute < 10 then
    calcMinute = "0" .. minute
  else
    calcMinute = "" .. minute
  end
  if hour == 12 then
    timeNum:SetText("PM " .. tostring(hour) .. " : " .. calcMinute)
  else
    if hour == 0 then
      local calcHour = hour + 12
      timeNum:SetText("AM " .. tostring(calcHour) .. " : " .. calcMinute)
    else
      do
        if hour == 24 then
          local calcHour = hour
          timeNum:SetText("AM " .. "0" .. " : " .. calcMinute)
        else
          do
            if hour > 11 then
              local calcHour = hour - 12
              timeNum:SetText("PM " .. tostring(calcHour) .. " : " .. calcMinute)
            else
              do
                timeNum:SetText("AM " .. tostring(hour) .. " : " .. calcMinute)
                timeElement:SetPosX(-RegionData_ElementWidth / 2 - RegionData_ElementWidth * RegionData_IngameTime / dayCycle + 9)
                timeElement_right:SetPosX(RegionData_ElementWidth / 2 - RegionData_ElementWidth * RegionData_IngameTime / dayCycle + 9)
              end
            end
          end
        end
      end
    end
  end
end

TimeBar_ShowToggle = function(isShow)
  -- function num : 0_2 , upvalues : timeLine, timeElement, timeElement_right, timeNum
  timeLine:SetShow(not isShow)
  timeElement:SetShow(not isShow)
  timeElement_right:SetShow(not isShow)
  timeNum:SetShow(isShow)
end

Panel_TimeBar:RegisterUpdateFunc("updateTime")
Panel_Tooltip_Skill:SetIgnore(true)
timeLine:SetIgnore(true)
timeElement:SetIgnore(true)
timeElement_right:SetIgnore(true)
timeNum:SetIgnore(true)
Panel_TimeBar:addInputEvent("Mouse_On", "TimeBar_ShowToggle( true )")
Panel_TimeBar:addInputEvent("Mouse_Out", "TimeBar_ShowToggle( false )")
Panel_TimeBar:addInputEvent("Mouse_LUp", "ResetPos_WidgetButton()")
Panel_RegionBar:SetIgnore(true)

