local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
Panel_CustomizingAlbum:SetShow(false, false)
Panel_CustomizingAlbum:ActiveMouseEventEffect(true)
Panel_CustomizingAlbum:setGlassBackground(true)
Panel_CustomizingAlbum:RegisterShowEventFunc(true, "Panel_CustomizingAlbum_ShowAni()")
Panel_CustomizingAlbum:RegisterShowEventFunc(false, "Panel_CustomizingAlbum_HideAni()")
function Panel_CustomizingAlbum_ShowAni()
  UIAni.fadeInSCR_Down(Panel_CustomizingAlbum)
  local aniInfo1 = Panel_CustomizingAlbum:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_CustomizingAlbum:GetSizeX() / 2
  aniInfo1.AxisY = Panel_CustomizingAlbum:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_CustomizingAlbum:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_CustomizingAlbum:GetSizeX() / 2
  aniInfo2.AxisY = Panel_CustomizingAlbum:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end
function Panel_CustomizingAlbum_HideAni()
  audioPostEvent_SystemUi(13, 5)
  Panel_CustomizingAlbum:SetAlpha(1)
  local aniInfo = UIAni.AlphaAnimation(0, Panel_CustomizingAlbum, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end
local _titleBar = UI.getChildControl(Panel_CustomizingAlbum, "StaticText_TitleBg")
local _stc_keyGuide = UI.getChildControl(Panel_CustomizingAlbum, "Static_BottomBg")
local _customizingAlbumWeb, sizeX, sizeY, panelSizeX, panelSizeY, titleBarSizeX
function Panel_CustomizingAlbum_Initialize()
  local screenSizeX = getScreenSizeX()
  sizeX = 870
  sizeY = 630
  panelSizeX = 900
  panelSizeY = 745
  titleBarSizeX = 887
  Panel_CustomizingAlbum:SetSize(panelSizeX, panelSizeY + _stc_keyGuide:GetSizeY())
  _titleBar:SetSize(titleBarSizeX, _titleBar:GetSizeY())
  _stc_keyGuide:SetSize(panelSizeX, _stc_keyGuide:GetSizeY())
  _stc_keyGuide:ComputePos()
  _customizingAlbumWeb = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_WEBCONTROL, Panel_CustomizingAlbum, "WebControl_CustomizingAlbum")
  _customizingAlbumWeb:SetShow(true)
  _customizingAlbumWeb:SetPosX(15)
  _customizingAlbumWeb:SetPosY(90)
  _customizingAlbumWeb:SetSize(sizeX, sizeY)
  _customizingAlbumWeb:ResetUrl()
end
Panel_CustomizingAlbum_Initialize()
local isCustomizationMode
function CustomizingAlbum_Open(isCTMode, isSceneState)
  if false == ToClient_isUserCreateContentsAllowed() then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_DONOTHAVE_PRIVILEGE")
    local messageBoxData = {
      title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"),
      content = messageBoxMemo,
      functionYes = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageBoxData)
    ToClient_showPrivilegeError()
    return
  end
  audioPostEvent_SystemUi(13, 6)
  Panel_CustomizingAlbum:SetShow(true, true)
  FGlobal_SetCandidate()
  local temporaryWrapper = getTemporaryInformationWrapper()
  local worldNo = temporaryWrapper:getSelectedWorldServerNo()
  local url = PaGlobal_URL_Check(worldNo)
  local userNo = 0
  local userNickName = ""
  local cryptKey = getSelfPlayer():get():getWebAuthenticKeyCryptString()
  local classType = getSelfPlayer():getClassType()
  local isGm = ToClient_SelfPlayerIsGM()
  if ToClient_isLobbyProcessor() then
    userNickName = getFamilyName()
    userNo = getUserNoByLobby()
  else
    userNickName = getSelfPlayer():getUserNickname()
    userNo = getSelfPlayer():get():getUserNo()
  end
  url = url .. "/customizing?userNo=" .. tostring(userNo) .. "&userNickname=" .. tostring(userNickName) .. "&certKey=" .. tostring(cryptKey) .. "&classType=" .. tostring(classType) .. "&isCustomizationMode=" .. tostring(true == isCTMode) .. "&isGm=" .. tostring(isGm)
  _customizingAlbumWeb:SetUrl(sizeX, sizeY, url, false, true)
  _customizingAlbumWeb:SetIME(true)
  isCustomizationMode = isCTMode
  Panel_CustomizingAlbum:SetPosX(getScreenSizeX() / 2 - Panel_CustomizingAlbum:GetSizeX() / 2)
  Panel_CustomizingAlbum:SetPosY(getScreenSizeY() / 2 - Panel_CustomizingAlbum:GetSizeY() / 2)
end
function CustomizingAlbum_Close()
  audioPostEvent_SystemUi(13, 5)
  FGlobal_ClearCandidate()
  _customizingAlbumWeb:ResetUrl()
  Panel_CustomizingAlbum:SetShow(false, false)
end
function FGlobal_CustomizingAlbum_Show(isCTMode, isSceneState)
  CustomizingAlbum_Open(isCTMode, isSceneState)
end
function FGlobal_CustomizingAlbum_ShowByScreenShotFrame()
  audioPostEvent_SystemUi(13, 6)
  Panel_CustomizingAlbum:SetShow(true, true)
end
function FGlobal_CustomizingAlbum_Close()
  Panel_CustomizingAlbum:SetShow(false, false)
end
function FGlobal_CustomizingAlbum_GetShow()
  return Panel_CustomizingAlbum:GetShow()
end
