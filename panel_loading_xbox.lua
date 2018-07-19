Panel_Loading_Xbox:SetShow(true)
local _knowledge_title = UI.getChildControl(Panel_Loading_Xbox, "StaticText_knowTitle")
local static_LoadingCircle = UI.getChildControl(Panel_Loading_Xbox, "Static_LoadingCircle")
local static_LoadingBlackSpirit = UI.getChildControl(Panel_Loading_Xbox, "Static_LoadingBlackSpirit")
static_LoadingCircle:SetAlpha(0)
static_LoadingBlackSpirit:SetAlpha(0)
static_LoadingCircle:SetShow(false)
static_LoadingBlackSpirit:SetShow(false)
_knowledge_title:SetShow(false)
function LoadingPanel_SetProgress_Xbox(rate)
  _knowledge_title:SetText(rate)
end
local screenX, screenY = getScreenSizeX(), getScreenSizeY()
local tempTime = 0
local alphaValue = 0
function update_XboxLoadingCircle(deltaTime)
  tempTime = tempTime + deltaTime
  _knowledge_title:SetText(math.floor(tempTime))
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
