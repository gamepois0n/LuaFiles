-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\mainstatus\panel_classresource.luac 

-- params : ...
-- function num : 0
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
Panel_ClassResource:RegisterShowEventFunc(true, "ClassResource_ShowAni()")
Panel_ClassResource:RegisterShowEventFunc(false, "ClassResource_HideAni()")
local resourceText = (UI.getChildControl)(Panel_ClassResource, "StaticText_ResourceText")
local resourceValue = (UI.getChildControl)(Panel_ClassResource, "StaticText_Count")
local phantomPopMSG = (UI.getChildControl)(Panel_ClassResource, "StaticText_PhantomPopHelp")
Panel_ClassResource:SetShow(false)
Panel_ClassResource:addInputEvent("Mouse_On", "ClassResource_ChangeTexture_On()")
Panel_ClassResource:addInputEvent("Mouse_Out", "ClassResource_ChangeTexture_Off()")
local _phantomCount_Icon = (UI.getChildControl)(Panel_ClassResource, "Static_BlackStone")
local _phantomCount_HelpText_Box = (UI.getChildControl)(Panel_ClassResource, "StaticText_PhantomHelp")
local _phantom_Effect_1stChk = false
local _phantom_Effect_2ndChk = false
local _phantom_Effect_3rdChk = false
_phantomCount_Icon:addInputEvent("Mouse_On", "PhantomCount_HelpComment( true )")
_phantomCount_Icon:addInputEvent("Mouse_Out", "PhantomCount_HelpComment( false )")
local init = function()
  -- function num : 0_0 , upvalues : resourceValue
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    Panel_ClassResource:SetShow(false)
    return 
  end
  local classType = selfPlayer:getClassType()
  if (CppEnums.ClassType).ClassType_Sorcerer == classType then
    local phantomCount = (selfPlayer:get()):getSubResourcePoint()
    Panel_ClassResource:SetShow(true)
    resourceValue:SetText("X " .. phantomCount)
  else
    do
      Panel_ClassResource:SetShow(false)
    end
  end
end

PhantomCount_HelpComment = function(_isShowPhantomHelp)
  -- function num : 0_1 , upvalues : _phantomCount_HelpText_Box
  if _isShowPhantomHelp == true then
    _phantomCount_Message = PAGetString(Defines.StringSheet_GAME, "LUA_PHANTOMCOUNT_MESSAGE")
    Panel_ClassResource:SetChildIndex(_phantomCount_HelpText_Box, 9999)
    _phantomCount_HelpText_Box:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
    _phantomCount_HelpText_Box:SetAutoResize(true)
    _phantomCount_HelpText_Box:SetText(_phantomCount_Message)
    _phantomCount_HelpText_Box:SetPosX(getMousePosX() - Panel_ClassResource:GetPosX() - 70)
    _phantomCount_HelpText_Box:SetPosY(getMousePosY() - Panel_ClassResource:GetPosY() - 90)
    _phantomCount_HelpText_Box:ComputePos()
    _phantomCount_HelpText_Box:SetSize(_phantomCount_HelpText_Box:GetSizeX(), _phantomCount_HelpText_Box:GetSizeY())
    _phantomCount_HelpText_Box:SetAlpha(0)
    _phantomCount_HelpText_Box:SetFontAlpha(0)
    ;
    (UIAni.AlphaAnimation)(1, _phantomCount_HelpText_Box, 0, 0.2)
    _phantomCount_HelpText_Box:SetShow(true)
  else
    local aniInfo = (UIAni.AlphaAnimation)(0, _phantomCount_HelpText_Box, 0, 0.2)
    aniInfo:SetHideAtEnd(true)
  end
end

ClassResource_ChangeTexture_On = function()
  -- function num : 0_2 , upvalues : resourceText
  audioPostEvent_SystemUi(0, 10)
  Panel_ClassResource:ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_drag.dds")
  resourceText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PVPMODE_UI_MOVE"))
end

ClassResource_ChangeTexture_Off = function()
  -- function num : 0_3 , upvalues : resourceText
  if Panel_UIControl:IsShow() then
    Panel_ClassResource:ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_isWidget.dds")
    resourceText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PVPMODE_UI"))
  else
    Panel_ClassResource:ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_empty.dds")
  end
end

