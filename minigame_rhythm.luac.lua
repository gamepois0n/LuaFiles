-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\minigame\minigame_rhythm.luac 

-- params : ...
-- function num : 0
Panel_RhythmGame:SetShow(false, false)
local MGKT = CppEnums.MiniGameKeyType
local UIColor = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local _rhythmBG = (UI.getChildControl)(Panel_RhythmGame, "Static_rhythmBG")
local _rhythmNote = (UI.getChildControl)(Panel_RhythmGame, "Static_rhythmNote")
local _rhythmCursor = (UI.getChildControl)(Panel_RhythmGame, "Static_rhythmCursor")
local _purposeMessage = (UI.getChildControl)(Panel_RhythmGame, "StaticText_Purpose")
local _MouseBody_L = (UI.getChildControl)(Panel_RhythmGame, "Static_MouseBody_L")
local _MouseBody_R = (UI.getChildControl)(Panel_RhythmGame, "Static_MouseBody_R")
local _LButton_L = (UI.getChildControl)(Panel_RhythmGame, "Static_L_Btn_L")
local _LButton_R = (UI.getChildControl)(Panel_RhythmGame, "Static_L_Btn_R")
local _RButton_L = (UI.getChildControl)(Panel_RhythmGame, "Static_R_Btn_L")
local _RButton_R = (UI.getChildControl)(Panel_RhythmGame, "Static_R_Btn_R")
local _fontGood = (UI.getChildControl)(Panel_RhythmGame, "Static_Result_Good")
local _fontBad = (UI.getChildControl)(Panel_RhythmGame, "Static_Result_Bad")
_rhythmNote:SetShow(false)
local isRhythmGamePlay = false
_nowCursorPosX = 0
_justCursorPosX = 0
local scrX = getScreenSizeX()
local scrY = getScreenSizeY()
local cursorFixedValue = 5
local cursorIndexValue = 31
local cursorIndex = 0
local culledSize = 10
local hideSize = 20
local noteSpeed = 75
local noteBuffer = {}
local notePosBuffer = {}
local bufferMax = 50
local bufferIndex = 1
local createTime = 0.5
local currentSumTime = 0
local rhythmQuestList = {
{questGroup = 1001, questId = 53}
, 
{questGroup = 2001, questId = 58}
, 
{questGroup = 6505, questId = 3}
; 
[0] = {questGroup = 1001, questId = 7}
}
local miniGameNo = 1101
for idx = 1, bufferMax do
  local control = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, Panel_RhythmGame, "Static_rhythmNote_" .. idx)
  CopyBaseProperty(_rhythmNote, control)
  control:SetShow(false)
  noteBuffer[idx] = control
end
local posSetting = function(control, index)
  -- function num : 0_0 , upvalues : _rhythmNote, scrX, _rhythmBG
  CopyBaseProperty(_rhythmNote, control)
  if index == 1 then
    control:SetPosX(scrX / 2 - _rhythmBG:GetSizeX() / 2 + 4)
  else
    if index == 2 then
      control:SetPosX(scrX / 2 - _rhythmBG:GetSizeX() / 2 + 35)
    else
      if index == 3 then
        control:SetPosX(scrX / 2 - _rhythmBG:GetSizeX() / 2 + 66)
      else
        if index == 4 then
          control:SetPosX(scrX / 2 - _rhythmBG:GetSizeX() / 2 + 97)
        else
          if index == 5 then
            control:SetPosX(scrX / 2 - _rhythmBG:GetSizeX() / 2 + 129)
          end
        end
      end
    end
  end
end

local getRhythm = function()
  -- function num : 0_1 , upvalues : bufferIndex, bufferMax, noteBuffer, notePosBuffer, posSetting
  local prevIndex = bufferIndex
  bufferIndex = bufferIndex + 1
  if bufferMax < bufferIndex then
    bufferIndex = 1
  end
  local rv = noteBuffer[prevIndex]
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R2 in 'UnsetPending'

  notePosBuffer[prevIndex] = (math.random)(1, 5)
  posSetting(rv, notePosBuffer[prevIndex])
  return rv
end

Rhythm_RePosition = function()
  -- function num : 0_2 , upvalues : scrX, scrY
  Panel_RhythmGame:SetSize(scrX, scrY)
end

local isFailed = false
local questCheckTime = 0
local playingTime = 20
RhythmGame_UpdateFunc = function(fDeltaTime)
  -- function num : 0_3 , upvalues : currentSumTime, questCheckTime, _rhythmBG, hideSize, _rhythmNote, culledSize, noteBuffer, noteSpeed, notePosBuffer, cursorIndex, isFailed, _fontBad, playingTime, miniGameNo, createTime, getRhythm
  currentSumTime = currentSumTime + fDeltaTime
  questCheckTime = questCheckTime + fDeltaTime
  local posOver = _rhythmBG:GetPosY() + _rhythmBG:GetSizeY() - hideSize - _rhythmNote:GetSizeY() + 5
  local culledPos = _rhythmBG:GetPosY() + _rhythmBG:GetSizeY() - hideSize - culledSize - _rhythmNote:GetSizeY()
  for key,control in pairs(noteBuffer) do
    control:SetPosY(control:GetPosY() + fDeltaTime * noteSpeed)
    if posOver < control:GetPosY() then
      local value = control:GetPosY() - posOver
      control:SetAlpha((hideSize - value) / hideSize)
      if hideSize < value then
        control:SetShow(false)
      end
    else
      do
        do
          if culledPos < control:GetPosY() and notePosBuffer[key] ~= nil and notePosBuffer[key] == cursorIndex + 1 and control:GetShow() then
            ((getSelfPlayer()):get()):SetMiniGameResult(1)
            control:SetShow(false)
            if isFailed == false then
              audioPostEvent_SystemUi(11, 2)
              _fontBad:SetShow(true)
              _fontBad:ResetVertexAni()
              _fontBad:SetVertexAniRun("Bad_Ani_Start", true)
              _fontBad:SetVertexAniRun("Bad_Ani", true)
              isFailed = true
              questCheckTime = 0
            end
          end
          -- DECOMPILER ERROR at PC122: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC122: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC122: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  if Rhythm_QuestCheck() and playingTime < questCheckTime then
    request_clearMiniGame(miniGameNo)
    questCheckTime = 0
  end
  local count = 0
  if createTime < currentSumTime then
    currentSumTime = currentSumTime - createTime
    while 1 do
      if (count == 0 or (math.random)(0, 5) > 1) and count < 2 then
        do
          local targetControl = getRhythm()
          targetControl:SetShow(true)
          count = count + 1
          -- DECOMPILER ERROR at PC163: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC163: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end

