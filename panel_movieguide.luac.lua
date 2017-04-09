-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\movieguide\panel_movieguide.luac 

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
local _btn_MovieGuide = (UI.getChildControl)(Panel_MovieGuideButton, "Button_MovieTooltip")
local _moviePlus = (UI.getChildControl)(Panel_MovieGuideButton, "StaticText_MoviePlus")
local ui_PanelWindow = {_title = (UI.getChildControl)(Panel_MovieGuide, "StaticText_MovieTitle"), _btn_Close = (UI.getChildControl)(Panel_MovieGuide, "Button_Close"), _bgBox = (UI.getChildControl)(Panel_MovieGuide, "Static_MovieToolTipPanel_BG"), _list = (UI.getChildControl)(Panel_MovieGuide, "MovieList"), NowMovieInterval = 0, MinMovieInterval = 0, CurrentListCount = 0}
MovieGuide_DisableSimpleUI = function()
  -- function num : 0_0
  if (getGameServiceType() == 5 or getGameServiceType() == 6) and getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_CBT then
    Panel_MovieGuideButton:SetShow(false)
  end
end

registerEvent("EventSimpleUIDisable", "MovieGuide_DisableSimpleUI")
_btn_MovieGuide:addInputEvent("Mouse_LUp", "Panel_MovieGuide_ShowToggle()")
;
(ui_PanelWindow._btn_Close):addInputEvent("Mouse_LUp", "Panel_MovieGuide_ShowToggle()")
local movieDesc = nil
if isGameTypeKorea() or isGameTypeJapan() or isGameTypeRussia() then
  movieDesc = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_0"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_1"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_2"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_3"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_4"), [5] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_5"), [6] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_6"), [7] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_7"), [8] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_8"), [9] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_9"), [10] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_27"), [11] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_28"), [12] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_29"), [13] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_30"), [14] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_31"), [15] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_32"), [16] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_33"), [17] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_10"), [18] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_11"), [19] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_12"), [20] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_13"), [21] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_14"), [22] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_15"), [23] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_16"), [24] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_17"), [25] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_18"), [26] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_19"), [27] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_20"), [28] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_21"), [29] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_22"), [30] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_23"), [31] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_24"), [32] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_25"), [33] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_26")}
else
  if isGameTypeEnglish() then
    movieDesc = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_0"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_1"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_2"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_3"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_4"), [5] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_5"), [6] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_6"), [7] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_7"), [8] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_8"), [9] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_9"), [10] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_27"), [11] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_28"), [12] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_29"), [13] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_30"), [14] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_31"), [15] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_32"), [16] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_33"), [17] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_10"), [18] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_11"), [19] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_12"), [20] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_13"), [21] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_14"), [22] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_15"), [23] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_16"), [24] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_17"), [25] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_18"), [26] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_19"), [27] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_20"), [28] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_21"), [29] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_22"), [30] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_23"), [31] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_24"), [32] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_25"), [33] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_26")}
  else
    if isGameTypeTaiwan() then
      movieDesc = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_0"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_1"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_2"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_3"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_4"), [5] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_5"), [6] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_6"), [7] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_7"), [8] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_8"), [9] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_9"), [10] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_30"), [11] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_31"), [12] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_28"), [13] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_10"), [14] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_11"), [15] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_12"), [16] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_13"), [17] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_14"), [18] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_15"), [19] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_16"), [20] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_17"), [21] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_19"), [22] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_20"), [23] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_21"), [24] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_22"), [25] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_23"), [26] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_25")}
    end
  end
end
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

local maxMovieCount = 34
local guideMovieList = {}
Panel_MovieGuide_Initialize = function()
  -- function num : 0_3 , upvalues : maxMovieCount, ui_PanelWindow
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  if isGameTypeTaiwan() then
    maxMovieCount = 27
  else
    maxMovieCount = 34
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
    ((ui_PanelWindow._list):getElementManager()):pushKey(toInt64(0, idx))
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

  if playerLevel <= 20 and playerLevel >= 1 and playerLevel <= 4 and idx <= 4 then
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
  FGlobal_MovieGuideButton_Position()
end

