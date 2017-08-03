-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\competitiongame\panel_competitiontargetscoreset.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
local UI_TM = CppEnums.TextMode
Panel_CompetitionTargetScoreSet:SetShow(false)
local competitionTargetScoreSet = {_txt_Title = (UI.getChildControl)(Panel_CompetitionTargetScoreSet, "StaticText_Title"), _btn_Set = (UI.getChildControl)(Panel_CompetitionTargetScoreSet, "Button_Apply"), _btn_Cancel = (UI.getChildControl)(Panel_CompetitionTargetScoreSet, "Button_Cancel"), _edit_TargetScore = (UI.getChildControl)(Panel_CompetitionTargetScoreSet, "Edit_TargetScore"), _txt_Desc = (UI.getChildControl)(Panel_CompetitionTargetScoreSet, "StaticText_Desc"), _changeOptionType = 0}
CompetitionTargetScoreSet_Init = function()
  -- function num : 0_0 , upvalues : competitionTargetScoreSet
  local self = competitionTargetScoreSet
  ;
  (self._edit_TargetScore):SetEditText("0")
  ;
  (self._edit_TargetScore):addInputEvent("Mouse_LUp", "HandleClicked_CompetitionTargetScoreSet_SettingTargetScore()")
  ;
  (self._btn_Set):addInputEvent("Mouse_LUp", "CompetitionTargetScoreSet_Confirm()")
  ;
  (self._btn_Cancel):addInputEvent("Mouse_LUp", "FGlobal_CompetitionTargetScoreSet_Close()")
end

HandleClicked_CompetitionTargetScoreSet_SettingTargetScore = function()
  -- function num : 0_1 , upvalues : competitionTargetScoreSet
  local self = competitionTargetScoreSet
  local s64_maxNumber = 0
  if self._changeOptionType == 0 then
    s64_maxNumber = toInt64(0, 10)
  else
    if self._changeOptionType == 1 then
      s64_maxNumber = toInt64(0, 3600)
    else
      if self._changeOptionType == 2 then
        s64_maxNumber = toInt64(0, 65)
      else
        if self._changeOptionType == 3 then
          s64_maxNumber = toInt64(0, 5)
        else
          if self._changeOptionType == 4 then
            s64_maxNumber = toInt64(0, 60)
          end
        end
      end
    end
  end
  Panel_NumberPad_Show(true, s64_maxNumber, param, CompetitionTargetScoreSet_ConfirmFunction)
end

CompetitionTargetScoreSet_ConfirmFunction = function(inputNumber, param)
  -- function num : 0_2 , upvalues : competitionTargetScoreSet
  local self = competitionTargetScoreSet
  ;
  (self._edit_TargetScore):SetEditText(Int64toInt32(inputNumber))
end

CompetitionTargetScoreSet_Confirm = function()
  -- function num : 0_3 , upvalues : competitionTargetScoreSet
  local self = competitionTargetScoreSet
  local score_s32 = (self._edit_TargetScore):GetEditText()
  if score_s32 == nil or score_s32 == "" then
    return 
  end
  if self._changeOptionType == 0 then
    FGlobal_CompetitionGameForHost_TargetScore(score_s32)
  else
    if self._changeOptionType == 1 then
      FGlobal_CompetitionGameForHost_TimeLimit(score_s32)
    else
      if self._changeOptionType == 2 then
        FGlobal_CompetitionGameForHost_LevelLimit(score_s32)
      else
        if self._changeOptionType == 3 then
          FGlobal_CompetitionGameForHost_PartyMemberCount(score_s32)
        else
          if self._changeOptionType == 4 then
            FGlobal_CompetitionGameForHost_MaxWaitTime(score_s32)
          end
        end
      end
    end
  end
  FGlobal_CompetitionTargetScoreSet_Close()
end

FGlobal_CompetitionTargetScoreSet_Open = function(changeOptionType)
  -- function num : 0_4 , upvalues : competitionTargetScoreSet, UI_TM
  local self = competitionTargetScoreSet
  Panel_CompetitionTargetScoreSet:SetShow(true)
  self._changeOptionType = changeOptionType
  if self._changeOptionType == 0 then
    (self._txt_Title):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_TITLE_TARGETSCORE"))
    ;
    (self._edit_TargetScore):SetEditText(ToClient_GetTargetScore())
  else
    if self._changeOptionType == 1 then
      (self._txt_Title):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_TITLE_TIMELIMIT"))
      ;
      (self._edit_TargetScore):SetEditText(ToClient_CompetitionMatchTimeLimit())
    else
      if self._changeOptionType == 2 then
        (self._txt_Title):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_TITLE_LEVELLIMIT"))
        ;
        (self._edit_TargetScore):SetEditText(ToClient_GetLevelLimit())
      else
        if self._changeOptionType == 3 then
          (self._txt_Title):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITION_TITLE_PARTYMEMBERCOUNT"))
          ;
          (self._edit_TargetScore):SetEditText(ToClient_GetMaxPartyMemberCount())
        else
          if self._changeOptionType == 4 then
            (self._txt_Title):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_COMPETITIONGAME_WAITTIME_NUMBER"))
            ;
            (self._edit_TargetScore):SetEditText(ToClient_GetMaxWaitTime())
          end
        end
      end
    end
  end
  ;
  (self._txt_Desc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self._txt_Desc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMPETITIONTARGETSCORESET_DESC"))
end

FGlobal_CompetitionTargetScoreSet_Close = function()
  -- function num : 0_5
  Panel_CompetitionTargetScoreSet:SetShow(false)
end

CompetitionTargetScoreSet_Init()

