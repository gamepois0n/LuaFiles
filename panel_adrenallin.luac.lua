-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\mainstatus\panel_adrenallin.luac 

-- params : ...
-- function num : 0
Panel_Adrenallin:SetShow(false)
local ui = {_adCircleProgress = (UI.getChildControl)(Panel_Adrenallin, "CircularProgress_Adrenallin"), _txt_Adrenallin = (UI.getChildControl)(Panel_Adrenallin, "StaticText_AdPercent")}
local _close_Adrenallin = (UI.getChildControl)(Panel_Adrenallin, "Button_Win_Close")
_close_Adrenallin:SetShow(false)
local prevAdrenallin = 0
adrenallin_Update = function()
  -- function num : 0_0 , upvalues : ui, prevAdrenallin
  local selfPlayer = getSelfPlayer()
  local adrenallin = selfPlayer:getAdrenalin()
  ;
  (ui._adCircleProgress):SetProgressRate(adrenallin)
  ;
  (ui._txt_Adrenallin):SetText(tostring(adrenallin) .. "%")
  if prevAdrenallin ~= adrenallin then
    FGlobal_MainStatus_FadeIn(5)
  end
  prevAdrenallin = adrenallin
end

Panel_adrenallin_EnableSimpleUI = function()
  -- function num : 0_1
  Panel_adrenallin_SetAlphaAllChild(Panel_MainStatus_User_Bar:GetAlpha())
end

Panel_adrenallin_DisableSimpleUI = function()
  -- function num : 0_2
  Panel_adrenallin_SetAlphaAllChild(1)
end

Panel_adrenallin_UpdateSimpleUI = function(fDeltaTime)
  -- function num : 0_3
  Panel_adrenallin_SetAlphaAllChild(Panel_MainStatus_User_Bar:GetAlpha())
end

Panel_adrenallin_SetAlphaAllChild = function(alphaValue)
  -- function num : 0_4 , upvalues : ui
  Panel_Adrenallin:SetAlpha(alphaValue)
  ;
  (ui._adCircleProgress):SetAlpha(alphaValue)
  ;
  (ui._txt_Adrenallin):SetFontAlpha(alphaValue)
end

registerEvent("SimpleUI_UpdatePerFrame", "Panel_adrenallin_UpdateSimpleUI")
registerEvent("EventSimpleUIEnable", "Panel_adrenallin_EnableSimpleUI")
registerEvent("EventSimpleUIDisable", "Panel_adrenallin_DisableSimpleUI")
FromClient_UpdateAdrenalin = function()
  -- function num : 0_5
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  changePositionBySever(Panel_Adrenallin, (CppEnums.PAGameUIType).PAGameUIPanel_Adrenallin, false, true, false)
  if (getSelfPlayer()):isEnableAdrenalin() then
    Panel_Adrenallin:SetShow(not isRecordMode)
    adrenallin_Update()
  end
end

FromClient_ChangeAdrenalinMode = function()
  -- function num : 0_6
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  adrenallin_Update()
  if not isLuaLoadingComplete then
    return 
  else
    if (Defines.UIMode).eUIMode_Default ~= GetUIMode() then
      return 
    end
  end
  if CppDefine.ChangeUIAndResolution == true then
    if Panel_Adrenallin:GetRelativePosX() == -1 and Panel_Adrenallin:GetRelativePosY() == -1 then
      local initPosX = getScreenSizeX() / 2 - Panel_Adrenallin:GetSizeX() / 2 + 225
      local initPosY = getScreenSizeY() - Panel_QuickSlot:GetSizeY() - 76
      Panel_Adrenallin:SetPosX(initPosX)
      Panel_Adrenallin:SetPosY(initPosY)
      changePositionBySever(Panel_Adrenallin, (CppEnums.PAGameUIType).PAGameUIPanel_Adrenallin, false, true, false)
      FGlobal_InitPanelRelativePos(Panel_Adrenallin, initPosX, initPosY)
    else
      do
        if Panel_Adrenallin:GetRelativePosX() == 0 and Panel_Adrenallin:GetRelativePosY() == 0 then
          Panel_Adrenallin:SetPosX(getScreenSizeX() / 2 - Panel_Adrenallin:GetSizeX() / 2 + 225)
          Panel_Adrenallin:SetPosY(getScreenSizeY() - Panel_QuickSlot:GetSizeY() - 76)
        else
          Panel_Adrenallin:SetPosX(getScreenSizeX() * Panel_Adrenallin:GetRelativePosX() - Panel_Adrenallin:GetSizeX() / 2)
          Panel_Adrenallin:SetPosY(getScreenSizeY() * Panel_Adrenallin:GetRelativePosY() - Panel_Adrenallin:GetSizeY() / 2)
        end
        changePositionBySever(Panel_Adrenallin, (CppEnums.PAGameUIType).PAGameUIPanel_Adrenallin, false, true, false)
        if (getSelfPlayer()):isEnableAdrenalin() then
          Panel_Adrenallin:SetShow(not isRecordMode)
        end
      end
    end
  end
end

