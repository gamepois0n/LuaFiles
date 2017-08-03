-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\panel_login.luac 

-- params : ...
-- function num : 0
Panel_Login:SetShow(true, false)
Panel_Login:SetSize(getScreenSizeX(), getScreenSizeY())
local _loginBG = (UI.getChildControl)(Panel_Login, "Static_LoginBG")
local _buttonBG = (UI.getChildControl)(Panel_Login, "Static_ButtonBG")
local _txt_Guide = (UI.getChildControl)(Panel_Login, "StaticText_InputTxt")
local Button_Login = (UI.getChildControl)(Panel_Login, "Button_Login")
local Button_Exit = (UI.getChildControl)(Panel_Login, "Button_Exit")
local Button_GameOption = (UI.getChildControl)(Panel_Login, "Button_GameOption_Login")
local Edit_ID = (UI.getChildControl)(Panel_Login, "Edit_ID")
local _blackStone = (UI.getChildControl)(Panel_Login, "Static_BlackStone")
local StaticEventBG = (UI.getChildControl)(Panel_Login, "Static_EventBG")
local Static_BI = (UI.getChildControl)(Panel_Login, "Static_BI")
local Static_Blackline_up = (UI.getChildControl)(Panel_Login, "Static_Blackline_up")
local Static_Blackline_down = (UI.getChildControl)(Panel_Login, "Static_Blackline_down")
local Static_CI = (UI.getChildControl)(Panel_Login, "Static_CI")
local Static_DaumCI = (UI.getChildControl)(Panel_Login, "Static_DaumCI")
Button_Login:ActiveMouseEventEffect(true)
Button_Exit:ActiveMouseEventEffect(true)
Button_GameOption:ActiveMouseEventEffect(true)
Button_Login:SetEnable(true)
Button_Exit:SetEnable(true)
Button_GameOption:SetEnable(true)
local screenX = getScreenSizeX()
local screenY = getScreenSizeY()
Static_Back = (Array.new)()
local bgItem = {"base", "calpeon", "media", "valencia", "sea", "kamasilvia", "dragan", "xmas", "halloween", "thanksGivingDay", "aurora", "KoreaOnly", "JapanOnly", "RussiaOnly", "NaOnly", "TaiwanOnly", "KR2Only", "kamasilvia2"}
local bgIndex = {}
for k,v in pairs(bgItem) do
  bgIndex[v] = k
end
local baseLink = "New_UI_Common_forLua/Window/Lobby/"
local bgManager = {
[bgIndex.base] = {isOpen = true, imageCount = 3, iconPath = "bgBase_"}
, 
[bgIndex.calpeon] = {isOpen = ToClient_IsContentsGroupOpen("2"), imageCount = 6, iconPath = "bgCalpeon_"}
, 
[bgIndex.media] = {isOpen = ToClient_IsContentsGroupOpen("3"), imageCount = 2, iconPath = "bgMedia_"}
, 
[bgIndex.valencia] = {isOpen = ToClient_IsContentsGroupOpen("4"), imageCount = 6, iconPath = "bgValencia_"}
, 
[bgIndex.sea] = {isOpen = ToClient_IsContentsGroupOpen("83"), imageCount = 3, iconPath = "bgValenciaSea_"}
, 
[bgIndex.kamasilvia] = {isOpen = ToClient_IsContentsGroupOpen("5"), imageCount = 7, iconPath = "bgKamasilvia_"}
, 
[bgIndex.kamasilvia2] = {isOpen = ToClient_IsContentsGroupOpen("260"), imageCount = 2, iconPath = "bgKamasilvia2_"}
, 
[bgIndex.dragan] = {isOpen = ToClient_IsContentsGroupOpen("6"), imageCount = 0, iconPath = "bgDragan_"}
, 
[bgIndex.xmas] = {isOpen = ToClient_isEventOn("x-mas"), imageCount = 2, iconPath = "bgXmas_"}
, 
[bgIndex.halloween] = {isOpen = ToClient_isEventOn("Halloween"), imageCount = 3, iconPath = "bgHalloween_"}
, 
[bgIndex.thanksGivingDay] = {isOpen = ToClient_isEventOn("ThanksGivingDay"), imageCount = 2, iconPath = "bgThanksGivingDay_"}
, 
[bgIndex.aurora] = {isOpen = ToClient_isEventOn("Aurora"), imageCount = 2, iconPath = "bgAurora_"}
, 
[bgIndex.KoreaOnly] = {isOpen = not isGameTypeKorea() or false, imageCount = 0, iconPath = "bgKoreaOnly_"}
, 
[bgIndex.JapanOnly] = {isOpen = not isGameTypeJapan() or false, imageCount = 2, iconPath = "bgJapanOnly_"}
, 
[bgIndex.RussiaOnly] = {isOpen = not isGameTypeRussia() or false, imageCount = 0, iconPath = "bgRussiaOnly_"}
, 
[bgIndex.NaOnly] = {isOpen = not isGameTypeEnglish() or false, imageCount = 4, iconPath = "bgNAOnly_"}
, 
[bgIndex.TaiwanOnly] = {isOpen = not isGameTypeTaiwan() or false, imageCount = 0, iconPath = "bgTaiwanOnly_"}
, 
[bgIndex.KR2Only] = {isOpen = not isGameTypeKR2() or false, imageCount = 0, iconPath = "bgKR2Only_"}
}
local totalBG = 0
local imageIndex = 1
local startIndex, endIndex = nil, nil
local tempBg = (UI.getChildControl)(Panel_Login, "bgBase_1")
for _,value in ipairs(bgManager) do
  if value.isOpen then
    totalBG = totalBG + value.imageCount
    if value.imageCount > 0 then
      startIndex = imageIndex
      for index = 1, value.imageCount do
        local targetControl = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Login, "Static_Bg_" .. imageIndex)
        CopyBaseProperty(tempBg, targetControl)
        targetControl:ChangeTextureInfoName(baseLink .. value.iconPath .. index .. ".dds")
        targetControl:SetSize(screenX, screenY)
        targetControl:SetPosX(0)
        targetControl:SetPosY(0)
        targetControl:SetAlpha(0)
        Panel_Login:SetChildIndex(targetControl, 0)
        -- DECOMPILER ERROR at PC374: Confused about usage of register: R35 in 'UnsetPending'

        Static_Back[imageIndex] = targetControl
        endIndex = imageIndex
        imageIndex = imageIndex + 1
      end
    end
  end
