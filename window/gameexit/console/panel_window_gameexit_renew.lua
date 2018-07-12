local Window_GameExitInfo = {
  _ui = {
    _static_MainBg = UI.getChildControl(Panel_Window_GameExit, "Static_MainBg"),
    _static_titleBar = UI.getChildControl(Panel_Window_GameExit, "Static_TitleBar"),
    _static_Bottom = UI.getChildControl(Panel_Window_GameExit, "Static_Bottom"),
    _body = {},
    _bottom = {}
  },
  _config = {
    _exitType_GameExit = 0,
    _exitType_CharacterSelect = 1,
    _exitType_Tray = 2,
    _exitType_UnTray = 3,
    _exitType_CharacterSwap = 4,
    _maxQuestList = 3,
    _maxJournalList = 3,
    _maxCharacterSlot = 4
  },
  _currentExitType = -1,
  _logoutDelayTime = getLogoutWaitingTime(),
  _exitTime = -1,
  _isTakePhoto = false,
  _characterUITable = {},
  _currentCharacterInfoTable = {},
  _characterInfoTable = {},
  _currentWheelValue = 0,
  _currentCharacterIndex = -1,
  _selfPlayerIndex = -1
}
function PaGlobalFunc_GameExit_workTypeToStringSwap(workingType)
  local workingText
  if CppEnums.PcWorkType.ePcWorkType_Empty == workingType then
    workingText = ""
  elseif CppEnums.PcWorkType.ePcWorkType_Play == workingType then
    workingText = PAGetString(Defines.StringSheet_GAME, "CHARACTER_WORKING_TEXT_PLAY")
  elseif CppEnums.PcWorkType.ePcWorkType_RepairItem == workingType then
    workingText = PAGetString(Defines.StringSheet_GAME, "CHARACTER_WORKING_TEXT_REPAIRITEM")
  elseif CppEnums.PcWorkType.ePcWorkType_Relax == workingType then
    workingText = PAGetString(Defines.StringSheet_GAME, "CHARACTER_WORKING_TEXT_RELEX")
  elseif CppEnums.PcWorkType.ePcWorkType_ReadBook == workingType then
    workingText = PAGetString(Defines.StringSheet_GAME, "CHARACTER_WORKING_TEXT_READBOOK")
  else
    _PA_ASSERT(false, "\236\186\144\235\166\173\237\132\176 \236\158\145\236\151\133 \237\131\128\236\158\133\236\157\180 \236\182\148\234\176\128 \235\144\152\236\151\136\236\138\181\235\139\136\235\139\164. Lobby_New.lua \235\143\132 \236\182\148\234\176\128\237\149\180 \236\163\188\236\150\180\236\149\188 \237\149\169\235\139\136\235\139\164.")
    workingText = "unKnown"
  end
  return workingText
end
function Window_GameExitInfo:SetHistory()
  local questList = self._ui._bottom._staticText_QuestList
  local journalList = self._ui._bottom._staticText_JournalList
  local selfPlayerAPW = getSelfPlayer()
  if nil == selfPlayerAPW then
    return
  end
  local qusetListStr = ""
  for index = 0, self._config._maxQuestList - 1 do
    local qusetNo = selfPlayerAPW:get():getLastCompleteQuest(index)
    local questWrapper = ToClient_getQuestWrapper(qusetNo)
    if nil ~= questWrapper then
      qusetListStr = qusetListStr .. "\194\183 " .. questWrapper:getTitle() .. "\n"
    end
  end
  questList:SetShow(true)
  questList:SetText(qusetListStr)
  ToClient_RequestRecentJournalByCount(self._config._maxJournalList)
  local journalCount = ToClient_GetRecentJournalCount()
  if 0 == journalCount then
    return
  end
  local journalListStr = ""
  for index = 0, journalCount - 1 do
    local journalWrapper = ToClient_GetRecentJournalByIndex(index)
    if nil ~= journalWrapper then
      journalListStr = journalListStr .. "\194\183 " .. "[" .. string.format("%.02d", journalWrapper:getJournalHour()) .. ":" .. string.format("%.02d", journalWrapper:getJournalMinute()) .. "] " .. journalWrapper:getName() .. "\n"
    end
  end
  journalList:SetShow(true)
  journalList:SetText(journalListStr)
