-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\chatting\panel_chatting_input.luac 

-- params : ...
-- function num : 0
Panel_Chatting_Input:SetShow(false, false)
Panel_Chatting_Input:SetDragEnable(true)
Panel_Chatting_Input:SetDragAll(true)
Panel_Chatting_Input:RegisterShowEventFunc(true, "ChattingShowAni()")
Panel_Chatting_Input:RegisterShowEventFunc(false, "ChattingHideAni()")
local sentChatMsgCnt = 0
local curChatMsgCnt = 0
local lastChatHistory = ""
local sentWhisperMsgCnt = 0
local curWhisperMsgCnt = 0
local lastWhisperHistory = ""
local IM = CppEnums.EProcessorInputMode
local VCK = CppEnums.VirtualKeyCode
local UI_CT = CppEnums.ChatType
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local isLocalWar = ToClient_IsContentsGroupOpen("43")
local isArsha = ToClient_IsContentsGroupOpen("227")
local isSavageDefence = ToClient_IsContentsGroupOpen("249")
local isWolrdChat = ToClient_IsContentsGroupOpen("231")
local chatInput = {
config = {startPosX = 7, startPosY = 7, btnPosYGap = 21}
, 
control = {edit = (UI.getChildControl)(Panel_Chatting_Input, "Edit_ChatMessage"), dragButton = (UI.getChildControl)(Panel_Chatting_Input, "Button_Drag"), buttons = (Array.new)(), whisperEdit = (UI.getChildControl)(Panel_Chatting_Input, "Edit_WhisperName"), noticeShortcut = (UI.getChildControl)(Panel_Chatting_Input, "StaticText_Notice_Shortcut"), whisperNotice = (UI.getChildControl)(Panel_Chatting_Input, "StaticText_Whisper_Notice"), macroButton = (UI.getChildControl)(Panel_Chatting_Input, "RadioButton_Macro"), socialButton = (UI.getChildControl)(Panel_Chatting_Input, "RadioButton_SocialAction"), nameTypeButton = (UI.getChildControl)(Panel_Chatting_Input, "Button_ChangeNameDisplay")}
, 
buttonIds = {[0] = nil, [1] = "Button_Anounce", [2] = "Button_World", [3] = "Button_Normal", [4] = "Button_Whisper", [5] = "Button_System", [6] = "Button_Party", [7] = "Button_Guild", [12] = "Button_WorldWithItem", [15] = "Button_RolePlay", [17] = "Button_Arsha", [(CppEnums.ChatType).Team] = "Button_Team"}
, permissions = (Array.new)(), lastChatType = UI_CT.Public, isChatTypeChangedMode = false, maxEditInput = 100, linkedItemCount = 0, maxLinkedItemCount = 1, 
linkedItemData = {[0] = nil}
}
local checkFocusWhisperEdit = false
local toChangeChatType = UI_CT.Public
AllowChangeInputMode = function()
  -- function num : 0_0
  return not Panel_Chatting_Input:IsShow()
end

getCanChangeChatType = function(chatType)
  -- function num : 0_1 , upvalues : chatInput
  return (chatInput.buttonIds)[chatType]
end

getChatPermissions = function(chatType)
  -- function num : 0_2 , upvalues : chatInput
  return (chatInput.permissions)[chatType]
end

SetFocusChatting = function()
  -- function num : 0_3 , upvalues : chatInput
  SetFocusEdit((chatInput.control).edit)
  ;
  (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_ChattingInputMode)
end

FromClient_GroundMouseClickForChatting = function()
  -- function num : 0_4
  if AllowChangeInputMode() == false then
    SetFocusChatting()
    return true
  end
  return false
end

isFocusInChatting = function()
  -- function num : 0_5 , upvalues : chatInput
  local focusEdit = GetFocusEdit()
  local editControl = (chatInput.control).edit
  local whisperControl = (chatInput.control).whisperEdit
  if focusEdit == nil then
    return false
  end
  if focusEdit:GetID() == editControl:GetID() or focusEdit:GetID() == whisperControl:GetID() then
    return true
  end
  return false
end

