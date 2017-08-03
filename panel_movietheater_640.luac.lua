-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\movie\panel_movietheater_640.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
Panel_MovieTheater_640:ActiveMouseEventEffect(true)
Panel_MovieTheater_640:setGlassBackground(true)
Panel_MovieTheater_640:SetShow(false, false)
Panel_MovieTheater_640:RegisterShowEventFunc(true, "Panel_MovieTheater640_ShowAni()")
Panel_MovieTheater_640:RegisterShowEventFunc(false, "Panel_MovieTheater640_HideAni()")
Panel_MovieTheater640_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.AlphaAnimation)(1, Panel_MovieTheater_640, 0, 0.15)
  local aniInfo1 = Panel_MovieTheater_640:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_MovieTheater_640:GetSizeX() / 2
  aniInfo1.AxisY = Panel_MovieTheater_640:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_MovieTheater_640:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_MovieTheater_640:GetSizeX() / 2
  aniInfo2.AxisY = Panel_MovieTheater_640:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_MovieTheater640_HideAni = function()
  -- function num : 0_1
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_MovieTheater_640, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

local _btn_Close = (UI.getChildControl)(Panel_MovieTheater_640, "Button_Close")
local _btn_Replay = (UI.getChildControl)(Panel_MovieTheater_640, "Button_Replay")
local _txt_Title = (UI.getChildControl)(Panel_MovieTheater_640, "StaticText_Title")
local _movieTheater_640 = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_MovieTheater_640, "WebControl_WorldmapGuide")
_btn_Close:addInputEvent("Mouse_LUp", "Panel_MovieTheater640_WindowClose()")
_btn_Replay:addInputEvent("Mouse_LUp", "Panel_MovieTheater640_Replay()")
_movieTheater_640:addInputEvent("Mouse_Out", "Panel_MovieTheater640_HideControl()")
_movieTheater_640:addInputEvent("Mouse_On", "Panel_MovieTheater640_ShowControl()")
Panel_MovieTheater640_Initialize = function()
  -- function num : 0_2 , upvalues : _movieTheater_640
  _movieTheater_640:SetPosX(5)
  _movieTheater_640:SetPosY(38)
  _movieTheater_640:SetSize(640, 480)
  _movieTheater_640:SetUrl(640, 480, "coui://UI_Data/UI_Html/UI_Guide_Movie_640.html")
  Panel_MovieTheater_640:SetSize(Panel_MovieTheater_640:GetSizeX(), 557)
end

local playedNo = 0
local movieDesc = {PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_1"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_2"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_3"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_4"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVIETHEATER_640_MOVIEDESC_DEFAULT"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVIETHEATER_640_MOVIEDESC_SKILLCOMBO"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_10"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_11"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_12"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_13"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_14"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_15"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_16"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_17"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_18"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_19"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_20"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_21"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_22"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_23"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_24"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_25"), PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_26"); [0] = PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITHEATER_640_MOVIEDESC_0")}
local prevTitleNo = -1
Panel_MovieTheater640_GameGuide_Func = function(titleNo)
  -- function num : 0_3 , upvalues : _movieTheater_640, prevTitleNo, _txt_Title, movieDesc, playedNo
  if not _movieTheater_640:isReadyView() then
    return 
  end
  _movieTheater_640:TriggerEvent("ControlAudio", getVolumeParam(0) / 100)
  local isShow = Panel_MovieTheater_640:IsShow()
  if isShow == true and prevTitleNo == titleNo then
    Panel_MovieTheater_640:SetShow(false, true)
    prevTitleNo = -1
    return 
  else
    if titleNo ~= 6 then
      Panel_MovieTheater_640:SetShow(true, true)
      _movieTheater_640:SetShow(true)
      Panel_Window_SkillGuide_Close()
      Panel_MovieTheater_SkillGuide_640_JustClose()
    end
  end
  _txt_Title:SetText(movieDesc[titleNo])
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
              _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_Control.webm")
              playedNo = 5
            else
              if titleNo == 6 then
                Panel_Window_SkillGuide_ShowToggle()
              else
                if titleNo == 7 then
                  _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_03.webm")
                  playedNo = 7
                else
                  if titleNo == 8 then
                    _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_04.webm")
                    playedNo = 8
                  else
                    if titleNo == 9 then
                      _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_05.webm")
                      playedNo = 9
                    else
                      if titleNo == 10 then
                        _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_06.webm")
                        playedNo = 10
                      else
                        if titleNo == 11 then
                          _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_07.webm")
                          playedNo = 11
                        else
                          if titleNo == 12 then
                            _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_08.webm")
                            playedNo = 12
                          else
                            if titleNo == 13 then
                              _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_09_Fish.webm")
                              playedNo = 13
                            else
                              if titleNo == 14 then
                                _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_10_Wp.webm")
                                playedNo = 14
                              else
                                if titleNo == 15 then
                                  _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_11_Dial.webm")
                                  playedNo = 15
                                else
                                  if titleNo == 16 then
                                    _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_12_Intimacy.webm")
                                    playedNo = 16
                                  else
                                    if titleNo == 17 then
                                      _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_13_MoveHouse.webm")
                                      playedNo = 17
                                    else
                                      if titleNo == 18 then
                                        _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_14_Cook.webm")
                                        playedNo = 18
                                      else
                                        if titleNo == 19 then
                                          _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_15_Alchemy.webm")
                                          playedNo = 19
                                        else
                                          if titleNo == 20 then
                                            _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_16_Tent.webm")
                                            playedNo = 20
                                          else
                                            if titleNo == 21 then
                                              _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_17_QuestFilter.webm")
                                              playedNo = 21
                                            else
                                              if titleNo == 22 then
                                                _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_18_Findway.webm")
                                                playedNo = 22
                                              else
                                                if titleNo == 23 then
                                                  _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_19_BlackRage.webm")
                                                  playedNo = 23
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

