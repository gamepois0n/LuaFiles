Panel_Window_PetRegister_Renew:SetShow(false)
local petRegister = {
  _ui = {
    _static_subFrameBG = UI.getChildControl(Panel_Window_PetRegister_Renew, "Static_SubFrameBG"),
    _static_BottomKeyBG = UI.getChildControl(Panel_Window_PetRegister_Renew, "Static_BottomKeyBG"),
    _static_MainTitleBG = UI.getChildControl(Panel_Window_PetRegister_Renew, "Static_MainTitleBG")
  },
  _config = {
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
  _fromWhereType = -1,
  _fromSlotNo = -1
}
function petRegister:initControl()
  local petRegisterUI = self._ui
  petRegisterUI._staticText_RegisterDesc = UI.getChildControl(petRegisterUI._static_subFrameBG, "StaticText_RegisterDesc")
  petRegisterUI._static_PetIconSlot = UI.getChildControl(petRegisterUI._static_subFrameBG, "Static_PetIconSlot")
  petRegisterUI._static_PetIcon = UI.getChildControl(petRegisterUI._static_PetIconSlot, "Static_PetIcon")
  petRegisterUI._edit_Search = UI.getChildControl(petRegisterUI._static_subFrameBG, "Edit_Search")
  petRegisterUI._staticText_Confirm_ConsoleUI = UI.getChildControl(petRegisterUI._static_BottomKeyBG, "StaticText_Confirm_ConsoleUI")
  petRegisterUI._staticText_Cancel_ConsoleUI = UI.getChildControl(petRegisterUI._static_BottomKeyBG, "StaticText_Cancel_ConsoleUI")
  petRegisterUI._staticText_ChangeName_ConsoleUI = UI.getChildControl(petRegisterUI._static_BottomKeyBG, "StaticText_ChangeName_ConsoleUI")
  local UCT = CppEnums.PA_UI_CONTROL_TYPE
  petRegisterUI._button_Confirm = UI.createControl(UCT.PA_UI_CONTROL_RADIOBUTTON, petRegisterUI._static_BottomKeyBG, "button_confirm")
  CopyBaseProperty(petRegisterUI._staticText_Confirm_ConsoleUI, petRegisterUI._button_Confirm)
  petRegisterUI._button_Confirm:addInputEvent("Mouse_LUp", "FGlobal_PetRegister_Confirm()")
  petRegisterUI._button_Cancle = UI.createControl(UCT.PA_UI_CONTROL_RADIOBUTTON, petRegisterUI._static_BottomKeyBG, "button_cancle")
  CopyBaseProperty(petRegisterUI._staticText_Cancel_ConsoleUI, petRegisterUI._button_Cancle)
  petRegisterUI._button_Cancle:addInputEvent("Mouse_LUp", "FGlobal_PetRegister_Cancle()")
  petRegisterUI._button_ChangeName = UI.createControl(UCT.PA_UI_CONTROL_RADIOBUTTON, petRegisterUI._static_BottomKeyBG, "button_changeName")
  CopyBaseProperty(petRegisterUI._staticText_ChangeName_ConsoleUI, petRegisterUI._button_ChangeName)
  petRegisterUI._button_ChangeName:addInputEvent("Mouse_LUp", "FGlobal_PetRegister_ChangeName()")
  Panel_Window_PetRegister_Renew:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_A, "FGlobal_PetRegister_Confirm()")
  Panel_Window_PetRegister_Renew:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_B, "FGlobal_PetRegister_Cancle()")
  Panel_Window_PetRegister_Renew:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_X, "FGlobal_PetRegister_ChangeName()")
end
function petRegister:setPosition()
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelSizeX = Panel_Window_PetRegister_Renew:GetSizeX()
  local panelSizeY = Panel_Window_PetRegister_Renew:GetSizeY()
  Panel_Window_PetRegister_Renew:SetPosX(scrSizeX / 2 - panelSizeX / 2)
  Panel_Window_PetRegister_Renew:SetPosY(scrSizeY / 2 - panelSizeY / 2)
end
function petRegister:open()
  if true == Panel_Window_PetRegister_Renew:GetShow() then
    return
  end
  self:setPosition()
  Panel_Window_PetRegister_Renew:SetShow(true)
end
function petRegister:close()
  local petRegisterUI = self._ui
  if not Panel_Window_PetRegister_Renew:GetShow() then
    return
  end
  Panel_Window_PetRegister_Renew:SetShow(false)
  ClearFocusEdit(petRegisterUI._staticText_RegisterDesc)