Panel_HuntingAlertButton:ActiveMouseEventEffect(true)
Panel_HuntingAlertButton:setGlassBackground(true)
local _btn_HuntingAlert = (UI.getChildControl)(Panel_HuntingAlertButton, "Button_HuntingAlert")
local _huntingPlus = (UI.getChildControl)(Panel_HuntingAlertButton, "StaticText_MoviePlus")
_btn_HuntingAlert:addInputEvent("Mouse_On", "Hunting_ToolTip_ShowToggle(true)")
_btn_HuntingAlert:addInputEvent("Mouse_Out", "Hunting_ToolTip_ShowToggle()")
local msg = {name, desc}
WhaleConditionCheck = function()
  -- function num : 0_11 , upvalues : msg, _huntingPlus
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  msg.name = ""
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R0 in 'UnsetPending'

  msg.desc = ""
  local whaleCount = ToClient_worldmapActorManagerGetActorRegionList(2)
  if whaleCount > 0 then
    for index = 0, whaleCount - 1 do
      local areaName = ToClient_worldmapActorManagerGetActorRegionByIndex(index)
      local count = ToClient_worldmapActorManagerGetActorCountByIndex(index)
      -- DECOMPILER ERROR at PC38: Confused about usage of register: R7 in 'UnsetPending'

      if areaName ~= nil then
        if index == 0 then
          msg.desc = msg.desc .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_WHALE_FIND", "areaName", tostring(areaName), "count", count)
        else
          -- DECOMPILER ERROR at PC56: Confused about usage of register: R7 in 'UnsetPending'

          msg.desc = msg.desc .. "\n" .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_WHALE_FIND", "areaName", tostring(areaName), "count", count)
        end
      end
    end
    -- DECOMPILER ERROR at PC64: Confused about usage of register: R1 in 'UnsetPending'

    msg.name = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_WHALE_FIND_NAME")
    _huntingPlus:SetShow(true)
  end
  local gargoyleCount = ToClient_worldmapActorManagerGetActorRegionList(3)
  if gargoyleCount > 0 then
    for index = 0, gargoyleCount - 1 do
      local areaName = ToClient_worldmapActorManagerGetActorRegionByIndex(index)
      local count = ToClient_worldmapActorManagerGetActorCountByIndex(index)
      -- DECOMPILER ERROR at PC106: Confused about usage of register: R8 in 'UnsetPending'

      if areaName ~= nil then
        if index == 0 then
          if whaleCount > 0 then
            msg.desc = msg.desc .. "\n" .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_HUNTING_GARGOYLE", "areaName", tostring(areaName), "count", count)
          else
            -- DECOMPILER ERROR at PC123: Confused about usage of register: R8 in 'UnsetPending'

            msg.desc = msg.desc .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_HUNTING_GARGOYLE", "areaName", tostring(areaName), "count", count)
          end
        else
          -- DECOMPILER ERROR at PC141: Confused about usage of register: R8 in 'UnsetPending'

          msg.desc = msg.desc .. "\n" .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_HUNTING_GARGOYLE", "areaName", tostring(areaName), "count", count)
        end
      end
    end
    -- DECOMPILER ERROR at PC149: Confused about usage of register: R2 in 'UnsetPending'

    msg.name = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_WHALE_FIND_NAME")
    _huntingPlus:SetShow(true)
  end
  -- DECOMPILER ERROR at PC163: Confused about usage of register: R2 in 'UnsetPending'

  if gargoyleCount + whaleCount == 0 then
    msg.name = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_WHALE")
    -- DECOMPILER ERROR at PC170: Confused about usage of register: R2 in 'UnsetPending'

    msg.desc = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_WHALE_NOT_FIND")
    _huntingPlus:SetShow(false)
  end
end

Hunting_ToolTip_ShowToggle = function(isShow)
  -- function num : 0_12 , upvalues : _btn_HuntingAlert, msg
  WhaleConditionCheck()
  if isShow == nil then
    TooltipSimple_Hide()
    return 
  end
  TooltipSimple_Show(_btn_HuntingAlert, msg.name, msg.desc)
end

FGlobal_WhaleConditionCheck = function()
  -- function num : 0_13
  if Panel_HuntingAlertButton:GetShow() then
    WhaleConditionCheck()
  end
end

WhaleConditionCheck()
Panel_VillageSiegeArea:ActiveMouseEventEffect(true)
Panel_VillageSiegeArea:setGlassBackground(true)
local _btn_VillageSiegeArea = (UI.getChildControl)(Panel_VillageSiegeArea, "Button_VillageSiegeArea")
_btn_VillageSiegeArea:addInputEvent("Mouse_On", "VillageSiegeArea_Tooltip_ShowToggle(true)")
_btn_VillageSiegeArea:addInputEvent("Mouse_Out", "VillageSiegeArea_Tooltip_ShowToggle()")
_btn_VillageSiegeArea:addInputEvent("Mouse_LUp", "ToggleVillageSiegeArea()")
local showSiegeArea = false
ToClient_toggleVillageSiegeArea(showSiegeArea)
ToggleVillageSiegeArea = function(isShow)
  -- function num : 0_14 , upvalues : showSiegeArea, _btn_VillageSiegeArea
  if isShow == nil then
    showSiegeArea = not showSiegeArea
  else
    showSiegeArea = isShow
  end
  _btn_VillageSiegeArea:EraseAllEffect()
  if showSiegeArea then
    _btn_VillageSiegeArea:AddEffect("UI_VillageSiegeArea_01A", true, 0, 0)
  end
  ToClient_toggleVillageSiegeArea(showSiegeArea)
