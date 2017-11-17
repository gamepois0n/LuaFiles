-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\righttopicons\panel_personalicon_movieguide.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local IM = CppEnums.EProcessorInputMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_TM = CppEnums.TextMode
Panel_MovieGuide:ActiveMouseEventEffect(true)
Panel_MovieGuide:setGlassBackground(true)
Panel_MovieGuide:RegisterShowEventFunc(true, "Panel_MovieGuide_ShowAni()")
Panel_MovieGuide:RegisterShowEventFunc(false, "Panel_MovieGuide_HideAni()")
local _btn_MovieGuide = FGlobal_GetPersonalIconControl(1)
local _moviePlus = FGlobal_GetPersonalText(1)
local ui_PanelWindow = {_title = (UI.getChildControl)(Panel_MovieGuide, "StaticText_MovieTitle"), _btn_Close = (UI.getChildControl)(Panel_MovieGuide, "Button_Close"), _bgBox = (UI.getChildControl)(Panel_MovieGuide, "Static_MovieToolTipPanel_BG"), _list = (UI.getChildControl)(Panel_MovieGuide, "MovieList"), NowMovieInterval = 0, MinMovieInterval = 0, CurrentListCount = 0}
MovieGuide_DisableSimpleUI = function()
  -- function num : 0_0 , upvalues : _btn_MovieGuide
  if (getGameServiceType() == 5 or getGameServiceType() == 6) and getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_CBT then
    _btn_MovieGuide:SetShow(false)
  end
end

registerEvent("EventSimpleUIDisable", "MovieGuide_DisableSimpleUI")
_btn_MovieGuide:addInputEvent("Mouse_LUp", "PaGlobal_MovieGuide_Web:Open()")
;
(ui_PanelWindow._btn_Close):addInputEvent("Mouse_LUp", "PaGlobal_MovieGuide_Web:Open()")
local movieDesc = {PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_1"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_2"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_3"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_4"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVIETHEATER_640_MOVIEDESC_DEFAULT"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVIETHEATER_640_MOVIEDESC_SKILLCOMBO"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_10"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_11"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_12"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_13"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_14"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_15"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_16"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_17"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_18"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_19"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_20"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_21"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_22"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_23"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_24"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_25"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_26"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_0")}
Panel_MovieGuide_ShowAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV
  (UIAni.AlphaAnimation)(1, Panel_MovieGuide, 0, 0.15)
  local aniInfo1 = Panel_MovieGuide:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_MovieGuide:GetSizeX() / 2
  aniInfo1.AxisY = Panel_MovieGuide:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_MovieGuide:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_MovieGuide:GetSizeX() / 2
  aniInfo2.AxisY = Panel_MovieGuide:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_MovieGuide_HideAni = function()
  -- function num : 0_2
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_MovieGuide, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

local maxMovieCount = 24
if isGameTypeKorea() or isGameTypeTaiwan() or isGameTypeJapan() or isGameTypeEnglish() or isGameTypeRussia() then
  maxMovieCount = 24
else
  maxMovieCount = 23
end
local guideMovieList = {}
Panel_MovieGuide_Initialize = function()
  -- function num : 0_3 , upvalues : ui_PanelWindow, maxMovieCount
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  ;
  (ui_PanelWindow._list):changeAnimationSpeed(10)
  ;
  (ui_PanelWindow._list):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "MovieGuide_ListUpdate")
  ;
  (ui_PanelWindow._list):registEvent((CppEnums.PAUIList2EventType).ScrollBeginToBegin, "MovieGuide_ListUpdate_BEGIN")
  ;
  (ui_PanelWindow._list):registEvent((CppEnums.PAUIList2EventType).ScrollEndToEnd, "MovieGuide_ListUpdate_END")
  ;
  (ui_PanelWindow._list):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  ((ui_PanelWindow._list):getElementManager()):clearKey()
  for idx = 0, maxMovieCount - 1 do
    if isGameTypeKorea() or isGameTypeTaiwan() or isGameTypeJapan() or isGameTypeEnglish() or isGameTypeRussia() then
      ((ui_PanelWindow._list):getElementManager()):pushKey(toInt64(0, idx))
    else
      if idx >= 5 then
        ((ui_PanelWindow._list):getElementManager()):pushKey(toInt64(0, idx + 1))
      else
        ;
        ((ui_PanelWindow._list):getElementManager()):pushKey(toInt64(0, idx))
      end
    end
  end
end

