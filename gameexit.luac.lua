-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\gameexit\gameexit.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
Panel_GameExit:setMaskingChild(true)
Panel_GameExit:RegisterShowEventFunc(true, "GameExit_ShowAni()")
Panel_GameExit:RegisterShowEventFunc(false, "GameExit_HideAni()")
Panel_GameExit:setGlassBackground(true)
local _buttonExitCancel = (UI.getChildControl)(Panel_GameExit, "Button_Exit_Cancel")
local _buttonExitConfirm = (UI.getChildControl)(Panel_GameExit, "Button_Exit_Confirm")
local _buttonExitClose = (UI.getChildControl)(Panel_GameExit, "Button_Exit_Close")
local _buttonBackCharacterSelect = (UI.getChildControl)(Panel_GameExit, "Button_Return_CharacterSelect")
local _textNoticeMsg = (UI.getChildControl)(Panel_GameExit, "StaticText_NoticeText_0")
local _textExitQuestionMsg = (UI.getChildControl)(Panel_GameExit, "StaticText_ExitMsg")
local _buttonApply = (UI.getChildControl)(Panel_GameExit, "Button_Apply")
local exitMode = -1
enum_ExitMode = {eExitMode_GameExit = 0, eExitMode_BackCharacter = 1, eExitMode_SwapCharacter = 2}
local exit_Time = 0
local prevTime = 0
local selectCharacterIndex = -1
local back_CharacterSelectTime = 0
gameExit_UpdatePerFrame = function(deltaTime)
  -- function num : 0_0 , upvalues : exit_Time, prevTime, exitMode, _textNoticeMsg
  if exit_Time > 0 then
    exit_Time = exit_Time - deltaTime
    local remainTime = (math.floor)(exit_Time)
    if prevTime ~= remainTime then
      if remainTime < 0 then
        remainTime = 0
      end
      prevTime = remainTime
      if enum_ExitMode.eExitMode_GameExit == exitMode then
        _textNoticeMsg:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_TO_EXIT", "remainTime", tostring(remainTime)))
        if prevTime <= 0 then
          exit_Time = -1
          _textNoticeMsg:SetText(PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_PROGRESS"))
          doGameLogOut()
        end
      else
        if enum_ExitMode.eExitMode_BackCharacter == exitMode then
          _textNoticeMsg:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_TO_CHARACTER_SELECT", "remainTime", tostring(remainTime)))
          if prevTime <= 0 then
            exit_Time = -1
            _textNoticeMsg:SetText(PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_GO_CHARACTERSELECT"))
          end
        else
          if enum_ExitMode.eExitMode_SwapCharacter == exitMode then
            _textNoticeMsg:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_TO_SWAPCHARACTER", "remainTime", tostring(remainTime)))
            if prevTime <= 0 then
              exit_Time = -1
              _textNoticeMsg:SetText(PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_GO_SWAPCHARACTER"))
            end
          end
        end
      end
    end
  end
end

doGameLogOut = function()
  -- function num : 0_1
  Panel_GameExit:SetShow(false)
  SetUIMode((Defines.UIMode).eUIMode_Default)
  sendGameLogOut()
end

setGameExitDelayTime = function(delayTime)
  -- function num : 0_2 , upvalues : exit_Time, exitMode, _textExitQuestionMsg, _textNoticeMsg
  if Panel_GameExit:GetShow() == false then
    return 
  end
  exit_Time = delayTime
  if enum_ExitMode.eExitMode_SwapCharacter ~= exitMode then
    _textExitQuestionMsg:SetText(PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_CANCEL"))
  end
  if enum_ExitMode.eExitMode_GameExit == exitMode then
    _textNoticeMsg:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_TO_EXIT", "remainTime", tostring(delayTime)))
  else
    if enum_ExitMode.eExitMode_BackCharacter == exitMode then
      _textNoticeMsg:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_TO_CHARACTER_SELECT", "remainTime", tostring(delayTime)))
    end
  end
end

btn_Click_ExitConfirm = function()
  -- function num : 0_3 , upvalues : exitMode, _buttonExitConfirm, _buttonExitClose, _buttonExitCancel, _buttonBackCharacterSelect
  exitMode = enum_ExitMode.eExitMode_GameExit
  sendBeginGameDelayExit(enum_ExitMode.eExitMode_SwapCharacter == exitMode)
  _buttonExitConfirm:SetShow(false)
  _buttonExitClose:SetShow(false)
  _buttonExitCancel:SetShow(true)
  _buttonBackCharacterSelect:SetShow(false)
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

btn_Click_ExitCancel = function()
  -- function num : 0_4 , upvalues : exitMode, selectCharacterIndex, _textNoticeMsg, _textExitQuestionMsg, exit_Time, _buttonExitConfirm, _buttonExitClose, _buttonExitCancel, _buttonBackCharacterSelect, prevTime
  sendGameDelayExitCancel()
  if enum_ExitMode.eExitMode_SwapCharacter == exitMode then
    showGameExitPanel(1, selectCharacterIndex)
  else
    _textNoticeMsg:SetText(PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_TITLE"))
    _textExitQuestionMsg:SetText(PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_FINAL_CHECK"))
    exit_Time = 0
    _buttonExitConfirm:SetShow(true)
    _buttonExitClose:SetShow(true)
    _buttonExitCancel:SetShow(false)
    _buttonBackCharacterSelect:SetShow(true)
  end
  exitMode = -1
  prevTime = -1
end

GameExit_ShowAni = function()
  -- function num : 0_5
  (UIAni.fadeInSCR_Down)(Panel_GameExit)
end

GameExit_HideAni = function()
  -- function num : 0_6 , upvalues : UI_ANI_ADV, UI_color
  Panel_GameExit:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local gameExitHideAni = Panel_GameExit:addColorAnimation(0, 0.25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  gameExitHideAni:SetStartColor(UI_color.C_FFFFFFFF)
  gameExitHideAni:SetEndColor(UI_color.C_00FFFFFF)
  gameExitHideAni:SetStartIntensity(3)
  gameExitHideAni:SetEndIntensity(1)
  gameExitHideAni.IsChangeChild = true
  gameExitHideAni:SetHideAtEnd(true)
  gameExitHideAni:SetDisableWhileAni(true)
end

btn_Click_ExitClose = function()
  -- function num : 0_7 , upvalues : exit_Time, selectCharacterIndex
  SetUIMode((Defines.UIMode).eUIMode_Default)
  Panel_GameExit:SetShow(false, true)
  GameExit_HideAni()
  exit_Time = 0
  sendGameDelayExitCancel()
  selectCharacterIndex = -1
  local selfProxy = getSelfPlayer()
  if selfProxy ~= nil then
    (selfProxy:get()):setForceInputAble(true)
  end
end

btn_Click_Back_CharacterSelect = function()
  -- function num : 0_8 , upvalues : exitMode, _buttonExitConfirm, _buttonExitClose, _buttonExitCancel, _buttonBackCharacterSelect, _textExitQuestionMsg
  exitMode = enum_ExitMode.eExitMode_BackCharacter
  sendCharacterSelect()
  _buttonExitConfirm:SetShow(false)
  _buttonExitClose:SetShow(false)
  _buttonExitCancel:SetShow(true)
  _buttonBackCharacterSelect:SetShow(false)
  _textExitQuestionMsg:SetText(PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_CANCEL"))
end

global_SwapCharacter = function(isSwitching)
  -- function num : 0_9
  return swapCharacter_Select(swapCharacter._selectSwapCharacterIndex, isSwitching)
end

btn_Click_SwapCharacter = function()
  -- function num : 0_10 , upvalues : exitMode, _buttonExitConfirm, _buttonExitClose, _buttonExitCancel, _buttonApply, _buttonBackCharacterSelect, _textExitQuestionMsg
  exitMode = enum_ExitMode.eExitMode_SwapCharacter
  local rv = global_SwapCharacter(true)
  if rv == false then
    return 
  end
  _buttonExitConfirm:SetShow(false)
  _buttonExitClose:SetShow(false)
  _buttonExitCancel:SetShow(true)
  _buttonApply:SetShow(false)
  _buttonBackCharacterSelect:SetShow(false)
  _textExitQuestionMsg:SetText(PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_GO_SWAPCHARACTER"))
end

showGameExitPanel = function(showBoxIndex, selectIndex)
  -- function num : 0_11 , upvalues : exit_Time, exitMode, prevTime, selectCharacterIndex, _textNoticeMsg, _textExitQuestionMsg, _buttonExitConfirm, _buttonBackCharacterSelect, _buttonExitCancel, _buttonExitClose, _buttonApply
  SetUIMode((Defines.UIMode).eUIMode_GameExit)
  exit_Time = 0
  exitMode = -1
  prevTime = -1
  selectCharacterIndex = selectIndex
  local selfProxy = getSelfPlayer()
  if selfProxy ~= nil then
    (selfProxy:get()):setForceInputAble(false)
  end
  if showBoxIndex == 0 then
    _textNoticeMsg:SetText(PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_TITLE"))
    _textExitQuestionMsg:SetText(PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_FINAL_CHECK"))
    Panel_GameExit:SetShow(true, true)
    _buttonExitConfirm:SetIgnore(false)
    _buttonExitConfirm:SetShow(true)
    _buttonBackCharacterSelect:SetShow(true)
    _buttonExitCancel:SetShow(false)
    _buttonExitClose:SetShow(true)
    _buttonApply:SetShow(false)
    GameExit_ShowAni()
  else
    _textNoticeMsg:SetText(PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_SWAP_CHARACTER_TITLE"))
    local characterData = getCharacterDataByIndex(selectCharacterIndex)
    _textExitQuestionMsg:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "GAMEEXIT_SWAP_CHARACTER_QUESTION", "characterName", getCharacterName(characterData)))
    Panel_GameExit:SetShow(true, true)
    _buttonExitConfirm:SetIgnore(true)
    _buttonExitConfirm:SetShow(false)
    _buttonBackCharacterSelect:SetShow(false)
    _buttonExitCancel:SetShow(false)
    _buttonExitClose:SetShow(true)
    _buttonApply:SetShow(true)
    GameExit_ShowAni()
  end
end

local Game_Exit_InitUIControl = function()
  -- function num : 0_12 , upvalues : _buttonExitCancel, _buttonExitConfirm, _buttonExitClose, _buttonBackCharacterSelect, _buttonApply
  _buttonExitCancel:addInputEvent("Mouse_LUp", "btn_Click_ExitCancel()")
  _buttonExitConfirm:addInputEvent("Mouse_LUp", "btn_Click_ExitConfirm()")
  _buttonExitClose:addInputEvent("Mouse_LUp", "btn_Click_ExitClose()")
  _buttonBackCharacterSelect:addInputEvent("Mouse_LUp", "btn_Click_Back_CharacterSelect()")
  _buttonApply:addInputEvent("Mouse_LUp", "btn_Click_SwapCharacter()")
  Panel_GameExit:RegisterUpdateFunc("gameExit_UpdatePerFrame")
  registerEvent("EventGameExitDelayTime", "setGameExitDelayTime")
end

Game_Exit_InitUIControl()