end
function Window_GameExitInfo:SetCharacterInfoTable()
  local characterCount = getCharacterDataCount()
  local serverUtc64 = getServerUtc64()
  for index = 0, characterCount - 1 do
    local infoTable = {
      _classType = -1,
      _baseTexture = nil,
      _textureName = nil,
      _level = -1,
      _name = "",
      _location = "",
      _enchantFailCount = 0,
      _enchantValksCount = 0,
      _energy = -1,
      _remindTime,
      _condition = "",
      _isRemoved = false,
      _isSelfPlayer = false
    }
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
    if 0 == characterData._currentPosition.x and 0 == characterData._currentPosition.y and 0 == characterData._currentPosition.z then
      infoTable._location = ""
    elseif 0 ~= pcDeliveryRegionKey:get() and serverUtc64 > characterData._arrivalTime then
      local retionInfoArrival = getRegionInfoByRegionKey(pcDeliveryRegionKey)
      infoTable._location = retionInfoArrival:getAreaName()
    else
      infoTable._location = regionInfo:getAreaName()
    end
    if 0 ~= pcDeliveryRegionKey:get() and serverUtc64 < characterData._arrivalTime then
      infoTable._condition = PAGetString(Defines.StringSheet_GAME, "CHARACTER_WORKING_TEXT_DELIVERY")
      infoTable._remindTime = convertStringFromDatetime(characterData._arrivalTime - serverUtc64)
    end
    local removeTime = getCharacterDataRemoveTime(index)
    if nil ~= removeTime then
      infoTable._condition = PAGetString(Defines.StringSheet_GAME, "CHARACTER_DELETING")
      infoTable._isRemoved = true
    end
    local characterNo_64 = getSelfPlayer():getCharacterNo_64()
    if characterNo_64 == characterData._characterNo_s64 then
      infoTable._isSelfPlayer = true
      self._selfPlayerIndex = index
    end
    self._characterInfoTable[index] = infoTable
  end
