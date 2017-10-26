-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\region\region.luac 

-- params : ...
-- function num : 0
Panel_Region:SetShow(false, false)
Panel_Region:setMaskingChild(true)
Panel_Region:RegisterShowEventFunc(true, "Region_ShowAni()")
Panel_Region:RegisterShowEventFunc(false, "Region_HideAni()")
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_RT = CppEnums.RegionType
local UI_color = Defines.Color
local regionName = (UI.getChildControl)(Panel_Region, "RegionText")
local regigonPlace = (UI.getChildControl)(Panel_Region, "StaticText_Regiontext")
local siegeHouse = (UI.getChildControl)(Panel_Region, "StaticText_Siegetext")
local isShowAlert = false
local alertBackImg = (UI.getChildControl)(Panel_Region, "Static_AlertPanel")
local alertText = (UI.getChildControl)(Panel_Region, "StaticText_Alert_NoticeText")
local L_Line = (UI.getChildControl)(Panel_Region, "Static_L_Line")
local R_Line = (UI.getChildControl)(Panel_Region, "Static_R_Line")
Region_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV, UI_color, regionName, regigonPlace, siegeHouse, L_Line, R_Line, isShowAlert, alertBackImg, alertText
  (UIAni.fadeInSCR_MidOut)(Panel_Region)
  local aniInfo = Panel_Region:addColorAnimation(0, 1.05, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo.IsChangeChild = false
  local aniInfo2 = regionName:addColorAnimation(0, 1.05, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo2:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo2:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo2.IsChangeChild = false
  local aniInfo3 = regigonPlace:addColorAnimation(0, 1.05, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo3:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo3.IsChangeChild = false
  local aniInfo4 = siegeHouse:addColorAnimation(0, 1.05, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo4:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo4:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo4.IsChangeChild = false
  local aniInfo5 = L_Line:addColorAnimation(0, 1.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo5:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo5:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo5.IsChangeChild = false
  local aniInfo6 = R_Line:addColorAnimation(0, 1.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo6:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo6:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo6.IsChangeChild = false
  if isShowAlert then
    local aniInfo_alsertImg = alertBackImg:addColorAnimation(0, 1.05, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
    aniInfo_alsertImg:SetStartColor(UI_color.C_00FFFFFF)
    aniInfo_alsertImg:SetEndColor(UI_color.C_FFFFFFFF)
    aniInfo_alsertImg.IsChangeChild = false
    local aniInfo_alertText = alertText:addColorAnimation(0, 1.05, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
    aniInfo_alertText:SetStartColor(UI_color.C_00FFFFFF)
    aniInfo_alertText:SetEndColor(UI_color.C_FFFFFFFF)
    aniInfo_alertText.IsChangeChild = false
  end
end

Panel_Region:RegisterUpdateFunc("Region_Close")
local _cumulateTime = 0
Region_Close = function(fDeltaTime)
  -- function num : 0_1 , upvalues : _cumulateTime
  _cumulateTime = _cumulateTime + fDeltaTime
  if _cumulateTime >= 9 then
    Panel_Region:SetShow(false, true)
    _cumulateTime = 0
  end
end

Region_HideAni = function()
  -- function num : 0_2 , upvalues : UI_ANI_ADV, UI_color
  Panel_Region:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo6 = Panel_Region:addColorAnimation(0, 1.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo6:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo6:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo6.IsChangeChild = true
  aniInfo6:SetHideAtEnd(true)
  aniInfo6:SetDisableWhileAni(true)
end

Region_OnResize = function()
  -- function num : 0_3 , upvalues : regionName, regigonPlace, siegeHouse, L_Line, R_Line, alertBackImg, alertText
  local ScrX = getScreenSizeX()
  local ScrY = getScreenSizeY()
  Panel_Region:SetSize(ScrX, 64)
  Panel_Region:SetPosX(0)
  Panel_Region:SetPosY(ScrY - 300)
  regionName:SetPosX(ScrX / 2 - 256)
  regigonPlace:SetPosX(ScrX / 2 - 256)
  siegeHouse:SetPosX(ScrX / 2 - 256)
  L_Line:SetSize(ScrX / 2 - 278, 11)
  R_Line:SetSize(ScrX / 2 - 278, 11)
  L_Line:SetPosX(0)
  R_Line:SetPosX(ScrX - ScrX / 2 + 278)
  L_Line:SetPosY(32)
  R_Line:SetPosY(32)
  alertBackImg:ComputePos()
  alertText:ComputePos()
  alertBackImg:SetPosY(-ScrY / 2)
  alertText:SetPosY(-ScrY / 2)
end

Region_OnChangeRegion = function(regionData)
  -- function num : 0_4 , upvalues : regionName, regigonPlace, siegeHouse, UI_RT, isShowAlert, alertBackImg, alertText
  if regionData == nil then
    Panel_Region:SetShow(false, false)
  else
    regionName:SetText(regionData:getAreaName())
    regigonPlace:SetText(regionData:getTerritoryName())
    local regionType = (regionData:get()):getRegionType()
    local isArenaZone = (regionData:get()):isArenaZone()
    if Panel_Npc_Dialog:GetShow() then
      return 
    end
    Panel_Region:SetShow(true, true)
    siegeHouse:SetShow(false)
    local siegeWrapper = ToClient_GetSiegeWrapperByRegionKey(regionData:getRegionKey())
    if siegeWrapper ~= nil then
      local isSiegeBeing = siegeWrapper:isSiegeBeing()
      local isShow = UI_RT.eRegionType_Siege == regionType or UI_RT.eRegionType_Fortress == regionType
      isShowAlert = not isSiegeBeing or isShow
      if isArenaZone then
        isShowAlert = isArenaZone
      end
    else
      isShowAlert = false
    end
    alertBackImg:SetShow(isShowAlert)
    alertText:SetShow(isShowAlert)
    if isArenaZone == true then
      alertText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALERTMESSAGE_PVPZONE"))
    else
      alertText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALERTMESSAGE_SIEGE"))
    end
  end
  -- DECOMPILER ERROR: 6 unprocessed JMP targets
end

registerEvent("selfPlayer_regionChanged", "Region_OnChangeRegion")
registerEvent("onScreenResize", "Region_OnResize")
Region_OnResize()