end

VillageSiegeArea_Tooltip_ShowToggle = function(isShow)
  -- function num : 0_15 , upvalues : _btn_VillageSiegeArea
  if isShow == nil then
    TooltipSimple_Hide()
    return 
  end
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_VILLAGESEIGE_AREABUTTON")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_VILLAGESEIGE_AREABUTTON_DESC")
  TooltipSimple_Show(_btn_VillageSiegeArea, name, desc)
end

local _btn_SummonElephant = (UI.getChildControl)(Panel_SummonElephant, "Button_SummonElephant")
_btn_SummonElephant:addInputEvent("Mouse_On", "SummonElephant_Tooltip_ShowToggle(true)")
_btn_SummonElephant:addInputEvent("Mouse_Out", "SummonElephant_Tooltip_ShowToggle()")
_btn_SummonElephant:addInputEvent("Mouse_LUp", "SummonElephant()")
local elephantActorKey = nil
SummonElephant = function()
  -- function num : 0_16 , upvalues : elephantActorKey
  if elephantActorKey == nil then
    return 
  end
  ToClient_RequestSummonElephantFromSiegeBuilding(elephantActorKey)
end

Panel_SummonElephant_Close = function()
  -- function num : 0_17 , upvalues : elephantActorKey
  Panel_SummonElephant:SetShow(false)
  elephantActorKey = nil
  FGlobal_MovieGuideButton_Position()
end

FromClient_ShowElephantBarn = function(actorKeyRaw)
  -- function num : 0_18 , upvalues : elephantActorKey
  Panel_SummonElephant:SetShow(true)
  elephantActorKey = actorKeyRaw
  FGlobal_MovieGuideButton_Position()
end

FromClient_HideElephantBarn = function(actorKeyRaw)
  -- function num : 0_19
  Panel_SummonElephant_Close()
end

SummonElephant_Tooltip_ShowToggle = function(isShow)
  -- function num : 0_20 , upvalues : _btn_SummonElephant
  if isShow == nil then
    TooltipSimple_Hide()
    return 
  end
  local name = PAGetString(Defines.StringSheet_GAME, "LUA_SUMMONELEPHANT_TOOLTIP_TITLE")
  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_SUMMONELEPHANT_TOOLTIP_DESC")
  TooltipSimple_Show(_btn_SummonElephant, name, desc)
end

registerEvent("FromClient_ShowElephantBarn", "FromClient_ShowElephantBarn")
registerEvent("FromClient_HideElephantBarn", "FromClient_HideElephantBarn")
Panel_AutoTraining:SetShow(false)
Panel_AutoTraining:ActiveMouseEventEffect(true)
Panel_AutoTraining:setGlassBackground(true)
local _btn_AutoTraining = (UI.getChildControl)(Panel_AutoTraining, "Button_AutoTraining")
local _trainingText = (UI.getChildControl)(Panel_AutoTraining, "StaticText_Training")
_trainingText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_AUTOTRAINING_MESSAGE_9"))
_btn_AutoTraining:addInputEvent("Mouse_LUp", "AutoTraining_Set()")
_btn_AutoTraining:addInputEvent("Mouse_On", "AutoTraining_ToolTip( true )")
_btn_AutoTraining:addInputEvent("Mouse_Out", "AutoTraining_ToolTip()")
local autoTrain = false
local autoTraining_Init = function()
  -- function num : 0_21 , upvalues : autoTrain, _trainingText, _btn_AutoTraining
  if not ToClient_IsContentsGroupOpen("57") then
    return 
  end
  if autoTrain then
    ToClient_RequestSetAutoLevelUp(false)
  end
  autoTrain = false
  _trainingText:SetShow(autoTrain)
  _btn_AutoTraining:EraseAllEffect()
  FGlobal_MovieGuideButton_Position()
end

