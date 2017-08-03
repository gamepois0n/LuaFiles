-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\blackspiritadventure\panel_blackspiritadventure2.luac 

-- params : ...
-- function num : 0
Panel_Window_BlackSpiritAdventure_2:SetShow(false)
Panel_Window_BlackSpiritAdventure_2:setMaskingChild(true)
Panel_Window_BlackSpiritAdventure_2:setGlassBackground(true)
Panel_Window_BlackSpiritAdventure_2:SetDragAll(true)
Panel_Window_BlackSpiritAdventure_2:RegisterShowEventFunc(true, "BlackSpiritAdventure2_ShowAni()")
Panel_Window_BlackSpiritAdventure_2:RegisterShowEventFunc(false, "BlackSpiritAdventure2_HideAni()")
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local isBlackSpiritAdventure = ToClient_IsContentsGroupOpen("277")
BlackSpiritAdventure2_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_Window_BlackSpiritAdventure_2)
  local aniInfo1 = Panel_Window_BlackSpiritAdventure_2:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.2)
  aniInfo1.AxisX = Panel_Window_BlackSpiritAdventure_2:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Window_BlackSpiritAdventure_2:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_Window_BlackSpiritAdventure_2:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.2)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Window_BlackSpiritAdventure_2:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Window_BlackSpiritAdventure_2:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

BlackSpiritAdventure2_HideAni = function()
  -- function num : 0_1
  Panel_Window_BlackSpiritAdventure_2:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_Window_BlackSpiritAdventure_2, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

local btnClose = (UI.getChildControl)(Panel_Window_BlackSpiritAdventure_2, "Button_Win_Close")
btnClose:addInputEvent("Mouse_LUp", "BlackSpirit2_Hide()")
local btnQuestion = (UI.getChildControl)(Panel_Window_BlackSpiritAdventure_2, "Button_Question")
btnQuestion:SetShow(false)
local _Web = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_Window_BlackSpiritAdventure_2, "WebControl_EventNotify_WebLink")
_Web:SetShow(true)
_Web:SetPosX(11)
_Web:SetPosY(50)
_Web:SetSize(1220, 628)
_Web:ResetUrl()
BlackSpirit2_Show = function()
  -- function num : 0_2 , upvalues : isBlackSpiritAdventure, _Web
  if isBlackSpiritAdventure then
    Panel_Window_BlackSpiritAdventure_2:SetShow(true, true)
    Panel_Window_BlackSpiritAdventure_2:SetPosX(getScreenSizeX() / 2 - Panel_Window_BlackSpiritAdventure_2:GetSizeX() / 2)
    Panel_Window_BlackSpiritAdventure_2:SetPosY(getScreenSizeY() / 2 - Panel_Window_BlackSpiritAdventure_2:GetSizeY() / 2)
  else
    return 
  end
  audioPostEvent_SystemUi(0, 22)
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local curChannelData = getCurrentChannelServerData()
  local serverNo = curChannelData._worldNo
  local myUserNo = (selfPlayer:get()):getUserNo()
  local cryptKey = (selfPlayer:get()):getWebAuthenticKeyCryptString()
  local characterNo_64 = selfPlayer:getCharacterNo_64()
  local characterName = selfPlayer:getOriginalName()
  local userNickName = selfPlayer:getUserNickname()
  local bAdventureWebUrl = blackSpirit2UrlByServiceType()
  local isNationType = "KR"
  if isGameTypeKorea() then
    isNationType = "KR"
  else
    if isGameTypeJapan() then
      isNationType = "JP"
    else
      if isGameTypeRussia() then
        isNationType = "RU"
      else
        if isGameTypeEnglish() then
          isNationType = "EN"
        else
          if isGameTypeTaiwan() then
            isNationType = "TW"
          else
            _PA_LOG("정태�\164", "새로�\180 국가 �\128입이 추가되었으니 �\180 로그�\188 발견하면 해당 담당자에�\140 알려주세�\148 �\173!!!")
            isNationType = "KR"
          end
        end
      end
    end
  end
  if bAdventureWebUrl ~= nil then
    local url = bAdventureWebUrl .. "?userNo=" .. tostring(myUserNo) .. "&certKey=" .. tostring(cryptKey) .. "&nationCode=" .. tostring(isNationType) .. "&serverNo=" .. tostring(serverNo) .. "?userId=" .. tostring(userNickName) .. "&characterName=" .. tostring(characterName) .. "&characterNo=" .. tostring(characterNo_64)
    _Web:SetUrl(1220, 628, url, false, true)
  end
end

BlackSpirit2_Hide = function()
  -- function num : 0_3 , upvalues : _Web
  Panel_Window_BlackSpiritAdventure_2:SetShow(false, false)
  _Web:ResetUrl()
end

FGlobal_BlackSpiritAdventure2_Open = function()
  -- function num : 0_4
  BlackSpirit2_Show()
end

blackSpirit2UrlByServiceType = function()
  -- function num : 0_5
  local url = nil
  local temporaryWrapper = getTemporaryInformationWrapper()
  local worldNo = temporaryWrapper:getSelectedWorldServerNo()
  if (CppEnums.CountryType).DEV == getGameServiceType() then
    url = "http://10.32.129.20/BlackSpiritAdventure"
  else
    if (CppEnums.CountryType).KOR_ALPHA == getGameServiceType() then
      url = PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRITADVENTURE2_URL_KR_ALPHA")
    else
      if (CppEnums.CountryType).KOR_REAL == getGameServiceType() then
        url = PAGetString(Defines.StringSheet_GAME, "LUA_BLACKSPIRITADVENTURE2_URL_KR_REAL")
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

BlackSpirit_PopUp_ShowIconToolTip = function(isShow)
  -- function num : 0_6
  if isShow then
    local name = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_TOOLTIP_NAME")
    local desc = ""
  else
    do
      TooltipSimple_Hide()
    end
  end
end


