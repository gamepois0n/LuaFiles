-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\mainstatus\panel_classresource.luac 

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
Panel_ClassResource:addInputEvent("Mouse_On", "ClassResource_ChangeTexture_On()")
Panel_ClassResource:addInputEvent("Mouse_Out", "ClassResource_ChangeTexture_Off()")
local _phantomCount_Icon = (UI.getChildControl)(Panel_ClassResource, "Static_BlackStone")
local _phantomCount_HelpText_Box = (UI.getChildControl)(Panel_ClassResource, "StaticText_PhantomHelp")
local _phantom_Effect_1stChk = false
local _phantom_Effect_2ndChk = false
local _phantom_Effect_3rdChk = false
_phantomCount_Icon:addInputEvent("Mouse_On", "PhantomCount_HelpComment( true )")
_phantomCount_Icon:addInputEvent("Mouse_Out", "PhantomCount_HelpComment( false )")
local _fighterIcon = (UI.getChildControl)(Panel_ClassResource, "Static_FighterIcon")
local _fighterIcon_Point1 = (UI.getChildControl)(_fighterIcon, "Static_Point1")
local _fighterIcon_Point2 = (UI.getChildControl)(_fighterIcon, "Static_Point2")
local _fighterIcon_Point3 = (UI.getChildControl)(_fighterIcon, "Static_Point3")
_fighterIcon:addInputEvent("Mouse_On", "FighterIcon_HelpComment( true )")
_fighterIcon:addInputEvent("Mouse_Out", "FighterIcon_HelpComment( false )")
local isSorcerer = false
local isFighter = false
local init = function()
  -- function num : 0_0 , upvalues : resourceValue, _phantomCount_Icon, _fighterIcon, isSorcerer, isFighter
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    FGlobal_ClassResource_SetShowControl(false)
    return 
  end
  resourceValue:SetShow(false)
  _phantomCount_Icon:SetShow(false)
  _fighterIcon:SetShow(false)
  local classType = selfPlayer:getClassType()
  if (CppEnums.ClassType).ClassType_Sorcerer == classType then
    isSorcerer = true
    local phantomCount = (selfPlayer:get()):getSubResourcePoint()
    Panel_ClassResource:SetShow(true)
    resourceValue:SetText("X " .. phantomCount)
    resourceValue:SetShow(true)
    _phantomCount_Icon:SetShow(true)
  else
    do
      if (CppEnums.ClassType).ClassType_Combattant == classType or (CppEnums.ClassType).ClassType_CombattantWomen == classType then
        Panel_ClassResource:SetShow(true)
        _fighterIcon:SetShow(true)
        isFighter = true
      else
        FGlobal_ClassResource_SetShowControl(false)
      end
    end
  end
end

local ResizeInit = function()
  -- function num : 0_1 , upvalues : resourceValue, _phantomCount_Icon, _fighterIcon, isSorcerer, isFighter
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    FGlobal_ClassResource_SetShowControl(false)
    return 
  end
  resourceValue:SetShow(false)
  _phantomCount_Icon:SetShow(false)
  _fighterIcon:SetShow(false)
  local classType = selfPlayer:getClassType()
  if (CppEnums.ClassType).ClassType_Sorcerer == classType then
    isSorcerer = true
    local phantomCount = (selfPlayer:get()):getSubResourcePoint()
    resourceValue:SetText("X " .. phantomCount)
    Panel_ClassResource:SetShow(true)
    resourceValue:SetShow(true)
    _phantomCount_Icon:SetShow(true)
    if ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_ClassResource, 0, (CppEnums.PanelSaveType).PanelSaveType_IsSaved) > 0 then
      Panel_ClassResource:SetShow(ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_ClassResource, 0, (CppEnums.PanelSaveType).PanelSaveType_IsShow))
      if Panel_ClassResource:GetShow() == true then
        resourceValue:SetShow(true)
        _phantomCount_Icon:SetShow(true)
      else
        resourceValue:SetShow(false)
        _phantomCount_Icon:SetShow(false)
      end
    end
  else
    do
      if (CppEnums.ClassType).ClassType_Combattant == classType or (CppEnums.ClassType).ClassType_CombattantWomen == classType then
        isFighter = true
        Panel_ClassResource:SetShow(true)
        if ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_ClassResource, 0, (CppEnums.PanelSaveType).PanelSaveType_IsSaved) > 0 then
          Panel_ClassResource:SetShow(ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_ClassResource, 0, (CppEnums.PanelSaveType).PanelSaveType_IsShow))
        end
        if Panel_ClassResource:GetShow() then
          _fighterIcon:SetShow(true)
        end
      else
        FGlobal_ClassResource_SetShowControl(false)
      end
    end
  end