Adrenallin_ShowSimpleToolTip = function(isShow)
  -- function num : 0_7
  name = PAGetString(Defines.StringSheet_GAME, "LUA_ADRENALLIN_TOOLTIP_TITLE")
  desc = PAGetString(Defines.StringSheet_GAME, "LUA_ADRENALLIN_TOOLTIP_DESC")
  uiControl = Panel_Adrenallin
  registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
  if isShow == true then
    TooltipSimple_Show(uiControl, name, desc)
  else
    TooltipSimple_Hide()
  end
end

Panel_Adrenallin_ChangeTexture_On = function()
  -- function num : 0_8 , upvalues : _close_Adrenallin
  Panel_Adrenallin:ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_drag.dds")
  _close_Adrenallin:SetShow(true)
end

Panel_Adrenallin_ChangeTexture_Off = function()
  -- function num : 0_9 , upvalues : _close_Adrenallin
  _close_Adrenallin:SetShow(false)
  if Panel_UIControl:IsShow() then
    Panel_Adrenallin:ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_isWidget.dds")
  else
    Panel_Adrenallin:ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_empty.dds")
  end
end

check_Adrenallin_PostEvent = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_10
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  FromClient_ChangeAdrenalinMode()
end

registerEvent("FromClient_RenderModeChangeState", "check_Adrenallin_PostEvent")
Panel_Adrenallin_OnSreenResize = function()
  -- function num : 0_11
  if CppDefine.ChangeUIAndResolution == true then
    if Panel_Adrenallin:GetRelativePosX() == -1 and Panel_Adrenallin:GetRelativePosY() == -1 then
      local initPosX = getScreenSizeX() / 2 - Panel_Adrenallin:GetSizeX() / 2 + 225
      local initPosY = getScreenSizeY() - Panel_QuickSlot:GetSizeY() - 76
      Panel_Adrenallin:SetPosX(initPosX)
      Panel_Adrenallin:SetPosY(initPosY)
      changePositionBySever(Panel_Adrenallin, (CppEnums.PAGameUIType).PAGameUIPanel_Adrenallin, false, true, false)
      FGlobal_InitPanelRelativePos(Panel_Adrenallin, initPosX, initPosY)
    else
      do
        if Panel_Adrenallin:GetRelativePosX() == 0 and Panel_Adrenallin:GetRelativePosY() == 0 then
          Panel_Adrenallin:SetPosX(getScreenSizeX() / 2 - Panel_Adrenallin:GetSizeX() / 2 + 225)
          Panel_Adrenallin:SetPosY(getScreenSizeY() - Panel_QuickSlot:GetSizeY() - 76)
        else
          Panel_Adrenallin:SetPosX(getScreenSizeX() * Panel_Adrenallin:GetRelativePosX() - Panel_Adrenallin:GetSizeX() / 2)
          Panel_Adrenallin:SetPosY(getScreenSizeY() * Panel_Adrenallin:GetRelativePosY() - Panel_Adrenallin:GetSizeY() / 2)
        end
        Panel_Adrenallin:SetPosX(getScreenSizeX() / 2 - Panel_Adrenallin:GetSizeX() / 2 + 225)
        Panel_Adrenallin:SetPosY(getScreenSizeY() - Panel_QuickSlot:GetSizeY() - 76)
        changePositionBySever(Panel_Adrenallin, (CppEnums.PAGameUIType).PAGameUIPanel_Adrenallin, false, true, false)
        if (getSelfPlayer()):isEnableAdrenalin() then
          Panel_Adrenallin:SetShow(not isRecordMode)
          FGlobal_PanelRepostionbyScreenOut(Panel_Adrenallin)
        end
      end
    end
  end
end

FromClient_UpdateAdrenalin()
FromClient_ChangeAdrenalinMode()
Panel_Adrenallin:addInputEvent("Mouse_On", "Panel_Adrenallin_ChangeTexture_On()")
Panel_Adrenallin:addInputEvent("Mouse_Out", "Panel_Adrenallin_ChangeTexture_Off()")
Panel_Adrenallin:addInputEvent("Mouse_On", "Adrenallin_ShowSimpleToolTip( true )")
Panel_Adrenallin:addInputEvent("Mouse_Out", "Adrenallin_ShowSimpleToolTip( false ) ")
Panel_Adrenallin:setTooltipEventRegistFunc("Adrenallin_ShowSimpleToolTip( true )")
registerEvent("FromClient_UpdateAdrenalin", "FromClient_UpdateAdrenalin")
registerEvent("FromClient_ChangeAdrenalinMode", "FromClient_ChangeAdrenalinMode")
registerEvent("onScreenResize", "Panel_Adrenallin_OnSreenResize")
registerEvent("FromClient_RenderModeChangeState", "Panel_Adrenallin_OnSreenResize")
Panel_Adrenallin_InitShow = function()
  -- function num : 0_12
  changePositionBySever(Panel_Adrenallin, (CppEnums.PAGameUIType).PAGameUIPanel_Adrenallin, false, true, false)
  if (getSelfPlayer()):isEnableAdrenalin() then
    Panel_Adrenallin:SetShow(not isRecordMode)
  end
end

Panel_Adrenallin_InitShow()

