-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\panel_logoxbox.luac 

-- params : ...
-- function num : 0
Panel_LogoXbox:SetShow(true, false)
local backGround = (UI.getChildControl)(Panel_LogoXbox, "Static_BackGround")
local button_Xbox = (UI.getChildControl)(Panel_LogoXbox, "Button_XboxPressA")
Panel_Logo_Init = function()
  -- function num : 0_0 , upvalues : backGround, button_Xbox
  screenX = getScreenSizeX()
  screenY = getScreenSizeY()
  Panel_LogoXbox:SetSize(screenX, screenY)
  backGround:SetSize(screenX, screenY)
  backGround:SetShow(true)
  backGround:ChangeTextureInfoName("New_UI_Common_ForLua/Window/Loading/Dragan_05.dds")
  backGround:ComputePos()
  button_Xbox:SetShow(true)
  button_Xbox:ComputePos()
end

Panel_Logo_Init()
Panel_LogoXbox_PressA = function()
  -- function num : 0_1
  ToClient_ActiveProcessXbox()
end

button_Xbox:addInputEvent("Mouse_LUp", "Panel_LogoXbox_PressA()")