end

FGlobal_ClassResource_SetShowControl = function(isShow)
  -- function num : 0_2 , upvalues : resourceValue, _phantomCount_Icon, _fighterIcon
  if isShow == true then
    local selfPlayer = getSelfPlayer()
    if selfPlayer == nil then
      return 
    end
    local classType = selfPlayer:getClassType()
    if (CppEnums.ClassType).ClassType_Sorcerer == classType then
      resourceValue:SetShow(true)
      _phantomCount_Icon:SetShow(true)
    else
      if (CppEnums.ClassType).ClassType_Combattant == classType or (CppEnums.ClassType).ClassType_CombattantWomen == classType then
        _fighterIcon:SetShow(true)
      else
        _PA_ASSERT(false, "표시�\160 직업 전용 자원�\180 없는 직업입니�\164.")
      end
    end
  else
    do
      if isShow == false then
        resourceValue:SetShow(false)
        _phantomCount_Icon:SetShow(false)
        _fighterIcon:SetShow(false)
      end
    end
  end
end

PhantomCount_HelpComment = function(_isShowPhantomHelp)
  -- function num : 0_3 , upvalues : _phantomCount_HelpText_Box
  if _isShowPhantomHelp == true then
    local _phantomCount_Message = ""
    local selfPlayer = getSelfPlayer()
    if selfPlayer == nil then
      return 
    end
    local classType = selfPlayer:getClassType()
    if (CppEnums.ClassType).ClassType_Sorcerer == classType then
      _phantomCount_Message = PAGetString(Defines.StringSheet_GAME, "LUA_PHANTOMCOUNT_MESSAGE")
    else
      if (CppEnums.ClassType).ClassType_Combattant == classType or (CppEnums.ClassType).ClassType_CombattantWomen == classType then
        _phantomCount_Message = PAGetString(Defines.StringSheet_GAME, "LUA_CLASSRESOURCE_FIGHTER")
      end
    end
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
    do
      local aniInfo = (UIAni.AlphaAnimation)(0, _phantomCount_HelpText_Box, 0, 0.2)
      aniInfo:SetHideAtEnd(true)
    end
  end
end

FighterIcon_HelpComment = function(isShow)
  -- function num : 0_4 , upvalues : _fighterIcon
  if isShow == false then
    TooltipSimple_Hide()
    return 
  end
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local classType = selfPlayer:getClassType()
  if (CppEnums.ClassType).ClassType_Combattant ~= classType and (CppEnums.ClassType).ClassType_CombattantWomen ~= classType then
    return 
  end
  local control = _fighterIcon
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_CLASSRESOURCE_FIGHTERTITLE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_CLASSRESOURCE_FIGHTER")
  if (CppEnums.ClassType).ClassType_CombattantWomen == classType then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_CLASSRESOURCE_FIGHTERTITLE")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_CLASSRESOURCE_MYSTIC")
  end
  TooltipSimple_Show(control, name, desc)
end

ClassResource_ChangeTexture_On = function()
  -- function num : 0_5 , upvalues : resourceText
  audioPostEvent_SystemUi(0, 10)
  Panel_ClassResource:ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_drag.dds")
  resourceText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PVPMODE_UI_MOVE"))
end

ClassResource_ChangeTexture_Off = function()
  -- function num : 0_6 , upvalues : resourceText
  if Panel_UIControl:IsShow() then
    Panel_ClassResource:ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_isWidget.dds")
    resourceText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PVPMODE_UI"))
  else
    Panel_ClassResource:ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_empty.dds")
  end
end

