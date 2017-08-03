-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\translationreport\panel_translationreport.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
Panel_TranslationReport:SetShow(false, false)
local _btn_Close = (UI.getChildControl)(Panel_TranslationReport, "Button_Close")
local _translationReportWebControl = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_TranslationReport, "WebControl_TranslationReport")
-- DECOMPILER ERROR at PC23: Confused about usage of register: R3 in 'UnsetPending'

Panel_TranslationReport.Initialize = function(self)
  -- function num : 0_0 , upvalues : _translationReportWebControl
  _translationReportWebControl:SetShow(true)
  _translationReportWebControl:SetPosX(15)
  _translationReportWebControl:SetPosY(50)
  _translationReportWebControl:SetSize(500, 500)
  _translationReportWebControl:ResetUrl()
end

-- DECOMPILER ERROR at PC27: Confused about usage of register: R3 in 'UnsetPending'

Panel_TranslationReport.Open = function(self, translationKey)
  -- function num : 0_1 , upvalues : _translationReportWebControl
  audioPostEvent_SystemUi(13, 6)
  Panel_TranslationReport:SetShow(true, true)
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local url = "http://10.32.129.20/Translation"
  local userNo = (selfPlayer:get()):getUserNo()
  local cryptKey = (selfPlayer:get()):getWebAuthenticKeyCryptString()
  local translationKey = translationKey
  local languageType = ToClient_GetLanguageType()
  url = url .. "?userNo=" .. tostring(userNo) .. "&certKey=" .. tostring(cryptKey) .. "&translationKey=" .. tostring(translationKey) .. "&languageType=" .. tostring(languageType)
  _translationReportWebControl:SetUrl(500, 500, url, false, true)
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

FromClient_TranslationReport = function(translationKey)
  -- function num : 0_3
  _PA_LOG("장태�\132", "FromClient_TranslationReport call!! " .. tostring(translationKey))
  Panel_TranslationReport:Open(translationKey)
end

-- DECOMPILER ERROR at PC37: Confused about usage of register: R3 in 'UnsetPending'

Panel_TranslationReport.RegisterEvent = function(self)
  -- function num : 0_4 , upvalues : _btn_Close
  _btn_Close:addInputEvent("Mouse_LUp", "Panel_TranslationReport:Close()")
  registerEvent("FromClient_TranslationReport", "FromClient_TranslationReport")
end

Panel_TranslationReport:Initialize()
Panel_TranslationReport:RegisterEvent()

