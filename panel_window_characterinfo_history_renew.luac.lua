-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\characterinfo\panel_window_characterinfo_history_renew.luac 

-- params : ...
-- function num : 0
local _panel = Panel_Window_CharacterInfo_History_Renew
local _mainPanel = Panel_Window_CharacterInfo_Renew
local CharacterHistoryInfo = {
_ui = {stc_MonthTapBg = (UI.getChildControl)(_panel, "Static_Month_Tap"), frame_HistoryList = (UI.getChildControl)(_panel, "Frame_Title_List"), txt_year = (UI.getChildControl)(_panel, "StaticText_Year")}
, 
_pastMonth_DayCount = {[1] = 31, [2] = 29, [3] = 31, [4] = 30, [5] = 31, [6] = 30, [7] = 31, [8] = 31, [9] = 30, [10] = 31, [11] = 30, [12] = 31}
, defaultFrameBG_CharacterInfo_History = nil}
CharacterHistoryInfo.init = function(self)
  -- function num : 0_0
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).stc_LB = (UI.getChildControl)((self._ui).stc_MonthTapBg, "Static_LT_ConsoleUI")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_RB = (UI.getChildControl)((self._ui).stc_MonthTapBg, "Static_RT_ConsoleUI")
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).radioButton_Month = {}
  for ii = 1, 12 do
    -- DECOMPILER ERROR at PC33: Confused about usage of register: R5 in 'UnsetPending'

    ((self._ui).radioButton_Month)[ii] = (UI.getChildControl)((self._ui).stc_MonthTapBg, "RadioButton_Month" .. ii)
    ;
    (((self._ui).radioButton_Month)[ii]):addInputEvent("Mouse_LUp", "InputMLUp_TapToOpenMonthHistory(" .. ii .. ")")
  end
  -- DECOMPILER ERROR at PC52: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).frame_Content = (UI.getChildControl)((self._ui).frame_HistoryList, "Frame_Content")
  -- DECOMPILER ERROR at PC60: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_Date = (UI.getChildControl)((self._ui).frame_Content, "StaticText_Date_Title")
  -- DECOMPILER ERROR at PC68: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_Line_V = (UI.getChildControl)((self._ui).frame_Content, "Static_Line_Vertical")
  -- DECOMPILER ERROR at PC76: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_Circle = (UI.getChildControl)((self._ui).frame_Content, "Static_Circle")
  -- DECOMPILER ERROR at PC84: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_Line_H = (UI.getChildControl)((self._ui).frame_Content, "Static_Line_Horizon")
  -- DECOMPILER ERROR at PC92: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_Histroy_Line = (UI.getChildControl)((self._ui).frame_Content, "StaticText_HistoryLine")
end

FromClient_luaLoadComplete_Panel_Window_CharacterInfo_History = function()
  -- function num : 0_1 , upvalues : CharacterHistoryInfo, _mainPanel, _panel
  local self = CharacterHistoryInfo
  _PA_LOG("원선", "히스토리UI")
  self:init()
  self.defaultFrameBG_CharacterInfo_History = (UI.getChildControl)(_mainPanel, "Static_HistoryInfoBg")
  ;
  (self.defaultFrameBG_CharacterInfo_History):SetShow(false)
  ;
  (self.defaultFrameBG_CharacterInfo_History):MoveChilds((self.defaultFrameBG_CharacterInfo_History):GetID(), _panel)
  deletePanel(_panel:GetID())
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_Panel_Window_CharacterInfo_History")

