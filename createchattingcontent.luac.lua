-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\chatting\createchattingcontent.luac 

-- params : ...
-- function num : 0
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UI_CT = CppEnums.ChatType
local UI_CNT = CppEnums.EChatNoticeType
local UI_Group = Defines.UIGroup
local IM = CppEnums.EProcessorInputMode
local UI_CST = CppEnums.ChatSystemType
Chatnew_CreateChattingContent = function(chattingMessage, poolCurrentUI, PosY, messageIndex, panelIndex, deltascrollPosy, cacheSimpleUI, chattingUpTime)
  -- function num : 0_0 , upvalues : UI_CT, UI_CST, UI_color, UI_TM
  local panelSizeX = ((poolCurrentUI._list_PanelBG)[0]):GetSizeX() - 20
  local panelSizeY = ((poolCurrentUI._list_PanelBG)[0]):GetSizeY()
  local nameType = chattingMessage.chatNameType
  local sender = chattingMessage:getSender(ToClient_getChatNameType())
  local chatType = chattingMessage.chatType
  local noticeType = chattingMessage.noticeType
  local isMe = chattingMessage.isMe
  local isGameManager = chattingMessage.isGameManager
  local msgColor = (Chatting_MessageColor(chatType, noticeType, panelIndex))
  local msg, msgData = nil, nil
  local isLinkedItem = chattingMessage:isLinkedItem()
  local isLinkedWbSite = chattingMessage:isLinkedWebsite()
  local chatting_Icon = poolCurrentUI:newChattingIcon()
  local chatting_sender = poolCurrentUI:newChattingSender(messageIndex)
  local isDev = ToClient_IsDevelopment()
  local chatting_contents = {}
  local chatSystemType = chattingMessage.chatSystemType
  local isChatDivision = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListBool((CppEnums.GlobalUIOptionType).ChatDivision)
  local emoticonCount = chattingMessage:getEmoticonCount()
  if isGameManager == true and not isDev then
    msgColor = 4282515258
  end
  local deltaPosY = -chatting_sender:GetSizeY() * deltascrollPosy
  if chattingUpTime ~= 0 then
    deltaPosY = -chatting_sender:GetSizeY() + chatting_sender:GetSizeY() * chattingUpTime * 5
  end
  chatting_Icon:SetShow(true)
  if chatType == (CppEnums.ChatType).Private and chattingMessage.isMe == false then
    ChatInput_SetLastWhispersUserId(sender)
    if Int64toInt32(getUtc64() - chattingMessage._time_s64) < 1 then
      local isSoundAlert = true
      if ChatInput_GetLastWhispersUserId() == sender then
        if getTickCount32() - ChatInput_GetLastWhispersTick() > 1000 then
          ChatInput_SetLastWhispersTick()
        else
          isSoundAlert = false
        end
      else
        ChatInput_SetLastWhispersTick()
      end
      if isSoundAlert and isPhotoMode() then
        audioPostEvent_SystemUi(8, 14)
      else
      end
    end
  end
  do
    if (isSoundAlert and isFocusInChatting()) or UI_CT.System == chatType then
      sender = PAGetString(Defines.StringSheet_GAME, "CHATTING_TAB_SYSTEM")
    else
      if UI_CT.Notice == chatType then
        sender = PAGetString(Defines.StringSheet_GAME, "CHATTING_NOTICE")
        chatType = UI_CT.System
      else
        if UI_CT.Battle == chatType then
          sender = PAGetString(Defines.StringSheet_GAME, "CHATTING_BATTLE")
        end
      end
    end
    local senderStr = "[" .. sender .. "] : "
    if UI_CT.Private == chatType then
      if not isMe then
        senderStr = "â—\128 " .. senderStr
      else
        if nameType == 0 then
          senderStr = PAGetString(Defines.StringSheet_GAME, "LUA_CHAT_NAMETYPE_0") .. senderStr
        else
          if nameType == 1 then
            senderStr = PAGetString(Defines.StringSheet_GAME, "LUA_CHAT_NAMETYPE_1") .. senderStr
          end
        end
      end
    end
    if FGlobal_ChatOption_GetIsShowTimeString(panelIndex) == true or UI_CT.Private == chatType or UI_CT.System == chatType and UI_CST.Market == chatSystemType then
      msg = chattingMessage:getContent() .. " (" .. chattingMessage:getTimeString() .. ")"
    else
      msg = chattingMessage:getContent()
    end
    chatting_Icon:SetText("")
    chatting_Icon:SetAutoResize(true)
    UiPrivateChatType(chatType, chatting_Icon, msgColor, isChatDivision, sender, senderStr)
    chatting_Icon:SetSize(chatting_Icon:GetTextSizeX(), chatting_Icon:GetTextSizeY())
    if emoticonCount == 0 then
      if (isLinkedItem or isLinkedWbSite) and (UI_CT.World == chatType or UI_CT.Guild == chatType or UI_CT.System == chatType or UI_CT.Public == chatType or UI_CT.Party == chatType or UI_CT.WorldWithItem == chatType or UI_CT.Private == chatType) then
        local fontType = getPanelChatFontSizeType(panelIndex)
        chatting_Icon:SetPosX(10)
        chatting_sender:SetTextHorizonRight()
        chatting_sender:SetText(senderStr)
        chatting_sender:SetFontColor(msgColor)
        chatting_sender:SetSize(chatting_sender:GetTextSizeX(), chatting_sender:GetTextSizeY())
        chatting_sender:SetShow(true)
        local chat_contentAddPosX = 0
        if chatting_Icon:GetTextSizeX() ~= 0 then
          chat_contentAddPosX = 15
          chatting_sender:SetPosX(chatting_Icon:GetTextSizeX() + chat_contentAddPosX)
        else
          chat_contentAddPosX = 10
          chatting_sender:SetPosX(chat_contentAddPosX)
        end
        if isMe == false then
          chatting_sender:SetIgnore(false)
        else
          chatting_sender:SetIgnore(true)
        end
        if UI_CT.Public == chatType then
          chatting_sender:SetOverFontColor(UI_color.C_FFC4BEBE)
        else
          chatting_sender:SetOverFontColor(UI_color.C_FFFFFFFF)
        end
        local linkedMsgSplit = {}
        local linkedMsgCount = 0
        local linkedIndex = 0
        local startIndex = chattingMessage:getLinkedItemStartIndex()
        local endIndex = chattingMessage:getLinkedItemEndIndex()
        if isLinkedItem then
          startIndex = chattingMessage:getLinkedItemStartIndex()
          endIndex = chattingMessage:getLinkedItemEndIndex()
        else
          if isLinkedWbSite then
            startIndex = chattingMessage:getLinkedWebsiteStartIndex()
            endIndex = chattingMessage:getLinkedWebsiteEndIndex()
          end
        end
        if startIndex > 0 then
          linkedMsgSplit[0] = (string.sub)(msg, 1, startIndex)
          linkedMsgSplit[1] = (string.sub)(msg, startIndex + 1, endIndex)
          linkedMsgCount = 2
          linkedIndex = 1
          if endIndex < (string.len)(msg) then
            linkedMsgSplit[2] = (string.sub)(msg, endIndex + 1, (string.len)(msg))
            linkedMsgCount = 3
          end
        else
          linkedMsgSplit[0] = (string.sub)(msg, 1, endIndex)
          linkedMsgCount = 1
          linkedIndex = 0
          if endIndex < (string.len)(msg) then
            linkedMsgSplit[1] = (string.sub)(msg, endIndex + 1, (string.len)(msg))
            linkedMsgCount = 2
          end
        end
        chatting_contents[0] = chatting_sender
        local currentStaticIndex = 1
        for index = 0, linkedMsgCount - 1 do
          msgData = linkedMsgSplit[index]
          local msgDataLen = (string.len)(msgData)
          while 1 do
            if msgDataLen > 0 then
              if index == linkedIndex then
                if isLinkedItem then
                  chatting_contents[currentStaticIndex] = poolCurrentUI:newChattingLinkedItem(messageIndex)
                  ;
                  (chatting_contents[currentStaticIndex]):SetFontColor(UI_color.C_FFFFCF4C)
                else
                  if isLinkedWbSite then
                    chatting_contents[currentStaticIndex] = poolCurrentUI:newChattingLinkedWebSite(messageIndex)
                    ;
                    (chatting_contents[currentStaticIndex]):SetFontColor((Defines.Color).C_FF00C0D7)
                  end
                end
                ;
                (chatting_contents[currentStaticIndex]):SetIgnore(false)
              else
                chatting_contents[currentStaticIndex] = poolCurrentUI:newChattingContents()
                ;
                (chatting_contents[currentStaticIndex]):SetIgnore(true)
                ;
                (chatting_contents[currentStaticIndex]):SetFontColor(msgColor)
              end
              local textStaticSizeX = panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX()
              local textStaticPosX = chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
              local j = 1
              local isWhile = false
              while 1 do
                if currentStaticIndex >= 2 and (chatting_contents[currentStaticIndex - j]):GetSizeX() < panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX() then
                  isWhile = true
                  textStaticSizeX = textStaticSizeX - (chatting_contents[currentStaticIndex - j]):GetSizeX()
                  textStaticPosX = textStaticPosX + (chatting_contents[currentStaticIndex - j]):GetSizeX()
                end
                if chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX == (chatting_contents[currentStaticIndex - j]):GetPosX() then
                  break
                end
                j = j + 1
              end
              if textStaticSizeX == 0 or isWhile == false then
                textStaticSizeX = panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX()
                textStaticPosX = chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
              end
              ;
              (chatting_contents[currentStaticIndex]):SetSize(textStaticSizeX, chatting_sender:GetSizeY())
              ;
              (chatting_contents[currentStaticIndex]):SetPosX(textStaticPosX)
              msg = (chatting_contents[currentStaticIndex]):GetTextLimitWidth(msgData)
              if isChangeFontSize() then
                (chatting_contents[currentStaticIndex]):setChangeFontAfterTransSizeValue(true)
              end
              ;
              (chatting_contents[currentStaticIndex]):SetText(msg)
              if (string.len)(msg) < (string.len)(msgData) then
                local msgStr = (string.sub)(msgData, (string.len)(msg) + 1, (string.len)(msgData))
                msgData = msgStr
                msgDataLen = (string.len)(msgData)
              else
                do
                  do
                    msgDataLen = 0
                    currentStaticIndex = currentStaticIndex + 1
                    -- DECOMPILER ERROR at PC604: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC604: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC604: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC604: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC604: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
            end
          end
          ;
          (chatting_contents[currentStaticIndex - 1]):SetSize((chatting_contents[currentStaticIndex - 1]):GetTextSizeX(), chatting_sender:GetSizeY())
        end
        for index = currentStaticIndex - 1, 1, -1 do
          (chatting_contents[index]):SetPosY(PosY - (chatting_contents[index]):GetSizeY() - (deltaPosY))
          ;
          (chatting_contents[index]):SetShow(true)
          if chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX == (chatting_contents[index]):GetPosX() then
            PosY = PosY - (chatting_contents[index]):GetSizeY()
            if index ~= 1 then
              (chatting_contents[index]):SetPosX(chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX)
            end
          end
        end
        chatting_Icon:SetPosY(PosY - (deltaPosY))
        ;
        (chatting_contents[0]):SetPosY(PosY - (deltaPosY))
        PosY = PosY - 3
      else
        do
          chatting_Icon:SetPosX(10)
          chatting_sender:SetTextHorizonRight()
          chatting_sender:SetAutoResize(true)
          chatting_sender:SetFontColor(msgColor)
          chatting_sender:SetText(senderStr)
          chatting_sender:SetSize(chatting_sender:GetTextSizeX(), chatting_sender:GetTextSizeY())
          chatting_sender:SetShow(true)
          local chat_contentPosX = 0
          if chatting_Icon:GetTextSizeX() ~= 0 then
            chat_contentPosX = 15
            chatting_sender:SetPosX(chatting_Icon:GetTextSizeX() + chat_contentPosX)
          else
            chat_contentPosX = 10
            chatting_sender:SetPosX(chat_contentPosX)
          end
          chatting_Icon:SetPosY()
          do
            local remainSizeX = panelSizeX - chatting_sender:GetTextSizeX() - chatting_Icon:GetTextSizeX()
            chatting_contents[0] = poolCurrentUI:newChattingContents()
            ;
            (chatting_contents[0]):SetSize(remainSizeX, chatting_sender:GetSizeY())
            ;
            (chatting_contents[0]):SetTextMode(UI_TM.eTextMode_AutoWrap)
            ;
            (chatting_contents[0]):SetAutoResize(true)
            ;
            (chatting_contents[0]):SetText(msg)
            ;
            (chatting_contents[0]):SetShow(true)
            ;
            (chatting_contents[0]):SetFontColor(msgColor)
            chatting_Icon:SetPosY(PosY - (chatting_contents[0]):GetSizeY() - (deltaPosY))
            chatting_sender:SetPosY(PosY - (chatting_contents[0]):GetSizeY() - (deltaPosY))
            ;
            (chatting_contents[0]):SetPosY(chatting_sender:GetPosY())
            ;
            (chatting_contents[0]):SetPosX(chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentPosX)
            PosY = PosY - (chatting_contents[0]):GetSizeY() - 3
            if UI_CT.System == chatType or UI_CT.Notice == chatType or isMe then
              chatting_sender:SetIgnore(true)
            else
              chatting_sender:SetIgnore(false)
            end
            if UI_CT.Public == chatType then
              chatting_sender:SetOverFontColor(UI_color.C_FFC4BEBE)
            else
              chatting_sender:SetOverFontColor(UI_color.C_FFFFFFFF)
            end
            if (isLinkedItem or isLinkedWbSite) and (UI_CT.World == chatType or UI_CT.Guild == chatType or UI_CT.System == chatType or UI_CT.Public == chatType or UI_CT.Party == chatType or UI_CT.WorldWithItem == chatType or UI_CT.Private == chatType) then
              local fontType = getPanelChatFontSizeType(panelIndex)
              chatting_Icon:SetPosX(10)
              chatting_sender:SetTextHorizonRight()
              chatting_sender:SetText(senderStr)
              chatting_sender:SetFontColor(msgColor)
              chatting_sender:SetSize(chatting_sender:GetTextSizeX(), chatting_sender:GetTextSizeY())
              chatting_sender:SetShow(true)
              local chat_contentAddPosX = 0
              if chatting_Icon:GetTextSizeX() ~= 0 then
                chat_contentAddPosX = 15
                chatting_sender:SetPosX(chatting_Icon:GetTextSizeX() + chat_contentAddPosX)
              else
                chat_contentAddPosX = 10
                chatting_sender:SetPosX(chat_contentAddPosX)
              end
              if isMe == false then
                chatting_sender:SetIgnore(false)
              else
                chatting_sender:SetIgnore(true)
              end
              if UI_CT.Public == chatType then
                chatting_sender:SetOverFontColor(UI_color.C_FFC4BEBE)
              else
                chatting_sender:SetOverFontColor(UI_color.C_FFFFFFFF)
              end
              local chat_contentAddPosX = 0
              if chatting_Icon:GetTextSizeX() ~= 0 then
                chat_contentAddPosX = 15
                chatting_sender:SetPosX(chatting_Icon:GetTextSizeX() + chat_contentAddPosX)
              else
                chat_contentAddPosX = 10
                chatting_sender:SetPosX(chat_contentAddPosX)
              end
              chatting_Icon:SetPosX(10)
              chatting_sender:SetTextHorizonRight()
              chatting_sender:SetAutoResize(true)
              chatting_sender:SetFontColor(msgColor)
              chatting_sender:SetText(senderStr)
              chatting_sender:SetSize(chatting_sender:GetTextSizeX(), chatting_sender:GetTextSizeY())
              chatting_sender:SetShow(true)
              local chat_contentPosX = 0
              if chatting_Icon:GetTextSizeX() ~= 0 then
                chat_contentPosX = 15
                chatting_sender:SetPosX(chatting_Icon:GetTextSizeX() + chat_contentPosX)
              else
                chat_contentPosX = 10
                chatting_sender:SetPosX(chat_contentPosX)
              end
              chatting_Icon:SetPosY()
              local emoticonMsgSplit = {}
              local emoticonSplitCount = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
              local emoticonTotalSplitCount = 2
              local emoticonSplitStart = 0
              local isfristin = true
              for emoticonNumber = 1, emoticonCount + 1 do
                -- DECOMPILER ERROR at PC1002: Unhandled construct in 'MakeBoolean' P1

                if emoticonNumber == emoticonCount + 1 and chattingMessage:getEmoticonIndex(emoticonNumber - 2) <= (string.len)(msg) then
                  emoticonMsgSplit[emoticonTotalSplitCount - 1] = (string.sub)(msg, emoticonSplitStart + 1, (string.len)(msg))
                end
                if chattingMessage:getEmoticonIndex(emoticonNumber - 1) == 0 then
                  emoticonSplitCount[1] = emoticonSplitCount[1] + 1
                else
                  if (string.len)(msg) - 1 == chattingMessage:getEmoticonIndex(emoticonNumber - 1) then
                    emoticonSplitCount[emoticonTotalSplitCount] = emoticonSplitCount[emoticonTotalSplitCount] + 1
                    if isfristin then
                      emoticonMsgSplit[emoticonTotalSplitCount - 1] = (string.sub)(msg, emoticonSplitStart + 1, chattingMessage:getEmoticonIndex(emoticonNumber - 1))
                      isfristin = false
                      emoticonTotalSplitCount = emoticonTotalSplitCount + 1
                      emoticonSplitStart = chattingMessage:getEmoticonIndex(emoticonNumber - 1)
                    end
                  else
                    if chattingMessage:getEmoticonIndex(emoticonNumber - 1) - emoticonSplitStart > 1 then
                      emoticonMsgSplit[emoticonTotalSplitCount - 1] = (string.sub)(msg, emoticonSplitStart + 1, chattingMessage:getEmoticonIndex(emoticonNumber - 1))
                      emoticonSplitCount[emoticonTotalSplitCount] = emoticonSplitCount[emoticonTotalSplitCount] + 1
                      emoticonTotalSplitCount = emoticonTotalSplitCount + 1
                      emoticonSplitStart = chattingMessage:getEmoticonIndex(emoticonNumber - 1)
                    else
                      emoticonSplitCount[emoticonTotalSplitCount - 1] = emoticonSplitCount[emoticonTotalSplitCount - 1] + 1
                    end
                  end
                end
              end
              local addEmoticon_PosX = 0
              local Line = {}
              local LineCount = 0
              local currentStaticIndex = 0
              local emoticonDrawIndex = 0
              local SplitMaxCount = 0
              local remainSizeX = 0
              local totalmsgstart = 0
              local textStaticSizeX = panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX()
              local textStaticPosX = chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
              if emoticonTotalSplitCount == 2 then
                for emoNum = 1, emoticonTotalSplitCount do
                  if emoticonSplitCount[emoNum] ~= 0 then
                    for SplitCount = 1, emoticonSplitCount[emoNum] do
                      chatting_contents[currentStaticIndex] = poolCurrentUI:newChattingEmoticon()
                      ;
                      (chatting_contents[currentStaticIndex]):ChangeTextureInfoName(chattingMessage:getEmoticonPath(emoticonDrawIndex))
                      ;
                      ((chatting_contents[currentStaticIndex]):getBaseTexture()):setUV(0, 0, (chattingMessage:getEmoticonUV(emoticonDrawIndex)).x, (chattingMessage:getEmoticonUV(emoticonDrawIndex)).y)
                      ;
                      (chatting_contents[currentStaticIndex]):setRenderTexture((chatting_contents[currentStaticIndex]):getBaseTexture())
                      ;
                      (chatting_contents[currentStaticIndex]):SetSize(chatting_sender:GetSizeY(), chatting_sender:GetSizeY())
                      local textStaticSizeX = panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX()
                      local textStaticPosX = chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
                      local j = 1
                      local isWhile = false
                      while 1 do
                        if currentStaticIndex >= 1 and (chatting_contents[currentStaticIndex - j]):GetSizeX() < panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX() then
                          isWhile = true
                          textStaticSizeX = textStaticSizeX - (chatting_contents[currentStaticIndex - j]):GetSizeX()
                          textStaticPosX = textStaticPosX + (chatting_contents[currentStaticIndex - j]):GetSizeX()
                        end
                        if chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX == (chatting_contents[currentStaticIndex - j]):GetPosX() then
                          break
                        end
                        j = j + 1
                      end
                      if textStaticSizeX == 0 or isWhile == false then
                        textStaticSizeX = panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX()
                        textStaticPosX = chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
                      end
                      ;
                      (chatting_contents[currentStaticIndex]):SetSize(chatting_sender:GetSizeY(), chatting_sender:GetSizeY())
                      ;
                      (chatting_contents[currentStaticIndex]):SetPosX(textStaticPosX)
                      emoticonDrawIndex = emoticonDrawIndex + 1
                      currentStaticIndex = currentStaticIndex + 1
                    end
                  end
                  do
                    if emoNum ~= emoticonTotalSplitCount then
                      msgData = emoticonMsgSplit[emoNum]
                      local msgDataLen = (string.len)(msgData)
                      local linkedMsgSplit = {}
                      local linkedMsgCount = 0
                      local linkedIndex = 0
                      local startIndex = chattingMessage:getLinkedItemStartIndex()
                      local endIndex = chattingMessage:getLinkedItemEndIndex()
                      if isLinkedItem then
                        startIndex = chattingMessage:getLinkedItemStartIndex()
                        endIndex = chattingMessage:getLinkedItemEndIndex()
                      else
                        if isLinkedWbSite then
                          startIndex = chattingMessage:getLinkedWebsiteStartIndex()
                          endIndex = chattingMessage:getLinkedWebsiteEndIndex()
                        end
                      end
                      if startIndex > 0 then
                        linkedMsgSplit[0] = (string.sub)(msgData, 1, startIndex - totalmsgstart)
                        linkedMsgSplit[1] = (string.sub)(msgData, startIndex - totalmsgstart + 1, endIndex - totalmsgstart)
                        linkedMsgCount = 2
                        linkedIndex = 1
                        if endIndex < totalmsgstart + (string.len)(msgData) then
                          linkedMsgSplit[2] = (string.sub)(msgData, endIndex - totalmsgstart + 1, (string.len)(msgData))
                          linkedMsgCount = 3
                        end
                      else
                        linkedMsgSplit[0] = (string.sub)(msgData, 1, endIndex - totalmsgstart)
                        linkedMsgCount = 1
                        linkedIndex = 0
                        if endIndex < totalmsgstart + (string.len)(msg) then
                          linkedMsgSplit[1] = (string.sub)(msgData, endIndex - totalmsgstart + 1, (string.len)(msgData))
                          linkedMsgCount = 2
                        end
                      end
                      for index = 0, linkedMsgCount - 1 do
                      end
                      for index = 0, linkedMsgCount - 1 do
                        msgData = linkedMsgSplit[index]
                        msgDataLen = (string.len)(msgData)
                        totalmsgstart = totalmsgstart + msgDataLen
                        local ispreEmoticonIndex = currentStaticIndex
                        while 1 do
                          if msgDataLen > 0 then
                            if index == linkedIndex then
                              if isLinkedItem then
                                chatting_contents[currentStaticIndex] = poolCurrentUI:newChattingLinkedItem(messageIndex)
                                ;
                                (chatting_contents[currentStaticIndex]):SetFontColor(UI_color.C_FFFFCF4C)
                              else
                                if isLinkedWbSite then
                                  chatting_contents[currentStaticIndex] = poolCurrentUI:newChattingLinkedWebSite(messageIndex)
                                  ;
                                  (chatting_contents[currentStaticIndex]):SetFontColor((Defines.Color).C_FF00C0D7)
                                end
                              end
                              ;
                              (chatting_contents[currentStaticIndex]):SetIgnore(false)
                            else
                              chatting_contents[currentStaticIndex] = poolCurrentUI:newChattingContents()
                              ;
                              (chatting_contents[currentStaticIndex]):SetIgnore(true)
                              ;
                              (chatting_contents[currentStaticIndex]):SetFontColor(msgColor)
                            end
                            textStaticSizeX = panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX()
                            textStaticPosX = chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
                            local j = 1
                            local isWhile = false
                            while 1 do
                              if currentStaticIndex >= 1 and (chatting_contents[currentStaticIndex - j]):GetSizeX() < panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX() then
                                isWhile = true
                                textStaticSizeX = textStaticSizeX - (chatting_contents[currentStaticIndex - j]):GetSizeX()
                                textStaticPosX = textStaticPosX + (chatting_contents[currentStaticIndex - j]):GetSizeX()
                              end
                              if chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX == (chatting_contents[currentStaticIndex - j]):GetPosX() then
                                break
                              end
                              j = j + 1
                            end
                            if textStaticSizeX == 0 or isWhile == false then
                              textStaticSizeX = panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX()
                              textStaticPosX = chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
                            end
                            ;
                            (chatting_contents[currentStaticIndex]):SetSize(textStaticSizeX, chatting_sender:GetSizeY())
                            ;
                            (chatting_contents[currentStaticIndex]):SetPosX(textStaticPosX)
                            msg = (chatting_contents[currentStaticIndex]):GetTextLimitWidth(msgData)
                            if isChangeFontSize() then
                              (chatting_contents[currentStaticIndex]):setChangeFontAfterTransSizeValue(true)
                            end
                            ;
                            (chatting_contents[currentStaticIndex]):SetText(msg)
                            if (string.len)(msg) < (string.len)(msgData) then
                              local msgStr = (string.sub)(msgData, (string.len)(msg) + 1, (string.len)(msgData))
                              msgData = msgStr
                              msgDataLen = (string.len)(msgData)
                            else
                              do
                                do
                                  msgDataLen = 0
                                  currentStaticIndex = currentStaticIndex + 1
                                  -- DECOMPILER ERROR at PC1518: LeaveBlock: unexpected jumping out DO_STMT

                                  -- DECOMPILER ERROR at PC1518: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                  -- DECOMPILER ERROR at PC1518: LeaveBlock: unexpected jumping out IF_STMT

                                  -- DECOMPILER ERROR at PC1518: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                  -- DECOMPILER ERROR at PC1518: LeaveBlock: unexpected jumping out IF_STMT

                                end
                              end
                            end
                          end
                        end
                        if ispreEmoticonIndex ~= currentStaticIndex then
                          (chatting_contents[currentStaticIndex - 1]):SetSize((chatting_contents[currentStaticIndex - 1]):GetTextSizeX(), chatting_sender:GetSizeY())
                        else
                          ;
                          (chatting_contents[currentStaticIndex - 1]):SetSize((chatting_contents[currentStaticIndex - 1]):GetSizeX(), chatting_sender:GetSizeY())
                        end
                      end
                    end
                    do
                      -- DECOMPILER ERROR at PC1543: LeaveBlock: unexpected jumping out DO_STMT

                    end
                  end
                end
              else
                for emoNum = 1, emoticonTotalSplitCount do
                  if emoticonSplitCount[emoNum] ~= 0 then
                    for SplitCount = 1, emoticonSplitCount[emoNum] do
                      chatting_contents[currentStaticIndex] = poolCurrentUI:newChattingEmoticon()
                      ;
                      (chatting_contents[currentStaticIndex]):ChangeTextureInfoName(chattingMessage:getEmoticonPath(emoticonDrawIndex))
                      ;
                      ((chatting_contents[currentStaticIndex]):getBaseTexture()):setUV(0, 0, (chattingMessage:getEmoticonUV(emoticonDrawIndex)).x, (chattingMessage:getEmoticonUV(emoticonDrawIndex)).y)
                      ;
                      (chatting_contents[currentStaticIndex]):setRenderTexture((chatting_contents[currentStaticIndex]):getBaseTexture())
                      ;
                      (chatting_contents[currentStaticIndex]):SetSize(chatting_sender:GetSizeY(), chatting_sender:GetSizeY())
                      local textStaticSizeX = panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX()
                      local textStaticPosX = chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
                      local j = 1
                      local isWhile = false
                      while 1 do
                        if currentStaticIndex >= 1 and (chatting_contents[currentStaticIndex - j]):GetSizeX() < panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX() then
                          isWhile = true
                          textStaticSizeX = textStaticSizeX - (chatting_contents[currentStaticIndex - j]):GetSizeX()
                          textStaticPosX = textStaticPosX + (chatting_contents[currentStaticIndex - j]):GetSizeX()
                        end
                        if chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX == (chatting_contents[currentStaticIndex - j]):GetPosX() then
                          break
                        end
                        j = j + 1
                      end
                      if textStaticSizeX == 0 or isWhile == false then
                        textStaticSizeX = panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX()
                        textStaticPosX = chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
                      end
                      ;
                      (chatting_contents[currentStaticIndex]):SetSize(chatting_sender:GetSizeY(), chatting_sender:GetSizeY())
                      ;
                      (chatting_contents[currentStaticIndex]):SetPosX(textStaticPosX)
                      emoticonDrawIndex = emoticonDrawIndex + 1
                      currentStaticIndex = currentStaticIndex + 1
                    end
                  end
                  do
                    if emoNum ~= emoticonTotalSplitCount then
                      msgData = emoticonMsgSplit[emoNum]
                      local msgDataLen = (string.len)(msgData)
                      local linkedMsgSplit = {}
                      local linkedMsgCount = 0
                      local linkedIndex = 0
                      local startIndex = chattingMessage:getLinkedItemStartIndex()
                      local endIndex = chattingMessage:getLinkedItemEndIndex()
                      if isLinkedItem then
                        startIndex = chattingMessage:getLinkedItemStartIndex()
                        endIndex = chattingMessage:getLinkedItemEndIndex()
                      else
                        if isLinkedWbSite then
                          startIndex = chattingMessage:getLinkedWebsiteStartIndex()
                          endIndex = chattingMessage:getLinkedWebsiteEndIndex()
                        end
                      end
                      _PA_LOG("ì´ìž¬í™\141", "startIndex : " .. startIndex)
                      _PA_LOG("ì´ìž¬í™\141", "EndIndex : " .. startIndex)
                      _PA_LOG("ì´ìž¬í™\141", "totalmsgstart : " .. totalmsgstart)
                      _PA_LOG("ì´ìž¬í™\141", "totalmsgend : " .. totalmsgstart + (string.len)(msgData))
                      if totalmsgstart <= startIndex and endIndex <= totalmsgstart + (string.len)(msgData) then
                        if startIndex > 0 then
                          linkedMsgSplit[0] = (string.sub)(msgData, 1, startIndex - (totalmsgstart))
                          linkedMsgSplit[1] = (string.sub)(msgData, startIndex - (totalmsgstart) + 1, endIndex - (totalmsgstart))
                          linkedMsgCount = 2
                          linkedIndex = 1
                          if endIndex < totalmsgstart + (string.len)(msgData) then
                            linkedMsgSplit[2] = (string.sub)(msgData, endIndex - (totalmsgstart) + 1, (string.len)(msgData))
                            linkedMsgCount = 3
                          end
                        else
                          linkedMsgSplit[0] = (string.sub)(msgData, 1, endIndex - (totalmsgstart))
                          linkedMsgCount = 1
                          linkedIndex = 0
                          if endIndex < totalmsgstart + (string.len)(msg) then
                            linkedMsgSplit[1] = (string.sub)(msgData, endIndex - (totalmsgstart) + 1, (string.len)(msgData))
                            linkedMsgCount = 2
                          end
                        end
                        for index = 0, linkedMsgCount - 1 do
                          msgData = linkedMsgSplit[index]
                          msgDataLen = (string.len)(msgData)
                          totalmsgstart = totalmsgstart + msgDataLen
                          local ispreEmoticonIndex = currentStaticIndex
                          while 1 do
                            if msgDataLen > 0 then
                              if index == linkedIndex then
                                if isLinkedItem then
                                  chatting_contents[currentStaticIndex] = poolCurrentUI:newChattingLinkedItem(messageIndex)
                                  ;
                                  (chatting_contents[currentStaticIndex]):SetFontColor(UI_color.C_FFFFCF4C)
                                else
                                  if isLinkedWbSite then
                                    chatting_contents[currentStaticIndex] = poolCurrentUI:newChattingLinkedWebSite(messageIndex)
                                    ;
                                    (chatting_contents[currentStaticIndex]):SetFontColor((Defines.Color).C_FF00C0D7)
                                  end
                                end
                                ;
                                (chatting_contents[currentStaticIndex]):SetIgnore(false)
                              else
                                chatting_contents[currentStaticIndex] = poolCurrentUI:newChattingContents()
                                ;
                                (chatting_contents[currentStaticIndex]):SetIgnore(true)
                                ;
                                (chatting_contents[currentStaticIndex]):SetFontColor(msgColor)
                              end
                              textStaticSizeX = panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX()
                              textStaticPosX = chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
                              local j = 1
                              local isWhile = false
                              while 1 do
                                if currentStaticIndex >= 1 and (chatting_contents[currentStaticIndex - j]):GetSizeX() < panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX() then
                                  isWhile = true
                                  textStaticSizeX = textStaticSizeX - (chatting_contents[currentStaticIndex - j]):GetSizeX()
                                  textStaticPosX = textStaticPosX + (chatting_contents[currentStaticIndex - j]):GetSizeX()
                                end
                                if chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX == (chatting_contents[currentStaticIndex - j]):GetPosX() then
                                  break
                                end
                                j = j + 1
                              end
                              if textStaticSizeX == 0 or isWhile == false then
                                textStaticSizeX = panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX()
                                textStaticPosX = chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
                              end
                              ;
                              (chatting_contents[currentStaticIndex]):SetSize(textStaticSizeX, chatting_sender:GetSizeY())
                              ;
                              (chatting_contents[currentStaticIndex]):SetPosX(textStaticPosX)
                              msg = (chatting_contents[currentStaticIndex]):GetTextLimitWidth(msgData)
                              if isChangeFontSize() then
                                (chatting_contents[currentStaticIndex]):setChangeFontAfterTransSizeValue(true)
                              end
                              ;
                              (chatting_contents[currentStaticIndex]):SetText(msg)
                              if (string.len)(msg) < (string.len)(msgData) then
                                local msgStr = (string.sub)(msgData, (string.len)(msg) + 1, (string.len)(msgData))
                                msgData = msgStr
                                msgDataLen = (string.len)(msgData)
                              else
                                do
                                  do
                                    msgDataLen = 0
                                    currentStaticIndex = currentStaticIndex + 1
                                    -- DECOMPILER ERROR at PC1997: LeaveBlock: unexpected jumping out DO_STMT

                                    -- DECOMPILER ERROR at PC1997: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                    -- DECOMPILER ERROR at PC1997: LeaveBlock: unexpected jumping out IF_STMT

                                    -- DECOMPILER ERROR at PC1997: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                    -- DECOMPILER ERROR at PC1997: LeaveBlock: unexpected jumping out IF_STMT

                                  end
                                end
                              end
                            end
                          end
                          if ispreEmoticonIndex ~= currentStaticIndex then
                            (chatting_contents[currentStaticIndex - 1]):SetSize((chatting_contents[currentStaticIndex - 1]):GetTextSizeX(), chatting_sender:GetSizeY())
                          else
                            ;
                            (chatting_contents[currentStaticIndex - 1]):SetSize((chatting_contents[currentStaticIndex - 1]):GetSizeX(), chatting_sender:GetSizeY())
                          end
                        end
                      else
                        do
                          totalmsgstart = totalmsgstart + msgDataLen
                          do
                            local ispreEmoticonIndex = currentStaticIndex
                            while 1 do
                              if msgDataLen > 0 then
                                chatting_contents[currentStaticIndex] = poolCurrentUI:newChattingContents()
                                ;
                                (chatting_contents[currentStaticIndex]):SetIgnore(true)
                                ;
                                (chatting_contents[currentStaticIndex]):SetFontColor(msgColor)
                                local textStaticSizeX = panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX()
                                local textStaticPosX = chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
                                local j = 1
                                local isWhile = false
                                while 1 do
                                  if currentStaticIndex >= 1 and (chatting_contents[currentStaticIndex - j]):GetSizeX() < panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX() then
                                    isWhile = true
                                    textStaticSizeX = textStaticSizeX - (chatting_contents[currentStaticIndex - j]):GetSizeX()
                                    textStaticPosX = textStaticPosX + (chatting_contents[currentStaticIndex - j]):GetSizeX()
                                  end
                                  if chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX == (chatting_contents[currentStaticIndex - j]):GetPosX() then
                                    break
                                  end
                                  j = j + 1
                                end
                                if textStaticSizeX == 0 or isWhile == false then
                                  textStaticSizeX = panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX()
                                  textStaticPosX = chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
                                end
                                ;
                                (chatting_contents[currentStaticIndex]):SetSize(textStaticSizeX, chatting_sender:GetSizeY())
                                ;
                                (chatting_contents[currentStaticIndex]):SetPosX(textStaticPosX)
                                msg = (chatting_contents[currentStaticIndex]):GetTextLimitWidth(msgData)
                                if isChangeFontSize() then
                                  (chatting_contents[currentStaticIndex]):setChangeFontAfterTransSizeValue(true)
                                end
                                ;
                                (chatting_contents[currentStaticIndex]):SetText(msg)
                                if (string.len)(msg) < (string.len)(msgData) then
                                  local msgStr = (string.sub)(msgData, (string.len)(msg) + 1, (string.len)(msgData))
                                  msgData = msgStr
                                  msgDataLen = (string.len)(msgData)
                                else
                                  do
                                    do
                                      msgDataLen = 0
                                      currentStaticIndex = currentStaticIndex + 1
                                      -- DECOMPILER ERROR at PC2167: LeaveBlock: unexpected jumping out DO_STMT

                                      -- DECOMPILER ERROR at PC2167: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                      -- DECOMPILER ERROR at PC2167: LeaveBlock: unexpected jumping out IF_STMT

                                      -- DECOMPILER ERROR at PC2167: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                      -- DECOMPILER ERROR at PC2167: LeaveBlock: unexpected jumping out IF_STMT

                                    end
                                  end
                                end
                              end
                            end
                            if ispreEmoticonIndex ~= currentStaticIndex then
                              (chatting_contents[currentStaticIndex - 1]):SetSize((chatting_contents[currentStaticIndex - 1]):GetTextSizeX(), chatting_sender:GetSizeY())
                            else
                              ;
                              (chatting_contents[currentStaticIndex - 1]):SetSize((chatting_contents[currentStaticIndex - 1]):GetSizeX(), chatting_sender:GetSizeY())
                            end
                            -- DECOMPILER ERROR at PC2191: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC2191: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                            -- DECOMPILER ERROR at PC2191: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC2191: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC2191: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC2191: LeaveBlock: unexpected jumping out DO_STMT

                          end
                        end
                      end
                    end
                  end
                end
              end
              for index = currentStaticIndex - 1, 0, -1 do
                (chatting_contents[index]):SetPosY(PosY - (chatting_contents[index]):GetSizeY() - (deltaPosY))
                ;
                (chatting_contents[index]):SetShow(true)
                if chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX == (chatting_contents[index]):GetPosX() then
                  PosY = PosY - (chatting_contents[index]):GetSizeY()
                  if index ~= 0 then
                    (chatting_contents[index]):SetPosX(chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX)
                  else
                    ;
                    (chatting_contents[index]):SetPosX(chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentPosX)
                  end
                end
              end
              chatting_Icon:SetPosY(PosY - (deltaPosY))
              chatting_sender:SetPosY(PosY - (deltaPosY))
              PosY = PosY - 3
              if UI_CT.System == chatType or UI_CT.Notice == chatType or isMe then
                chatting_sender:SetIgnore(true)
              else
                chatting_sender:SetIgnore(false)
              end
              if UI_CT.Public == chatType then
                chatting_sender:SetOverFontColor(UI_color.C_FFC4BEBE)
              else
                chatting_sender:SetOverFontColor(UI_color.C_FFFFFFFF)
              end
            else
              do
                local chat_contentAddPosX = 0
                if chatting_Icon:GetTextSizeX() ~= 0 then
                  chat_contentAddPosX = 15
                  chatting_sender:SetPosX(chatting_Icon:GetTextSizeX() + chat_contentAddPosX)
                else
                  chat_contentAddPosX = 10
                  chatting_sender:SetPosX(chat_contentAddPosX)
                end
                chatting_Icon:SetPosX(10)
                chatting_sender:SetTextHorizonRight()
                chatting_sender:SetAutoResize(true)
                chatting_sender:SetFontColor(msgColor)
                chatting_sender:SetText(senderStr)
                chatting_sender:SetSize(chatting_sender:GetTextSizeX(), chatting_sender:GetTextSizeY())
                chatting_sender:SetShow(true)
                local chat_contentPosX = 0
                if chatting_Icon:GetTextSizeX() ~= 0 then
                  chat_contentPosX = 15
                  chatting_sender:SetPosX(chatting_Icon:GetTextSizeX() + chat_contentPosX)
                else
                  chat_contentPosX = 10
                  chatting_sender:SetPosX(chat_contentPosX)
                end
                chatting_Icon:SetPosY()
                if (string.len)(msg) == 0 then
                  local addposX = 0
                  local drawindex = 0
                  for count = 1, emoticonCount do
                    chatting_contents[count] = poolCurrentUI:newChattingEmoticon()
                    ;
                    (chatting_contents[count]):ChangeTextureInfoName(chattingMessage:getEmoticonPath(drawindex))
                    ;
                    ((chatting_contents[count]):getBaseTexture()):setUV(0, 0, (chattingMessage:getEmoticonUV(emoticonDrawIndex)).x, (chattingMessage:getEmoticonUV(emoticonDrawIndex)).y)
                    ;
                    (chatting_contents[count]):setRenderTexture((chatting_contents[count]):getBaseTexture())
                    ;
                    (chatting_contents[count]):SetSize(chatting_sender:GetSizeY(), chatting_sender:GetSizeY())
                    ;
                    (chatting_contents[count]):SetPosX(chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentPosX + addposX)
                    ;
                    (chatting_contents[count]):SetPosY(PosY - (chatting_contents[count]):GetSizeY() - (deltaPosY))
                    ;
                    (chatting_contents[count]):SetShow(true)
                    addposX = addposX + (chatting_contents[count]):GetSizeY()
                    drawindex = drawindex + 1
                  end
                  PosY = PosY - (chatting_contents[1]):GetSizeY()
                else
                  do
                    local emoticonMsgSplit = {}
                    local emoticonSplitCount = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
                    local emoticonTotalSplitCount = 2
                    local emoticonSplitStart = 0
                    local isfristin = true
                    for emoticonNumber = 1, emoticonCount + 1 do
                      -- DECOMPILER ERROR at PC2465: Unhandled construct in 'MakeBoolean' P1

                      if emoticonNumber == emoticonCount + 1 and chattingMessage:getEmoticonIndex(emoticonNumber - 2) <= (string.len)(msg) then
                        emoticonMsgSplit[emoticonTotalSplitCount - 1] = (string.sub)(msg, emoticonSplitStart + 1, (string.len)(msg))
                      end
                      if chattingMessage:getEmoticonIndex(emoticonNumber - 1) == 0 then
                        emoticonSplitCount[1] = emoticonSplitCount[1] + 1
                      else
                        if (string.len)(msg) - 1 == chattingMessage:getEmoticonIndex(emoticonNumber - 1) then
                          emoticonSplitCount[emoticonTotalSplitCount] = emoticonSplitCount[emoticonTotalSplitCount] + 1
                          if isfristin then
                            emoticonMsgSplit[emoticonTotalSplitCount - 1] = (string.sub)(msg, emoticonSplitStart + 1, chattingMessage:getEmoticonIndex(emoticonNumber - 1))
                            isfristin = false
                            emoticonTotalSplitCount = emoticonTotalSplitCount + 1
                            emoticonSplitStart = chattingMessage:getEmoticonIndex(emoticonNumber - 1)
                          end
                        else
                          if chattingMessage:getEmoticonIndex(emoticonNumber - 1) - emoticonSplitStart > 1 then
                            emoticonMsgSplit[emoticonTotalSplitCount - 1] = (string.sub)(msg, emoticonSplitStart + 1, chattingMessage:getEmoticonIndex(emoticonNumber - 1))
                            emoticonSplitCount[emoticonTotalSplitCount] = emoticonSplitCount[emoticonTotalSplitCount] + 1
                            emoticonTotalSplitCount = emoticonTotalSplitCount + 1
                            emoticonSplitStart = chattingMessage:getEmoticonIndex(emoticonNumber - 1)
                          else
                            emoticonSplitCount[emoticonTotalSplitCount - 1] = emoticonSplitCount[emoticonTotalSplitCount - 1] + 1
                          end
                        end
                      end
                    end
                    local addEmoticon_PosX = 0
                    local Line = {}
                    local LineCount = 0
                    local currentStaticIndex = 0
                    local emoticonDrawIndex = 0
                    local SplitMaxCount = 0
                    local remainSizeX = 0
                    local textStaticSizeX = panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX()
                    local textStaticPosX = chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
                    if emoticonTotalSplitCount == 2 then
                      for emoNum = 1, emoticonTotalSplitCount do
                        if emoticonSplitCount[emoNum] ~= 0 then
                          for SplitCount = 1, emoticonSplitCount[emoNum] do
                            chatting_contents[currentStaticIndex] = poolCurrentUI:newChattingEmoticon()
                            ;
                            (chatting_contents[currentStaticIndex]):ChangeTextureInfoName(chattingMessage:getEmoticonPath(emoticonDrawIndex))
                            ;
                            ((chatting_contents[currentStaticIndex]):getBaseTexture()):setUV(0, 0, (chattingMessage:getEmoticonUV(emoticonDrawIndex)).x, (chattingMessage:getEmoticonUV(emoticonDrawIndex)).y)
                            ;
                            (chatting_contents[currentStaticIndex]):setRenderTexture((chatting_contents[currentStaticIndex]):getBaseTexture())
                            ;
                            (chatting_contents[currentStaticIndex]):SetSize(chatting_sender:GetSizeY(), chatting_sender:GetSizeY())
                            local textStaticSizeX = panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX()
                            local textStaticPosX = chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
                            local j = 1
                            local isWhile = false
                            while 1 do
                              if currentStaticIndex >= 1 and (chatting_contents[currentStaticIndex - j]):GetSizeX() < panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX() then
                                isWhile = true
                                textStaticSizeX = textStaticSizeX - (chatting_contents[currentStaticIndex - j]):GetSizeX()
                                textStaticPosX = textStaticPosX + (chatting_contents[currentStaticIndex - j]):GetSizeX()
                              end
                              if chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX == (chatting_contents[currentStaticIndex - j]):GetPosX() then
                                break
                              end
                              j = j + 1
                            end
                            if textStaticSizeX == 0 or isWhile == false then
                              textStaticSizeX = panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX()
                              textStaticPosX = chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
                            end
                            ;
                            (chatting_contents[currentStaticIndex]):SetSize(chatting_sender:GetSizeY(), chatting_sender:GetSizeY())
                            ;
                            (chatting_contents[currentStaticIndex]):SetPosX(textStaticPosX)
                            emoticonDrawIndex = emoticonDrawIndex + 1
                            currentStaticIndex = currentStaticIndex + 1
                          end
                        end
                        do
                          if emoNum ~= emoticonTotalSplitCount then
                            msgData = emoticonMsgSplit[emoNum]
                            local msgDataLen = (string.len)(msgData)
                            local ispreEmoticonIndex = currentStaticIndex
                            while 1 do
                              if msgDataLen > 0 then
                                chatting_contents[currentStaticIndex] = poolCurrentUI:newChattingContents()
                                ;
                                (chatting_contents[currentStaticIndex]):SetFontColor(msgColor)
                                local textStaticSizeX = panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX()
                                local textStaticPosX = chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
                                local j = 1
                                local isWhile = false
                                while 1 do
                                  if currentStaticIndex >= 1 and (chatting_contents[currentStaticIndex - j]):GetSizeX() < panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX() then
                                    isWhile = true
                                    textStaticSizeX = textStaticSizeX - (chatting_contents[currentStaticIndex - j]):GetSizeX()
                                    textStaticPosX = textStaticPosX + (chatting_contents[currentStaticIndex - j]):GetSizeX()
                                  end
                                  if chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX == (chatting_contents[currentStaticIndex - j]):GetPosX() then
                                    break
                                  end
                                  j = j + 1
                                end
                                if textStaticSizeX == 0 or isWhile == false then
                                  textStaticSizeX = panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX()
                                  textStaticPosX = chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
                                end
                                ;
                                (chatting_contents[currentStaticIndex]):SetSize(textStaticSizeX, chatting_sender:GetSizeY())
                                ;
                                (chatting_contents[currentStaticIndex]):SetPosX(textStaticPosX)
                                msg = (chatting_contents[currentStaticIndex]):GetTextLimitWidth(msgData)
                                if isChangeFontSize() then
                                  (chatting_contents[currentStaticIndex]):setChangeFontAfterTransSizeValue(true)
                                end
                                ;
                                (chatting_contents[currentStaticIndex]):SetText(msg)
                                if (string.len)(msg) < (string.len)(msgData) then
                                  local msgStr = (string.sub)(msgData, (string.len)(msg) + 1, (string.len)(msgData))
                                  msgData = msgStr
                                  msgDataLen = (string.len)(msgData)
                                else
                                  do
                                    do
                                      msgDataLen = 0
                                      currentStaticIndex = currentStaticIndex + 1
                                      -- DECOMPILER ERROR at PC2838: LeaveBlock: unexpected jumping out DO_STMT

                                      -- DECOMPILER ERROR at PC2838: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                      -- DECOMPILER ERROR at PC2838: LeaveBlock: unexpected jumping out IF_STMT

                                      -- DECOMPILER ERROR at PC2838: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                      -- DECOMPILER ERROR at PC2838: LeaveBlock: unexpected jumping out IF_STMT

                                    end
                                  end
                                end
                              end
                            end
                            if ispreEmoticonIndex ~= currentStaticIndex then
                              (chatting_contents[currentStaticIndex - 1]):SetSize((chatting_contents[currentStaticIndex - 1]):GetTextSizeX(), chatting_sender:GetSizeY())
                            else
                              ;
                              (chatting_contents[currentStaticIndex - 1]):SetSize((chatting_contents[currentStaticIndex - 1]):GetSizeX(), chatting_sender:GetSizeY())
                            end
                          end
                          do
                            -- DECOMPILER ERROR at PC2862: LeaveBlock: unexpected jumping out DO_STMT

                          end
                        end
                      end
                    else
                      for emoNum = 1, emoticonTotalSplitCount do
                        if emoticonSplitCount[emoNum] ~= 0 then
                          for SplitCount = 1, emoticonSplitCount[emoNum] do
                            chatting_contents[currentStaticIndex] = poolCurrentUI:newChattingEmoticon()
                            ;
                            (chatting_contents[currentStaticIndex]):ChangeTextureInfoName(chattingMessage:getEmoticonPath(emoticonDrawIndex))
                            ;
                            ((chatting_contents[currentStaticIndex]):getBaseTexture()):setUV(0, 0, (chattingMessage:getEmoticonUV(emoticonDrawIndex)).x, (chattingMessage:getEmoticonUV(emoticonDrawIndex)).y)
                            ;
                            (chatting_contents[currentStaticIndex]):setRenderTexture((chatting_contents[currentStaticIndex]):getBaseTexture())
                            ;
                            (chatting_contents[currentStaticIndex]):SetSize(chatting_sender:GetSizeY(), chatting_sender:GetSizeY())
                            local textStaticSizeX = panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX()
                            local textStaticPosX = chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
                            local j = 1
                            local isWhile = false
                            while 1 do
                              if currentStaticIndex >= 1 and (chatting_contents[currentStaticIndex - j]):GetSizeX() < panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX() then
                                isWhile = true
                                textStaticSizeX = textStaticSizeX - (chatting_contents[currentStaticIndex - j]):GetSizeX()
                                textStaticPosX = textStaticPosX + (chatting_contents[currentStaticIndex - j]):GetSizeX()
                              end
                              if chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX == (chatting_contents[currentStaticIndex - j]):GetPosX() then
                                break
                              end
                              j = j + 1
                            end
                            if textStaticSizeX == 0 or isWhile == false then
                              textStaticSizeX = panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX()
                              textStaticPosX = chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
                            end
                            ;
                            (chatting_contents[currentStaticIndex]):SetSize(chatting_sender:GetSizeY(), chatting_sender:GetSizeY())
                            ;
                            (chatting_contents[currentStaticIndex]):SetPosX(textStaticPosX)
                            emoticonDrawIndex = emoticonDrawIndex + 1
                            currentStaticIndex = currentStaticIndex + 1
                          end
                        end
                        do
                          if emoNum ~= emoticonTotalSplitCount then
                            msgData = emoticonMsgSplit[emoNum]
                            local msgDataLen = (string.len)(msgData)
                            local ispreEmoticonIndex = currentStaticIndex
                            while 1 do
                              if msgDataLen > 0 then
                                chatting_contents[currentStaticIndex] = poolCurrentUI:newChattingContents()
                                ;
                                (chatting_contents[currentStaticIndex]):SetFontColor(msgColor)
                                local textStaticSizeX = panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX()
                                local textStaticPosX = chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
                                local j = 1
                                local isWhile = false
                                while 1 do
                                  if currentStaticIndex >= 1 and (chatting_contents[currentStaticIndex - j]):GetSizeX() < panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX() then
                                    isWhile = true
                                    textStaticSizeX = textStaticSizeX - (chatting_contents[currentStaticIndex - j]):GetSizeX()
                                    textStaticPosX = textStaticPosX + (chatting_contents[currentStaticIndex - j]):GetSizeX()
                                  end
                                  if chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX == (chatting_contents[currentStaticIndex - j]):GetPosX() then
                                    break
                                  end
                                  j = j + 1
                                end
                                if textStaticSizeX == 0 or isWhile == false then
                                  textStaticSizeX = panelSizeX - chatting_Icon:GetTextSizeX() - chatting_sender:GetTextSizeX()
                                  textStaticPosX = chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
                                end
                                ;
                                (chatting_contents[currentStaticIndex]):SetSize(textStaticSizeX, chatting_sender:GetSizeY())
                                ;
                                (chatting_contents[currentStaticIndex]):SetPosX(textStaticPosX)
                                msg = (chatting_contents[currentStaticIndex]):GetTextLimitWidth(msgData)
                                if isChangeFontSize() then
                                  (chatting_contents[currentStaticIndex]):setChangeFontAfterTransSizeValue(true)
                                end
                                ;
                                (chatting_contents[currentStaticIndex]):SetText(msg)
                                if (string.len)(msg) < (string.len)(msgData) then
                                  local msgStr = (string.sub)(msgData, (string.len)(msg) + 1, (string.len)(msgData))
                                  msgData = msgStr
                                  msgDataLen = (string.len)(msgData)
                                else
                                  do
                                    do
                                      msgDataLen = 0
                                      currentStaticIndex = currentStaticIndex + 1
                                      -- DECOMPILER ERROR at PC3142: LeaveBlock: unexpected jumping out DO_STMT

                                      -- DECOMPILER ERROR at PC3142: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                      -- DECOMPILER ERROR at PC3142: LeaveBlock: unexpected jumping out IF_STMT

                                      -- DECOMPILER ERROR at PC3142: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                      -- DECOMPILER ERROR at PC3142: LeaveBlock: unexpected jumping out IF_STMT

                                    end
                                  end
                                end
                              end
                            end
                            if ispreEmoticonIndex ~= currentStaticIndex then
                              (chatting_contents[currentStaticIndex - 1]):SetSize((chatting_contents[currentStaticIndex - 1]):GetTextSizeX(), chatting_sender:GetSizeY())
                            else
                              ;
                              (chatting_contents[currentStaticIndex - 1]):SetSize((chatting_contents[currentStaticIndex - 1]):GetSizeX(), chatting_sender:GetSizeY())
                            end
                          end
                          do
                            -- DECOMPILER ERROR at PC3166: LeaveBlock: unexpected jumping out DO_STMT

                          end
                        end
                      end
                    end
                    for index = currentStaticIndex - 1, 0, -1 do
                      (chatting_contents[index]):SetPosY(PosY - (chatting_contents[index]):GetSizeY() - (deltaPosY))
                      ;
                      (chatting_contents[index]):SetShow(true)
                      if chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX == (chatting_contents[index]):GetPosX() then
                        PosY = PosY - (chatting_contents[index]):GetSizeY()
                        if index ~= 0 then
                          (chatting_contents[index]):SetPosX(chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX)
                        else
                          ;
                          (chatting_contents[index]):SetPosX(chatting_Icon:GetTextSizeX() + chatting_sender:GetTextSizeX() + chat_contentPosX)
                        end
                      end
                    end
                    do
                      do
                        chatting_Icon:SetPosY(PosY - (deltaPosY))
                        chatting_sender:SetPosY(PosY - (deltaPosY))
                        PosY = PosY - 3
                        if UI_CT.System == chatType or UI_CT.Notice == chatType or isMe then
                          chatting_sender:SetIgnore(true)
                        else
                          chatting_sender:SetIgnore(false)
                        end
                        if UI_CT.Public == chatType then
                          chatting_sender:SetOverFontColor(UI_color.C_FFC4BEBE)
                        else
                          chatting_sender:SetOverFontColor(UI_color.C_FFFFFFFF)
                        end
                        if getEnableSimpleUI() then
                          if cacheSimpleUI then
                            chatting_sender:SetFontAlpha(1)
                            ;
                            (chatting_contents[0]):SetFontAlpha(1)
                            for _,contents in ipairs(chatting_contents) do
                              contents:SetFontAlpha(1)
                            end
                          else
                            do
                              local alphaRate = (math.pow)((math.max)((math.min)(1 - (panelSizeY - (PosY)) / panelSizeY, 1), 0.01), 0.2)
                              chatting_sender:SetFontAlpha(alphaRate)
                              ;
                              (chatting_contents[0]):SetFontAlpha(alphaRate)
                              for _,contents in ipairs(chatting_contents) do
                                contents:SetFontAlpha(alphaRate)
                              end
                              do
                                return PosY - 3
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
          end
        end
      end
    end
  end