end
function petRegister:initialize()
  local petRegisterUI = self._ui
  local UI_TM = CppEnums.TextMode
  petRegisterUI._edit_Search:SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEINFO_EDITBOX_COMMENT"), true)
  if isGameTypeEnglish() or isGameTypeTaiwan() or isGameTypeTR() or isGameTypeTH() or isGameTypeID() then
    petRegisterUI._static_PetIconSlot:SetTextMode(UI_TM.eTextMode_AutoWrap)
  end
  if isGameTypeEnglish() or isGameTypeTaiwan() then
    petRegisterUI._static_PetIconSlot:SetText(PAGetString(Defines.StringSheet_GAME, "COMMON_CHARACTERCREATEPOLICY_EN"))
  elseif isGameTypeTR() then
    petRegisterUI._static_PetIconSlot:SetText(PAGetString(Defines.StringSheet_GAME, "COMMON_CHARACTERCREATEPOLICY_TR"))
  elseif isGameTypeTH() then
    petRegisterUI._static_PetIconSlot:SetText(PAGetString(Defines.StringSheet_GAME, "COMMON_CHARACTERCREATEPOLICY_TH"))
  elseif isGameTypeID() then
    petRegisterUI._static_PetIconSlot:SetText(PAGetString(Defines.StringSheet_GAME, "COMMON_CHARACTERCREATEPOLICY_ID"))
  end
  petRegisterUI._staticText_RegisterDesc:SetTextMode(UI_TM.eTextMode_AutoWrap)
end
function petRegister:resetData()
  self._fromWhereType = -1
  self._fromSlotNo = -1
  petRegisterUI._edit_Search:SetEditText("", true)
end
function FGlobal_PetRegister_Confirm()
  HandleClicked_PetRegister_Register()
  petRegister:close()
end
function FGlobal_PetRegister_Cancle()
  ClearFocusEdit()
  petRegister:close()
end
function FGlobal_PetRegister_ChangeName()
  local petRegisterUI = self._ui
  if true == petRegisterUI._edit_Search:GetFocusEdit() then
  else
    petRegisterUI._edit_Search:SetMaxInput(getGameServiceTypePetNameLength())
    SetFocusEdit(petRegisterUIs._edit_Search)
    petRegisterUI._edit_Search:SetEditText("", true)
  end
end
function petRegister:clearEdit()
  local petRegisterUI = self._ui
  petRegisterUI._edit_Search:SetEditText("", false)
  SetFocusEdit(petRegisterUI._edit_Search)
end
function petRegister:setRegistInfo(fromWhereType, fromSlotNo)
  local petRegisterUI = self._ui
  self._fromWhereType = fromWhereType
  self._fromSlotNo = fromSlotNo
  local petNaming = petRegisterUI._edit_Search
  local petName = petNaming:GetEditText()
  local itemWrapper = getInventoryItemByType(fromWhereType, fromSlotNo)
  if nil == itemWrapper then
    return
  end
  local characterKey = itemWrapper:getStaticStatus():get()._contentsEventParam1
  local petRegisterPSS = ToClient_getPetStaticStatus(characterKey)
  local petIconPath = petRegisterPSS:getIconPath()
  petRegisterUI._static_PetIcon:ChangeTextureInfoNameAsync(petIconPath)
  petRegisterUI._static_PetIcon:SetShow(true)
  local randomIndex = math.floor(math.random(0, self._config._defaultPetNameCount - 1))
  petNaming:SetEditText(self._config._defaultPetName[randomIndex], true)
  petNaming:SetMaxInput(getGameServiceTypePetNameLength())
end
function FromClient_InputPetName_Renew(fromWhereType, fromSlotNo)
  petRegister:open()
  petRegister:setRegistInfo(fromWhereType, fromSlotNo)
end
function HandleClicked_PetRegister_Register()
  local petNaming = petRegister._ui._edit_Search
  local fromWhereType = petRegister._fromWhereType
  local fromSlotNo = petRegister._fromSlotNo
  local petName = petNaming:GetEditText()
  ToClient_requestPetRegister(petName, fromWhereType, fromSlotNo)
  petRegister:close()
end
function FromClient_luaLoadComplete_PetRegister()
  petRegister:initControl()
  petRegister:initialize()
end
function petRegister:registEventHandler()
  registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_PetRegister")
  registerEvent("FromClient_InputPetName", "FromClient_InputPetName_Renew")
end
petRegister:registEventHandler()