Panel_MovieTheater640_Replay = function()
  -- function num : 0_4 , upvalues : _movieTheater_640, playedNo
  if not _movieTheater_640:isReadyView() then
    return 
  end
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
              _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_Control.webm")
            else
            end
          end
        end
      end
    end
  end
  if playedNo ~= 6 or playedNo == 7 then
    _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_03.webm")
  else
    if playedNo == 8 then
      _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_04.webm")
    else
      if playedNo == 9 then
        _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_05.webm")
      else
        if playedNo == 10 then
          _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_06.webm")
        else
          if playedNo == 11 then
            _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_07.webm")
          else
            if playedNo == 12 then
              _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_08.webm")
            else
              if playedNo == 13 then
                _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_09_Fish.webm")
              else
                if playedNo == 14 then
                  _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_10_Wp.webm")
                else
                  if playedNo == 15 then
                    _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_11_Dial.webm")
                  else
                    if playedNo == 16 then
                      _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_12_Intimacy.webm")
                    else
                      if playedNo == 17 then
                        _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_13_MoveHouse.webm")
                      else
                        if playedNo == 18 then
                          _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_14_Cook.webm")
                        else
                          if playedNo == 19 then
                            _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_15_Alchemy.webm")
                          else
                            if playedNo == 20 then
                              _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_16_Tent.webm")
                            else
                              if playedNo == 21 then
                                _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_17_QuestFilter.webm")
                              else
                                if playedNo == 22 then
                                  _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_18_Findway.webm")
                                else
                                  if playedNo == 23 then
                                    _movieTheater_640:TriggerEvent("PlayMovie", "coui://UI_Movie/Movie_Guide/World_Guide_19_BlackRage.webm")
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

Panel_MovieTheater640_WindowClose = function()
  -- function num : 0_5 , upvalues : _movieTheater_640
  Panel_MovieTheater_640:SetShow(false, false)
  _movieTheater_640:TriggerEvent("ControlAudio", 0)
  if Panel_WorldMap:GetShow() then
    Panel_Worldmap_MovieGuide_Close()
  end
end

Panel_MovieTheater640_Reset = function()
  -- function num : 0_6 , upvalues : _movieTheater_640
  _movieTheater_640:ResetUrl()
end

FGlobal_Panel_MovieTheater640_WindowClose = function()
  -- function num : 0_7
  Panel_MovieTheater_640:SetShow(false, true)
  Panel_MovieTheater640_Reset()
end

Panel_MovieTheater640_ShowControl = function()
  -- function num : 0_8 , upvalues : _movieTheater_640
  _movieTheater_640:TriggerEvent("ShowControl", "true")
end

Panel_MovieTheater640_HideControl = function()
  -- function num : 0_9 , upvalues : _movieTheater_640
  _movieTheater_640:TriggerEvent("ShowControl", "false")
end


