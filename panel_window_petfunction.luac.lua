-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\pet\panel_window_petfunction.luac 

-- params : ...
-- function num : 0
Panel_Window_PetFunction:SetShow(false, false)
Panel_Window_PetFunction:setMaskingChild(true)
Panel_Window_PetFunction:ActiveMouseEventEffect(true)
Panel_Window_PetFunction:RegisterShowEventFunc(true, "")
Panel_Window_PetFunction:RegisterShowEventFunc(false, "")
local _petBG = (UI.getChildControl)(Panel_Window_PetFunction, "Static_PetTitle")
_petBG:setGlassBackground(true)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local PetFunction = {
_config = {}
, _buttonRegister = (UI.getChildControl)(Panel_Window_PetFunction, "Button_Register"), _buttonExit = (UI.getChildControl)(Panel_Window_PetFunction, "Button_Exit"), _buttonMating = (UI.getChildControl)(Panel_Window_PetFunction, "Button_ListMating"), _buttonMarket = (UI.getChildControl)(Panel_Window_PetFunction, "Button_ListMarket"), _buttonMix = (UI.getChildControl)(Panel_Window_PetFunction, "Button_HorseMix")}
PetFunction.init = function(self)
  -- function num : 0_0
end

PetFunction.registEventHandler = function(self)
  -- function num : 0_1
  (self._buttonRegister):addInputEvent("Mouse_LUp", "PetFunction_Button_RegisterReady()")
  ;
  (self._buttonExit):addInputEvent("Mouse_LUp", "PetFunction_Button_Exit()")
  ;
  (self._buttonMating):addInputEvent("Mouse_LUp", "PetFunction_Button_Mating()")
  ;
  (self._buttonMarket):addInputEvent("Mouse_LUp", "PetFunction_Button_Market()")
end

PetFunction.registMessageHandler = function(self)
  -- function num : 0_2
  registerEvent("onScreenResize", "PetFunction_Resize")
  registerEvent("FromClient_ServantUpdate", "PetFunction_RegisterAck")
end

PetFunction_Resize = function()
  -- function num : 0_3 , upvalues : PetFunction, _petBG
  local self = PetFunction
  local screenX = getScreenSizeX()
  local screenY = getScreenSizeY()
  Panel_Window_PetFunction:SetSize(screenX, Panel_Window_PetFunction:GetSizeY())
  _petBG:SetSize(screenX, Panel_Window_PetFunction:GetSizeY())
  Panel_Window_PetFunction:ComputePos()
  _petBG:ComputePos()
  ;
  (self._buttonRegister):ComputePos()
  ;
  (self._buttonExit):ComputePos()
  ;
  (self._buttonMating):ComputePos()
  ;
  (self._buttonMarket):ComputePos()
  ;
  (self._buttonMix):ComputePos()
end

PetFunction_Button_RegisterReady = function()
  -- function num : 0_4
  PetList_ClosePopup()
  Inventory_SetFunctor(InvenFiler_Mapae, PetFunction_Register, PetFunction_InventoryClose, nil)
  Inventory_ShowToggle()
  audioPostEvent_SystemUi(0, 0)
end

PetFunction_Register = function(slotNo, itemWrapper, count_s64, inventoryType)
  -- function num : 0_5
  PetRegister_OpenByInventory(inventoryType, slotNo)
end

PetFunction_InventoryClose = function()
  -- function num : 0_6
  Inventory_SetFunctor(nil)
end

PetFunction_Button_Exit = function()
  -- function num : 0_7 , upvalues : PetFunction
  audioPostEvent_SystemUi(0, 0)
  if not Panel_Window_PetFunction:IsShow() then
    return 
  end
  PetList_ClosePopup()
  local self = PetFunction
  ;
  (self._buttonRegister):EraseAllEffect()
  SetUIMode((Defines.UIMode).eUIMode_NpcDialog)
  setIgnoreShowDialog(false)
  Panel_Window_PetFunction:SetShow(false)
  InventoryWindow_Close()
  PetList_Close()
  PetInfo_Close()
  PetRegister_Close()
  PetMating_Close()
  Panel_Npc_Dialog:SetShow(true)
  local npcKey = dialog_getTalkNpcKey()
  if npcKey ~= 0 then
    closeClientChangeScene(npcKey)
  end
  local mainCameraName = Dialog_getMainSceneCameraName()
  changeCameraScene(mainCameraName, 0.5)
