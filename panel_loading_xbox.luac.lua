-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\panel_loading_xbox.luac 

-- params : ...
-- function num : 0
Panel_Loading_Xbox:SetShow(true)
local _knowledge_title = (UI.getChildControl)(Panel_Loading_Xbox, "StaticText_knowTitle")
local progressRate = (UI.getChildControl)(Panel_Loading_Xbox, "Progress2_Loading")
local progressHead = (UI.getChildControl)(progressRate, "Progress2_Bar_Head")
local goblinRun = (UI.getChildControl)(Panel_Loading_Xbox, "Static_GoblinRun")
progressRate:SetShow(true)
progressHead:SetShow(true)
goblinRun:SetShow(true)
_knowledge_title:SetShow(true)
progressRate:SetCurrentProgressRate(0)
local LoadingPanel_Init = function()
  -- function num : 0_0 , upvalues : progressRate, progressHead, goblinRun
  progressRate:SetCurrentProgressRate(0)
  local progressRateX = progressRate:GetPosX()
  local progressRateY = progressRate:GetPosY()
  local progressHeadX = progressHead:GetPosX()
  local progressHeadY = progressHead:GetPosY()
  goblinRun:ChangeTextureInfoName("New_UI_Common_ForLua/Default/goblrun2.dds")
  goblinRun:SetPosX(progressRateX + progressHeadX + progressHead:GetSizeX())
  goblinRun:SetPosY(progressRateY + progressHeadY + 25)
end

LoadingPanel_SetProgress_Xbox = function(rate)
  -- function num : 0_1 , upvalues : _knowledge_title, progressRate, progressHead, goblinRun
  _knowledge_title:SetText(rate)
  progressRate:SetProgressRate(rate)
  local progressRateX = progressRate:GetPosX()
  local progressRateY = progressRate:GetPosY()
  local progressHeadX = progressHead:GetPosX()
  local progressHeadY = progressHead:GetPosY()
  goblinRun:SetPosX(progressRateX + progressHeadX + progressHead:GetSizeX())
  goblinRun:SetPosY(progressRateY + progressHeadY + 25)
end

local screenX, screenY = getScreenSizeX(), getScreenSizeY()
local tempTime = 0
GoblinUpdate = function(deltaTime)
  -- function num : 0_2 , upvalues : goblinRun, _knowledge_title, tempTime, screenX, screenY
  goblinRun:SetShow(true)
  _knowledge_title:SetShow(true)
  tempTime = tempTime + deltaTime
  _knowledge_title:SetText((math.floor)(tempTime))
  goblinRun:SetPosX(screenX * 0.5)
  goblinRun:SetPosY(screenY * 0.5)
end

registerEvent("FromClient_completeDownloadProgress", "LoadingPanel_SetProgress_Xbox")
LoadingPanel_Init()

