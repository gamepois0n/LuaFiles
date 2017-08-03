-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\extraction\extraction_enchantstone_main.luac 

-- params : ...
-- function num : 0
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_PD = CppEnums.Padding
PaGlobal_ExtractionEnchantStone = {_currentTime = 0, 
_slotConfig = {createIcon = false, createBorder = true, createCount = true, createEnchant = true, createCash = true}
, _uiButtonApply = (UI.getChildControl)(Panel_Window_Extraction_EnchantStone, "Button_Extraction_Socket_1"), _uiEffectCircle = (UI.getChildControl)(Panel_Window_Extraction_EnchantStone, "Static_ExtractionSpinEffect"), _uiGuideBG = (UI.getChildControl)(Panel_Window_Extraction_EnchantStone, "Static_ExtractionGuideBG"), 
_uiEquipItem = {}
, _uiEffectStep1 = (UI.getChildControl)(Panel_Window_Extraction_EnchantStone, "Static_ExtractionEffect_Step1"), _uiEffectStep2 = (UI.getChildControl)(Panel_Window_Extraction_EnchantStone, "Static_ExtractionEffect_Step2"), _uiEffectStep3 = (UI.getChildControl)(Panel_Window_Extraction_EnchantStone, "Static_ExtractionEffect_Step3"), _uiIconBlackStoneWeapon = (UI.getChildControl)(Panel_Window_Extraction_EnchantStone, "Static_BlackStone_Weapon"), _uiIconBlackStoneArmor = (UI.getChildControl)(Panel_Window_Extraction_EnchantStone, "Static_BlackStone_Armor"), _uiTextBlackStoneCount = (UI.getChildControl)(Panel_Window_Extraction_EnchantStone, "StaticText_BlackStone_Count"), _uiButtonQuestion = (UI.getChildControl)(Panel_Window_Extraction_EnchantStone, "Button_Question"), _doExtracting = false, _targetWhereType = nil, _targetSlotNo = nil}
registerEvent("FromClient_luaLoadComplete", "LoadComplete_ExtractionEnchantStone_Initialize")
LoadComplete_ExtractionEnchantStone_Initialize = function()
  -- function num : 0_0
  PaGlobal_ExtractionEnchantStone:initialize()
  PaGlobal_ExtractionEnchantStone:clear()
  PaGlobal_ExtractionEnchantStone:registMessageHandler()
end

-- DECOMPILER ERROR at PC90: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_ExtractionEnchantStone.initialize = function(self)
  -- function num : 0_1 , upvalues : UI_PD
  Panel_Window_Extraction_EnchantStone:SetShow(false, false)
  Panel_Window_Extraction_EnchantStone:setMaskingChild(true)
  Panel_Window_Extraction_EnchantStone:setGlassBackground(true)
  Panel_Window_Extraction_EnchantStone:RegisterShowEventFunc(true, "PaGlobal_ExtractionEnchantStone:showAni()")
  Panel_Window_Extraction_EnchantStone:RegisterShowEventFunc(false, "PaGlobal_ExtractionEnchantStone:hideAni()")
  ;
  (self._uiButtonApply):addInputEvent("Mouse_LUp", "PaGlobal_ExtractionEnchantStone:applyReady()")
  ;
  (self._uiButtonApply):SetShow(true)
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._uiEquipItem).icon = (UI.getChildControl)(Panel_Window_Extraction_EnchantStone, "Static_Equip_Socket")
  -- DECOMPILER ERROR at PC45: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._uiEquipItem).slot_On = (UI.getChildControl)(Panel_Window_Extraction_EnchantStone, "Static_Equip_Socket_EffectOn")
  -- DECOMPILER ERROR at PC52: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._uiEquipItem).slot_Nil = (UI.getChildControl)(Panel_Window_Extraction_EnchantStone, "Static_Equip_Socket_EffectOff")
  ;
  (self._uiGuideBG):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  (self._uiGuideBG):setPadding(UI_PD.ePadding_Left, 10)
  ;
  (self._uiGuideBG):setPadding(UI_PD.ePadding_Right, 10)
  ;
  (self._uiGuideBG):setPadding(UI_PD.ePadding_Top, 5)
  ;
  (self._uiGuideBG):setPadding(UI_PD.ePadding_Bottom, 5)
  ;
  (self._uiGuideBG):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_EXTRACTION_ENCHANTSTONE_EXTRACTIONGUIDE"))
  ;
  (self._uiGuideBG):SetSize((self._uiGuideBG):GetSizeX(), (self._uiGuideBG):GetTextSizeY() + 20)
  Panel_Window_Extraction_EnchantStone:SetSize(Panel_Window_Extraction_EnchantStone:GetSizeX(), Panel_Window_Extraction_EnchantStone:GetSizeX() + (self._uiGuideBG):GetTextSizeY() + 80)
  ;
  (SlotItem.new)(self._uiEquipItem, "Slot_0", 0, Panel_Window_Extraction_EnchantStone, self._slotConfig)
  ;
  (self._uiEquipItem):createChild()
  -- DECOMPILER ERROR at PC127: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._uiEquipItem).empty = true
  ;
  ((self._uiEquipItem).icon):addInputEvent("Mouse_RUp", "PaGlobal_ExtractionEnchantStone:handleMRUpEquipSlot( )")
  ;
  (self._uiIconBlackStoneWeapon):SetShow(false)
  ;
  (self._uiIconBlackStoneArmor):SetShow(false)
  ;
  (self._uiTextBlackStoneCount):SetShow(false)
  self._enchantNumber = (UI.getChildControl)(Panel_Window_Extraction_EnchantStone, "StaticText_Enchant_value")
  ;
  (self._enchantNumber):SetShow(false)
  CopyBaseProperty(self._enchantNumber, (self._uiEquipItem).enchantText)
  ;
  ((self._uiEquipItem).enchantText):SetSize(((self._uiEquipItem).icon):GetSizeX(), ((self._uiEquipItem).icon):GetSizeY())
  ;
  ((self._uiEquipItem).enchantText):SetPosX(0)
  ;
  ((self._uiEquipItem).enchantText):SetPosY(0)
  ;
  ((self._uiEquipItem).enchantText):SetTextHorizonCenter()
  ;
  ((self._uiEquipItem).enchantText):SetTextVerticalCenter()
  ;
  ((self._uiEquipItem).enchantText):SetShow(true)
  ;
  (self._uiButtonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelWindowExtractionEnchantStone\" )")
  ;
  (self._uiButtonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelWindowExtractionEnchantStone\", \"true\")")
  ;
  (self._uiButtonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelWindowExtractionEnchantStone\", \"false\")")
