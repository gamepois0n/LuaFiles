-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\include\global_define_url.luac 

-- params : ...
-- function num : 0
PaGlobal_URL_Check = function(param1)
  -- function num : 0_0
  local url = nil
  if (CppEnums.CountryType).DEV == getGameServiceType() then
    url = "http://10.32.129.20"
  else
    if (CppEnums.CountryType).KOR_ALPHA == getGameServiceType() then
      local isAdult = ToClient_isAdultUser()
      if isAdult then
        url = "https://test.contents.black.game.daum.net:8885"
      else
        url = "https://test15.contents.black.game.daum.net:8885"
      end
    else
      do
        if (CppEnums.CountryType).KOR_REAL == getGameServiceType() then
          local isAdult = ToClient_isAdultUser()
          if isAdult then
            url = "https://live.contents.black.game.daum.net:8885"
          else
            url = "https://live15.contents.black.game.daum.net:8885"
          end
        else
          do
            if (CppEnums.CountryType).NA_ALPHA == getGameServiceType() then
              if getServiceNationType() == 0 then
                url = "https://gameweb-na980.blackdesertonline.com"
              else
                if getServiceNationType() == 1 then
                  url = "https://gameweb-eu990.blackdesertonline.com"
                end
              end
            else
              if (CppEnums.CountryType).NA_REAL == getGameServiceType() then
                if getServiceNationType() == 0 then
                  url = "https://gameweb-na" .. param1 .. ".blackdesertonline.com"
                else
                  if getServiceNationType() == 1 then
                    url = "https://gameweb-eu" .. param1 .. ".blackdesertonline.com"
                  end
                end
              else
                if (CppEnums.CountryType).JPN_ALPHA == getGameServiceType() then
                  url = "http://web-test.blackdesertonline.jp"
                else
                  if (CppEnums.CountryType).JPN_REAL == getGameServiceType() then
                    url = "https://bdoweb.pmang.jp"
                  else
                    if (CppEnums.CountryType).RUS_ALPHA == getGameServiceType() then
                      url = "https://bdoweb-qa.gamenet.ru"
                    else
                      if (CppEnums.CountryType).RUS_REAL == getGameServiceType() then
                        if isServerFixedCharge() then
                          url = "https://bdoweb-p2p.gamenet.ru"
                        else
                          url = "https://bdoweb-f2p.gamenet.ru"
                        end
                      else
                        if (CppEnums.CountryType).TW_ALPHA == getGameServiceType() then
                          url = "http://qa-game.blackdesert.com.tw"
                        else
                          if (CppEnums.CountryType).TW_REAL == getGameServiceType() then
                            url = "https://game.blackdesert.com.tw"
                          else
                            if (CppEnums.CountryType).SA_ALPHA == getGameServiceType() then
                              url = "http://blackdesert-web-qa.playredfox.com"
                            else
                              if (CppEnums.CountryType).SA_REAL == getGameServiceType() then
                                url = "https://blackdesert-web.playredfox.com"
                              else
                                if (CppEnums.CountryType).KR2_ALPHA == getGameServiceType() then
                                  url = "http://192.168.0.1"
                                else
                                  if (CppEnums.CountryType).KR2_REAL == getGameServiceType() then
                                    url = "http://192.168.0.1"
                                  else
                                    if (CppEnums.CountryType).TR_ALPHA == getGameServiceType() then
                                      url = "http://game-qa.tr.playblackdesert.com"
                                    else
                                      if (CppEnums.CountryType).TR_REAL == getGameServiceType() then
                                        url = "https://game.tr.playblackdesert.com"
                                      else
                                        if (CppEnums.CountryType).TH_ALPHA == getGameServiceType() then
                                          url = "http://game-qa.th.playblackdesert.com"
                                        else
                                          if (CppEnums.CountryType).TH_REAL == getGameServiceType() then
                                            url = "https://game.th.playblackdesert.com"
                                          else
                                            if (CppEnums.CountryType).ID_ALPHA == getGameServiceType() then
                                              url = "http://game-qa.sea.playblackdesert.com"
                                            else
                                              if (CppEnums.CountryType).ID_REAL == getGameServiceType() then
                                                url = "https://game.sea.playblackdesert.com"
                                              else
                                                _PA_LOG("정태�\164", "새로�\180 국가 �\128입입니다!!!!! global_define_url.lua �\144 �\173 추가해주세요!!!!")
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
        end
      end
    end
  end
end