local chatShortCutKey = {-1, VCK.KeyCode_2, VCK.KeyCode_1, VCK.KeyCode_3, -1, VCK.KeyCode_4, VCK.KeyCode_5, -1, -1, -1, -1, VCK.KeyCode_6, -1, -1, VCK.KeyCode_8, -1, VCK.KeyCode_9, VCK.KeyCode_0}
local chatShortCutKey_Value = {-1, 2, 1, 3, -1, 4, 5, -1, -1, -1, -1, 6, -1, -1, 8, -1, 9, 0}
;
((chatInput.control).dragButton):SetShow(false)
ChattingShowAni = function()
  -- function num : 0_6 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_Chatting_Input:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_IN)
  local aniInfo = Panel_Chatting_Input:addColorAnimation(0, 0.12, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo.IsChangeChild = true
  local aniInfo1 = Panel_Chatting_Input:addScaleAnimation(0, 0.12, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.1)
  aniInfo1:SetEndScale(1.25)
  aniInfo1.AxisX = Panel_Chatting_Input:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Chatting_Input:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_Chatting_Input:addScaleAnimation(0.12, 0.18, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.25)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Chatting_Input:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Chatting_Input:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

ChattingHideAni = function()
  -- function num : 0_7 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_Chatting_Input:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo3 = Panel_Chatting_Input:addColorAnimation(0, 0.1, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo3:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo3.IsChangeChild = true
  aniInfo3:SetHideAtEnd(true)
  aniInfo3:SetDisableWhileAni(true)
end

local lastMemoryChatType = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).MemoryRecentChat)
chatInput.init = function(self)
  -- function num : 0_8 , upvalues : lastMemoryChatType
  for idx,strId in pairs(self.buttonIds) do
    if strId ~= nil then
      local button = (UI.getChildControl)(Panel_Chatting_Input, strId)
      button:SetPosX((self.config).startPosX)
      button:SetPosY((self.config).startPosY)
      button:SetShow(false)
      -- DECOMPILER ERROR at PC24: Confused about usage of register: R7 in 'UnsetPending'

      ;
      ((self.control).buttons)[idx] = button
    end
  end
  if isGameTypeKorea() then
    self.maxEditInput = 100
  else
    if isGameTypeEnglish() then
      self.maxEditInput = 350
    else
      self.maxEditInput = 100
    end
  end
  if lastMemoryChatType == 0 or lastMemoryChatType == 4 or lastMemoryChatType == 14 then
    lastMemoryChatType = self.lastChatType
  else
    lastMemoryChatType = lastMemoryChatType
  end
  if lastMemoryChatType == 4 then
    ((self.control).whisperEdit):SetShow(false)
    ;
    ((self.control).whisperNotice):SetShow(false)
    ;
    ((self.control).nameTypeButton):SetShow(false)
    ;
    ((self.control).macroButton):SetPosX(((self.control).edit):GetPosX() + ((self.control).edit):GetSizeX() + 10)
    ;
    ((self.control).socialButton):SetPosX(((self.control).edit):GetPosX() + ((self.control).edit):GetSizeX() + 40)
  end
  ;
  (((self.control).buttons)[lastMemoryChatType]):SetShow(true)
  ;
  ((self.control).edit):SetMaxInput(self.maxEditInput)
  ;
  (self.permissions):resize(#self.buttonIds, false)
  ;
  ((self.control).whisperNotice):SetSize(270, 20)
  ;
  ((self.control).whisperNotice):SetText(PAGetString(Defines.StringSheet_GAME, "CHATTING_WHISPER_NOTICE"))
end

chatInput.checkLoad = function(self)
  -- function num : 0_9
  ;
  (UI.ASSERT)((self.control).edit ~= nil and ((self.control).edit).__name == "PAUIEdit", "Can\'t Find Control " .. ((self.control).edit).__name)
  ;
  (UI.ASSERT)((self.control).dragButton ~= nil and ((self.control).dragButton).__name == "PAUIButton", "Can\'t Find Control " .. ((self.control).dragButton).__name)
  for _,ctrl in pairs((self.control).buttons) do
    (UI.ASSERT)(ctrl ~= nil and ctrl.__name == "PAUIButton", "Can\'t Find Control " .. ctrl.__name)
  end
  -- DECOMPILER ERROR: 6 unprocessed JMP targets
end

chatInput.clearLinkedItem = function(self)
  -- function num : 0_10
  self.linkedItemCount = 0
  for i = 0, self.maxLinkedItemCount - 1 do
    -- DECOMPILER ERROR at PC7: Confused about usage of register: R5 in 'UnsetPending'

    (self.linkedItemData)[i] = nil
  end
  ;
  ((self.control).edit):SetCursorMove(true)
end

ChatInput_TypeButtonClicked = function(chatType)
  -- function num : 0_11 , upvalues : isWolrdChat, chatInput, checkFocusWhisperEdit, UI_CT, toChangeChatType
  if chatType == 12 and not isWolrdChat then
    return 
  end
  local self = chatInput
  local button = ((self.control).buttons)[chatType]
  if self.isChatTypeChangedMode then
    local permission = (self.permissions)[chatType]
    if permission then
      for _,btn in pairs((self.control).buttons) do
        btn:SetShow(false)
      end
      button:SetShow(true)
      button:SetPosY((self.config).startPosY)
      self.isChatTypeChangedMode = false
      SetFocusEdit((self.control).edit)
      checkFocusWhisperEdit = false
      if self.lastChatType == UI_CT.World or self.lastChatType == UI_CT.Guild or self.lastChatType == UI_CT.Public or self.lastChatType == UI_CT.Party or self.lastChatType == UI_CT.WorldWithItem then
        ((self.control).edit):SetEditText("", true)
        ToClient_ClearLinkedItemList()
        chatInput:clearLinkedItem()
      end
      ;
      (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).MemoryRecentChat, chatType)
      self.lastChatType = chatType
      toChangeChatType = chatType
      ;
      ((self.control).macroButton):SetPosX(((self.control).edit):GetPosX() + ((self.control).edit):GetSizeX() + 10)
      ;
      ((self.control).socialButton):SetPosX(((self.control).edit):GetPosX() + ((self.control).edit):GetSizeX() + 40)
      if UI_CT.Private == chatType then
        ((self.control).whisperEdit):SetShow(true)
        ;
        ((self.control).whisperNotice):SetPosX(((self.control).whisperEdit):GetPosX() - 50)
        ;
        ((self.control).whisperNotice):SetPosY(((self.control).whisperEdit):GetPosY() - 25)
        ;
        ((self.control).whisperNotice):SetShow(true)
        ;
        ((self.control).macroButton):SetPosX(((self.control).whisperEdit):GetPosX() + ((self.control).whisperEdit):GetSizeX())
        ;
        ((self.control).socialButton):SetPosX(((self.control).whisperEdit):GetPosX() + ((self.control).whisperEdit):GetSizeX() + 30)
        ;
        ((self.control).nameTypeButton):SetShow(true)
        ;
        ((self.control).nameTypeButton):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHAT_NAMETYPE_" .. ToClient_getChatNameType()))
      else
        ;
        ((self.control).whisperEdit):SetShow(false)
        ;
        ((self.control).whisperNotice):SetShow(false)
        ;
        ((self.control).nameTypeButton):SetShow(false)
        ;
        ((self.control).macroButton):SetPosX(((self.control).edit):GetPosX() + ((self.control).edit):GetSizeX() + 10)
        ;
        ((self.control).socialButton):SetPosX(((self.control).edit):GetPosX() + ((self.control).edit):GetSizeX() + 40)
      end
    end
  else
    do
      local posY = (self.config).startPosY
      for idx,btn in pairs((self.control).buttons) do
        -- DECOMPILER ERROR at PC254: Unhandled construct in 'MakeBoolean' P1

        if isWolrdChat == true and idx ~= chatType and (self.permissions)[idx] then
          posY = posY - (self.config).btnPosYGap
          btn:SetPosY(posY)
          btn:SetShow(true)
        end
        if idx ~= chatType and idx ~= 12 and (self.permissions)[idx] then
          posY = posY - (self.config).btnPosYGap
          btn:SetPosY(posY)
          btn:SetShow(true)
        end
      end
      self.isChatTypeChangedMode = true
    end
  end