AutoTraining_Set = function()
  -- function num : 0_22 , upvalues : IM, autoTrain, _trainingText, _btn_AutoTraining
  if Panel_Global_Manual:GetShow() then
    Proc_ShowMessage_Ack("미니게임 중에�\148 흑정령의 수련�\132 이용�\160 �\152 없습니다.")
    return 
  end
  if Panel_Gacha_Roulette:GetShow() then
    Proc_ShowMessage_Ack("룰렛�\180 돌아�\128�\148 중에�\148 흑정령의 수련�\132 이용�\160 �\152 없습니다.")
    return 
  end
  if Panel_EventNotify:GetShow() then
    close_WindowPanelList()
    FGlobal_NpcNavi_Hide()
    EventNotify_Close()
  end
  if Panel_ScreenShotAlbum_FullScreen:GetShow() then
    ScreenshotAlbum_FullScreen_Close()
  end
  if Panel_ScreenShotAlbum:GetShow() then
    ScreenshotAlbum_Close()
  end
  if check_ShowWindow() then
    close_WindowPanelList()
    ;
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
    FGlobal_NpcNavi_Hide()
  end
  if check_ShowWindow() and FGlobal_NpcNavi_IsShowCheck() then
    close_WindowPanelList()
    ;
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
    FGlobal_NpcNavi_Hide()
  else
    if not check_ShowWindow() and FGlobal_NpcNavi_IsShowCheck() then
      FGlobal_NpcNavi_Hide()
    else
      if check_ShowWindow() and not FGlobal_NpcNavi_IsShowCheck() then
        close_WindowPanelList()
        ;
        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
      end
    end
  end
  local pcPosition = ((getSelfPlayer()):get()):getPosition()
  local regionInfo = getRegionInfoByPosition(pcPosition)
  if not (regionInfo:get()):isSafeZone() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_AUTOTRAINING_MESSAGE_1"))
    return 
  end
  local needExp = Int64toInt32(((getSelfPlayer()):get()):getNeedExp_s64())
  local currentexp = Int64toInt32(((getSelfPlayer()):get()):getExp_s64())
  local expRate = currentexp * 100 / needExp
  local e1 = 10000
  local msg = ""
  if ToClient_RequestSetAutoLevelUp(not autoTrain) then
    autoTrain = not autoTrain
    _trainingText:SetShow(autoTrain)
    if autoTrain then
      msg = PAGetString(Defines.StringSheet_GAME, "LUA_AUTOTRAINING_MESSAGE_3")
      _btn_AutoTraining:AddEffect("fUI_Soul_Training01", true, 0, 0)
    else
      msg = PAGetString(Defines.StringSheet_GAME, "LUA_AUTOTRAINING_MESSAGE_4")
      _btn_AutoTraining:EraseAllEffect()
    end
    Proc_ShowMessage_Ack(msg)
  end
end

AutoTraining_Stop = function()
  -- function num : 0_23 , upvalues : autoTrain, _btn_AutoTraining, _trainingText
  autoTrain = false
  _btn_AutoTraining:EraseAllEffect()
  _trainingText:SetShow(autoTrain)
end

AutoTraining_ToolTip = function(isShow)
  -- function num : 0_24 , upvalues : _btn_AutoTraining, autoTrain
  if isShow == nil then
    TooltipSimple_Hide()
    return 
  end
  local name, desc, uiControl = (PAGetString(Defines.StringSheet_GAME, "LUA_AUTOTRAINING_MESSAGE_8")), nil, _btn_AutoTraining
  local maxExpPercent = ToClient_GetAutoLevelUpMaxExpPercent() / 10000
  if autoTrain then
    desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_AUTOTRAINING_MESSAGE_6", "percent", maxExpPercent)
  else
    desc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_AUTOTRAINING_MESSAGE_7", "percent", maxExpPercent)
  end
  registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
  TooltipSimple_Show(uiControl, name, desc)
end

Init_AutoTraining = function()
  -- function num : 0_25 , upvalues : autoTraining_Init
  autoTraining_Init()
end

isAutoTraining = function()
  -- function num : 0_26 , upvalues : autoTrain
  return autoTrain
end

registerEvent("EventSelfPlayerLevelUp", "Init_AutoTraining")
registerEvent("FromClient_CantIncreaseExpWithAutoLevelUp", "AutoTraining_Stop")
registerEvent("FromClient_InActivateTrainingBtn", "AutoTraining_Stop")
local _btn_BusterCall = (UI.getChildControl)(Panel_BusterCall, "Button_BusterCall")
_btn_BusterCall:addInputEvent("Mouse_LUp", "Click_BusterCall()")
_btn_BusterCall:addInputEvent("Mouse_On", "BusterCall_ToolTip( true )")
_btn_BusterCall:addInputEvent("Mouse_Out", "BusterCall_ToolTip()")
BusterCall_ToolTip = function(isShow)
  -- function num : 0_27 , upvalues : _btn_BusterCall
  if isShow == nil then
    TooltipSimple_Hide()
    return 
  end
  local regionInfoWrapper = ToClient_getRegionInfoWrapperByPosition(ToClient_GetGuildBustCallPos())
  if regionInfoWrapper == nil then
    return 
  end
  local areaName = regionInfoWrapper:getAreaName()
  local usableTime64 = ToClient_GetGuildBustCallTime()
  local descStr = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_BUSTERCALL_TOOLTIP_DESC", "areaName", areaName, "time", convertStringFromDatetime(getLeftSecond_TTime64(usableTime64)))
  local name, desc, uiControl = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_BUSTERCALL_TOOLTIP_NAME"), descStr, _btn_BusterCall
  registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
  TooltipSimple_Show(uiControl, name, desc)
