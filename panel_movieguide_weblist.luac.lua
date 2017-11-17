-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\movie\panel_movieguide_weblist.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
PaGlobal_MovieGuide_Weblist = {btn_Close = (UI.getChildControl)(Panel_MovieGuide_Weblist, "Button_Close"), txt_Title = (UI.getChildControl)(Panel_MovieGuide_Weblist, "StaticText_Title")}
local _Web = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_MovieGuide_Weblist, "WebControl_MovieGuideList_WebLink")
_Web:SetShow(true)
_Web:SetPosX(12)
_Web:SetPosY(50)
_Web:SetSize(640, 480)
_Web:ResetUrl()
-- DECOMPILER ERROR at PC41: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieGuide_Weblist.init = function(self)
  -- function num : 0_0
  (self.btn_Close):addInputEvent("Mouse_LUp", "PaGlobal_MovieGuide_Weblist:Close()")
end

-- DECOMPILER ERROR at PC45: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieGuide_Weblist.Open = function(self, title, youtubeURL)
  -- function num : 0_1 , upvalues : _Web
  if title ~= nil then
    (self.txt_Title):SetText(tostring(title))
  end
  local url = PaGlobal_MovieGuide_Weblist:ReturnValue(youtubeURL)
  Panel_MovieGuide_Weblist:SetPosX(getScreenSizeX() / 2 - Panel_MovieGuide_Weblist:GetSizeX() / 2)
  Panel_MovieGuide_Weblist:SetPosY(getScreenSizeY() / 2 - Panel_MovieGuide_Weblist:GetSizeY() / 2)
  if url ~= nil then
    _Web:SetUrl(640, 480, url, false, true)
  end
  Panel_MovieGuide_Weblist:SetShow(true)
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieGuide_Weblist.Close = function(self)
  -- function num : 0_2 , upvalues : _Web
  Panel_MovieGuide_Weblist:SetShow(false)
  _Web:ResetUrl()
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieGuide_Weblist.ReturnValue = function(self, youtubeURL)
  -- function num : 0_3
  local url = nil
  if (CppEnums.CountryType).DEV == getGameServiceType() then
    url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEBLIST_URL_KOR_DEV", "movieUrl", youtubeURL)
  else
    if (CppEnums.CountryType).KOR_ALPHA == getGameServiceType() then
      url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEBLIST_URL_KOR_ALPHA", "movieUrl", youtubeURL)
    else
      if (CppEnums.CountryType).KOR_REAL == getGameServiceType() then
        url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEBLIST_URL_KOR_REAL", "movieUrl", youtubeURL)
      else
        if (CppEnums.CountryType).NA_ALPHA == getGameServiceType() then
          if getServiceNationType() == 0 then
            url = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEBLIST_URL_NA_ALPHA_NA", "port", worldNo, "movieUrl", youtubeURL)
          else
            if getServiceNationType() == 1 then
              url = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEBLIST_URL_NA_ALPHA_EU", "port", worldNo, "movieUrl", youtubeURL)
            end
          end
        else
          if (CppEnums.CountryType).NA_REAL == getGameServiceType() then
            if getServiceNationType() == 0 then
              url = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEBLIST_URL_NA_REAL_NA", "port", worldNo, "movieUrl", youtubeURL)
            else
              if getServiceNationType() == 1 then
                url = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEBLIST_URL_NA_REAL_EU", "port", worldNo, "movieUrl", youtubeURL)
              end
            end
          else
            if (CppEnums.CountryType).JPN_ALPHA == getGameServiceType() then
              url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEBLIST_URL_JP_ALPHA", "movieUrl", youtubeURL)
            else
              if (CppEnums.CountryType).JPN_REAL == getGameServiceType() then
                url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEBLIST_URL_JP_REAL", "movieUrl", youtubeURL)
              else
                if (CppEnums.CountryType).RUS_ALPHA == getGameServiceType() then
                  url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEBLIST_URL_RUS_ALPHA", "movieUrl", youtubeURL)
                else
                  if (CppEnums.CountryType).RUS_REAL == getGameServiceType() then
                    if isServerFixedCharge() then
                      url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEBLIST_URL_RUS_REAL_P2P", "movieUrl", youtubeURL)
                    else
                      url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEBLIST_URL_RUS_REAL_F2P", "movieUrl", youtubeURL)
                    end
                  else
                    if (CppEnums.CountryType).TW_ALPHA == getGameServiceType() then
                      url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEBLIST_URL_TW_ALPHA", "movieUrl", youtubeURL)
                    else
                      if (CppEnums.CountryType).TW_REAL == getGameServiceType() then
                        url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEBLIST_URL_TW_REAL", "movieUrl", youtubeURL)
                      else
                        if (CppEnums.CountryType).SA_ALPHA == getGameServiceType() then
                          url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEBLIST_URL_SA_ALPHA", "movieUrl", youtubeURL)
                        else
                          if (CppEnums.CountryType).SA_REAL == getGameServiceType() then
                            url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEBLIST_URL_SA_REAL", "movieUrl", youtubeURL)
                          else
                            if (CppEnums.CountryType).KR2_ALPHA == getGameServiceType() then
                              url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEBLIST_URL_KR2_ALPHA", "movieUrl", youtubeURL)
                            else
                              if (CppEnums.CountryType).KR2_REAL == getGameServiceType() then
                                url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEBLIST_URL_KR2_REAL", "movieUrl", youtubeURL)
                              else
                                if (CppEnums.CountryType).TR_ALPHA == getGameServiceType() then
                                  url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEBLIST_URL_TR_ALPHA", "movieUrl", youtubeURL)
                                else
                                  if (CppEnums.CountryType).TR_REAL == getGameServiceType() then
                                    url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEBLIST_URL_TR_REAL", "movieUrl", youtubeURL)
                                  else
                                    if (CppEnums.CountryType).TH_ALPHA == getGameServiceType() then
                                      url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEBLIST_URL_TH_ALPHA", "movieUrl", youtubeURL)
                                    else
                                      if (CppEnums.CountryType).TH_REAL == getGameServiceType() then
                                        url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEBLIST_URL_TH_REAL", "movieUrl", youtubeURL)
                                      else
                                        if (CppEnums.CountryType).ID_ALPHA == getGameServiceType() then
                                          url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEBLIST_URL_ID_ALPHA", "movieUrl", youtubeURL)
                                        else
                                          if (CppEnums.CountryType).ID_REAL == getGameServiceType() then
                                            url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIEGUIDEWEBLIST_URL_ID_REAL", "movieUrl", youtubeURL)
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

PaGlobal_MovieGuide_Weblist:init()

