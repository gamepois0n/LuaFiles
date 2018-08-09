Panel_Window_PetExchange_Renew:SetShow(false)
Panel_Window_PetExchange_Renew:ignorePadSnapMoveToOtherPanel()
local petExchange = {
  _ui = {
    _static_MainTitleBG = UI.getChildControl(Panel_Window_PetExchange_Renew, "Static_MainTitleBG"),
    _static_CenterBG = UI.getChildControl(Panel_Window_PetExchange_Renew, "Static_CenterBG"),
    _static_BottomBG = UI.getChildControl(Panel_Window_PetExchange_Renew, "Static_BottomBG"),
    _static_BottomKeyBG = UI.getChildControl(Panel_Window_PetExchange_Renew, "Static_BottomKeyBG")
  },
  _config = {
    _petComposeString = PAGetString(Defines.StringSheet_GAME, "PANEL_PETLIST_PETCOMPOSE_NAME"),
    _petComposeDescString = PAGetString(Defines.StringSheet_GAME, "PANEL_PETLIST_PETCOMPOSE_DESC"),
    _NonePetInfo = 0,
    _APetInfo = 2,
    _BPetInfo = 1,
    _JokerPetRace = 99,
    _ComposableTierGap = 2,
    _RightFrame = {
      _ColumCount = 2,
      _RowCount = 1,
      _SlotCount = 4
    },
    _BSlot = {
      _startX = 5,
      _startY = 5,
      _gapX = 10,
      _gapY = 10
    },
    _defaultPetNameCount = 10,
    _defaultPetName = {
      [0] = "Darcy",
      [1] = "Buddy",
      [2] = "Orbit",
      [3] = "Rushmore",
      [4] = "Carolina",
      [5] = "Cindy",
      [6] = "Waffles",
      [7] = "Sparky",
      [8] = "Bailey",
      [9] = "Wichita",
      [10] = "Buck"
    },
    _buttonGap = 50
  },
  _select_APetNo = nil,
  _select_APetRace = -1,
  _select_APetTier = -1,
  _select_APetIsJokerPetUse = false,
  _totalPetCount = 0,
  _select_BPetNo = nil,
  _BSlotContents = {},
  _slidIndex = 0,
  _columIndex = 0
}
function petExchange:initControl()
  local petExchangeUI = self._ui
  petExchangeUI._staticText_Title = UI.getChildControl(petExchangeUI._static_MainTitleBG, "StaticText_Title")
  petExchangeUI._static_PetIconSlot = UI.getChildControl(petExchangeUI._static_CenterBG, "Static_PetIconSlot1")
  petExchangeUI._static_PetIconA = UI.getChildControl(petExchangeUI._static_PetIconSlot, "Static_PetIcon")
  petExchangeUI._staticText_NameA = UI.getChildControl(petExchangeUI._static_PetIconSlot, "StaticText_Name")
  petExchangeUI._staticText_TierA = UI.getChildControl(petExchangeUI._static_PetIconSlot, "StaticText_Gen")
  petExchangeUI._frame_Right = UI.getChildControl(petExchangeUI._static_CenterBG, "Frame_Right")
  petExchangeUI._frame_Content = UI.getChildControl(petExchangeUI._frame_Right, "Frame_Content")
  petExchangeUI._frame_VerticalScroll = UI.getChildControl(petExchangeUI._frame_Right, "Frame_VerticalScroll")
  petExchangeUI._frame_HorizontalScroll = UI.getChildControl(petExchangeUI._frame_Right, "Frame_HorizontalScroll")
  petExchangeUI._static_PetIconSlot_Template = UI.getChildControl(petExchangeUI._frame_Content, "Static_PetIconSlot_Template")
  petExchangeUI._static_PetIconSlot_Template:SetShow(false)
  petExchangeUI._radioButton_Aface = UI.getChildControl(petExchangeUI._static_BottomBG, "RadioButton_Aface")
  petExchangeUI._radioButton_Noface = UI.getChildControl(petExchangeUI._static_BottomBG, "RadioButton_Noface")
  petExchangeUI._radioButton_Bface = UI.getChildControl(petExchangeUI._static_BottomBG, "RadioButton_Bface")
  petExchangeUI._radioButton_Askill = UI.getChildControl(petExchangeUI._static_BottomBG, "RadioButton_Askill")
  petExchangeUI._radioButton_Noskill = UI.getChildControl(petExchangeUI._static_BottomBG, "RadioButton_Noskill")
  petExchangeUI._radioButton_Bskill = UI.getChildControl(petExchangeUI._static_BottomBG, "RadioButton_Bskill")
  petExchangeUI._radioButton_Askill:registerPadEvent(__eConsoleUIPadEvent_Up_A, "PaGlobalFunc_PetExchange_Buttoncheck( false, " .. self._config._APetInfo .. " )")
  petExchangeUI._radioButton_Bskill:registerPadEvent(__eConsoleUIPadEvent_Up_A, "PaGlobalFunc_PetExchange_Buttoncheck( false, " .. self._config._BPetInfo .. " )")
  petExchangeUI._radioButton_Noskill:registerPadEvent(__eConsoleUIPadEvent_Up_A, "PaGlobalFunc_PetExchange_Buttoncheck( false )")
  petExchangeUI._radioButton_Aface:registerPadEvent(__eConsoleUIPadEvent_Up_A, "PaGlobalFunc_PetExchange_Buttoncheck( true, " .. self._config._APetInfo .. " )")
  petExchangeUI._radioButton_Bface:registerPadEvent(__eConsoleUIPadEvent_Up_A, "PaGlobalFunc_PetExchange_Buttoncheck( true, " .. self._config._BPetInfo .. " )")
  petExchangeUI._radioButton_Noface:registerPadEvent(__eConsoleUIPadEvent_Up_A, "PaGlobalFunc_PetExchange_Buttoncheck( true )")
  petExchangeUI._edit_Search = UI.getChildControl(petExchangeUI._static_BottomBG, "Edit_Search")
  petExchangeUI._staticText_Exchange_ConsoleUI = UI.getChildControl(petExchangeUI._static_BottomKeyBG, "StaticText_Exchange_ConsoleUI")
  petExchangeUI._staticText_Cancel_ConsoleUI = UI.getChildControl(petExchangeUI._static_BottomKeyBG, "StaticText_Cancel_ConsoleUI")
  petExchangeUI._staticText_ChangeName_ConsoleUI = UI.getChildControl(petExchangeUI._static_BottomKeyBG, "StaticText_ChangeName_ConsoleUI")
  petExchangeUI._staticText_Confirm_ConsoleUI = UI.getChildControl(petExchangeUI._static_BottomKeyBG, "StaticText_Confirm_ConsoleUI")
  local xPos = petExchangeUI._staticText_Cancel_ConsoleUI:GetPosX() - petExchangeUI._staticText_Confirm_ConsoleUI:GetTextSizeX() - self._config._buttonGap
  petExchangeUI._staticText_Confirm_ConsoleUI:SetPosX(xPos)
  xPos = xPos - petExchangeUI._staticText_ChangeName_ConsoleUI:GetTextSizeX() - self._config._buttonGap
  petExchangeUI._staticText_ChangeName_ConsoleUI:SetPosX(xPos)
  xPos = xPos - petExchangeUI._staticText_Exchange_ConsoleUI:GetTextSizeX() - self._config._buttonGap
  petExchangeUI._staticText_Exchange_ConsoleUI:SetPosX(xPos)
  petExchangeUI._staticText_Exchange_ConsoleUI:addInputEvent("Mouse_LUp", "PaGlobalFunc_PetExchange_ExchangeConfirm()")
  petExchangeUI._staticText_Cancel_ConsoleUI:addInputEvent("Mouse_LUp", "PaGlobalFunc_PetExchange_Close()")
  petExchangeUI._staticText_ChangeName_ConsoleUI:addInputEvent("Mouse_LUp", "PaGlobalFunc_PetExchange_ChangeName()")
  UIScroll.InputEvent(petExchangeUI._frame_VerticalScroll, "petExchange_Scroll")
  UIScroll.InputEvent(petExchangeUI._frame_HorizontalScroll, "petExchange_Scroll")
  petExchangeUI._frame_Right:addInputEvent("Mouse_UpScroll", "petExchange_Scroll( true )")
  petExchangeUI._frame_Right:addInputEvent("Mouse_DownScroll", "petExchange_Scroll( false )")
  Panel_Window_PetExchange_Renew:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "PaGlobalFunc_PetExchange_ExchangeConfirm()")
  Panel_Window_PetExchange_Renew:registerPadEvent(__eConsoleUIPadEvent_Up_X, "PaGlobalFunc_PetExchange_ChangeName()")
  petExchangeUI._edit_Search:setXboxVirtualKeyBoardEndEvent("Input_PetExchangeName_KeyboardEnd")
  petExchangeUI._edit_Search:RegistReturnKeyEvent("PaGlobalFunc_PetExchange_ExchangeConfirm()")