end

UiPrivateChatType = function(chatType, chatting_Icon, msgColor, isChatDivision, sender, senderStr)
  -- function num : 0_1 , upvalues : UI_CT
  if UI_CT.Private == chatType then
    chatting_Icon:SetFontColor(msgColor)
    if isChatDivision then
      chatting_Icon:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHATNEW_DIVISION_WHISPER"))
    else
      chatting_Icon:SetText("")
    end
  else
    if UI_CT.System == chatType then
      chatting_Icon:SetFontColor(msgColor)
      chatting_Icon:SetText("")
    else
      if UI_CT.World == chatType then
        chatting_Icon:SetFontColor(msgColor)
        if isChatDivision then
          chatting_Icon:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHATNEW_DIVISION_CHANNEL"))
        else
          chatting_Icon:SetText("")
        end
      else
        if UI_CT.Public == chatType then
          chatting_Icon:SetFontColor(msgColor)
          if isChatDivision then
            chatting_Icon:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHATNEW_DIVISION_NORMAL"))
          else
            chatting_Icon:SetText("")
          end
        else
          if UI_CT.Party == chatType then
            chatting_Icon:SetFontColor(msgColor)
            if isChatDivision then
              chatting_Icon:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHATNEW_DIVISION_PARTY"))
            else
              chatting_Icon:SetText("")
            end
          else
            if UI_CT.Guild == chatType then
              chatting_Icon:SetFontColor(msgColor)
              if isChatDivision then
                chatting_Icon:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHATNEW_DIVISION_GUILD"))
              else
                chatting_Icon:SetText("")
              end
            else
              if UI_CT.WorldWithItem == chatType then
                chatting_Icon:SetFontColor(msgColor)
                if isChatDivision then
                  chatting_Icon:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHATNEW_DIVISION_WORLD"))
                else
                  chatting_Icon:SetText("")
                end
              else
                if UI_CT.Battle == chatType then
                  chatting_Icon:SetFontColor(msgColor)
                  if isChatDivision then
                    chatting_Icon:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHATNEW_DIVISION_COMBAT"))
                    if PAGetString(Defines.StringSheet_GAME, "LUA_CHATNEW_DIVISION_COMBAT") == "[" .. sender .. "]" then
                      senderStr = ": "
                    end
                  else
                    chatting_Icon:SetText("")
                  end
                else
                  if UI_CT.LocalWar == chatType then
                    chatting_Icon:SetFontColor(msgColor)
                    if isChatDivision then
                      chatting_Icon:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHATNEW_DIVISION_LOCALWAR"))
                    else
                      chatting_Icon:SetText("")
                    end
                  else
                    if UI_CT.RolePlay == chatType then
                      chatting_Icon:SetFontColor(msgColor)
                      if isChatDivision then
                        chatting_Icon:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHATNEW_DIVISION_ROLEPLAY"))
                      else
                        chatting_Icon:SetText("")
                      end
                    else
                      if UI_CT.Arsha == chatType then
                        chatting_Icon:SetFontColor(msgColor)
                        if isChatDivision then
                          chatting_Icon:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHATNEW_DIVISION_ARSHA"))
                        else
                          chatting_Icon:SetText("")
                        end
                      else
                        if UI_CT.Team == chatType then
                          chatting_Icon:SetFontColor(msgColor)
                          if isChatDivision then
                            chatting_Icon:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHATNEW_DIVISION_TEAM"))
                          else
                            chatting_Icon:SetText("")
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
      end
    end
  end
