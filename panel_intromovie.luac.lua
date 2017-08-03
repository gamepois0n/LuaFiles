-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\movie\panel_intromovie.luac 

-- params : ...
-- function num : 0
Panel_IntroMovie:SetShow(false, false)
local updateTime = 0
local static_IntroMovie = nil
local IM = CppEnums.EProcessorInputMode
isIntroMoviePlaying = false
local introMoviePlayTime = 20
InitIntroMoviePanel = function()
  -- function num : 0_0 , upvalues : static_IntroMovie, introMoviePlayTime
  local uiScale = getGlobalScale()
  local selfPlayerWrapper = getSelfPlayer()
  if selfPlayerWrapper == nil then
    return 
  end
  local selfPlayerLevel = (selfPlayerWrapper:get()):getLevel()
  local selfPlayerExp = (selfPlayerWrapper:get()):getExp_s64()
  if selfPlayerLevel == 1 and isSwapCharacter() == false and static_IntroMovie == nil then
    ShowableFirstExperience(false)
    Panel_IntroMovie:SetShow(true, false)
    local sizeX = getResolutionSizeX()
    local sizeY = getResolutionSizeY()
    sizeX = sizeX / uiScale
    sizeY = sizeY / uiScale
    local movieSizeX = sizeX
    local movieSizeY = sizeX * 9 / 16
    local posX = 0
    local posY = 0
    if movieSizeY <= sizeY then
      posY = (sizeY - movieSizeY) / 2
    else
      movieSizeX = sizeY * 16 / 9
      movieSizeY = sizeY
      posX = (sizeX - movieSizeX) / 2
    end
    Panel_IntroMovie:SetPosX(0)
    Panel_IntroMovie:SetPosY(0)
    Panel_IntroMovie:SetSize(sizeX, sizeY)
    static_IntroMovie = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_IntroMovie, "WebControl_Movie")
    static_IntroMovie:SetIgnore(false)
    static_IntroMovie:SetPosX(posX)
    static_IntroMovie:SetPosY(posY)
    static_IntroMovie:SetSize(movieSizeX, movieSizeY)
    static_IntroMovie:SetUrl(1280, 720, "coui://UI_Data/UI_Html/Intro_Movie.html")
    isIntroMoviePlaying = true
    setMoviePlayMode(true)
  end
  do
    if isGameTypeKorea() then
      introMoviePlayTime = 60
    else
      if isGameTypeJapan() then
        introMoviePlayTime = 60
      else
        if isGameTypeEnglish() then
          introMoviePlayTime = 125
        else
          if isGameTypeRussia() then
            introMoviePlayTime = 60
          else
            if isGameTypeTaiwan() then
              introMoviePlayTime = 125
            else
              introMoviePlayTime = 60
            end
          end
        end
      end
    end
  end
end

CloseIntroMovie = function()
  -- function num : 0_1 , upvalues : static_IntroMovie
  if static_IntroMovie ~= nil then
    static_IntroMovie:TriggerEvent("StopMovie", "")
    static_IntroMovie:SetShow(false)
    static_IntroMovie = nil
  end
  Panel_IntroMovie:SetShow(false, false)
  isIntroMoviePlaying = false
  SetUIMode((Defines.UIMode).eUIMode_Default)
  setMoviePlayMode(false)
  ShowableFirstExperience(true)
  PaGlobal_TutorialManager:handleCloseIntroMovie()
end

local updateTime = 0
UpdateIntroMovie = function(deltaTime)
  -- function num : 0_2 , upvalues : updateTime, static_IntroMovie, introMoviePlayTime
  if isIntroMoviePlaying then
    updateTime = updateTime + deltaTime
    if static_IntroMovie:isReadyView() then
      ShowIntroMovie()
    end
    if introMoviePlayTime < updateTime then
      isIntroMoviePlaying = false
      setMoviePlayMode(false)
    end
  end
end

ShowIntroMovie = function()
  -- function num : 0_3 , upvalues : static_IntroMovie
  static_IntroMovie:TriggerEvent("PlayMovie", "")
  setMoviePlayMode(true)
end

ToClient_EndIntroMovie = function(movieId)
  -- function num : 0_4
  if movieId == 1 and Panel_IntroMovie:IsShow() then
    toClient_FadeIn(1)
    CloseIntroMovie()
  end
end

InitIntroMoviePanel()
Panel_IntroMovie:RegisterUpdateFunc("UpdateIntroMovie")
registerEvent("ToClient_EndGuideMovie", "ToClient_EndIntroMovie")

