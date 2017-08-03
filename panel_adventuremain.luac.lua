-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\adventure\panel_adventuremain.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local IM = CppEnums.EProcessorInputMode
local isAdventureOpen = ToClient_IsContentsGroupOpen("268")
local adventureUi = {_txt_Level = (UI.getChildControl)(Panel_Widget_Adventure, "StaticText_LEVEL"), _txt_Fish = (UI.getChildControl)(Panel_Widget_Adventure, "StaticText_FISH"), _txt_HorseTrain = (UI.getChildControl)(Panel_Widget_Adventure, "StaticText_HORSETRAINNING"), _txt_Knowkledge = (UI.getChildControl)(Panel_Widget_Adventure, "StaticText_KNOWLEDGE"), _txt_Total = (UI.getChildControl)(Panel_Widget_Adventure, "StaticText_TOTAL")}
AdventureMain_Show = function()
  -- function num : 0_0 , upvalues : adventureUi
  Panel_Widget_Adventure:SetShow(true)
  ;
  (adventureUi._txt_Level):SetShow(true)
  ;
  (adventureUi._txt_Fish):SetShow(true)
  ;
  (adventureUi._txt_HorseTrain):SetShow(true)
  ;
  (adventureUi._txt_Knowkledge):SetShow(false)
  ;
  (adventureUi._txt_Total):SetShow(true)
  AdventureMain_Refresh()
end

AdventureMain_Hide = function()
  -- function num : 0_1 , upvalues : adventureUi
  Panel_Widget_Adventure:SetShow(false)
  ;
  (adventureUi._txt_Level):SetShow(false)
  ;
  (adventureUi._txt_Fish):SetShow(false)
  ;
  (adventureUi._txt_HorseTrain):SetShow(false)
  ;
  (adventureUi._txt_Total):SetShow(false)
end

AdventureMain_Refresh = function()
  -- function num : 0_2 , upvalues : adventureUi
  (adventureUi._txt_Level):SetText("LEVEL : " .. ScoreToGrade(ToClient_GetAdventureGrade(0)))
  ;
  (adventureUi._txt_Fish):SetText("FISH : " .. ScoreToGrade(ToClient_GetAdventureGrade(2)))
  ;
  (adventureUi._txt_HorseTrain):SetText("HORSE : " .. ScoreToGrade(ToClient_GetAdventureGrade(3)))
  ;
  (adventureUi._txt_Total):SetText("TOTAL : " .. ScoreToGrade(ToClient_GetAdventureGrade(3)))
end

ScoreToGrade = function(grade)
  -- function num : 0_3
  if grade == 4 then
    return "A"
  else
    if grade == 3 then
      return "B"
    else
      if grade == 2 then
        return "C"
      else
        if grade == 1 then
          return "D"
        end
      end
    end
  end
  return "F"
end


