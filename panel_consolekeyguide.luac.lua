-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\consolekeyguide\panel_consolekeyguide.luac 

-- params : ...
-- function num : 0
Panel_ConsoleKeyGuide:SetShow(ToClient_isXBox())
local PaGlobal_ConsoleKeyGuide = {
_ui = {[0] = (UI.getChildControl)(Panel_ConsoleKeyGuide, "Static_BattleBg"), [1] = (UI.getChildControl)(Panel_ConsoleKeyGuide, "Static_CommonBg"), [2] = (UI.getChildControl)(Panel_ConsoleKeyGuide, "Static_UIModeBg"), [3] = (UI.getChildControl)(Panel_ConsoleKeyGuide, "Static_CameraModeBg"), 
_common = {}
, 
_battle = {}
, 
_uiMode = {}
, 
_cameraMode = {}
}
, _isChange = false, _beforeState = 0, _glowFontColor = 4278190080}
-- DECOMPILER ERROR at PC83: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_ConsoleKeyGuide._ui)._common = {(UI.getChildControl)((PaGlobal_ConsoleKeyGuide._ui)[1], "StaticText_AutoRun"), (UI.getChildControl)((PaGlobal_ConsoleKeyGuide._ui)[1], "StaticText_Cursor2"), (UI.getChildControl)((PaGlobal_ConsoleKeyGuide._ui)[1], "StaticText_Camera"), (UI.getChildControl)((PaGlobal_ConsoleKeyGuide._ui)[1], "StaticText_Chatting"), (UI.getChildControl)((PaGlobal_ConsoleKeyGuide._ui)[1], "StaticText_Menu"); [0] = (UI.getChildControl)((PaGlobal_ConsoleKeyGuide._ui)[1], "StaticText_Cursor")}
-- DECOMPILER ERROR at PC148: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_ConsoleKeyGuide._ui)._battle = {(UI.getChildControl)((PaGlobal_ConsoleKeyGuide._ui)[0], "StaticText_Weapon"), (UI.getChildControl)((PaGlobal_ConsoleKeyGuide._ui)[0], "StaticText_MainAttack"), (UI.getChildControl)((PaGlobal_ConsoleKeyGuide._ui)[0], "StaticText_SubAttack"), (UI.getChildControl)((PaGlobal_ConsoleKeyGuide._ui)[0], "StaticText_Kick"), (UI.getChildControl)((PaGlobal_ConsoleKeyGuide._ui)[0], "StaticText_Interaction"), (UI.getChildControl)((PaGlobal_ConsoleKeyGuide._ui)[0], "StaticText_Grab"), (UI.getChildControl)((PaGlobal_ConsoleKeyGuide._ui)[0], "StaticText_Guard"), (UI.getChildControl)((PaGlobal_ConsoleKeyGuide._ui)[0], "StaticText_Jump"), (UI.getChildControl)((PaGlobal_ConsoleKeyGuide._ui)[0], "StaticText_Dash"); [0] = (UI.getChildControl)((PaGlobal_ConsoleKeyGuide._ui)[0], "StaticText_Cursor")}
-- DECOMPILER ERROR at PC201: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_ConsoleKeyGuide._ui)._uiMode = {(UI.getChildControl)((PaGlobal_ConsoleKeyGuide._ui)[2], "StaticText_CursorMove"), (UI.getChildControl)((PaGlobal_ConsoleKeyGuide._ui)[2], "StaticText_Scroll"), (UI.getChildControl)((PaGlobal_ConsoleKeyGuide._ui)[2], "StaticText_Tab"), (UI.getChildControl)((PaGlobal_ConsoleKeyGuide._ui)[2], "StaticText_Select"), (UI.getChildControl)((PaGlobal_ConsoleKeyGuide._ui)[2], "StaticText_Cancel"), (UI.getChildControl)((PaGlobal_ConsoleKeyGuide._ui)[2], "StaticText_Use"), (UI.getChildControl)((PaGlobal_ConsoleKeyGuide._ui)[2], "StaticText_Confirm"); [0] = (UI.getChildControl)((PaGlobal_ConsoleKeyGuide._ui)[2], "StaticText_CursorHide")}
-- DECOMPILER ERROR at PC218: Confused about usage of register: R1 in 'UnsetPending'

