-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\globalkeybindernotplay.luac 

-- params : ...
-- function num : 0
local VCK = CppEnums.VirtualKeyCode
local GlobalKeyBinder_CheckKeyPressed = function(keyCode)
  -- function num : 0_0
  return isKeyDown_Once(keyCode)
end

GlobalKeyBinder_UpdateNotPlay = function(deltaTime)
  -- function num : 0_1 , upvalues : GlobalKeyBinder_CheckKeyPressed, VCK
  if (MessageBox.isPopUp)() then
    if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) or GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_SPACE) then
      (MessageBox.keyProcessEnter)()
    else
      if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
        (MessageBox.keyProcessEscape)()
      end
    end
    return 
  end
  if Panel_Login ~= nil and Panel_Login:GetShow() then
    if Panel_TermsofGameUse ~= nil and Panel_TermsofGameUse:GetShow() then
      if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
        FGlobal_HandleClicked_TermsofGameUse_Next()
      else
        if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
          FGlobal_TermsofGameUse_Close()
        end
      end
    else
      if Panel_Login_Password ~= nil and Panel_Login_Password:GetShow() then
        if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
          LoginPassword_Enter()
        else
          if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
            LoginPassword_Cancel()
          end
        end
      else
        if Panel_Login_Nickname ~= nil and Panel_Login_Nickname:GetShow() then
          return 
        else
          if GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_RETURN) then
            Panel_Login_BeforOpen()
          end
        end
      end
    end
  end
  if Panel_CharacterSelectNew ~= nil and Panel_CharacterSelectNew:GetShow() and GlobalKeyBinder_CheckKeyPressed(VCK.KeyCode_ESCAPE) then
    CharacterSelect_Back()
  end
end

registerEvent("EventGlobalKeyBinderNotPlay", "GlobalKeyBinder_UpdateNotPlay")