end

PetRegistration = function(isHave)
  -- function num : 0_8
  if isHave then
    PetRegistration = true
  else
    PetRegistration = false
  end
end

PetFunction_RegisterAck = function()
  -- function num : 0_9 , upvalues : PetFunction
  if Panel_Window_PetFunction:GetShow() == false then
    return 
  end
  Inventory_SetFunctor(nil)
  InventoryWindow_Close()
  PetRegister_Close()
  local self = PetFunction
  ;
  (self._buttonRegister):EraseAllEffect()
end

PetFunction_Open = function()
  -- function num : 0_10 , upvalues : PetFunction
  if Panel_Window_PetFunction:GetShow() then
    return 
  end
  Servant_SceneOpen(Panel_Window_PetFunction)
  PetList_Open()
  local self = PetFunction
  if stable_doHaveRegisterItem() then
    local messageboxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE")
    local messageboxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_PET_REGISTERITEM_MSG")
    local messageboxData = {title = messageboxTitle, content = messageboxMemo, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
    ;
    (self._buttonRegister):EraseAllEffect()
    ;
    (self._buttonRegister):AddEffect("UI_ArrowMark01", true, 25, -38)
  else
    do
      ;
      (self._buttonRegister):EraseAllEffect()
      if stable_isMating() then
        (self._buttonMating):SetShow(true)
      end
      if stable_isMarket() then
        (self._buttonMarket):SetShow(true)
      end
    end
  end
end

PetFunction_Close = function()
  -- function num : 0_11 , upvalues : PetFunction
  if not Panel_Window_PetFunction:IsShow() then
    return 
  end
  audioPostEvent_SystemUi(0, 0)
  ;
  (PetFunction._buttonRegister):EraseAllEffect()
  Inventory_SetFunctor(nil)
  InventoryWindow_Close()
  PetList_Close()
  PetMating_Close()
  PetMarket_Close()
  PetFunction_Button_Exit()
end

PetFunction_Button_Mating = function()
  -- function num : 0_12
  audioPostEvent_SystemUi(0, 0)
  PetList_ButtonClose()
  PetMating_Open((CppEnums.AuctionType).AuctionGoods_ServantMating)
  audioPostEvent_SystemUi(1, 0)
end

PetFunction_Button_Market = function()
  -- function num : 0_13
  audioPostEvent_SystemUi(0, 0)
  PetList_ButtonClose()
  audioPostEvent_SystemUi(1, 0)
  PetMarket_Open()
end

PetFunction_Button_ListMarket = function()
  -- function num : 0_14
  audioPostEvent_SystemUi(0, 0)
  PetList_ClosePopup()
  StableMarket_Open()
  audioPostEvent_SystemUi(1, 0)
end

PetFunction_HideDialog = function()
  -- function num : 0_15
  setIgnoreShowDialog(true)
  ;
  (UIAni.fadeInSCR_Down)(Panel_Window_PetFunction)
  Panel_Npc_Dialog:SetShow(false)
end

PetFunction_ViewScene = function()
  -- function num : 0_16
  local npcKey = dialog_getTalkNpcKey()
  if npcKey ~= 0 then
    openClientChangeScene(npcKey, 1)
    local funcCameraName = Dialog_getFuncSceneCameraName()
    changeCameraScene(funcCameraName, 0.5)
  end
end

PetFunction:init()
PetFunction:registEventHandler()
PetFunction:registMessageHandler()
PetFunction_Resize()