end

Click_BusterCall = function()
  -- function num : 0_28
  ToClient_RequestTeleportGuildBustCall()
  TooltipSimple_Hide()
end

Response_GuildBusterCall = function(sendType)
  -- function num : 0_29
  if sendType == 0 then
    Panel_BusterCall_Open()
    luaTimer_AddEvent(Panel_BusterCall_Close, 600000, false, 0)
  else
    Panel_BusterCall_Close()
  end
  FGlobal_MovieGuideButton_Position()
end

Panel_BusterCall_Open = function()
  -- function num : 0_30 , upvalues : _btn_BusterCall
  local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
  if isGuildMaster == true then
    Panel_BusterCall_Close()
    return 
  end
  Panel_BusterCall:SetShow(true)
  _btn_BusterCall:EraseAllEffect()
  _btn_BusterCall:AddEffect("fUI_Buster_Call01", true, 0, 0)
end

Panel_BusterCall_Close = function()
  -- function num : 0_31 , upvalues : _btn_BusterCall
  if Panel_BusterCall:GetShow() then
    _btn_BusterCall:EraseAllEffect()
    Panel_BusterCall:SetShow(false)
  end
end

FGlobal_BusterCallCheck = function()
  -- function num : 0_32
  local leftTime = Int64toInt32(getLeftSecond_TTime64(ToClient_GetGuildBustCallTime()))
  if leftTime > 0 then
    Panel_BusterCall_Open()
  else
    Panel_BusterCall_Close()
  end
end

FGlobal_BusterCallCheck()
registerEvent("FromClient_ResponseBustCall", "Response_GuildBusterCall")
local _btn_WarCall = (UI.getChildControl)(Panel_WarCall, "Button_WarCall")
_btn_WarCall:addInputEvent("Mouse_LUp", "Click_WarCall()")
_btn_WarCall:addInputEvent("Mouse_On", "WarCall_ToolTip( true )")
_btn_WarCall:addInputEvent("Mouse_Out", "WarCall_ToolTip()")
WarCall_ToolTip = function(isShow)
  -- function num : 0_33 , upvalues : _btn_WarCall
  if isShow == nil then
    TooltipSimple_Hide()
    return 
  end
  local regionInfoWrapper = ToClient_getRegionInfoWrapperByPosition(ToClient_GetTeleportToSiegeTentPos())
  if regionInfoWrapper == nil then
    return 
  end
  local areaName = regionInfoWrapper:getAreaName()
  local usableTime64 = ToClient_GetTeleportToSiegeTentTime()
  local descStr = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_BUSTERCALL_TOOLTIP_DESC", "areaName", areaName, "time", convertStringFromDatetime(getLeftSecond_TTime64(usableTime64)))
  local name, desc, uiControl = PAGetString(Defines.StringSheet_GAME, "LUA_WARCALL_TOOLTIP_NAME"), descStr, _btn_WarCall
  registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
  TooltipSimple_Show(uiControl, name, desc)
end

Click_WarCall = function()
  -- function num : 0_34
  ToClient_RequestTeleportToSiegeTentCall()
  TooltipSimple_Hide()
end

Response_GuildWarCall = function(sendType)
  -- function num : 0_35
  if sendType == 0 then
    Panel_WarCall_Open()
    luaTimer_AddEvent(Panel_WarCall_Close, 600000, false, 0)
  else
    Panel_WarCall_Close()
  end
  FGlobal_MovieGuideButton_Position()
end

Panel_WarCall_Open = function()
  -- function num : 0_36
  Panel_WarCall:SetShow(true)
end

Panel_WarCall_Close = function()
  -- function num : 0_37
  if Panel_WarCall:GetShow() then
    Panel_WarCall:SetShow(false)
  end
end

FGlobal_WarCallCheck = function()
  -- function num : 0_38
  local leftTime = Int64toInt32(getLeftSecond_TTime64(ToClient_GetTeleportToSiegeTentTime()))
  if leftTime > 0 then
    Panel_WarCall_Open()
  else
    Panel_WarCall_Close()
  end
end

