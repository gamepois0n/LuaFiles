-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\blackspiritadventure\panel_blackspiritadventure.luac 

-- params : ...
-- function num : 0
Panel_Window_BlackSpiritAdventure:SetShow(false)
Panel_Window_BlackSpiritAdventure:setMaskingChild(true)
Panel_Window_BlackSpiritAdventure:setGlassBackground(true)
Panel_Window_BlackSpiritAdventure:SetDragAll(true)
Panel_Window_BlackSpiritAdventure:RegisterShowEventFunc(true, "BlackSpiritAdventure_ShowAni()")
Panel_Window_BlackSpiritAdventure:RegisterShowEventFunc(false, "BlackSpiritAdventure_HideAni()")
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local isBlackSpiritAdventure = ToClient_IsContentsGroupOpen("1015")
BlackSpiritAdventure_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_Window_BlackSpiritAdventure)
  local aniInfo1 = Panel_Window_BlackSpiritAdventure:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.2)
  aniInfo1.AxisX = Panel_Window_BlackSpiritAdventure:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Window_BlackSpiritAdventure:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_Window_BlackSpiritAdventure:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.2)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Window_BlackSpiritAdventure:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Window_BlackSpiritAdventure:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

BlackSpiritAdventure_HideAni = function()
  -- function num : 0_1
  Panel_Window_BlackSpiritAdventure:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_Window_BlackSpiritAdventure, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

local btnClose = (UI.getChildControl)(Panel_Window_BlackSpiritAdventure, "Button_Win_Close")
btnClose:addInputEvent("Mouse_LUp", "BlackSpiritAd_Hide()")
local btnQuestion = (UI.getChildControl)(Panel_Window_BlackSpiritAdventure, "Button_Question")
btnQuestion:SetShow(false)
local checkPopUp = (UI.getChildControl)(Panel_Window_BlackSpiritAdventure, "CheckButton_PopUp")
local isPopUpContentsEnable = ToClient_IsContentsGroupOpen("240")
checkPopUp:SetShow(isPopUpContentsEnable)
checkPopUp:addInputEvent("Mouse_LUp", "HandleClicked_BlackSpiritAdventure_PopUp()")
checkPopUp:addInputEvent("Mouse_On", "BlackSpirit_PopUp_ShowIconToolTip( true )")
checkPopUp:addInputEvent("Mouse_Out", "BlackSpirit_PopUp_ShowIconToolTip( false )")
local _Web = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, Panel_Window_BlackSpiritAdventure, "WebControl_EventNotify_WebLink")
_Web:SetShow(true)
_Web:SetPosX(11)
_Web:SetPosY(50)
_Web:SetSize(918, 655)
_Web:ResetUrl()
BlackSpiritAd_Show = function()
  -- function num : 0_2 , upvalues : isBlackSpiritAdventure, _Web
  if isBlackSpiritAdventure then
    Panel_Window_BlackSpiritAdventure:SetShow(true, true)
    Panel_Window_BlackSpiritAdventure:SetPosX(getScreenSizeX() / 2 - Panel_Window_BlackSpiritAdventure:GetSizeX() / 2)
    Panel_Window_BlackSpiritAdventure:SetPosY(getScreenSizeY() / 2 - Panel_Window_BlackSpiritAdventure:GetSizeY() / 2)
  else
    return 
  end
  local myUserNo = ((getSelfPlayer()):get()):getUserNo()
  local cryptKey = ((getSelfPlayer()):get()):getWebAuthenticKeyCryptString()
  local temporaryWrapper = getTemporaryInformationWrapper()
  local worldNo = temporaryWrapper:getSelectedWorldServerNo()
  local bAdventureWebUrl = PaGlobal_URL_Check(worldNo)
  local isNationType = "KR"
  if isGameTypeKorea() then
    isNationType = "KR"
  else
    if isGameTypeJapan() then
      isNationType = "JP"
    else
      if isGameTypeRussia() then
        isNationType = "RU"
      else
        if isGameTypeEnglish() then
          isNationType = "EN"
        else
          if isGameTypeTaiwan() then
            isNationType = "TW"
          else
            if isGameTypeSA() then
              isNationType = "SA"
            else
              if isGameTypeTR() then
                isNationType = "TR"
              else
                if isGameTypeTH() then
                  isNationType = "TH"
                else
                  if isGameTypeID() then
                    isNationType = "ID"
                  else
                    _PA_LOG("정태�\164", "새로�\180 국가 �\128입이 추가되었으니 �\180 로그�\188 발견하면 해당 담당자에�\140 알려주세�\148 �\173!!!")
                    isNationType = "KR"
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  if bAdventureWebUrl ~= nil then
    local url = bAdventureWebUrl .. "/BoardGame?userNo=" .. tostring(myUserNo) .. "&certKey=" .. tostring(cryptKey) .. "&nationCode=" .. tostring(isNationType)
    _Web:SetUrl(918, 655, url)
  end
end

HandleClicked_BlackSpiritAdventure_PopUp = function()
  -- function num : 0_3 , upvalues : checkPopUp
  if checkPopUp:IsCheck() then
    Panel_Window_BlackSpiritAdventure:OpenUISubApp()
  else
    Panel_Window_BlackSpiritAdventure:CloseUISubApp()
  end
  TooltipSimple_Hide()
end

BlackSpiritAd_Hide = function()
  -- function num : 0_4 , upvalues : checkPopUp, _Web
  Panel_Window_BlackSpiritAdventure:SetShow(false, false)
  Panel_Window_BlackSpiritAdventure:CloseUISubApp()
  checkPopUp:SetCheck(false)
  _Web:ResetUrl()
end

FGlobal_BlackSpiritAdventure_Open = function()
  -- function num : 0_5
  BlackSpiritAd_Show()
end

BlackSpirit_PopUp_ShowIconToolTip = function(isShow)
  -- function num : 0_6 , upvalues : checkPopUp
  if isShow then
    local name = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_TOOLTIP_NAME")
    local desc = ""
    if checkPopUp:IsCheck() then
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_CHECK_TOOLTIP")
    else
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_NOCHECK_TOOLTIP")
    end
    TooltipSimple_Show(checkPopUp, name, desc)
  else
    do
      TooltipSimple_Hide()
    end
  end
end

Web_BlackSpirit_DiceSound = function()
  -- function num : 0_7
  audioPostEvent_SystemUi(11, 16)
end


