-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\extraction\panel_window_extraction_cloth_main.luac 

-- params : ...
-- function num : 0
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local isEnableCron = ToClient_IsContentsGroupOpen("74")
PaGlobal_ExtractionCloth = {_currentTime = 0, 
_slotConfig = {createIcon = false, createBorder = false, createCount = true, createEnchant = true, createCash = false}
, _buttonApply = (UI.getChildControl)(Panel_Window_Extraction_Cloth, "Button_ExtractionCloth"), _effectCircleEff = (UI.getChildControl)(Panel_Window_Extraction_Cloth, "Static_ExtractionSpinEffect"), _textExtractionGuide = (UI.getChildControl)(Panel_Window_Extraction_Cloth, "StaticText_ExtractionGuide"), 
_equipItem = {}
, _extracting_Effect_Step1 = (UI.getChildControl)(Panel_Window_Extraction_Cloth, "Static_ExtractionEffect_Step1"), _balks = (UI.getChildControl)(Panel_Window_Extraction_Cloth, "Static_Balks"), _textBalksCount = (UI.getChildControl)(Panel_Window_Extraction_Cloth, "StaticText_Balks_Count"), _radioBtnValks = (UI.getChildControl)(Panel_Window_Extraction_Cloth, "RadioButton_Valks"), _radioBtnCronStone = (UI.getChildControl)(Panel_Window_Extraction_Cloth, "RadioButton_CronStrone"), _buttonQuestion = (UI.getChildControl)(Panel_Window_Extraction_Cloth, "Button_Question"), _doExtracting = false, _extraction_TargetWhereType = nil, _extraction_TargetSlotNo = nil, 
count = {[0] = 0, [1] = 0}
}
registerEvent("FromClient_luaLoadComplete", "LoadComplete_ExtractionCloth_Initialize")
LoadComplete_ExtractionCloth_Initialize = function()
  -- function num : 0_0
  PaGlobal_ExtractionCloth:initialize()
  PaGlobal_ExtractionCloth:clear()
  PaGlobal_ExtractionCloth:registMessageHandler()
end

-- DECOMPILER ERROR at PC88: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_ExtractionCloth.initialize = function(self)
  -- function num : 0_1
  Panel_Window_Extraction_Cloth:SetShow(false, false)
  Panel_Window_Extraction_Cloth:setMaskingChild(true)
  Panel_Window_Extraction_Cloth:setGlassBackground(true)
  Panel_Window_Extraction_Cloth:RegisterShowEventFunc(true, "PaGlobal_ExtractionCloth:showAni()")
  Panel_Window_Extraction_Cloth:RegisterShowEventFunc(false, "PaGlobal_ExtractionCloth:hideAni()")
  ;
  (self._buttonApply):addInputEvent("Mouse_LUp", "PaGlobal_ExtractionCloth:applyReady()")
  ;
  (self._buttonApply):SetShow(true)
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._equipItem).icon = (UI.getChildControl)(Panel_Window_Extraction_Cloth, "Static_Equip_Socket")
  -- DECOMPILER ERROR at PC45: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._equipItem).slot_On = (UI.getChildControl)(Panel_Window_Extraction_Cloth, "Static_Equip_Socket_EffectOn")
  -- DECOMPILER ERROR at PC52: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._equipItem).slot_Nil = (UI.getChildControl)(Panel_Window_Extraction_Cloth, "Static_Equip_Socket_EffectOff")
  ;
  (self._textExtractionGuide):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  (self._textExtractionGuide):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_EXTRACTION_CLOTH_1"))
  ;
  (SlotItem.new)(self._equipItem, "Slot_0", 0, Panel_Window_Extraction_Cloth, self._slotConfig)
  ;
  (self._equipItem):createChild()
  -- DECOMPILER ERROR at PC79: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._equipItem).empty = true
  ;
  ((self._equipItem).icon):addInputEvent("Mouse_RUp", "PaGlobal_ExtractionCloth:handleMRUpEquipSlot()")
  ;
  (self._balks):SetShow(false)
  ;
  (self._textBalksCount):SetShow(false)
  self._enchantNumber = (UI.getChildControl)(Panel_Window_Extraction_Cloth, "StaticText_Enchant_value")
  ;
  (self._enchantNumber):SetShow(false)
  ;
  (self._radioBtnValks):addInputEvent("Mouse_LUp", "PaGlobal_ExtractionCloth:setExtractionType(" .. 0 .. ")")
  ;
  (self._radioBtnCronStone):addInputEvent("Mouse_LUp", "PaGlobal_ExtractionCloth:setExtractionType(" .. 1 .. ")")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelWindowExtractionEnchantStone\" )")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelWindowExtractionEnchantStone\", \"true\")")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelWindowExtractionEnchantStone\", \"false\")")
end

-- DECOMPILER ERROR at PC91: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_ExtractionCloth.clear = function(self)
  -- function num : 0_2
  (self._equipItem):clearItem()
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._equipItem).empty = true
  ;
  (self._buttonApply):EraseAllEffect()
  ;
  (self._buttonApply):SetIgnore(true)
  ;
  (self._buttonApply):SetMonoTone(true)
  ;
  (self._buttonApply):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_EXTRACTION_ENCHANTSTONE_BUTTONAPPLY"))
  ;
  (self._balks):SetShow(false)
  ;
  (self._balks):SetMonoTone(true)
  ;
  (self._textBalksCount):SetShow(false)
  ;
  (self._textBalksCount):SetText(0)
  ;
  ((self._equipItem).slot_On):SetShow(false)
  ;
  ((self._equipItem).slot_Nil):SetShow(true)
  ;
  (getEnchantInformation()):clearData()
end

ExtractionCloth_WindowOpen = function()
  -- function num : 0_3 , upvalues : isEnableCron
  local self = PaGlobal_ExtractionCloth
  Panel_Window_Extraction_Cloth:SetShow(true, true)
  Panel_Window_Extraction_Cloth:SetPosY(getScreenSizeY() - getScreenSizeY() / 2 - Panel_Window_Extraction_Cloth:GetSizeY() / 2 - 20)
  Panel_Window_Extraction_Cloth:SetPosX(getScreenSizeX() - getScreenSizeX() / 2 - Panel_Window_Extraction_Cloth:GetSizeX() / 2)
  Inventory_SetFunctor(ExtractionCloth_InvenFiler_MainItem, ExtractionCloth_InteractortionFromInventory, ExtractionCloth_WindowClose, nil)
  InventoryWindow_Show()
  self:clear()
  self._currentTime = 0
  self._doExtracting = false
  self:setExtractionType(0)
  -- DECOMPILER ERROR at PC51: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.count)[0] = 0
  -- DECOMPILER ERROR at PC53: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.count)[1] = 0
  if not isEnableCron then
    (self._radioBtnCronStone):SetShow(false)
  end
  ;
  (self._radioBtnValks):SetIgnore(self._doExtracting)
  ;
  (self._radioBtnCronStone):SetIgnore(self._doExtracting)
end

ExtractionCloth_WindowClose = function()
  -- function num : 0_4
  local self = PaGlobal_ExtractionCloth
  self._doExtracting = false
  self:clear()
  self._currentTime = 0
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.count)[0] = 0
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.count)[1] = 0
  Inventory_SetFunctor(nil)
  Panel_Window_Extraction_Cloth:SetShow(false, false)
end

-- DECOMPILER ERROR at PC99: Confused about usage of register: R3 in 'UnsetPending'

PaGlobal_ExtractionCloth.getShow = function(self)
  -- function num : 0_5
  return Panel_Window_Extraction_Cloth:GetShow()
end


