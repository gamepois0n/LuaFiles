-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\levelupguide\panel_levelupguide.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local IM = CppEnums.EProcessorInputMode
local UI_TM = CppEnums.TextMode
Panel_LevelupGuide:SetShow(false, false)
Panel_LevelupGuide:RegisterShowEventFunc(true, "LevelupGuideShowAni()")
Panel_LevelupGuide:RegisterShowEventFunc(false, "LevelupGuideHideAni()")
local levelupGuide = {levelupBG = (UI.getChildControl)(Panel_LevelupGuide, "Static_WebBG"), btnClose = (UI.getChildControl)(Panel_LevelupGuide, "Button_Close")}
local _Web = nil
local isLevelGuideUse = true
if isGameTypeKR2() then
  isLevelGuideUse = false
end
LevelupGuideShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_LevelupGuide)
  local aniInfo1 = Panel_LevelupGuide:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.2)
  aniInfo1.AxisX = Panel_LevelupGuide:GetSizeX() / 2
  aniInfo1.AxisY = Panel_LevelupGuide:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_LevelupGuide:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.2)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_LevelupGuide:GetSizeX() / 2
  aniInfo2.AxisY = Panel_LevelupGuide:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

LevelupGuideHideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color
  local aniInfo1 = Panel_LevelupGuide:addColorAnimation(0, 0.1, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

LevelupGuide_Init = function()
  -- function num : 0_2 , upvalues : levelupGuide, _Web
  local self = levelupGuide
  _Web = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, self.levelupBG, "WebControl_LevelupGuide_WebLink")
  _Web:SetShow(true)
  _Web:SetPosX(0)
  _Web:SetPosY(0)
  _Web:SetSize(890, 655)
  _Web:ResetUrl()
  ;
  (self.btnClose):addInputEvent("Mouse_LUp", "HandleClicked_LevelupGuide_Close()")
  ;
  (self.btnClose):SetShow(false)
end

LevelupGuide_Init()
LevelupGuide_OpenCheck = function()
  -- function num : 0_3 , upvalues : isLevelGuideUse
  if not isLevelGuideUse then
    return 
  end
  if isFlushedUI() then
    return 
  end
  local seflPlayer = getSelfPlayer()
  if seflPlayer == nil then
    HandleClicked_LevelupGuide_Close()
    return 
  end
  local regionInfo = getRegionInfoByPosition((seflPlayer:get()):getPosition())
  local isSafeZone = (regionInfo:get()):isSafeZone()
  if not isSafeZone then
    HandleClicked_LevelupGuide_Close()
    return 
  end
  local inMyLevel = (seflPlayer:get()):getLevel()
  local tempWrapper = getTemporaryInformationWrapper()
  -- DECOMPILER ERROR at PC48: Unhandled construct in 'MakeBoolean' P1

  if tempWrapper:isEventBeforeShow() and (inMyLevel == 50 or inMyLevel == 51 or inMyLevel == 52) then
    FGlobal_LevelupGuide_Open()
  end
  HandleClicked_LevelupGuide_Close()
end

LevelupGuide_LevelUpCheck = function()
  -- function num : 0_4
  local seflPlayer = getSelfPlayer()
  if seflPlayer == nil then
    HandleClicked_LevelupGuide_Close()
    return 
  end
  if isFlushedUI() then
    return 
  end
  local regionInfo = getRegionInfoByPosition((seflPlayer:get()):getPosition())
  local isSafeZone = (regionInfo:get()):isSafeZone()
  if not isSafeZone then
    HandleClicked_LevelupGuide_Close()
    return 
  end
  local inMyLevel = (seflPlayer:get()):getLevel()
  if inMyLevel ~= 50 and inMyLevel ~= 51 and inMyLevel ~= 52 then
    return 
  end
  FGlobal_LevelupGuide_Open(true)
end

