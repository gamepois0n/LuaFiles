Panel_LogoXbox:SetShow(true, false)
local backGround = UI.getChildControl(Panel_LogoXbox, "Static_BackGround")
local button_Xbox = UI.getChildControl(Panel_LogoXbox, "Button_XboxPressA")
local txt_VersionInfo = UI.getChildControl(Panel_LogoXbox, "StaticText_VersionInfo")
function Panel_Logo_Init()
  screenX = getScreenSizeX()
  screenY = getScreenSizeY()
  Panel_LogoXbox:SetSize(screenX, screenY)
  backGround:SetSize(screenX, screenY)
  backGround:SetShow(true)
  backGround:ChangeTextureInfoName("Renewal/LoadingScreenshot/BOD_Xbox_SplashScreen_00.dds")
  backGround:ComputePos()
  button_Xbox:SetShow(true)
  button_Xbox:ComputePos()
  txt_VersionInfo:SetShow(_ContentsGroup_ForXBoxClosedBeta)
  txt_VersionInfo:ComputePos()
end
Panel_Logo_Init()
function Panel_LogoXbox_PressA()
  ToClient_ActiveProcessXbox()
end
function Panel_LogoXbox_UpdatePerFrame()
  if isPadUp(__eJoyPadInputType_A) then
    local messageboxData = {
      title = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY"),
      content = "Pocessing .. ",
      functionYes = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageboxData)
  end
end
Panel_LogoXbox:registerPadEvent(__eConsoleUIPadEvent_Up_A, "Panel_LogoXbox_PressA()")
button_Xbox:addInputEvent("Mouse_LUp", "Panel_LogoXbox_PressA()")