end
tempBg:SetShow(false)
local bgStartIndex = getRandomValue(startIndex, endIndex)
if isLoginIDShow() == false then
  Edit_ID:SetShow(false)
  _loginBG:SetShow(false)
  _txt_Guide:SetShow(false)
else
  Edit_ID:SetEditText(getLoginID())
end
Panel_Login_Enter = function()
  -- function num : 0_0 , upvalues : Edit_ID
  connectToGame(Edit_ID:GetEditText(), "�\128�\128전사비번")
end

FGlobal_Panel_Login_Enter = function()
  -- function num : 0_1
  Panel_Login_Enter()
end

LogInPanel_Resize = function()
  -- function num : 0_2 , upvalues : _loginBG, _buttonBG, _txt_Guide, Button_Login, Button_Exit, Button_GameOption, Edit_ID, totalBG, Static_Blackline_up, Static_Blackline_down, Static_DaumCI, Static_CI, StaticEventBG, Static_BI
  Panel_Login:SetSize(getScreenSizeX(), getScreenSizeY())
  _loginBG:ComputePos()
  _buttonBG:ComputePos()
  _txt_Guide:ComputePos()
  Button_Login:ComputePos()
  Button_Login:AddEffect("fUI_PvPButtonLoop", true, 0, 0)
  Button_Exit:ComputePos()
  Button_GameOption:ComputePos()
  Edit_ID:ComputePos()
  for ii = 1, totalBG do
    (Static_Back[ii]):SetSize(getScreenSizeX(), getScreenSizeY())
  end
  Static_Blackline_up:SetSize(getScreenSizeX(), getScreenSizeY() * 0.07)
  Static_Blackline_down:SetSize(getScreenSizeX(), getScreenSizeY() * 0.07)
  if isGameTypeRussia() then
    Static_DaumCI:SetSize(111, 29)
    Static_DaumCI:ChangeTextureInfoName("new_ui_common_forlua/window/lobby/login_CI_Daum.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(Static_DaumCI, 0, 0, 168, 36)
    ;
    (Static_DaumCI:getBaseTexture()):setUV(x1, y1, x2, y2)
    Static_DaumCI:setRenderTexture(Static_DaumCI:getBaseTexture())
    Static_CI:SetSpanSize(Static_DaumCI:GetSizeX() + 30, (Static_Blackline_down:GetSizeY() - Static_CI:GetSizeY()) / 2)
  else
    do
      if isGameTypeJapan() then
        Static_DaumCI:SetSize(111, 26)
        Static_DaumCI:ChangeTextureInfoName("new_ui_common_forlua/window/lobby/login_CI_Daum.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(Static_DaumCI, 0, 0, 111, 26)
        ;
        (Static_DaumCI:getBaseTexture()):setUV(x1, y1, x2, y2)
        Static_DaumCI:setRenderTexture(Static_DaumCI:getBaseTexture())
        Static_CI:SetSpanSize(Static_DaumCI:GetSizeX() + 30, (Static_Blackline_down:GetSizeY() - Static_CI:GetSizeY()) / 2)
      else
        do
          if isGameTypeEnglish() then
            Static_DaumCI:SetSize(144, 26)
            Static_DaumCI:ChangeTextureInfoName("new_ui_common_forlua/window/lobby/login_CI_Daum.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(Static_DaumCI, 0, 0, 144, 26)
            ;
            (Static_DaumCI:getBaseTexture()):setUV(x1, y1, x2, y2)
            Static_DaumCI:setRenderTexture(Static_DaumCI:getBaseTexture())
            Static_CI:SetSpanSize(Static_DaumCI:GetSizeX() + 30, (Static_Blackline_down:GetSizeY() - Static_CI:GetSizeY()) / 2)
          else
            do
              if isGameTypeTaiwan() then
                Static_DaumCI:SetShow(false)
                Static_CI:SetSpanSize(10, (Static_Blackline_down:GetSizeY() - Static_CI:GetSizeY()) / 2)
              else
                if isGameTypeSA() then
                  Static_DaumCI:SetSize(136, 50)
                  Static_DaumCI:ChangeTextureInfoName("new_ui_common_forlua/window/lobby/login_CI_Daum.dds")
                  local x1, y1, x2, y2 = setTextureUV_Func(Static_DaumCI, 0, 0, 136, 50)
                  ;
                  (Static_DaumCI:getBaseTexture()):setUV(x1, y1, x2, y2)
                  Static_DaumCI:setRenderTexture(Static_DaumCI:getBaseTexture())
                  Static_CI:SetSpanSize(Static_DaumCI:GetSizeX() + 30, (Static_Blackline_down:GetSizeY() - Static_CI:GetSizeY()) / 2)
                else
                  do
                    if isGameTypeKR2() then
                      Static_DaumCI:SetSize(95, 53)
                      Static_DaumCI:ChangeTextureInfoName("new_ui_common_forlua/window/lobby/login_CI_Daum.dds")
                      local x1, y1, x2, y2 = setTextureUV_Func(Static_DaumCI, 0, 0, 95, 53)
                      ;
                      (Static_DaumCI:getBaseTexture()):setUV(x1, y1, x2, y2)
                      Static_DaumCI:setRenderTexture(Static_DaumCI:getBaseTexture())
                      Static_CI:SetSpanSize(Static_DaumCI:GetSizeX() + 30, (Static_Blackline_down:GetSizeY() - Static_CI:GetSizeY()) / 2)
                    else
                      do
                        Static_DaumCI:SetSize(144, 26)
                        Static_DaumCI:ChangeTextureInfoName("new_ui_common_forlua/window/lobby/login_CI_Daum.dds")
                        do
                          local x1, y1, x2, y2 = setTextureUV_Func(Static_DaumCI, 0, 0, 144, 26)
                          ;
                          (Static_DaumCI:getBaseTexture()):setUV(x1, y1, x2, y2)
                          Static_DaumCI:setRenderTexture(Static_DaumCI:getBaseTexture())
                          Static_CI:SetSpanSize(Static_DaumCI:GetSizeX() + 30, (Static_Blackline_down:GetSizeY() - Static_CI:GetSizeY()) / 2)
                          Static_DaumCI:SetSpanSize(20, (Static_Blackline_down:GetSizeY() - Static_DaumCI:GetSizeY()) / 2)
                          StaticEventBG:SetShow(false)
                          local isXmas = ToClient_isEventOn("x-mas")
                          if isXmas then
                            StaticEventBG:SetShow(true)
                          end
                          StaticEventBG:ComputePos()
                          Static_BI:ComputePos()
                          Static_Blackline_up:ComputePos()
                          Static_Blackline_down:ComputePos()
                          Static_CI:ComputePos()
                          Static_DaumCI:ComputePos()
                          Static_BI:SetPosY(getScreenSizeY() * 0.14)
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

local currentBackIndex = bgStartIndex
;
(Static_Back[currentBackIndex]):SetShow(true, true)
;
(Static_Back[currentBackIndex]):SetAlpha(1)
local updateTime = 0
local isScope = true
local startUV = 0.1
local endUV = startUV + 0.04
local startUV2 = 0.9
local endUV2 = startUV2 + 0.04
Panel_Login_Update = function(deltaTime)
  -- function num : 0_3 , upvalues : updateTime, isScope, currentBackIndex, startUV, endUV, startUV2, endUV2, totalBG
  updateTime = updateTime - deltaTime
  if updateTime <= 0 then
    updateTime = 15
    if isScope then
      isScope = false
      local FadeMaskAni = (Static_Back[currentBackIndex]):addTextureUVAnimation(0, 15, 0)
      FadeMaskAni:SetStartUV(startUV, startUV, 0)
      FadeMaskAni:SetEndUV(endUV, startUV, 0)
      FadeMaskAni:SetStartUV(startUV2, startUV, 1)
      FadeMaskAni:SetEndUV(endUV2, startUV, 1)
      FadeMaskAni:SetStartUV(startUV, startUV2, 2)
      FadeMaskAni:SetEndUV(endUV, startUV2, 2)
      FadeMaskAni:SetStartUV(startUV2, startUV2, 3)
      FadeMaskAni:SetEndUV(endUV2, startUV2, 3)
    else
      do
        isScope = true
        local FadeMaskAni = (Static_Back[currentBackIndex]):addTextureUVAnimation(0, 15, 0)
        FadeMaskAni:SetEndUV(startUV, startUV, 0)
        FadeMaskAni:SetStartUV(endUV, startUV, 0)
        FadeMaskAni:SetEndUV(startUV2, startUV, 1)
        FadeMaskAni:SetStartUV(endUV2, startUV, 1)
        FadeMaskAni:SetEndUV(startUV, startUV2, 2)
        FadeMaskAni:SetStartUV(endUV, startUV2, 2)
        FadeMaskAni:SetEndUV(startUV2, startUV2, 3)
        FadeMaskAni:SetStartUV(endUV2, startUV2, 3)
        local fadeColor = (Static_Back[currentBackIndex]):addColorAnimation(15, 17, 0)
        fadeColor:SetStartColor((Defines.Color).C_FFFFFFFF)
        fadeColor:SetEndColor((Defines.Color).C_00FFFFFF)
        currentBackIndex = currentBackIndex + 1
        if totalBG < currentBackIndex then
          currentBackIndex = getRandomValue(1, totalBG)
        end
        local baseTexture = (Static_Back[currentBackIndex]):getBaseTexture()
        baseTexture:setUV(startUV, startUV, startUV2, startUV2)
        ;
        (Static_Back[currentBackIndex]):setRenderTexture(baseTexture)
        local fadeColor2 = (Static_Back[currentBackIndex]):addColorAnimation(12, 15, 0)
        fadeColor2:SetStartColor((Defines.Color).C_00FFFFFF)
        fadeColor2:SetEndColor((Defines.Color).C_FFFFFFFF)
      end
    end
  end
end

Panel_Login_ButtonDisable = function(bool)
  -- function num : 0_4 , upvalues : Button_Login, Button_Exit, Button_GameOption
  if bool == true then
    Button_Login:SetEnable(false)
    Button_Login:SetMonoTone(true)
    Button_Login:SetIgnore(true)
    Button_Exit:SetEnable(false)
    Button_Exit:SetMonoTone(true)
    Button_Exit:SetIgnore(true)
    Button_GameOption:SetEnable(false)
    Button_GameOption:SetMonoTone(true)
    Button_GameOption:SetIgnore(true)
  else
    Button_Login:SetEnable(true)
    Button_Login:SetMonoTone(false)
    Button_Login:SetIgnore(false)
    Button_Exit:SetEnable(true)
    Button_Exit:SetMonoTone(false)
    Button_Exit:SetIgnore(false)
    Button_GameOption:SetEnable(true)
    Button_GameOption:SetMonoTone(false)
    Button_GameOption:SetIgnore(false)
  end
end

Panel_Login_BeforOpen = function()
  -- function num : 0_5
  local serviceType = getGameServiceType()
  if (isGameTypeTaiwan() or isGameTypeKorea()) and serviceType ~= 1 then
    FGlobal_TermsofGameUse_Open()
  else
    Panel_Login_Enter()
  end
end

Panel_Login:RegisterUpdateFunc("Panel_Login_Update")
Button_Login:addInputEvent("Mouse_LUp", "Panel_Login_BeforOpen()")
Button_Exit:addInputEvent("Mouse_LUp", "GlobalExitGameClient()")
Button_GameOption:addInputEvent("Mouse_LUp", "showGameOption()")
registerEvent("onScreenResize", "LogInPanel_Resize")
LogInPanel_Resize()