end
function PaGlobalFunc_PetExchange_Buttoncheck(isApperance, button)
  if true == isApperance then
    petExchange:apperanceButtonControl(button)
  else
    petExchange:skillButtonControl(button)
  end
end
function petExchange:apperanceButtonControl(button)
  local petExchangeUI = self._ui
  petExchangeUI._radioButton_Aface:SetCheck(false)
  petExchangeUI._radioButton_Noface:SetCheck(false)
  petExchangeUI._radioButton_Bface:SetCheck(false)
  if button == self._config._APetInfo then
    petExchangeUI._radioButton_Aface:SetCheck(true)
  elseif button == self._config._BPetInfo then
    petExchangeUI._radioButton_Bface:SetCheck(true)
  else
    petExchangeUI._radioButton_Noface:SetCheck(true)
  end
end
function petExchange:skillButtonControl(button)
  local petExchangeUI = self._ui
  petExchangeUI._radioButton_Askill:SetCheck(false)
  petExchangeUI._radioButton_Noskill:SetCheck(false)
  petExchangeUI._radioButton_Bskill:SetCheck(false)
  if button == self._config._APetInfo then
    petExchangeUI._radioButton_Askill:SetCheck(true)
  elseif button == self._config._BPetInfo then
    petExchangeUI._radioButton_Bskill:SetCheck(true)
  else
    petExchangeUI._radioButton_Noskill:SetCheck(true)
  end
