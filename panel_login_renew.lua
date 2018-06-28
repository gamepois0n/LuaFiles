Panel_Login_Renew:SetSize(getScreenSizeX(), getScreenSizeY())
_panel = Panel_Login_Renew
local PanelLogin = {
  _ui = {
    stc_EventBG = UI.getChildControl(_panel, "Static_EventBG"),
    stc_BI = UI.getChildControl(_panel, "Static_BI"),
    btn_Login = UI.getChildControl(_panel, "Button_Login"),
    btn_Exit = UI.getChildControl(_panel, "Button_Exit"),
    edit_ID = UI.getChildControl(_panel, "Edit_ID"),
    txt_InputID = UI.getChildControl(_panel, "StaticText_InputTxt"),
    stc_BlacklineUp = UI.getChildControl(_panel, "Static_Blackline_up"),
    stc_BlacklineDown = UI.getChildControl(_panel, "Static_Blackline_down"),
    stc_CI = UI.getChildControl(_panel, "Static_CI"),
    stc_DaumCI = UI.getChildControl(_panel, "Static_DaumCI")
  }
}
local screenX = getScreenSizeX()
local screenY = getScreenSizeY()
_stc_BackgroundImage = Array.new()
local bgItem = {
  "base",
  "calpeon",
  "media",
  "valencia",
  "sea",
  "kamasilvia",
  "kamasilvia2",
  "dragan",
  "xmas",
  "halloween",
  "thanksGivingDay",
  "aurora",
  "KoreaOnly",
  "JapanOnly",
  "RussiaOnly",
  "NaOnly",
  "TaiwanOnly",
  "TROnly",
  "THOnly",
  "KR2Only",
  "SAOnly",
  "TROnly",
  "THOnly",
  "IDOnly"
}
local bgIndex = {}
for k, v in pairs(bgItem) do
  bgIndex[v] = k
end
local baseLink = "New_UI_Common_forLua/Window/Lobby/"
local bgManager = {
  [bgIndex.base] = {
    isOpen = true,
    imageCount = 3,
    iconPath = "bgBase_"
  },
  [bgIndex.calpeon] = {
    isOpen = ToClient_IsContentsGroupOpen("2"),
    imageCount = 6,
    iconPath = "bgCalpeon_"
  },
  [bgIndex.media] = {
    isOpen = ToClient_IsContentsGroupOpen("3"),
    imageCount = 2,
    iconPath = "bgMedia_"
  },
  [bgIndex.valencia] = {
    isOpen = ToClient_IsContentsGroupOpen("4"),
    imageCount = 6,
    iconPath = "bgValencia_"
  },
  [bgIndex.sea] = {
    isOpen = ToClient_IsContentsGroupOpen("83"),
    imageCount = 3,
    iconPath = "bgValenciaSea_"
  },
  [bgIndex.kamasilvia] = {
    isOpen = ToClient_IsContentsGroupOpen("5"),
    imageCount = 7,
    iconPath = "bgKamasilvia_"
  },
  [bgIndex.kamasilvia2] = {
    isOpen = ToClient_IsContentsGroupOpen("260"),
    imageCount = 2,
    iconPath = "bgKamasilvia2_"
  },
  [bgIndex.dragan] = {
    isOpen = ToClient_IsContentsGroupOpen("6"),
    imageCount = 3,
    iconPath = "bgDragan_"
  },
  [bgIndex.xmas] = {
    isOpen = ToClient_isEventOn("x-mas"),
    imageCount = 1,
    iconPath = "bgXmas_"
  },
  [bgIndex.halloween] = {
    isOpen = ToClient_isEventOn("Halloween"),
    imageCount = 3,
    iconPath = "bgHalloween_"
  },
  [bgIndex.thanksGivingDay] = {
    isOpen = ToClient_isEventOn("ThanksGivingDay"),
    imageCount = 2,
    iconPath = "bgThanksGivingDay_"
  },
  [bgIndex.aurora] = {
    isOpen = ToClient_isEventOn("Aurora"),
    imageCount = 2,
    iconPath = "bgAurora_"
  },
  [bgIndex.KoreaOnly] = {
    isOpen = isGameTypeKorea() and false,
    imageCount = 0,
    iconPath = "bgKoreaOnly_"
  },
  [bgIndex.JapanOnly] = {
    isOpen = isGameTypeJapan() and false,
    imageCount = 2,
    iconPath = "bgJapanOnly_"
  },
  [bgIndex.RussiaOnly] = {
    isOpen = isGameTypeRussia() and false,
    imageCount = 0,
    iconPath = "bgRussiaOnly_"
  },
  [bgIndex.NaOnly] = {
    isOpen = isGameTypeEnglish() and false,
    imageCount = 4,
    iconPath = "bgNAOnly_"
  },
  [bgIndex.TaiwanOnly] = {
    isOpen = isGameTypeTaiwan() and false,
    imageCount = 0,
    iconPath = "bgTaiwanOnly_"
  },
  [bgIndex.TROnly] = {
    isOpen = isGameTypeTR() and false,
    imageCount = 0,
    iconPath = "bgTROnly_"
  },
  [bgIndex.THOnly] = {
    isOpen = isGameTypeTH() and false,
    imageCount = 0,
    iconPath = "bgTHOnly_"
  },
  [bgIndex.KR2Only] = {
    isOpen = isGameTypeKR2() and false,
    imageCount = 0,
    iconPath = "bgKR2Only_"
  },
  [bgIndex.SAOnly] = {
    isOpen = isGameTypeSA() and false,
    imageCount = 0,
    iconPath = "bgSAOnly_"
  },
  [bgIndex.TROnly] = {
    isOpen = isGameTypeTR() and false,
    imageCount = 0,
    iconPath = "bgTROnly_"
  },
  [bgIndex.THOnly] = {
    isOpen = isGameTypeTH() and false,
    imageCount = 0,
    iconPath = "bgTHOnly_"
  },
  [bgIndex.IDOnly] = {
    isOpen = isGameTypeID() and false,
    imageCount = 0,
    iconPath = "bgIDOnly_"
  }
}
local totalBG = 0
local imageIndex = 1
local startIndex, endIndex
local tempBg = UI.getChildControl(_panel, "bgBase_1")
for _, value in ipairs(bgManager) do
  if value.isOpen then
    totalBG = totalBG + value.imageCount
    if value.imageCount > 0 then
      startIndex = imageIndex
      for index = 1, value.imageCount do
        local targetControl = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_STATIC, _panel, "Static_Bg_" .. imageIndex)
        CopyBaseProperty(tempBg, targetControl)
        targetControl:ChangeTextureInfoName(baseLink .. value.iconPath .. index .. ".dds")
        targetControl:SetSize(screenX, screenY)
        targetControl:SetPosX(0)
        targetControl:SetPosY(0)
        targetControl:SetAlpha(0)
        _panel:SetChildIndex(targetControl, 0)
        _stc_BackgroundImage[imageIndex] = targetControl
        endIndex = imageIndex
        imageIndex = imageIndex + 1
      end
    end
  end
