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
  _AudioPostEvent_SystemUiForXBOX(13, 5)
  Panel_CustomizingAlbum:SetAlpha(1)
  local aniInfo = UIAni.AlphaAnimation(0, Panel_CustomizingAlbum, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end
local _titleBar = UI.getChildControl(Panel_CustomizingAlbum, "StaticText_TitleBg")
local _stc_keyGuide = UI.getChildControl(Panel_CustomizingAlbum, "Static_BottomBg")
local _customizingAlbumWeb, sizeX, sizeY, panelSizeX, panelSizeY, titleBarSizeX
local _stc_keyGuide_Profile = UI.getChildControl(_stc_keyGuide, "StaticText_X_ConsoleUI")
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
  _stc_keyGuide_Profile:SetShow(false)
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
  if false == _ContentsGroup_RenewUI_BeautyAlbum then
    return
  end
  audioPostEvent_SystemUi(13, 6)
  _AudioPostEvent_SystemUiForXBOX(13, 6)
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
  url = url .. "/customizing?userNo=" .. tostring(userNo) .. "&userNickname=" .. tostring(userNickName) .. "&certKey=" .. tostring(cryptKey) .. "&classType=" .. tostring(classType) .. "&isCustomizationMode=" .. tostring(true == isCTMode)
  if true == isGm then
    url = url .. "&isGm=" .. tostring(isGm)
  end
  url = url .. "&isEveryone=" .. tostring(true == ToClient_isUserCreateContentsAllowed())
  _customizingAlbumWeb:SetUrl(sizeX, sizeY, url, false, true)
  _customizingAlbumWeb:SetIME(true)
  isCustomizationMode = isCTMode
  Panel_CustomizingAlbum:SetPosX(getScreenSizeX() / 2 - Panel_CustomizingAlbum:GetSizeX() / 2)
  Panel_CustomizingAlbum:SetPosY(getScreenSizeY() / 2 - Panel_CustomizingAlbum:GetSizeY() / 2)
end
function CustomizingAlbum_Close()
  audioPostEvent_SystemUi(13, 5)
  _AudioPostEvent_SystemUiForXBOX(13, 5)
  _PA_LOG("\236\157\180\235\139\164\237\152\156", "CustomizingAlbum_Close")
  FGlobal_ClearCandidate()
  _customizingAlbumWeb:ResetUrl()
  Panel_CustomizingAlbum:SetShow(false, false)
end
function FGlobal_CustomizingAlbum_Show(isCTMode, isSceneState)
  CustomizingAlbum_Open(isCTMode, isSceneState)
end
function FGlobal_CustomizingAlbum_ShowByScreenShotFrame()
  if false == _ContentsGroup_RenewUI_BeautyAlbum then
    return
  end
  audioPostEvent_SystemUi(13, 6)
  _AudioPostEvent_SystemUiForXBOX(13, 6)
  Panel_CustomizingAlbum:SetShow(true, true)
end
function FGlobal_CustomizingAlbum_Close()
  Panel_CustomizingAlbum:SetShow(false, false)
end
function FGlobal_CustomizingAlbum_GetShow()
  return Panel_CustomizingAlbum:GetShow()
end
function FromClient_LeaveDetailCustomView()
  Panel_CustomizingAlbum:registerPadEvent(__eConsoleUIPadEvent_Up_X, "")
  _stc_keyGuide_Profile:SetShow(false)
end
function FromClient_EnterDetailCustomView()
  local xuid = ToClient_getXboxCustomAuthorXuid()
  if nil ~= xuid and xuid ~= "" then
    _stc_keyGuide_Profile:SetShow(true)
  end
end
function FromClient_ErrorDoNotHaveEveryonePrivilege()
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_DONOTHAVE_PRIVILEGE_FOR_BEAUTY")
  local messageBoxData = {
    title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"),
    content = messageBoxMemo,
    functionYes = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData)
  ToClient_showPrivilegeError(true)
end
function showXboxUserProfile(xuid)
  if true ~= _stc_keyGuide_Profile:GetShow() then
    return
  end
  local xuid = ToClient_getXboxCustomAuthorXuid()
  if nil ~= xuid and xuid ~= "" then
    ToClient_showXboxFriendProfile(xuid)
  else
    local messageBoxMemo = PAGetString(Defines.StringSheet_SymbolNo, "eErrCantFindFriendForXbox")
    local messageBoxData = {
      title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"),
      content = messageBoxMemo,
      functionYes = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageBoxData)
  end
end
registerEvent("FromClient_LeaveDetailCustomView", "FromClient_LeaveDetailCustomView")
registerEvent("FromClient_EnterDetailCustomView", "FromClient_EnterDetailCustomView")
registerEvent("FromClient_ErrorDoNotHaveEveryonePrivilege", "FromClient_ErrorDoNotHaveEveryonePrivilege")