FGlobal_WarCallCheck()
registerEvent("FromClient_ResponseTeleportToSiegeTent", "Response_GuildWarCall")
local _btn_ReturnStone = (UI.getChildControl)(Panel_ReturnStone, "Button_ReturnStone")
_btn_ReturnStone:addInputEvent("Mouse_LUp", "Click_ReturnStone()")
_btn_ReturnStone:addInputEvent("Mouse_On", "ReturnStone_ToolTip( true )")
_btn_ReturnStone:addInputEvent("Mouse_Out", "ReturnStone_ToolTip()")
Click_ReturnStone = function()
  -- function num : 0_39
  local remainTime_s64 = ToClient_GetLeftReturnStoneTime()
  local remainTime = Int64toInt32(remainTime_s64)
  local returnPos3D = ToClient_GetPosUseReturnStone()
  local regionInfo = getRegionInfoByPosition(returnPos3D)
  if remainTime > 0 then
    if IsSelfPlayerWaitAction() then
      ToClient_RequestTeleportPosUseReturnStone()
    else
      Proc_ShowMessage_Ack("�\128�\176 상태에서�\140 이용�\160 �\152 있습니다.")
    end
  end
end

ReturnStone_ToolTip = function(isShow)
  -- function num : 0_40 , upvalues : _btn_ReturnStone
  if isShow == nil then
    TooltipSimple_Hide()
    return 
  end
  local returnPos3D = ToClient_GetPosUseReturnStone()
  local regionInfo = getRegionInfoByPosition(returnPos3D)
  local regionName = ""
  if regionInfo ~= nil then
    regionName = regionInfo:getAreaName()
  end
  local returnTownRegionKey = ToClient_GetReturnStoneTownRegionKey()
  local townInfo = getRegionInfoByRegionKey(RegionKey(returnTownRegionKey))
  if townInfo == nil then
    return 
  end
  local returnPlaceRegionName = townInfo:getAreaName()
  local usableTime64 = ToClient_GetLeftReturnStoneTime()
  local descStr = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_RETURNSTONE_DESC", "regionName", regionName, "remainTime", convertStringFromDatetime(usableTime64))
  local name, desc, uiControl = PAGetString(Defines.StringSheet_GAME, "LUA_RETURNSTONE_NAME"), descStr, _btn_ReturnStone
  registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
  TooltipSimple_Show(uiControl, name, desc)
end

Panel_ReturnStone_Open = function()
  -- function num : 0_41 , upvalues : _btn_ReturnStone
  local remainTime_s64 = ToClient_GetLeftReturnStoneTime()
  local remainTime = Int64toInt32(remainTime_s64)
  if remainTime > 0 then
    Panel_ReturnStone:SetShow(true)
    _btn_ReturnStone:EraseAllEffect()
    _btn_ReturnStone:AddEffect("fUI_Buster_Call01", true, 0, 0)
  else
    Panel_ReturnStone_Close()
  end
end

Panel_ReturnStone_Close = function()
  -- function num : 0_42 , upvalues : _btn_ReturnStone
  if Panel_ReturnStone:GetShow() then
    _btn_ReturnStone:EraseAllEffect()
    Panel_ReturnStone:SetShow(false)
  end
end

local returnStoneCheck = function()
  -- function num : 0_43
  local leftTime = Int64toInt32(ToClient_GetLeftReturnStoneTime())
  if leftTime > 0 then
    Panel_ReturnStone_Open()
  else
    Panel_ReturnStone_Close()
  end
end

returnStoneCheck()
FromClient_ResponseUseReturnStone = function()
  -- function num : 0_44
  local pos3D = ToClient_GetPosUseReturnStone()
  ToClient_DeleteNaviGuideByGroup(0)
  worldmapNavigatorStart(pos3D, NavigationGuideParam(), false, false)
  if not Panel_ReturnStone:GetShow() then
    Panel_ReturnStone_Open()
  end
  FGlobal_MovieGuideButton_Position()
end

FGlobal_ReturnStoneCheck = function()
  -- function num : 0_45 , upvalues : returnStoneCheck
  if Panel_ReturnStone:GetShow() then
    returnStoneCheck()
  end
end

registerEvent("FromClient_ResponseUseReturnStone", "FromClient_ResponseUseReturnStone")
local _btn_SummonParty = (UI.getChildControl)(Panel_SummonParty, "Button_SummonParty")
_btn_SummonParty:addInputEvent("Mouse_LUp", "Click_SummonParty()")
_btn_SummonParty:addInputEvent("Mouse_On", "SummonParty_ToolTip( true )")
_btn_SummonParty:addInputEvent("Mouse_Out", "SummonParty_ToolTip()")
Click_SummonParty = function()
  -- function num : 0_46
  local remainTime_s64 = ToClient_GetLeftUsableTeleportCompassTime()
  local remainTime = Int64toInt32(remainTime_s64)
  if remainTime > 0 then
    if IsSelfPlayerWaitAction() then
      ToClient_RequestTeleportPosUseCompass()
    else
      Proc_ShowMessage_Ack("�\128�\176 상태에서�\140 이용�\160 �\152 있습니다.")
    end
  end
end

