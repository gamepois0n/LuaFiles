-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\movie\panel_movieskillguide_web.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
PaGlobal_MovieSkillGuide_Web = {btn_Close = (UI.getChildControl)(Panel_MovieSkillGuide_Web, "Button_Close")}
local _Web = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_MovieSkillGuide_Web, "WebControl_MovieSkillGuideWeb_WebLink")
_Web:SetShow(true)
_Web:SetPosX(12)
_Web:SetPosY(50)
_Web:SetSize(320, 430)
_Web:ResetUrl()
-- DECOMPILER ERROR at PC35: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieSkillGuide_Web.init = function(self)
  -- function num : 0_0
  (self.btn_Close):addInputEvent("Mouse_LUp", "PaGlobal_MovieSkillGuide_Web:Close()")
end

-- DECOMPILER ERROR at PC39: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieSkillGuide_Web.Open = function(self)
  -- function num : 0_1 , upvalues : _Web
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local classType = selfPlayer:getClassType()
  local movieGuideWeb = PaGlobal_MovieSkillGuide_Web:ReturnValue(classType)
  Panel_MovieSkillGuide_Web:SetPosX(getScreenSizeX() / 2 - Panel_MovieSkillGuide_Web:GetSizeX() / 2)
  Panel_MovieSkillGuide_Web:SetPosY(getScreenSizeY() / 2 - Panel_MovieSkillGuide_Web:GetSizeY() / 2)
  if movieGuideWeb ~= nil then
    local url = movieGuideWeb
    _Web:SetUrl(320, 430, url, false, true)
    Panel_MovieSkillGuide_Web:SetShow(true)
  end
end

-- DECOMPILER ERROR at PC43: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieSkillGuide_Web.Close = function(self)
  -- function num : 0_2 , upvalues : _Web
  Panel_MovieSkillGuide_Web:SetShow(false)
  _Web:ResetUrl()
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_MovieSkillGuide_Web.ReturnValue = function(self, classType)
  -- function num : 0_3
  local url = nil
  if (CppEnums.CountryType).DEV == getGameServiceType() then
    url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIESKILLGUIDEWEB_URL_KOR_DEV", "classType", classType)
  else
    if (CppEnums.CountryType).KOR_ALPHA == getGameServiceType() then
      url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIESKILLGUIDEWEB_URL_KOR_ALPHA", "classType", classType)
    else
      if (CppEnums.CountryType).KOR_REAL == getGameServiceType() then
        url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIESKILLGUIDEWEB_URL_KOR_REAL", "classType", classType)
      else
        if (CppEnums.CountryType).NA_ALPHA == getGameServiceType() then
          if getServiceNationType() == 0 then
            url = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIESKILLGUIDEWEB_URL_NA_ALPHA_NA", "port", worldNo, "classType", classType)
          else
            if getServiceNationType() == 1 then
              url = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIESKILLGUIDEWEB_URL_NA_ALPHA_EU", "port", worldNo, "classType", classType)
            end
          end
        else
          if (CppEnums.CountryType).NA_REAL == getGameServiceType() then
            if getServiceNationType() == 0 then
              url = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIESKILLGUIDEWEB_URL_NA_REAL_NA", "port", worldNo, "classType", classType)
            else
              if getServiceNationType() == 1 then
                url = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIESKILLGUIDEWEB_URL_NA_REAL_EU", "port", worldNo, "classType", classType)
              end
            end
          else
            if (CppEnums.CountryType).JPN_ALPHA == getGameServiceType() then
              url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIESKILLGUIDEWEB_URL_JP_ALPHA", "classType", classType)
            else
              if (CppEnums.CountryType).JPN_REAL == getGameServiceType() then
                url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIESKILLGUIDEWEB_URL_JP_REAL", "classType", classType)
              else
                if (CppEnums.CountryType).RUS_ALPHA == getGameServiceType() then
                  url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIESKILLGUIDEWEB_URL_RUS_ALPHA", "classType", classType)
                else
                  if (CppEnums.CountryType).RUS_REAL == getGameServiceType() then
                    if isServerFixedCharge() then
                      url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIESKILLGUIDEWEB_URL_RUS_REAL_P2P", "classType", classType)
                    else
                      url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIESKILLGUIDEWEB_URL_RUS_REAL_F2P", "classType", classType)
                    end
                  else
                    if (CppEnums.CountryType).TW_ALPHA == getGameServiceType() then
                      url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIESKILLGUIDEWEB_URL_TW_ALPHA", "classType", classType)
                    else
                      if (CppEnums.CountryType).TW_REAL == getGameServiceType() then
                        url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIESKILLGUIDEWEB_URL_TW_REAL", "classType", classType)
                      else
                        if (CppEnums.CountryType).SA_ALPHA == getGameServiceType() then
                          url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIESKILLGUIDEWEB_URL_SA_ALPHA", "classType", classType)
                        else
                          if (CppEnums.CountryType).SA_REAL == getGameServiceType() then
                            url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIESKILLGUIDEWEB_URL_SA_REAL", "classType", classType)
                          else
                            if (CppEnums.CountryType).KR2_ALPHA == getGameServiceType() then
                              url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIESKILLGUIDEWEB_URL_KR2_ALPHA", "classType", classType)
                            else
                              if (CppEnums.CountryType).KR2_REAL == getGameServiceType() then
                                url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIESKILLGUIDEWEB_URL_KR2_REAL", "classType", classType)
                              else
                                if (CppEnums.CountryType).TR_ALPHA == getGameServiceType() then
                                  url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIESKILLGUIDEWEB_URL_TR_ALPHA", "classType", classType)
                                else
                                  if (CppEnums.CountryType).TR_REAL == getGameServiceType() then
                                    url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIESKILLGUIDEWEB_URL_TR_REAL", "classType", classType)
                                  else
                                    if (CppEnums.CountryType).TH_ALPHA == getGameServiceType() then
                                      url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIESKILLGUIDEWEB_URL_TH_ALPHA", "classType", classType)
                                    else
                                      if (CppEnums.CountryType).TH_REAL == getGameServiceType() then
                                        url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIESKILLGUIDEWEB_URL_TH_REAL", "classType", classType)
                                      else
                                        if (CppEnums.CountryType).ID_ALPHA == getGameServiceType() then
                                          url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIESKILLGUIDEWEB_URL_ID_ALPHA", "classType", classType)
                                        else
                                          if (CppEnums.CountryType).ID_REAL == getGameServiceType() then
                                            url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MOVIESKILLGUIDEWEB_URL_ID_REAL", "classType", classType)
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

PaGlobal_MovieSkillGuide_Web:init()