end

EmoticonMsgSplit = function(chattingMessage, emoticonMsgSplit, emoticonSplitCount, emoticonTotalSplitCount, emoticonSplitStart, isfristin)
  -- function num : 0_2
  for emoticonNumber = 1, emoticonCount + 1 do
    -- DECOMPILER ERROR at PC29: Unhandled construct in 'MakeBoolean' P1

    if emoticonNumber == emoticonCount + 1 and chattingMessage:getEmoticonIndex(emoticonNumber - 2) < (string.len)(msg) - 1 then
      emoticonMsgSplit[emoticonTotalSplitCount - 1] = (string.sub)(msg, emoticonSplitStart + 1, (string.len)(msg))
    end
    if chattingMessage:getEmoticonIndex(emoticonNumber - 1) == 0 then
      emoticonSplitCount[1] = emoticonSplitCount[1] + 1
    else
      if (string.len)(msg) == chattingMessage:getEmoticonIndex(emoticonNumber - 1) then
        if isfristin then
          emoticonMsgSplit[emoticonTotalSplitCount - 1] = (string.sub)(msg, emoticonSplitStart + 1, chattingMessage:getEmoticonIndex(emoticonNumber - 1))
          isfristin = false
        end
        emoticonSplitCount[emoticonTotalSplitCount] = emoticonSplitCount[emoticonTotalSplitCount] + 1
      else
        if chattingMessage:getEmoticonIndex(emoticonNumber - 1) - emoticonSplitStart > 1 then
          emoticonMsgSplit[emoticonTotalSplitCount - 1] = (string.sub)(msg, emoticonSplitStart + 1, chattingMessage:getEmoticonIndex(emoticonNumber - 1))
          emoticonSplitCount[emoticonTotalSplitCount] = emoticonSplitCount[emoticonTotalSplitCount] + 1
          emoticonTotalSplitCount = emoticonTotalSplitCount + 1
          emoticonSplitStart = chattingMessage:getEmoticonIndex(emoticonNumber - 1)
        else
          emoticonSplitCount[emoticonTotalSplitCount - 1] = emoticonSplitCount[emoticonTotalSplitCount - 1] + 1
        end
      end
    end
  end
end


