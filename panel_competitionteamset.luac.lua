-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\competitiongame\panel_competitionteamset.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
local UI_TM = CppEnums.TextMode
Panel_CompetitionTeamSet:SetShow(false)
local competitionTeamSet = {_btn_Set = (UI.getChildControl)(Panel_CompetitionTeamSet, "Button_Apply"), _btn_Cancel = (UI.getChildControl)(Panel_CompetitionTeamSet, "Button_Cancel"), _edit_Name = (UI.getChildControl)(Panel_CompetitionTeamSet, "Edit_Nickname"), _txt_Desc = (UI.getChildControl)(Panel_CompetitionTeamSet, "StaticText_Desc"), _savedIdx = -1, _savedObserver = false}
CompetitionTeamSet_Init = function()
  -- function num : 0_0 , upvalues : competitionTeamSet, UI_TM
  local self = competitionTeamSet
  ;
  (self._edit_Name):SetEditText("0")
  ;
  (self._txt_Desc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self._txt_Desc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONTEAMSET_DESC"))
  ;
  (self._edit_Name):addInputEvent("Mouse_LUp", "HandleClicked_CompetitionTeamSet_SettingTeamNo()")
  ;
  (self._btn_Set):addInputEvent("Mouse_LUp", "CompetitionTeamSet_Confirm()")
  ;
  (self._btn_Cancel):addInputEvent("Mouse_LUp", "FGlobal_CompetitionTeamSet_Close()")
end

HandleClicked_CompetitionTeamSet_SettingTeamNo = function()
  -- function num : 0_1
  local s64_maxNumber = toInt64(0, 2)
  Panel_NumberPad_Show(true, s64_maxNumber, param, CompetitionTeamSet_ConfirmFunction)
end

CompetitionTeamSet_ConfirmFunction = function(inputNumber, param)
  -- function num : 0_2 , upvalues : competitionTeamSet
  local self = competitionTeamSet
  ;
  (self._edit_Name):SetEditText(Int64toInt32(inputNumber))
end

CompetitionTeamSet_Confirm = function()
  -- function num : 0_3 , upvalues : competitionTeamSet
  local self = competitionTeamSet
  local teamNo_s32 = (self._edit_Name):GetEditText()
  if teamNo_s32 == nil or teamNo_s32 == "" then
    return 
  end
  FGlobal_CompetitionGameForHost_ChangeTeam(teamNo_s32, self._savedIdx, self._savedObserver)
  FGlobal_CompetitionTeamSet_Close()
end

FGlobal_CompetitionTeamSet_Open = function(idx, teamNo, isObserver)
  -- function num : 0_4 , upvalues : competitionTeamSet
  local self = competitionTeamSet
  self._savedIdx = idx
  self._savedObserver = isObserver
  Panel_CompetitionTeamSet:SetShow(true)
  ;
  (self._edit_Name):SetEditText(teamNo)
end

FGlobal_CompetitionTeamSet_Close = function()
  -- function num : 0_5
  Panel_CompetitionTeamSet:SetShow(false)
end

CompetitionTeamSet_Init()

