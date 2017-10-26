-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\chatting\createchattingcontent.luac 

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
local LinkedGuildCache = nil
local GradeTypeCount = 5
ConvertFromItemGradeColor = function(nameColorGrade)
  -- function num : 0_0 , upvalues : UI_color
  if nameColorGrade == 0 then
    return 4293388263
  else
    if nameColorGrade == 1 then
      return 4288921664
    else
      if nameColorGrade == 2 then
        return 4283938018
      else
        if nameColorGrade == 3 then
          return 4293904710
        else
          if nameColorGrade == 4 then
            return 4294929482
          else
            return UI_color.C_FFFFFFFF
          end
        end
      end
    end
  end
end

Chatnew_CreateChattingContent = function(chattingMessage, poolCurrentUI, PosY, messageIndex, panelIndex, deltascrollPosy, cacheSimpleUI, chattingUpTime)
  -- function num : 0_1 , upvalues : UI_CT, UI_CST, LinkedGuildCache, UI_TM, UI_color
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
  local isLinkedGuild = chattingMessage:isLinkedGuild()
  local isLinkedWebSite = chattingMessage:isLinkedWebsite()
  local isLinkedMentalCard = chattingMessage:isLinkedMentalCard()
  local chatting_Icon = poolCurrentUI:newChattingIcon()
  local chatting_GuildMark = poolCurrentUI:newChattingGuildMark()
  local chatting_sender = poolCurrentUI:newChattingSender(messageIndex)
  local isDev = ToClient_IsDevelopment()
  local chatting_contents = {}
  local chatSystemType = chattingMessage.chatSystemType
  local isChatDivision = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListBool((CppEnums.GlobalUIOptionType).ChatDivision)
  local emoticonCount = chattingMessage:getEmoticonCount()
  local chattingatCount = chattingMessage:getChattingAtCount()
  local reciver = (getSelfPlayer()):getName()
  local itemGradeType = chattingMessage:getItemGradeType()
  local itemGradeColor = ConvertFromItemGradeColor(itemGradeType)
  local itemIconPath = chattingMessage:getIconPath()
  local mentalCardKey = chattingMessage:getMantalCardKey()
  if isGameManager == true and not isDev then
    msgColor = 4282515258
  end
  if chatting_sender == nil then
    return PosY
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
      else
        if UI_CT.Battle == chatType then
          sender = PAGetString(Defines.StringSheet_GAME, "CHATTING_BATTLE")
        end
      end
    end
    local senderStr = " [" .. sender .. "] : "
    if UI_CT.Private == chatType then
      if not isMe then
        senderStr = "�\128 " .. senderStr
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
    chatting_sender:SetText(senderStr)
    chatting_Icon:SetSize(chatting_sender:GetTextSizeY() * 2.5 + 5, chatting_sender:GetTextSizeY() + 4)
    UiPrivateChatType(chatType, chatting_Icon, msgColor, isChatDivision, sender, senderStr, poolCurrentUI, noticeType)
    chatting_Icon:ComputePos()
    local chat_contentAddPosX = 0
    if chatting_Icon:GetShow() == true then
      chat_contentAddPosX = 15
      chatting_sender:SetPosX(chatting_Icon:GetSizeX())
    else
      chat_contentAddPosX = 10
      chatting_sender:SetPosX(chat_contentAddPosX)
    end
    chatting_Icon:SetPosX(10)
    chatting_sender:SetTextHorizonRight()
    chatting_sender:SetAutoResize(true)
    chatting_sender:SetFontColor(msgColor)
    chatting_sender:SetText(senderStr)
    if UI_CT.System == chatType or UI_CT.Battle == chatType then
      chatting_sender:SetText(" ")
    end
    chatting_sender:SetSize(chatting_sender:GetTextSizeX(), chatting_sender:GetTextSizeY())
    chatting_sender:SetShow(true)
    local chat_contentPosX = 0
    if chatting_Icon:GetShow() == true then
      chat_contentPosX = 15
      chatting_sender:SetPosX(chatting_Icon:GetSizeX() + chat_contentPosX)
    else
      chat_contentPosX = 10
      chatting_sender:SetPosX(chat_contentPosX)
    end
    chatting_Icon:SetPosY()
    LinkedGuildCache = nil
    local guildMarkAdjY = 2
    local guildMarkSize = 0
    if isLinkedGuild == true then
      local guildMarkPureSize = chatting_sender:GetTextSizeY() + 4
      local guildMarkMarginWidth = 8
      guildMarkSize = guildMarkPureSize + guildMarkMarginWidth
      chatting_GuildMark:SetShow(true)
      chatting_GuildMark:SetSize(guildMarkPureSize, guildMarkPureSize)
      chatting_GuildMark:SetPosX(chatting_sender:GetPosX() + chatting_sender:GetTextSizeX() + guildMarkMarginWidth / 2)
      local linkedGuildInfo = chattingMessage:getLinkedGuildInfo()
      local guildNo = linkedGuildInfo:getGuildNo()
      local isSet = setGuildTextureByGuildNo(guildNo, chatting_GuildMark)
      if isSet == false then
        chatting_GuildMark:ChangeTextureInfoName("New_UI_Common_forLua/Default/BlankGuildMark.dds")
      end
      chatting_GuildMark:setRenderTexture(chatting_GuildMark:getBaseTexture())
    end
    do
      local contentindex = 1
      local textStaticSizeX = panelSizeX - chatting_Icon:GetSizeX() - chatting_sender:GetTextSizeX()
      local textStaticPosX = chatting_Icon:GetSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
      local msgstartindex = 0
      local checkFinishItemWebSite = false
      local atStart = 1000000
      local atEnd = -1
      local chattingatNum = 1
      local isChattingAt = false
      if chattingatCount ~= 0 then
        atStart = chattingMessage:getChattingAtStartIndex(chattingatNum - 1)
        atEnd = chattingMessage:getChattingAtEndIndex(chattingatNum - 1)
        isChattingAt = true
      end
      local LinkeditemStart = 1000000
      local LinkeditemEnd = -1
      if isLinkedItem then
        LinkeditemStart = chattingMessage:getLinkedItemStartIndex()
        LinkeditemEnd = chattingMessage:getLinkedItemEndIndex()
        checkFinishItemWebSite = true
      end
      local LinkedguildStart = 1000000
      local LinkedguildEnd = -1
      if isLinkedGuild then
        LinkedguildStart = chattingMessage:getLinkedGuildStartIndex()
        LinkedguildEnd = chattingMessage:getLinkedGuildEndIndex()
        checkFinishItemWebSite = true
      end
      local LinkedwebStart = 1000000
      local LinkedwebEnd = -1
      if isLinkedWebSite then
        LinkedwebStart = chattingMessage:getLinkedWebsiteStartIndex()
        LinkedwebEnd = chattingMessage:getLinkedWebsiteEndIndex()
        checkFinishItemWebSite = true
      end
      local j = 1
      local isWhile = false
      local checkitemwebat = 0
      local emoticonContentIndex = -1
      if emoticonCount ~= 0 then
        local emoNum = 1
        while 1 do
          while 1 do
            while 1 do
              if emoNum <= emoticonCount then
                local emoticonindex = chattingMessage:getEmoticonIndex(emoNum - 1)
                if msgstartindex == emoticonindex then
                  emoticonContentIndex = contentindex
                  chatting_contents[contentindex] = poolCurrentUI:newChattingEmoticon()
                  if itemIconPath ~= nil then
                    if isLinkedMentalCard == false then
                      (chatting_contents[contentindex]):ChangeTextureInfoName("Icon/" .. itemIconPath)
                    else
                      ;
                      (chatting_contents[contentindex]):ChangeTextureInfoName(itemIconPath)
                    end
                  else
                    ;
                    (chatting_contents[contentindex]):ChangeTextureInfoName(chattingMessage:getEmoticonPath(emoNum - 1))
                    local startX = (chattingMessage:getEmoticonUV(emoNum - 1)).x
                    local startY = (chattingMessage:getEmoticonUV(emoNum - 1)).y
                    local sizeX = (chattingMessage:getEmoticonSize(emoNum - 1)).x
                    local sizeY = (chattingMessage:getEmoticonSize(emoNum - 1)).y
                    ;
                    ((chatting_contents[contentindex]):getBaseTexture()):setUV(startX, startY, startX + sizeX, startY + sizeY)
                    ;
                    (chatting_contents[contentindex]):setRenderTexture((chatting_contents[contentindex]):getBaseTexture())
                  end
                  do
                    ;
                    (chatting_contents[contentindex]):SetShow(true)
                    j = 1
                    isWhile = false
                    textStaticSizeX = panelSizeX - chatting_Icon:GetSizeX() - chatting_sender:GetTextSizeX()
                    textStaticPosX = chatting_Icon:GetSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
                    while 1 do
                      if contentindex > 1 and (chatting_contents[contentindex - j]):GetSizeX() < panelSizeX - chatting_Icon:GetSizeX() - chatting_sender:GetTextSizeX() then
                        isWhile = true
                        textStaticSizeX = textStaticSizeX - (chatting_contents[contentindex - j]):GetSizeX()
                        textStaticPosX = textStaticPosX + (chatting_contents[contentindex - j]):GetSizeX()
                      end
                      if (chatting_contents[contentindex - j]):GetPosX() <= chatting_Icon:GetSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX then
                        break
                      end
                      j = j + 1
                    end
                    if textStaticSizeX <= 0 or isWhile == false then
                      textStaticSizeX = panelSizeX - chatting_Icon:GetSizeX() - chatting_sender:GetTextSizeX()
                      textStaticPosX = chatting_Icon:GetSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
                    end
                    ;
                    (chatting_contents[contentindex]):SetSize(chatting_sender:GetSizeY() + 4, chatting_sender:GetSizeY() + 4)
                    ;
                    (chatting_contents[contentindex]):SetPosX(textStaticPosX)
                    emoNum = emoNum + 1
                    contentindex = contentindex + 1
                    -- DECOMPILER ERROR at PC599: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC599: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC599: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC599: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC599: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
            end
            if isChattingAt == false and isLinkedItem == false and isLinkedGuild == false and isLinkedWebSite == false and isLinkedMentalCard == false then
              local msgData = (string.sub)(msg, msgstartindex + 1, emoticonindex)
              local msgDataLen = (string.len)(msgData)
              local checkmsg = {}
              do
                local ispreEmoticonIndex = contentindex
                while 1 do
                  if msgDataLen > 0 then
                    chatting_contents[contentindex] = poolCurrentUI:newChattingContents()
                    ;
                    (chatting_contents[contentindex]):SetFontColor(msgColor)
                    ;
                    (chatting_contents[contentindex]):SetTextMode(UI_TM.eTextMode_ChattingText)
                    ;
                    (chatting_contents[contentindex]):SetShow(true)
                    textStaticSizeX = panelSizeX - chatting_Icon:GetSizeX() - chatting_sender:GetTextSizeX()
                    textStaticPosX = chatting_Icon:GetSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
                    j = 1
                    isWhile = false
                    while 1 do
                      if contentindex > 1 and (chatting_contents[contentindex - j]):GetSizeX() < panelSizeX - chatting_Icon:GetSizeX() - chatting_sender:GetTextSizeX() then
                        isWhile = true
                        textStaticSizeX = textStaticSizeX - (chatting_contents[contentindex - j]):GetSizeX()
                        textStaticPosX = textStaticPosX + (chatting_contents[contentindex - j]):GetSizeX()
                      end
                      if (chatting_contents[contentindex - j]):GetPosX() <= chatting_Icon:GetSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX then
                        break
                      end
                      j = j + 1
                    end
                    if textStaticSizeX == 0 or isWhile == false then
                      textStaticSizeX = panelSizeX - chatting_Icon:GetSizeX() - chatting_sender:GetTextSizeX()
                      textStaticPosX = chatting_Icon:GetSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
                    end
                    ;
                    (chatting_contents[contentindex]):SetSize(textStaticSizeX, chatting_sender:GetSizeY())
                    ;
                    (chatting_contents[contentindex]):SetPosX(textStaticPosX)
                    checkmsg = (chatting_contents[contentindex]):GetTextLimitWidth(msgData)
                    if isChangeFontSize() then
                      (chatting_contents[contentindex]):setChangeFontAfterTransSizeValue(true)
                    end
                    ;
                    (chatting_contents[contentindex]):SetText(checkmsg)
                    ;
                    (chatting_contents[contentindex]):SetPosY(PosY - (chatting_contents[contentindex]):GetSizeY() - (deltaPosY))
                    if (string.len)(checkmsg) < (string.len)(msgData) then
                      local msgStr = (string.sub)(msgData, (string.len)(checkmsg) + 1, (string.len)(msgData))
                      msgData = msgStr
                      msgDataLen = (string.len)(msgData)
                    else
                      do
                        msgDataLen = 0
                        contentindex = contentindex + 1
                        -- DECOMPILER ERROR at PC777: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC777: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                        -- DECOMPILER ERROR at PC777: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC777: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC777: LeaveBlock: unexpected jumping out IF_STMT

                      end
                    end
                  end
                end
                if ispreEmoticonIndex ~= contentindex then
                  (chatting_contents[contentindex - 1]):SetSize((chatting_contents[contentindex - 1]):GetTextSizeX(), chatting_sender:GetSizeY())
                else
                  ;
                  (chatting_contents[contentindex - 1]):SetSize((chatting_contents[contentindex - 1]):GetSizeX(), chatting_sender:GetSizeY())
                end
                msgstartindex = emoticonindex
                -- DECOMPILER ERROR at PC802: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC802: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
          checkitemwebat = 0
          local drawstart = msgstartindex
          local drawend = emoticonindex
          if isLinkedItem then
            if isChattingAt and chattingatNum <= chattingatCount then
              if LinkeditemStart < chattingMessage:getChattingAtStartIndex(chattingatNum - 1) and checkFinishItemWebSite then
                checkitemwebat = 1
              else
                atStart = chattingMessage:getChattingAtStartIndex(chattingatNum - 1)
                atEnd = chattingMessage:getChattingAtEndIndex(chattingatNum - 1)
                checkitemwebat = 3
              end
            else
              checkitemwebat = 1
            end
            if checkitemwebat == 1 then
              if drawstart <= LinkeditemStart and LinkeditemEnd <= drawend then
                if drawstart == LinkeditemStart then
                  drawend = LinkeditemEnd - 1
                  checkFinishItemWebSite = false
                else
                  drawend = LinkeditemStart - 1
                  checkitemwebat = 0
                end
              else
                checkitemwebat = 0
              end
            else
              if checkitemwebat == 3 then
                if drawstart <= atStart and atEnd <= drawend then
                  if drawstart == atStart then
                    drawend = atEnd - 1
                    chattingatNum = chattingatNum + 1
                  else
                    drawend = atStart - 1
                    checkitemwebat = 0
                  end
                else
                  checkitemwebat = 0
                end
              end
            end
          else
            if isLinkedGuild then
              if isChattingAt and chattingatNum <= chattingatCount then
                if LinkedguildStart < chattingMessage:getChattingAtStartIndex(chattingatNum - 1) and checkFinishItemWebSite then
                  checkitemwebat = 4
                else
                  atStart = chattingMessage:getChattingAtStartIndex(chattingatNum - 1)
                  atend = chattingMessage:getChattingAtEndIndex(chattingatNum - 1)
                  checkitemwebat = 3
                end
              else
                checkitemwebat = 4
              end
              if checkitemwebat == 4 then
                if drawstart <= LinkedguildStart and LinkedguildEnd <= drawend then
                  if drawstart == LinkedguildStart then
                    drawend = LinkedguildEnd - 1
                    checkFinishItemWebSite = false
                  else
                    drawend = LinkedguildStart - 1
                    checkitemwebat = 0
                  end
                else
                  checkitemwebat = 0
                end
              else
                if checkitemwebat == 3 then
                  if drawstart <= atStart and atEnd <= drawend then
                    if drawstart == atStart then
                      drawend = atEnd - 1
                      chattingatNum = chattingatNum + 1
                    else
                      drawend = atStart - 1
                      checkitemwebat = 0
                    end
                  else
                    checkitemwebat = 0
                  end
                end
              end
            else
              if isLinkedWebSite then
                if isChattingAt and chattingatNum <= chattingatCount then
                  if LinkedwebStart < chattingMessage:getChattingAtStartIndex(chattingatNum - 1) and checkFinishItemWebSite then
                    checkitemwebat = 2
                  else
                    atStart = chattingMessage:getChattingAtStartIndex(chattingatNum - 1)
                    atEnd = chattingMessage:getChattingAtEndIndex(chattingatNum - 1)
                    checkitemwebat = 3
                  end
                else
                  checkitemwebat = 2
                end
                if checkitemwebat == 2 then
                  if drawstart <= LinkedwebStart and LinkedwebEnd <= drawend then
                    if drawstart == LinkedwebStart then
                      drawend = LinkedwebEnd - 1
                      checkFinishItemWebSite = false
                    else
                      drawend = LinkedwebStart - 1
                      checkitemwebat = 0
                    end
                  else
                    checkitemwebat = 0
                  end
                else
                  if checkitemwebat == 3 then
                    if drawstart <= atStart and atEnd <= drawend then
                      if drawstart == atStart then
                        drawend = atEnd - 1
                        chattingatNum = chattingatNum + 1
                      else
                        drawend = atStart - 1
                        checkitemwebat = 0
                      end
                    else
                      checkitemwebat = 0
                    end
                  end
                end
              else
                if isLinkedMentalCard then
                  checkitemwebat = 5
                else
                  if isChattingAt and chattingatNum <= chattingatCount then
                    atStart = chattingMessage:getChattingAtStartIndex(chattingatNum - 1)
                    atEnd = chattingMessage:getChattingAtEndIndex(chattingatNum - 1)
                    if drawstart <= atStart and atEnd <= drawend then
                      if drawstart == atStart then
                        drawend = atEnd - 1
                        checkitemwebat = 3
                        chattingatNum = chattingatNum + 1
                      else
                        drawend = atStart - 1
                        checkitemwebat = 0
                      end
                    else
                      checkitemwebat = 0
                    end
                  end
                end
              end
            end
          end
          if emoticonindex ~= drawend then
            drawend = drawend + 1
          end
          local msgData = (string.sub)(msg, msgstartindex + 1, drawend)
          local msgDataLen = (string.len)(msgData)
          local checkmsg = {}
          local ispreEmoticonIndex = contentindex
          local msgCheckSender = (string.sub)(msgData, 2, msgDataLen)
          if reciver ~= msgCheckSender and checkitemwebat == 3 then
            checkitemwebat = 0
          end
          if checkitemwebat == 3 and chattingMessage.isMe then
            checkitemwebat = 0
          end
          if checkitemwebat == 3 and chatType == (CppEnums.ChatType).Private and chattingMessage.isMe == false then
            checkitemwebat = 0
          end
          if UI_CT.Guild == chatType and checkitemwebat == 3 and chattingMessage:getIsChattingAtSound() then
            audioPostEvent_SystemUi(100, 1)
            chattingMessage:setIsChattingAtSound(false)
          end
          while 1 do
            if msgDataLen > 0 then
              if checkitemwebat == 0 then
                chatting_contents[contentindex] = poolCurrentUI:newChattingContents()
                ;
                (chatting_contents[contentindex]):SetFontColor(msgColor)
                ;
                (chatting_contents[contentindex]):SetTextMode(UI_TM.eTextMode_ChattingText)
                ;
                (chatting_contents[contentindex]):SetShow(true)
                ;
                (chatting_contents[contentindex]):SetIgnore(true)
              else
                if checkitemwebat == 1 then
                  chatting_contents[contentindex] = poolCurrentUI:newChattingLinkedItem(messageIndex)
                  ;
                  (chatting_contents[contentindex]):SetFontColor(itemGradeColor)
                  ;
                  (chatting_contents[contentindex]):SetTextMode(UI_TM.eTextMode_ChattingText)
                  ;
                  (chatting_contents[contentindex]):SetIgnore(false)
                else
                  if checkitemwebat == 2 then
                    chatting_contents[contentindex] = poolCurrentUI:newChattingLinkedWebSite(messageIndex)
                    ;
                    (chatting_contents[contentindex]):SetFontColor(UI_color.C_FF00C0D7)
                    ;
                    (chatting_contents[contentindex]):SetTextMode(UI_TM.eTextMode_ChattingText)
                    ;
                    (chatting_contents[contentindex]):SetIgnore(false)
                  else
                    if checkitemwebat == 3 then
                      chatting_contents[contentindex] = poolCurrentUI:newChattingAt(messageIndex)
                      ;
                      (chatting_contents[contentindex]):SetFontColor(UI_color.C_FFF601FF)
                      ;
                      (chatting_contents[contentindex]):SetTextMode(UI_TM.eTextMode_ChattingText)
                      ;
                      (chatting_contents[contentindex]):SetIgnore(false)
                    else
                      if checkitemwebat == 4 then
                        LinkedGuildCache = poolCurrentUI:newChattingLinkedGuild(messageIndex)
                        chatting_contents[contentindex] = LinkedGuildCache
                        ;
                        (chatting_contents[contentindex]):SetFontColor(msgColor)
                        ;
                        (chatting_contents[contentindex]):SetTextMode(UI_TM.eTextMode_ChattingText)
                        ;
                        (chatting_contents[contentindex]):SetIgnore(false)
                      else
                        if checkitemwebat == 5 then
                          chatting_contents[contentindex] = poolCurrentUI:newChattingContents()
                          ;
                          (chatting_contents[contentindex]):SetFontColor(UI_color.C_FFFFFFFF)
                          ;
                          (chatting_contents[contentindex]):SetTextMode(UI_TM.eTextMode_ChattingText)
                          ;
                          (chatting_contents[contentindex]):addInputEvent("Mouse_On", "PaGlobal_HanldeOnOut_MentalCard(" .. contentindex .. ",true )")
                          ;
                          (chatting_contents[contentindex]):addInputEvent("Mouse_Out", "PaGlobal_HanldeOnOut_MentalCard(" .. contentindex .. ",false )")
                          ;
                          (chatting_contents[contentindex]):addInputEvent("Mouse_LUp", "PaGlobal_HandleClicked_MentalCard(" .. chattingMessage:getMantalCardKey() .. ")")
                          ;
                          (chatting_contents[contentindex]):SetShow(true)
                          ;
                          (chatting_contents[contentindex]):SetIgnore(false)
                        end
                      end
                    end
                  end
                end
              end
              local j = 1
              textStaticSizeX = panelSizeX - chatting_Icon:GetSizeX() - chatting_sender:GetTextSizeX()
              textStaticPosX = chatting_Icon:GetSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
              j = 1
              isWhile = false
              while 1 do
                if contentindex > 1 and (chatting_contents[contentindex - j]):GetSizeX() < panelSizeX - chatting_Icon:GetSizeX() - chatting_sender:GetTextSizeX() then
                  isWhile = true
                  textStaticSizeX = textStaticSizeX - (chatting_contents[contentindex - j]):GetSizeX()
                  textStaticPosX = textStaticPosX + (chatting_contents[contentindex - j]):GetSizeX()
                end
                if (chatting_contents[contentindex - j]):GetPosX() <= chatting_Icon:GetSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX then
                  break
                end
                j = j + 1
              end
              if textStaticSizeX == 0 or isWhile == false then
                textStaticSizeX = panelSizeX - chatting_Icon:GetSizeX() - chatting_sender:GetTextSizeX()
                textStaticPosX = chatting_Icon:GetSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
              end
              ;
              (chatting_contents[contentindex]):SetSize(textStaticSizeX, chatting_sender:GetSizeY())
              ;
              (chatting_contents[contentindex]):SetPosX(textStaticPosX)
              checkmsg = (chatting_contents[contentindex]):GetTextLimitWidth(msgData)
              if isChangeFontSize() then
                (chatting_contents[contentindex]):setChangeFontAfterTransSizeValue(true)
              end
              ;
              (chatting_contents[contentindex]):SetText(checkmsg)
              ;
              (chatting_contents[contentindex]):SetPosY(PosY - (chatting_contents[contentindex]):GetSizeY() - (deltaPosY))
              if (string.len)(checkmsg) < (string.len)(msgData) then
                local msgStr = (string.sub)(msgData, (string.len)(checkmsg) + 1, (string.len)(msgData))
                msgData = msgStr
                msgDataLen = (string.len)(msgData)
              else
                do
                  do
                    msgDataLen = 0
                    contentindex = contentindex + 1
                    -- DECOMPILER ERROR at PC1365: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC1365: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC1365: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC1365: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC1365: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
            end
          end
          if ispreEmoticonIndex ~= contentindex then
            (chatting_contents[contentindex - 1]):SetSize((chatting_contents[contentindex - 1]):GetTextSizeX(), chatting_sender:GetSizeY())
          else
            ;
            (chatting_contents[contentindex - 1]):SetSize((chatting_contents[contentindex - 1]):GetSizeX(), chatting_sender:GetSizeY())
          end
          msgstartindex = drawend
        end
        do
          chatting_contents = CreateContentWithMsgLength(reciver, poolCurrentUI, chatType, chattingMessage, isChattingAt, isLinkedItem, isLinkedGuild, isLinkedWebSite, isLinkedMentalCard, contentindex, chatting_contents, chatting_Icon, chatting_sender, msg, msgColor, msgstartindex, panelSizeX, chattingatNum, chattingatCount, checkFinishItemWebSite, messageIndex, itemGradeColor)
          do
            local isPrevContent = false
            for index = contentindex - 1, 1, -1 do
              if index < emoticonContentIndex then
                isPrevContent = true
              end
            end
            for index = contentindex - 1, 1, -1 do
              if emoticonContentIndex < index then
                if isPrevContent == false then
                  (chatting_contents[index]):SetPosY(PosY - (chatting_contents[index]):GetSizeY() - (deltaPosY) - 2.5)
                  ;
                  (chatting_contents[index]):SetShow(true)
                else
                  ;
                  (chatting_contents[index]):SetPosY(PosY - (chatting_contents[index]):GetSizeY() - (deltaPosY))
                  ;
                  (chatting_contents[index]):SetShow(true)
                end
              else
                if emoticonContentIndex == index then
                  if isPrevContent == false then
                    (chatting_contents[index]):SetPosY(PosY - (chatting_contents[index]):GetSizeY() - (deltaPosY) + 2.5)
                    ;
                    (chatting_contents[index]):SetShow(true)
                  else
                    ;
                    (chatting_contents[index]):SetPosY(PosY - (chatting_contents[index]):GetSizeY() - (deltaPosY) + 4)
                    ;
                    (chatting_contents[index]):SetShow(true)
                  end
                else
                  if index < emoticonContentIndex then
                    (chatting_contents[index]):SetPosY(PosY - (chatting_contents[index]):GetSizeY() - (deltaPosY))
                    ;
                    (chatting_contents[index]):SetShow(true)
                  end
                end
              end
              if (chatting_contents[index]):GetPosX() <= chatting_Icon:GetSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX then
                PosY = PosY - (chatting_contents[index]):GetSizeY()
                if index ~= 1 then
                  (chatting_contents[index]):SetPosX(chatting_Icon:GetSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX)
                end
              end
            end
            chatting_Icon:SetPosY(PosY - (deltaPosY))
            chatting_sender:SetPosY(PosY - (deltaPosY))
            chatting_GuildMark:SetPosY(PosY - (deltaPosY) - guildMarkAdjY)
            PosY = PosY - 3
            -- DECOMPILER ERROR at PC1570: Overwrote pending register: R43 in 'AssignReg'

            chatting_contents = CreateContentWithMsgLength(reciver, poolCurrentUI, chatType, chattingMessage, isChattingAt, isLinkedItem, isLinkedGuild, isLinkedWebSite, isLinkedMentalCard, contentindex, chatting_contents, chatting_Icon, chatting_sender, msg, msgColor, msgstartindex, panelSizeX, chattingatNum, chattingatCount, true, messageIndex, itemGradeColor)
            for index = contentindex - 1, 1, -1 do
              (chatting_contents[index]):SetPosY(PosY - (chatting_contents[index]):GetSizeY() - (deltaPosY))
              ;
              (chatting_contents[index]):SetShow(true)
              if (chatting_contents[index]):GetPosX() <= chatting_Icon:GetSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX then
                PosY = PosY - (chatting_contents[index]):GetSizeY()
                if index ~= 1 then
                  (chatting_contents[index]):SetPosX(chatting_Icon:GetSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX)
                end
              end
            end
            chatting_Icon:SetPosY(PosY - (deltaPosY))
            chatting_sender:SetPosY(PosY - (deltaPosY))
            chatting_GuildMark:SetPosY(PosY - (deltaPosY) - guildMarkAdjY)
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
            if emoticonCount == 0 and getEnableSimpleUI() then
              if cacheSimpleUI then
                chatting_sender:SetFontAlpha(1)
                for _,contents in ipairs(chatting_contents) do
                  contents:SetFontAlpha(1)
                end
              else
                do
                  local alphaRate = (math.pow)((math.max)((math.min)(1 - (panelSizeY - (PosY)) / panelSizeY, 1), 0.01), 0.2)
                  chatting_sender:SetFontAlpha(alphaRate)
                  for _,contents in ipairs(chatting_contents) do
                    contents:SetFontAlpha(alphaRate)
                  end
                  do
                    if LinkedGuildCache ~= nil then
                      LinkedGuildCache:SetPosX(LinkedGuildCache:GetPosX() + (guildMarkSize))
                      LinkedGuildCache:SetFontColor(UI_color.C_FF84FFF5)
                    end
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

