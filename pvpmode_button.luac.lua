-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\mainstatus\pvpmode_button.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
Panel_PvpMode:SetShow(not isRecordMode, false)
local pvpText = (UI.getChildControl)(Panel_PvpMode, "StaticText_pvpText")
local _bubbleNotice = (UI.getChildControl)(Panel_PvpMode, "StaticText_Notice")
_pvpButton = (UI.getChildControl)(Panel_PvpMode, "CheckButton_PvpButton")
_pvpButton:addInputEvent("Mouse_LUp", "requestTogglePvP()")
Panel_PvpMode:addInputEvent("Mouse_On", "Panel_PvpMode_ChangeTexture_On()")
Panel_PvpMode:addInputEvent("Mouse_Out", "Panel_PvpMode_ChangeTexture_Off()")
Panel_PvpMode:addInputEvent("Mouse_LUp", "ResetPos_WidgetButton()")
Panel_PvpMode:SetPosX(Panel_MainStatus_User_Bar:GetPosX() - 20)
Panel_PvpMode:SetPosY(Panel_MainStatus_User_Bar:GetPosY() + Panel_MainStatus_User_Bar:GetSizeY() - 47)
posX = Panel_PvpMode:GetPosX()
posY = Panel_PvpMode:GetPosY()
local isPvPOn = true
local PvPOnCount = 0
local prePvp = false
local calculateTime = 0
Panel_PvpMode_ChangeTexture_On = function()
  -- function num : 0_0 , upvalues : pvpText
  audioPostEvent_SystemUi(0, 10)
  Panel_PvpMode:ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_drag.dds")
  pvpText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PVPMODE_UI_MOVE"))
end

Panel_PvpMode_ChangeTexture_Off = function()
  -- function num : 0_1 , upvalues : pvpText
  if Panel_UIControl:IsShow() then
    Panel_PvpMode:ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_isWidget.dds")
    pvpText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PVPMODE_UI"))
  else
    Panel_PvpMode:ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_empty.dds")
  end
end

Panel_PvpMode_EnableSimpleUI = function()
  -- function num : 0_2 , upvalues : pvpText, _bubbleNotice
  pvpText:SetAlpha(Panel_MainStatus_User_Bar:GetAlpha())
  _pvpButton:SetAlpha(Panel_MainStatus_User_Bar:GetAlpha())
  _bubbleNotice:SetAlpha(Panel_MainStatus_User_Bar:GetAlpha())
end

Panel_PvpMode_DisableSimpleUI = function()
  -- function num : 0_3 , upvalues : pvpText, _bubbleNotice
  pvpText:SetAlpha(1)
  _pvpButton:SetAlpha(1)
  _bubbleNotice:SetAlpha(1)
end

Panel_PvpMode_UpdateSimpleUI = function(fDeltaTime)
  -- function num : 0_4 , upvalues : pvpText, _bubbleNotice
  pvpText:SetAlpha(Panel_MainStatus_User_Bar:GetAlpha())
  _pvpButton:SetAlpha(Panel_MainStatus_User_Bar:GetAlpha())
  _bubbleNotice:SetAlpha(Panel_MainStatus_User_Bar:GetAlpha())
end

registerEvent("SimpleUI_UpdatePerFrame", "Panel_PvpMode_UpdateSimpleUI")
registerEvent("EventSimpleUIEnable", "Panel_PvpMode_EnableSimpleUI")
registerEvent("EventSimpleUIDisable", "Panel_PvpMode_DisableSimpleUI")
PvpModeButton_RefreshPosition = function()
  -- function num : 0_5 , upvalues : pvpText, _bubbleNotice
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R0 in 'UnsetPending'

  pvpText.posX = Panel_PvpMode:GetPosX()
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R0 in 'UnsetPending'

  pvpText.posY = Panel_PvpMode:GetPosY()
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

  _bubbleNotice.posX = Panel_PvpMode:GetPosX()
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

  _bubbleNotice.posY = Panel_PvpMode:GetPosY()
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R0 in 'UnsetPending'

  _pvpButton.posX = Panel_PvpMode:GetPosX()
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R0 in 'UnsetPending'

  _pvpButton.posY = Panel_PvpMode:GetPosY()
end

pvpMode_changedMode = function(actorKeyRaw)
  -- function num : 0_6
  FromClient_PvpMode_changeMode(nil, actorKeyRaw)
end

pvpMode_changedMode1 = function(actorKeyRaw)
  -- function num : 0_7
  if actorKeyRaw ~= nil then
    FromClient_PvpMode_changeMode(nil, actorKeyRaw)
  end
end

