-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\messagebox\panel_kickoff.luac 

-- params : ...
-- function num : 0
Panel_KickOff:SetShow(false)
local UI_TM = CppEnums.TextMode
local kickOff = {_txt_Title = (UI.getChildControl)(Panel_KickOff, "StaticText_Title"), _btn_KickOff_Win_Close = (UI.getChildControl)(Panel_KickOff, "Button_Win_Close"), _screenShotBG = (UI.getChildControl)(Panel_KickOff, "Static_BG"), _txt_KickOffDesc = (UI.getChildControl)(Panel_KickOff, "StaticText_KickOffDesc"), _btn_KickOffApply = (UI.getChildControl)(Panel_KickOff, "Button_Confirm"), _btn_KickOffCancel = (UI.getChildControl)(Panel_KickOff, "Button_AlarmCancel"), savedIsType = 1}
PaGlobal_Panel_KickOff_Init = function()
  -- function num : 0_0 , upvalues : kickOff, UI_TM
  local self = kickOff
  ;
  (self._txt_KickOffDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self._txt_Title):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_BDOKR2_B"))
  ;
  (self._screenShotBG):SetSize((self._screenShotBG):GetSizeX(), (self._txt_KickOffDesc):GetTextSizeY() + 20)
  Panel_KickOff:SetSize(Panel_KickOff:GetSizeX(), (self._screenShotBG):GetSizeY() + 110)
  ;
  (self._btn_KickOff_Win_Close):addInputEvent("Mouse_LUp", "PaGlobal_Panel_KickOff_Close()")
  ;
  (self._btn_KickOffApply):addInputEvent("Mouse_LUp", "PaGlobal_Panel_KickOff_Apply()")
  ;
  (self._btn_KickOffCancel):addInputEvent("Mouse_LUp", "PaGlobal_Panel_KickOff_OpenFolder()")
end

PaGlobal_Panel_KickOff_Position = function()
  -- function num : 0_1 , upvalues : kickOff
  local self = kickOff
  Panel_KickOff:ComputePos()
  ;
  (self._btn_KickOffApply):ComputePos()
  ;
  (self._btn_KickOffCancel):ComputePos()
end

FromClient_AntiAddiction = function(isType)
  -- function num : 0_2 , upvalues : kickOff
  local self = kickOff
  self.savedIsType = isType
  PaGlobal_Panel_KickOff_Open(isType)
end

PaGlobal_Panel_KickOff_Open = function(isType)
  -- function num : 0_3 , upvalues : kickOff
  local self = kickOff
  local screenShotFileName = getRecentScreenShotFileName()
  if isType == 1 then
    (self._txt_KickOffDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_BDOKR2_C"))
  else
    if isType == 2 then
      (self._txt_KickOffDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_BDOKR2_D"))
    else
      if isType == 3 then
        (self._txt_KickOffDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_BDOKR2_E"))
      else
        if isType == 4 then
          (self._txt_KickOffDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_BDOKR2_E"))
        else
          connectToGameByChina()
          return 
        end
      end
    end
  end
  ;
  (self._screenShotBG):SetSize((self._screenShotBG):GetSizeX(), (self._txt_KickOffDesc):GetTextSizeY() + 20)
  Panel_KickOff:SetSize(Panel_KickOff:GetSizeX(), (self._screenShotBG):GetSizeY() + 110)
  PaGlobal_Panel_KickOff_Position()
  Panel_KickOff:SetShow(true)
end

PaGlobal_Panel_KickOff_Close = function()
  -- function num : 0_4
  Panel_KickOff:SetShow(false)
end

PaGlobal_Panel_KickOff_Apply = function()
  -- function num : 0_5 , upvalues : kickOff
  local self = kickOff
  if self.savedIsType == 4 then
    exitGameClient(1)
  else
    connectToGameByChina()
    PaGlobal_Panel_KickOff_Close()
  end
end

PaGlobal_Panel_KickOff_Init()
registerEvent("onScreenResize", "PaGlobal_Panel_KickOff_Position")
registerEvent("FromClient_AntiAddiction", "FromClient_AntiAddiction")

