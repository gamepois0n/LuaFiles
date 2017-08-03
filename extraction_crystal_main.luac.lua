-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\extraction\extraction_crystal_main.luac 

-- params : ...
-- function num : 0
PaGlobal_ExtractionCrystal = {_indexSocket, _extractionType, _stuffInvenType, _stuffSlotNo; 
_slotConfig = {createIcon = false, createBorder = true, createCount = true, createEnchant = true, createCash = true}
, 
_config = {socketSlotCount = 3, curSlotCount = 3}
, 
_uiControl = {staticEquipSocket = (UI.getChildControl)(Panel_Window_Extraction_Crystal, "Static_ExtractionEquip_Socket"), 
staticSocket = {(UI.getChildControl)(Panel_Window_Extraction_Crystal, "Static_Socket_1"), (UI.getChildControl)(Panel_Window_Extraction_Crystal, "Static_Socket_2"), (UI.getChildControl)(Panel_Window_Extraction_Crystal, "Static_Socket_3")}
, 
staticSocketName = {(UI.getChildControl)(Panel_Window_Extraction_Crystal, "StaticText_NameTag_1"), (UI.getChildControl)(Panel_Window_Extraction_Crystal, "StaticText_NameTag_2"), (UI.getChildControl)(Panel_Window_Extraction_Crystal, "StaticText_NameTag_3")}
, 
staticSocketDesc = {(UI.getChildControl)(Panel_Window_Extraction_Crystal, "StaticText_List_1"), (UI.getChildControl)(Panel_Window_Extraction_Crystal, "StaticText_List_2"), (UI.getChildControl)(Panel_Window_Extraction_Crystal, "StaticText_List_3")}
, 
staticSocketBackground = {(UI.getChildControl)(Panel_Window_Extraction_Crystal, "Static_Socket_1_Background"), (UI.getChildControl)(Panel_Window_Extraction_Crystal, "Static_Socket_2_Background"), (UI.getChildControl)(Panel_Window_Extraction_Crystal, "Static_Socket_3_Background")}
, 
staticSocketExtractionButton = {(UI.getChildControl)(Panel_Window_Extraction_Crystal, "Button_Extraction_Socket_1"), (UI.getChildControl)(Panel_Window_Extraction_Crystal, "Button_Extraction_Socket_2"), (UI.getChildControl)(Panel_Window_Extraction_Crystal, "Button_Extraction_Socket_3")}
, 
staticStuffSlotBG = {(UI.getChildControl)(Panel_Window_Extraction_Crystal, "Static_StuffSlot_1_Background"), (UI.getChildControl)(Panel_Window_Extraction_Crystal, "Static_StuffSlot_2_Background"), (UI.getChildControl)(Panel_Window_Extraction_Crystal, "Static_StuffSlot_3_Background")}
, 
staticStuffSlot = {(UI.getChildControl)(Panel_Window_Extraction_Crystal, "Static_StuffSlot_1"), (UI.getChildControl)(Panel_Window_Extraction_Crystal, "Static_StuffSlot_2"), (UI.getChildControl)(Panel_Window_Extraction_Crystal, "Static_StuffSlot_3")}
, buttonQuestion = (UI.getChildControl)(Panel_Window_Extraction_Crystal, "Button_Question")}
, 
_onlySocketListBG = {[1] = (UI.getChildControl)(Panel_Window_Extraction_Crystal, "Static_SocketBG_0"), [2] = (UI.getChildControl)(Panel_Window_Extraction_Crystal, "Static_SocketBG_1"), [3] = (UI.getChildControl)(Panel_Window_Extraction_Crystal, "Static_SocketBG_2")}
, 
_text = {[1] = PAGetString(Defines.StringSheet_GAME, "LUA_SOCKET_EMPTYSLOT")}
, 
_desc = {[1] = PAGetString(Defines.StringSheet_GAME, "LUA_EXTRACTION_CRYSTAL_SLOT_EMPTY")}
, _uiEquipMain = nil, _uiSlotSocket = (Array.new)(), _uiSlotExtractionMaterial = (Array.new)(), _extractionGuide = (UI.getChildControl)(Panel_Window_Extraction_Crystal, "Static_ExtractionGuide"), _enchantNumber = (UI.getChildControl)(Panel_Window_Extraction_Crystal, "StaticText_Enchant_value"), 
_useSlot = {[1] = false, [2] = false, [3] = false}
, _save_ExtractionMateria_Slot_status = 0}
registerEvent("FromClient_luaLoadComplete", "LoadComplete_ExtractionCrystal_Initialize")
LoadComplete_ExtractionCrystal_Initialize = function()
  -- function num : 0_0
  PaGlobal_ExtractionCrystal:initialize()
end

-- DECOMPILER ERROR at PC229: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ExtractionCrystal.initialize = function(self)
  -- function num : 0_1
  Panel_Window_Extraction_Crystal:SetShow(false, false)
  Panel_Window_Extraction_Crystal:setMaskingChild(true)
  Panel_Window_Extraction_Crystal:setGlassBackground(true)
  Panel_Window_Extraction_Crystal:RegisterShowEventFunc(true, "ExtractionShowAni()")
  Panel_Window_Extraction_Crystal:RegisterShowEventFunc(false, "ExtractionHideAni()")
  ;
  (PaGlobal_ExtractionCrystal._enchantNumber):SetShow(false)
  ;
  ((self._uiControl).buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelWindowExtractionCrystal\" )")
  ;
  ((self._uiControl).buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelWindowExtractionCrystal\", \"true\")")
  ;
  ((self._uiControl).buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelWindowExtractionCrystal\", \"false\")")
  for loopIndex,loopValue in ipairs((self._uiControl).staticSocketName) do
    loopValue:SetTextMode((CppEnums.TextMode).eTextMode_Limit_AutoWrap)
  end
  for loopIndex,loopValue in ipairs((self._uiControl).staticSocketDesc) do
    loopValue:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  end
  ;
  (self._extractionGuide):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  (self._extractionGuide):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_EXTRACTION_CRYSTAL_EXTRACTIONGUIDE"))
  PaGlobal_ExtractionCrystal:createControl()
end

-- DECOMPILER ERROR at PC232: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ExtractionCrystal.show = function(self, isShow)
  -- function num : 0_2
  if isShow then
    PaGlobal_ExtractionCrystal:clearData()
    Panel_Window_Extraction_Crystal:SetShow(true, true)
    Panel_Window_Extraction_Crystal:SetPosY(getScreenSizeY() - getScreenSizeY() / 2 - Panel_Window_Extraction_Crystal:GetSizeY() / 2 - 20)
    Panel_Window_Extraction_Crystal:SetPosX(getScreenSizeX() - getScreenSizeX() / 2 - Panel_Window_Extraction_Crystal:GetSizeX() / 2)
  else
    Socket_ExtractionCrystal_WindowClose()
  end
end

-- DECOMPILER ERROR at PC235: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ExtractionCrystal.hide = function(self)
  -- function num : 0_3
  Socket_ExtractionCrystal_WindowClose()
end

Socket_ExtractionCrystal_WindowClose = function()
  -- function num : 0_4
  Inventory_SetFunctor(nil)
  Panel_Window_Extraction_Crystal:SetShow(false, false)
  PaGlobal_ExtractionCrystal:clearData()
end