FromClient_PvpMode_changeMode = function(where, actorKeyRaw)
  -- function num : 0_8 , upvalues : isPvPOn
  do
    if actorKeyRaw ~= nil then
      local actorProxyWrapper = getActor(actorKeyRaw)
      if actorProxyWrapper == nil then
        return 
      end
      if not (actorProxyWrapper:get()):isSelfPlayer() then
        return 
      end
    end
    if isPvpEnable() and isFlushedUI() == false then
      PvpMode_ShowButton(true)
      if getPvPMode() then
        audioPostEvent_SystemUi(0, 9)
        audioPostEvent_SystemUi(9, 0)
        _pvpButton:EraseAllEffect()
        _pvpButton:AddEffect("fUI_SkillButton02", true, 0, 0)
        _pvpButton:AddEffect("fUI_PvPButtonLoop", true, 0, 0)
        if where == nil then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PVP_BUTTON_ON"))
        end
        isPvPOn = true
      else
        if isPvPOn then
          audioPostEvent_SystemUi(0, 11)
          _pvpButton:EraseAllEffect()
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PVP_BUTTON_OFF"))
          isPvPOn = false
        end
      end
      FGlobal_MainStatus_FadeIn(5)
      PvpMode_Resize()
    else
      PvpMode_ShowButton(false)
    end
  end
end

PvpMode_PlayerPvPAbleChanged = function(actorKeyRaw)
  -- function num : 0_9
  local selfWrapper = getSelfPlayer()
  if selfWrapper == nil then
    return 
  end
  if selfWrapper:getActorKey() == actorKeyRaw then
    FromClient_PvpMode_changeMode(selfWrapper)
  end
end

PvpMode_ShowButton = function(isShow)
  -- function num : 0_10 , upvalues : UI_ANI_ADV, UI_color
  if _pvpButton:GetShow() == isShow then
    return 
  end
  _pvpButton:ResetVertexAni()
  if isShow then
    _pvpButton:SetShow(not isRecordMode)
    local PvPModeOpen_Alpha = _pvpButton:addColorAnimation(0, 0.6, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
    PvPModeOpen_Alpha:SetStartColor(UI_color.C_00FFFFFF)
    PvPModeOpen_Alpha:SetEndColor(UI_color.C_FFFFFFFF)
    PvPModeOpen_Alpha:SetHideAtEnd(false)
  else
    do
      local PvPModeClose_Alpha = _pvpButton:addColorAnimation(0, 0.6, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
      PvPModeClose_Alpha:SetStartColor(UI_color.C_FFFFFFFF)
      PvPModeClose_Alpha:SetEndColor(UI_color.C_00FFFFFF)
      PvPModeClose_Alpha:SetHideAtEnd(true)
      PvPModeClose_Alpha:SetDisableWhileAni(true)
    end
  end
end

PvpMode_Resize = function()
  -- function num : 0_11
  if CppDefine.ChangeUIAndResolution == true then
    if Panel_PvpMode:GetRelativePosX() == -1 and Panel_PvpMode:GetRelativePosY() == -1 then
      local initPosX = Panel_MainStatus_User_Bar:GetPosX() - 20
      local initPosY = Panel_MainStatus_User_Bar:GetPosY() + Panel_MainStatus_User_Bar:GetSizeY() - 47
      Panel_PvpMode:SetPosX(initPosX)
      Panel_PvpMode:SetPosY(initPosY)
      changePositionBySever(Panel_PvpMode, (CppEnums.PAGameUIType).PAGameUIPanel_PvpMode, false, true, false)
      FGlobal_InitPanelRelativePos(Panel_PvpMode, initPosX, initPosY)
    else
      do
        if Panel_PvpMode:GetRelativePosX() == 0 and Panel_PvpMode:GetRelativePosY() == 0 then
          Panel_PvpMode:SetPosX(getScreenSizeX() / 2 - Panel_MainStatus_User_Bar:GetSizeX() / 2 - 20)
          Panel_PvpMode:SetPosY(getScreenSizeY() - Panel_QuickSlot:GetSizeY() - Panel_PvpMode:GetSizeY())
        else
          Panel_PvpMode:SetPosX(Panel_PvpMode:GetRelativePosX() * getScreenSizeX() - Panel_PvpMode:GetSizeX() / 2)
          Panel_PvpMode:SetPosY(Panel_PvpMode:GetRelativePosY() * getScreenSizeY() - Panel_PvpMode:GetSizeY() / 2)
        end
        Panel_PvpMode:SetPosX(Panel_MainStatus_User_Bar:GetPosX() - 20)
        Panel_PvpMode:SetPosY(Panel_MainStatus_User_Bar:GetPosY() + Panel_MainStatus_User_Bar:GetSizeY() - 47)
        changePositionBySever(Panel_PvpMode, (CppEnums.PAGameUIType).PAGameUIPanel_PvpMode, false, true, false)
        FGlobal_PanelRepostionbyScreenOut(Panel_PvpMode)
      end
    end
  end
end

registerEvent("EventPvPModeChanged", "pvpMode_changedMode1")
registerEvent("EventPlayerPvPAbleChanged", "PvpMode_PlayerPvPAbleChanged")
registerEvent("onScreenResize", "PvpMode_Resize")
registerEvent("FromClient_RenderModeChangeState", "PvpMode_Resize")
changePositionBySever(Panel_PvpMode, (CppEnums.PAGameUIType).PAGameUIPanel_PvpMode, true, true, false)

