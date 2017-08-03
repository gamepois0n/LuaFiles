-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\dialogue\panel_detectplayer.luac 

-- params : ...
-- function num : 0
Panel_DetectPlayer:SetShow(false, false)
Panel_DetectPlayer:ActiveMouseEventEffect(true)
Panel_DetectPlayer:setGlassBackground(true)
local UI_TM = CppEnums.TextMode
local IM = CppEnums.EProcessorInputMode
local UI_color = Defines.Color
local DetectPlayer = {_buttonFind = (UI.getChildControl)(Panel_DetectPlayer, "ButtonFind"), _editPlayerName = (UI.getChildControl)(Panel_DetectPlayer, "Edit_PlayerName"), _static_GuideMsg = (UI.getChildControl)(Panel_DetectPlayer, "StaticText_GuideMsg"), _buttonClose = (UI.getChildControl)(Panel_DetectPlayer, "Button_WinClose"), _buttonHelp = (UI.getChildControl)(Panel_DetectPlayer, "Button_Question")}
;
(DetectPlayer._buttonHelp):SetShow(false)
local editBoxClear = true
DetectPlayer.initialize = function(self)
  -- function num : 0_0 , upvalues : UI_TM
  (self._static_GuideMsg):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self._static_GuideMsg):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_DETECTPLAYER_GUIDEMSG"))
  ;
  (self._editPlayerName):addInputEvent("Mouse_LUp", "DetectPlayer_EditClear()")
  ;
  (self._buttonFind):addInputEvent("Mouse_LUp", "HandleClicked_DetectPlayer()")
  ;
  (self._buttonClose):addInputEvent("Mouse_LUp", "DetectPlayer_Close()")
  ;
  (self._buttonHelp):addInputEvent("Mouse_LUp", "")
end

DetectPlayer.show = function(self)
  -- function num : 0_1 , upvalues : DetectPlayer, editBoxClear
  Panel_DetectPlayer:SetShow(true, false)
  ;
  (DetectPlayer._editPlayerName):SetMaxInput(getGameServiceTypeCharacterNameLength())
  ;
  (DetectPlayer._editPlayerName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_DETECTPLAYER_EDITPLAYERNAME_DEFAULTMSG"), true)
  editBoxClear = true
end

DetectPlayer_Close = function()
  -- function num : 0_2 , upvalues : DetectPlayer, editBoxClear, IM
  Panel_DetectPlayer:SetShow(false, false)
  ;
  (DetectPlayer._editPlayerName):SetEditText("", true)
  editBoxClear = true
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  ClearFocusEdit()
end

DetectPlayer_reload = function()
  -- function num : 0_3 , upvalues : DetectPlayer
  DetectPlayer_Close()
  DetectPlayer:show()
end

DetectPlayer_EditClear = function()
  -- function num : 0_4 , upvalues : editBoxClear, DetectPlayer, IM
  if editBoxClear == true then
    (DetectPlayer._editPlayerName):SetEditText("", true)
    editBoxClear = false
  end
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  SetFocusEdit(DetectPlayer._editPlayerName)
end

HandleClicked_DetectPlayer = function()
  -- function num : 0_5 , upvalues : DetectPlayer
  local msgDefault = PAGetString(Defines.StringSheet_GAME, "LUA_DETECTPLAYER_EDITPLAYERNAME_DEFAULTMSG")
  if (DetectPlayer._editPlayerName):GetEditText() == nil or (DetectPlayer._editPlayerName):GetEditText() == "" or msgDefault == (DetectPlayer._editPlayerName):GetEditText() then
    local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY")
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_DETECTPLAYER_ERRORMSG_PLAYERNAME_NIL")
    local messageboxData = {title = messageBoxTitle, content = messageBoxMemo, functionApply = DetectPlayer_reload, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  else
    do
      if (string.find)((DetectPlayer._editPlayerName):GetEditText(), " ") ~= nil then
        local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY")
        local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_DETECTPLAYER_ERRORMSG_PLAYERNAME_SPACE")
        local messageboxData = {title = messageBoxTitle, content = messageBoxMemo, functionApply = DetectPlayer_reload, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
        ;
        (MessageBox.showMessageBox)(messageboxData)
      else
        do
          ToClient_DetectPlayer((DetectPlayer._editPlayerName):GetEditText())
          Panel_DetectPlayer:SetShow(false, false)
        end
      end
    end
  end
end

FromClient_OpenDetectPlayer = function()
  -- function num : 0_6 , upvalues : DetectPlayer
  DetectPlayer:show()
end

FromClient_CompleteDetectPlayer = function(position)
  -- function num : 0_7
  FGlobal_PushOpenWorldMap()
  FromClient_RClickWorldmapPanel(position, true, false)
end

registerEvent("FromClient_OpenDetectPlayer", "FromClient_OpenDetectPlayer")
registerEvent("FromClient_CompleteDetectPlayer", "FromClient_CompleteDetectPlayer")
DetectPlayer:initialize()