ClassResource_ShowAni = function()
  -- function num : 0_4 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_ClassResource:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_IN)
  local ClassResourceOpen_Alpha = Panel_ClassResource:addColorAnimation(0, 0.6, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  ClassResourceOpen_Alpha:SetStartColor(UI_color.C_00FFFFFF)
  ClassResourceOpen_Alpha:SetEndColor(UI_color.C_FFFFFFFF)
  ClassResourceOpen_Alpha.IsChangeChild = true
end

ClassResource_HideAni = function()
  -- function num : 0_5 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_ClassResource:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local ClassResourceClose_Alpha = Panel_ClassResource:addColorAnimation(0, 0.6, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  ClassResourceClose_Alpha:SetStartColor(UI_color.C_FFFFFFFF)
  ClassResourceClose_Alpha:SetEndColor(UI_color.C_00FFFFFF)
  ClassResourceClose_Alpha.IsChangeChild = true
  ClassResourceClose_Alpha:SetHideAtEnd(true)
  ClassResourceClose_Alpha:SetDisableWhileAni(true)
end

ClassResource_Update = function()
  -- function num : 0_6 , upvalues : resourceValue, _phantom_Effect_1stChk, _phantomCount_Icon, _phantom_Effect_2ndChk, _phantom_Effect_3rdChk, phantomPopMSG
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local playerMp = (selfPlayer:get()):getMp()
  local playerMaxMp = (selfPlayer:get()):getMaxMp()
  local playerMpRate = playerMp / playerMaxMp * 100
  local phantomCount = (selfPlayer:get()):getSubResourcePoint()
  resourceValue:SetText("X " .. phantomCount)
  if phantomCount >= 10 and phantomCount <= 19 and _phantom_Effect_1stChk == false then
    _phantomCount_Icon:EraseAllEffect()
    _phantomCount_Icon:AddEffect("UI_Button_Hide", false, 0, 0)
    _phantom_Effect_1stChk = true
    _phantom_Effect_2ndChk = false
    _phantom_Effect_3rdChk = false
  else
    if phantomCount >= 20 and phantomCount <= 29 and _phantom_Effect_2ndChk == false then
      _phantomCount_Icon:EraseAllEffect()
      _phantomCount_Icon:AddEffect("UI_Button_Hide", false, 0, 0)
      _phantom_Effect_1stChk = false
      _phantom_Effect_2ndChk = true
      _phantom_Effect_3rdChk = false
    else
      if phantomCount == 30 and _phantom_Effect_3rdChk == false then
        _phantomCount_Icon:EraseAllEffect()
        _phantomCount_Icon:AddEffect("UI_Button_Hide", false, 0, 0)
        _phantom_Effect_1stChk = false
        _phantom_Effect_2ndChk = false
        _phantom_Effect_3rdChk = true
      else
        if phantomCount == 0 then
          _phantomCount_Icon:EraseAllEffect()
          _phantom_Effect_1stChk = false
          _phantom_Effect_2ndChk = false
          _phantom_Effect_3rdChk = false
        end
      end
    end
  end
  if phantomCount >= 10 and playerMpRate < 20 then
    phantomPopMSG:SetShow(true)
    phantomPopMSG:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CLASSRESOURCE_PHANTOMPOPMSG"))
  else
    phantomPopMSG:SetShow(false)
  end
end

Panel_ClassResource_EnableSimpleUI = function()
  -- function num : 0_7
  Panel_ClassResource_SetAlphaAllChild(Panel_MainStatus_User_Bar:GetAlpha())
end

Panel_ClassResource_DisableSimpleUI = function()
  -- function num : 0_8
  Panel_ClassResource_SetAlphaAllChild(1)
end

Panel_ClassResource_UpdateSimpleUI = function(fDeltaTime)
  -- function num : 0_9
  Panel_ClassResource_SetAlphaAllChild(Panel_MainStatus_User_Bar:GetAlpha())
end

Panel_ClassResource_SetAlphaAllChild = function(alphaValue)
  -- function num : 0_10 , upvalues : resourceText, resourceValue, _phantomCount_Icon, _phantomCount_HelpText_Box
  resourceText:SetFontAlpha(alphaValue)
  resourceValue:SetFontAlpha(alphaValue)
  _phantomCount_Icon:SetAlpha(alphaValue)
  _phantomCount_HelpText_Box:SetAlpha(alphaValue)
end

registerEvent("SimpleUI_UpdatePerFrame", "Panel_ClassResource_UpdateSimpleUI")
registerEvent("EventSimpleUIEnable", "Panel_ClassResource_EnableSimpleUI")
registerEvent("EventSimpleUIDisable", "Panel_ClassResource_DisableSimpleUI")
registerEvent("FromClient_SelfPlayerMpChanged", "ClassResource_Update")
Phantom_Locate = function()
  -- function num : 0_11 , upvalues : _phantomCount_Icon, init
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  if isFlushedUI() then
    return 
  end
  Panel_ClassResource:SetPosX(Panel_MainStatus_User_Bar:GetPosX() + _phantomCount_Icon:GetSizeX() - 5)
  Panel_ClassResource:SetPosY(Panel_MainStatus_User_Bar:GetPosY() - _phantomCount_Icon:GetSizeY() + 5)
  changePositionBySever(Panel_ClassResource, (CppEnums.PAGameUIType).PAGameUIPanel_ClassResource, true, true, false)
  init()
end

Phantom_Resize = function()
  -- function num : 0_12 , upvalues : _phantomCount_Icon, init
  Panel_ClassResource:SetPosX(Panel_MainStatus_User_Bar:GetPosX() + _phantomCount_Icon:GetSizeX() - 5)
  Panel_ClassResource:SetPosY(Panel_MainStatus_User_Bar:GetPosY() - _phantomCount_Icon:GetSizeY() + 5)
  changePositionBySever(Panel_ClassResource, (CppEnums.PAGameUIType).PAGameUIPanel_ClassResource, true, true, false)
  init()
end

Panel_ClassResource_ShowToggle = function()
  -- function num : 0_13
  if Panel_ClassResource:IsShow() then
    Panel_ClassResource:SetShow(false)
  else
    Panel_ClassResource:SetShow(true)
  end
end

renderModeChange_Phantom_Locate = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_14
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  Phantom_Locate()
end

registerEvent("FromClient_RenderModeChangeState", "renderModeChange_Phantom_Locate")
init()
Phantom_Locate()
registerEvent("subResourceChanged", "ClassResource_Update")
registerEvent("EventPlayerPvPAbleChanged", "Phantom_Locate")
registerEvent("onScreenResize", "Phantom_Resize")
Panel_ClassResource:addInputEvent("Mouse_LUp", "ResetPos_WidgetButton()")