end
function petExchange:creatControl()
  local FrameConfig = petExchange._config._RightFrame
  local SlotCount = FrameConfig._SlotCount
  local petExchangeUI = self._ui
  local petExchangeConfig = self._config
  petExchangeUI._frame_Content = petExchangeUI._frame_Right:GetFrameContent()
  petExchangeUI._frame_Content:SetShow(true)
  for index = 0, SlotCount - 1 do
    local tempContentSlot = UI.getChildControl(petExchangeUI._frame_Content, "Static_PetIconSlot_Template")
    local slot = {}
    slot._frameContents = UI.cloneControl(tempContentSlot, petExchangeUI._frame_Content, "BPet_Slot_" .. index)
    slot._static_PetIcon = UI.getChildControl(slot._frameContents, "Static_PetIcon")
    slot._staticText_Name = UI.getChildControl(slot._frameContents, "StaticText_Name")
    slot._staticText_Tier = UI.getChildControl(slot._frameContents, "StaticText_Gen")
    slot._frameContents:SetPosX(petExchangeConfig._BSlot._startX + index % 2 * (slot._frameContents:GetSizeX() + petExchangeConfig._BSlot._gapX))
    slot._frameContents:SetPosY(petExchangeConfig._BSlot._startY + math.floor(index / 2) * (slot._frameContents:GetSizeY() + petExchangeConfig._BSlot._gapY))
    self._BSlotContents[index] = slot
  end