ClassResource_ShowAni = function()
  -- function num : 0_7 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_ClassResource:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_IN)
  local ClassResourceOpen_Alpha = Panel_ClassResource:addColorAnimation(0, 0.6, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  ClassResourceOpen_Alpha:SetStartColor(UI_color.C_00FFFFFF)
  ClassResourceOpen_Alpha:SetEndColor(UI_color.C_FFFFFFFF)
  ClassResourceOpen_Alpha.IsChangeChild = true
end

ClassResource_HideAni = function()
  -- function num : 0_8 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_ClassResource:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local ClassResourceClose_Alpha = Panel_ClassResource:addColorAnimation(0, 0.6, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  ClassResourceClose_Alpha:SetStartColor(UI_color.C_FFFFFFFF)
  ClassResourceClose_Alpha:SetEndColor(UI_color.C_00FFFFFF)
  ClassResourceClose_Alpha.IsChangeChild = true
  ClassResourceClose_Alpha:SetHideAtEnd(true)
  ClassResourceClose_Alpha:SetDisableWhileAni(true)
end

local beforeFigherCount = -1
ClassResource_Update = function()
  -- function num : 0_9 , upvalues : isSorcerer, resourceValue, _phantom_Effect_1stChk, _phantomCount_Icon, _phantom_Effect_2ndChk, _phantom_Effect_3rdChk, phantomPopMSG, isFighter, _fighterIcon_Point1, _fighterIcon_Point2, _fighterIcon_Point3, beforeFigherCount, _fighterIcon
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local playerMp = (selfPlayer:get()):getMp()
  local playerMaxMp = (selfPlayer:get()):getMaxMp()
  local playerMpRate = playerMp / playerMaxMp * 100
  if isSorcerer then
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
  else
    do
      do
        if isFighter then
          local fighterCount = (selfPlayer:get()):getSubResourcePoint()
          _fighterIcon_Point1:SetShow(fighterCount >= 10)
          _fighterIcon_Point2:SetShow(fighterCount >= 20)
          _fighterIcon_Point3:SetShow(fighterCount >= 30)
          if beforeFigherCount < 10 then
            _fighterIcon_Point3:EraseAllEffect()
            if _fighterIcon_Point1:GetShow() then
              _fighterIcon_Point1:AddEffect("fUI_PCM_Energy_01A", false, 0, 0)
            end
          elseif beforeFigherCount < 20 then
            _fighterIcon_Point2:EraseAllEffect()
            if _fighterIcon_Point2:GetShow() then
              _fighterIcon_Point2:AddEffect("fUI_PCM_Energy_01A", false, 0, 0)
            end
          elseif beforeFigherCount < 30 then
            _fighterIcon_Point1:EraseAllEffect()
            if _fighterIcon_Point3:GetShow() then
              _fighterIcon_Point3:AddEffect("fUI_PCM_Energy_01A", false, 0, 0)
              _fighterIcon_Point3:AddEffect("fUI_PCM_Energy_02A", false, -15, -8)
              _fighterIcon_Point3:AddEffect("fUI_PCM_Energy_02B", true, -15, -8)
            end
          end
          if beforeFigherCount == 30 and fighterCount == 0 then
            _fighterIcon:AddEffect("fUI_PCM_Energy_02C", false, 0, 0)
          end
          beforeFigherCount = fighterCount
        end
        -- DECOMPILER ERROR: 8 unprocessed JMP targets
      end
    end
  end
end

Panel_ClassResource_EnableSimpleUI = function()
  -- function num : 0_10
  Panel_ClassResource_SetAlphaAllChild(Panel_MainStatus_User_Bar:GetAlpha())
end

Panel_ClassResource_DisableSimpleUI = function()
  -- function num : 0_11
  Panel_ClassResource_SetAlphaAllChild(1)
end

Panel_ClassResource_UpdateSimpleUI = function(fDeltaTime)
  -- function num : 0_12
  Panel_ClassResource_SetAlphaAllChild(Panel_MainStatus_User_Bar:GetAlpha())
end

Panel_ClassResource_SetAlphaAllChild = function(alphaValue)
  -- function num : 0_13 , upvalues : resourceText, resourceValue, _phantomCount_Icon, _phantomCount_HelpText_Box
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
  -- function num : 0_14 , upvalues : _phantomCount_Icon, ResizeInit, init
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  if isFlushedUI() then
    return 
  end
  if CppDefine.ChangeUIAndResolution == true then
    if Panel_ClassResource:GetRelativePosX() == -1 and Panel_ClassResource:GetRelativePosY() == -1 then
      local initPosX = Panel_MainStatus_User_Bar:GetPosX() + _phantomCount_Icon:GetSizeX() - 5
      local initPosY = Panel_MainStatus_User_Bar:GetPosY() - _phantomCount_Icon:GetSizeY() + 5
      Panel_ClassResource:SetPosX(initPosX)
      Panel_ClassResource:SetPosY(initPosY)
      changePositionBySever(Panel_ClassResource, (CppEnums.PAGameUIType).PAGameUIPanel_ClassResource, true, true, false)
      FGlobal_InitPanelRelativePos(Panel_ClassResource, initPosX, initPosY)
    else
      do
        if Panel_ClassResource:GetRelativePosX() == 0 and Panel_ClassResource:GetRelativePosY() == 0 then
          Panel_ClassResource:SetPosX(getScreenSizeX() / 2 - Panel_MainStatus_User_Bar:GetSizeX() / 2 + _phantomCount_Icon:GetSizeX() - 5)
          Panel_ClassResource:SetPosY(getScreenSizeY() - Panel_QuickSlot:GetSizeY() - Panel_MainStatus_User_Bar:GetSizeY() - _phantomCount_Icon:GetSizeY() + 5)
        else
          Panel_ClassResource:SetPosX(getScreenSizeX() * Panel_ClassResource:GetRelativePosX() - Panel_ClassResource:GetSizeX() / 2)
          Panel_ClassResource:SetPosY(getScreenSizeY() * Panel_ClassResource:GetRelativePosY() - Panel_ClassResource:GetSizeY() / 2)
        end
        if ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_ClassResource, 0, (CppEnums.PanelSaveType).PanelSaveType_IsSaved) > 0 then
          Panel_ClassResource:SetShow(ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_ClassResource, 0, (CppEnums.PanelSaveType).PanelSaveType_IsShow))
        end
        Panel_ClassResource:SetPosX(Panel_MainStatus_User_Bar:GetPosX() + _phantomCount_Icon:GetSizeX() - 5)
        Panel_ClassResource:SetPosY(Panel_MainStatus_User_Bar:GetPosY() - _phantomCount_Icon:GetSizeY() + 5)
        changePositionBySever(Panel_ClassResource, (CppEnums.PAGameUIType).PAGameUIPanel_ClassResource, true, true, false)
        if CppDefine.ChangeUIAndResolution == true then
          ResizeInit()
        else
          init()
        end
      end
    end
  end
