-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\panel_ime.luac 

-- params : ...
-- function num : 0
Panel_IME:SetShow(true, false)
Panel_IME:SetDragEnable(false)
Panel_IME:SetIgnore(true)
local updateTime = 0
local static_IntroMovie = nil
local IM = CppEnums.EProcessorInputMode
InitCandidate = function()
  -- function num : 0_0
  candidate = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_IME, "Mail_IME")
  candidate:SetIgnore(false)
  candidate:SetPosX(0)
  candidate:SetPosY(0)
  candidate:SetSize(384, 48)
  candidate:ResetUrl()
  candidate:SetShow(false, false)
end

FGlobal_SetCandidate = function()
  -- function num : 0_1
  candidate:SetUrl(384, 48, "coui://UI_Data/UI_Html/ime_candidate.html", true)
end

FGlobal_ClearCandidate = function()
  -- function num : 0_2
  candidate:ResetUrl()
end

InitCandidate()

