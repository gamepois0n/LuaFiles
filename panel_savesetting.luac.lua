-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\savesetting\panel_savesetting.luac 

-- params : ...
-- function num : 0
Panel_SaveSetting:SetShow(false)
Panel_SaveSetting:setMaskingChild(true)
Panel_SaveSetting:setGlassBackground(true)
Panel_SaveSetting:SetDragAll(true)
Panel_SaveSetting:RegisterShowEventFunc(true, "PaGlobal_Panel_SaveSetting_ShowAni()")
Panel_SaveSetting:RegisterShowEventFunc(false, "PaGlobal_Panel_SaveSetting_HideAni()")
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local isSaveSetting = ToClient_IsContentsGroupOpen("258")
PaGlobal_Panel_SaveSetting_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_SaveSetting)
  local aniInfo1 = Panel_SaveSetting:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.2)
  aniInfo1.AxisX = Panel_SaveSetting:GetSizeX() / 2
  aniInfo1.AxisY = Panel_SaveSetting:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_SaveSetting:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.2)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_SaveSetting:GetSizeX() / 2
  aniInfo2.AxisY = Panel_SaveSetting:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

PaGlobal_Panel_SaveSetting_HideAni = function()
  -- function num : 0_1
  Panel_SaveSetting:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_SaveSetting, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

local btnClose = (UI.getChildControl)(Panel_SaveSetting, "Button_Win_Close")
btnClose:addInputEvent("Mouse_LUp", "PaGlobal_Panel_SaveSetting_Hide()")
local btnQuestion = (UI.getChildControl)(Panel_SaveSetting, "Button_Question")
btnQuestion:SetShow(false)
local checkPopUp = (UI.getChildControl)(Panel_SaveSetting, "CheckButton_PopUp")
checkPopUp:SetShow(false)
local _Web = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_SaveSetting, "WebControl_SaveSetting")
_Web:SetShow(true)
_Web:SetHorizonCenter()
_Web:SetPosY(50)
_Web:SetSize(322, 407)
_Web:ResetUrl()
PaGlobal_Panel_SaveSetting_Show = function()
  -- function num : 0_2 , upvalues : isSaveSetting, _Web
  if isSaveSetting then
    Panel_SaveSetting:SetShow(true, true)
    Panel_SaveSetting:SetPosX(getScreenSizeX() / 2 - Panel_SaveSetting:GetSizeX() / 2)
    Panel_SaveSetting:SetPosY(getScreenSizeY() / 2 - Panel_SaveSetting:GetSizeY() / 2)
    GameOption_Cancel()
  else
    return 
  end
  local myUserNo = ((getSelfPlayer()):get()):getUserNo()
  local cryptKey = ((getSelfPlayer()):get()):getWebAuthenticKeyCryptString()
  local isSaveSettingUrlByServeceType = PaGlobal_SaveSettingUrlByServiceType()
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
  local fileName = "UserCachePack" .. getFamilyName() .. ".bdcp"
  if isSaveSettingUrlByServeceType ~= nil then
    local url = isSaveSettingUrlByServeceType .. "?userNo=" .. tostring(myUserNo) .. "&certKey=" .. tostring(cryptKey) .. "&fileName=" .. tostring(fileName)
    _Web:SetIME(false)
    _Web:SetUrl(322, 407, url, false, true)
  end
end

PaGlobal_Panel_SaveSetting_PopUp = function()
  -- function num : 0_3 , upvalues : checkPopUp
  if checkPopUp:IsCheck() then
    Panel_SaveSetting:OpenUISubApp()
  else
    Panel_SaveSetting:CloseUISubApp()
  end
  TooltipSimple_Hide()
end

PaGlobal_Panel_SaveSetting_Hide = function()
  -- function num : 0_4 , upvalues : _Web
  Panel_SaveSetting:SetShow(false, false)
  _Web:ResetUrl()
end

PaGlobal_Panel_SaveSetting_Open = function()
  -- function num : 0_5
  PaGlobal_Panel_SaveSetting_Show()
end