end
function Window_GameExitInfo:SetCharacterSlot(charInfo, charSlot)
  if nil == charInfo or nil == charSlot then
    return false
  end
  for _, control in pairs(charSlot) do
    if nil == control then
      return false
    end
  end
  charSlot._staticText_Level:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. charInfo._level)
  charSlot._staticText_Name:SetText(charInfo._name)
  charSlot._staticText_Location:SetText(charInfo._location)
  charSlot._staticText_Energy:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_CHARWP_TITLE") .. " " .. charInfo._energy)
  charSlot._staticText_EnchantFailCount:SetText(PAGetString(Defines.StringSheet_GAME, "DIALOG_BUTTON_QUEST_ENCHANT") .. " " .. charInfo._enchantFailCount .. "+" .. charInfo._enchantValksCount)
  charSlot._staticText_RemindTime:SetText("")
  if nil ~= charInfo._remindTime then
    charSlot._staticText_RemindTime:SetText(charInfo._remindTime)
  end
  charSlot._staticText_Condtion:SetText(charInfo._condition)
  if _ContentsGroup_isConsolePadControl then
  end
  local isCaptureExist = charSlot._static_Picture:ChangeTextureInfoNameNotDDS(charInfo._textureName, charInfo._classType, self._isTakePhoto)
  if true == isCaptureExist then
    charSlot._static_Picture:getBaseTexture():setUV(0, 0, 1, 1)
  else
    if false == _ContentsGroup_isUsedNewCharacterInfo then
      if charInfo._classType == CppEnums.ClassType.ClassType_Warrior then
        charSlot._static_Picture:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 1, 1, 156, 201)
        charSlot._static_Picture:getBaseTexture():setUV(x1, y1, x2, y2)
        charSlot._static_Picture:setRenderTexture(charSlot._static_Picture:getBaseTexture())
      elseif charInfo._classType == CppEnums.ClassType.ClassType_Ranger then
        charSlot._static_Picture:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 157, 1, 312, 201)
        charSlot._static_Picture:getBaseTexture():setUV(x1, y1, x2, y2)
        charSlot._static_Picture:setRenderTexture(charSlot._static_Picture:getBaseTexture())
      elseif charInfo._classType == CppEnums.ClassType.ClassType_Sorcerer then
        charSlot._static_Picture:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 313, 1, 468, 201)
        charSlot._static_Picture:getBaseTexture():setUV(x1, y1, x2, y2)
        charSlot._static_Picture:setRenderTexture(charSlot._static_Picture:getBaseTexture())
      elseif charInfo._classType == CppEnums.ClassType.ClassType_Giant then
        charSlot._static_Picture:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 1, 202, 156, 402)
        charSlot._static_Picture:getBaseTexture():setUV(x1, y1, x2, y2)
        charSlot._static_Picture:setRenderTexture(charSlot._static_Picture:getBaseTexture())
      elseif charInfo._classType == CppEnums.ClassType.ClassType_Tamer then
        charSlot._static_Picture:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 157, 202, 312, 402)
        charSlot._static_Picture:getBaseTexture():setUV(x1, y1, x2, y2)
        charSlot._static_Picture:setRenderTexture(charSlot._static_Picture:getBaseTexture())
      elseif charInfo._classType == CppEnums.ClassType.ClassType_BladeMaster then
        charSlot._static_Picture:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 313, 202, 468, 402)
        charSlot._static_Picture:getBaseTexture():setUV(x1, y1, x2, y2)
        charSlot._static_Picture:setRenderTexture(charSlot._static_Picture:getBaseTexture())
      elseif charInfo._classType == CppEnums.ClassType.ClassType_Valkyrie then
        charSlot._static_Picture:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 1, 1, 156, 201)
        charSlot._static_Picture:getBaseTexture():setUV(x1, y1, x2, y2)
        charSlot._static_Picture:setRenderTexture(charSlot._static_Picture:getBaseTexture())
      elseif charInfo._classType == CppEnums.ClassType.ClassType_BladeMasterWomen then
        charSlot._static_Picture:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 157, 1, 312, 201)
        charSlot._static_Picture:getBaseTexture():setUV(x1, y1, x2, y2)
        charSlot._static_Picture:setRenderTexture(charSlot._static_Picture:getBaseTexture())
      elseif charInfo._classType == CppEnums.ClassType.ClassType_Wizard then
        charSlot._static_Picture:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 313, 1, 468, 201)
        charSlot._static_Picture:getBaseTexture():setUV(x1, y1, x2, y2)
        charSlot._static_Picture:setRenderTexture(charSlot._static_Picture:getBaseTexture())
      elseif charInfo._classType == CppEnums.ClassType.ClassType_WizardWomen then
        charSlot._static_Picture:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 1, 202, 156, 402)
        charSlot._static_Picture:getBaseTexture():setUV(x1, y1, x2, y2)
        charSlot._static_Picture:setRenderTexture(charSlot._static_Picture:getBaseTexture())
      elseif charInfo._classType == CppEnums.ClassType.ClassType_NinjaWomen then
        charSlot._static_Picture:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 157, 202, 312, 402)
        charSlot._static_Picture:getBaseTexture():setUV(x1, y1, x2, y2)
        charSlot._static_Picture:setRenderTexture(charSlot._static_Picture:getBaseTexture())
      elseif charInfo._classType == CppEnums.ClassType.ClassType_NinjaMan then
        charSlot._static_Picture:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 313, 202, 468, 402)
        charSlot._static_Picture:getBaseTexture():setUV(x1, y1, x2, y2)
        charSlot._static_Picture:setRenderTexture(charSlot._static_Picture:getBaseTexture())
      elseif charInfo._classType == CppEnums.ClassType.ClassType_DarkElf then
        charSlot._static_Picture:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_02.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 1, 1, 156, 201)
        charSlot._static_Picture:getBaseTexture():setUV(x1, y1, x2, y2)
        charSlot._static_Picture:setRenderTexture(charSlot._static_Picture:getBaseTexture())
      elseif charInfo._classType == CppEnums.ClassType.ClassType_Combattant then
        charSlot._static_Picture:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_02.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 157, 1, 312, 201)
        charSlot._static_Picture:getBaseTexture():setUV(x1, y1, x2, y2)
        charSlot._static_Picture:setRenderTexture(charSlot._static_Picture:getBaseTexture())
      elseif charInfo._classType == CppEnums.ClassType.ClassType_CombattantWomen then
        charSlot._static_Picture:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_02.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 313, 1, 468, 201)
        charSlot._static_Picture:getBaseTexture():setUV(x1, y1, x2, y2)
        charSlot._static_Picture:setRenderTexture(charSlot._static_Picture:getBaseTexture())
      elseif charInfo._classType == CppEnums.ClassType.ClassType_Lahn then
        charSlot._static_Picture:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_03.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 1, 1, 156, 201)
        charSlot._static_Picture:getBaseTexture():setUV(x1, y1, x2, y2)
        charSlot._static_Picture:setRenderTexture(charSlot._static_Picture:getBaseTexture())
      elseif charInfo._classType == CppEnums.ClassType.ClassType_Orange then
        charSlot._static_Picture:ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_03.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, 1, 1, 156, 201)
        charSlot._static_Picture:getBaseTexture():setUV(x1, y1, x2, y2)
        charSlot._static_Picture:setRenderTexture(charSlot._static_Picture:getBaseTexture())
      end
    else
      local DefaultFace = CppEnums.ClassType_DefaultFaceTexture[charInfo._classType]
      charSlot._static_Picture:ChangeTextureInfoName(DefaultFace[1])
      local x1, y1, x2, y2 = setTextureUV_Func(charSlot._static_Picture, DefaultFace[2], DefaultFace[3], DefaultFace[4], DefaultFace[5])
      charSlot._static_Picture:getBaseTexture():setUV(x1, y1, x2, y2)
    end
    charSlot._static_Picture:setRenderTexture(charSlot._static_Picture:getBaseTexture())
  end
  self._isTakePhoto = false
  return true
end
function PaGlobalFunc_GameExit_SaveCurrentData()
  Window_GameExitInfo:SaveCurrentData()
end
function Window_GameExitInfo:SaveCurrentData()
  getSelfPlayer():updateNavigationInformation("")
  getSelfPlayer():saveCurrentDataForGameExit()
  ToClient_SaveUiInfo(false)
