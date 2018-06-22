Panel_ConsoleKeyGuide:SetShow(ToClient_isXBox())
local PaGlobal_ConsoleKeyGuide = {
  _ui = {
    [0] = UI.getChildControl(Panel_ConsoleKeyGuide, "Static_BattleBg"),
    [1] = UI.getChildControl(Panel_ConsoleKeyGuide, "Static_CommonBg"),
    [2] = UI.getChildControl(Panel_ConsoleKeyGuide, "Static_UIModeBg"),
    [3] = UI.getChildControl(Panel_ConsoleKeyGuide, "Static_CameraModeBg"),
    ["_common"] = {},
    ["_battle"] = {},
    ["_uiMode"] = {},
    ["_cameraMode"] = {}
  },
  _isChange = false,
  _beforeState = 0,
  _glowFontColor = 4278190080
}
PaGlobal_ConsoleKeyGuide._ui._common = {
  [0] = UI.getChildControl(PaGlobal_ConsoleKeyGuide._ui[1], "StaticText_Cursor"),
  UI.getChildControl(PaGlobal_ConsoleKeyGuide._ui[1], "StaticText_AutoRun"),
  UI.getChildControl(PaGlobal_ConsoleKeyGuide._ui[1], "StaticText_Cursor2"),
  UI.getChildControl(PaGlobal_ConsoleKeyGuide._ui[1], "StaticText_Camera"),
  UI.getChildControl(PaGlobal_ConsoleKeyGuide._ui[1], "StaticText_Chatting"),
  UI.getChildControl(PaGlobal_ConsoleKeyGuide._ui[1], "StaticText_Menu")
}
PaGlobal_ConsoleKeyGuide._ui._common[0]:SetShow(false)
PaGlobal_ConsoleKeyGuide._ui._battle = {
  [0] = UI.getChildControl(PaGlobal_ConsoleKeyGuide._ui[0], "StaticText_Cursor"),
  UI.getChildControl(PaGlobal_ConsoleKeyGuide._ui[0], "StaticText_Weapon"),
  UI.getChildControl(PaGlobal_ConsoleKeyGuide._ui[0], "StaticText_MainAttack"),
  UI.getChildControl(PaGlobal_ConsoleKeyGuide._ui[0], "StaticText_SubAttack"),
  UI.getChildControl(PaGlobal_ConsoleKeyGuide._ui[0], "StaticText_Kick"),
  UI.getChildControl(PaGlobal_ConsoleKeyGuide._ui[0], "StaticText_Interaction"),
  UI.getChildControl(PaGlobal_ConsoleKeyGuide._ui[0], "StaticText_Grab"),
  UI.getChildControl(PaGlobal_ConsoleKeyGuide._ui[0], "StaticText_Guard"),
  UI.getChildControl(PaGlobal_ConsoleKeyGuide._ui[0], "StaticText_Jump"),
  UI.getChildControl(PaGlobal_ConsoleKeyGuide._ui[0], "StaticText_Dash")
}
PaGlobal_ConsoleKeyGuide._ui._battle[0]:SetShow(false)
PaGlobal_ConsoleKeyGuide._ui._uiMode = {
  [0] = UI.getChildControl(PaGlobal_ConsoleKeyGuide._ui[2], "StaticText_CursorHide"),
  UI.getChildControl(PaGlobal_ConsoleKeyGuide._ui[2], "StaticText_CursorMove"),
  UI.getChildControl(PaGlobal_ConsoleKeyGuide._ui[2], "StaticText_Scroll"),
  UI.getChildControl(PaGlobal_ConsoleKeyGuide._ui[2], "StaticText_Tab"),
  UI.getChildControl(PaGlobal_ConsoleKeyGuide._ui[2], "StaticText_Select"),
  UI.getChildControl(PaGlobal_ConsoleKeyGuide._ui[2], "StaticText_Cancel"),
  UI.getChildControl(PaGlobal_ConsoleKeyGuide._ui[2], "StaticText_Use"),
  UI.getChildControl(PaGlobal_ConsoleKeyGuide._ui[2], "StaticText_Confirm")
}
PaGlobal_ConsoleKeyGuide._ui._uiMode[0]:SetShow(false)
PaGlobal_ConsoleKeyGuide._ui._uiMode[1]:SetShow(false)
PaGlobal_ConsoleKeyGuide._ui._cameraMode = {
  [0] = UI.getChildControl(PaGlobal_ConsoleKeyGuide._ui[3], "StaticText_Zoom"),
  UI.getChildControl(PaGlobal_ConsoleKeyGuide._ui[3], "StaticText_CameraMove")
}
function PaGlobal_ConsoleKeyGuide:Init()
  self:SetKeyString(__eJoyPadInputType_A, 2)
  self:SetKeyString(__eJoyPadInputType_B, 3)
  self:SetKeyString(__eJoyPadInputType_X, 4)
  self:SetKeyString(__eJoyPadInputType_Y, 5)
  self:SetKeyString(__eJoyPadInputType_LeftShoulder, 6)
  self:SetKeyString(__eJoyPadInputType_RightShoulder, 7)
  self:SetKeyString(__eJoyPadInputType_LeftTrigger, 8)
  self:SetKeyString(__eJoyPadInputType_RightTrigger, 9)
  for index = 0, #self._ui._battle do
    self:SetGlowFont(self._ui._battle[index])
  end
  for index = 0, #self._ui._common do
    self:SetGlowFont(self._ui._common[index])
  end
  for index = 0, #self._ui._uiMode do
    self:SetGlowFont(self._ui._uiMode[index])
  end
  for index = 0, #self._ui._cameraMode do
    self:SetGlowFont(self._ui._cameraMode[index])
  end
