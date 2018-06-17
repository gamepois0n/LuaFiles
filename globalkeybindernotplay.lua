local VCK = CppEnums.VirtualKeyCode
local GlobalKeyBinder_CheckKeyPressed = function(keyCode)
  return isKeyDown_Once(keyCode)
end
function GlobalKeyBinder_UpdateNotPlay(deltaTime)
  if MessageBox.isPopUp() then
    local pcKey = GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE)
    if pcKey and not _ContentsGroup_RenewUI then
      MessageBox.keyProcessEnter()
      setUiInputProcessed(VCK.KeyCode_RETURN)
      setUiInputProcessed(VCK.KeyCode_SPACE)
      return true
    elseif isPadUp(__eJoyPadInputType_A) and _ContentsGroup_RenewUI then
      MessageBox.keyProcessEnter()
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      MessageBox.keyProcessEscape()
      return true
    end
  end
  if nil == Panel_Login or not Panel_Login:GetShow() or nil ~= Panel_Window_Policy and Panel_Window_Policy:GetShow() then
  elseif nil ~= Panel_TermsofGameUse and Panel_TermsofGameUse:GetShow() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
      FGlobal_HandleClicked_TermsofGameUse_Next()
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      FGlobal_TermsofGameUse_Close()
    end
  elseif nil ~= Panel_Login_Password and Panel_Login_Password:GetShow() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
      LoginPassword_Enter()
    elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
      LoginPassword_Cancel()
    end
  elseif nil ~= Panel_Login_Nickname and Panel_Login_Nickname:GetShow() then
    return
  elseif GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
    Panel_Login_BeforOpen()
  end
  if nil ~= Panel_CharacterSelectNew and Panel_CharacterSelectNew:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    CharacterSelect_Back()
  end
  if nil ~= Panel_CharacterSelect_Renew and Panel_CharacterSelect_Renew:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    PaGlobal_CharacterSelect_BackToServerSelect()
  end
  if nil ~= Panel_Window_cOption and Panel_Window_cOption:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    Panel_Window_cOption:SetShow(false, true)
  end
end
registerEvent("EventGlobalKeyBinderNotPlay", "GlobalKeyBinder_UpdateNotPlay")
