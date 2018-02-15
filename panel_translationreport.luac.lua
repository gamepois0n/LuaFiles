-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\translationreport\panel_translationreport.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
Panel_TranslationReport:SetShow(false, false)
local _btn_Close = (UI.getChildControl)(Panel_TranslationReport, "Button_Close")
local _translationReportWebControl = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_TranslationReport, "WebControl_TranslationReport")
-- DECOMPILER ERROR at PC23: Confused about usage of register: R3 in 'UnsetPending'

Panel_TranslationReport.init = function(self)
  -- function num : 0_0 , upvalues : _translationReportWebControl
  _translationReportWebControl:SetShow(true)
  _translationReportWebControl:SetPosX(15)
  _translationReportWebControl:SetPosY(50)
  _translationReportWebControl:SetSize(700, 610)
  _translationReportWebControl:ResetUrl()
end

-- DECOMPILER ERROR at PC27: Confused about usage of register: R3 in 'UnsetPending'

Panel_TranslationReport.Open = function(self, staticType, key1, key2, key3, textNo)
  -- function num : 0_1 , upvalues : _translationReportWebControl
  local temporaryWrapper = getTemporaryInformationWrapper()
  local worldNo = temporaryWrapper:getSelectedWorldServerNo()
  local url = PaGlobal_URL_Check(worldNo)
  local serviceType = getGameServiceType()
  if (CppEnums.CountryType).KOR_REAL == serviceType or (CppEnums.CountryType).KOR_ALPHA == serviceType then
    return 
  end
  audioPostEvent_SystemUi(13, 6)
  Panel_TranslationReport:SetShow(true, true)
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local userNo = (selfPlayer:get()):getUserNo()
  local cryptKey = (selfPlayer:get()):getWebAuthenticKeyCryptString()
  local languageType = ToClient_GetLanguageType()
  url = url .. "/Translation" .. "?userNo=" .. tostring(userNo) .. "&certKey=" .. tostring(cryptKey) .. "&translationKey1=" .. tostring(key1) .. "&translationKey2=" .. tostring(key2) .. "&translationKey3=" .. tostring(key3) .. "&textNo=" .. tostring(textNo) .. "&languageType=" .. tostring(languageType) .. "&staticType=" .. tostring(staticType)
  _translationReportWebControl:SetUrl(700, 610, url, false, true)
  _translationReportWebControl:SetIME(true)
  Panel_TranslationReport:SetPosX(getScreenSizeX() / 2 - Panel_TranslationReport:GetSizeX() / 2, getScreenSizeY() / 2 - Panel_TranslationReport:GetSizeY() / 2)
end

-- DECOMPILER ERROR at PC31: Confused about usage of register: R3 in 'UnsetPending'

Panel_TranslationReport.Close = function(self)
  -- function num : 0_2 , upvalues : _translationReportWebControl
  FGlobal_ClearCandidate()
  _translationReportWebControl:ResetUrl()
  Panel_TranslationReport:SetShow(false, false)
end

TranslationReport_Opne = function(staticType, key1, key2, key3, textNo)
  -- function num : 0_3
  Panel_TranslationReport:Open(staticType, key1, key2, key3, textNo)
end

TranslationReport_Close = function()
  -- function num : 0_4
  Panel_TranslationReport:Close()
end

-- DECOMPILER ERROR at PC39: Confused about usage of register: R3 in 'UnsetPending'

Panel_TranslationReport.RegisterEvent = function(self)
  -- function num : 0_5 , upvalues : _btn_Close
  _btn_Close:addInputEvent("Mouse_LUp", "TranslationReport_Close()")
  registerEvent("FromClient_TranslationReport", "TranslationReport_Opne")
end

Panel_TranslationReport:init()
Panel_TranslationReport:RegisterEvent()