;
(PaGlobal_ConsoleKeyGuide._ui)._cameraMode = {(UI.getChildControl)((PaGlobal_ConsoleKeyGuide._ui)[3], "StaticText_CameraMove"); [0] = (UI.getChildControl)((PaGlobal_ConsoleKeyGuide._ui)[3], "StaticText_Zoom")}
PaGlobal_ConsoleKeyGuide.Init = function(self)
  -- function num : 0_0
  self:SetKeyString(__eJoyPadInputType_A, 2)
  self:SetKeyString(__eJoyPadInputType_B, 3)
  self:SetKeyString(__eJoyPadInputType_X, 4)
  self:SetKeyString(__eJoyPadInputType_Y, 5)
  self:SetKeyString(__eJoyPadInputType_LeftShoulder, 6)
  self:SetKeyString(__eJoyPadInputType_RightShoulder, 7)
  self:SetKeyString(__eJoyPadInputType_LeftTrigger, 8)
  self:SetKeyString(__eJoyPadInputType_RightTrigger, 9)
  for index = 0, #(self._ui)._battle do
    self:SetGlowFont(((self._ui)._battle)[index])
  end
  for index = 0, #(self._ui)._common do
    self:SetGlowFont(((self._ui)._common)[index])
  end
  for index = 0, #(self._ui)._uiMode do
    self:SetGlowFont(((self._ui)._uiMode)[index])
  end
  for index = 0, #(self._ui)._cameraMode do
    self:SetGlowFont(((self._ui)._cameraMode)[index])
  end
end

PaGlobal_ConsoleKeyGuide.SetKeyString = function(self, inputType, uiIndex)
  -- function num : 0_1
  local actionInputType = keyCustom_getPadDefineAction(inputType)
  local str = ""
  if __eActionInputType_Attack1 == actionInputType then
    str = "Main attack"
  else
    if __eActionInputType_Attack2 == actionInputType then
      str = "Secondary attack"
    else
      if __eActionInputType_Dash == actionInputType then
        str = "Sprint"
      else
        if __eActionInputType_Jump == actionInputType then
          str = "Jump"
        else
          if __eActionInputType_Interactiocn == actionInputType then
            str = "Interact"
          else
            if __eActionInputType_CrouchOrSkill == actionInputType then
              str = "Block(Combat Action 2)"
            else
              if __eActionInputType_GrabOrGuard == actionInputType then
                str = "Grapple(Combat Action 3)"
              else
                if __eActionInputType_Kick == actionInputType then
                  str = "Kick(Combat Action 1)"
                end
              end
            end
          end
        end
      end
    end
  end
  ;
  (((self._ui)._battle)[uiIndex]):SetText(str)
end

PaGlobal_ConsoleKeyGuide.SetGlowFont = function(self, control)
  -- function num : 0_2
  control:useGlowFont(true, "BaseFont_10_Glow", self._glowFontColor)
end

FGlobal_KeyGuideTypeCheck = function(deltaTime)
  -- function num : 0_3 , upvalues : PaGlobal_ConsoleKeyGuide
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
  -- function num : 0_4
  for index = 0, 3 do
    ((self._ui)[index]):SetShow(index == _beforeState)
  end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

PaGlobal_ConsoleKeyGuide_Init = function()
  -- function num : 0_5 , upvalues : PaGlobal_ConsoleKeyGuide
  PaGlobal_ConsoleKeyGuide:Init()
end

PaGlobal_ConsoleKeyGuide_SetPos = function()
  -- function num : 0_6
  Panel_ConsoleKeyGuide:SetPosX(getScreenSizeX() - Panel_ConsoleKeyGuide:GetSizeX())
  Panel_ConsoleKeyGuide:SetPosY(getScreenSizeY() - Panel_ConsoleKeyGuide:GetSizeY() - 50)
end

registerEvent("FromClient_luaLoadComplete", "PaGlobal_ConsoleKeyGuide_Init")
registerEvent("onScreenResize", "PaGlobal_ConsoleKeyGuide_SetPos")