end
function Window_GameExitInfo:ExitToGameOff()
  self:SaveCurrentData()
  local selfPlayerActorProxy = getSelfPlayer():get()
  if nil == selfPlayerActorProxy then
    return
  end
  self._currentExitType = self._config._exitType_GameExit
  local regionInfo = getRegionInfoByPosition(selfPlayerActorProxy:getPosition())
  if true == regionInfo:get():isSafeZone() then
    self:SetNoticeMsg()
  else
    self:SetNoticeMsg(self._logoutDelayTime)
  end
  sendBeginGameDelayExit(self._config._exitType_CharacterSwap == self._currentExitType)
  local messageBoxData = {
    title = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY"),
    content = PAGetString(Defines.StringSheet_GAME, "GAME_MESSAGE_WAIT_PROCESS"),
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_0
  }
  MessageBox.showMessageBox(messageBoxData)
end
function Window_GameExitInfo:ExitToCharacterSelect()
  self._currentExitType = self._config._exitType_CharacterSelect
  self:SaveCurrentData()
  sendCharacterSelect()
  local regionInfo = getRegionInfoByPosition(getSelfPlayer():get():getPosition())
  if true == regionInfo:get():isSafeZone() then
    self:SetNoticeMsg()
  else
    self:SetNoticeMsg(self._logoutDelayTime)
  end
  local messageBoxData = {
    title = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY"),
    content = PAGetString(Defines.StringSheet_GAME, "GAME_MESSAGE_WAIT_PROCESS"),
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_0
  }
  MessageBox.showMessageBox(messageBoxData)
end
function PaGlobalFunc_GameExit_CharacterSwapConfirm()
  local self = Window_GameExitInfo
  self:SaveCurrentData()
  local rv = swapCharacter_Select(self._currentCharacterIndex, true)
  if false == rv then
    return
  end
  self._currentExitType = self._config._exitType_CharacterSwap
  self:SetNoticeMsg(self._logoutDelayTime)
  if true == PaGlobal_IsTagChange() then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_TAG_CHANGING")
    local messageBoxData = {
      title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"),
      content = messageBoxMemo,
      functionYes = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageBoxData)
  end
  local messageBoxData = {
    title = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY"),
    content = PAGetString(Defines.StringSheet_GAME, "GAME_MESSAGE_WAIT_PROCESS"),
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_0
  }
  MessageBox.showMessageBox(messageBoxData)
end
function PaGlobalFunc_GameExit_UpdatePerFrame(deltaTime)
  local self = Window_GameExitInfo
  if -1 == self._exitTime then
    return
  end
  self._exitTime = self._exitTime - deltaTime
  self:SetNoticeMsg(Int64toInt32(self._exitTime))
  if self._exitTime >= 0 then
    return
  end
  self:SetNoticeMsg()
  if self._config._exitType_GameExit == self._currentExitType then
    SetUIMode(Defines.UIMode.eUIMode_Default)
    sendGameLogOut()
  end
  self._currentExitType = -1
  self._exitTime = -1
end
function PaGlobalFunc_FromClient_GameExit_SetDelayTime(delayTime)
  local self = Window_GameExitInfo
  if false == PaGlobalFunc_GameExit_GetShow() then
    return
  end
  self._exitTime = delayTime
  self:SetNoticeMsg(delayTime)