local partyName = ""
SummonParty_ToolTip = function(isShow)
  -- function num : 0_47 , upvalues : partyName, _btn_SummonParty
  if isShow == nil then
    TooltipSimple_Hide()
    return 
  end
  local partyActorKey = ToClient_GetCharacterActorKeyRawUseCompass()
  local playerActorKey = (getSelfPlayer()):getActorKey()
  local descStr = ""
  local usableTime64 = ToClient_GetLeftUsableTeleportCompassTime()
  if partyActorKey == playerActorKey then
    descStr = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPASS_DESC_1", "remainTime", convertStringFromDatetime(usableTime64))
  else
    descStr = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_COMPASS_DESC_2", "partyName", partyName, "partyName1", partyName, "remainTime", convertStringFromDatetime(usableTime64))
  end
  local name, desc, uiControl = PAGetString(Defines.StringSheet_GAME, "LUA_COMPASS_NAME"), descStr, _btn_SummonParty
  registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
  TooltipSimple_Show(uiControl, name, desc)
end

Panel_SummonParty_Open = function()
  -- function num : 0_48 , upvalues : _btn_SummonParty
  local remainTime_s64 = ToClient_GetLeftUsableTeleportCompassTime()
  local remainTime = Int64toInt32(remainTime_s64)
  local partyActorKey = ToClient_GetCharacterActorKeyRawUseCompass()
  local playerActorKey = (getSelfPlayer()):getActorKey()
  if partyActorKey ~= playerActorKey then
    if remainTime > 0 then
      Panel_SummonParty:SetShow(true)
      _btn_SummonParty:EraseAllEffect()
      _btn_SummonParty:AddEffect("fUI_Buster_Call01", true, 0, 0)
    else
      Panel_SummonParty_Close()
    end
  end
end

Panel_SummonParty_Close = function()
  -- function num : 0_49 , upvalues : _btn_SummonParty
  if Panel_SummonParty:GetShow() then
    _btn_SummonParty:EraseAllEffect()
    Panel_SummonParty:SetShow(false)
  end
end

local summonPartyCheck = function()
  -- function num : 0_50
  local leftTime = Int64toInt32(ToClient_GetLeftUsableTeleportCompassTime())
  if leftTime > 0 then
    local partyActorKey = ToClient_GetCharacterActorKeyRawUseCompass()
    local playerActorKey = (getSelfPlayer()):getActorKey()
    if partyActorKey ~= playerActorKey then
      if RequestParty_getPartyMemberCount() > 0 then
        Panel_SummonParty_Open()
      else
        Panel_SummonParty_Close()
      end
    else
      Panel_SummonParty_Close()
    end
  else
    do
      Panel_SummonParty_Close()
    end
  end
end

summonPartyCheck()
FGlobal_SummonPartyCheck = function()
  -- function num : 0_51 , upvalues : summonPartyCheck
  summonPartyCheck()
end

FromClient_ResponseUseCompass = function()
  -- function num : 0_52 , upvalues : partyName
  Panel_SummonParty_Open()
  partyName = ""
  partyName = ToClient_GetCharacterNameUseCompass()
  local partyActorKey = ToClient_GetCharacterActorKeyRawUseCompass()
  local playerActorKey = (getSelfPlayer()):getActorKey()
  local msg = ""
  if partyActorKey == playerActorKey then
    msg = PAGetString(Defines.StringSheet_GAME, "LUA_COMPASS_MESSAGE_1")
  else
    msg = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_COMPASS_MESSAGE_2", "partyName", partyName)
  end
  Proc_ShowMessage_Ack(msg)
  FGlobal_MovieGuideButton_Position()
end

registerEvent("FromClient_ResponseUseCompass", "FromClient_ResponseUseCompass")
local _btn_TownNpcNavi = nil
if ((getSelfPlayer()):get()):getLevel() > 51 then
  _btn_TownNpcNavi = (UI.getChildControl)(Panel_Widget_TownNpcNavi, "Button_FindNavi")
else
  _btn_TownNpcNavi = (UI.getChildControl)(Panel_Widget_TownNpcNavi, "Button_FindNaviTW")