end

-- DECOMPILER ERROR at PC93: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_ExtractionEnchantStone.clear = function(self)
  -- function num : 0_2
  (self._uiEquipItem):clearItem()
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._uiEquipItem).empty = true
  ;
  (self._uiButtonApply):EraseAllEffect()
  ;
  (self._uiButtonApply):SetIgnore(true)
  ;
  (self._uiButtonApply):SetMonoTone(true)
  ;
  (self._uiButtonApply):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_EXTRACTION_ENCHANTSTONE_BUTTONAPPLY"))
  ;
  (self._uiIconBlackStoneWeapon):SetShow(false)
  ;
  (self._uiIconBlackStoneArmor):SetShow(false)
  ;
  (self._uiIconBlackStoneWeapon):SetMonoTone(true)
  ;
  (self._uiIconBlackStoneArmor):SetMonoTone(true)
  ;
  (self._uiTextBlackStoneCount):SetShow(false)
  ;
  (self._uiTextBlackStoneCount):SetText(0)
  ;
  ((self._uiEquipItem).slot_On):SetShow(false)
  ;
  ((self._uiEquipItem).slot_Nil):SetShow(true)
  ;
  (getEnchantInformation()):clearData()
end

ExtractionEnchantStone_WindowOpen = function()
  -- function num : 0_3
  Panel_Window_Extraction_EnchantStone:SetShow(true, true)
  Panel_Window_Extraction_EnchantStone:SetPosY(getScreenSizeY() - getScreenSizeY() / 2 - Panel_Window_Extraction_EnchantStone:GetSizeY() / 2 - 20)
  Panel_Window_Extraction_EnchantStone:SetPosX(getScreenSizeX() - getScreenSizeX() / 2 - Panel_Window_Extraction_EnchantStone:GetSizeX() / 2)
  Inventory_SetFunctor(ExtractionEnchantStone_InvenFiler_MainItem, ExtractionEnchantStone_InteractortionFromInventory, ExtractionEnchantStone_WindowClose, nil)
  InventoryWindow_Show()
  -- DECOMPILER ERROR at PC43: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_ExtractionEnchantStone._currentTime = 0
  -- DECOMPILER ERROR at PC45: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_ExtractionEnchantStone._doExtracting = false
end

ExtractionEnchantStone_WindowClose = function()
  -- function num : 0_4
  ExtractionEnchant_EffectReset()
  Inventory_SetFunctor(nil)
  Panel_Window_Extraction_EnchantStone:SetShow(false, false)
  PaGlobal_ExtractionEnchantStone:clear()
end

-- DECOMPILER ERROR at PC100: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_ExtractionEnchantStone.getShow = function(self)
  -- function num : 0_5
  return Panel_Window_Extraction_EnchantStone:GetShow()
end

-- DECOMPILER ERROR at PC103: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_ExtractionEnchantStone.getButtonExtractionApply = function(self)
  -- function num : 0_6
  return self._uiButtonApply
end