PaGlobal_SaveSettingUrlByServiceType = function()
  -- function num : 0_6
  local url = nil
  local temporaryWrapper = getTemporaryInformationWrapper()
  local worldNo = temporaryWrapper:getSelectedWorldServerNo()
  if (CppEnums.CountryType).DEV == getGameServiceType() then
    url = PAGetString(Defines.StringSheet_GAME, "LUA_SAVESETTING_URL_KOR_DEV")
  else
    if (CppEnums.CountryType).KOR_ALPHA == getGameServiceType() then
      url = PAGetString(Defines.StringSheet_GAME, "LUA_SAVESETTING_URL_KOR_ALPHA")
    else
      if (CppEnums.CountryType).KOR_REAL == getGameServiceType() then
        url = PAGetString(Defines.StringSheet_GAME, "LUA_SAVESETTING_URL_KOR_REAL")
      else
        if (CppEnums.CountryType).NA_ALPHA == getGameServiceType() then
          if getServiceNationType() == 0 then
            url = PAGetString(Defines.StringSheet_GAME, "LUA_SAVESETTING_URL_NA_ALPHA_NA")
          else
            if getServiceNationType() == 1 then
              url = PAGetString(Defines.StringSheet_GAME, "LUA_SAVESETTING_URL_NA_ALPHA_EU")
            end
          end
        else
          if (CppEnums.CountryType).NA_REAL == getGameServiceType() then
            if getServiceNationType() == 0 then
              url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SAVESETTING_URL_NA_REAL_NA", "port", worldNo)
            else
              if getServiceNationType() == 1 then
                url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SAVESETTING_URL_NA_REAL_EU", "port", worldNo)
              end
            end
          else
            if (CppEnums.CountryType).JPN_ALPHA == getGameServiceType() then
              url = PAGetString(Defines.StringSheet_GAME, "LUA_SAVESETTING_URL_JP_ALPHA")
            else
              if (CppEnums.CountryType).JPN_REAL == getGameServiceType() then
                url = PAGetString(Defines.StringSheet_GAME, "LUA_SAVESETTING_URL_JP_REAL")
              else
                if (CppEnums.CountryType).RUS_ALPHA == getGameServiceType() then
                  url = PAGetString(Defines.StringSheet_GAME, "LUA_SAVESETTING_URL_RUS_ALPHA")
                else
                  if (CppEnums.CountryType).RUS_REAL == getGameServiceType() then
                    if isServerFixedCharge() then
                      url = PAGetString(Defines.StringSheet_GAME, "LUA_SAVESETTING_URL_RUS_REAL_F2P")
                    else
                      url = PAGetString(Defines.StringSheet_GAME, "LUA_SAVESETTING_URL_RUS_REAL_P2P")
                    end
                  else
                    if (CppEnums.CountryType).TW_ALPHA == getGameServiceType() then
                      url = PAGetString(Defines.StringSheet_GAME, "LUA_SAVESETTING_URL_TW_ALPHA")
                    else
                      if (CppEnums.CountryType).TW_REAL == getGameServiceType() then
                        url = PAGetString(Defines.StringSheet_GAME, "LUA_SAVESETTING_URL_TW_REAL")
                      else
                        if (CppEnums.CountryType).SA_ALPHA == getGameServiceType() then
                          url = PAGetString(Defines.StringSheet_GAME, "LUA_SAVESETTING_URL_SA_ALPHA")
                        else
                          if (CppEnums.CountryType).SA_REAL == getGameServiceType() then
                            url = PAGetString(Defines.StringSheet_GAME, "LUA_SAVESETTING_URL_SA_REAL")
                          else
                            if (CppEnums.CountryType).KR2_ALPHA == getGameServiceType() then
                              url = PAGetString(Defines.StringSheet_GAME, "LUA_SAVESETTING_URL_KR2_ALPHA")
                            else
                              if (CppEnums.CountryType).KR2_REAL == getGameServiceType() then
                                url = PAGetString(Defines.StringSheet_GAME, "LUA_SAVESETTING_URL_KR2_REAL")
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
  return url
end

PaGlobal_Panel_SaveSetting_PopUp_ShowIconToolTip = function(isShow)
  -- function num : 0_7 , upvalues : checkPopUp
  if isShow then
    local name = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_TOOLTIP_NAME")
    local desc = ""
    if checkPopUp:IsCheck() then
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_CHECK_TOOLTIP")
    else
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_NOCHECK_TOOLTIP")
    end
    TooltipSimple_Show(checkPopUp, name, desc)
  else
    do
      TooltipSimple_Hide()
    end
  end
end

FromClient_OpenExplorer_SaveGameOption = function(title, defaultName, paramList)
  -- function num : 0_8 , upvalues : _Web
  local paramCount = 0
  local subNameStringBDC = ""
  for key,value in pairs(paramList) do
    if (string.sub)(value, 1, 5) ~= ".bdcp" then
      return 
    end
    subNameStringBDC = (string.sub)(value, 5, -2)
    if subNameStringBDC == "" then
      subNameStringBDC = "_"
    end
    paramCount = paramCount + 1
    if paramCount > 1 then
      return 
    end
  end
  ToClient_cacheToPackFile(_Web, getFamilyName())
end

FromClient_OnDownloadFromWeb_loadGameOption = function(path, filename)
  -- function num : 0_9
  if (string.find)(filename, ".bdcp", -5) == nil then
    return 
  end
  path = path .. filename
  ToClient_packFileToCache(path)
end

FromClient_applyGameOptionEnd = function()
  -- function num : 0_10
  chatting_sendMessage("", PAGetString(Defines.StringSheet_GAME, "LUA_SAVESETTING_APPLYCOMPLETE"), (CppEnums.ChatType).System)
  UiSet_update()
end

registerEvent("FromClient_OpenExplorer", "FromClient_OpenExplorer_SaveGameOption")
registerEvent("FromClient_OnDownloadFromWeb", "FromClient_OnDownloadFromWeb_loadGameOption")
registerEvent("FromClient_applyGameOptionEnd", "FromClient_applyGameOptionEnd")

