-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\lobby\panel_lobby_dataprogress.luac 

-- params : ...
-- function num : 0
Panel_DataProgress:SetShow(false)
PaGlobal_Dataprogress = {
_ui = {_static_DataProgressBG = (UI.getChildControl)(Panel_DataProgress, "Static_Bg"), _btn_Close = nil, _static_ProgressBG = nil, _progress_Download = nil}
}
-- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Dataprogress.Initialize = function(self)
  -- function num : 0_0
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui)._btn_Close = (UI.getChildControl)(Panel_DataProgress, "Button_Close")
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._static_ProgressBG = (UI.getChildControl)(Panel_DataProgress, "Static_ProgressBg")
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._progress_Download = (UI.getChildControl)(Panel_DataProgress, "Progress2_Download")
  ;
  ((self._ui)._btn_Close):addInputEvent("Mouse_LUp", "PaGlobal_Dataprogress:Close()")
  if ToClient_isDataDownloadStart() then
    PaGlobal_Dataprogress:Open()
  else
    PaGlobal_Dataprogress:Close()
  end
end

-- DECOMPILER ERROR at PC22: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Dataprogress.Update = function(self)
  -- function num : 0_1
  if ToClient_isDataDownloadStart() then
    if ToClient_isDataDownloadComplete() then
      ((self._ui)._btn_Close):SetShow(true)
    else
      ;
      ((self._ui)._progress_Download):SetProgressRate(ToClient_getDataDownloadProgress())
    end
  end
end

-- DECOMPILER ERROR at PC25: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Dataprogress.Close = function(self)
  -- function num : 0_2
  self = PaGlobal_Dataprogress
  Panel_DataProgress:SetShow(false)
  ;
  ((self._ui)._btn_Close):SetShow(false)
  ;
  ((self._ui)._static_ProgressBG):SetShow(false)
  ;
  ((self._ui)._progress_Download):SetShow(false)
end

-- DECOMPILER ERROR at PC28: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Dataprogress.Open = function(self)
  -- function num : 0_3
  self = PaGlobal_Dataprogress
  Panel_DataProgress:SetShow(true)
  ;
  ((self._ui)._btn_Close):SetShow(false)
  ;
  ((self._ui)._static_ProgressBG):SetShow(true)
  ;
  ((self._ui)._progress_Download):SetShow(true)
end

FromClient_getDataDownloadProgress = function()
  -- function num : 0_4
  ((self._ui)._progress_Download):SetProgressRate(ToClient_getDataDownloadProgress())
end

FromClient_completeDownloadProgress = function()
  -- function num : 0_5
  ((self._ui)._btn_Close):SetShow(true)
end

registerEvent("FromClient_getDataDownloadProgress", "FromClient_getDataDownloadProgress")
registerEvent("FromClient_completeDownloadProgress", "FromClient_completeDownloadProgress")

