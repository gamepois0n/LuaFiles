-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\gameexit\console\panel_window_gameexit_renew.luac 

-- params : ...
-- function num : 0
local Window_GameExitInfo = {
_ui = {_static_MainBg = (UI.getChildControl)(Panel_Window_GameExit, "Static_MainBg"), _static_titleBar = (UI.getChildControl)(Panel_Window_GameExit, "Static_TitleBar"), _static_Bottom = (UI.getChildControl)(Panel_Window_GameExit, "Static_Bottom"), 
_body = {}
, 
_bottom = {}
}
, 
_config = {_exitType_GameExit = 0, _exitType_CharacterSelect = 1, _exitType_Tray = 2, _exitType_UnTray = 3, _exitType_CharacterSwap = 4, _maxQuestList = 3, _maxJournalList = 3, _maxCharacterSlot = 4}
, _currentExitType = -1, _logoutDelayTime = getLogoutWaitingTime(), _exitTime = -1, _isTakePhoto = false, 
_characterUITable = {}
, 
_currentCharacterInfoTable = {}
, 
_characterInfoTable = {}
, _currentWheelValue = 0, _currentCharacterIndex = -1, _selfPlayerIndex = -1}
PaGlobalFunc_GameExit_workTypeToStringSwap = function(workingType)
  -- function num : 0_0
  local workingText = nil
  if (CppEnums.PcWorkType).ePcWorkType_Empty == workingType then
    workingText = ""
  else
    if (CppEnums.PcWorkType).ePcWorkType_Play == workingType then
      workingText = PAGetString(Defines.StringSheet_GAME, "CHARACTER_WORKING_TEXT_PLAY")
    else
      if (CppEnums.PcWorkType).ePcWorkType_RepairItem == workingType then
        workingText = PAGetString(Defines.StringSheet_GAME, "CHARACTER_WORKING_TEXT_REPAIRITEM")
      else
        if (CppEnums.PcWorkType).ePcWorkType_Relax == workingType then
          workingText = PAGetString(Defines.StringSheet_GAME, "CHARACTER_WORKING_TEXT_RELEX")
        else
          if (CppEnums.PcWorkType).ePcWorkType_ReadBook == workingType then
            workingText = PAGetString(Defines.StringSheet_GAME, "CHARACTER_WORKING_TEXT_READBOOK")
          else
            _PA_ASSERT(false, "캐릭�\176 작업 �\128입이 추가 되었습니�\164. Lobby_New.lua �\132 추가�\180 주어�\188 합니�\164.")
            workingText = "unKnown"
          end
        end
      end
    end
  end
  return workingText
end

Window_GameExitInfo.SetHistory = function(self)
  -- function num : 0_1
  local questList = ((self._ui)._bottom)._staticText_QuestList
  local journalList = ((self._ui)._bottom)._staticText_JournalList
  local selfPlayerAPW = getSelfPlayer()
  if selfPlayerAPW == nil then
    return 
  end
  local qusetListStr = ""
  for index = 0, (self._config)._maxQuestList - 1 do
    local qusetNo = (selfPlayerAPW:get()):getLastCompleteQuest(index)
    local questWrapper = ToClient_getQuestWrapper(qusetNo)
    if questWrapper ~= nil then
      qusetListStr = qusetListStr .. "· " .. questWrapper:getTitle() .. "\n"
    end
  end
  questList:SetShow(true)
  questList:SetText(qusetListStr)
  ToClient_RequestRecentJournalByCount((self._config)._maxJournalList)
  local journalCount = ToClient_GetRecentJournalCount()
  if journalCount == 0 then
    return 
  end
  local journalListStr = ""
  for index = 0, journalCount - 1 do
    local journalWrapper = ToClient_GetRecentJournalByIndex(index)
    if journalWrapper ~= nil then
      journalListStr = journalListStr .. "· " .. "[" .. (string.format)("%.02d", journalWrapper:getJournalHour()) .. ":" .. (string.format)("%.02d", journalWrapper:getJournalMinute()) .. "] " .. journalWrapper:getName() .. "\n"
    end
  end
  journalList:SetShow(true)
  journalList:SetText(journalListStr)
end

