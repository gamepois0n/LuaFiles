-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\tutorial\panel_movie_keyviewer.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local VCK = CppEnums.VirtualKeyCode
local UI_color = Defines.Color
Panel_Movie_KeyViewer:SetDragAll(false)
Panel_Movie_KeyViewer:SetIgnore(true)
local ui = {_button_Q = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_Btn_Q"), _button_W = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_Btn_W"), _button_A = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_Btn_A"), _button_S = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_Btn_S"), _button_D = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_Btn_D"), _button_E = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_Btn_E"), _button_F = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_Btn_F"), _button_C = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_Btn_C"), _button_Tab = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_Btn_Tab"), _button_Shift = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_Btn_Shift"), _button_Space = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_Btn_Space"), _m0 = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_M0"), _m1 = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_M1"), _mBody = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_Mouse_Body"), _buttonLock = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_Button_Lock"), _m0_Lock = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_M0_Lock"), _m1_Lock = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_M1_Lock")}
local ui_2 = {_button_Q = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_Btn_Q_2"), _button_W = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_Btn_W_2"), _button_A = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_Btn_A_2"), _button_S = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_Btn_S_2"), _button_D = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_Btn_D_2"), _button_E = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_Btn_E_2"), _button_F = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_Btn_F_2"), _button_C = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_Btn_C_2"), _button_Tab = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_Btn_Tab_2"), _button_Shift = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_Btn_Shift_2"), _button_Space = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_Btn_Space_2"), _m0 = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_M0_2"), _m1 = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_M1_2"), _mBody = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_Mouse_Body_2"), _buttonLock = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_Button_Lock_2"), _m0_Lock = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_M0_Lock_2"), _m1_Lock = (UI.getChildControl)(Panel_Movie_KeyViewer, "StaticText_M1_Lock_2")}
local uvSet = {
_m0 = {
on = {1, 66, 74, 143}
, 
click = {75, 65, 148, 143}
, 
off = {149, 66, 222, 143}
}
, 
_m1 = {
on = {1, 144, 74, 221}
, 
click = {75, 143, 148, 221}
, 
off = {149, 144, 222, 221}
}
, 
_button_W = {
on = {1, 1, 63, 65}
, 
click = {63, 0, 126, 65}
, 
off = {127, 1, 189, 65}
}
, 
_button_A = {
on = {1, 1, 63, 65}
, 
click = {63, 0, 126, 65}
, 
off = {127, 1, 189, 65}
}
, 
_button_S = {
on = {1, 1, 63, 65}
, 
click = {63, 0, 126, 65}
, 
off = {127, 1, 189, 65}
}
, 
_button_D = {
on = {1, 1, 63, 65}
, 
click = {63, 0, 126, 65}
, 
off = {127, 1, 189, 65}
}
, 
_button_E = {
on = {1, 1, 63, 65}
, 
click = {63, 0, 126, 65}
, 
off = {127, 1, 189, 65}
}
, 
_button_F = {
on = {1, 1, 63, 65}
, 
click = {63, 0, 126, 65}
, 
off = {127, 1, 189, 65}
}
, 
_button_C = {
on = {1, 1, 63, 65}
, 
click = {63, 0, 126, 65}
, 
off = {127, 1, 189, 65}
}
, 
_button_Tab = {
on = {1, 1, 63, 65}
, 
click = {63, 0, 126, 65}
, 
off = {127, 1, 189, 65}
}
, 
_button_Shift = {
on = {1, 1, 63, 65}
, 
click = {63, 0, 126, 65}
, 
off = {127, 1, 189, 65}
}
, 
_button_Space = {
on = {1, 1, 63, 65}
, 
click = {63, 0, 126, 65}
, 
off = {127, 1, 189, 65}
}
, 
_button_Q = {
on = {1, 1, 63, 65}
, 
click = {63, 0, 126, 65}
, 
off = {127, 1, 189, 65}
}
}
local keyIndexSet = {_m0 = 4, _m1 = 5, _button_Q = 12, _button_W = 0, _button_A = 2, _button_S = 1, _button_D = 3, _button_E = 13, _button_F = 14, _button_C = 17, _button_T = 9, _button_Tab = 10, _button_Shift = 6, _button_Space = 7}
local keyToVirtualKey = {_m0 = 4, _m1 = 5, _button_Q = 12, _button_W = 0, _button_A = 2, _button_S = 1, _button_D = 3, _button_E = 13, _button_F = 14, _button_C = 17, _button_T = 9, _button_Tab = 10, _button_Shift = 6, _button_Space = 7}
local keyIsUpdate = {_m0 = "off", _m1 = "off", _button_W = "off", _button_A = "off", _button_S = "off", _button_D = "off", _button_E = "off", _button_F = "off", _button_C = "off", _button_Tab = "off", _button_Shift = "off", _button_Space = "off", _button_Q = "off"}
Panel_Movie_KeyViewer:SetPosX(getScreenSizeX() - (getScreenSizeX() - Panel_Movie_KeyViewer:GetSizeX()) - Panel_Movie_KeyViewer:GetSizeX() / 1.5)
Panel_Movie_KeyViewer:SetPosY(getScreenSizeY() - (getScreenSizeY() - Panel_Movie_KeyViewer:GetSizeY() * 2.3))
local panelKeyViewerPosX = Panel_Movie_KeyViewer:GetPosX()
local panelKeyViewerPosY = Panel_Movie_KeyViewer:GetPosY()
Panel_KeyViewer_ScreenRePosition = function()
  -- function num : 0_0 , upvalues : ui
  local scrX = getScreenSizeX()
  local scrY = getScreenSizeY()
  changePositionBySever(Panel_Movie_KeyViewer, (CppEnums.PAGameUIType).PAGameUIPanel_KeyViewer, true, true, false)
  if scrX < Panel_Movie_KeyViewer:GetPosX() + Panel_Movie_KeyViewer:GetSizeX() then
    Panel_Movie_KeyViewer:SetPosX(scrX - Panel_Movie_KeyViewer:GetSizeX())
  end
  if Panel_Movie_KeyViewer:GetPosX() < 0 then
    Panel_Movie_KeyViewer:SetPosX(0)
  end
  if scrY < Panel_Movie_KeyViewer:GetPosY() + Panel_Movie_KeyViewer:GetSizeY() then
    Panel_Movie_KeyViewer:SetPosX(scrY - Panel_Movie_KeyViewer:GetSizeY())
  end
  if Panel_Movie_KeyViewer:GetPosY() < 0 then
    Panel_Movie_KeyViewer:SetPosY(0)
  end
  for key,value in pairs(ui) do
    value:ComputePos()
  end
