-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\cutscene_ocean.luac 

-- params : ...
-- function num : 0
Panel_Cutscene:SetPosX(0)
Panel_Cutscene:SetPosY(0)
Panel_Cutscene:SetShow(false, false)
Panel_Cutscene:SetSize(getScreenSizeX(), getScreenSizeY())
Panel_Cutscene:SetIgnore(true)
local Static_LatterBoxTop = (UI.getChildControl)(Panel_Cutscene, "Static_LetterBoxTop")
local Static_LatterBoxBottom = (UI.getChildControl)(Panel_Cutscene, "Static_LetterBoxBottom")
local Static_LetterBoxLeft = (UI.getChildControl)(Panel_Cutscene, "Static_LetterBoxLeft")
local Static_LetterBoxRight = (UI.getChildControl)(Panel_Cutscene, "Static_LetterBoxRight")
local Static_FadeScreen = (UI.getChildControl)(Panel_Cutscene, "Static_FadeScreen")
local Multiline_Subtitle = (UI.getChildControl)(Panel_Cutscene, "MultilineText_Subtitle")
Update_Subtitle = function(deltaTime)
  -- function num : 0_0 , upvalues : Multiline_Subtitle
  if isSubtitleDelete == false then
    subtitleTimer = subtitleTimer + deltaTime
    if subtitleDeleteTime < subtitleTimer then
      subtitleTimer = 0
      subtitleDeleteTime = 0
      isSubtitleDelete = true
      Multiline_Subtitle:SetText("")
    end
  end
end

FromClient_PlayCutScene = function(cutSceneName, isFromServer)
  -- function num : 0_1 , upvalues : Static_FadeScreen, Static_LatterBoxTop, Static_LatterBoxBottom, Static_LetterBoxLeft, Static_LetterBoxRight, Multiline_Subtitle
  Panel_Cutscene:SetSize(getScreenSizeX(), getScreenSizeY())
  Panel_Cutscene:SetShow(true)
  local latterHeight = (getScreenSizeY() - 0.5625 * getScreenSizeX()) / 2
  local letterWidth = (getScreenSizeX() - 1.7777777777778 * getScreenSizeY()) / 2
  if latterHeight < 0 then
    latterHeight = 0
  end
  if letterWidth < 0 then
    letterWidth = 0
  end
  Static_FadeScreen:SetShow(true)
  Static_FadeScreen:SetSize(getScreenSizeX(), getScreenSizeY())
  Static_FadeScreen:ComputePos()
  Static_LatterBoxTop:SetShow(true)
  Static_LatterBoxTop:SetSize(getScreenSizeX(), latterHeight)
  Static_LatterBoxTop:ComputePos()
  Static_LatterBoxBottom:SetShow(true)
  Static_LatterBoxBottom:SetSize(getScreenSizeX(), latterHeight)
  Static_LatterBoxBottom:ComputePos()
  Static_LetterBoxLeft:SetShow(true)
  Static_LetterBoxLeft:SetSize(letterWidth, getScreenSizeX())
  Static_LetterBoxLeft:ComputePos()
  Static_LetterBoxRight:SetShow(true)
  Static_LetterBoxRight:SetSize(letterWidth, getScreenSizeX())
  Static_LetterBoxRight:ComputePos()
  Multiline_Subtitle:SetText("")
  Multiline_Subtitle:SetSize(getScreenSizeX(), Multiline_Subtitle:GetSizeY())
  Multiline_Subtitle:SetSpanSize(0, latterHeight + 10)
  Multiline_Subtitle:ComputePos()
  ToClient_CutscenePlay(cutSceneName, isFromServer)
end

FromClient_PlayCutSceneOcean = function(cutSceneName)
  -- function num : 0_2 , upvalues : Static_FadeScreen, Static_LatterBoxTop, Static_LatterBoxBottom, Static_LetterBoxLeft, Static_LetterBoxRight, Multiline_Subtitle
  Panel_Cutscene:SetSize(getScreenSizeX(), getScreenSizeY())
  Panel_Cutscene:SetShow(true)
  local latterHeight = (getScreenSizeY() - 0.5625 * getScreenSizeX()) / 2
  local letterWidth = (getScreenSizeX() - 1.7777777777778 * getScreenSizeY()) / 2
  if latterHeight < 0 then
    latterHeight = 0
  end
  if letterWidth < 0 then
    letterWidth = 0
  end
  Static_FadeScreen:SetShow(true)
  Static_FadeScreen:SetSize(getScreenSizeX(), getScreenSizeY())
  Static_FadeScreen:ComputePos()
  Static_LatterBoxTop:SetShow(true)
  Static_LatterBoxTop:SetSize(getScreenSizeX(), latterHeight)
  Static_LatterBoxTop:ComputePos()
  Static_LatterBoxBottom:SetShow(true)
  Static_LatterBoxBottom:SetSize(getScreenSizeX(), latterHeight)
  Static_LatterBoxBottom:ComputePos()
  Static_LetterBoxLeft:SetShow(true)
  Static_LetterBoxLeft:SetSize(letterWidth, getScreenSizeX())
  Static_LetterBoxLeft:ComputePos()
  Static_LetterBoxRight:SetShow(true)
  Static_LetterBoxRight:SetSize(letterWidth, getScreenSizeX())
  Static_LetterBoxRight:ComputePos()
  Multiline_Subtitle:SetText("")
  Multiline_Subtitle:SetSize(getScreenSizeX(), Multiline_Subtitle:GetSizeY())
  Multiline_Subtitle:SetSpanSize(0, latterHeight + 10)
  Multiline_Subtitle:ComputePos()
  ToClient_CutscenePlayOcean(cutSceneName)
end

FromClient_StopCutScene = function()
  -- function num : 0_3 , upvalues : Multiline_Subtitle, Static_LatterBoxTop, Static_LatterBoxBottom, Static_LetterBoxRight, Static_LetterBoxLeft, Static_FadeScreen
  Multiline_Subtitle:SetText("")
  Static_LatterBoxTop:SetShow(false)
  Static_LatterBoxBottom:SetShow(false)
  Static_LetterBoxRight:SetShow(false)
  Static_LetterBoxLeft:SetShow(false)
  Static_FadeScreen:SetShow(false)
  Panel_Cutscene:SetShow(false)
end

FromClient_SetSubtitle = function(subtitle, Time)
  -- function num : 0_4 , upvalues : Multiline_Subtitle
  Multiline_Subtitle:SetText(subtitle)
  subtitleTimer = 0
  subtitleDeleteTime = Time
  isSubtitleDelete = false
end

FromClient_SetScreenAlpha = function(value)
  -- function num : 0_5 , upvalues : Static_FadeScreen
  Static_FadeScreen:SetAlpha(value)
end

registerEvent("FromClient_PlayCutSceneOcean", "FromClient_PlayCutSceneOcean")
registerEvent("FromClient_PlayCutScene", "FromClient_PlayCutScene")
registerEvent("FromClient_StopCutScene", "FromClient_StopCutScene")
registerEvent("FromClient_SetScreenAlpha", "FromClient_SetScreenAlpha")
registerEvent("FromClient_SetSubtitle", "FromClient_SetSubtitle")
Panel_Cutscene:RegisterUpdateFunc("Update_Subtitle")

