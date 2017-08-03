-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\twitch\panel_twitch.luac 

-- params : ...
-- function num : 0
Panel_Twitch:SetShow(false)
PaGlobal_Twitch = {
_ui = {_btnClose = (UI.getChildControl)(Panel_Twitch, "Button_Win_Close"), _checkPopUp = (UI.getChildControl)(Panel_Twitch, "CheckButton_PopUp")}
, isPopUpContentsEnable = ToClient_IsContentsGroupOpen("240")}
-- DECOMPILER ERROR at PC26: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Twitch.Init = function(self)
  -- function num : 0_0
  ((self._ui)._btnClose):addInputEvent("Mouse_LUp", "PaGlobal_Twitch:CloseWindow()")
  ;
  ((self._ui)._checkPopUp):SetShow(false)
end

-- DECOMPILER ERROR at PC29: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Twitch.ShowWindow = function(self)
  -- function num : 0_1
  Panel_Twitch:SetShow(false)
  Panel_Twitch:SetPosX(getScreenSizeX() / 2 - Panel_Twitch:GetSizeX() / 2)
  Panel_Twitch:SetPosY(getScreenSizeY() / 2 - Panel_Twitch:GetSizeY() / 2)
  local twitchUrlReturn = PaGlobal_Twitch:TwitchUrlReturn()
  if twitchUrlReturn ~= nil then
    ToClient_OpenChargeWebPage(twitchUrlReturn, false)
  end
end

-- DECOMPILER ERROR at PC32: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Twitch.CloseWindow = function(self)
  -- function num : 0_2
  Panel_Twitch:SetShow(false, false)
end

-- DECOMPILER ERROR at PC35: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Twitch.TwitchUrlReturn = function(self)
  -- function num : 0_3
  local isNationType = "kr"
  if isGameTypeKorea() then
    isNationType = "kr"
  else
    if isGameTypeJapan() then
      isNationType = "jp"
    else
      if isGameTypeRussia() then
        isNationType = "ru"
      else
        if isGameTypeEnglish() then
          if (CppEnums.langType).PA_LT_EN == ToClient_GetLanguageType() then
            isNationType = "en"
          else
            if (CppEnums.langType).PA_LT_FR == ToClient_GetLanguageType() then
              isNationType = "fr"
            else
              if (CppEnums.langType).PA_LT_DE == ToClient_GetLanguageType() then
                isNationType = "de"
              else
                isNationType = "en"
              end
            end
          end
        else
          if isGameTypeTaiwan() then
            isNationType = "tw"
          else
            if isGameTypeSA() then
              if (CppEnums.langType).PA_LT_ES == ToClient_GetLanguageType() then
                isNationType = "es"
              else
                if (CppEnums.langType).PA_LT_PT == ToClient_GetLanguageType() then
                  isNationType = "pt"
                else
                  isNationType = "pt"
                end
              end
            else
              _PA_LOG("정태�\164", "새로�\180 국가 �\128입이 추가되었으니 �\180 로그�\188 발견하면 해당 담당자에�\140 알려주세�\148 �\173!!!")
              isNationType = "kr"
            end
          end
        end
      end
    end
  end
  local url = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TWITCH_DOMAIN_LINK", "nation", isNationType)
  return url
end

PaGlobal_Twitch:Init()