end
function PaGlobal_ConsoleKeyGuide:SetKeyString(inputType, uiIndex)
  local actionInputType = keyCustom_getPadDefineAction(inputType)
  local str = ""
  if __eActionInputType_Attack1 == actionInputType then
    str = "Main attack"
  elseif __eActionInputType_Attack2 == actionInputType then
    str = "Secondary attack"
  elseif __eActionInputType_Dash == actionInputType then
    str = "Sprint"
  elseif __eActionInputType_Jump == actionInputType then
    str = "Jump"
  elseif __eActionInputType_Interactiocn == actionInputType then
    str = "Interact"
  elseif __eActionInputType_CrouchOrSkill == actionInputType then
    str = "Block(Combat Action 2)"
  elseif __eActionInputType_GrabOrGuard == actionInputType then
    str = "Grapple(Combat Action 3)"
  elseif __eActionInputType_Kick == actionInputType then
    str = "Kick(Combat Action 1)"
  end
  self._ui._battle[uiIndex]:SetText(str)
end
function PaGlobal_ConsoleKeyGuide:SetGlowFont(control)
  control:useGlowFont(true, "BaseFont_12_Glow", self._glowFontColor)
end
function FGlobal_KeyGuideTypeCheck(deltaTime)
  if false == ToClient_isXBox() then
    return
  end
  if true == PaGlobal_QuickMenuSetting_GetShow() then
    PaGlobal_ConsoleKeyGuide:HideGuide()
    return
  end
  local currentState = ToClient_GetConsoleState()
  if currentState == _beforeState then
    return
  end
  _beforeState = currentState
  PaGlobal_ConsoleKeyGuide:SetGuide()
end
function PaGlobal_ConsoleKeyGuide:SetGuide()
  for index = 0, 3 do
    self._ui[index]:SetShow(index == _beforeState)
  end
end
function PaGlobal_ConsoleKeyGuide:HideGuide()
  for index = 0, 3 do
    self._ui[index]:SetShow(false)
  end
end
function PaGlobal_ConsoleKeyGuide_Init()
  PaGlobal_ConsoleKeyGuide:Init()
end
function PaGlobal_ConsoleKeyGuide_SetPos()
  Panel_ConsoleKeyGuide:SetPosX(getScreenSizeX() - Panel_ConsoleKeyGuide:GetSizeX())
  Panel_ConsoleKeyGuide:SetPosY(getScreenSizeY() - Panel_ConsoleKeyGuide:GetSizeY() - 50)
end
registerEvent("FromClient_luaLoadComplete", "PaGlobal_ConsoleKeyGuide_Init")
registerEvent("onScreenResize", "PaGlobal_ConsoleKeyGuide_SetPos")
