-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\panel_loading_xbox.luac 

-- params : ...
-- function num : 0
Panel_Loading_Xbox:SetShow(true)
local _knowledge_title = (UI.getChildControl)(Panel_Loading_Xbox, "StaticText_knowTitle")
local progressRate = (UI.getChildControl)(Panel_Loading_Xbox, "Progress2_Loading")
local progressHead = (UI.getChildControl)(progressRate, "Progress2_Bar_Head")
local static_LoadingCircle = (UI.getChildControl)(Panel_Loading_Xbox, "Static_LoadingCircle")
local static_LoadingBlackSpirit = (UI.getChildControl)(Panel_Loading_Xbox, "Static_LoadingBlackSpirit")
static_LoadingCircle:SetAlpha(0)
static_LoadingBlackSpirit:SetAlpha(0)
static_LoadingCircle:SetShow(false)
static_LoadingBlackSpirit:SetShow(false)
progressRate:SetShow(false)
progressHead:SetShow(false)
_knowledge_title:SetShow(false)
progressRate:SetCurrentProgressRate(0)
local LoadingPanel_Init = function()
  -- function num : 0_0 , upvalues : progressRate, progressHead
  progressRate:SetCurrentProgressRate(0)
  local progressRateX = progressRate:GetPosX()
  local progressRateY = progressRate:GetPosY()
  local progressHeadX = progressHead:GetPosX()
  local progressHeadY = progressHead:GetPosY()
end

LoadingPanel_SetProgress_Xbox = function(rate)
  -- function num : 0_1 , upvalues : _knowledge_title, progressRate, progressHead
  _knowledge_title:SetText(rate)
  progressRate:SetProgressRate(rate)
  local progressRateX = progressRate:GetPosX()
  local progressRateY = progressRate:GetPosY()
  local progressHeadX = progressHead:GetPosX()
  local progressHeadY = progressHead:GetPosY()
end

local screenX, screenY = getScreenSizeX(), getScreenSizeY()
local tempTime = 0
local alphaValue = 0
update_XboxLoadingCircle = function(deltaTime)
  -- function num : 0_2 , upvalues : tempTime, _knowledge_title, static_LoadingCircle, static_LoadingBlackSpirit, alphaValue, screenX, screenY
  tempTime = tempTime + deltaTime
  _knowledge_title:SetText((math.floor)(tempTime))
  static_LoadingCircle:SetShow(true)
  static_LoadingBlackSpirit:SetShow(true)
  alphaValue = alphaValue + 0.008
  static_LoadingCircle:SetAlpha(alphaValue)
  static_LoadingBlackSpirit:SetAlpha(alphaValue)
  static_LoadingCircle:SetPosX(screenX - static_LoadingCircle:GetSizeX() - static_LoadingCircle:GetSizeX() * 0.8)
  static_LoadingCircle:SetPosY(screenY - static_LoadingCircle:GetSizeY() - static_LoadingCircle:GetSizeY() * 0.4)
  static_LoadingBlackSpirit:SetPosX(static_LoadingCircle:GetPosX() + static_LoadingCircle:GetSizeX() * 0.5 - static_LoadingBlackSpirit:GetSizeX() * 0.5)
  static_LoadingBlackSpirit:SetPosY(static_LoadingCircle:GetPosY() + static_LoadingCircle:GetSizeY() * 0.5 - static_LoadingBlackSpirit:GetSizeY() * 0.5)
end

registerEvent("FromClient_completeDownloadProgress", "LoadingPanel_SetProgress_Xbox")
LoadingPanel_Init()