MovieGuide_ListUpdate = function(contents, key)
  -- function num : 0_4 , upvalues : UI_TM, movieDesc, UI_color, _btn_MovieGuide
  local idx = Int64toInt32(key)
  local movieName = (UI.getChildControl)(contents, "Static_MoviePieceBG")
  movieName:SetTextMode(UI_TM.eTextMode_LimitText)
  movieName:SetText(movieDesc[idx])
  movieName:SetFontColor(UI_color.C_FF888888)
  if movieName:IsLimitText() then
    movieName:addInputEvent("Mouse_On", "MovieGuide_SimpleTooltip(true, " .. idx .. ")")
    movieName:addInputEvent("Mouse_Out", "MovieGuide_SimpleTooltip(false, " .. idx .. ")")
  else
    movieName:addInputEvent("Mouse_On", "")
    movieName:addInputEvent("Mouse_Out", "")
  end
  local movieBtn = (UI.getChildControl)(contents, "Button_Movie_0")
  movieBtn:addInputEvent("Mouse_LUp", "Panel_MovieTheater640_GameGuide_Func(" .. idx .. ")")
  movieBtn:SetIgnore(true)
  movieBtn:SetFontColor(UI_color.C_FF515151)
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local playerGet = player:get()
  local playerLevel = playerGet:getLevel()
  local isEnableBtn = function()
    -- function num : 0_4_0 , upvalues : _btn_MovieGuide, movieName, UI_color, movieBtn
    _btn_MovieGuide:SetVertexAniRun("Ani_Color_New", true)
    movieName:SetFontColor(UI_color.C_FFEFEFEF)
    movieBtn:SetIgnore(false)
    movieBtn:SetFontColor(UI_color.C_FFC4BEBE)
  end

  -- DECOMPILER ERROR at PC89: Unhandled construct in 'MakeBoolean' P1

  -- DECOMPILER ERROR at PC89: Unhandled construct in 'MakeBoolean' P1

  if playerLevel <= 22 and playerLevel >= 1 and playerLevel <= 4 and idx <= 4 then
    isEnableBtn()
  end
  -- DECOMPILER ERROR at PC98: Unhandled construct in 'MakeBoolean' P1

  if playerLevel >= 5 and playerLevel <= 7 and idx <= 12 then
    isEnableBtn()
  end
  -- DECOMPILER ERROR at PC107: Unhandled construct in 'MakeBoolean' P1

  if playerLevel >= 8 and playerLevel <= 12 and idx <= 15 then
    isEnableBtn()
  end
  -- DECOMPILER ERROR at PC116: Unhandled construct in 'MakeBoolean' P1

  if playerLevel >= 13 and playerLevel <= 16 and idx <= 18 then
    isEnableBtn()
  end
  -- DECOMPILER ERROR at PC125: Unhandled construct in 'MakeBoolean' P1

  if playerLevel >= 17 and playerLevel <= 18 and idx <= 19 then
    isEnableBtn()
  end
  if playerLevel >= 19 and playerLevel <= 22 and idx <= 30 then
    isEnableBtn()
  end
  if playerLevel >= 23 and idx <= 33 then
    isEnableBtn()
  end
end

MovieGuide_ListUpdate_BEGIN = function(list)
  -- function num : 0_5
end

MovieGuide_ListUpdate_END = function(list)
  -- function num : 0_6
end

MovieGuide_SimpleTooltip = function(isShow, index)
  -- function num : 0_7 , upvalues : ui_PanelWindow, movieDesc
  local self = ui_PanelWindow
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  local name, desc, control = nil, nil, nil
  local contents = (self._list):GetContentByKey(toInt64(0, index))
  do
    if contents ~= nil then
      local movieName = (UI.getChildControl)(contents, "Static_MoviePieceBG")
      name = movieDesc[index]
      control = movieName
    end
    TooltipSimple_Show(control, name, desc)
  end
end

Panel_MovieGuide_ShowToggle = function()
  -- function num : 0_8 , upvalues : _btn_MovieGuide, _moviePlus
  local isShow = Panel_MovieGuide:IsShow()
  _btn_MovieGuide:ResetVertexAni()
  _moviePlus:SetShow(false)
  if isShow == true then
    Panel_MovieGuide:SetShow(false, true)
    Panel_MovieTheater640_Reset()
    Panel_MovieTheater_640:SetShow(false, true)
  else
    Panel_MovieGuide:SetShow(true, true)
    Panel_MovieTheater640_Initialize()
  end
end

Panel_MovieGuide_LevelCheck = function()
  -- function num : 0_9 , upvalues : _moviePlus
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local playerGet = player:get()
  local playerLevel = playerGet:getLevel()
  if playerLevel == 1 then
    _moviePlus:SetShow(true)
  else
    if playerLevel == 7 then
      _moviePlus:SetShow(true)
    else
      if playerLevel == 12 then
        _moviePlus:SetShow(true)
      else
        if playerLevel == 15 then
          _moviePlus:SetShow(true)
        else
          if playerLevel == 17 then
            _moviePlus:SetShow(true)
          else
            if playerLevel == 19 then
              _moviePlus:SetShow(true)
            end
          end
        end
      end
    end
  end
end

renderModeChange_MovieGuideButton_Position = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_10
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  FGlobal_PersonalIcon_ButtonPosUpdate()
end

MovieGuideButton_Position = function()
  -- function num : 0_11 , upvalues : _btn_MovieGuide
  local RadarPosX = FGlobal_Panel_Radar_GetPosX()
  local RadarPosY = FGlobal_Panel_Radar_GetPosY()
  local RadarSpanSizeY = FGlobal_Panel_Radar_GetSpanSizeY()
  Panel_MovieGuide:SetPosX(RadarPosX - Panel_MovieGuide:GetSizeX() - 12)
  Panel_MovieGuide:SetPosY(_btn_MovieGuide:GetPosY() + 60)
end

Panel_MovieGuide_Initialize()
MovieGuideButton_Position()
registerEvent("EventSelfPlayerLevelUp", "Panel_MovieGuide_LevelCheck")
registerEvent("onScreenResize", "FGlobal_PersonalIcon_ButtonPosUpdate")
registerEvent("EventSelfPlayerLevelUp", "Panel_MovieGuide_LevelCheck")
registerEvent("FromClient_RenderModeChangeState", "renderModeChange_MovieGuideButton_Position")