end

ChatInput_ChangeChatType_Immediately = function(chatType)
  -- function num : 0_12 , upvalues : isWolrdChat, chatInput, checkFocusWhisperEdit, UI_CT
  if chatType == 12 and not isWolrdChat then
    return 
  end
  local self = chatInput
  local permission = (self.permissions)[chatType]
  local button = ((self.control).buttons)[chatType]
  if self.lastChatType ~= chatType and permission then
    for _,btn in pairs((self.control).buttons) do
      btn:SetShow(false)
    end
    button:SetShow(true)
    button:SetPosY((self.config).startPosY)
    SetFocusEdit((self.control).edit)
    checkFocusWhisperEdit = false
    if self.lastChatType == UI_CT.World or self.lastChatType == UI_CT.Guild or self.lastChatType == UI_CT.Public or self.lastChatType == UI_CT.Party or self.lastChatType == UI_CT.WorldWithItem or self.lastChatType == UI_CT.Arsha or self.lastChatType == UI_CT.Team then
      ((self.control).edit):SetEditText("", true)
      ToClient_ClearLinkedItemList()
      chatInput:clearLinkedItem()
    end
    ;
    (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).MemoryRecentChat, chatType)
    self.lastChatType = chatType
    ;
    ((self.control).macroButton):SetPosX(((self.control).edit):GetPosX() + ((self.control).edit):GetSizeX() + 10)
    ;
    ((self.control).socialButton):SetPosX(((self.control).edit):GetPosX() + ((self.control).edit):GetSizeX() + 40)
    if UI_CT.Private == chatType then
      ((self.control).whisperEdit):SetShow(true)
      ;
      ((self.control).whisperNotice):SetPosX(((self.control).whisperEdit):GetPosX() - 50)
      ;
      ((self.control).whisperNotice):SetPosY(((self.control).whisperEdit):GetPosY() - 25)
      ;
      ((self.control).whisperNotice):SetShow(true)
      ;
      ((self.control).macroButton):SetPosX(((self.control).whisperEdit):GetPosX() + ((self.control).whisperEdit):GetSizeX())
      ;
      ((self.control).socialButton):SetPosX(((self.control).whisperEdit):GetPosX() + ((self.control).whisperEdit):GetSizeX() + 30)
      ;
      ((self.control).nameTypeButton):SetShow(true)
      ;
      ((self.control).nameTypeButton):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHAT_NAMETYPE_" .. ToClient_getChatNameType()))
    else
      ;
      ((self.control).whisperEdit):SetShow(false)
      ;
      ((self.control).whisperNotice):SetShow(false)
      ;
      ((self.control).nameTypeButton):SetShow(false)
      ;
      ((self.control).macroButton):SetPosX(((self.control).edit):GetPosX() + ((self.control).edit):GetSizeX() + 10)
      ;
      ((self.control).socialButton):SetPosX(((self.control).edit):GetPosX() + ((self.control).edit):GetSizeX() + 40)
    end
  end
end