Window_GameExitInfo.SetCharacterInfoTable = function(self)
  -- function num : 0_2
  local characterCount = getCharacterDataCount()
  local serverUtc64 = getServerUtc64()
  for index = 0, characterCount - 1 do
    local infoTable = {_remindTime; _classType = -1, _baseTexture = nil, _textureName = nil, _level = -1, _name = "", _location = "", _enchantFailCount = 0, _enchantValksCount = 0, _energy = -1, _condition = "", _isRemoved = false, _isSelfPlayer = false}
    local characterData = getCharacterDataByIndex(index)
    infoTable._classType = getCharacterClassType(characterData)
    infoTable._textureName = getCharacterFaceTextureByIndex(index)
    infoTable._level = characterData._level
    infoTable._name = getCharacterName(characterData)
    infoTable._enchantFailCount = characterData._enchantFailCount
    infoTable._enchantValksCount = characterData._valuePackCount
    infoTable._energy = ToClient_getWpInCharacterDataList(index)
    local pcDeliveryRegionKey = characterData._arrivalRegionKey
    local regionInfo = getRegionInfoByPosition(characterData._currentPosition)
    if (characterData._currentPosition).x == 0 and (characterData._currentPosition).y == 0 and (characterData._currentPosition).z == 0 then
      infoTable._location = ""
    else
      if pcDeliveryRegionKey:get() ~= 0 and characterData._arrivalTime < serverUtc64 then
        local retionInfoArrival = getRegionInfoByRegionKey(pcDeliveryRegionKey)
        infoTable._location = retionInfoArrival:getAreaName()
      else
        do
          infoTable._location = regionInfo:getAreaName()
          if pcDeliveryRegionKey:get() ~= 0 and serverUtc64 < characterData._arrivalTime then
            infoTable._condition = PAGetString(Defines.StringSheet_GAME, "CHARACTER_WORKING_TEXT_DELIVERY")
            infoTable._remindTime = convertStringFromDatetime(characterData._arrivalTime - serverUtc64)
          end
          local removeTime = getCharacterDataRemoveTime(index)
          if removeTime ~= nil then
            infoTable._condition = PAGetString(Defines.StringSheet_GAME, "CHARACTER_DELETING")
            infoTable._isRemoved = true
          end
          do
            local characterNo_64 = (getSelfPlayer()):getCharacterNo_64()
            if characterNo_64 == characterData._characterNo_s64 then
              infoTable._isSelfPlayer = true
              self._selfPlayerIndex = index
            end
            -- DECOMPILER ERROR at PC123: Confused about usage of register: R13 in 'UnsetPending'

            ;
            (self._characterInfoTable)[index] = infoTable
            -- DECOMPILER ERROR at PC124: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC124: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC124: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC124: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC124: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
end

