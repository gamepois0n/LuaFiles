Panel_Window_PetExchange_Renew:SetShow(false)
local petExchange = {
  _ui = {
    _static_MainTitleBG = UI.getChildControl(Panel_Window_PetExchange_Renew, "Static_MainTitleBG"),
    _static_CenterBG = UI.getChildControl(Panel_Window_PetExchange_Renew, "Static_CenterBG"),
    _static_BottomKeyBG = UI.getChildControl(Panel_Window_PetExchange_Renew, "Static_BottomKeyBG")
  },
  _config = {
    _petComposeString = PAGetString(Defines.StringSheet_GAME, "PANEL_PETLIST_PETCOMPOSE_NAME"),
    _petComposeDescString = PAGetString(Defines.StringSheet_GAME, "PANEL_PETLIST_PETCOMPOSE_DESC"),
    _NonePetInfo = 0,
    _APetInfo = 1,
    _BPetInfo = 2,
    _JokerPetRace = 99,
    _ComposableTierGap = 2,
    _RightFrame = {
      _ColumCount = 2,
      _RowCount = 1,
      _SlotCount = 4
    },
    _BSlot = {_gapX = 10, _gapY = 10},
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
    }
  },
  _select_APetNo = -1,
  _select_APetRace = -1,
  _select_APetTier = -1,
  _select_APetIsJokerPetUse = false,
  _totalPetCount = 0,
  _select_BPetNo = -1,
  _BSlotContents = {},
  _slidIndex = 0,
  _columIndex = 0
}
function petExchange:initControl()
  local petExchangeUI = self._ui
  petExchangeUI._staticText_Title = UI.getChildControl(petExchangeUI._static_MainTitleBG, "StaticText_Title")
  petExchangeUI._radioButton_Aface = UI.getChildControl(petExchangeUI._static_CenterBG, "RadioButton_Aface")
  petExchangeUI._radioButton_Noface = UI.getChildControl(petExchangeUI._static_CenterBG, "RadioButton_Noface")
  petExchangeUI._radioButton_Bface = UI.getChildControl(petExchangeUI._static_CenterBG, "RadioButton_Bface")
  petExchangeUI._radioButton_Askill = UI.getChildControl(petExchangeUI._static_CenterBG, "RadioButton_Askill")
  petExchangeUI._radioButton_Noskill = UI.getChildControl(petExchangeUI._static_CenterBG, "RadioButton_Noskill")
  petExchangeUI._radioButton_Bskill = UI.getChildControl(petExchangeUI._static_CenterBG, "RadioButton_Bskill")
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
  petExchangeUI._edit_Search = UI.getChildControl(petExchangeUI._static_CenterBG, "Edit_Search")
  petExchangeUI._staticText_Exchange_ConsoleUI = UI.getChildControl(petExchangeUI._static_BottomKeyBG, "StaticText_Exchange_ConsoleUI")
  petExchangeUI._staticText_Cancel_ConsoleUI = UI.getChildControl(petExchangeUI._static_BottomKeyBG, "StaticText_Cancel_ConsoleUI")
  petExchangeUI._staticText_ChangeName_ConsoleUI = UI.getChildControl(petExchangeUI._static_BottomKeyBG, "StaticText_ChangeName_ConsoleUI")
  petExchangeUI._button_Exchange = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_BUTTON, petExchangeUI._static_BottomKeyBG, "_button_Exchange")
  CopyBaseProperty(petExchangeUI._staticText_Exchange_ConsoleUI, petExchangeUI._button_Exchange)
  petExchangeUI._button_Exchange:addInputEvent("Mouse_LUp", "FGlobal_PetExchange_ExchangeConfirm()")
  petExchangeUI._button_Cancle = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_BUTTON, petExchangeUI._static_BottomKeyBG, "_button_Cancle")
  CopyBaseProperty(petExchangeUI._staticText_Cancel_ConsoleUI, petExchangeUI._button_Cancle)
  petExchangeUI._button_Cancle:addInputEvent("Mouse_LUp", "FGlobal_PetExchange_Close()")
  petExchangeUI._button_ChangeName = UI.createControl(CppEnums.PA_UI_CONTROL_TYPE.PA_UI_CONTROL_BUTTON, petExchangeUI._static_BottomKeyBG, "_button_ChangeName")
  CopyBaseProperty(petExchangeUI._staticText_ChangeName_ConsoleUI, petExchangeUI._button_ChangeName)
  petExchangeUI._button_ChangeName:addInputEvent("Mouse_LUp", "FGlobal_PetExchange_ChangeName()")
  UIScroll.InputEvent(petExchangeUI._frame_VerticalScroll, "petExchange_Scroll")
  petExchangeUI._frame_Content:addInputEvent("Mouse_UpScroll", "petExchange_Scroll( true )")
  petExchangeUI._frame_Content:addInputEvent("Mouse_DownScroll", "petExchange_Scroll( false )")
  Panel_Window_PetExchange_Renew:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_A, "FGlobal_PetExchange_ExchangeConfirm()")
  Panel_Window_PetExchange_Renew:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_B, "FGlobal_PetExchange_Close()")
  Panel_Window_PetExchange_Renew:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_X, "FGlobal_PetExchange_ChangeName()")
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
    slot._frameContents:SetPosX(index % 2 * (slot._frameContents:GetSizeX() + petExchangeConfig._BSlot._gapX))
    slot._frameContents:SetPosY(math.floor(index / 2) * (slot._frameContents:GetSizeY() + petExchangeConfig._BSlot._gapY))
    self._BSlotContents[index] = slot
  end