FGlobal_LevelupGuide_Open = function(isLevelUp)
  -- function num : 0_5 , upvalues : isLevelGuideUse, _Web
  if not isLevelGuideUse then
    return 
  end
  if isFlushedUI() then
    return 
  end
  if Panel_Window_DailyStamp:GetShow() and not isGameTypeEnglish() then
    FGlobal_LevelupGuide_PowerClose()
    return 
  end
  local seflPlayer = getSelfPlayer()
  if seflPlayer == nil then
    HandleClicked_LevelupGuide_Close()
    return 
  end
  local regionInfo = getRegionInfoByPosition((seflPlayer:get()):getPosition())
  local isSafeZone = (regionInfo:get()):isSafeZone()
  if not isSafeZone then
    HandleClicked_LevelupGuide_Close()
    return 
  end
  local inMyLevel = (seflPlayer:get()):getLevel()
  if inMyLevel ~= 50 and inMyLevel ~= 51 and inMyLevel ~= 52 then
    return 
  end
  local _year = ToClient_GetThisYear()
  local _month = ToClient_GetThisMonth()
  local _day = ToClient_GetToday()
  local dayCheck = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListTime((CppEnums.GlobalUIOptionType).LevelUpGuideDayCheck)
  if dayCheck ~= nil then
    local savedYear = dayCheck:GetYear()
    local savedMonth = dayCheck:GetMonth()
    local savedDay = dayCheck:GetDay()
    if _year == savedYear and _month == savedMonth and _day == savedDay and isLevelUp == nil then
      return 
    end
  end
  do
    local url = nil
    local temporaryWrapper = getTemporaryInformationWrapper()
    local worldNo = temporaryWrapper:getSelectedWorldServerNo()
    if (CppEnums.CountryType).DEV == getGameServiceType() then
      url = PAGetString(Defines.StringSheet_GAME, "LUA_LEVELUPGUIDE_URL_KOR_DEV")
    else
      if (CppEnums.CountryType).KOR_ALPHA == getGameServiceType() then
        url = PAGetString(Defines.StringSheet_GAME, "LUA_LEVELUPGUIDE_URL_KOR_ALPHA")
      else
        if (CppEnums.CountryType).KOR_REAL == getGameServiceType() then
          url = PAGetString(Defines.StringSheet_GAME, "LUA_LEVELUPGUIDE_URL_KOR_REAL")
        else
          if (CppEnums.CountryType).NA_ALPHA == getGameServiceType() then
            if getServiceNationType() == 0 then
              url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_LEVELUPGUIDE_URL_NA_ALPHA_NA", "port", worldNo)
            else
              if getServiceNationType() == 1 then
                url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_LEVELUPGUIDE_URL_NA_ALPHA_EU", "port", worldNo)
              end
            end
          else
            if (CppEnums.CountryType).NA_REAL == getGameServiceType() then
              if getServiceNationType() == 0 then
                url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_LEVELUPGUIDE_URL_NA_REAL_NA", "port", worldNo)
              else
                if getServiceNationType() == 1 then
                  url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_LEVELUPGUIDE_URL_NA_REAL_EU", "port", worldNo)
                end
              end
            else
              if (CppEnums.CountryType).JPN_ALPHA == getGameServiceType() then
                url = PAGetString(Defines.StringSheet_GAME, "LUA_LEVELUPGUIDE_URL_JP_ALPHA")
              else
                if (CppEnums.CountryType).JPN_REAL == getGameServiceType() then
                  url = PAGetString(Defines.StringSheet_GAME, "LUA_LEVELUPGUIDE_URL_JP_REAL")
                else
                  if (CppEnums.CountryType).RUS_ALPHA == getGameServiceType() then
                    url = PAGetString(Defines.StringSheet_GAME, "LUA_LEVELUPGUIDE_URL_RUS_ALPHA")
                  else
                    if (CppEnums.CountryType).RUS_REAL == getGameServiceType() then
                      if isServerFixedCharge() then
                        url = PAGetString(Defines.StringSheet_GAME, "LUA_LEVELUPGUIDE_URL_RUS_REAL_F2P")
                      else
                        url = PAGetString(Defines.StringSheet_GAME, "LUA_LEVELUPGUIDE_URL_RUS_REAL_P2P")
                      end
                    else
                      if (CppEnums.CountryType).TW_ALPHA == getGameServiceType() then
                        url = PAGetString(Defines.StringSheet_GAME, "LUA_LEVELUPGUIDE_URL_TW_ALPHA")
                      else
                        if (CppEnums.CountryType).TW_REAL == getGameServiceType() then
                          url = PAGetString(Defines.StringSheet_GAME, "LUA_LEVELUPGUIDE_URL_TW_REAL")
                        else
                          if (CppEnums.CountryType).SA_ALPHA == getGameServiceType() then
                            url = PAGetString(Defines.StringSheet_GAME, "LUA_LEVELUPGUIDE_URL_SA_ALPHA")
                          else
                            if (CppEnums.CountryType).SA_REAL == getGameServiceType() then
                              url = PAGetString(Defines.StringSheet_GAME, "LUA_LEVELUPGUIDE_URL_SA_REAL")
                            else
                              if (CppEnums.CountryType).KR2_ALPHA == getGameServiceType() then
                                url = PAGetString(Defines.StringSheet_GAME, "LUA_LEVELUPGUIDE_URL_KR2_ALPHA")
                              else
                                if (CppEnums.CountryType).KR2_REAL == getGameServiceType() then
                                  url = PAGetString(Defines.StringSheet_GAME, "LUA_LEVELUPGUIDE_URL_KR2_REAL")
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    url = url .. "?level=" .. inMyLevel
    Panel_LevelupGuide:SetShow(true, true)
    _Web:SetSize(890, 655)
    _Web:SetUrl(890, 655, url, false, true)
    _Web:SetIME(false)
  end
end

LevelupGuide_CheckForDay = function()
  -- function num : 0_6
  local _year = ToClient_GetThisYear()
  local _month = ToClient_GetThisMonth()
  local _day = ToClient_GetToday()
  ;
  (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListTime((CppEnums.GlobalUIOptionType).LevelUpGuideDayCheck, _year, _month, _day, 0, 0, 0)
  Panel_LevelupGuide:SetShow(false, false)
end

HandleClicked_LevelupGuide_Close = function()
  -- function num : 0_7 , upvalues : _Web
  if not Panel_LevelupGuide:GetShow() then
    return 
  end
  Panel_LevelupGuide:SetShow(false, false)
  _Web:ResetUrl()
end

FGlobal_LevelupGuide_PowerClose = function()
  -- function num : 0_8 , upvalues : _Web
  Panel_LevelupGuide:SetShow(false, false)
  _Web:ResetUrl()
end

LevelupGuide_OpenCheck()
registerEvent("EventSelfPlayerLevelUp", "LevelupGuide_LevelUpCheck")

