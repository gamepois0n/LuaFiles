-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\fairyinfo\panel_window_fairyregister.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
local UI_TM = CppEnums.TextMode
PaGlobal_FairyRegister = {
_ui = {fairyRegister = (UI.getChildControl)(Panel_Window_FairyRegister, "Button_Yes"), fairyRegisterCancel = (UI.getChildControl)(Panel_Window_FairyRegister, "Button_No"), fairyQuestion = (UI.getChildControl)(Panel_Window_FairyRegister, "Button_Question"), fairyNamingBG = (UI.getChildControl)(Panel_Window_FairyRegister, "Static_NamingPolicyBG"), fairyNamingPolicyTitle = (UI.getChildControl)(Panel_Window_FairyRegister, "StaticText_NamingPolicyTitle"), fairyNamingPolicyDesc = (UI.getChildControl)(Panel_Window_FairyRegister, "StaticText_NamingPolicy"), fairyRegisterBG = (UI.getChildControl)(Panel_Window_FairyRegister, "Static_FairyRegisterBG"), fairyRegisterDesc = (UI.getChildControl)(Panel_Window_FairyRegister, "StaticText_Description")}
, tempFromWhereType = nil, tempFromSlotNo = nil}
-- DECOMPILER ERROR at PC61: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_FairyRegister.init = function(self)
  -- function num : 0_0 , upvalues : UI_TM
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).fairyIconBG = (UI.getChildControl)((self._ui).fairyRegisterBG, "Static_IconBack")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).petNaming = (UI.getChildControl)((self._ui).fairyRegisterBG, "Edit_WriteName")
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).fairyIcon = (UI.getChildControl)((self._ui).fairyIconBG, "Static_Icon")
  ;
  ((self._ui).petNaming):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEINFO_EDITBOX_COMMENT"), true)
  if isGameTypeEnglish() or isGameTypeTaiwan() or isGameTypeTR() or isGameTypeTH() or isGameTypeID() then
    ((self._ui).fairyNamingPolicyDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
    ;
    ((self._ui).fairyNamingPolicyDesc):SetShow(true)
    ;
    ((self._ui).fairyNamingBG):SetShow(true)
    ;
    ((self._ui).fairyNamingPolicyTitle):SetShow(true)
  else
    ;
    ((self._ui).fairyNamingPolicyDesc):SetShow(false)
    ;
    ((self._ui).fairyNamingBG):SetShow(false)
    ;
    ((self._ui).fairyNamingPolicyTitle):SetShow(false)
  end
  if isGameTypeEnglish() or isGameTypeTaiwan() then
    ((self._ui).fairyNamingPolicyDesc):SetText(PAGetString(Defines.StringSheet_GAME, "COMMON_CHARACTERCREATEPOLICY_EN"))
  else
    if isGameTypeTR() then
      ((self._ui).fairyNamingPolicyDesc):SetText(PAGetString(Defines.StringSheet_GAME, "COMMON_CHARACTERCREATEPOLICY_TR"))
    else
      if isGameTypeTH() then
        ((self._ui).fairyNamingPolicyDesc):SetText(PAGetString(Defines.StringSheet_GAME, "COMMON_CHARACTERCREATEPOLICY_TH"))
      else
        if isGameTypeID() then
          ((self._ui).fairyNamingPolicyDesc):SetText(PAGetString(Defines.StringSheet_GAME, "COMMON_CHARACTERCREATEPOLICY_ID"))
        end
      end
    end
  end
  ;
  ((self._ui).fairyRegisterDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((self._ui).fairyRegisterDesc):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_FAIRYREGISTER_DESC"))
  ;
  ((self._ui).fairyQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle(\"Fairy\")")
  ;
  ((self._ui).fairyQuestion):SetShow(false)
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_FairyRegister.Close = function(self)
  -- function num : 0_1
  if not Panel_Window_FairyRegister:GetShow() then
    return 
  end
  ClearFocusEdit((self._ui).petNaming)
  Panel_Window_FairyRegister:SetShow(false)
end

FromClient_InputFairyName = function(fromWhereType, fromSlotNo)
  -- function num : 0_2
  local self = PaGlobal_FairyRegister
  self.tempFromWhereType = fromWhereType
  self.tempFromSlotNo = fromSlotNo
  local petName = ((self._ui).petNaming):GetEditText()
  local itemWrapper = getInventoryItemByType(fromWhereType, fromSlotNo)
  if itemWrapper == nil then
    return 
  end
  local characterKey = ((itemWrapper:getStaticStatus()):get())._contentsEventParam1
  local petRegisterPSS = ToClient_getPetStaticStatus(characterKey)
  local petIconPath = petRegisterPSS:getIconPath()
  ;
  ((self._ui).fairyIcon):ChangeTextureInfoName(petIconPath)
  ;
  ((self._ui).petNaming):SetEditText("", true)
  ;
  ((self._ui).petNaming):SetMaxInput(getGameServiceTypePetNameLength())
  ;
  ((self._ui).fairyRegisterDesc):SetSize(((self._ui).fairyRegisterDesc):GetSizeX(), ((self._ui).fairyRegisterDesc):GetTextSizeY() + 10)
  ;
  ((self._ui).fairyRegisterBG):SetSize(((self._ui).fairyRegisterBG):GetSizeX(), ((self._ui).fairyRegisterDesc):GetTextSizeY() + ((self._ui).petNaming):GetSizeY() + 50)
  Panel_Window_FairyRegister:SetSize(Panel_Window_FairyRegister:GetSizeX(), ((self._ui).fairyRegisterDesc):GetTextSizeY() + ((self._ui).petNaming):GetSizeY() + ((self._ui).fairyRegister):GetSizeY() + 110)
  ;
  ((self._ui).fairyRegister):ComputePos()
  ;
  ((self._ui).fairyRegisterCancel):ComputePos()
  PaGlobal_FairyRegister:MClick_ClearEdit()
  Panel_Window_FairyRegister:SetShow(true)
end

-- DECOMPILER ERROR at PC69: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_FairyRegister.MClick_Register = function(self)
  -- function num : 0_3
  local fromWhereType = self.tempFromWhereType
  local fromSlotNo = self.tempFromSlotNo
  local petName = ((self._ui).petNaming):GetEditText()
  ToClient_requestPetRegister(petName, fromWhereType, fromSlotNo)
  PaGlobal_FairyRegister:Close()
end

-- DECOMPILER ERROR at PC72: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_FairyRegister.MClick_ClearEdit = function(self)
  -- function num : 0_4
  ((self._ui).petNaming):SetEditText("", false)
  SetFocusEdit((self._ui).petNaming)
end

-- DECOMPILER ERROR at PC75: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_FairyRegister.RegistEventHandler = function(self)
  -- function num : 0_5
  ((self._ui).fairyRegister):addInputEvent("Mouse_LUp", "PaGlobal_FairyRegister:MClick_Register()")
  ;
  ((self._ui).fairyRegisterCancel):addInputEvent("Mouse_LUp", "PaGlobal_FairyRegister:Close()")
  ;
  ((self._ui).petNaming):addInputEvent("Mouse_LUp", "PaGlobal_FairyRegister:MClick_ClearEdit()")
  ;
  ((self._ui).petNaming):RegistReturnKeyEvent("PaGlobal_FairyRegister:MClick_Register()")
end

-- DECOMPILER ERROR at PC78: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_FairyRegister.RegistMessageHandler = function(self)
  -- function num : 0_6
  registerEvent("FromClient_PetAddSealedList", "FromClient_PetAddSealedList")
end

PaGlobal_FairyRegister:init()
PaGlobal_FairyRegister:RegistEventHandler()
PaGlobal_FairyRegister:RegistMessageHandler()