end
function petExchange:scrollEventProcess(isUp)
  local petExchangeUI = petExchange._ui
  local FrameConfig = petExchange._config._RightFrame
  if petExchange._totalPetCount <= FrameConfig._SlotCount then
    return
  end
  if (ToClient_isXBox() or ToClient_IsDevelopment()) and petExchange._slidIndex < petExchange._totalPetCount - FrameConfig._RowCount then
    ToClient_padSnapIgnoreGroupMove()
  end
  petExchange._slidIndex = UIScroll.ScrollEvent(petExchangeUI._frame_VerticalScroll, isUp, FrameConfig._RowCount, petExchange._totalPetCount, petExchange._slidIndex, FrameConfig._ColumCount)
  if petExchange._totalPetCount % 2 == 1 and petExchange._slidIndex == petExchange._totalPetCount - FrameConfig._RowCount * FrameConfig._ColumCount then
    petExchange._slidIndex = petExchange._slidIndex + 1
  end
  self:updateSlot()
end
function petExchange_Scroll(isUp)
  petExchange:scrollEventProcess(isUp)
end
function petExchange:updateSlot()
  local FrameConfig = self._config._RightFrame
  local ExchangeConfig = self._config
  for index = 0, FrameConfig._SlotCount - 1 do
    local slot = self._BSlotContents[index]
    slot._frameContents:SetShow(false)
    slot._frameContents:SetCheck(false)
    slot._frameContents:addInputEvent("Mouse_LUp", "")
  end
  local sealPetCount = ToClient_getPetSealedList()
  if sealPetCount <= 0 then
    return
  end
  if nil == self._select_APetRace or 0 > self._select_APetRace then
    return
  end
  local APetNo_64 = tonumber64(self._select_APetNo)
  local BPetNo_64
  if nil ~= self._select_BPetNo then
    BPetNo_64 = tonumber64(self._select_BPetNo)
  end
  local ExchangablePetCount = 0
  local UIIndex = 0
  for index = 0, sealPetCount - 1 do
    local petData = ToClient_getPetSealedDataByIndex(index)
    if nil ~= petData then
      local petNo = petData._petNo
      local petStaticStatus = petData:getPetStaticStatus()
      local petTier = petStaticStatus:getPetTier() + 1
      local petName = petData:getName()
      local petIconPath = petData:getIconPath()
      local petLevel = petData._level
      local petRace = petStaticStatus:getPetRace()
      local isNotSamePet = APetNo_64 ~= petNo
      local isTierExchangable = math.abs(petTier - self._select_APetTier) < ExchangeConfig._ComposableTierGap or ExchangeConfig._JokerPetRace == petRace
      local isRaceSame = self._select_APetRace == petRace or true == self._select_APetIsJokerPetUse and ExchangeConfig._JokerPetRace == petRace
      if isNotSamePet and isTierExchangable and isRaceSame then
        if ExchangablePetCount >= self._slidIndex and ExchangablePetCount < self._slidIndex + FrameConfig._SlotCount then
          local slot = self._BSlotContents[UIIndex]
          slot._static_PetIcon:ChangeTextureInfoNameAsync(petIconPath)
          slot._staticText_Name:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. petLevel .. " " .. petName)
          slot._staticText_Tier:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVANT_TIER", "tier", petTier))
          slot._static_PetIcon:addInputEvent("Mouse_LUp", "PaGlobalFunc_PetExchange_SelectBPet(\"" .. tostring(petNo) .. "\")")
          slot._static_PetIcon:addInputEvent("Mouse_UpScroll", "petExchange_Scroll( true )")
          slot._static_PetIcon:addInputEvent("Mouse_DownScroll", "petExchange_Scroll( false )")
          if UIIndex < FrameConfig._ColumCount then
            slot._frameContents:registerPadEvent(__eConsoleUIPadEvent_DpadUp, "petExchange_Scroll( true)")
          else
            slot._frameContents:registerPadEvent(__eConsoleUIPadEvent_DpadDown, "petExchange_Scroll( false )")
          end
          slot._frameContents:SetShow(true)
          local isEqaulPet = BPetNo_64 ~= nil and BPetNo_64 == petNo
          slot._frameContents:SetCheck(isEqaulPet)
          UIIndex = UIIndex + 1
        end
        ExchangablePetCount = ExchangablePetCount + 1
      end
    end
  end
  self._totalPetCount = ExchangablePetCount
  if FrameConfig._SlotCount < self._totalPetCount then
    local subCount = FrameConfig._ColumCount
    if ExchangablePetCount % 2 == 1 then
      subCount = subCount - 1
    end
    self._ui._frame_VerticalScroll:SetControlPos(self._slidIndex / (ExchangablePetCount - subCount))
    self._ui._frame_VerticalScroll:SetShow(true)
  else
    self._ui._frame_VerticalScroll:SetControlPos(0)
    self._slidIndex = 0
    self._ui._frame_VerticalScroll:SetShow(false)
  end
  if 0 == self._totalPetCount then
    self._ui._frame_Right:SetShow(false)
    self._ui._frame_Right:SetIgnore(true)
  else
    self._ui._frame_Right:SetShow(true)
    self._ui._frame_Right:SetIgnore(false)
  end
