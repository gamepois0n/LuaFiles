-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\petinfo\panel_window_petregister.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
local UI_TM = CppEnums.TextMode
local petNaming = (UI.getChildControl)(Panel_Window_PetRegister, "Edit_Naming")
local petRegister = (UI.getChildControl)(Panel_Window_PetRegister, "Button_Yes")
local petRegisterCancel = (UI.getChildControl)(Panel_Window_PetRegister, "Button_No")
local petIcon = (UI.getChildControl)(Panel_Window_PetRegister, "Static_Icon")
local _staticCreateServantNameBG = (UI.getChildControl)(Panel_Window_PetRegister, "Static_NamingPolicyBG")
local _staticCreateServantNameTitle = (UI.getChildControl)(Panel_Window_PetRegister, "StaticText_NamingPolicyTitle")
local _staticCreateServantName = (UI.getChildControl)(Panel_Window_PetRegister, "StaticText_NamingPolicy")
local _petRegisterBG = (UI.getChildControl)(Panel_Window_PetRegister, "Static_PetRegisterBG")
local _petRegisterDesc = ((UI.getChildControl)(Panel_Window_PetRegister, "StaticText_Description"))
local tempFromWhereType, tempFromSlotNo = nil, nil
petRegister_init = function()
  -- function num : 0_0 , upvalues : petNaming, _staticCreateServantName, UI_TM, _staticCreateServantNameBG, _staticCreateServantNameTitle, _petRegisterDesc
  petNaming:SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEINFO_EDITBOX_COMMENT"), true)
  if isGameTypeEnglish() or isGameTypeTaiwan() then
    _staticCreateServantName:SetTextMode(UI_TM.eTextMode_AutoWrap)
    _staticCreateServantName:SetText(PAGetString(Defines.StringSheet_GAME, "COMMON_CHARACTERCREATEPOLICY_EN"))
    _staticCreateServantName:SetShow(true)
    _staticCreateServantNameBG:SetShow(true)
    _staticCreateServantNameTitle:SetShow(true)
  else
    _staticCreateServantName:SetShow(false)
    _staticCreateServantNameBG:SetShow(false)
    _staticCreateServantNameTitle:SetShow(false)
  end
  _petRegisterDesc:SetTextMode(UI_TM.eTextMode_AutoWrap)
end

petRegister_Close = function()
  -- function num : 0_1 , upvalues : IM, petNaming
  if not Panel_Window_PetRegister:GetShow() then
    return 
  end
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  ClearFocusEdit(petNaming)
  Panel_Window_PetRegister:SetShow(false)
end

FromClient_InputPetName = function(fromWhereType, fromSlotNo)
  -- function num : 0_2 , upvalues : tempFromWhereType, tempFromSlotNo, petNaming, petIcon, _petRegisterDesc, _petRegisterBG, petRegister, petRegisterCancel
  tempFromWhereType = fromWhereType
  tempFromSlotNo = fromSlotNo
  local petName = petNaming:GetEditText()
  local itemWrapper = getInventoryItemByType(fromWhereType, fromSlotNo)
  if itemWrapper == nil then
    return 
  end
  characterKey = ((itemWrapper:getStaticStatus()):get())._contentsEventParam1
  local petRegisterPSS = ToClient_getPetStaticStatus(characterKey)
  local petIconPath = petRegisterPSS:getIconPath()
  petIcon:ChangeTextureInfoName(petIconPath)
  petNaming:SetEditText("", true)
  petNaming:SetMaxInput(getGameServiceTypePetNameLength())
  _petRegisterDesc:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_PETREGISTER_DESC"))
  _petRegisterDesc:SetSize(_petRegisterDesc:GetSizeX(), _petRegisterDesc:GetTextSizeY() + 10)
  _petRegisterBG:SetSize(_petRegisterBG:GetSizeX(), _petRegisterDesc:GetTextSizeY() + petNaming:GetSizeY() + 50)
  Panel_Window_PetRegister:SetSize(Panel_Window_PetRegister:GetSizeX(), _petRegisterDesc:GetTextSizeY() + petNaming:GetSizeY() + petRegister:GetSizeY() + 110)
  petRegister:SetSpanSize((petRegister:GetSpanSize()).x, 10)
  petRegisterCancel:SetSpanSize((petRegisterCancel:GetSpanSize()).x, 10)
  HandleClicked_PetRegister_ClearEdit()
  Panel_Window_PetRegister:SetShow(true)
end

HandleClicked_PetRegister_Register = function()
  -- function num : 0_3 , upvalues : tempFromWhereType, tempFromSlotNo, petNaming, IM
  local fromWhereType = tempFromWhereType
  local fromSlotNo = tempFromSlotNo
  local petName = petNaming:GetEditText()
  ToClient_requestPetRegister(petName, fromWhereType, fromSlotNo)
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  petRegister_Close()
end

FromClient_PetAddSealedList = function(petNo, reason)
  -- function num : 0_4
  if reason == nil then
    return 
  end
  if reason == 1 then
    FGlobal_PetListNew_Open()
    FGlobal_PetInfoInit()
  end
end

HandleClicked_PetRegister_Close = function()
  -- function num : 0_5
  petRegister_Close()
end

HandleClicked_PetRegister_ClearEdit = function()
  -- function num : 0_6 , upvalues : IM, petNaming
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  petNaming:SetEditText("", false)
  SetFocusEdit(petNaming)
end

FGlobal_PetRegister_Close = function()
  -- function num : 0_7 , upvalues : IM
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  Panel_Window_PetRegister:SetShow(false)
end

petRegister_registEventHandler = function()
  -- function num : 0_8 , upvalues : petRegister, petRegisterCancel, petNaming
  petRegister:addInputEvent("Mouse_LUp", "HandleClicked_PetRegister_Register()")
  petRegisterCancel:addInputEvent("Mouse_LUp", "HandleClicked_PetRegister_Close()")
  petNaming:addInputEvent("Mouse_LUp", "HandleClicked_PetRegister_ClearEdit()")
  petNaming:RegistReturnKeyEvent("HandleClicked_PetRegister_Register()")
end

petRegister_registMessageHandler = function()
  -- function num : 0_9
  registerEvent("FromClient_InputPetName", "FromClient_InputPetName")
  registerEvent("FromClient_PetAddSealedList", "FromClient_PetAddSealedList")
end

petRegister_init()
petRegister_registEventHandler()
petRegister_registMessageHandler()