end
tempBg:SetShow(false)
local _updateTimeAcc = 0
local _isScope = true
local bgStartIndex = startIndex
local currentBackIndex = bgStartIndex
local startUV = 0.1
local endUV = startUV + 0.04
local startUV2 = 0.9
local endUV2 = startUV2 + 0.04
function PanelLogin:init()
  if false == isLoginIDShow() then
    self._ui.edit_ID:SetShow(false)
    self._ui.txt_InputID:SetShow(false)
  else
    self._ui.edit_ID:SetShow(true)
    self._ui.txt_InputID:SetShow(true)
    self._ui.edit_ID:SetEditText(getLoginID())
  end
end
function PanelLogin:loginEnter()
  connectToGame(self._ui.edit_ID:GetEditText(), "\234\178\128\236\157\128\236\160\132\236\130\172\235\185\132\235\178\136")
end
function PanelLogin:registEvent()
  self._ui.btn_Login:addInputEvent("Mouse_LUp", "PaGlobal_PanelLogin_BeforeOpen()")
  self._ui.btn_Exit:addInputEvent("Mouse_LUp", "GlobalExitGameClient()")
  _panel:RegisterUpdateFunc("PaGlobal_PanelLogin_PerFrameUpdate")
  registerEvent("onScreenResize", "PaGlobal_PanelLogin_Resize")
end
function PaGlobal_PanelLogin_Init()
  local self = PanelLogin
  self:init()
  self:registEvent()