ChatInput_UpdatePermission = function()
  -- function num : 0_13 , upvalues : chatInput, UI_CT, isArsha, isLocalWar, isSavageDefence
  local self = chatInput
  local selfPlayerWrapper = getSelfPlayer()
  ;
  (self.permissions):resize(#self.buttonIds, false)
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R2 in 'UnsetPending'

  if selfPlayerWrapper ~= nil then
    (self.permissions)[UI_CT.World] = true
    -- DECOMPILER ERROR at PC18: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (self.permissions)[UI_CT.Public] = true
    -- DECOMPILER ERROR at PC22: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (self.permissions)[UI_CT.Private] = true
    -- DECOMPILER ERROR at PC30: Confused about usage of register: R2 in 'UnsetPending'

    if isGameServiceTypeDev() then
      (self.permissions)[UI_CT.WorldWithItem] = true
      -- DECOMPILER ERROR at PC34: Confused about usage of register: R2 in 'UnsetPending'

      ;
      (self.permissions)[UI_CT.RolePlay] = true
    else
      -- DECOMPILER ERROR at PC43: Confused about usage of register: R2 in 'UnsetPending'

      if isGameTypeKorea() then
        (self.permissions)[UI_CT.WorldWithItem] = true
      else
        -- DECOMPILER ERROR at PC52: Confused about usage of register: R2 in 'UnsetPending'

        if isGameTypeJapan() then
          (self.permissions)[UI_CT.WorldWithItem] = true
        else
          if isGameTypeEnglish() then
            local myLevel = ((getSelfPlayer()):get()):getLevel()
            -- DECOMPILER ERROR at PC69: Confused about usage of register: R3 in 'UnsetPending'

            if myLevel < 20 then
              (self.permissions)[UI_CT.WorldWithItem] = false
            else
              -- DECOMPILER ERROR at PC74: Confused about usage of register: R3 in 'UnsetPending'

              ;
              (self.permissions)[UI_CT.WorldWithItem] = true
            end
            -- DECOMPILER ERROR at PC78: Confused about usage of register: R3 in 'UnsetPending'

            ;
            (self.permissions)[UI_CT.RolePlay] = true
          else
            do
              if isGameTypeTaiwan() then
                local myLevel = ((getSelfPlayer()):get()):getLevel()
                -- DECOMPILER ERROR at PC95: Confused about usage of register: R3 in 'UnsetPending'

                if myLevel < 20 then
                  (self.permissions)[UI_CT.WorldWithItem] = false
                else
                  -- DECOMPILER ERROR at PC100: Confused about usage of register: R3 in 'UnsetPending'

                  ;
                  (self.permissions)[UI_CT.WorldWithItem] = true
                end
              else
                do
                  -- DECOMPILER ERROR at PC105: Confused about usage of register: R2 in 'UnsetPending'

                  ;
                  (self.permissions)[UI_CT.WorldWithItem] = false
                  -- DECOMPILER ERROR at PC115: Confused about usage of register: R2 in 'UnsetPending'

                  if (selfPlayerWrapper:get()):isGuildMember() then
                    (self.permissions)[UI_CT.Guild] = true
                  end
                  -- DECOMPILER ERROR at PC125: Confused about usage of register: R2 in 'UnsetPending'

                  if (selfPlayerWrapper:get()):hasParty() then
                    (self.permissions)[UI_CT.Party] = true
                  end
                  -- DECOMPILER ERROR at PC132: Confused about usage of register: R2 in 'UnsetPending'

                  if isArsha then
                    (self.permissions)[UI_CT.Arsha] = true
                  end
                  -- DECOMPILER ERROR at PC145: Confused about usage of register: R2 in 'UnsetPending'

                  if isLocalWar == true or isArsha == true or isSavageDefence == true then
                    (self.permissions)[UI_CT.Team] = true
                  end
                  for chatType,btn in pairs((self.control).buttons) do
                    local perm = (self.permissions)[chatType]
                    local disAllowed = not (self.permissions)[chatType]
                    btn:SetMonoTone(disAllowed)
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

chatInput.registEventHandler = function(self)
  -- function num : 0_14
  for chatType,button in pairs((self.control).buttons) do
    button:addInputEvent("Mouse_On", "ChatInput_TypeButtonOn(" .. chatType .. ")")
    button:addInputEvent("Mouse_Out", "ChatInput_TypeButtonOut(" .. chatType .. ")")
    button:addInputEvent("Mouse_LUp", "ChatInput_TypeButtonClicked(" .. chatType .. ")")
  end
  ;
  ((self.control).edit):RegistReturnKeyEvent("ChatInput_PressedEnter()")
end

ChatInput_SendMessage = function()
  -- function num : 0_15 , upvalues : chatInput
  local self = chatInput
  local memoryChatType = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).MemoryRecentChat)
  if memoryChatType == 0 or memoryChatType == 4 then
    memoryChatType = self.lastChatType
  end
  if (self.permissions)[memoryChatType] then
    local target = ((self.control).whisperEdit):GetEditText()
    local message = ((self.control).edit):GetEditText()
    chatting_sendMessage(target, message, memoryChatType)
    chatting_saveMessageHistory(target, message)
  end
  do
    ;
    ((self.control).edit):SetEditText("", true)
  end
end

ChatInput_CancelMessage = function()
  -- function num : 0_16 , upvalues : chatInput, curChatMsgCnt, sentChatMsgCnt
  local self = chatInput
  curChatMsgCnt = sentChatMsgCnt
  ;
  ((self.control).edit):SetEditText("", true)
end

ChatInput_PressedEnter = function()
  -- function num : 0_17 , upvalues : IM
  if Panel_Chatting_Input:IsShow() then
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    ChatInput_CancelAction()
    ChatInput_SendMessage()
    ChatInput_Close()
    ClearFocusEdit()
  end
end

ChatInput_PressedUp = function()
  -- function num : 0_18 , upvalues : checkFocusWhisperEdit, curWhisperMsgCnt, chatInput, curChatMsgCnt
  if checkFocusWhisperEdit then
    curWhisperMsgCnt = curWhisperMsgCnt - 1
    if curWhisperMsgCnt < 0 then
      curWhisperMsgCnt = chatting_getTargetHistoryCount() - 1
    end
    local whisperHistory = chatting_getTargetHistoryByIndex(curWhisperMsgCnt)
    if whisperHistory ~= nil then
      ((chatInput.control).whisperEdit):SetEditText(whisperHistory, true)
    end
  else
    do
      curChatMsgCnt = curChatMsgCnt - 1
      if curChatMsgCnt < 0 then
        curChatMsgCnt = chatting_getMessageHistoryCount() - 1
      end
      local messageHistory = chatting_getMessageHistoryByIndex(curChatMsgCnt)
      if messageHistory ~= nil then
        ((chatInput.control).edit):SetEditText(messageHistory, true)
      end
    end
  end