end
function petExchange_UpdateSlot()
  petExchange:updateSlot()
end
function petExchange:initialize()
  self:initControl()
  self:creatControl()
  self:setPosition()
end
function petExchange:resetData()
  local petExchangeUI = self._ui
  petExchangeUI._radioButton_Aface:SetCheck(false)
  petExchangeUI._radioButton_Noface:SetCheck(true)
  petExchangeUI._radioButton_Bface:SetCheck(false)
  petExchangeUI._radioButton_Askill:SetCheck(false)
  petExchangeUI._radioButton_Noskill:SetCheck(true)
  petExchangeUI._radioButton_Bskill:SetCheck(false)
  local randomIndex = math.floor(math.random(0, self._config._defaultPetNameCount - 1))
  petExchangeUI._edit_Search:SetEditText(self._config._defaultPetName[randomIndex], true)
  petExchangeUI._edit_Search:SetMaxInput(getGameServiceTypePetNameLength())
  self._select_APetNo = nil
  self._select_APetRace = -1
  self._select_APetTier = -1
  self._select_APetIsJokerPetUse = false
  self._totalPetCount = 0
  petExchangeUI._frame_VerticalScroll:SetControlPos(0)
  self._slidIndex = 0
  self._columIndex = 0
  self._select_BPetNo = nil
  self:clearBSlotData()
end
function petExchange:open()
  if true == Panel_Window_PetExchange_Renew:GetShow() then
    return
  end
  self:setPosition()
  Panel_Window_PetExchange_Renew:SetShow(true)
end
function petExchange:close()
  if false == Panel_Window_PetExchange_Renew:GetShow() then
    return
  end
  Panel_Window_PetExchange_Renew:SetShow(false)
  PaGlobalFunc_Petlist_TemporaryOpen()
end
function petExchange:update()
  ClearFocusEdit(self._ui._edit_Search)
  local sealPetCount = ToClient_getPetSealedList()
  if sealPetCount < 0 then
    return
  end
  local APetNo_64 = tonumber64(self._select_APetNo)
  local BSlotIndex = 0
  for index = 0, sealPetCount - 1 do
    local petData = ToClient_getPetSealedDataByIndex(index)
    if nil ~= petData and APetNo_64 == petData._petNo then
      self:setAPetSlotData(petData)
    end
  end
  self:updateSlot()
end
function petExchange:clearBSlotData()
  self._ui._frame_VerticalScroll:SetControlPos(0)
  self._slidIndex = 0
  self._columIndex = 0
end
function petExchange:setAPetSlotData(petData)
  local petStaticStatus = petData:getPetStaticStatus()
  local petTier = petStaticStatus:getPetTier() + 1
  local petName = petData:getName()
  local petIconPath = petData:getIconPath()
  local petLevel = petData._level
  local petRace = petStaticStatus:getPetRace()
  local isJokerPetUse = petStaticStatus._isJokerPetUse
  local petExchangeUI = self._ui
  petExchangeUI._static_PetIconA:ChangeTextureInfoNameAsync(petIconPath)
  petExchangeUI._staticText_NameA:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. petLevel .. " " .. petName)
  petExchangeUI._staticText_TierA:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVANT_TIER", "tier", petTier))
  self._select_APetRace = petRace
  self._select_APetTier = petTier
  self._select_APetIsJokerPetUse = isJokerPetUse