end
function PaGlobal_PanelLogin_Resize()
  Panel_Login_Renew:SetSize(getScreenSizeX(), getScreenSizeY())
  local self = PanelLogin
  self._ui.stc_EventBG:SetShow(false)
  self._ui.btn_Login:ComputePos()
  self._ui.btn_Exit:ComputePos()
  self._ui.edit_ID:ComputePos()
  self._ui.txt_InputID:ComputePos()
  self._ui.stc_EventBG:ComputePos()
  for _, bgImage in pairs(_stc_BackgroundImage) do
    bgImage:SetSize(getScreenSizeX(), getScreenSizeY())
  end
  self._ui.stc_BlacklineUp:SetSize(getScreenSizeX(), getScreenSizeY() * 0.07)
  self._ui.stc_BlacklineDown:SetSize(getScreenSizeX(), getScreenSizeY() * 0.07)
  if isGameTypeRussia() then
    self._ui.stc_DaumCI:SetSize(111, 29)
    self._ui.stc_DaumCI:ChangeTextureInfoName("new_ui_common_forlua/window/lobby/login_CI_Daum.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(self._ui.stc_DaumCI, 0, 0, 168, 36)
    self._ui.stc_DaumCI:getBaseTexture():setUV(x1, y1, x2, y2)
    self._ui.stc_DaumCI:setRenderTexture(self._ui.stc_DaumCI:getBaseTexture())
    self._ui.stc_CI:SetSpanSize(self._ui.stc_DaumCI:GetSizeX() + 30, (self._ui.stc_BlacklineDown:GetSizeY() - self._ui.stc_CI:GetSizeY()) / 2)
  elseif isGameTypeJapan() then
    self._ui.stc_DaumCI:SetSize(111, 26)
    self._ui.stc_DaumCI:ChangeTextureInfoName("new_ui_common_forlua/window/lobby/login_CI_Daum.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(self._ui.stc_DaumCI, 0, 0, 111, 26)
    self._ui.stc_DaumCI:getBaseTexture():setUV(x1, y1, x2, y2)
    self._ui.stc_DaumCI:setRenderTexture(self._ui.stc_DaumCI:getBaseTexture())
    self._ui.stc_CI:SetSpanSize(self._ui.stc_DaumCI:GetSizeX() + 30, (self._ui.stc_BlacklineDown:GetSizeY() - self._ui.stc_CI:GetSizeY()) / 2)
  elseif isGameTypeEnglish() then
    self._ui.stc_DaumCI:SetSize(144, 26)
    self._ui.stc_DaumCI:ChangeTextureInfoName("new_ui_common_forlua/window/lobby/login_CI_Daum.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(self._ui.stc_DaumCI, 0, 0, 144, 26)
    self._ui.stc_DaumCI:getBaseTexture():setUV(x1, y1, x2, y2)
    self._ui.stc_DaumCI:setRenderTexture(self._ui.stc_DaumCI:getBaseTexture())
    self._ui.stc_CI:SetSpanSize(self._ui.stc_DaumCI:GetSizeX() + 30, (self._ui.stc_BlacklineDown:GetSizeY() - self._ui.stc_CI:GetSizeY()) / 2)
  elseif isGameTypeTaiwan() or isGameTypeTR() or isGameTypeTH() or isGameTypeID() or ToClient_isXBox() then
    self._ui.stc_DaumCI:SetShow(false)
    self._ui.stc_CI:SetSpanSize(10, (self._ui.stc_BlacklineDown:GetSizeY() - self._ui.stc_CI:GetSizeY()) / 2)
  elseif isGameTypeSA() then
    self._ui.stc_DaumCI:SetSize(136, 50)
    self._ui.stc_DaumCI:ChangeTextureInfoName("new_ui_common_forlua/window/lobby/login_CI_Daum.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(self._ui.stc_DaumCI, 0, 0, 136, 50)
    self._ui.stc_DaumCI:getBaseTexture():setUV(x1, y1, x2, y2)
    self._ui.stc_DaumCI:setRenderTexture(self._ui.stc_DaumCI:getBaseTexture())
    self._ui.stc_CI:SetSpanSize(self._ui.stc_DaumCI:GetSizeX() + 30, (self._ui.stc_BlacklineDown:GetSizeY() - self._ui.stc_CI:GetSizeY()) / 2)
  elseif isGameTypeKR2() then
    self._ui.stc_DaumCI:SetSize(95, 53)
    self._ui.stc_DaumCI:ChangeTextureInfoName("new_ui_common_forlua/window/lobby/login_CI_Daum.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(self._ui.stc_DaumCI, 0, 0, 95, 53)
    self._ui.stc_DaumCI:getBaseTexture():setUV(x1, y1, x2, y2)
    self._ui.stc_DaumCI:setRenderTexture(self._ui.stc_DaumCI:getBaseTexture())
    self._ui.stc_CI:SetSpanSize(self._ui.stc_DaumCI:GetSizeX() + 30, (self._ui.stc_BlacklineDown:GetSizeY() - self._ui.stc_CI:GetSizeY()) / 2)
  else
    self._ui.stc_DaumCI:SetSize(144, 26)
    self._ui.stc_DaumCI:ChangeTextureInfoName("new_ui_common_forlua/window/lobby/login_CI_Daum.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(self._ui.stc_DaumCI, 0, 0, 144, 26)
    self._ui.stc_DaumCI:getBaseTexture():setUV(x1, y1, x2, y2)
    self._ui.stc_DaumCI:setRenderTexture(self._ui.stc_DaumCI:getBaseTexture())
    self._ui.stc_CI:SetSpanSize(self._ui.stc_DaumCI:GetSizeX() + 30, (self._ui.stc_BlacklineDown:GetSizeY() - self._ui.stc_CI:GetSizeY()) / 2)
  end
  self._ui.stc_DaumCI:SetSpanSize(20, (self._ui.stc_BlacklineDown:GetSizeY() - self._ui.stc_DaumCI:GetSizeY()) / 2)
  self._ui.stc_BI:ComputePos()
  self._ui.stc_CI:ComputePos()
  self._ui.stc_DaumCI:ComputePos()
  self._ui.stc_BlacklineUp:ComputePos()
  self._ui.stc_BlacklineDown:ComputePos()
  self._ui.stc_BI:SetPosY(getScreenSizeY() * 0.14)
  PaGlobal_CheckGamerTag()
end
_stc_BackgroundImage[currentBackIndex]:SetShow(true)
_stc_BackgroundImage[currentBackIndex]:SetAlpha(1)
function PaGlobal_PanelLogin_PerFrameUpdate(deltaTime)
  _updateTimeAcc = _updateTimeAcc - deltaTime
  if _updateTimeAcc <= 0 then
    _updateTimeAcc = 15
    if _isScope then
      _isScope = false
      local FadeMaskAni = _stc_BackgroundImage[currentBackIndex]:addTextureUVAnimation(0, 15, 0)
      FadeMaskAni:SetStartUV(startUV, startUV, 0)
      FadeMaskAni:SetEndUV(endUV, startUV, 0)
      FadeMaskAni:SetStartUV(startUV2, startUV, 1)
      FadeMaskAni:SetEndUV(endUV2, startUV, 1)
      FadeMaskAni:SetStartUV(startUV, startUV2, 2)
      FadeMaskAni:SetEndUV(endUV, startUV2, 2)
      FadeMaskAni:SetStartUV(startUV2, startUV2, 3)
      FadeMaskAni:SetEndUV(endUV2, startUV2, 3)
    else
      _isScope = true
      local FadeMaskAni = _stc_BackgroundImage[currentBackIndex]:addTextureUVAnimation(0, 15, 0)
      FadeMaskAni:SetEndUV(startUV, startUV, 0)
      FadeMaskAni:SetStartUV(endUV, startUV, 0)
      FadeMaskAni:SetEndUV(startUV2, startUV, 1)
      FadeMaskAni:SetStartUV(endUV2, startUV, 1)
      FadeMaskAni:SetEndUV(startUV, startUV2, 2)
      FadeMaskAni:SetStartUV(endUV, startUV2, 2)
      FadeMaskAni:SetEndUV(startUV2, startUV2, 3)
      FadeMaskAni:SetStartUV(endUV2, startUV2, 3)
      local fadeColor = _stc_BackgroundImage[currentBackIndex]:addColorAnimation(15, 17, 0)
      fadeColor:SetStartColor(Defines.Color.C_FFFFFFFF)
      fadeColor:SetEndColor(Defines.Color.C_00FFFFFF)
      currentBackIndex = currentBackIndex + 1
      if totalBG < currentBackIndex then
        currentBackIndex = getRandomValue(1, totalBG)
      end
      local baseTexture = _stc_BackgroundImage[currentBackIndex]:getBaseTexture()
      baseTexture:setUV(startUV, startUV, startUV2, startUV2)
      _stc_BackgroundImage[currentBackIndex]:setRenderTexture(baseTexture)
      local fadeColor2 = _stc_BackgroundImage[currentBackIndex]:addColorAnimation(12, 15, 0)
      fadeColor2:SetStartColor(Defines.Color.C_00FFFFFF)
      fadeColor2:SetEndColor(Defines.Color.C_FFFFFFFF)
    end
  end
  if ToClient_isXBox() then
    if isPadUp(__eJoyPadInputType_A) then
      PaGlobal_Policy_Close()
    elseif Panel_Window_Policy:GetShow() and isPadUp(__eJoyPadInputType_B) then
      PaGlobal_Policy_Close()
      LoginNickname_Close()
      if nil ~= ToClient_SetProcessor_XboxHome() then
        ToClient_SetProcessor_XboxHome()
      end
    end
  end
end
function PaGlobal_PanelLogin_BeforeOpen()
  local serviceType = getGameServiceType()
  if (isGameTypeTaiwan() or isGameTypeKorea()) and 1 ~= serviceType then
    FGlobal_TermsofGameUse_Open()
  else
    PaGlobal_PanelLogin_LoginEnter()
  end
end
function PaGlobal_PanelLogin_LoginEnter()
  local self = PanelLogin
  self:loginEnter()
end
PaGlobal_PanelLogin_Init()
PaGlobal_PanelLogin_Resize()
Panel_Login_Renew:SetShow(true)