end

ChatInput_TypeButtonOn = function(chatType)
  -- function num : 0_19 , upvalues : isWolrdChat, chatInput, chatShortCutKey_Value
  if chatType == 12 and not isWolrdChat then
    return 
  end
  local self = chatInput
  local button = ((self.control).buttons)[chatType]
  ;
  ((self.control).noticeShortcut):SetColor((Defines.Color).C_FF000000)
  ;
  ((self.control).noticeShortcut):SetPosX(button:GetPosX() - ((self.control).noticeShortcut):GetSizeX())
  ;
  ((self.control).noticeShortcut):SetPosY(button:GetPosY() - 10)
  ;
  ((self.control).noticeShortcut):SetText("(ALT + " .. tostring(chatShortCutKey_Value[chatType]) .. ")")
  ;
  ((self.control).noticeShortcut):SetShow(true)
end

ChatInput_TypeButtonOut = function(chatType)
  -- function num : 0_20 , upvalues : chatInput
  local self = chatInput
  ;
  ((self.control).noticeShortcut):SetShow(false)
end

ChatInput_CheckReservedKey = function()
  -- function num : 0_21 , upvalues : chatInput, chatShortCutKey, toChangeChatType, VCK
  local self = chatInput
  local chatMessage = ((self.control).edit):GetEditText()
  local chatMessageLength = (string.len)(chatMessage)
  for chatType,KeyCode in pairs(chatShortCutKey) do
    if KeyCode ~= -1 and isKeyDown_Once(KeyCode) then
      toChangeChatType = chatType
    end
  end
  if self.isChatTypeChangedMode then
    ChatInput_TypeButtonClicked(toChangeChatType)
  else
    if isKeyPressed(VCK.KeyCode_MENU) and (isKeyDown_Once(VCK.KeyCode_0) or isKeyDown_Once(VCK.KeyCode_1) or isKeyDown_Once(VCK.KeyCode_2) or isKeyDown_Once(VCK.KeyCode_3) or isKeyDown_Once(VCK.KeyCode_4) or isKeyDown_Once(VCK.KeyCode_5) or isKeyDown_Once(VCK.KeyCode_6) or isKeyDown_Once(VCK.KeyCode_7) or isKeyDown_Once(VCK.KeyCode_8) or isKeyDown_Once(VCK.KeyCode_9)) then
      ChatInput_ChangeChatType_Immediately(toChangeChatType)
    end
  end
end

local lastWhispersId = ""
local lastWhispersTick = 0
local lastPartyTick = 0
local lastGuildTick = 0
ChatInput_SetLastWhispersUserId = function(WhispersId)
  -- function num : 0_22 , upvalues : lastWhispersId
  lastWhispersId = WhispersId
end

ChatInput_SetLastWhispersTick = function()
  -- function num : 0_23 , upvalues : lastWhispersTick
  lastWhispersTick = getTickCount32()
end

ChatInput_GetLastWhispersUserId = function()
  -- function num : 0_24 , upvalues : lastWhispersId
  return lastWhispersId
end

ChatInput_GetLastWhispersTick = function()
  -- function num : 0_25 , upvalues : lastWhispersTick
  return lastWhispersTick
end

ChatInput_SetLastPartyTick = function()
  -- function num : 0_26 , upvalues : lastPartyTick
  lastPartyTick = getTickCount32()
end

ChatInput_GetLastPartyTick = function()
  -- function num : 0_27 , upvalues : lastPartyTick
  return lastPartyTick
end

ChatInput_SetLastGuildTick = function()
  -- function num : 0_28 , upvalues : lastGuildTick
  lastGuildTick = getTickCount32()
end

ChatInput_GetLastGuildTick = function()
  -- function num : 0_29 , upvalues : lastGuildTick
  return lastGuildTick
end

ChatInput_IsInstantCommand_Whisper = function(str)
  -- function num : 0_30
  do return str == "/w" or str == "/ã…\136" or str == "/whisper" or str == "/ê·“ì†ë§\144" or str == "/ê·\147" end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

ChatInput_IsInstantCommand_Reply = function(str)
  -- function num : 0_31
  do return str == "/r" or str == "/ã„\177" or str == "/reply" or str == "/ëŒ\128ë‹\181" or str == "/ëŒ\128" end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

ChatInput_IsInstantCommand_Normal = function(str)
  -- function num : 0_32
  do return str == "/s" or str == "/ã„\180" or str == "/ì¼ë°˜" or str == "/ì\188" end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

ChatInput_IsInstantCommand_World = function(str)
  -- function num : 0_33
  do return str == "/y" or str == "/ã…\155" or str == "/yell" or str == "/ì™¸ì¹¨" or str == "/ì™\184" end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

ChatInput_IsInstantCommand_Party = function(str)
  -- function num : 0_34
  do return str == "/p" or str == "/ã…\148" or str == "/party" or str == "/íŒŒí‹°" or str == "/íŒ\140" end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

ChatInput_IsInstantCommand_Guild = function(str)
  -- function num : 0_35
  do return str == "/g" or str == "/ã…\142" or str == "/guild" or str == "/ê¸¸ë“œ" or str == "/ê¸\184" end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

ChatInput_IsInstantCommand_WithItem = function(str)
  -- function num : 0_36
  do return str == "/a" or str == "/ã…\129" or str == "/all" or str == "/ì „ì²´" or str == "/ì \132" end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

