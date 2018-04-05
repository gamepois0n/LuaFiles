-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\characterinfo\ui_characterinfo_panel.luac 

-- params : ...
-- function num : 0
PaGlobal_CharacterInfo = {
_tabButton = {_basic = 0, _title = 1, _history = 2, _challenge = 3, _profile = 4}
, 
_panel = {[0] = Panel_Window_CharInfo_BasicStatus, [1] = Panel_Window_CharInfo_TitleInfo, [2] = Panel_Window_CharInfo_HistoryInfo, [3] = Panel_Window_Challenge, [4] = Panel_Window_Profile}
, 
_ui = {
_staticDefaultBG = {}
, 
_radioButton = {}
, _checkButtonPopUp = (UI.getChildControl)(Panel_Window_CharInfo_Status, "CheckButton_PopUp"), _buttonQuestion = (UI.getChildControl)(Panel_Window_CharInfo_Status, "Button_Question"), _buttonClose = (UI.getChildControl)(Panel_Window_CharInfo_Status, "Button_Close")}
, _isProfileOpen = ToClient_IsContentsGroupOpen("271")}
-- DECOMPILER ERROR at PC51: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_CharacterInfo.showAni = function(self)
  -- function num : 0_0
  local aniInfo1 = Panel_Window_CharInfo_Status:addScaleAnimation(0, 0.08, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.12)
  aniInfo1.AxisX = Panel_Window_CharInfo_Status:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Window_CharInfo_Status:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_Window_CharInfo_Status:addScaleAnimation(0.08, 0.15, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.12)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Window_CharInfo_Status:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Window_CharInfo_Status:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

-- DECOMPILER ERROR at PC54: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_CharacterInfo.hideAni = function(self)
  -- function num : 0_1
  (UIAni.closeAni)(Panel_Window_CharInfo_Status)
end

-- DECOMPILER ERROR at PC57: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_CharacterInfo.initialize = function(self)
  -- function num : 0_2
  Panel_Window_CharInfo_Status:SetShow(false)
  Panel_Window_CharInfo_Status:setMaskingChild(true)
  Panel_Window_CharInfo_Status:setGlassBackground(true)
  Panel_Window_CharInfo_Status:SetDragEnable(true)
  Panel_Window_CharInfo_Status:ActiveMouseEventEffect(true)
  for key,index in pairs(self._tabButton) do
    -- DECOMPILER ERROR at PC33: Confused about usage of register: R6 in 'UnsetPending'

    ((self._ui)._staticDefaultBG)[index] = (UI.getChildControl)(Panel_Window_CharInfo_Status, "Static_DefaultBG" .. index)
    -- DECOMPILER ERROR at PC43: Confused about usage of register: R6 in 'UnsetPending'

    ;
    ((self._ui)._radioButton)[index] = (UI.getChildControl)(Panel_Window_CharInfo_Status, "RadioButton_Tab" .. index)
    ;
    ((self._panel)[index]):SetShow(false)
    ;
    (((self._ui)._staticDefaultBG)[index]):MoveChilds((((self._ui)._staticDefaultBG)[index]):GetID(), (self._panel)[index])
    ;
    (UI.deletePanel)(((self._panel)[index]):GetID())
  end
  ;
  (((self._ui)._radioButton)[(self._tabButton)._profile]):SetShow(self._isProfileOpen)
end

-- DECOMPILER ERROR at PC60: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_CharacterInfo.registEventHandler = function(self)
  -- function num : 0_3
  Panel_Window_CharInfo_Status:RegisterShowEventFunc(true, "PaGlobal_CharacterInfo:showAni()")
  Panel_Window_CharInfo_Status:RegisterShowEventFunc(false, "PaGlobal_CharacterInfo:hideAni()")
  for key,index in pairs(self._tabButton) do
    (((self._ui)._radioButton)[index]):addInputEvent("Mouse_LUp", "PaGlobal_CharacterInfo:showWindow(" .. index .. ")")
  end
  ;
  ((self._ui)._checkButtonPopUp):addInputEvent("Mouse_LUp", "PaGlobal_CharacterInfo:handleClicked_PopUp()")
  ;
  ((self._ui)._checkButtonPopUp):addInputEvent("Mouse_On", "PaGlobal_CharacterInfo:popUpToolTip( true )")
  ;
  ((self._ui)._checkButtonPopUp):addInputEvent("Mouse_Out", "PaGlobal_CharacterInfo:popUpToolTip( false )")
  ;
  ((self._ui)._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"SelfCharacterInfo\" )")
  ;
  ((self._ui)._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"SelfCharacterInfo\", \"true\")")
  ;
  ((self._ui)._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"SelfCharacterInfo\", \"false\")")
  ;
  ((self._ui)._buttonClose):addInputEvent("Mouse_LUp", "PaGlobal_CharacterInfo:hideWindow()")
end

-- DECOMPILER ERROR at PC63: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_CharacterInfo.showWindow = function(self, index)
  -- function num : 0_4
  if index == nil then
    index = 0
  end
  Panel_Window_CharInfo_Status:SetShow(true, true)
  for key,tab in pairs(self._tabButton) do
    (((self._ui)._staticDefaultBG)[tab]):SetShow(false)
    ;
    (((self._ui)._radioButton)[tab]):SetCheck(false)
  end
  ;
  (((self._ui)._staticDefaultBG)[index]):SetShow(true)
  ;
  (((self._ui)._radioButton)[index]):SetCheck(true)
  if (self._tabButton)._basic == index then
    PaGlobal_CharacterInfoBasic:showWindow()
  else
    if (self._tabButton)._title == index then
      PaGlobal_CharacterInfoTitle:showWindow()
    else
      if (self._tabButton)._history == index then
        MyHistory_DataUpdate()
      else
        if (self._tabButton)._challenge == index then
          Fglobal_Challenge_UpdateData()
        else
          if (self._tabButton)._profile == index then
            FGlobal_Profile_Update()
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC66: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_CharacterInfo.hideWindow = function(self)
  -- function num : 0_5
  Panel_Window_CharInfo_Status:SetShow(false, false)
  PaGlobal_CharacterInfoBasic:hideWindow()
  ;
  (UI.ClearFocusEdit)()
  Panel_Window_CharInfo_Status:CloseUISubApp()
  ;
  ((self._ui)._checkButtonPopUp):SetCheck(false)
  HelpMessageQuestion_Out()
  Panel_Tooltip_Item_hideTooltip()
end

-- DECOMPILER ERROR at PC69: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_CharacterInfo.handleClicked_PopUp = function(self)
  -- function num : 0_6
  if ((self._ui)._checkButtonPopUp):IsCheck() then
    Panel_Window_CharInfo_Status:OpenUISubApp()
  else
    Panel_Window_CharInfo_Status:CloseUISubApp()
  end
  TooltipSimple_Hide()
end

-- DECOMPILER ERROR at PC72: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_CharacterInfo.popUpToolTip = function(self, isShow)
  -- function num : 0_7
  if isShow then
    local name = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_TOOLTIP_NAME")
    local desc = ""
    if ((self._ui)._checkButtonPopUp):IsCheck() then
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_CHECK_TOOLTIP")
    else
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_NOCHECK_TOOLTIP")
    end
    TooltipSimple_Show((self._ui)._checkButtonPopUp, name, desc)
  else
    do
      TooltipSimple_Hide()
    end
  end
end

PaGlobal_CharacterInfo:initialize()
PaGlobal_CharacterInfo:registEventHandler()

