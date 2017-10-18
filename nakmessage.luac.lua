-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\nakmessage\nakmessage.luac 

-- params : ...
-- function num : 0
local MessageData = {
_Msg = {}
}
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local curIndex = 0
local processIndex = 0
local animationEndTime = 2.3
local elapsedTime = 2.3
local _text_Msg = (UI.getChildControl)(Panel_NakMessage, "MsgText")
Panel_NakMessage:setFlushAble(false)
Proc_ShowMessage_Ack = function(message, showRate)
  -- function num : 0_0
  Proc_ShowMessage_Ack_WithOut_ChattingMessage(message, showRate)
  chatting_sendMessage("", message, (CppEnums.ChatType).System, (CppEnums.ChatSystemType).Undefine)
end

Proc_ShowMessage_Ack_With_ChatType = function(message, showRate, chatType, chatSystemType)
  -- function num : 0_1
  Proc_ShowMessage_Ack_WithOut_ChattingMessage(message, showRate)
  chatting_sendMessage("", message, chatType, chatSystemType)
end

Proc_ShowBigMessage_Ack_WithOut_ChattingMessage = function(message)
  -- function num : 0_2
  local messages = message
  if type(message) ~= "table" then
    messages = {main = message, sub = PAGetString(Defines.StringSheet_GAME, "LUA_NAKMESSAGE_SELECTREWARD_MSG_SUB"), addMsg = ""}
  end
  Proc_ShowMessage_Ack_For_RewardSelect(messages, 3, 4)
end

Proc_ShowMessage_Ack_WithOut_ChattingMessage = function(message, showRate)
  -- function num : 0_3 , upvalues : animationEndTime, elapsedTime, curIndex, MessageData
  audioPostEvent_SystemUi(8, 1)
  if showRate == nil then
    animationEndTime = 2.3
    elapsedTime = 2.3
  else
    animationEndTime = showRate
    elapsedTime = showRate
  end
  curIndex = curIndex + 1
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (MessageData._Msg)[curIndex] = message
  Panel_NakMessage:SetShow(true, false)
end

local frameEventMessageIds = {"LUA_FRAMEEVENT_TOO_MANY_DETERMINATION", "LUA_FRAMEEVENT_TOO_MANY_HP", "LUA_FRAMEEVENT_TOO_LESS_MP", "LUA_FRAMEEVENT_NOT_EXIST_COMBINE_WAVE_TARGET", "LUA_FRAMEEVENT_NOT_EXIST_EQUIPITEM", "LUA_FRAMEEVENT_NOT_TAMING_1", "LUA_FRAMEEVENT_NOT_PHANTOMCOUNT", "LUA_FRAMEEVENT_NOT_CANNON_SHOT", "LUA_FRAMEEVENT_NOT_CANNON_BALL_SHOT", "LUA_FRAMEEVENT_NOT_HORES_HP_UP", "LUA_FRAMEEVENT_NOT_HORES_MP_UP", "LUA_FRAMEEVENT_NOT_HORES_SPEED_UP", "LUA_FRAMEEVENT_NOT_SORCERESS_GROGGY", "LUA_FRAMEEVENT_NOT_MANY_HOLY", "LUA_RENTALSHIP_CANNON_FAIL"; [0] = "LUA_FRAMEEVENT_TOO_LESS_HP"}
Proc_ShowMessage_FrameEvent = function(messageNum)
  -- function num : 0_4 , upvalues : frameEventMessageIds
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, frameEventMessageIds[messageNum]))
end

local MessageOpen = function()
  -- function num : 0_5 , upvalues : UI_ANI_ADV, UI_color, animationEndTime
  local axisX = Panel_NakMessage:GetSizeX() / 2
  local axisY = Panel_NakMessage:GetSizeY() / 2
  local aniInfo = Panel_NakMessage:addColorAnimation(0, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo.IsChangeChild = true
  local aniInfo1 = Panel_NakMessage:addScaleAnimation(0, 3.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartScale(0.85)
  aniInfo1:SetEndScale(1)
  aniInfo1.AxisX = axisX
  aniInfo1.AxisY = axisY
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_NakMessage:addScaleAnimation(0.15, animationEndTime - 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_PI)
  aniInfo2:SetStartScale(1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = axisX
  aniInfo2.AxisY = axisY
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
  local aniInfo3 = Panel_NakMessage:addColorAnimation(animationEndTime - 0.15, animationEndTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo3:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo3.IsChangeChild = true
  local aniInfo4 = Panel_NakMessage:addScaleAnimation(animationEndTime - 0.15, animationEndTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo4:SetStartScale(1)
  aniInfo4:SetEndScale(0.7)
  aniInfo4.AxisX = axisX
  aniInfo4.AxisY = axisY
  aniInfo4.ScaleType = 2
  aniInfo4.IsChangeChild = true
end

local tempMsg = nil
NakMessageUpdate = function(updateTime)
  -- function num : 0_6 , upvalues : elapsedTime, animationEndTime, processIndex, curIndex, MessageOpen, tempMsg, MessageData, _text_Msg
  elapsedTime = elapsedTime + updateTime
  if animationEndTime <= elapsedTime then
    if processIndex < curIndex then
      MessageOpen()
      processIndex = processIndex + 1
      Panel_NakMessage:SetShow(true, false)
      tempMsg = (MessageData._Msg)[processIndex]
      _text_Msg:SetText((MessageData._Msg)[processIndex])
      -- DECOMPILER ERROR at PC36: Confused about usage of register: R1 in 'UnsetPending'

      ;
      (MessageData._Msg)[processIndex] = nil
      elapsedTime = 0
    else
      Panel_NakMessage:SetShow(false, false)
      curIndex = 0
      processIndex = 0
    end
  else
    if processIndex < curIndex and tempMsg == (MessageData._Msg)[processIndex + 1] then
      processIndex = processIndex + 1
      -- DECOMPILER ERROR at PC68: Confused about usage of register: R1 in 'UnsetPending'

      ;
      (MessageData._Msg)[processIndex] = nil
    end
  end
end

NakMessagePanel_Reset = function()
  -- function num : 0_7 , upvalues : curIndex, processIndex, MessageData
  curIndex = 0
  processIndex = 0
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R0 in 'UnsetPending'

  MessageData._Msg = {}
end

NakMessagePanel_Resize = function()
  -- function num : 0_8
  Panel_NakMessage:SetPosX((getScreenSizeX() - Panel_NakMessage:GetSizeX()) * 0.5)
end

renderModeChange_NakMessagePostRestoreFunction = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_9 , upvalues : processIndex
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  if processIndex ~= 0 then
    Panel_NakMessage:SetShow(true, false)
  end
end

registerEvent("FromClient_RenderModeChangeState", "renderModeChange_NakMessagePostRestoreFunction")
NakMessagePanel_Resize()
Panel_NakMessage:RegisterUpdateFunc("NakMessageUpdate")
registerEvent("showMessage_ack", "Proc_ShowMessage_Ack_WithOut_ChattingMessage")
registerEvent("showBigMessage_ack", "Proc_ShowBigMessage_Ack_WithOut_ChattingMessage")
registerEvent("showMessage_FrameEvent", "Proc_ShowMessage_FrameEvent")
registerEvent("onScreenResize", "NakMessagePanel_Resize")