ChatInput_IsInstantCommand_Arsha = function(str)
  -- function num : 0_37
  do return str == "/c" or str == "/ã…\138" or str == "/arsha" or str == "/ì•„ë¥´ìƒ\164" end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

ChatInput_IsInstantCommand_Team = function(str)
  -- function num : 0_38
  do return str == "/t" or str == "/ã…\133" or str == "/team" or str == "/íŒ\128" end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

moveChatInput = function(moveTo)
  -- function num : 0_39
  local isChanged = false
  local tempValue = 0
  local memoryChatType = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).MemoryRecentChat)
  local addValue = 1
  if moveTo == false then
    addValue = -1
  end
  local toChatType = memoryChatType + addValue
  while isChanged == false and tempValue < 50 do
    if moveTo == true and (CppEnums.ChatType).Count <= toChatType then
      toChatType = (CppEnums.ChatType).World
    else
      if moveTo == false and toChatType <= 0 then
        toChatType = (CppEnums.ChatType).Count - 1
      end
    end
    ChatInput_ChangeChatType_Immediately(toChatType)
    local isButtonValid = getCanChangeChatType(toChatType)
    local isPermission = getChatPermissions(toChatType)
    if isPermission == false or isButtonValid == nil or isButtonValid == "" or toChatType == (CppEnums.ChatType).System or toChatType == (CppEnums.ChatType).Notice then
      isChanged = false
      toChatType = toChatType + addValue
    else
      isChanged = true
    end
    tempValue = tempValue + 1
  end
  do
    audioPostEvent_SystemUi(1, 17)
  end
end

ChatInput_CheckInstantCommand = function()
  -- function num : 0_40 , upvalues : chatInput, toChangeChatType, UI_CT, checkFocusWhisperEdit, lastWhispersId
  local self = chatInput
  local chatMessage = ((self.control).edit):GetEditText()
  local chatMessageLength = (string.len)(chatMessage)
  chatMessage = (string.lower)((string.sub)(chatMessage, 1, chatMessageLength - 1))
  local isWhisper = ChatInput_IsInstantCommand_Whisper(chatMessage)
  local isReply = ChatInput_IsInstantCommand_Reply(chatMessage)
  local isProcess = false
  if ChatInput_IsInstantCommand_Normal(chatMessage) then
    toChangeChatType = (CppEnums.ChatType).Public
    ;
    (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).MemoryRecentChat, (CppEnums.ChatType).Public)
    isProcess = true
  else
    if ChatInput_IsInstantCommand_World(chatMessage) then
      toChangeChatType = (CppEnums.ChatType).World
      ;
      (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).MemoryRecentChat, (CppEnums.ChatType).World)
      isProcess = true
    else
      if ChatInput_IsInstantCommand_Party(chatMessage) then
        toChangeChatType = (CppEnums.ChatType).Party
        ;
        (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).MemoryRecentChat, (CppEnums.ChatType).Party)
        isProcess = true
      else
        if ChatInput_IsInstantCommand_Guild(chatMessage) then
          toChangeChatType = (CppEnums.ChatType).Guild
          ;
          (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).MemoryRecentChat, (CppEnums.ChatType).Guild)
          isProcess = true
        else
          if ChatInput_IsInstantCommand_WithItem(chatMessage) then
            toChangeChatType = (CppEnums.ChatType).WorldWithItem
            ;
            (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).MemoryRecentChat, (CppEnums.ChatType).WorldWithItem)
            isProcess = true
          else
            if ChatInput_IsInstantCommand_Arsha(chatMessage) then
              toChangeChatType = (CppEnums.ChatType).Arsha
              ;
              (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).MemoryRecentChat, (CppEnums.ChatType).Arsha)
              isProcess = true
            else
              if ChatInput_IsInstantCommand_Team(chatMessage) then
                toChangeChatType = (CppEnums.ChatType).Team
                ;
                (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).MemoryRecentChat, (CppEnums.ChatType).Team)
                isProcess = true
              else
                if isWhisper or isReply then
                  toChangeChatType = (CppEnums.ChatType).Private
                  ;
                  (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).MemoryRecentChat, (CppEnums.ChatType).Private)
                  isProcess = true
                else
                  if UI_CT.Private == self.lastChatType and checkFocusWhisperEdit then
                    SetFocusEdit((self.control).edit)
                    checkFocusWhisperEdit = false
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  if isProcess then
    if self.isChatTypeChangedMode then
      ChatInput_TypeButtonClicked(toChangeChatType)
    else
      ChatInput_ChangeChatType_Immediately(toChangeChatType)
    end
    ;
    ((self.control).edit):SetEditText("", true)
    if isWhisper or isReply then
      if lastWhispersId == "" then
        isReply = false
        isWhisper = true
      end
      if isWhisper then
        ((self.control).whisperEdit):SetEditText("", true)
        SetFocusEdit((self.control).whisperEdit)
        checkFocusWhisperEdit = true
      else
        if isReply then
          ((self.control).whisperEdit):SetEditText(lastWhispersId, true)
          SetFocusEdit((self.control).edit)
          checkFocusWhisperEdit = false
        end
      end
    end
  end
end

FGlobal_ChatInput_CheckReply = function()
  -- function num : 0_41 , upvalues : lastWhispersId
  if lastWhispersId == "" then
    return false
  end
  return true
end

FGlobal_ChatInput_Reply = function(isReply)
  -- function num : 0_42 , upvalues : chatInput, lastWhispersId, checkFocusWhisperEdit
  local self = chatInput
  if isReply then
    ((self.control).whisperEdit):SetEditText(lastWhispersId, true)
    SetFocusEdit((self.control).edit)
    checkFocusWhisperEdit = false
  end