Window_GameExitInfo.SetCharacterSlot = function(self, charInfo, charSlot)
  -- function num : 0_3
  if charInfo == nil or charSlot == nil then
    return false
  end
  for _,control in pairs(charSlot) do
    if control == nil then
      return false
    end
  end
  ;
  (charSlot._staticText_Level):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. charInfo._level)
  ;
  (charSlot._staticText_Name):SetText(charInfo._name)
  ;
  (charSlot._staticText_Location):SetText(charInfo._location)
  ;
  (charSlot._staticText_Energy):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_CHARWP_TITLE") .. " " .. charInfo._energy)
  ;
  (charSlot._staticText_EnchantFailCount):SetText(PAGetString(Defines.StringSheet_GAME, "DIALOG_BUTTON_QUEST_ENCHANT") .. " " .. charInfo._enchantFailCount .. "+" .. charInfo._enchantValksCount)
  ;
  (charSlot._staticText_RemindTime):SetText("")
  if charInfo._remindTime ~= nil then
    (charSlot._staticText_RemindTime):SetText(charInfo._remindTime)
  end
  ;
  (charSlot._staticText_Condtion):SetText(charInfo._condition)
  if _ContentsGroup_isConsolePadControl then
    local isCaptureExist = (charSlot._static_Picture):ChangeTextureInfoNameNotDDS(charInfo._textureName, charInfo._classType, self._isTakePhoto)
    if isCaptureExist == true then
      ((charSlot._static_Picture):getBaseTexture()):setUV(0, 0, 1, 1)
    else
      if _ContentsGroup_isUsedNewCharacterInfo == false then
        if charInfo._classType == (CppEnums.ClassType).ClassType_Warrior then
          (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
          local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 1, 1, 156, 201)
          ;
          ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
          ;
          (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
        else
          do
            if charInfo._classType == (CppEnums.ClassType).ClassType_Ranger then
              (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
              local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 157, 1, 312, 201)
              ;
              ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
              ;
              (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
            else
              do
                if charInfo._classType == (CppEnums.ClassType).ClassType_Sorcerer then
                  (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
                  local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 313, 1, 468, 201)
                  ;
                  ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                  ;
                  (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                else
                  do
                    if charInfo._classType == (CppEnums.ClassType).ClassType_Giant then
                      (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
                      local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 1, 202, 156, 402)
                      ;
                      ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                      ;
                      (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                    else
                      do
                        if charInfo._classType == (CppEnums.ClassType).ClassType_Tamer then
                          (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
                          local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 157, 202, 312, 402)
                          ;
                          ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                          ;
                          (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                        else
                          do
                            if charInfo._classType == (CppEnums.ClassType).ClassType_BladeMaster then
                              (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
                              local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 313, 202, 468, 402)
                              ;
                              ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                              ;
                              (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                            else
                              do
                                if charInfo._classType == (CppEnums.ClassType).ClassType_Valkyrie then
                                  (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                  local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 1, 1, 156, 201)
                                  ;
                                  ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                                  ;
                                  (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                                else
                                  do
                                    if charInfo._classType == (CppEnums.ClassType).ClassType_BladeMasterWomen then
                                      (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                      local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 157, 1, 312, 201)
                                      ;
                                      ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                                      ;
                                      (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                                    else
                                      do
                                        if charInfo._classType == (CppEnums.ClassType).ClassType_Wizard then
                                          (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                          local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 313, 1, 468, 201)
                                          ;
                                          ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                                          ;
                                          (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                                        else
                                          do
                                            if charInfo._classType == (CppEnums.ClassType).ClassType_WizardWomen then
                                              (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                              local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 1, 202, 156, 402)
                                              ;
                                              ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                                              ;
                                              (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                                            else
                                              do
                                                if charInfo._classType == (CppEnums.ClassType).ClassType_NinjaWomen then
                                                  (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                                  local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 157, 202, 312, 402)
                                                  ;
                                                  ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                  ;
                                                  (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                                                else
                                                  do
                                                    if charInfo._classType == (CppEnums.ClassType).ClassType_NinjaMan then
                                                      (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                                      local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 313, 202, 468, 402)
                                                      ;
                                                      ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                      ;
                                                      (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                                                    else
                                                      do
                                                        if charInfo._classType == (CppEnums.ClassType).ClassType_DarkElf then
                                                          (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_02.dds")
                                                          local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 1, 1, 156, 201)
                                                          ;
                                                          ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                          ;
                                                          (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                                                        else
                                                          do
                                                            if charInfo._classType == (CppEnums.ClassType).ClassType_Combattant then
                                                              (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_02.dds")
                                                              local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 157, 1, 312, 201)
                                                              ;
                                                              ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                              ;
                                                              (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                                                            else
                                                              do
                                                                if charInfo._classType == (CppEnums.ClassType).ClassType_CombattantWomen then
                                                                  (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_02.dds")
                                                                  local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 313, 1, 468, 201)
                                                                  ;
                                                                  ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                  ;
                                                                  (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                                                                else
                                                                  do
                                                                    if charInfo._classType == (CppEnums.ClassType).ClassType_Lahn then
                                                                      (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_03.dds")
                                                                      local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 1, 1, 156, 201)
                                                                      ;
                                                                      ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                      ;
                                                                      (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                                                                    else
                                                                      do
                                                                        if charInfo._classType == (CppEnums.ClassType).ClassType_Orange then
                                                                          (charSlot._static_Picture):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_03.dds")
                                                                          local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 1, 1, 156, 201)
                                                                          ;
                                                                          ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                          ;
                                                                          (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                                                                        end
                                                                        do
                                                                          local DefaultFace = (CppEnums.ClassType_DefaultFaceTexture)[charInfo._classType]
                                                                          ;
                                                                          (charSlot._static_Picture):ChangeTextureInfoName(DefaultFace[1])
                                                                          do
                                                                            local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, DefaultFace[2], DefaultFace[3], DefaultFace[4], DefaultFace[5])
                                                                            ;
                                                                            ((charSlot._static_Picture):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                                            ;
                                                                            (charSlot._static_Picture):setRenderTexture((charSlot._static_Picture):getBaseTexture())
                                                                            self._isTakePhoto = false
                                                                            return true
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

PaGlobalFunc_GameExit_SaveCurrentData = function()
  -- function num : 0_4 , upvalues : Window_GameExitInfo
  Window_GameExitInfo:SaveCurrentData()
end

Window_GameExitInfo.SaveCurrentData = function(self)
  -- function num : 0_5
  (getSelfPlayer()):updateNavigationInformation("")
  ;
  (getSelfPlayer()):saveCurrentDataForGameExit()
  ToClient_SaveUiInfo(false)
end

Window_GameExitInfo.ExitToGameOff = function(self)
  -- function num : 0_6
  self:SaveCurrentData()
  local selfPlayerActorProxy = (getSelfPlayer()):get()
  if selfPlayerActorProxy == nil then
    return 
  end
  self._currentExitType = (self._config)._exitType_GameExit
  do
    local regionInfo = getRegionInfoByPosition(selfPlayerActorProxy:getPosition())
    if (regionInfo:get()):isSafeZone() == true then
      self:SetNoticeMsg()
    else
      self:SetNoticeMsg(self._logoutDelayTime)
    end
    sendBeginGameDelayExit((self._config)._exitType_CharacterSwap == self._currentExitType)
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

Window_GameExitInfo.ExitToCharacterSelect = function(self)
  -- function num : 0_7
  self._currentExitType = (self._config)._exitType_CharacterSelect
  self:SaveCurrentData()
  sendCharacterSelect()
  local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
  if (regionInfo:get()):isSafeZone() == true then
    self:SetNoticeMsg()
  else
    self:SetNoticeMsg(self._logoutDelayTime)
  end
end

PaGlobalFunc_GameExit_CharacterSwapConfirm = function()
  -- function num : 0_8 , upvalues : Window_GameExitInfo
  local self = Window_GameExitInfo
  self:SaveCurrentData()
  local rv = swapCharacter_Select(self._currentCharacterIndex, true)
  if rv == false then
    return 
  end
  self._currentExitType = (self._config)._exitType_CharacterSwap
  self:SetNoticeMsg(self._logoutDelayTime)
  if PaGlobal_IsTagChange() == true then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_TAG_CHANGING")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  end
end

PaGlobalFunc_GameExit_UpdatePerFrame = function(deltaTime)
  -- function num : 0_9 , upvalues : Window_GameExitInfo
  local self = Window_GameExitInfo
  if self._exitTime == -1 then
    return 
  end
  self._exitTime = self._exitTime - deltaTime
  self:SetNoticeMsg(Int64toInt32(self._exitTime))
  if self._exitTime >= 0 then
    return 
  end
  self:SetNoticeMsg()
  if (self._config)._exitType_GameExit == self._currentExitType then
    SetUIMode((Defines.UIMode).eUIMode_Default)
    sendGameLogOut()
  end
  self._currentExitType = -1
  self._exitTime = -1
end

PaGlobalFunc_FromClient_GameExit_SetDelayTime = function(delayTime)
  -- function num : 0_10 , upvalues : Window_GameExitInfo
  local self = Window_GameExitInfo
  if PaGlobalFunc_GameExit_GetShow() == false then
    return 
  end
  self._exitTime = delayTime
  self:SetNoticeMsg(delayTime)
end

Window_GameExitInfo.SetNoticeMsg = function(self, delayTime)
  -- function num : 0_11
  local msg = nil
  if delayTime == nil then
    ((self._ui)._button_NoticeMsg):SetIgnore(true)
    if (self._config)._exitType_GameExit == self._currentExitType then
      msg = PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_PROGRESS")
    else
      if (self._config)._exitType_CharacterSelect == self._currentExitType then
        msg = PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_GO_CHARACTERSELECT")
      else
        if (self._config)._exitType_CharacterSwap == self._currentExitType then
          msg = PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_GO_SWAPCHARACTER")
        else
          _PA_LOG("이호�\156", "종료 �\128입이 잘못됐습니다.")
        end
      end
    end
  else
    ;
    ((self._ui)._button_NoticeMsg):SetIgnore(false)
    if (self._config)._exitType_GameExit == self._currentExitType then
      msg = PAGetStringParam1(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_TO_EXIT", "remainTime", tostring(delayTime))
    else
      if (self._config)._exitType_CharacterSelect == self._currentExitType then
        msg = PAGetStringParam1(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_TO_CHARACTER_SELECT", "remainTime", tostring(delayTime))
      else
        if (self._config)._exitType_CharacterSwap == self._currentExitType then
          msg = PAGetStringParam1(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_TO_CHARACTER_CHANGE", "remainTime", tostring(delayTime))
        else
          _PA_LOG("이호�\156", "종료 �\128입이 잘못됐습니다.")
        end
      end
    end
  end
  ;
  ((self._ui)._button_NoticeMsg):SetShow(true)
  ;
  ((self._ui)._button_NoticeMsg):SetText(msg)
end

PaGlobalFunc_GameExit_UpdateCharList = function(value)
  -- function num : 0_12 , upvalues : Window_GameExitInfo
  local self = Window_GameExitInfo
  self:Clear()
  self._currentWheelValue = self._currentWheelValue + value
  if ((self._ui)._button_NoticeMsg):GetShow() == true then
    return 
  end
  if self._currentWheelValue < 0 then
    self._currentWheelValue = 0
  end
  if getCharacterDataCount() < self._currentWheelValue + (self._config)._maxCharacterSlot then
    self._currentWheelValue = self._currentWheelValue - 1
  end
  if getCharacterDataCount() < (self._config)._maxCharacterSlot then
    self._currentWheelValue = 0
  end
  for index = 0, (self._config)._maxCharacterSlot - 1 do
    (((self._characterUITable)[index])._radioButton_CharBg):SetShow(false)
    local isSuccess = self:SetCharacterSlot((self._characterInfoTable)[index + self._currentWheelValue], (self._characterUITable)[index])
    if isSuccess == false then
      return 
    end
    ;
    (((self._characterUITable)[index])._radioButton_CharBg):SetShow(true)
    -- DECOMPILER ERROR at PC69: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self._currentCharacterInfoTable)[index] = (self._characterInfoTable)[index + self._currentWheelValue]
  end
end

PaGlobalFunc_GameExit_ButtonClick_CharacterSwap = function(index)
  -- function num : 0_13 , upvalues : Window_GameExitInfo
  local self = Window_GameExitInfo
  if ((self._ui)._button_NoticeMsg):GetShow() == true then
    return 
  end
  self._currentCharacterIndex = index + self._currentWheelValue
  local charInfo = (self._currentCharacterInfoTable)[index]
  if charInfo == nil then
    return 
  end
  local characterData = getCharacterDataByIndex(self._currentCharacterIndex)
  local classType = charInfo._classType
  if charInfo._isSelfPlayer == true then
    return 
  end
  if ToClient_IsCustomizeOnlyClass(classType) then
    NotifyDisplay(PAGetString(Defines.StringSheet_GAME, "LUA_LOBBY_SELECTCHARACTER_NOTYET_1"))
    return 
  end
  if characterData._level < 5 then
    NotifyDisplay(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GAMEEXIT_DONT_CHAGECHARACTER", "iLevel", 4))
    return 
  end
  local removeTime = getCharacterDataRemoveTime(self._currentCharacterIndex)
  if removeTime ~= nil then
    NotifyDisplay(PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_CHARACTER_DELETE"))
    return 
  end
  local usabelSlotCount = getUsableCharacterSlotCount()
  if usabelSlotCount <= self._currentCharacterIndex then
    NotifyDisplay(PAGetString(Defines.StringSheet_GAME, "GAME_MESSAGE_CLOSE_CHARACTER_SLOT"))
    return 
  end
  local contentString = ""
  if (Defines.s64_const).s64_m1 ~= characterData._lastTicketNoByRegion then
    contentString = PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_WAIT") .. "\n"
  end
  local pcDeliveryRegionKey = characterData._arrivalRegionKey
  local serverUtc64 = getServerUtc64()
  if pcDeliveryRegionKey:get() ~= 0 and serverUtc64 < characterData._arrivalTime then
    contentString = PAGetString(Defines.StringSheet_GAME, "Lua_deliveryPerson_SelectPcDelivery") .. "\n"
  end
  contentString = contentString .. PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_CHARACTER_CHANGE_QUESTION")
  local messageboxData = {title = "", content = contentString, functionYes = PaGlobalFunc_GameExit_CharacterSwapConfirm, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

PaGlobalFunc_GameExit_ButtonClick_ServerChange = function()
  -- function num : 0_14 , upvalues : Window_GameExitInfo
  local self = Window_GameExitInfo
  if ((self._ui)._button_NoticeMsg):GetShow() == true then
    return 
  end
  FGlobal_ChannelSelect_Show()
end

PaGlobalFunc_GameExit_ButtonClick_Exit = function(exitType)
  -- function num : 0_15 , upvalues : Window_GameExitInfo
  local self = Window_GameExitInfo
  if ((self._ui)._button_NoticeMsg):GetShow() == true then
    return 
  end
  PaGlobalFunc_GameExitConfirm_OpenByExitType(exitType)
end

PaGlobalFunc_GameExit_ButtonClick_CharacterMove = function()
  -- function num : 0_16 , upvalues : Window_GameExitInfo
  local self = Window_GameExitInfo
  if ((self._ui)._button_NoticeMsg):GetShow() == true then
    return 
  end
  PaGlobalFunc_GameExit_SetShow(false, false)
  PaGlobalFunc_GameExitCharMove_SetShow(true, false)
end

PaGlobalFunc_GameExit_ButtonClick_ExitCancel = function()
  -- function num : 0_17 , upvalues : Window_GameExitInfo
  local self = Window_GameExitInfo
  if ((self._ui)._button_NoticeMsg):GetShow() == false then
    return 
  end
  local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
  local cancelAble = true
  if ((self._config)._exitType_CharacterSelect == self._currentExitType and (regionInfo:get()):isSafeZone() == true) or self._exitTime < 2 then
    cancelAble = false
  end
  if cancelAble == true then
    sendGameDelayExitCancel()
  end
  self._exitTime = -1
  self._currentExitType = -1
  ;
  ((self._ui)._button_NoticeMsg):SetShow(false)
end

PaGlobalFunc_GameExit_GetCharInfoTable = function()
  -- function num : 0_18 , upvalues : Window_GameExitInfo
  local self = Window_GameExitInfo
  return self._characterInfoTable
end

Window_GameExitInfo.Clear = function(self)
  -- function num : 0_19
  self._currentExitType = -1
  self._exitTime = -1
  for index = 0, (self._config)._maxCharacterSlot - 1 do
    (((self._characterUITable)[index])._radioButton_CharBg):SetCheck(false)
  end
end

Window_GameExitInfo.Update = function(self)
  -- function num : 0_20
  self:SetHistory()
  self:SetCharacterInfoTable()
  PaGlobalFunc_GameExit_UpdateCharList(0)
end

Window_GameExitInfo.Initialize = function(self)
  -- function num : 0_21
  self:InitRegister()
  self:InitControl()
  self:InitEvent()
  self:XB_Control_Init()
end

Window_GameExitInfo.InitControl = function(self)
  -- function num : 0_22
  local body = (self._ui)._body
  local bottom = (self._ui)._bottom
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui)._button_NoticeMsg = (UI.getChildControl)((self._ui)._static_titleBar, "Button_NoticeMsg")
  body._button_GameExit = (UI.getChildControl)((self._ui)._static_MainBg, "Button_GameExit")
  body._button_ServerChange = (UI.getChildControl)((self._ui)._static_MainBg, "Button_ServerChange")
  body._button_SelectCharacter = (UI.getChildControl)((self._ui)._static_MainBg, "Button_SelectCharacter")
  body._button_CharacterMove = (UI.getChildControl)((self._ui)._static_MainBg, "Button_CharacterMove")
  body._button_Tray = (UI.getChildControl)((self._ui)._static_MainBg, "Button_Tray")
  body._button_LB = (UI.getChildControl)((self._ui)._static_MainBg, "Button_LB")
  body._button_RB = (UI.getChildControl)((self._ui)._static_MainBg, "Button_RB")
  bottom._staticText_QuestList = (UI.getChildControl)((self._ui)._static_Bottom, "StaticText_QuestList")
  ;
  (bottom._staticText_QuestList):SetTextVerticalTop()
  bottom._staticText_JournalList = (UI.getChildControl)((self._ui)._static_Bottom, "StaticText_JournalList")
  ;
  (bottom._staticText_JournalList):SetTextVerticalTop()
  ;
  (body._button_LB):SetShow(getCharacterDataCount() > 4)
  ;
  (body._button_RB):SetShow(getCharacterDataCount() > 4)
  local _button_DisPlay = {[0] = body._button_GameExit, [1] = body._button_ServerChange, [2] = body._button_SelectCharacter, [3] = body._button_CharacterMove, totalCount = 4}
  local _startX = (body._button_GameExit):GetPosX() - 12
  local _gapX = (body._button_GameExit):GetSizeX() + 57
  if _ContentsGroup_isConsolePadControl then
    (body._button_Tray):SetIgnore(true)
    ;
    (body._button_Tray):SetShow(false)
    for ii = 0, _button_DisPlay.totalCount - 1 do
      (_button_DisPlay[ii]):SetSize(220, 62)
      ;
      (_button_DisPlay[ii]):SetPosX(_startX + _gapX * ii)
    end
  end
  local radioButton_CharBg = (UI.getChildControl)((self._ui)._static_MainBg, "RadioButton_SlotTemplate")
  local baseCharUI = {_radioButton_CharBg = radioButton_CharBg, _static_Picture = (UI.getChildControl)(radioButton_CharBg, "Static_Picture"), _staticText_Level = (UI.getChildControl)(radioButton_CharBg, "StaticText_Lv"), _staticText_Name = (UI.getChildControl)(radioButton_CharBg, "StaticText_Name"), _staticText_Location = (UI.getChildControl)(radioButton_CharBg, "StaticText_Location"), _staticText_EnchantFailCount = (UI.getChildControl)(radioButton_CharBg, "StaticText_EnchantFailCount"), _staticText_Energy = (UI.getChildControl)(radioButton_CharBg, "StaticText_Energy"), _button_ChangePicture = (UI.getChildControl)(radioButton_CharBg, "StaticText_ChangePicture"), _staticText_Condtion = (UI.getChildControl)(radioButton_CharBg, "StaticText_Contidion"), _staticText_RemindTime = (UI.getChildControl)(radioButton_CharBg, "StaticText_RemindTime")}
  local UCT = CppEnums.PA_UI_CONTROL_TYPE
  for index = 0, (self._config)._maxCharacterSlot - 1 do
    local uiTable = {_radioButton_CharBg, _static_Picture, _staticText_Level, _staticText_Name, _staticText_Location, _staticText_EnchantFailCount, _staticText_Energy, _button_ChangePicture, _staticText_Condtion, _staticText_RemindTime}
    uiTable._radioButton_CharBg = (UI.createControl)(UCT.PA_UI_CONTROL_RADIOBUTTON, (self._ui)._static_MainBg, "radioButton_CharBg_" .. index)
    CopyBaseProperty(baseCharUI._radioButton_CharBg, uiTable._radioButton_CharBg)
    uiTable._static_Picture = (UI.createControl)(UCT.PA_UI_CONTROL_STATIC, uiTable._radioButton_CharBg, "static_Picture_" .. index)
    CopyBaseProperty(baseCharUI._static_Picture, uiTable._static_Picture)
    uiTable._staticText_Level = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, uiTable._radioButton_CharBg, "staticText_Level_" .. index)
    CopyBaseProperty(baseCharUI._staticText_Level, uiTable._staticText_Level)
    uiTable._staticText_Name = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, uiTable._radioButton_CharBg, "staticText_Name_" .. index)
    CopyBaseProperty(baseCharUI._staticText_Name, uiTable._staticText_Name)
    uiTable._staticText_Location = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, uiTable._radioButton_CharBg, "staticText_Location_" .. index)
    CopyBaseProperty(baseCharUI._staticText_Location, uiTable._staticText_Location)
    uiTable._staticText_EnchantFailCount = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, uiTable._radioButton_CharBg, "staticText_EnchantFailCount_" .. index)
    CopyBaseProperty(baseCharUI._staticText_EnchantFailCount, uiTable._staticText_EnchantFailCount)
    uiTable._staticText_Energy = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, uiTable._radioButton_CharBg, "staticText_Energy_" .. index)
    CopyBaseProperty(baseCharUI._staticText_Energy, uiTable._staticText_Energy)
    uiTable._button_ChangePicture = (UI.createControl)(UCT.PA_UI_CONTROL_BUTTON, uiTable._radioButton_CharBg, "button_ChangePicture_" .. index)
    CopyBaseProperty(baseCharUI._button_ChangePicture, uiTable._button_ChangePicture)
    uiTable._staticText_Condtion = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, uiTable._radioButton_CharBg, "staticText_Condtion_" .. index)
    CopyBaseProperty(baseCharUI._staticText_Condtion, uiTable._staticText_Condtion)
    uiTable._staticText_RemindTime = (UI.createControl)(UCT.PA_UI_CONTROL_STATICTEXT, uiTable._radioButton_CharBg, "staticText_RemindTime_" .. index)
    CopyBaseProperty(baseCharUI._staticText_RemindTime, uiTable._staticText_RemindTime)
    ;
    (uiTable._radioButton_CharBg):SetPosX((uiTable._radioButton_CharBg):GetPosX() + ((uiTable._radioButton_CharBg):GetSizeX() + 10) * index)
    ;
    (uiTable._radioButton_CharBg):SetShow(false)
    -- DECOMPILER ERROR at PC374: Confused about usage of register: R14 in 'UnsetPending'

    ;
    (self._characterUITable)[index] = uiTable
  end
  for _,control in pairs(baseCharUI) do
    control:SetShow(false)
    ;
    (UI.deleteControl)(control)
  end
  -- DECOMPILER ERROR: 4 unprocessed JMP targets
end

Window_GameExitInfo.InitEvent = function(self)
  -- function num : 0_23
  local body = (self._ui)._body
  local bottom = (self._ui)._bottom
  ;
  ((self._ui)._button_NoticeMsg):addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExit_ButtonClick_ExitCancel()")
  Panel_Window_GameExit:RegisterUpdateFunc("PaGlobalFunc_GameExit_UpdatePerFrame")
  ;
  (body._button_LB):addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExit_UpdateCharList(-1)")
  ;
  (body._button_RB):addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExit_UpdateCharList(1)")
  ;
  (body._button_GameExit):addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExit_ButtonClick_Exit(0)")
  ;
  (body._button_Tray):addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExit_ButtonClick_Exit(1)")
  ;
  (body._button_SelectCharacter):addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExit_ButtonClick_Exit(2)")
  ;
  (body._button_CharacterMove):addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExit_ButtonClick_CharacterMove()")
  ;
  (body._button_ServerChange):addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExit_ButtonClick_ServerChange()")
  for index = 0, (self._config)._maxCharacterSlot - 1 do
    (((self._characterUITable)[index])._radioButton_CharBg):addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExit_ButtonClick_CharacterSwap(" .. index .. ")")
    ;
    (((self._characterUITable)[index])._button_ChangePicture):addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExit_ButtonClick_ChangePhoto(" .. index .. ")")
  end
end

PaGlobalFunc_GameExit_Resize = function()
  -- function num : 0_24
end

PaGlobalFunc_GameExit_ButtonClick_ChangePhoto = function(index)
  -- function num : 0_25 , upvalues : Window_GameExitInfo
  local self = Window_GameExitInfo
  if ((self._ui)._button_NoticeMsg):GetShow() == true then
    return 
  end
  self._currentCharacterIndex = self._currentWheelValue + index
  PaGlobalFunc_GameExit_SetShow(false, false)
  IsGameExitPhoto(true)
  IngameCustomize_Show()
  characterSlot_Index(self._currentCharacterIndex)
  self._isTakePhoto = true
end

PaGlobalFunc_FromClient_GameExit_WindowTry = function()
  -- function num : 0_26
  PaGlobalFunc_GameExit_ButtonClick_Exit(1)
end

PaGlobalFunc_FromClient_GameExit_Attacked = function()
  -- function num : 0_27
  PaGlobalFunc_GameExit_SetShow(false, false)
end

Window_GameExitInfo.InitRegister = function(self)
  -- function num : 0_28
  registerEvent("EventGameExitDelayTime", "PaGlobalFunc_FromClient_GameExit_SetDelayTime")
  registerEvent("EventGameWindowClose", "GameExitShowToggle()")
  registerEvent("FromClient_TrayIconMessageBox", "PaGlobalFunc_FromClient_GameExit_WindowTry")
  registerEvent("onScreenResize", "PaGlobalFunc_GameExit_Resize")
  registerEvent("progressEventCancelByAttacked", "PaGlobalFunc_FromClient_GameExit_Attacked")
end

PaGlobalFunc_FromClient_GameExit_luaLoadComplete = function()
  -- function num : 0_29 , upvalues : Window_GameExitInfo
  local self = Window_GameExitInfo
  self:Initialize()
  self:Clear()
  self:Update()
end

PaGlobalFunc_GameExit_SetShow = function(isShow, isAni, isAttacked)
  -- function num : 0_30 , upvalues : Window_GameExitInfo
  local self = Window_GameExitInfo
  if isDeadInWatchingMode() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXITOPENALERT_INDEAD"))
    return 
  end
  if (CppEnums.EProcessorInputMode).eProcessorInputMode_ChattingInputMode == (UI.Get_ProcessorInputMode)() then
    return 
  end
  local currentUIMode = GetUIMode()
  if currentUIMode == (Defines.UIMode).eUIMode_Gacha_Roulette or currentUIMode == (Defines.UIMode).eUIMode_DeadMessage then
    return 
  end
  if ToClient_cutsceneIsPlay() == true then
    return 
  end
  if isFlushedUI() == true then
    return 
  end
  if isAttacked == true then
    return 
  end
  do
    if isGameTypeRussia() == true and isAttacked == true then
      local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
      if (regionInfo:get()):isSafeZone() == true then
        return 
      end
    end
    if isShow == true then
      SetUIMode((Defines.UIMode).eUIMode_GameExit)
      sendWaitingListOfMyCharacters()
      self:Clear()
      self:Update()
    else
      SetUIMode((Defines.UIMode).eUIMode_Default)
      if self._currentExitType ~= -1 then
        PaGlobalFunc_GameExit_ButtonClick_ExitCancel()
      end
    end
    Panel_Window_GameExit:SetShow(isShow, isAni)
    self._currentPhotoIndex = 0
  end
end

PaGlobalFunc_GameExit_GetShow = function()
  -- function num : 0_31
  return Panel_Window_GameExit:GetShow()
end

GameExitShowToggle = function(isAttacked)
  -- function num : 0_32
  PaGlobalFunc_GameExit_SetShow(not PaGlobalFunc_GameExit_GetShow(), false, isAttacked)
end

PaGlobalFunc_GameExit_ExitHandler = function(ExitType)
  -- function num : 0_33 , upvalues : Window_GameExitInfo
  local self = Window_GameExitInfo
  if (self._config)._exitType_GameExit == ExitType then
    self:ExitToGameOff()
  else
    if (self._config)._exitType_CharacterSelect == ExitType then
      self:ExitToCharacterSelect()
    else
      if (self._config)._exitType_Tray == ExitType then
        ToClient_CheckTrayIcon()
      else
        if (self._config)._exitType_UnTray == ExitType then
          ToClient_UnCheckTrayIcon()
        else
          _PA_LOG("이호�\156", "종료 �\128입이 잘못됐습니다.")
        end
      end
    end
  end
end

PaGlobalFunc_CharChangePhoto_Y = function()
  -- function num : 0_34 , upvalues : Window_GameExitInfo
  local self = Window_GameExitInfo
  if Panel_Window_GameExit:GetShow() == false then
    return 
  end
  PaGlobalFunc_GameExit_SetShow(false, false)
  IsGameExitPhoto(true)
  IngameCustomize_Show()
  characterSlot_Index(self._selfPlayerIndex)
  self._isTakePhoto = true
end

Window_GameExitInfo.XB_Control_Init = function(self)
  -- function num : 0_35
  Panel_Window_GameExit:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LB, "PaGlobalFunc_GameExit_UpdateCharList(-1)")
  Panel_Window_GameExit:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RB, "PaGlobalFunc_GameExit_UpdateCharList(1)")
end

registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_FromClient_GameExit_luaLoadComplete")