end

local ButtonToggle = function(key, isOn)
  -- function num : 0_1 , upvalues : ui, ui_2, UI_color, keyIsUpdate, keyToVirtualKey, keyIndexSet
  local aUI = ui[key]
  local aUI2 = ui_2[key]
  local keyName = "on"
  aUI:SetFontColor(UI_color.C_FFC4BEBE)
  if isOn == false then
    keyName = "off"
    aUI:SetShow(true)
    aUI2:SetShow(false)
    -- DECOMPILER ERROR at PC23: Confused about usage of register: R5 in 'UnsetPending'

    if keyIsUpdate[key] ~= "off" then
      keyIsUpdate[key] = "off"
    end
  else
    if isOn == true and keyCustom_IsPressed_Action(keyToVirtualKey[key]) then
      keyName = "click"
      aUI2:SetFontColor(UI_color.C_FFFFCE22)
      aUI:SetShow(false)
      aUI2:SetShow(true)
      -- DECOMPILER ERROR at PC49: Confused about usage of register: R5 in 'UnsetPending'

      if keyIsUpdate[key] ~= "click" then
        keyIsUpdate[key] = "click"
        aUI:SetAlpha(0)
        aUI2:SetAlpha(1)
      end
    else
      aUI:SetShow(true)
      -- DECOMPILER ERROR at PC65: Confused about usage of register: R5 in 'UnsetPending'

      if keyIsUpdate[key] ~= "on" then
        keyIsUpdate[key] = "on"
        aUI:SetShow(true)
        aUI:SetAlpha(1)
        aUI2:SetAlpha(0)
      end
    end
  end
  if isOn then
    if key == "_m0" then
      aUI:SetText("L")
      aUI2:SetText("L")
    else
      if key == "_m1" then
        aUI:SetText("R")
        aUI2:SetText("R")
      else
        local actionString = ""
        if getGamePadEnable() then
          actionString = keyCustom_GetString_ActionPad(keyIndexSet[key])
        else
          actionString = keyCustom_GetString_ActionKey(keyIndexSet[key])
        end
        aUI:SetText(actionString)
        aUI2:SetText(actionString)
      end
    end
  else
    do
      aUI:SetText(" ")
      aUI2:SetText(" ")
    end
  end
end

local ButtonToggleAll = function(isOn)
  -- function num : 0_2 , upvalues : uvSet, ButtonToggle
  for key,value in pairs(uvSet) do
    ButtonToggle(key, isOn)
  end
end

FGlobal_KeyViewer_Show = function()
  -- function num : 0_3
  Panel_Movie_KeyViewer:SetShow(true)
  Panel_KeyViewer_KeyUpdate()
end

FGlobal_KeyViewer_Hide = function()
  -- function num : 0_4
  Panel_Movie_KeyViewer:SetShow(false)
end

Panel_KeyViewer_Show = function()
  -- function num : 0_5
  Panel_Movie_KeyViewer:SetShow(true)
  Panel_KeyViewer_KeyUpdate()
end

Panel_KeyViewer_Hide = function()
  -- function num : 0_6
  Panel_Movie_KeyViewer:SetShow(false)
end

Panel_KeyViewer_KeyUpdate = function()
  -- function num : 0_7 , upvalues : ui, ButtonToggleAll
  (ui._m0):SetText("L")
  ;
  (ui._m1):SetText("R")
  ButtonToggleAll(true)
end

do
  local forMovieRecord = function()
  -- function num : 0_8
  Panel_MainStatus_User_Bar:SetShow(false)
  Panel_SelfPlayerExpGage:SetShow(false)
  Panel_Chat0:SetShow(false)
  Panel_QuickSlot:SetShow(false)
  Panel_UIMain:SetShow(false)
  Panel_CheckedQuest:SetShow(false)
  FGlobal_Panel_RadarRealLine_Show(false)
  FGlobal_Panel_Radar_Show(false)
  Panel_SkillCommand:SetShow(false)
  Panel_TimeBar:SetShow(false)
  Panel_NpcNavi:SetShow(false)
end

  PanelMovieKeyViewer_RestorePosition = function()
  -- function num : 0_9 , upvalues : panelKeyViewerPosX, panelKeyViewerPosY
  Panel_Movie_KeyViewer:SetPosX(panelKeyViewerPosX)
  Panel_Movie_KeyViewer:SetPosY(panelKeyViewerPosY)
end

  registerEvent("onScreenResize", "Panel_KeyViewer_ScreenRePosition")
  Panel_Movie_KeyViewer:RegisterUpdateFunc("Panel_KeyViewer_KeyUpdate")
  if ToClient_developmentUtility_MovieCaptureMode() == true then
  end
end