end
function Window_GameExitInfo:SetNoticeMsg(delayTime)
  local msg
  if nil == delayTime then
    self._ui._button_NoticeMsg:SetIgnore(true)
    if self._config._exitType_GameExit == self._currentExitType then
      msg = PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_PROGRESS")
    elseif self._config._exitType_CharacterSelect == self._currentExitType then
      msg = PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_GO_CHARACTERSELECT")
    elseif self._config._exitType_CharacterSwap == self._currentExitType then
      msg = PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_GO_SWAPCHARACTER")
    else
      _PA_LOG("\236\157\180\237\152\184\236\132\156", "\236\162\133\235\163\140 \237\131\128\236\158\133\236\157\180 \236\158\152\235\170\187\235\144\144\236\138\181\235\139\136\235\139\164.")
    end
  else
    self._ui._button_NoticeMsg:SetIgnore(false)
    if self._config._exitType_GameExit == self._currentExitType then
      msg = PAGetStringParam1(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_TO_EXIT", "remainTime", tostring(delayTime))
    elseif self._config._exitType_CharacterSelect == self._currentExitType then
      msg = PAGetStringParam1(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_TO_CHARACTER_SELECT", "remainTime", tostring(delayTime))
    elseif self._config._exitType_CharacterSwap == self._currentExitType then
      msg = PAGetStringParam1(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_COMMENT_TO_CHARACTER_CHANGE", "remainTime", tostring(delayTime))
    else
      _PA_LOG("\236\157\180\237\152\184\236\132\156", "\236\162\133\235\163\140 \237\131\128\236\158\133\236\157\180 \236\158\152\235\170\187\235\144\144\236\138\181\235\139\136\235\139\164.")
    end
  end
  self._ui._button_NoticeMsg:SetShow(true)
  self._ui._button_NoticeMsg:SetText(msg)
end
function PaGlobalFunc_GameExit_UpdateCharList(value)
  local self = Window_GameExitInfo
  self:Clear()
  self._currentWheelValue = self._currentWheelValue + value
  if true == self._ui._button_NoticeMsg:GetShow() then
    return
  end
  if self._currentWheelValue < 0 then
    self._currentWheelValue = 0
  end
  if getCharacterDataCount() < self._currentWheelValue + self._config._maxCharacterSlot then
    self._currentWheelValue = self._currentWheelValue - 1
  end
  if getCharacterDataCount() < self._config._maxCharacterSlot then
    self._currentWheelValue = 0
  end
  for index = 0, self._config._maxCharacterSlot - 1 do
    self._characterUITable[index]._radioButton_CharBg:SetShow(false)
    local isSuccess = self:SetCharacterSlot(self._characterInfoTable[index + self._currentWheelValue], self._characterUITable[index])
    if false == isSuccess then
      return
    end
    self._characterUITable[index]._radioButton_CharBg:SetShow(true)
    self._currentCharacterInfoTable[index] = self._characterInfoTable[index + self._currentWheelValue]
  end
end
function PaGlobalFunc_GameExit_ButtonClick_CharacterSwap(index)
  local self = Window_GameExitInfo
  if true == self._ui._button_NoticeMsg:GetShow() then
    return
  end
  self._currentCharacterIndex = index + self._currentWheelValue
  local charInfo = self._currentCharacterInfoTable[index]
  if nil == charInfo then
    return
  end
  local characterData = getCharacterDataByIndex(self._currentCharacterIndex)
  local classType = charInfo._classType
  if true == charInfo._isSelfPlayer then
    return
  end
  if ToClient_IsCustomizeOnlyClass(classType) then
    NotifyDisplay(PAGetString(Defines.StringSheet_GAME, "LUA_LOBBY_SELECTCHARACTER_NOTYET_1"))
    return
  end
  if 5 > characterData._level then
    NotifyDisplay(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GAMEEXIT_DONT_CHAGECHARACTER", "iLevel", 4))
    return
  end
  local removeTime = getCharacterDataRemoveTime(self._currentCharacterIndex)
  if nil ~= removeTime then
    NotifyDisplay(PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_CHARACTER_DELETE"))
    return
  end
  local usabelSlotCount = getUsableCharacterSlotCount()
  if usabelSlotCount <= self._currentCharacterIndex then
    NotifyDisplay(PAGetString(Defines.StringSheet_GAME, "GAME_MESSAGE_CLOSE_CHARACTER_SLOT"))
    return
  end
  local contentString = ""
  if Defines.s64_const.s64_m1 ~= characterData._lastTicketNoByRegion then
    contentString = PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_WAIT") .. "\n"
  end
  local pcDeliveryRegionKey = characterData._arrivalRegionKey
  local serverUtc64 = getServerUtc64()
  if 0 ~= pcDeliveryRegionKey:get() and serverUtc64 < characterData._arrivalTime then
    contentString = PAGetString(Defines.StringSheet_GAME, "Lua_deliveryPerson_SelectPcDelivery") .. "\n"
  end
  contentString = contentString .. PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXIT_CHARACTER_CHANGE_QUESTION")
  local messageboxData = {
    title = "",
    content = contentString,
    functionYes = PaGlobalFunc_GameExit_CharacterSwapConfirm,
    functionCancel = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageboxData)
end
function PaGlobalFunc_GameExit_ButtonClick_ServerChange()
  local self = Window_GameExitInfo
  if true == self._ui._button_NoticeMsg:GetShow() then
    return
  end
  FGlobal_ChannelSelect_Show()
end
function PaGlobalFunc_GameExit_ButtonClick_Exit(exitType)
  local self = Window_GameExitInfo
  if true == self._ui._button_NoticeMsg:GetShow() then
    return
  end
  PaGlobalFunc_GameExitConfirm_OpenByExitType(exitType)
end
function PaGlobalFunc_GameExit_ButtonClick_CharacterMove()
  local self = Window_GameExitInfo
  if true == self._ui._button_NoticeMsg:GetShow() then
    return
  end
  PaGlobalFunc_GameExit_SetShow(false, false)
  PaGlobalFunc_GameExitCharMove_SetShow(true, false)
end
function PaGlobalFunc_GameExit_ButtonClick_ExitCancel()
  local self = Window_GameExitInfo
  if false == self._ui._button_NoticeMsg:GetShow() then
    return
  end
  local regionInfo = getRegionInfoByPosition(getSelfPlayer():get():getPosition())
  local cancelAble = true
  if self._config._exitType_CharacterSelect == self._currentExitType and true == regionInfo:get():isSafeZone() or self._exitTime < 2 then
    cancelAble = false
  end
  if true == cancelAble then
    sendGameDelayExitCancel()
  end
  self._exitTime = -1
  self._currentExitType = -1
  self._ui._button_NoticeMsg:SetShow(false)
end
function PaGlobalFunc_GameExit_GetCharInfoTable()
  local self = Window_GameExitInfo
  return self._characterInfoTable
end
function Window_GameExitInfo:Clear()
  self._currentExitType = -1
  self._exitTime = -1
  for index = 0, self._config._maxCharacterSlot - 1 do
    self._characterUITable[index]._radioButton_CharBg:SetCheck(false)
  end
end
function Window_GameExitInfo:Update()
  ToClient_RequestCharacterEnchantFailCount()
  self:SetHistory()
  self:SetCharacterInfoTable()
  PaGlobalFunc_GameExit_UpdateCharList(0)
end
function Window_GameExitInfo:Initialize()
  self:InitRegister()
  self:InitControl()
  self:InitEvent()
  self:XB_Control_Init()
end
function Window_GameExitInfo:InitControl()
  local body = self._ui._body
  local bottom = self._ui._bottom
  self._ui._button_NoticeMsg = UI.getChildControl(self._ui._static_titleBar, "Button_NoticeMsg")
  body._button_GameExit = UI.getChildControl(self._ui._static_MainBg, "Button_GameExit")
  body._button_ServerChange = UI.getChildControl(self._ui._static_MainBg, "Button_ServerChange")
  body._button_SelectCharacter = UI.getChildControl(self._ui._static_MainBg, "Button_SelectCharacter")
  body._button_CharacterMove = UI.getChildControl(self._ui._static_MainBg, "Button_CharacterMove")
  if true == ToClient_isXBox() then
    body._button_CharacterMove:SetShow(false)
  end
  body._button_Tray = UI.getChildControl(self._ui._static_MainBg, "Button_Tray")
  body._button_LB = UI.getChildControl(self._ui._static_MainBg, "Button_LB")
  body._button_RB = UI.getChildControl(self._ui._static_MainBg, "Button_RB")
  bottom._staticText_QuestList = UI.getChildControl(self._ui._static_Bottom, "StaticText_QuestList")
  bottom._staticText_QuestList:SetTextVerticalTop()
  bottom._staticText_JournalList = UI.getChildControl(self._ui._static_Bottom, "StaticText_JournalList")
  bottom._staticText_JournalList:SetTextVerticalTop()
  body._button_LB:SetShow(4 < getCharacterDataCount())
  body._button_RB:SetShow(4 < getCharacterDataCount())
  local _button_DisPlay = {
    [0] = body._button_GameExit,
    [1] = body._button_ServerChange,
    [2] = body._button_SelectCharacter,
    [3] = body._button_CharacterMove,
    ["totalCount"] = 4
  }
  local _startX = body._button_GameExit:GetPosX() - 12
  local _gapX = body._button_GameExit:GetSizeX() + 57
  if true == ToClient_isXBox() then
    _startX = body._button_GameExit:GetPosX() - 12 + _gapX * 0.5
  end
  if _ContentsGroup_isConsolePadControl then
    body._button_Tray:SetIgnore(true)
    body._button_Tray:SetShow(false)
    for ii = 0, _button_DisPlay.totalCount - 1 do
      _button_DisPlay[ii]:SetSize(220, 62)
      _button_DisPlay[ii]:SetPosX(_startX + _gapX * ii)
    end
  end
  local radioButton_CharBg = UI.getChildControl(self._ui._static_MainBg, "RadioButton_SlotTemplate")
  local baseCharUI = {
    _radioButton_CharBg = radioButton_CharBg,
    _static_Picture = UI.getChildControl(radioButton_CharBg, "Static_Picture"),
    _staticText_Level = UI.getChildControl(radioButton_CharBg, "StaticText_Lv"),
    _staticText_Name = UI.getChildControl(radioButton_CharBg, "StaticText_Name"),
    _staticText_Location = UI.getChildControl(radioButton_CharBg, "StaticText_Location"),
    _staticText_EnchantFailCount = UI.getChildControl(radioButton_CharBg, "StaticText_EnchantFailCount"),
    _staticText_Energy = UI.getChildControl(radioButton_CharBg, "StaticText_Energy"),
    _button_ChangePicture = UI.getChildControl(radioButton_CharBg, "StaticText_ChangePicture"),
    _staticText_Condtion = UI.getChildControl(radioButton_CharBg, "StaticText_Contidion"),
    _staticText_RemindTime = UI.getChildControl(radioButton_CharBg, "StaticText_RemindTime")
  }
  local UCT = CppEnums.PA_UI_CONTROL_TYPE
  for index = 0, self._config._maxCharacterSlot - 1 do
    local uiTable = {
      _radioButton_CharBg,
      _static_Picture,
      _staticText_Level,
      _staticText_Name,
      _staticText_Location,
      _staticText_EnchantFailCount,
      _staticText_Energy,
      _button_ChangePicture,
      _staticText_Condtion,
      _staticText_RemindTime
    }
    uiTable._radioButton_CharBg = UI.createControl(UCT.PA_UI_CONTROL_RADIOBUTTON, self._ui._static_MainBg, "radioButton_CharBg_" .. index)
    CopyBaseProperty(baseCharUI._radioButton_CharBg, uiTable._radioButton_CharBg)
    uiTable._static_Picture = UI.createControl(UCT.PA_UI_CONTROL_STATIC, uiTable._radioButton_CharBg, "static_Picture_" .. index)
    CopyBaseProperty(baseCharUI._static_Picture, uiTable._static_Picture)
    uiTable._staticText_Level = UI.createControl(UCT.PA_UI_CONTROL_STATICTEXT, uiTable._radioButton_CharBg, "staticText_Level_" .. index)
    CopyBaseProperty(baseCharUI._staticText_Level, uiTable._staticText_Level)
    uiTable._staticText_Name = UI.createControl(UCT.PA_UI_CONTROL_STATICTEXT, uiTable._radioButton_CharBg, "staticText_Name_" .. index)
    CopyBaseProperty(baseCharUI._staticText_Name, uiTable._staticText_Name)
    uiTable._staticText_Location = UI.createControl(UCT.PA_UI_CONTROL_STATICTEXT, uiTable._radioButton_CharBg, "staticText_Location_" .. index)
    CopyBaseProperty(baseCharUI._staticText_Location, uiTable._staticText_Location)
    uiTable._staticText_EnchantFailCount = UI.createControl(UCT.PA_UI_CONTROL_STATICTEXT, uiTable._radioButton_CharBg, "staticText_EnchantFailCount_" .. index)
    CopyBaseProperty(baseCharUI._staticText_EnchantFailCount, uiTable._staticText_EnchantFailCount)
    uiTable._staticText_Energy = UI.createControl(UCT.PA_UI_CONTROL_STATICTEXT, uiTable._radioButton_CharBg, "staticText_Energy_" .. index)
    CopyBaseProperty(baseCharUI._staticText_Energy, uiTable._staticText_Energy)
    uiTable._button_ChangePicture = UI.createControl(UCT.PA_UI_CONTROL_BUTTON, uiTable._radioButton_CharBg, "button_ChangePicture_" .. index)
    CopyBaseProperty(baseCharUI._button_ChangePicture, uiTable._button_ChangePicture)
    uiTable._staticText_Condtion = UI.createControl(UCT.PA_UI_CONTROL_STATICTEXT, uiTable._radioButton_CharBg, "staticText_Condtion_" .. index)
    CopyBaseProperty(baseCharUI._staticText_Condtion, uiTable._staticText_Condtion)
    uiTable._staticText_RemindTime = UI.createControl(UCT.PA_UI_CONTROL_STATICTEXT, uiTable._radioButton_CharBg, "staticText_RemindTime_" .. index)
    CopyBaseProperty(baseCharUI._staticText_RemindTime, uiTable._staticText_RemindTime)
    uiTable._radioButton_CharBg:SetPosX(uiTable._radioButton_CharBg:GetPosX() + (uiTable._radioButton_CharBg:GetSizeX() + 10) * index)
    uiTable._radioButton_CharBg:SetShow(false)
    self._characterUITable[index] = uiTable
  end
  for _, control in pairs(baseCharUI) do
    control:SetShow(false)
    UI.deleteControl(control)
  end
end
function Window_GameExitInfo:InitEvent()
  local body = self._ui._body
  local bottom = self._ui._bottom
  self._ui._button_NoticeMsg:addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExit_ButtonClick_ExitCancel()")
  Panel_Window_GameExit:RegisterUpdateFunc("PaGlobalFunc_GameExit_UpdatePerFrame")
  body._button_LB:addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExit_UpdateCharList(-1)")
  body._button_RB:addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExit_UpdateCharList(1)")
  body._button_GameExit:addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExit_ButtonClick_Exit(0)")
  body._button_Tray:addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExit_ButtonClick_Exit(1)")
  body._button_SelectCharacter:addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExit_ButtonClick_Exit(2)")
  body._button_ServerChange:addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExit_ButtonClick_ServerChange()")
  for index = 0, self._config._maxCharacterSlot - 1 do
    self._characterUITable[index]._radioButton_CharBg:addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExit_ButtonClick_CharacterSwap(" .. index .. ")")
    self._characterUITable[index]._button_ChangePicture:addInputEvent("Mouse_LUp", "PaGlobalFunc_GameExit_ButtonClick_ChangePhoto(" .. index .. ")")
  end
end
function PaGlobalFunc_GameExit_Resize()
end
function PaGlobalFunc_GameExit_ButtonClick_ChangePhoto(index)
  local self = Window_GameExitInfo
  if true == self._ui._button_NoticeMsg:GetShow() then
    return
  end
  self._currentCharacterIndex = self._currentWheelValue + index
  PaGlobalFunc_GameExit_SetShow(false, false)
  IsGameExitPhoto(true)
  IngameCustomize_Show()
  characterSlot_Index(self._currentCharacterIndex)
  self._isTakePhoto = true
end
function PaGlobalFunc_FromClient_GameExit_WindowTry()
  PaGlobalFunc_GameExit_ButtonClick_Exit(1)
end
function PaGlobalFunc_FromClient_GameExit_Attacked()
  PaGlobalFunc_GameExit_SetShow(false, false)
end
function Window_GameExitInfo:InitRegister()
  registerEvent("EventGameExitDelayTime", "PaGlobalFunc_FromClient_GameExit_SetDelayTime")
  registerEvent("EventGameWindowClose", "GameExitShowToggle()")
  registerEvent("FromClient_TrayIconMessageBox", "PaGlobalFunc_FromClient_GameExit_WindowTry")
  registerEvent("onScreenResize", "PaGlobalFunc_GameExit_Resize")
  registerEvent("progressEventCancelByAttacked", "PaGlobalFunc_FromClient_GameExit_Attacked")
end
function PaGlobalFunc_FromClient_GameExit_luaLoadComplete()
  local self = Window_GameExitInfo
  self:Initialize()
  self:Clear()
  self:Update()
end
function PaGlobalFunc_GameExit_SetShow(isShow, isAni, isAttacked)
  local self = Window_GameExitInfo
  ToClient_RequestCharacterEnchantFailCount()
  if isDeadInWatchingMode() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_GAMEEXITOPENALERT_INDEAD"))
    return
  end
  if CppEnums.EProcessorInputMode.eProcessorInputMode_ChattingInputMode == UI.Get_ProcessorInputMode() then
    return
  end
  local currentUIMode = GetUIMode()
  if currentUIMode == Defines.UIMode.eUIMode_Gacha_Roulette or currentUIMode == Defines.UIMode.eUIMode_DeadMessage then
    return
  end
  if true == ToClient_cutsceneIsPlay() then
    return
  end
  if true == isFlushedUI() then
    return
  end
  if true == isAttacked then
    return
  end
  if true == isGameTypeRussia() and true == isAttacked then
    local regionInfo = getRegionInfoByPosition(getSelfPlayer():get():getPosition())
    if true == regionInfo:get():isSafeZone() then
      return
    end
  end
  if true == isShow then
    SetUIMode(Defines.UIMode.eUIMode_GameExit)
    sendWaitingListOfMyCharacters()
    self:Clear()
    self:Update()
  else
    SetUIMode(Defines.UIMode.eUIMode_Default)
    if -1 ~= self._currentExitType then
      PaGlobalFunc_GameExit_ButtonClick_ExitCancel()
    end
  end
  Panel_Window_GameExit:SetShow(isShow, isAni)
  self._currentPhotoIndex = 0
end
function PaGlobalFunc_GameExit_GetShow()
  return Panel_Window_GameExit:GetShow()
end
function GameExitShowToggle(isAttacked)
  PaGlobalFunc_GameExit_SetShow(not PaGlobalFunc_GameExit_GetShow(), false, isAttacked)
end
function PaGlobalFunc_GameExit_ExitHandler(ExitType)
  local self = Window_GameExitInfo
  if self._config._exitType_GameExit == ExitType then
    self:ExitToGameOff()
  elseif self._config._exitType_CharacterSelect == ExitType then
    self:ExitToCharacterSelect()
  elseif self._config._exitType_Tray == ExitType then
    ToClient_CheckTrayIcon()
  elseif self._config._exitType_UnTray == ExitType then
    ToClient_UnCheckTrayIcon()
  else
    _PA_LOG("\236\157\180\237\152\184\236\132\156", "\236\162\133\235\163\140 \237\131\128\236\158\133\236\157\180 \236\158\152\235\170\187\235\144\144\236\138\181\235\139\136\235\139\164.")
  end
end
function PaGlobalFunc_CharChangePhoto_Y()
  local self = Window_GameExitInfo
  if false == Panel_Window_GameExit:GetShow() then
    return
  end
  PaGlobalFunc_GameExit_SetShow(false, false)
  IsGameExitPhoto(true)
  IngameCustomize_Show()
  characterSlot_Index(self._selfPlayerIndex)
  self._isTakePhoto = true
end
function Window_GameExitInfo:XB_Control_Init()
  Panel_Window_GameExit:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_LB, "PaGlobalFunc_GameExit_UpdateCharList(-1)")
  Panel_Window_GameExit:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_RB, "PaGlobalFunc_GameExit_UpdateCharList(1)")
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_FromClient_GameExit_luaLoadComplete")