end

ChatInput_Show = function()
  -- function num : 0_43 , upvalues : chatInput, UI_CT, curChatMsgCnt, curWhisperMsgCnt
  if Panel_Chatting_Input:IsShow() then
    return 
  end
  local self = chatInput
  SetFocusEdit((chatInput.control).edit)
  local isLastChatType = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).MemoryRecentChat)
  if isLastChatType ~= 0 and isLastChatType ~= 4 then
    self.lastChatType = isLastChatType
  end
  Panel_Chatting_Input:SetShow(true, true)
  ;
  ((self.control).macroButton):SetPosX(((self.control).edit):GetPosX() + ((self.control).edit):GetSizeX() + 10)
  ;
  ((self.control).socialButton):SetPosX(((self.control).edit):GetPosX() + ((self.control).edit):GetSizeX() + 40)
  if UI_CT.Private == self.lastChatType then
    ((self.control).macroButton):SetPosX(((self.control).whisperEdit):GetPosX() + ((self.control).whisperEdit):GetSizeX())
    ;
    ((self.control).socialButton):SetPosX(((self.control).whisperEdit):GetPosX() + ((self.control).whisperEdit):GetSizeX() + 30)
    ;
    ((self.control).nameTypeButton):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHAT_NAMETYPE_" .. ToClient_getChatNameType()))
  else
    ;
    ((self.control).macroButton):SetPosX(((self.control).edit):GetPosX() + ((self.control).edit):GetSizeX() + 10)
    ;
    ((self.control).socialButton):SetPosX(((self.control).edit):GetPosX() + ((self.control).edit):GetSizeX() + 40)
  end
  ;
  ((self.control).macroButton):SetCheck(false)
  if Panel_Chat_SocialMenu:GetShow() then
    ((self.control).socialButton):SetCheck(true)
  else
    ;
    ((self.control).socialButton):SetCheck(false)
  end
  if chatting_isBlocked() then
    local blockString = convertStringFromDatetime(chatting_blockedEndDatetime())
    local blockReason = tostring(chatting_blockedReasonMemo())
    local tempString = PAGetStringParam2(Defines.StringSheet_GAME, "CHATTING_BLOCK_TIME_REASON", "time", blockString, "reason", blockReason)
    ;
    ((self.control).edit):SetText("<PAColor0xFF888888>" .. tempString)
  end
  do
    chatting_startAction()
    curChatMsgCnt = chatting_getMessageHistoryCount()
    curWhisperMsgCnt = chatting_getTargetHistoryCount()
  end
end

ChatInput_CancelAction = function()
  -- function num : 0_44 , upvalues : chatInput
  local self = chatInput
  local message = ((self.control).edit):GetEditText()
  if message == "" then
    chatting_cancelAction()
  end
end

ChatInput_Close = function()
  -- function num : 0_45 , upvalues : chatInput
  ClearFocusEdit()
  ToClient_ClearLinkedItemList()
  chatInput:clearLinkedItem()
  if Panel_Chatting_Input:IsShow() then
    Panel_Chatting_Input:SetShow(false, true)
    Panel_Chatting_Macro:SetShow(false)
  end
end

ChatInput_CheckCurrentUiEdit = function(targetUI)
  -- function num : 0_46 , upvalues : chatInput
  do return targetUI ~= nil and targetUI:GetKey() == ((chatInput.control).edit):GetKey() or targetUI:GetKey() == ((chatInput.control).whisperEdit):GetKey() end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

ChatInput_ChangeInputFocus = function()
  -- function num : 0_47 , upvalues : chatInput, UI_CT, checkFocusWhisperEdit
  local self = chatInput
  if UI_CT.Private == self.lastChatType then
    if not checkFocusWhisperEdit then
      SetFocusEdit((self.control).whisperEdit)
      checkFocusWhisperEdit = true
    else
      SetFocusEdit((self.control).edit)
      checkFocusWhisperEdit = false
    end
  end
end

HandleClicked_ToggleChatMacro = function(number)
  -- function num : 0_48
  if number == 0 then
    FGlobal_Chatting_Macro_ShowToggle()
  else
    FGlobal_SocialAction_ShowToggle()
  end
end

HandleClicked_clickNameType = function()
  -- function num : 0_49 , upvalues : chatInput
  local self = chatInput
  local preNameType = ToClient_getChatNameType()
  if preNameType == 1 then
    ((self.control).nameTypeButton):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHAT_NAMETYPE_0"))
    ToClient_setChatNameType(0)
  else
    if preNameType == 0 then
      ((self.control).nameTypeButton):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHAT_NAMETYPE_1"))
      ToClient_setChatNameType(1)
    end
  end
end

FGlobal_Chatting_Macro_SetCHK = function(show)
  -- function num : 0_50 , upvalues : chatInput
  if show == true then
    ((chatInput.control).macroButton):SetCheck(true)
  else
    ;
    ((chatInput.control).macroButton):SetCheck(false)
  end
end

FGlobal_SocialAction_SetCHK = function(show)
  -- function num : 0_51 , upvalues : chatInput
  if show == true then
    ((chatInput.control).socialButton):SetCheck(true)
  else
    ;
    ((chatInput.control).socialButton):SetCheck(false)
  end
end