end
function petExchange:setNameEditControl()
  local petExchangeUI = self._ui
  petExchangeUI._edit_Search:SetMaxInput(getGameServiceTypePetNameLength())
  SetFocusEdit(petExchangeUI._edit_Search)
  petExchangeUI._edit_Search:SetEditText("", true)
end
function petExchange:confirm()
  local petExchangeUI = self._ui
  local petName = petExchangeUI._edit_Search:GetEditText()
  if "" == petName or self._config._petComposeString == petName then
    Proc_ShowMessage_Ack(self._config._petComposeString)
    return
  end
  ClearFocusEdit()
  if nil == petExchange._select_BPetNo then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "PANEL_PETLIST_PETCOMPOSE_REGIST"))
    return
  end
  local function confirm_compose()
    local SkillInherit = self._config._NonePetInfo
    local LookChange = self._config._NonePetInfo
    if petExchangeUI._radioButton_Askill:IsCheck() then
      SkillInherit = self._config._APetInfo
    elseif petExchangeUI._radioButton_Bskill:IsCheck() then
      SkillInherit = self._config._BPetInfo
    end
    if petExchangeUI._radioButton_Aface:IsCheck() then
      LookChange = self._config._APetInfo
    elseif petExchangeUI._radioButton_Bface:IsCheck() then
      LookChange = self._config._BPetInfo
    end
    ToClient_requestPetFusion(petName, tonumber64(self._select_APetNo), tonumber64(self._select_BPetNo), SkillInherit, LookChange)
  end
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "PANEL_PETLIST_PETCOMPOSE_MSGCONTENT")
  local messageBoxData = {
    title = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SERVANTMIX_TITLE"),
    content = messageBoxMemo,
    functionYes = confirm_compose,
    functionNo = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData)
end
function petExchange:setPosition()
  local petExchangeUI = self._ui
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelSizeX = Panel_Window_PetExchange_Renew:GetSizeX()
  local panelSizeY = Panel_Window_PetExchange_Renew:GetSizeY()
  Panel_Window_PetExchange_Renew:SetPosX(scrSizeX / 2 - panelSizeX / 2)
  Panel_Window_PetExchange_Renew:SetPosY(scrSizeY / 2 - panelSizeY / 2)
end
function petExchange:registEventHandler()
  registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_PetExchange")
end
function PaGlobalFunc_PetExchange_Open(selectPetNoStr)
  if nil == selectPetNoStr or "" == selectPetNoStr then
    return
  end
  petExchange:resetData()
  petExchange:open()
  petExchange._select_APetNo = selectPetNoStr
  petExchange:update()
end
function PaGlobalFunc_PetExchange_Close()
  petExchange:close()
end
function PaGlobalFunc_PetExchange_ChangeName()
  petExchange:setNameEditControl()
end
function Input_PetExchangeName_KeyboardEnd(str)
  petExchange._ui._edit_Search:SetEditText(str)
  ClearFocusEdit()
  PaGlobalFunc_PetExchange_ExchangeConfirm()
end
function PaGlobalFunc_PetExchange_ExchangeConfirm()
  petExchange:confirm()
  petExchange:close()
  FGlobal_PetList_ClosePopupMenu()
end
function petExchange:selectBPet(petNoStr, UIIndex)
  self._select_BPetNo = petNoStr
  if nil ~= UIIndex then
    for index = 0, self._config._RightFrame._SlotCount - 1 do
      self._BSlotContents[index]._frameContents:SetCheck(false)
    end
    self._BSlotContents[UIIndex]._frameContents:SetCheck(true)
  end
  ToClient_padSnapSetTargetGroup(self._ui._static_BottomBG)
end
function PaGlobalFunc_PetExchange_SelectBPet(petNoStr, UIIndex)
  petExchange:selectBPet(petNoStr, UIIndex)
end
function FromClient_luaLoadComplete_PetExchange()
  petExchange:initialize()
end
function FGlobal_CheckEditBox_PetCompose(uiEditBox)
  return nil ~= uiEditBox and nil ~= petExchange._ui._edit_Search and uiEditBox:GetKey() == petExchange._ui._edit_Search:GetKey()
end
petExchange:registEventHandler()
