-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\movie\panel_movietheater_lowlevel.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
Panel_MovieTheater_LowLevel:ActiveMouseEventEffect(true)
Panel_MovieTheater_LowLevel:setGlassBackground(true)
Panel_MovieTheater_LowLevel:SetShow(false, false)
Panel_MovieTheater_LowLevel:RegisterShowEventFunc(true, "Panel_MovieTheater_LowLevel_ShowAni()")
Panel_MovieTheater_LowLevel:RegisterShowEventFunc(false, "Panel_MovieTheater_LowLevel_HideAni()")
local countryType = true
if (isGameTypeJapan() or isGameTypeRussia() or isGameTypeEnglish() or isGameTypeTaiwan()) and getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_CBT then
  countryType = false
else
  if isGameTypeKR2() then
    countryType = false
  else
    countryType = true
  end
end
Panel_MovieTheater_LowLevel_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.AlphaAnimation)(1, Panel_MovieTheater_LowLevel, 0, 0.15)
  local aniInfo1 = Panel_MovieTheater_LowLevel:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_MovieTheater_LowLevel:GetSizeX() / 2
  aniInfo1.AxisY = Panel_MovieTheater_LowLevel:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_MovieTheater_LowLevel:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_MovieTheater_LowLevel:GetSizeX() / 2
  aniInfo2.AxisY = Panel_MovieTheater_LowLevel:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_MovieTheater_LowLevel_HideAni = function()
  -- function num : 0_1
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_MovieTheater_LowLevel, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

local _btn_Close = (UI.getChildControl)(Panel_MovieTheater_LowLevel, "Button_Close")
local _btn_Replay = (UI.getChildControl)(Panel_MovieTheater_LowLevel, "Button_Replay")
local _txt_Title = (UI.getChildControl)(Panel_MovieTheater_LowLevel, "StaticText_Title")
local _movieTheater_640 = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_MovieTheater_LowLevel, "WebControl_WorldmapGuide")
_btn_Close:addInputEvent("Mouse_LUp", "Panel_MovieTheater_LowLevel_WindowClose()")
_btn_Replay:addInputEvent("Mouse_LUp", "Panel_MovieTheater_LowLevel_Replay()")
_movieTheater_640:addInputEvent("Mouse_Out", "Panel_MovieTheater_LowLevel_HideControl()")
_movieTheater_640:addInputEvent("Mouse_On", "Panel_MovieTheater_LowLevel_ShowControl()")
local isMoviePlay = false
Panel_MovieTheater_LowLevel_Initialize = function()
  -- function num : 0_2 , upvalues : _movieTheater_640
  _movieTheater_640:SetPosX(5)
  _movieTheater_640:SetPosY(38)
  _movieTheater_640:SetSize(450, 338)
  _movieTheater_640:ResetUrl()
  Panel_MovieTheater_LowLevel:SetSize(Panel_MovieTheater_LowLevel:GetSizeX(), 417)
  Panel_MovieTheater_LowLevel_OnScreenResize()
end