UiPrivateChatType = function(chatType, chatting_Icon, msgColor, isChatDivision, sender, senderStr, poolCurrentUI, noticeType)
  -- function num : 0_2 , upvalues : UI_CT
  local chattingIconIdx = poolCurrentUI:getCurrentChattingIconIndex()
  if UI_CT.Private == chatType then
    if isChatDivision then
      local x1, y1, x2, y2 = setTextureUV_Func(chatting_Icon, 0, 24, 54, 48)
      ;
      (chatting_Icon:getBaseTexture()):setUV(x1, y1, x2, y2)
      chatting_Icon:setRenderTexture(chatting_Icon:getBaseTexture())
    else
      do
        chatting_Icon:SetSize(0, chatting_Icon:GetSizeY())
        chatting_Icon:SetShow(false)
        if UI_CT.Notice == chatType then
          if isChatDivision then
            local x1, y1, x2, y2 = setTextureUV_Func(chatting_Icon, 108, 0, 162, 24)
            ;
            (chatting_Icon:getBaseTexture()):setUV(x1, y1, x2, y2)
            chatting_Icon:setRenderTexture(chatting_Icon:getBaseTexture())
          else
            do
              chatting_Icon:SetSize(0, chatting_Icon:GetSizeY())
              chatting_Icon:SetShow(false)
              if UI_CT.System == chatType then
                local x1, y1, x2, y2 = setTextureUV_Func(chatting_Icon, 54, 72, 108, 96)
                ;
                (chatting_Icon:getBaseTexture()):setUV(x1, y1, x2, y2)
                chatting_Icon:setRenderTexture(chatting_Icon:getBaseTexture())
              else
                do
                  if UI_CT.World == chatType then
                    if isChatDivision then
                      local x1, y1, x2, y2 = setTextureUV_Func(chatting_Icon, 0, 72, 54, 96)
                      ;
                      (chatting_Icon:getBaseTexture()):setUV(x1, y1, x2, y2)
                      chatting_Icon:setRenderTexture(chatting_Icon:getBaseTexture())
                    else
                      do
                        chatting_Icon:SetSize(0, chatting_Icon:GetSizeY())
                        chatting_Icon:SetShow(false)
                        if UI_CT.Public == chatType then
                          if isChatDivision then
                            local x1, y1, x2, y2 = setTextureUV_Func(chatting_Icon, 0, 0, 54, 24)
                            ;
                            (chatting_Icon:getBaseTexture()):setUV(x1, y1, x2, y2)
                            chatting_Icon:setRenderTexture(chatting_Icon:getBaseTexture())
                          else
                            do
                              chatting_Icon:SetSize(0, chatting_Icon:GetSizeY())
                              chatting_Icon:SetShow(false)
                              if UI_CT.Party == chatType then
                                if isChatDivision then
                                  local x1, y1, x2, y2 = setTextureUV_Func(chatting_Icon, 0, 48, 54, 72)
                                  ;
                                  (chatting_Icon:getBaseTexture()):setUV(x1, y1, x2, y2)
                                  chatting_Icon:setRenderTexture(chatting_Icon:getBaseTexture())
                                else
                                  do
                                    chatting_Icon:SetSize(0, chatting_Icon:GetSizeY())
                                    chatting_Icon:SetShow(false)
                                    if UI_CT.Guild == chatType then
                                      if isChatDivision then
                                        local x1, y1, x2, y2 = setTextureUV_Func(chatting_Icon, 108, 72, 162, 96)
                                        ;
                                        (chatting_Icon:getBaseTexture()):setUV(x1, y1, x2, y2)
                                        chatting_Icon:setRenderTexture(chatting_Icon:getBaseTexture())
                                      else
                                        do
                                          chatting_Icon:SetSize(0, chatting_Icon:GetSizeY())
                                          chatting_Icon:SetShow(false)
                                          if UI_CT.WorldWithItem == chatType then
                                            if isChatDivision then
                                              local x1, y1, x2, y2 = setTextureUV_Func(chatting_Icon, 108, 24, 162, 48)
                                              ;
                                              (chatting_Icon:getBaseTexture()):setUV(x1, y1, x2, y2)
                                              chatting_Icon:setRenderTexture(chatting_Icon:getBaseTexture())
                                            else
                                              do
                                                chatting_Icon:SetSize(0, chatting_Icon:GetSizeY())
                                                chatting_Icon:SetShow(false)
                                                if UI_CT.Battle == chatType then
                                                  if isChatDivision then
                                                    local x1, y1, x2, y2 = setTextureUV_Func(chatting_Icon, 0, 96, 54, 120)
                                                    ;
                                                    (chatting_Icon:getBaseTexture()):setUV(x1, y1, x2, y2)
                                                    chatting_Icon:setRenderTexture(chatting_Icon:getBaseTexture())
                                                  else
                                                    do
                                                      chatting_Icon:SetShow(false)
                                                      chatting_Icon:SetSize(0, chatting_Icon:GetSizeY())
                                                      if UI_CT.LocalWar == chatType then
                                                        if isChatDivision then
                                                          local x1, y1, x2, y2 = setTextureUV_Func(chatting_Icon, 108, 48, 162, 72)
                                                          ;
                                                          (chatting_Icon:getBaseTexture()):setUV(x1, y1, x2, y2)
                                                          chatting_Icon:setRenderTexture(chatting_Icon:getBaseTexture())
                                                        else
                                                          do
                                                            chatting_Icon:SetShow(false)
                                                            chatting_Icon:SetSize(0, chatting_Icon:GetSizeY())
                                                            if UI_CT.RolePlay == chatType then
                                                              if isChatDivision then
                                                                local x1, y1, x2, y2 = setTextureUV_Func(chatting_Icon, 54, 48, 108, 72)
                                                                ;
                                                                (chatting_Icon:getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                chatting_Icon:setRenderTexture(chatting_Icon:getBaseTexture())
                                                              else
                                                                do
                                                                  chatting_Icon:SetShow(false)
                                                                  chatting_Icon:SetSize(0, chatting_Icon:GetSizeY())
                                                                  if UI_CT.Arsha == chatType then
                                                                    if isChatDivision then
                                                                      local x1, y1, x2, y2 = setTextureUV_Func(chatting_Icon, 54, 0, 108, 24)
                                                                      ;
                                                                      (chatting_Icon:getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                      chatting_Icon:setRenderTexture(chatting_Icon:getBaseTexture())
                                                                    else
                                                                      do
                                                                        chatting_Icon:SetShow(false)
                                                                        chatting_Icon:SetSize(0, chatting_Icon:GetSizeY())
                                                                        if UI_CT.Team == chatType then
                                                                          if isChatDivision then
                                                                            local x1, y1, x2, y2 = setTextureUV_Func(chatting_Icon, 54, 24, 108, 48)
                                                                            ;
                                                                            (chatting_Icon:getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                            chatting_Icon:setRenderTexture(chatting_Icon:getBaseTexture())
                                                                          else
                                                                            do
                                                                              chatting_Icon:SetShow(false)
                                                                              chatting_Icon:SetSize(0, chatting_Icon:GetSizeY())
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
            end
          end
        end
      end
    end
  end
end

GetMessageFontColor = function(msg, color)
  -- function num : 0_3
  local Message = msg
  if color == nil then
    local fontColor = ""
    while 1 do
      while 1 do
        while 1 do
          if (string.len)(Message) > 0 then
            local startIdx, endIdx = (string.find)(Message, "<PAColor")
            if startIdx ~= nil and endIdx ~= nil then
              local tempIdx, destIdx = (string.find)(Message, "<PAOldColor>")
              if tempIdx ~= nil and destIdx ~= nil then
                Message = (string.sub)(Message, destIdx + 1, (string.len)(Message))
                -- DECOMPILER ERROR at PC38: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC38: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC38: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC38: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC38: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC38: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
        fontColor = (string.sub)(Message, startIdx, endIdx + 11)
        return fontColor
      end
      do
        do
          do return nil end
          -- DECOMPILER ERROR at PC50: LeaveBlock: unexpected jumping out DO_STMT

        end
      end
    end
    return nil
  else
    do
      local startIdx, endIdx = (string.find)(Message, "<PAOldColor>")
      if startIdx ~= nil and endIdx ~= nil then
        Message = (string.sub)(Message, endIdx + 1, (string.len)(Message))
        return GetMessageFontColor(Message, nil)
      else
        return color
      end
    end
  end
end

CreateContentWithMsgLength = function(reciver, poolCurrentUI, chatType, chattingMessage, isChattingAt, isLinkedItem, isLinkedGuild, isLinkedWebSite, isLinkedMentalCard, contentindex, chatting_contents, chatting_Icon, chatting_sender, msg, msgColor, msgstartindex, panelSizeX, chattingatNum, chattingatCount, isFinishItemWebSite, messageIndex, itemGradeColor)
  -- function num : 0_4 , upvalues : UI_TM, UI_CT, UI_color, LinkedGuildCache
  local checkFinishItemWebSite = false
  local atStart = 1000000
  local atEnd = -1
  local isChattingAt = false
  chattingatCount = chattingMessage:getChattingAtCount()
  if chattingatCount ~= 0 then
    atStart = chattingMessage:getChattingAtStartIndex(chattingatNum - 1)
    atEnd = chattingMessage:getChattingAtEndIndex(chattingatNum - 1)
    isChattingAt = true
  end
  local LinkeditemStart = 1000000
  local LinkeditemEnd = -1
  if isLinkedItem then
    LinkeditemStart = chattingMessage:getLinkedItemStartIndex()
    LinkeditemEnd = chattingMessage:getLinkedItemEndIndex()
    checkFinishItemWebSite = true
  end
  local LinkedguildStart = 10000
  local LinkedguildEnd = -1
  if isLinkedGuild then
    LinkedguildStart = chattingMessage:getLinkedGuildStartIndex()
    LinkedguildEnd = chattingMessage:getLinkedGuildEndIndex()
    checkFinishItemWebSite = true
  end
  local LinkedwebStart = 1000000
  local LinkedwebEnd = -1
  if isLinkedWebSite then
    LinkedwebStart = chattingMessage:getLinkedWebsiteStartIndex()
    LinkedwebEnd = chattingMessage:getLinkedWebsiteEndIndex()
    checkFinishItemWebSite = true
  end
  if isFinishItemWebSite == false then
    LinkedwebStart = 1
    LinkedwebEnd = 2
    checkFinishItemWebSite = false
  end
  local j = 1
  local isWhile = false
  local textStaticSizeX = 0
  local textStaticPosX = 0
  local chat_contentAddPosX = 0
  if chatting_Icon:GetShow() then
    chat_contentAddPosX = 15
  else
    chat_contentAddPosX = 10
  end
  while 1 do
    while 1 do
      if msgstartindex < (string.len)(msg) then
        if isChattingAt == false and isLinkedItem == false and isLinkedGuild == false and isLinkedWebSite == false and isLinkedMentalCard == false then
          local msgData = (string.sub)(msg, msgstartindex + 1, (string.len)(msg))
          local msgDataLen = (string.len)(msgData)
          local checkmsg = {}
          local ispreEmoticonIndex = contentindex
          do
            local fontColor = nil
            while 1 do
              if msgDataLen > 0 then
                chatting_contents[contentindex] = poolCurrentUI:newChattingContents()
                ;
                (chatting_contents[contentindex]):SetFontColor(msgColor)
                ;
                (chatting_contents[contentindex]):SetTextMode(UI_TM.eTextMode_ChattingText)
                ;
                (chatting_contents[contentindex]):SetShow(true)
                ;
                (chatting_contents[contentindex]):SetIgnore(true)
                textStaticSizeX = panelSizeX - chatting_Icon:GetSizeX() - chatting_sender:GetTextSizeX()
                textStaticPosX = chatting_Icon:GetSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
                j = 1
                isWhile = false
                while 1 do
                  if contentindex > 1 and (chatting_contents[contentindex - j]):GetSizeX() < panelSizeX - chatting_Icon:GetSizeX() - chatting_sender:GetTextSizeX() then
                    isWhile = true
                    textStaticSizeX = textStaticSizeX - (chatting_contents[contentindex - j]):GetSizeX()
                    textStaticPosX = textStaticPosX + (chatting_contents[contentindex - j]):GetSizeX()
                  end
                  if (chatting_contents[contentindex - j]):GetPosX() <= chatting_Icon:GetSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX then
                    break
                  end
                  j = j + 1
                end
                if textStaticSizeX == 0 or isWhile == false then
                  textStaticSizeX = panelSizeX - chatting_Icon:GetSizeX() - chatting_sender:GetTextSizeX()
                  textStaticPosX = chatting_Icon:GetSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
                end
                ;
                (chatting_contents[contentindex]):SetSize(textStaticSizeX, chatting_sender:GetSizeY())
                ;
                (chatting_contents[contentindex]):SetPosX(textStaticPosX)
                checkmsg = (chatting_contents[contentindex]):GetTextLimitWidth(msgData)
                if isChangeFontSize() then
                  (chatting_contents[contentindex]):setChangeFontAfterTransSizeValue(true)
                end
                ;
                (chatting_contents[contentindex]):SetText(checkmsg)
                if fontColor ~= nil then
                  (chatting_contents[contentindex]):SetText((string.format)("%s%s", fontColor, checkmsg))
                else
                  ;
                  (chatting_contents[contentindex]):SetText(checkmsg)
                end
                fontColor = GetMessageFontColor(checkmsg, fontColor)
                if (string.len)(checkmsg) < (string.len)(msgData) then
                  local msgStr = (string.sub)(msgData, (string.len)(checkmsg) + 1, (string.len)(msgData))
                  msgData = msgStr
                  msgDataLen = (string.len)(msgData)
                else
                  do
                    msgDataLen = 0
                    contentindex = contentindex + 1
                    -- DECOMPILER ERROR at PC272: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC272: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC272: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC272: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC272: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
            end
            if ispreEmoticonIndex ~= contentindex then
              (chatting_contents[contentindex - 1]):SetSize((chatting_contents[contentindex - 1]):GetTextSizeX(), chatting_sender:GetSizeY())
            else
              ;
              (chatting_contents[contentindex - 1]):SetSize((chatting_contents[contentindex - 1]):GetSizeX(), chatting_sender:GetSizeY())
            end
            msgstartindex = (string.len)(msg)
            -- DECOMPILER ERROR at PC301: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC301: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC301: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC301: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
    checkitemwebat = 0
    local drawstart = msgstartindex
    local drawend = (string.len)(msg)
    if isLinkedItem then
      if isChattingAt and chattingatNum <= chattingatCount then
        if LinkeditemStart < chattingMessage:getChattingAtStartIndex(chattingatNum - 1) and checkFinishItemWebSite then
          checkitemwebat = 1
        else
          atStart = chattingMessage:getChattingAtStartIndex(chattingatNum - 1)
          atEnd = chattingMessage:getChattingAtEndIndex(chattingatNum - 1)
          checkitemwebat = 3
        end
      else
        checkitemwebat = 1
      end
      if checkitemwebat == 1 then
        if drawstart <= LinkeditemStart and LinkeditemEnd <= drawend then
          if drawstart == LinkeditemStart then
            drawend = LinkeditemEnd - 1
            checkFinishItemWebSite = false
          else
            drawend = LinkeditemStart - 1
            checkitemwebat = 0
          end
        else
          checkitemwebat = 0
        end
      else
        if checkitemwebat == 3 then
          if drawstart <= atStart and atEnd <= drawend then
            if drawstart == atStart then
              drawend = atEnd - 1
              chattingatNum = chattingatNum + 1
            else
              drawend = atStart - 1
              checkitemwebat = 0
            end
          else
            checkitemwebat = 0
          end
        end
      end
    else
      if isLinkedGuild then
        if isChattingAt and chattingatNum <= chattingatCount then
          if LinkedguildStart < chattingMessage:getChattingAtStartIndex(chattingatNum - 1) and checkFinishItemWebSite then
            checkitemwebat = 4
          else
            atStart = chattingMessage:getChattingAtStartIndex(chattingatNum - 1)
            atEnd = chattingMessage:getChattingAtEndIndex(chattingatNum - 1)
            checkitemwebat = 3
          end
        else
          checkitemwebat = 4
        end
        if checkitemwebat == 4 then
          if drawstart <= LinkedguildStart and LinkedguildEnd <= drawend then
            if drawstart == LinkedguildStart then
              drawend = LinkedguildEnd - 1
              checkFinishItemWebSite = false
            else
              drawend = LinkedguildStart - 1
              checkitemwebat = 0
            end
          else
            checkitemwebat = 0
          end
        else
          if checkitemwebat == 3 then
            if drawstart <= atStart and atEnd <= drawend then
              if drawstart == atStart then
                drawend = atEnd - 1
                chattingatNum = chattingatNum + 1
              else
                drawend = atStart - 1
                checkitemwebat = 0
              end
            else
              checkitemwebat = 0
            end
          end
        end
      else
        if isLinkedWebSite then
          if isChattingAt and chattingatNum <= chattingatCount then
            if LinkedwebStart < chattingMessage:getChattingAtStartIndex(chattingatNum - 1) and checkFinishItemWebSite then
              checkitemwebat = 2
            else
              atStart = chattingMessage:getChattingAtStartIndex(chattingatNum - 1)
              atEnd = chattingMessage:getChattingAtEndIndex(chattingatNum - 1)
              checkitemwebat = 3
            end
          else
            checkitemwebat = 2
          end
          if checkitemwebat == 2 then
            if drawstart <= LinkedwebStart and LinkedwebEnd <= drawend then
              if drawstart == LinkedwebStart then
                drawend = LinkedwebEnd - 1
                checkFinishItemWebSite = false
              else
                drawend = LinkedwebStart - 1
                checkitemwebat = 0
              end
            else
              checkitemwebat = 0
            end
          else
            if checkitemwebat == 3 then
              if drawstart <= atStart and atEnd <= drawend then
                if drawstart == atStart then
                  drawend = atEnd - 1
                  chattingatNum = chattingatNum + 1
                else
                  drawend = atStart - 1
                  checkitemwebat = 0
                end
              else
                checkitemwebat = 0
              end
            end
          end
        else
          if isChattingAt and chattingatNum <= chattingatCount then
            atStart = chattingMessage:getChattingAtStartIndex(chattingatNum - 1)
            atEnd = chattingMessage:getChattingAtEndIndex(chattingatNum - 1)
            if drawstart <= atStart and atEnd <= drawend then
              if drawstart == atStart then
                drawend = atEnd - 1
                checkitemwebat = 3
                chattingatNum = chattingatNum + 1
              else
                drawend = atStart - 1
                checkitemwebat = 0
              end
            else
              checkitemwebat = 0
            end
          else
            if isLinkedMentalCard then
              checkitemwebat = 5
            end
          end
        end
      end
    end
    drawend = drawend + 1
    local msgData = (string.sub)(msg, msgstartindex + 1, drawend)
    local msgDataLen = (string.len)(msgData)
    local checkmsg = {}
    local ispreEmoticonIndex = contentindex
    local msgCheckSender = (string.sub)(msgData, 2, msgDataLen)
    if reciver ~= msgCheckSender and checkitemwebat == 3 then
      checkitemwebat = 0
    end
    if checkitemwebat == 3 and chattingMessage.isMe then
      checkitemwebat = 0
    end
    if checkitemwebat == 3 and chatType == (CppEnums.ChatType).Private and chattingMessage.isMe == false then
      checkitemwebat = 0
    end
    if UI_CT.Guild == chatType and checkitemwebat == 3 and chattingMessage:getIsChattingAtSound() then
      audioPostEvent_SystemUi(100, 1)
      chattingMessage:setIsChattingAtSound(false)
    end
    while 1 do
      if msgDataLen > 0 then
        if checkitemwebat == 0 then
          chatting_contents[contentindex] = poolCurrentUI:newChattingContents()
          ;
          (chatting_contents[contentindex]):SetFontColor(msgColor)
          ;
          (chatting_contents[contentindex]):SetTextMode(UI_TM.eTextMode_ChattingText)
          ;
          (chatting_contents[contentindex]):SetShow(true)
          ;
          (chatting_contents[contentindex]):SetIgnore(true)
        else
          if checkitemwebat == 1 then
            chatting_contents[contentindex] = poolCurrentUI:newChattingLinkedItem(messageIndex)
            ;
            (chatting_contents[contentindex]):SetFontColor(itemGradeColor)
            ;
            (chatting_contents[contentindex]):SetTextMode(UI_TM.eTextMode_ChattingText)
            ;
            (chatting_contents[contentindex]):SetIgnore(false)
          else
            if checkitemwebat == 2 then
              chatting_contents[contentindex] = poolCurrentUI:newChattingLinkedWebSite(messageIndex)
              ;
              (chatting_contents[contentindex]):SetFontColor(UI_color.C_FF00C0D7)
              ;
              (chatting_contents[contentindex]):SetTextMode(UI_TM.eTextMode_ChattingText)
              ;
              (chatting_contents[contentindex]):SetIgnore(false)
            else
              if checkitemwebat == 3 then
                chatting_contents[contentindex] = poolCurrentUI:newChattingAt(messageIndex)
                ;
                (chatting_contents[contentindex]):SetFontColor(UI_color.C_FFF601FF)
                ;
                (chatting_contents[contentindex]):SetTextMode(UI_TM.eTextMode_ChattingText)
                ;
                (chatting_contents[contentindex]):SetIgnore(false)
              else
                if checkitemwebat == 4 then
                  LinkedGuildCache = poolCurrentUI:newChattingLinkedGuild(messageIndex)
                  chatting_contents[contentindex] = LinkedGuildCache
                  ;
                  (chatting_contents[contentindex]):SetFontColor(msgColor)
                  ;
                  (chatting_contents[contentindex]):SetTextMode(UI_TM.eTextMode_ChattingText)
                  ;
                  (chatting_contents[contentindex]):SetIgnore(false)
                else
                  if checkitemwebat == 5 then
                    chatting_contents[contentindex] = poolCurrentUI:newChattingContents()
                    ;
                    (chatting_contents[contentindex]):SetFontColor(UI_color.C_FFFFFFFF)
                    ;
                    (chatting_contents[contentindex]):SetTextMode(UI_TM.eTextMode_ChattingText)
                    ;
                    (chatting_contents[contentindex]):addInputEvent("Mouse_On", "PaGlobal_HanldeOnOut_MentalCard(" .. contentindex .. ",true )")
                    ;
                    (chatting_contents[contentindex]):addInputEvent("Mouse_Out", "PaGlobal_HanldeOnOut_MentalCard(" .. contentindex .. ",false )")
                    ;
                    (chatting_contents[contentindex]):addInputEvent("Mouse_LUp", "PaGlobal_HandleClicked_MentalCard(" .. chattingMessage:getMantalCardKey() .. ")")
                    ;
                    (chatting_contents[contentindex]):SetShow(true)
                    ;
                    (chatting_contents[contentindex]):SetIgnore(false)
                  end
                end
              end
            end
          end
        end
        textStaticSizeX = panelSizeX - chatting_Icon:GetSizeX() - chatting_sender:GetTextSizeX()
        textStaticPosX = chatting_Icon:GetSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
        j = 1
        isWhile = false
        while 1 do
          if contentindex > 1 and chatting_contents[contentindex - j] and (chatting_contents[contentindex - j]):GetSizeX() < panelSizeX - chatting_Icon:GetSizeX() - chatting_sender:GetTextSizeX() then
            isWhile = true
            textStaticSizeX = textStaticSizeX - (chatting_contents[contentindex - j]):GetSizeX()
            textStaticPosX = textStaticPosX + (chatting_contents[contentindex - j]):GetSizeX()
          end
          if (chatting_contents[contentindex - j]):GetPosX() <= chatting_Icon:GetSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX then
            break
          end
          j = j + 1
        end
        if textStaticSizeX == 0 or isWhile == false then
          textStaticSizeX = panelSizeX - chatting_Icon:GetSizeX() - chatting_sender:GetTextSizeX()
          textStaticPosX = chatting_Icon:GetSizeX() + chatting_sender:GetTextSizeX() + chat_contentAddPosX
        end
        ;
        (chatting_contents[contentindex]):SetSize(textStaticSizeX, chatting_sender:GetSizeY())
        ;
        (chatting_contents[contentindex]):SetPosX(textStaticPosX)
        checkmsg = (chatting_contents[contentindex]):GetTextLimitWidth(msgData)
        if isChangeFontSize() then
          (chatting_contents[contentindex]):setChangeFontAfterTransSizeValue(true)
        end
        ;
        (chatting_contents[contentindex]):SetText(checkmsg)
        if (string.len)(checkmsg) < (string.len)(msgData) then
          local msgStr = (string.sub)(msgData, (string.len)(checkmsg) + 1, (string.len)(msgData))
          msgData = msgStr
          msgDataLen = (string.len)(msgData)
        else
          do
            msgDataLen = 0
            contentindex = contentindex + 1
            -- DECOMPILER ERROR at PC905: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC905: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC905: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC905: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC905: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
    if ispreEmoticonIndex ~= contentindex then
      (chatting_contents[contentindex - 1]):SetSize((chatting_contents[contentindex - 1]):GetTextSizeX(), chatting_sender:GetSizeY())
    else
      ;
      (chatting_contents[contentindex - 1]):SetSize((chatting_contents[contentindex - 1]):GetSizeX(), chatting_sender:GetSizeY())
    end
    msgstartindex = drawend
  end
  do
    return chatting_contents, contentindex
  end
end

PaGlobal_HanldeOnOut_MentalCard = function(index, isShow)
  -- function num : 0_5
  if isShow == false then
    TooltipSimple_Hide()
  end
  local control = PaGlobal_getChattingContentsByIndex(index)
  local name = (PAGetString(Defines.StringSheet_GAME, "LUA_CHATTING_MENTALCARD_TOOLTIP_NAME"))
  local desc = nil
  TooltipSimple_Show(control, name, desc)
end

PaGlobal_HandleClicked_MentalCard = function(mentalCardKey)
  -- function num : 0_6
  Panel_Knowledge_Show()
  Panel_Knowledge_SelectAnotherCard(mentalCardKey)
end