Rhythm_QuestCheck = function()
  -- function num : 0_4 , upvalues : rhythmQuestList
  for index = 0, #rhythmQuestList do
    if questList_hasProgressQuest((rhythmQuestList[index]).questGroup, (rhythmQuestList[index]).questId) then
      return true
    end
  end
  return false
end

Panel_Minigame_Rhythm_Start = function()
  -- function num : 0_5 , upvalues : _fontBad, cursorIndex, isFailed, bufferIndex, noteBuffer, posSetting, _rhythmNote, _rhythmBG, scrX, _rhythmCursor, _purposeMessage, _MouseBody_L, _MouseBody_R, _LButton_L, _LButton_R, _RButton_L, _RButton_R, questCheckTime
  Interaction_Close()
  _fontBad:SetShow(false)
  cursorIndex = 3
  isFailed = false
  bufferIndex = 1
  for k,v in pairs(noteBuffer) do
    posSetting(v, 1)
  end
  Panel_RhythmGame:SetShow(true, false)
  posSetting(_rhythmNote, 4)
  _rhythmBG:SetPosX(scrX / 2 - _rhythmBG:GetSizeX() / 2)
  _rhythmCursor:SetPosX(scrX / 2 - 12)
  _purposeMessage:SetPosX(scrX / 2 - _purposeMessage:GetSizeX() / 2)
  _MouseBody_L:SetPosX(scrX / 2 - 125)
  _MouseBody_R:SetPosX(scrX / 2 + 100)
  _LButton_L:SetPosX(scrX / 2 - 125)
  _LButton_R:SetPosX(scrX / 2 - 113)
  _RButton_L:SetPosX(scrX / 2 + 100)
  _RButton_R:SetPosX(scrX / 2 + 112)
  _nowCursorPosX = _rhythmCursor:GetPosX()
  _justCursorPosX = _rhythmCursor:GetPosX()
  _fontBad:SetPosX(scrX / 2 - _fontBad:GetSizeX() / 2)
  questCheckTime = 0
end

Panel_Minigame_Rhythm_End = function()
  -- function num : 0_6
  Panel_RhythmGame:SetShow(false, false)
end

local rhythmCursorAlign = function()
  -- function num : 0_7 , upvalues : _rhythmCursor, _rhythmBG, cursorFixedValue, cursorIndexValue, cursorIndex
  _rhythmCursor:SetPosX(_rhythmBG:GetPosX() + cursorFixedValue + cursorIndexValue * cursorIndex)
end

local Panel_Minigame_Rhythm_GaugeMove_Left = function()
  -- function num : 0_8 , upvalues : _LButton_L, cursorIndex, rhythmCursorAlign
  _LButton_L:ResetVertexAni()
  _LButton_L:SetVertexAniRun("Ani_Color_Left", true)
  cursorIndex = cursorIndex - 1
  if cursorIndex < 0 then
    cursorIndex = 0
  end
  rhythmCursorAlign()
end

local Panel_Minigame_Rhythm_GaugeMove_Right = function()
  -- function num : 0_9 , upvalues : _RButton_R, cursorIndex, rhythmCursorAlign
  _RButton_R:ResetVertexAni()
  _RButton_R:SetVertexAniRun("Ani_Color_Right", true)
  cursorIndex = cursorIndex + 1
  if cursorIndex > 4 then
    cursorIndex = 4
  end
  rhythmCursorAlign()
end

MiniGame_Rhythm_KeyPress = function(keyType)
  -- function num : 0_10 , upvalues : isFailed, MGKT, Panel_Minigame_Rhythm_GaugeMove_Left, Panel_Minigame_Rhythm_GaugeMove_Right
  if isFailed == true then
    return 
  end
  if MGKT.MiniGameKeyType_M0 == keyType then
    Panel_Minigame_Rhythm_GaugeMove_Left()
  else
    if MGKT.MiniGameKeyType_M1 == keyType then
      Panel_Minigame_Rhythm_GaugeMove_Right()
    end
  end
end

registerEvent("EventActionMiniGameKeyDownOnce", "MiniGame_Rhythm_KeyPress")
registerEvent("onScreenResize", "Rhythm_RePosition")
Panel_RhythmGame:RegisterUpdateFunc("Panel_Minigame_UpdateFunc")
Rhythm_RePosition()