end

Phantom_Resize = function()
  -- function num : 0_15 , upvalues : _phantomCount_Icon, ResizeInit, init
  if CppDefine.ChangeUIAndResolution == true then
    if Panel_ClassResource:GetRelativePosX() == -1 and Panel_ClassResource:GetRelativePosY() == -1 then
      local initPosX = Panel_MainStatus_User_Bar:GetPosX() + _phantomCount_Icon:GetSizeX() - 5
      local initPosY = Panel_MainStatus_User_Bar:GetPosY() - _phantomCount_Icon:GetSizeY() + 5
      Panel_ClassResource:SetPosX(initPosX)
      Panel_ClassResource:SetPosY(initPosY)
      changePositionBySever(Panel_ClassResource, (CppEnums.PAGameUIType).PAGameUIPanel_ClassResource, true, true, false)
      FGlobal_InitPanelRelativePos(Panel_ClassResource, initPosX, initPosY)
    else
      do
        if Panel_ClassResource:GetRelativePosX() == 0 and Panel_ClassResource:GetRelativePosY() == 0 then
          Panel_ClassResource:SetPosX(getScreenSizeX() / 2 - Panel_MainStatus_User_Bar:GetSizeX() / 2 + _phantomCount_Icon:GetSizeX() - 5)
          Panel_ClassResource:SetPosY(getScreenSizeY() - Panel_QuickSlot:GetSizeY() - Panel_MainStatus_User_Bar:GetSizeY() - _phantomCount_Icon:GetSizeY() + 5)
        else
          Panel_ClassResource:SetPosX(getScreenSizeX() * Panel_ClassResource:GetRelativePosX() - Panel_ClassResource:GetSizeX() / 2)
          Panel_ClassResource:SetPosY(getScreenSizeY() * Panel_ClassResource:GetRelativePosY() - Panel_ClassResource:GetSizeY() / 2)
        end
        if ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_ClassResource, 0, (CppEnums.PanelSaveType).PanelSaveType_IsSaved) > 0 then
          Panel_ClassResource:SetShow(ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_ClassResource, 0, (CppEnums.PanelSaveType).PanelSaveType_IsShow))
        end
        Panel_ClassResource:SetPosX(Panel_MainStatus_User_Bar:GetPosX() + _phantomCount_Icon:GetSizeX() - 5)
        Panel_ClassResource:SetPosY(Panel_MainStatus_User_Bar:GetPosY() - _phantomCount_Icon:GetSizeY() + 5)
        changePositionBySever(Panel_ClassResource, (CppEnums.PAGameUIType).PAGameUIPanel_ClassResource, true, true, false)
        if CppDefine.ChangeUIAndResolution == true then
          ResizeInit()
        else
          init()
        end
      end
    end
  end
end

Panel_ClassResource_ShowToggle = function()
  -- function num : 0_16
  if Panel_ClassResource:IsShow() then
    Panel_ClassResource:SetShow(false)
  else
    Panel_ClassResource:SetShow(true)
  end
end

renderModeChange_Phantom_Locate = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_17
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