isChatInputLinkedItem = function(itemWrapper)
  -- function num : 0_52 , upvalues : chatInput
  if itemWrapper == nil then
    return 
  end
  local itemSSW = itemWrapper:getStaticStatus()
  local itemName = itemSSW:getName()
  local linkedItemPos = {startPos = 0, endPos = 0}
  local oldStr = ((chatInput.control).edit):GetEditText()
  linkedItemPos.startPos = chatting_linkedItemRealPos(oldStr)
  local newStr = oldStr .. "[" .. itemName .. "]"
  linkedItemPos.endPos = chatting_linkedItemRealPos(newStr)
  ReleaseImeComposition()
  ;
  ((chatInput.control).edit):SetEditText(newStr, true)
  -- DECOMPILER ERROR at PC50: Confused about usage of register: R6 in 'UnsetPending'

  if ((chatInput.control).edit):GetEditTextSize() <= chatInput.maxEditInput then
    (chatInput.linkedItemData)[chatInput.linkedItemCount] = linkedItemPos
    return true
  else
    ;
    ((chatInput.control).edit):SetEditText(oldStr, true)
    return false
  end
end

FGlobal_ChattingInput_LinkedItemByInventory = function(slotNo, inventoryType)
  -- function num : 0_53 , upvalues : UI_CT, chatInput
  if UI_CT.World ~= chatInput.lastChatType and UI_CT.Guild ~= chatInput.lastChatType and UI_CT.Public ~= chatInput.lastChatType and UI_CT.Party ~= chatInput.lastChatType and UI_CT.WorldWithItem ~= chatInput.lastChatType and UI_CT.Private ~= chatInput.lastChatType then
    return 
  end
  if chatInput.maxLinkedItemCount <= chatInput.linkedItemCount then
    return 
  end
  -- DECOMPILER ERROR at PC48: Confused about usage of register: R2 in 'UnsetPending'

  chatInput.linkedItemCount = chatInput.linkedItemCount + 1
  local selfProxy = (getSelfPlayer()):get()
  local inventory = selfProxy:getInventory()
  local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  if isChatInputLinkedItem(itemWrapper) then
    ((chatInput.control).edit):SetCursorMove(false)
    ;
    ((chatInput.control).edit):SetCursorPosIndex(0)
    ToClient_SetLinkedItemByInventory(inventoryType, slotNo, ((chatInput.linkedItemData)[chatInput.linkedItemCount]).startPos, ((chatInput.linkedItemData)[chatInput.linkedItemCount]).endPos)
  end
  _PA_LOG("COMPE_CHAT", "FGlobal_ChattingInput_LinkedItemByInventory" .. tostring(inventoryType) .. tostring(slotNo))
end

FGlobal_ChattingInput_ShowWhisper = function(characterName)
  -- function num : 0_54 , upvalues : chatInput
  ChatInput_Show()
  ChatInput_ChangeChatType_Immediately(4)
  ;
  ((chatInput.control).whisperEdit):SetEditText(characterName, true)
  ;
  ((chatInput.control).nameTypeButton):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHAT_NAMETYPE_" .. ToClient_getChatNameType()))
  ;
  (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_ChattingInputMode)
end

ChatInput_CheckRemoveLinkedItem = function()
  -- function num : 0_55 , upvalues : UI_CT, chatInput
  if UI_CT.World ~= chatInput.lastChatType and UI_CT.Guild ~= chatInput.lastChatType and UI_CT.Public ~= chatInput.lastChatType and UI_CT.Party ~= chatInput.lastChatType and UI_CT.WorldWithItem ~= chatInput.lastChatType and UI_CT.Private ~= chatInput.lastChatType then
    return 
  end
  if chatInput.linkedItemCount <= 0 then
    return 
  end
  local str = ((chatInput.control).edit):GetEditText()
  local editStrLen = (string.len)(str)
  if editStrLen < ((chatInput.linkedItemData)[chatInput.linkedItemCount]).endPos then
    if ((chatInput.linkedItemData)[chatInput.linkedItemCount]).startPos == 0 then
      ((chatInput.control).edit):SetEditText("", true)
    else
      ;
      ((chatInput.control).edit):SetEditText((string.sub)(str, 1, ((chatInput.linkedItemData)[chatInput.linkedItemCount]).startPos), true)
    end
    ToClient_ClearLinkedItemList()
    chatInput:clearLinkedItem()
  end
end

ChatInput_Resize = function()
  -- function num : 0_56
  Panel_Chatting_Input:SetSize(352, 30)
  Panel_Chatting_Input:ComputePos()
end

chatInput:init()
chatInput:checkLoad()
chatInput:registEventHandler()
;
((chatInput.control).macroButton):addInputEvent("Mouse_LUp", "HandleClicked_ToggleChatMacro(0)")
;
((chatInput.control).socialButton):addInputEvent("Mouse_LUp", "HandleClicked_ToggleChatMacro(1)")
;
((chatInput.control).nameTypeButton):addInputEvent("Mouse_LUp", "HandleClicked_clickNameType()")
;
((chatInput.control).whisperEdit):addInputEvent("Mouse_LUp", "HandleClicked_ChatInputEdit()")
;
((chatInput.control).edit):addInputEvent("Mouse_LUp", "HandleClicked_ChatInputEdit()")
HandleClicked_ChatInputEdit = function()
  -- function num : 0_57 , upvalues : IM
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
end

registerEvent("EventChatPermissionChanged", "ChatInput_UpdatePermission")
registerEvent("EventChatInputClose", "ChatInput_Close")
registerEvent("onScreenResize", "ChatInput_Resize")
registerEvent("FromClient_GroundMouseClick", "FromClient_GroundMouseClickForChatting")

