-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\consolekeyguide\panel_consolekeyguide.luac 

-- params : ...
-- function num : 0
Panel_ConsoleKeyGuide:SetShow(ToClient_isXBox())
local PaGlobal_ConsoleKeyGuide = {
_ui = {[0] = (UI.getChildControl)(Panel_ConsoleKeyGuide, "Static_BattleBg"), [1] = (UI.getChildControl)(Panel_ConsoleKeyGuide, "Static_CommonBg"), [2] = (UI.getChildControl)(Panel_ConsoleKeyGuide, "Static_UIModeBg"), [3] = (UI.getChildControl)(Panel_ConsoleKeyGuide, "Static_CameraModeBg")}
, _isChange = false, _beforeState = 0}
FGlobal_KeyGuideTypeCheck = function(deltaTime)
  -- function num : 0_0 , upvalues : PaGlobal_ConsoleKeyGuide
  if ToClient_isXBox() == false then
    return 
  end
  local currentState = ToClient_GetConsoleState()
  if currentState == _beforeState then
    return 
  end
  _beforeState = currentState
  PaGlobal_ConsoleKeyGuide:SetGuide()
end

PaGlobal_ConsoleKeyGuide.SetGuide = function(self)
  -- function num : 0_1
  for index = 0, 3 do
    ((self._ui)[index]):SetShow(index == _beforeState)
  end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

PaGlobal_ConsoleKeyGuide_SetPos = function()
  -- function num : 0_2
  Panel_ConsoleKeyGuide:SetPosX(getScreenSizeX() - Panel_ConsoleKeyGuide:GetSizeX())
  Panel_ConsoleKeyGuide:SetPosY(getScreenSizeY() - Panel_ConsoleKeyGuide:GetSizeY() - 50)
end

registerEvent("FromClient_luaLoadComplete", "FGlobal_KeyGuideTypeCheck")
registerEvent("onScreenResize", "PaGlobal_ConsoleKeyGuide_SetPos")

