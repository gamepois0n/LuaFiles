-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\camp\panel_window_campregister.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
local UI_TM = CppEnums.TextMode
PaGlobal_CampRegister = {
_ui = {_campNaming = (UI.getChildControl)(Panel_Window_CampRegister, "Edit_Naming"), _campRegister = (UI.getChildControl)(Panel_Window_CampRegister, "Button_Yes"), _campRegisterCancel = (UI.getChildControl)(Panel_Window_CampRegister, "Button_No"), _campIcon = (UI.getChildControl)(Panel_Window_CampRegister, "Static_Icon"), _staticCreateServantNameBG = (UI.getChildControl)(Panel_Window_CampRegister, "Static_NamingPolicyBG"), _staticCreateServantNameTitle = (UI.getChildControl)(Panel_Window_CampRegister, "StaticText_NamingPolicyTitle"), _staticCreateServantName = (UI.getChildControl)(Panel_Window_CampRegister, "StaticText_NamingPolicy"), _campRegisterBG = (UI.getChildControl)(Panel_Window_CampRegister, "Static_CampRegisterBG"), _campRegisterDesc = (UI.getChildControl)(Panel_Window_CampRegister, "StaticText_Description")}
, _tempFromWhereType = nil, _tempFromSlotNo = nil}
-- DECOMPILER ERROR at PC67: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_CampRegister.CampRegister_init = function(self)
  -- function num : 0_0 , upvalues : UI_TM
  ((self._ui)._campNaming):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEINFO_EDITBOX_COMMENT"), true)
  if isGameTypeEnglish() or isGameTypeTaiwan() then
    ((self._ui)._staticCreateServantName):SetTextMode(UI_TM.eTextMode_AutoWrap)
    ;
    ((self._ui)._staticCreateServantName):SetText(PAGetString(Defines.StringSheet_GAME, "COMMON_CHARACTERCREATEPOLICY_EN"))
    ;
    ((self._ui)._staticCreateServantName):SetShow(true)
    ;
    ((self._ui)._staticCreateServantNameBG):SetShow(true)
    ;
    ((self._ui)._staticCreateServantNameTitle):SetShow(true)
  else
    ;
    ((self._ui)._staticCreateServantName):SetShow(false)
    ;
    ((self._ui)._staticCreateServantNameBG):SetShow(false)
    ;
    ((self._ui)._staticCreateServantNameTitle):SetShow(false)
  end
  ;
  ((self._ui)._campRegisterDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
end

FGlobal_CampRegister_Open = function()
  -- function num : 0_1
  PaGlobal_CampRegister:CampRegister_Open()
end

-- DECOMPILER ERROR at PC72: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_CampRegister.CampRegister_Open = function(self)
  -- function num : 0_2
  Panel_Window_CampRegister:SetShow(true)
end

-- DECOMPILER ERROR at PC76: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_CampRegister.CampRegister_Close = function(self)
  -- function num : 0_3 , upvalues : IM
  if not Panel_Window_CampRegister:GetShow() then
    return 
  end
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  ClearFocusEdit((self._ui)._campNaming)
  Panel_Window_CampRegister:SetShow(false)
end

FromClient_RegisterCampingTent = function(fromWhereType, fromSlotNo)
  -- function num : 0_4
  PaGlobal_CampRegister:CampRegister_InputCampName(fromWhereType, fromSlotNo)
end

FromClient_CampingServantListUpdate = function()
  -- function num : 0_5
  local isShow = ToClient_isCampingReigsted()
  Panel_Icon_Camp:SetShow(isShow)
end

-- DECOMPILER ERROR at PC83: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_CampRegister.CampRegister_InputCampName = function(self, fromWhereType, fromSlotNo)
  -- function num : 0_6
  self._tempFromWhereType = fromWhereType
  self._tempFromSlotNo = fromSlotNo
  local campName = ((self._ui)._campNaming):GetEditText()
  local itemWrapper = getInventoryItemByType(fromWhereType, fromSlotNo)
  if itemWrapper == nil then
    return 
  end
  local characterKey = ((itemWrapper:getStaticStatus()):get())._contentsEventParam1
  local campRegisterPSS = ToClient_getPetStaticStatus(characterKey)
  ;
  ((self._ui)._campNaming):SetEditText("", true)
  ;
  ((self._ui)._campNaming):SetMaxInput(getGameServiceTypePetNameLength())
  ;
  ((self._ui)._campRegisterDesc):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_PETREGISTER_DESC"))
  ;
  ((self._ui)._campRegisterDesc):SetSize(((self._ui)._campRegisterDesc):GetSizeX(), ((self._ui)._campRegisterDesc):GetTextSizeY() + 10)
  ;
  ((self._ui)._campRegisterBG):SetSize(((self._ui)._campRegisterBG):GetSizeX(), ((self._ui)._campRegisterDesc):GetTextSizeY() + ((self._ui)._campNaming):GetSizeY() + 50)
  Panel_Window_CampRegister:SetSize(Panel_Window_CampRegister:GetSizeX(), ((self._ui)._campRegisterDesc):GetTextSizeY() + ((self._ui)._campNaming):GetSizeY() + ((self._ui)._campRegister):GetSizeY() + 110)
  ;
  ((self._ui)._campRegister):SetSpanSize((((self._ui)._campRegister):GetSpanSize()).x, 10)
  ;
  ((self._ui)._campRegisterCancel):SetSpanSize((((self._ui)._campRegisterCancel):GetSpanSize()).x, 10)
  PaGlobal_CampRegister:HandleClicked_CampRegister_ClearEdit()
  Panel_Window_CampRegister:SetShow(true)
end

-- DECOMPILER ERROR at PC87: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_CampRegister.HandleClicked_CampRegister_Register = function(self)
  -- function num : 0_7 , upvalues : IM
  local fromWhereType = self._tempFromWhereType
  local fromSlotNo = self._tempFromSlotNo
  local campName = ((self._ui)._campNaming):GetEditText()
  ToClient_requestServantRegisterCampingTent(fromWhereType, fromSlotNo, campName)
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  PaGlobal_CampRegister:HandleClicked_CampRegister_Close()
end

-- DECOMPILER ERROR at PC90: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_CampRegister.HandleClicked_CampRegister_Close = function(self)
  -- function num : 0_8
  PaGlobal_CampRegister:CampRegister_Close()
end

-- DECOMPILER ERROR at PC94: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_CampRegister.HandleClicked_CampRegister_ClearEdit = function(self)
  -- function num : 0_9 , upvalues : IM
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  ;
  ((self._ui)._campNaming):SetEditText("", false)
  SetFocusEdit((self._ui)._campNaming)
end

FGlobal_CampRegister_Close = function()
  -- function num : 0_10 , upvalues : IM
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  Panel_Window_CampRegister:SetShow(false)
end

-- DECOMPILER ERROR at PC100: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_CampRegister.CampRegister_registEventHandler = function(self)
  -- function num : 0_11
  ((self._ui)._campRegisterCancel):addInputEvent("Mouse_LUp", "PaGlobal_CampRegister:CampRegister_Close()")
  ;
  ((self._ui)._campRegister):addInputEvent("Mouse_LUp", "PaGlobal_CampRegister:HandleClicked_CampRegister_Register()")
  ;
  ((self._ui)._campNaming):addInputEvent("Mouse_LUp", "PaGlobal_CampRegister:HandleClicked_CampRegister_ClearEdit()")
  ;
  ((self._ui)._campNaming):RegistReturnKeyEvent("PaGlobal_CampRegister:HandleClicked_CampRegister_Register()")
end

-- DECOMPILER ERROR at PC103: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_CampRegister.CampRegister_registMessageHandler = function(self)
  -- function num : 0_12
  registerEvent("FromClient_RegisterCampingTent", "FromClient_RegisterCampingTent")
  registerEvent("FromClient_CampingServantListUpdate", "FromClient_CampingServantListUpdate")
end

PaGlobal_CampRegister:CampRegister_init()
PaGlobal_CampRegister:CampRegister_registEventHandler()
PaGlobal_CampRegister:CampRegister_registMessageHandler()

