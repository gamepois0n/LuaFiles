local _panel = Panel_Window_DyeingMain_Renew
local renderMode = RenderModeWrapper.new(100, {
  Defines.RenderMode.eRenderMode_Dye
}, false)
local UI_BUFFTYPE = CppEnums.UserChargeType
local ENUM_EQUIP = CppEnums.EquipSlotNoClient
local CT = CppEnums.ClassType
local DyeingMain = {
  _ui = {},
  _movePosX = 0,
  _movePosY = 0,
  _isLDown = false,
  _isRDown = false
}
function FromClient_luaLoadComplete_DyeingMain_Init()
  DyeingMain:initialize()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_DyeingMain_Init")
function DyeingMain:initialize()
  _panel:RegisterUpdateFunc("PaGlobalFunc_Dyeing_UpdatePerFrame")
end
function PaGlobalFunc_Dyeing_Open()
  DyeingMain:open()
end
function DyeingMain:open()
  if isDeadInWatchingMode() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DYEOPENALERT_INDEAD"))
    return
  end
  if true == ToClient_getJoinGuildBattle() then
    return
  end
  ToClient_SaveUiInfo(false)
  if isFlushedUI() then
    return
  end
  local isShow = ToClient_DyeingManagerIsShow()
  if true == isShow then
    return
  end
  local isShowable = ToClient_DyeingManagerIsShowable()
  if false == isShowable then
    return
  end
  if false == ToClient_IsAutoLevelUp() and not IsSelfPlayerWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_DYE"))
    return
  end
  if selfPlayerIsInCompetitionArea() then
    return
  end
  if Panel_Win_System:GetShow() then
    allClearMessageData()
  end
  self._movePosX = getMousePosX()
  self._movePosY = getMousePosX()
  ToClient_DyeingManagerShow()
  ToClient_RequestSetTargetType(0)
  SetUIMode(Defines.UIMode.eUIMode_DyeNew)
  renderMode:set()
  Panel_Tooltip_Item_hideTooltip()
  _panel:SetShow(true)
  PaGlobalFunc_DyeingMenu_Open()
end
function PaGlobalFunc_Dyeing_CloseAll()
  PaGlobalFunc_DyeingTake_Close()
  PaGlobalFunc_DyeingPalette_Close()
  PaGlobalFunc_DyeingPartList_Close()
  PaGlobalFunc_Dyeing_Close()
end
function PaGlobalFunc_Dyeing_OnPadB()
  if PaGlobalFunc_DyeingRegister_GetShow() then
    PaGlobalFunc_DyeingRegister_Close()
    return
  end
  if PaGlobalFunc_DyeingTake_GetShow() then
    PaGlobalFunc_DyeingTake_Close()
    return
  end
  if PaGlobalFunc_DyeingPalette_GetShow() then
    PaGlobalFunc_DyeingPalette_Close()
    return
  end
  if PaGlobalFunc_DyeingPartList_GetShow() then
    PaGlobalFunc_DyeingPartList_Close()
    PaGlobalFunc_DyeingMenu_Open()
    return
  end
  PaGlobalFunc_DyeingMenu_Close()
  PaGlobalFunc_Dyeing_Close()
end
function PaGlobalFunc_Dyeing_Close()
  DyeingMain:close()
end
function DyeingMain:close()
  if Panel_Win_System:GetShow() then
    allClearMessageData()
    return
  end
  local isShow = ToClient_DyeingManagerHide()
  if false == isShow then
    return
  end
  if false == _panel:GetShow() then
    return
  end
  SetUIMode(Defines.UIMode.eUIMode_Default)
  renderMode:reset()
  ToClient_DyeingManagerHide()
  audioPostEvent_SystemUi(1, 23)
  Panel_Tooltip_Item_hideTooltip()
  _panel:SetShow(false)
end
function PaGlobalFunc_Dyeing_UpdatePerFrame(deltaTime)
  local self = DyeingMain
  local currentPosX = getMousePosX()
  local currentPosY = getMousePosY()
  if currentPosX == self._movePosX and currentPosY == self._movePosY then
    return
  end
  local radianAngle = (self._movePosX - currentPosX) / (getScreenSizeX() / 10)
  local cameraPitch = (currentPosY - self._movePosY) / (getScreenSizeY() / 2)
  self._movePosX = currentPosX
  self._movePosY = currentPosY
  if true == self._isLDown then
    ToClient_LearnSkillCameraSetRotation(radianAngle * 30, cameraPitch * 90)
  end
  if true == self._isRDown then
    ToClient_LearnSkillCameraSetPosition(radianAngle * 0.8, -(cameraPitch * 2))
  end
end