local playedNo = 0
local movieDesc = {PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_1"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_2"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_3"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_4"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_5"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_6"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_7"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_8"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_9"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_27"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_28"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_29"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_30"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_31"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_32"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_10"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_11"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_12"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_13"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_14"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_15"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_16"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_17"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_18"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_19"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_20"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_21"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_22"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_23"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_24"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_25"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_26"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_0")}
Panel_LowLevelGuide_Value_IsCheckMoviePlay = 0
FGlobal_Panel_LowLevelGuide_MovePlay_FindWay = function()
  -- function num : 0_3
  Panel_LowLevelGuide_Value_IsCheckMoviePlay = 1
  Panel_MovieTheater_LowLevel_WindowClose()
  Panel_MovieTheater_LowLevel_GameGuide_Func(2)
end

FGlobal_Panel_LowLevelGuide_MovePlay_LearnSkill = function()
  -- function num : 0_4
  Panel_LowLevelGuide_Value_IsCheckMoviePlay = 2
  Panel_MovieTheater_LowLevel_WindowClose()
  Panel_MovieTheater_LowLevel_GameGuide_Func(3)
end

FGlobal_Panel_LowLevelGuide_MovePlay_FindTarget = function()
  -- function num : 0_5
  Panel_LowLevelGuide_Value_IsCheckMoviePlay = 3
  Panel_MovieTheater_LowLevel_WindowClose()
  Panel_MovieTheater_LowLevel_GameGuide_Func(4)
end

FGlobal_Panel_LowLevelGuide_MovePlay_AcceptQuest = function()
  -- function num : 0_6
  Panel_LowLevelGuide_Value_IsCheckMoviePlay = 4
  Panel_MovieTheater_LowLevel_WindowClose()
  Panel_MovieTheater_LowLevel_GameGuide_Func(1)
end

FGlobal_Panel_LowLevelGuide_MovePlay_BlackSpirit = function()
  -- function num : 0_7
  Panel_LowLevelGuide_Value_IsCheckMoviePlay = 99
  Panel_MovieTheater_LowLevel_WindowClose()
  Panel_MovieTheater_LowLevel_GameGuide_Func(99)
end

FGlobal_Panel_LowLevelGuide_MovePlay_Battle = function(class)
  -- function num : 0_8
  local movieNo = nil
  if class == (CppEnums.ClassType).ClassType_Warrior then
    movieNo = 5
  else
    if class == (CppEnums.ClassType).ClassType_Ranger then
      movieNo = 6
    else
      if class == (CppEnums.ClassType).ClassType_Sorcerer then
        movieNo = 7
      else
        if class == (CppEnums.ClassType).ClassType_Giant then
          movieNo = 8
        else
          if class == (CppEnums.ClassType).ClassType_Tamer then
            movieNo = 9
          else
            if class == (CppEnums.ClassType).ClassType_BladeMaster then
              movieNo = 10
            else
              if class == (CppEnums.ClassType).ClassType_Valkyrie then
                movieNo = 11
              else
                if class == (CppEnums.ClassType).ClassType_BladeMasterWomen then
                  movieNo = 12
                else
                  if class == (CppEnums.ClassType).ClassType_Wizard then
                    movieNo = 13
                  else
                    if class == (CppEnums.ClassType).ClassType_WizardWomen then
                      movieNo = 14
                    else
                      if class == (CppEnums.ClassType).ClassType_NinjaWomen then
                        movieNo = 15
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  Panel_LowLevelGuide_Value_IsCheckMoviePlay = movieNo
  Panel_MovieTheater_LowLevel_WindowClose()
  Panel_MovieTheater_LowLevel_GameGuide_Func(movieNo)
end

local prevTitleNo = -1
local titleNo = 0
Panel_MovieTheater_LowLevel_GameGuide_Func = function(movieNo)
  -- function num : 0_9 , upvalues : _movieTheater_640, countryType, _txt_Title, movieDesc, titleNo, isMoviePlay
  _movieTheater_640:SetUrl(450, 338, "coui://UI_Data/UI_Html/UI_Guide_Movie_450.html")
  _movieTheater_640:SetShow(countryType)
  _txt_Title:SetText(movieDesc[movieNo])
  titleNo = movieNo
  isMoviePlay = true
  Panel_MovieTheater_LowLevel:SetShow(countryType, countryType)
end

Panel_MovieTheater_LowLevel_TriggerEvent = function()
  -- function num : 0_10 , upvalues : _movieTheater_640, titleNo, playedNo, _txt_Title, prevTitleNo
  _movieTheater_640:TriggerEvent("ControlAudio", getVolumeParam(0) / 100)
  if titleNo == 0 then
    _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_02.webm")
    playedNo = 0
  else
    if titleNo == 1 then
      _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_01.webm")
      playedNo = 1
    else
      if titleNo == 2 then
        _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_20_FindWay.webm")
        playedNo = 2
      else
        if titleNo == 3 then
          _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_21_LearnSkill.webm")
          playedNo = 3
        else
          if titleNo == 4 then
            _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_22_FindTarget.webm")
            playedNo = 4
          else
            if titleNo == 5 then
              _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_Combat_Warrior.webm")
              playedNo = 5
            else
              if titleNo == 6 then
                _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_Combat_Ranger.webm")
                playedNo = 6
              else
                if titleNo == 7 then
                  _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_Combat_Sorcer.webm")
                  playedNo = 7
                else
                  if titleNo == 8 then
                    _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_Combat_Giant.webm")
                    playedNo = 8
                  else
                    if titleNo == 9 then
                      _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_Combat_BeastMaster.webm")
                      playedNo = 9
                    else
                      if titleNo == 10 then
                        _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_Combat_Blader.webm")
                        playedNo = 10
                      else
                        if titleNo == 11 then
                          _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_Combat_Valkyrie.webm")
                          playedNo = 11
                        else
                          if titleNo == 12 then
                            _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_Combat_BladerWomen.webm")
                            playedNo = 12
                          else
                            if titleNo == 13 then
                              _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_Combat_Wizard.webm")
                              playedNo = 13
                            else
                              if titleNo == 14 then
                                _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_Combat_WizardWomen.webm")
                                playedNo = 14
                              else
                                if titleNo == 15 then
                                  _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_Combat_NinjaWomen.webm")
                                  playedNo = 15
                                else
                                  if titleNo == 16 then
                                    _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_03.webm")
                                    playedNo = 16
                                  else
                                    if titleNo == 17 then
                                      _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_04.webm")
                                      playedNo = 17
                                    else
                                      if titleNo == 18 then
                                        _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_05.webm")
                                        playedNo = 18
                                      else
                                        if titleNo == 19 then
                                          _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_06.webm")
                                          playedNo = 19
                                        else
                                          if titleNo == 20 then
                                            _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_07.webm")
                                            playedNo = 20
                                          else
                                            if titleNo == 21 then
                                              _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_08.webm")
                                              playedNo = 21
                                            else
                                              if titleNo == 22 then
                                                _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_09_Fish.webm")
                                                playedNo = 22
                                              else
                                                if titleNo == 23 then
                                                  _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_10_Wp.webm")
                                                  playedNo = 23
                                                else
                                                  if titleNo == 24 then
                                                    _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_11_Dial.webm")
                                                    playedNo = 24
                                                  else
                                                    if titleNo == 25 then
                                                      _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_12_Intimacy.webm")
                                                      playedNo = 25
                                                    else
                                                      if titleNo == 26 then
                                                        _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_13_MoveHouse.webm")
                                                        playedNo = 26
                                                      else
                                                        if titleNo == 27 then
                                                          _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_14_Cook.webm")
                                                          playedNo = 27
                                                        else
                                                          if titleNo == 28 then
                                                            _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_15_Alchemy.webm")
                                                            playedNo = 28
                                                          else
                                                            if titleNo == 29 then
                                                              _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_16_Tent.webm")
                                                              playedNo = 29
                                                            else
                                                              if titleNo == 30 then
                                                                _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_17_QuestFilter.webm")
                                                                playedNo = 30
                                                              else
                                                                if titleNo == 31 then
                                                                  _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_18_Findway.webm")
                                                                  playedNo = 31
                                                                else
                                                                  if titleNo == 32 then
                                                                    _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_19_BlackRage.webm")
                                                                    playedNo = 32
                                                                  else
                                                                    if titleNo == 99 then
                                                                      _txt_Title:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_LOWLEVEL_SPRITQUEST"))
                                                                      _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_99_BlackSpirit.webm")
                                                                      playedNo = 99
                                                                    end
                                                                  end
                                                                end
                                                              end
                                                            end
                                                          end
                                                        end
                                                      end
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  prevTitleNo = titleNo
end

Panel_MovieTheater_LowLevel_Replay = function()
  -- function num : 0_11 , upvalues : _movieTheater_640, playedNo
  _movieTheater_640:TriggerEvent("ControlAudio", 0.3)
  if playedNo == 0 then
    _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_02.webm")
  else
    if playedNo == 1 then
      _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_01.webm")
    else
      if playedNo == 2 then
        _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_20_FindWay.webm")
      else
        if playedNo == 3 then
          _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_21_LearnSkill.webm")
        else
          if playedNo == 4 then
            _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_22_FindTarget.webm")
          else
            if playedNo == 5 then
              _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_Combat_Warrior.webm")
            else
              if playedNo == 6 then
                _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_Combat_Ranger.webm")
              else
                if playedNo == 7 then
                  _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_Combat_Sorcer.webm")
                else
                  if playedNo == 8 then
                    _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_Combat_Giant.webm")
                  else
                    if playedNo == 9 then
                      _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_Combat_BeastMaster.webm")
                    else
                      if playedNo == 10 then
                        _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_Combat_Blader.webm")
                      else
                        if playedNo == 11 then
                          _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_Combat_Valkyrie.webm")
                        else
                          if playedNo == 12 then
                            _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_Combat_BladerWomen.webm")
                          else
                            if playedNo == 13 then
                              _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_Combat_Wizard.webm")
                            else
                              if playedNo == 14 then
                                _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_Combat_WizardWomen.webm")
                              else
                                if playedNo == 15 then
                                  _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_Combat_NinjaWomen.webm")
                                else
                                  if playedNo == 16 then
                                    _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_03.webm")
                                  else
                                    if playedNo == 17 then
                                      _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_04.webm")
                                    else
                                      if playedNo == 18 then
                                        _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_05.webm")
                                      else
                                        if playedNo == 19 then
                                          _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_06.webm")
                                        else
                                          if playedNo == 20 then
                                            _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_07.webm")
                                          else
                                            if playedNo == 21 then
                                              _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_08.webm")
                                            else
                                              if playedNo == 22 then
                                                _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_09_Fish.webm")
                                              else
                                                if playedNo == 23 then
                                                  _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_10_Wp.webm")
                                                else
                                                  if playedNo == 24 then
                                                    _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_11_Dial.webm")
                                                  else
                                                    if playedNo == 25 then
                                                      _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_12_Intimacy.webm")
                                                    else
                                                      if playedNo == 26 then
                                                        _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_13_MoveHouse.webm")
                                                      else
                                                        if playedNo == 27 then
                                                          _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_14_Cook.webm")
                                                        else
                                                          if playedNo == 28 then
                                                            _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_15_Alchemy.webm")
                                                          else
                                                            if playedNo == 29 then
                                                              _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_16_Tent.webm")
                                                            else
                                                              if playedNo == 30 then
                                                                _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_17_QuestFilter.webm")
                                                              else
                                                                if playedNo == 31 then
                                                                  _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_18_Findway.webm")
                                                                else
                                                                  if playedNo == 32 then
                                                                    _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_19_BlackRage.webm")
                                                                  else
                                                                    if playedNo == 99 then
                                                                      _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_99_BlackSpirit.webm")
                                                                    end
                                                                  end
                                                                end
                                                              end
                                                            end
                                                          end
                                                        end
                                                      end
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

Panel_MovieTheater_LowLevel_WindowClose = function()
  -- function num : 0_12 , upvalues : _movieTheater_640, isMoviePlay
  Panel_MovieTheater_LowLevel:SetShow(false, true)
  _movieTheater_640:TriggerEvent("StopMovie", "test")
  isMoviePlay = false
end

Panel_MovieTheater_LowLevel_OnScreenResize = function()
  -- function num : 0_13
  Panel_MovieTheater_LowLevel:SetPosX(10)
  Panel_MovieTheater_LowLevel:SetPosY(getScreenSizeY() - Panel_MovieTheater_LowLevel:GetSizeY() - 50)
end

ToClient_EndGuideMovie = function(movieId)
  -- function num : 0_14
  if movieId == 450 then
    Panel_MovieTheater_LowLevel_WindowClose()
  end
end

local updateTime = 0
UpdateMovieTheaterLowLevel = function(deltaTime)
  -- function num : 0_15 , upvalues : isMoviePlay, updateTime, _movieTheater_640
  if not isMoviePlay then
    return 
  end
  updateTime = updateTime + deltaTime
  if updateTime > 0.5 and _movieTheater_640:isReadyView() then
    Panel_MovieTheater_LowLevel_TriggerEvent()
    isMoviePlay = false
    updateTime = 0
  end
  if updateTime > 3 then
    isMoviePlay = true
    updateTime = 0
  end
end

Panel_MovieTheater_LowLevel_ShowControl = function()
  -- function num : 0_16 , upvalues : _movieTheater_640
  _movieTheater_640:TriggerEvent("ShowControl", "true")
end

Panel_MovieTheater_LowLevel_HideControl = function()
  -- function num : 0_17 , upvalues : _movieTheater_640
  _movieTheater_640:TriggerEvent("ShowControl", "false")
end

Panel_MovieTheater_LowLevel_Initialize()
Panel_MovieTheater_LowLevel:RegisterUpdateFunc("UpdateMovieTheaterLowLevel")
registerEvent("onScreenResize", "Panel_MovieTheater_LowLevel_OnScreenResize")
registerEvent("ToClient_EndGuideMovie", "ToClient_EndGuideMovie")

