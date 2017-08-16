-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\globalpreloadui.luac 

-- params : ...
-- function num : 0
local _voidCursor = (UI.getChildControl)(Panel_Cursor, "Static_Cursor")
Panel_Cursor:SetShow(true)
local mouseVisibleState = {[(CppEnums.EProcessorInputMode).eProcessorInputMode_GameMode] = false, [(CppEnums.EProcessorInputMode).eProcessorInputMode_UiMode] = true, [(CppEnums.EProcessorInputMode).eProcessorInputMode_ChattingInputMode] = true, [(CppEnums.EProcessorInputMode).eProcessorInputMode_KeyCustomizing] = true, [(CppEnums.EProcessorInputMode).eProcessorInputMode_UiModeNotInput] = true, [(CppEnums.EProcessorInputMode).eProcessorInputMode_UiControlMode] = true, [(CppEnums.EProcessorInputMode).eProcessorInputMode_Undefined] = false}
local currentModeCache = nil
local posX = -10000
local posY = -10000
ProcessorInputModeChange = function(prevMode, currentMode)
  -- function num : 0_0 , upvalues : _voidCursor, currentModeCache, posX, posY, mouseVisibleState
  _voidCursor:SetPosX(getMousePosX())
  _voidCursor:SetPosY(getMousePosY())
  if currentModeCache == nil then
    currentModeCache = currentMode
    posX = getMousePosX()
    posY = getMousePosY()
  end
  local prevVisibleState = mouseVisibleState[prevMode]
  local currentVisibleState = mouseVisibleState[currentMode]
  if currentVisibleState == nil or prevVisibleState == currentVisibleState then
    return 
  end
  if currentVisibleState then
    _voidCursor:AddEffect("UI_Mouse_Appear", false, 0, 0)
    _voidCursor:AddEffect("fUI_SkillButton03", false, 0, 0)
  else
    _voidCursor:AddEffect("UI_Mouse_Hide", false, 0, 0)
    _voidCursor:AddEffect("fUI_SkillButton01", false, 0, 0)
  end
  currentModeCache = currentVisibleState
  posX = getMousePosX()
  posY = getMousePosY()
end

CursorUIEffect_UpdateCursorPos = function()
  -- function num : 0_1 , upvalues : currentModeCache, _voidCursor, posX, posY
  if currentModeCache then
    _voidCursor:SetPosX(getMousePosX())
    _voidCursor:SetPosY(getMousePosY())
  else
    _voidCursor:SetPosX(posX)
    _voidCursor:SetPosY(posY)
  end
end

Panel_Cursor:RegisterUpdateFunc("CursorUIEffect_UpdateCursorPos")
registerEvent("EventProcessorInputModeChange", "ProcessorInputModeChange")

