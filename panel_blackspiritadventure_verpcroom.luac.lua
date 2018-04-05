-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\blackspiritadventure\panel_blackspiritadventure_verpcroom.luac 

-- params : ...
-- function num : 0
Panel_Window_BlackSpiritAdventureVerPC:SetShow(false)
Panel_Window_BlackSpiritAdventureVerPC:setMaskingChild(true)
Panel_Window_BlackSpiritAdventureVerPC:setGlassBackground(true)
Panel_Window_BlackSpiritAdventureVerPC:SetDragAll(true)
Panel_Window_BlackSpiritAdventureVerPC:RegisterShowEventFunc(true, "BlackSpiritAdventureForPcroom_ShowAni()")
Panel_Window_BlackSpiritAdventureVerPC:RegisterShowEventFunc(false, "BlackSpiritAdventureForPcroom_HideAni()")
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local isDiceForPcroom = ToClient_IsContentsGroupOpen("1021")
BlackSpiritAdventureForPcroom_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_Window_BlackSpiritAdventureVerPC)
  local aniInfo1 = Panel_Window_BlackSpiritAdventureVerPC:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.2)
  aniInfo1.AxisX = Panel_Window_BlackSpiritAdventureVerPC:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Window_BlackSpiritAdventureVerPC:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_Window_BlackSpiritAdventureVerPC:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.2)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Window_BlackSpiritAdventureVerPC:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Window_BlackSpiritAdventureVerPC:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

BlackSpiritAdventureForPcroom_HideAni = function()
  -- function num : 0_1
  Panel_Window_BlackSpiritAdventureVerPC:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_Window_BlackSpiritAdventureVerPC, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

local btnClose = (UI.getChildControl)(Panel_Window_BlackSpiritAdventureVerPC, "Button_Win_Close")
btnClose:addInputEvent("Mouse_LUp", "BlackSpiritAd_For_Pcroom_Hide()")
local btnQuestion = (UI.getChildControl)(Panel_Window_BlackSpiritAdventureVerPC, "Button_Question")
btnQuestion:SetShow(false)
local _Web = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_Window_BlackSpiritAdventureVerPC, "WebControl_EventNotify_WebLink")
_Web:SetShow(true)
_Web:SetPosX(11)
_Web:SetPosY(50)
_Web:SetSize(918, 655)
_Web:ResetUrl()
BlackSpiritAd_For_Pcroom_Show = function()
  -- function num : 0_2 , upvalues : isDiceForPcroom, _Web
  if isDiceForPcroom then
    Panel_Window_BlackSpiritAdventureVerPC:SetShow(true, true)
    Panel_Window_BlackSpiritAdventureVerPC:SetPosX(getScreenSizeX() / 2 - Panel_Window_BlackSpiritAdventureVerPC:GetSizeX() / 2)
    Panel_Window_BlackSpiritAdventureVerPC:SetPosY(getScreenSizeY() / 2 - Panel_Window_BlackSpiritAdventureVerPC:GetSizeY() / 2)
  else
    return 
  end
  local myUserNo = ((getSelfPlayer()):get()):getUserNo()
  local cryptKey = ((getSelfPlayer()):get()):getWebAuthenticKeyCryptString()
  local bAdventureWebUrl = blackSpiritUrlByServiceTypeForPcroom()
  if bAdventureWebUrl ~= nil then
    local url = bAdventureWebUrl .. "?userNo=" .. tostring(myUserNo) .. "&certKey=" .. tostring(cryptKey)
    _Web:SetUrl(918, 655, url)
  end
end

BlackSpiritAd_For_Pcroom_Hide = function()
  -- function num : 0_3 , upvalues : _Web
  Panel_Window_BlackSpiritAdventureVerPC:SetShow(false, false)
  _Web:ResetUrl()
end

FGlobal_BlackSpiritAdventure_For_Pcroom_Open = function()
  -- function num : 0_4
  BlackSpiritAd_For_Pcroom_Show()
end

blackSpiritUrlByServiceTypeForPcroom = function()
  -- function num : 0_5
  local url = nil
  local temporaryWrapper = getTemporaryInformationWrapper()
  local worldNo = temporaryWrapper:getSelectedWorldServerNo()
  if (CppEnums.CountryType).DEV == getGameServiceType() then
    url = PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRITADVENTURE_PC_URL_KOR_DEV")
  else
    if (CppEnums.CountryType).KOR_ALPHA == getGameServiceType() then
      url = PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRITADVENTURE_PC_URL_KOR_ALPHA")
    else
      if (CppEnums.CountryType).KOR_REAL == getGameServiceType() then
        url = PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRITADVENTURE_PC_URL_KOR_REAL")
      else
        if (CppEnums.CountryType).NA_ALPHA == getGameServiceType() then
          if getServiceNationType() == 0 then
            url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_BLACKSPIRITADVENTURE_URL_NA_ALPHA_NA", "port", worldNo)
          else
            if getServiceNationType() == 1 then
              url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_BLACKSPIRITADVENTURE_URL_NA_ALPHA_EU", "port", worldNo)
            end
          end
        else
          if (CppEnums.CountryType).NA_REAL == getGameServiceType() then
            if getServiceNationType() == 0 then
              url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_BLACKSPIRITADVENTURE_URL_NA_REAL_NA", "port", worldNo)
            else
              if getServiceNationType() == 1 then
                url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_BLACKSPIRITADVENTURE_URL_NA_REAL_EU", "port", worldNo)
              end
            end
          else
            if (CppEnums.CountryType).JPN_ALPHA == getGameServiceType() then
              url = PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRITADVENTURE_URL_JP_ALPHA")
            else
              if (CppEnums.CountryType).JPN_REAL == getGameServiceType() then
                url = PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRITADVENTURE_URL_JP_REAL")
              else
                if (CppEnums.CountryType).RUS_ALPHA == getGameServiceType() then
                  url = PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRITADVENTURE_URL_RUS_ALPHA")
                else
                  if (CppEnums.CountryType).RUS_REAL == getGameServiceType() then
                    if isServerFixedCharge() then
                      url = PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRITADVENTURE_URL_RUS_REAL_P2P")
                    else
                      url = PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRITADVENTURE_URL_RUS_REAL_F2P")
                    end
                  else
                    if (CppEnums.CountryType).TW_ALPHA == getGameServiceType() then
                      url = PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRITADVENTURE_URL_TW_ALPHA")
                    else
                      if (CppEnums.CountryType).TW_REAL == getGameServiceType() then
                        url = PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRITADVENTURE_URL_TW_REAL")
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
  return url
end


