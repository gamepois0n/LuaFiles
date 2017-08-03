-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\messagebox\panel_screenshot_for_desktop.luac 

-- params : ...
-- function num : 0
Panel_ScreenShot_For_Desktop:SetShow(false)
local UI_TM = CppEnums.TextMode
local ScreenShotSize = {_btn_ScreenShot_Win_Close = (UI.getChildControl)(Panel_ScreenShot_For_Desktop, "Button_Win_Close"), _screenShotBG = (UI.getChildControl)(Panel_ScreenShot_For_Desktop, "Static_BG"), _txt_ScreenShotDesc = (UI.getChildControl)(Panel_ScreenShot_For_Desktop, "StaticText_ScreenShotDesc"), _btn_ScreenShotApply = (UI.getChildControl)(Panel_ScreenShot_For_Desktop, "Button_Confirm"), _btn_ScreenShotCancel = (UI.getChildControl)(Panel_ScreenShot_For_Desktop, "Button_AlarmCancel")}
PaGlobal_Panel_ScreenShot_For_Desktop_Init = function()
  -- function num : 0_0 , upvalues : ScreenShotSize, UI_TM
  local self = ScreenShotSize
  local screenShotFileName = getRecentScreenShotFileName()
  ;
  (self._txt_ScreenShotDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self._txt_ScreenShotDesc):SetText(tostring(screenShotFileName) .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOTFORDESKTOP_DESC"))
  ;
  (self._screenShotBG):SetSize((self._screenShotBG):GetSizeX(), (self._txt_ScreenShotDesc):GetTextSizeY() + 20)
  Panel_ScreenShot_For_Desktop:SetSize(Panel_ScreenShot_For_Desktop:GetSizeX(), (self._screenShotBG):GetSizeY() + 110)
  ;
  (self._btn_ScreenShot_Win_Close):addInputEvent("Mouse_LUp", "PaGlobal_Panel_ScreenShot_For_Desktop_Close()")
  ;
  (self._btn_ScreenShotApply):addInputEvent("Mouse_LUp", "PaGlobal_Panel_ScreenShot_For_Desktop_Apply()")
  ;
  (self._btn_ScreenShotCancel):addInputEvent("Mouse_LUp", "PaGlobal_Panel_ScreenShot_For_Desktop_OpenFolder()")
end

PaGlobal_Panel_ScreenShot_For_Desktop_Position = function()
  -- function num : 0_1 , upvalues : ScreenShotSize
  local self = ScreenShotSize
  Panel_ScreenShot_For_Desktop:ComputePos()
  ;
  (self._btn_ScreenShotApply):ComputePos()
  ;
  (self._btn_ScreenShotCancel):ComputePos()
end

PaGlobal_Panel_ScreenShot_For_Desktop_Open = function()
  -- function num : 0_2 , upvalues : ScreenShotSize, UI_TM
  local self = ScreenShotSize
  local screenShotFileName = getRecentScreenShotFileName()
  ;
  (self._txt_ScreenShotDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self._txt_ScreenShotDesc):SetText(tostring(screenShotFileName) .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_SCREENSHOTFORDESKTOP_DESC"))
  ;
  (self._screenShotBG):SetSize((self._screenShotBG):GetSizeX(), (self._txt_ScreenShotDesc):GetTextSizeY() + 20)
  Panel_ScreenShot_For_Desktop:SetSize(Panel_ScreenShot_For_Desktop:GetSizeX(), (self._screenShotBG):GetSizeY() + 110)
  Panel_ScreenShot_For_Desktop:SetShow(true)
end

PaGlobal_Panel_ScreenShot_For_Desktop_Close = function()
  -- function num : 0_3
  Panel_ScreenShot_For_Desktop:SetShow(false)
end

PaGlobal_Panel_ScreenShot_For_Desktop_Apply = function()
  -- function num : 0_4
  local filepath = getRecentScreenShotFileName()
  setWallpaper(filepath)
  PaGlobal_Panel_ScreenShot_For_Desktop_Close()
end

PaGlobal_Panel_ScreenShot_For_Desktop_OpenFolder = function()
  -- function num : 0_5
  ToClient_OpenDirectory((CppEnums.OpenDirectoryType).DirectoryType_ScreenShot)
end

PaGlobal_Panel_ScreenShot_For_Desktop_Init()
registerEvent("onScreenResize", "PaGlobal_Panel_ScreenShot_For_Desktop_Position")

