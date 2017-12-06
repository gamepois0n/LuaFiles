-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\movie\panel_movieguide_web.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
PaGlobal_MovieGuide_Web = {btn_Close = (UI.getChildControl)(Panel_MovieGuide_Web, "Button_Close")}
local _Web = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_MovieGuide_Web, "WebControl_MovieGuideWeb_WebLink")
_Web:SetShow(true)
_Web:SetPosX(12)
_Web:SetPosY(50)
_Web:SetSize(320, 430)
_Web:ResetUrl()
-- DECOMPILER ERROR at PC35: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieGuide_Web.init = function(self)
  -- function num : 0_0
  (self.btn_Close):addInputEvent("Mouse_LUp", "PaGlobal_MovieGuide_Web:Close()")
end

-- DECOMPILER ERROR at PC39: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieGuide_Web.Open = function(self)
  -- function num : 0_1 , upvalues : _Web
  local movieGuideWeb = PaGlobal_MovieGuide_Web:ReturnValue()
  Panel_MovieGuide_Web:SetPosX(getScreenSizeX() / 2 - Panel_MovieGuide_Web:GetSizeX() / 2)
  Panel_MovieGuide_Web:SetPosY(getScreenSizeY() / 2 - Panel_MovieGuide_Web:GetSizeY() / 2)
  if movieGuideWeb ~= nil then
    local url = movieGuideWeb
    _Web:SetUrl(320, 430, url, false, true)
    Panel_MovieGuide_Web:SetShow(true)
  end
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieGuide_Web.Close = function(self)
  -- function num : 0_2 , upvalues : _Web
  Panel_MovieGuide_Web:SetShow(false)
  _Web:ResetUrl()
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieGuide_Web.ReturnValue = function(self)
  -- function num : 0_3
  local url = nil
  local temporaryWrapper = getTemporaryInformationWrapper()
  local worldNo = temporaryWrapper:getSelectedWorldServerNo()
  if (CppEnums.CountryType).DEV == getGameServiceType() then
    url = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEB_URL_KOR_DEV")
  else
    if (CppEnums.CountryType).KOR_ALPHA == getGameServiceType() then
      url = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEB_URL_KOR_ALPHA")
    else
      if (CppEnums.CountryType).KOR_REAL == getGameServiceType() then
        url = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEB_URL_KOR_REAL")
      else
        if (CppEnums.CountryType).NA_ALPHA == getGameServiceType() then
          if getServiceNationType() == 0 then
            url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEB_URL_NA_ALPHA_NA", "port", worldNo)
          else
            if getServiceNationType() == 1 then
              url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEB_URL_NA_ALPHA_EU", "port", worldNo)
            end
          end
        else
          if (CppEnums.CountryType).NA_REAL == getGameServiceType() then
            if getServiceNationType() == 0 then
              url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEB_URL_NA_REAL_NA", "port", worldNo)
            else
              if getServiceNationType() == 1 then
                url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEB_URL_NA_REAL_EU", "port", worldNo)
              end
            end
          else
            if (CppEnums.CountryType).JPN_ALPHA == getGameServiceType() then
              url = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEB_URL_JP_ALPHA")
            else
              if (CppEnums.CountryType).JPN_REAL == getGameServiceType() then
                url = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEB_URL_JP_REAL")
              else
                if (CppEnums.CountryType).RUS_ALPHA == getGameServiceType() then
                  url = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEB_URL_RUS_ALPHA")
                else
                  if (CppEnums.CountryType).RUS_REAL == getGameServiceType() then
                    if isServerFixedCharge() then
                      url = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEB_URL_RUS_REAL_P2P")
                    else
                      url = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEB_URL_RUS_REAL_F2P")
                    end
                  else
                    if (CppEnums.CountryType).TW_ALPHA == getGameServiceType() then
                      url = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEB_URL_TW_ALPHA")
                    else
                      if (CppEnums.CountryType).TW_REAL == getGameServiceType() then
                        url = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEB_URL_TW_REAL")
                      else
                        if (CppEnums.CountryType).SA_ALPHA == getGameServiceType() then
                          url = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEB_URL_SA_ALPHA")
                        else
                          if (CppEnums.CountryType).SA_REAL == getGameServiceType() then
                            url = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEB_URL_SA_REAL")
                          else
                            if (CppEnums.CountryType).KR2_ALPHA == getGameServiceType() then
                              url = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEB_URL_KR2_ALPHA")
                            else
                              if (CppEnums.CountryType).KR2_REAL == getGameServiceType() then
                                url = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEB_URL_KR2_REAL")
                              else
                                if (CppEnums.CountryType).TR_ALPHA == getGameServiceType() then
                                  url = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEB_URL_TR_ALPHA")
                                else
                                  if (CppEnums.CountryType).TR_REAL == getGameServiceType() then
                                    url = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEB_URL_TR_REAL")
                                  else
                                    if (CppEnums.CountryType).TH_ALPHA == getGameServiceType() then
                                      url = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEB_URL_TH_ALPHA")
                                    else
                                      if (CppEnums.CountryType).TH_REAL == getGameServiceType() then
                                        url = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEB_URL_TH_REAL")
                                      else
                                        if (CppEnums.CountryType).ID_ALPHA == getGameServiceType() then
                                          url = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEB_URL_ID_ALPHA")
                                        else
                                          if (CppEnums.CountryType).ID_REAL == getGameServiceType() then
                                            url = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEB_URL_ID_REAL")
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
            end
          end
        end
      end
    end
  end
  return url
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieGuide_Web.GuideWebCodeExecute = function(self, titleName, youtubeUrl)
  -- function num : 0_4
end

PaGlobal_MovieGuide_Web:init()