end
function petExchange_Scroll(isUp)
  local petExchangeUI = petExchange._ui
  local FrameConfig = petExchange._config._RightFrame
  petExchange._slidIndex = UIScroll.ScrollEvent(petExchangeUI._frame_VerticalScroll, isUp, FrameConfig._RowCount, petExchange._totalPetCount, petExchange._slidIndex, FrameConfig._ColumCount)
  if petExchange._totalPetCount % 2 == 1 and petExchange._slidIndex == petExchange._totalPetCount - FrameConfig._RowCount * FrameConfig._ColumCount then
    petExchange._slidIndex = petExchange._slidIndex + 1
  end
  petExchange_UpdateSlot()
end
function petExchange_UpdateSlot()
  local FrameConfig = petExchange._config._RightFrame
  local ExchangeConfig = petExchange._config
  local self = petExchange
  for index = 0, FrameConfig._SlotCount - 1 do
    local slot = petExchange._BSlotContents[index]
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
      local isNotSamePet = self._select_APetNo ~= petNo
      local isTierExchangable = math.abs(petTier - self._select_APetTier) < ExchangeConfig._ComposableTierGap or ExchangeConfig._JokerPetRace == petRace
      local isRaceSame = self._select_APetRace == petRace or true == self._select_APetIsJokerPetUse and ExchangeConfig._JokerPetRace == petRace
      if isNotSamePet and isTierExchangable and isRaceSame then
        if ExchangablePetCount >= petExchange._slidIndex and ExchangablePetCount < petExchange._slidIndex + FrameConfig._SlotCount then
          local slot = petExchange._BSlotContents[UIIndex]
          slot._static_PetIcon:ChangeTextureInfoNameAsync(petIconPath)
          slot._staticText_Name:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. petLevel .. " " .. petName)
          slot._staticText_Tier:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVANT_TIER", "tier", petTier))
          slot._static_PetIcon:addInputEvent("Mouse_LUp", "FGlobal_PetExchange_SelectBPet(" .. tostring(petNo) .. ")")
          slot._static_PetIcon:addInputEvent("Mouse_UpScroll", "petExchange_Scroll( true )")
          slot._static_PetIcon:addInputEvent("Mouse_DownScroll", "petExchange_Scroll( false )")
          slot._frameContents:SetShow(true)
          UIIndex = UIIndex + 1
        end
        ExchangablePetCount = ExchangablePetCount + 1
      end
    end
  end
  self._totalPetCount = ExchangablePetCount
  if ExchangablePetCount >= FrameConfig._SlotCount then
    petExchange._ui._frame_VerticalScroll:SetShow(true)
    petExchange._ui._frame_VerticalScroll:SetControlPos(petExchange._slidIndex / (ExchangablePetCount - FrameConfig._SlotCount))
  else
    petExchange._slidIndex = 0
    petExchange._ui._frame_VerticalScroll:SetShow(false)
  end
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
  self._select_APetNo = -1
  self._select_APetRace = -1
  self._select_APetTier = -1
  self._select_APetIsJokerPetUse = false
  petExchangeUI._frame_VerticalScroll:SetControlPos(0)
  self._totalPetCount = 0
  self._slidIndex = 0
  self._columIndex = 0
  self._select_BPetNo = -1
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
end
function petExchange:update()
  ClearFocusEdit(self._ui._edit_Search)
  local sealPetCount = ToClient_getPetSealedList()
  if sealPetCount < 0 then
    return
  end
  local BSlotIndex = 0
  for index = 0, sealPetCount - 1 do
    local petData = ToClient_getPetSealedDataByIndex(index)
    if nil ~= petData and self._select_APetNo == petData._petNo then
      self:setAPetSlotData(petData)
    end
  end
  petExchange_UpdateSlot()
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
  ClearFocusEdit(petExchangeUI._edit_Search)
  local petName = petExchangeUI._edit_Search:GetEditText()
  if "" == petName or self._config._petComposeString == petName then
    Proc_ShowMessage_Ack(self._config._petComposeString)
    return
  end
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
    ToClient_requestPetFusion(petName, self._select_APetNo, self._select_BPetNo, SkillInherit, LookChange)
  end
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "PANEL_PETLIST_PETCOMPOSE_MSGCONTENT")
  local messageBoxData = {
    title = PAGetString(Defines.StringSheet_GAME, "PANEL_SERVANTMIX_TITLE"),
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
function FGlobal_PetExchange_Open(selectPetNo)
  if nil == selectPetNo then
    return
  end
  petExchange:resetData()
  petExchange:open()
  petExchange._select_APetNo = tonumber64(selectPetNo)
  petExchange:update()
end
function FGlobal_PetExchange_Close()
  petExchange:close()
end
function FGlobal_PetExchange_ChangeName()
  petExchange:setNameEditControl()
end
function FGlobal_PetExchange_ExchangeConfirm()
  petExchange:confirm()
  petExchange:close()
end
function FGlobal_PetExchange_SelectBPet(petNo)
  petExchange._select_BPetNo = tonumber64(petNo)
end
function FromClient_luaLoadComplete_PetExchange()
  petExchange:initialize()
end
function FGlobal_CheckEditBox_PetCompose(uiEditBox)
  return nil ~= uiEditBox and nil ~= petExchange._ui._edit_Search and uiEditBox:GetKey() == petExchange._ui._edit_Search:GetKey()
end
petExchange:registEventHandler()
