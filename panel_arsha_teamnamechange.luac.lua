-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\arsha\panel_arsha_teamnamechange.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
local UI_TM = CppEnums.TextMode
Panel_Window_ArshaTeamNameChange:SetShow(false)
local arshaTeamNameSet = {_txt_Edit_A = (UI.getChildControl)(Panel_Window_ArshaTeamNameChange, "Edit_TeamA_Name"), _txt_Edit_B = (UI.getChildControl)(Panel_Window_ArshaTeamNameChange, "Edit_TeamB_Name"), _btn_Change = (UI.getChildControl)(Panel_Window_ArshaTeamNameChange, "Button_Admin"), _btn_Close = (UI.getChildControl)(Panel_Window_ArshaTeamNameChange, "Button_Close")}
Panel_Window_TeamNameChangeControl_Init = function()
  -- function num : 0_0 , upvalues : arshaTeamNameSet
  local self = arshaTeamNameSet
  ;
  (self._btn_Change):addInputEvent("Mouse_LUp", "ArshaPvP_TeamNameChangeControl_Confirm()")
  ;
  (self._btn_Close):addInputEvent("Mouse_LUp", "FGlobal_TeamNameChangeControl_Close()")
end

ArshaPvP_TeamNameChangeControl_Confirm = function()
  -- function num : 0_1 , upvalues : arshaTeamNameSet
  local self = arshaTeamNameSet
  local nameA = (self._txt_Edit_A):GetEditText()
  local nameB = (self._txt_Edit_B):GetEditText()
  ToClient_changeTeamName(nameA, nameB)
  local teamA_Info = ToClient_GetTeamListAt(0)
  local teamB_Info = ToClient_GetTeamListAt(1)
  if teamA_Info == nil or teamB_Info == nil then
    FGlobal_TeamNameChangeControl_Close()
    return 
  end
  local teamA_Name = teamA_Info:getTeamName()
  local teamB_Name = teamB_Info:getTeamName()
  ;
  (self._txt_Edit_A):SetEditText(teamA_Name)
  ;
  (self._txt_Edit_B):SetEditText(teamB_Name)
  FGlobal_TeamNameChangeControl_Close()
end

FGlobal_ArshaNameClearFocusEdit_A = function()
  -- function num : 0_2 , upvalues : IM
  ClearFocusEdit()
  if AllowChangeInputMode() then
    if (UI.checkShowWindow)() then
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    else
      ;
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
    end
  else
    SetFocusChatting()
  end
end

FGlobal_CheckArshaNameUiEdit_A = function(targetUI)
  -- function num : 0_3 , upvalues : arshaTeamNameSet
  do
    local self = arshaTeamNameSet
    do return targetUI ~= nil and targetUI:GetKey() == (self._txt_Edit_A):GetKey() end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

FGlobal_ArshaNameClearFocusEdit_B = function()
  -- function num : 0_4 , upvalues : IM
  ClearFocusEdit()
  if AllowChangeInputMode() then
    if (UI.checkShowWindow)() then
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    else
      ;
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
    end
  else
    SetFocusChatting()
  end
end

FGlobal_CheckArshaNameUiEdit_B = function(targetUI)
  -- function num : 0_5 , upvalues : arshaTeamNameSet
  do
    local self = arshaTeamNameSet
    do return targetUI ~= nil and targetUI:GetKey() == (self._txt_Edit_B):GetKey() end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

FGlobal_TeamNameChangeControl_Open = function()
  -- function num : 0_6
  Panel_Window_ArshaTeamNameChange:SetShow(true)
end

FGlobal_TeamNameChangeControl_Close = function()
  -- function num : 0_7
  Panel_Window_ArshaTeamNameChange:SetShow(false)
end

Panel_Window_TeamNameChangeControl_Init()