end
FGlobal_MovieGuideButton_Position = function()
  -- function num : 0_53 , upvalues : _btn_TownNpcNavi, _btn_MovieGuide
  local showIconCount = 0
  local controlGapX = 5
  local sizeX = _btn_TownNpcNavi:GetSizeX()
  if getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_CBT then
    if isGameTypeEnglish() then
      Panel_MovieGuideButton:SetShow(true)
    else
      Panel_MovieGuideButton:SetShow(false)
    end
  else
    Panel_MovieGuideButton:SetShow(not isRecordMode)
  end
  if _btn_TownNpcNavi:GetShow() then
    showIconCount = showIconCount + 1
  end
  if Panel_MovieGuideButton:GetShow() then
    showIconCount = showIconCount + 1
  end
  local RadarPosX = FGlobal_Panel_Radar_GetPosX()
  local RadarPosY = FGlobal_Panel_Radar_GetPosY()
  local RadarSpanSizeY = FGlobal_Panel_Radar_GetSpanSizeY()
  Panel_MovieGuideButton:SetPosX(RadarPosX - (sizeX + controlGapX) * (showIconCount) - 5)
  Panel_MovieGuideButton:SetPosY(_btn_TownNpcNavi:GetPosY() + 10)
  Panel_MovieGuide:SetPosX(RadarPosX - Panel_MovieGuide:GetSizeX() - 100)
  Panel_MovieGuide:SetPosY(_btn_MovieGuide:GetPosY() + 25)
  if ToClient_IsContentsGroupOpen("75") then
    Panel_VoiceChatStatus:SetShow(not isRecordMode)
    showIconCount = showIconCount + 1
    Panel_VoiceChatStatus:SetPosX(RadarPosX - (sizeX + controlGapX) * (showIconCount) - 5)
    Panel_VoiceChatStatus:SetPosY(Panel_MovieGuideButton:GetPosY())
  else
    Panel_VoiceChatStatus:SetShow(false)
  end
  if ToClient_IsContentsGroupOpen("28") then
    Panel_HuntingAlertButton:SetShow(not isRecordMode)
    showIconCount = showIconCount + 1
    Panel_HuntingAlertButton:SetPosX(RadarPosX - (sizeX + controlGapX) * (showIconCount) - 5)
    Panel_HuntingAlertButton:SetPosY(Panel_MovieGuideButton:GetPosY())
  else
    Panel_HuntingAlertButton:SetShow(false)
  end
  Panel_VillageSiegeArea:SetShow(not isRecordMode)
  showIconCount = showIconCount + 1
  Panel_VillageSiegeArea:SetPosX(RadarPosX - (sizeX + controlGapX) * (showIconCount) - 5)
  Panel_VillageSiegeArea:SetPosY(Panel_MovieGuideButton:GetPosY())
  if Panel_SummonElephant:GetShow() then
    showIconCount = showIconCount + 1
    Panel_SummonElephant:SetPosX(RadarPosX - (sizeX + controlGapX) * (showIconCount) - 5)
    Panel_SummonElephant:SetPosY(Panel_MovieGuideButton:GetPosY())
  end
  local trainableMinLev = 50
  local isBuff = ((getSelfPlayer()):get()):isApplyChargeSkill((CppEnums.UserChargeType).eUserChargeType_BlackSpritTraining)
  if ToClient_IsContentsGroupOpen("57") and trainableMinLev <= ((getSelfPlayer()):get()):getLevel() then
    Panel_AutoTraining:SetShow(not isRecordMode)
    showIconCount = showIconCount + 1
    Panel_AutoTraining:SetPosX(RadarPosX - (sizeX + controlGapX) * (showIconCount) - 5)
    Panel_AutoTraining:SetPosY(10)
  end
  FGlobal_BusterCallCheck()
  FGlobal_ReturnStoneCheck()
  FGlobal_SummonPartyCheck()
  FGlobal_WarCallCheck()
  if Panel_BusterCall:GetShow() then
    showIconCount = showIconCount + 1
    Panel_BusterCall:SetPosX(RadarPosX - (sizeX + controlGapX) * (showIconCount) - 5)
    Panel_BusterCall:SetPosY(10)
  end
  if Panel_ReturnStone:GetShow() then
    showIconCount = showIconCount + 1
    Panel_ReturnStone:SetPosX(RadarPosX - (sizeX + controlGapX) * (showIconCount) - 5)
    Panel_ReturnStone:SetPosY(10)
  end
  if Panel_SummonParty:GetShow() then
    showIconCount = showIconCount + 1
    Panel_SummonParty:SetPosX(RadarPosX - (sizeX + controlGapX) * (showIconCount) - 5)
    Panel_SummonParty:SetPosY(10)
  end
  if Panel_WarCall:GetShow() then
    showIconCount = showIconCount + 1
    Panel_WarCall:SetPosX(RadarPosX - (sizeX + controlGapX) * (showIconCount) - 5)
    Panel_WarCall:SetPosY(10)
  end
end

Panel_MovieGuide_Initialize()
FGlobal_MovieGuideButton_Position()
registerEvent("EventSelfPlayerLevelUp", "Panel_MovieGuide_LevelCheck")
registerEvent("onScreenResize", "FGlobal_MovieGuideButton_Position")
registerEvent("EventSelfPlayerLevelUp", "Panel_MovieGuide_LevelCheck")
registerEvent("FromClient_RenderModeChangeState", "renderModeChange_MovieGuideButton_Position")

