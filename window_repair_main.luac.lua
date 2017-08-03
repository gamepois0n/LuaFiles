-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\repair\window_repair_main.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_Group = Defines.UIGroup
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
Panel_Window_Repair:SetShow(false, false)
Panel_Window_Repair:setMaskingChild(true)
Panel_Window_Repair:ActiveMouseEventEffect(true)
Panel_LuckyRepair_Result:SetShow(false)
PaGlobal_Repair = {_repairMessage, _repairMessageJP; _screenX = nil, _screenY = nil, _repairWhereType = nil, _repairSlotNo = nil, _uiRepairCursor = (UI.getChildControl)(Panel_Window_Repair, "Static_Cursor"), _uiRepairMessageBG = (UI.getChildControl)(Panel_Equipment, "Static_Repair_Message"), _isContentsEnable = ToClient_IsContentsGroupOpen("36"), _uiRepairInven = (UI.getChildControl)(Panel_Equipment, "Static_Text_Money"), _uiRepairWareHouse = (UI.getChildControl)(Panel_Equipment, "Static_Text_Money2"), _uiRepairInvenMoney = (UI.getChildControl)(Panel_Equipment, "RadioButton_Icon_Money"), _uiRepairWareHouseMoney = (UI.getChildControl)(Panel_Equipment, "RadioButton_Icon_Money2"), _uiRepairBG = (UI.getChildControl)(Panel_Window_Repair, "RepairBackGround"), _uiRepairStableEquippedItemButton = (UI.getChildControl)(Panel_Window_Repair, "Button_Repair_Servant"), _uiRepairWharfEquippedItemButton = (UI.getChildControl)(Panel_Window_Repair, "Button_Repair_Ship"), _uiRepairElephantButton = (UI.getChildControl)(Panel_Window_Repair, "Button_Repair_Elephant"), _uiRepairAllEquippedItemButton = (UI.getChildControl)(Panel_Window_Repair, "Button_Repair_EquipItem"), _uiRepairAllInvenItemButton = (UI.getChildControl)(Panel_Window_Repair, "Button_Repair_InvenItem"), _uiFixEquipItemButton = (UI.getChildControl)(Panel_Window_Repair, "Button_FixEquip"), _uiRepairExitButton = (UI.getChildControl)(Panel_Window_Repair, "Button_Exit"), _resultMsg_ShowTime = 0, 
_luckyRepairMSG = {}
, _uiRepairInvenMoneyTextSizeX = 0, _uiRepairWareHouseMoneyTextSizeX = 0, _uiRepairTextSizeX = 0, _isCamping = false}
-- DECOMPILER ERROR at PC131: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_Repair.initialize = function(self)
  -- function num : 0_0
  (self._uiRepairBG):setGlassBackground(true)
  ;
  (self._uiRepairBG):SetShow(true)
  ;
  (self._uiRepairStableEquippedItemButton):addInputEvent("Mouse_LUp", "PaGlobal_Repair:handleMClickedHorseItemRepairButton()")
  ;
  (self._uiRepairWharfEquippedItemButton):addInputEvent("Mouse_LUp", "PaGlobal_Repair:handleMClickedShipItemRepairButton()")
  ;
  (self._uiRepairElephantButton):addInputEvent("Mouse_LUp", "PaGlobal_Repair:handleMClickedElephantRepairButton()")
  if getContentsServiceType() ~= (CppEnums.ContentsServiceType).eContentsServiceType_Commercial then
    (self._uiRepairStableEquippedItemButton):SetShow(false)
    ;
    (self._uiRepairWharfEquippedItemButton):SetShow(false)
  else
    ;
    (self._uiRepairStableEquippedItemButton):SetShow(true)
    ;
    (self._uiRepairWharfEquippedItemButton):SetShow(true)
  end
  if isGameTypeRussia() then
    (self._uiRepairStableEquippedItemButton):SetTextSpan(40, 5)
    ;
    (self._uiRepairWharfEquippedItemButton):SetTextSpan(35, 5)
  else
    if isGameTypeKorea() then
      (self._uiRepairStableEquippedItemButton):SetTextSpan(55, 5)
      ;
      (self._uiRepairWharfEquippedItemButton):SetTextSpan(40, 5)
    else
      if isGameTypeThisCountry((CppEnums.ContryCode).eContryCode_JAP) then
        (self._uiRepairStableEquippedItemButton):SetTextSpan(55, 5)
        ;
        (self._uiRepairWharfEquippedItemButton):SetTextSpan(40, 5)
      else
        ;
        (self._uiRepairStableEquippedItemButton):SetTextSpan(55, 5)
        ;
        (self._uiRepairWharfEquippedItemButton):SetTextSpan(40, 5)
      end
    end
  end
  if self._isContentsEnable then
    (self._uiRepairElephantButton):SetShow(true)
  else
    ;
    (self._uiRepairElephantButton):SetShow(false)
  end
  ;
  (self._uiRepairAllEquippedItemButton):SetShow(true)
  ;
  (self._uiRepairAllEquippedItemButton):addInputEvent("Mouse_LUp", "PaGlobal_Repair:handleMClickedEquippedItemButton()")
  ;
  (self._uiRepairAllInvenItemButton):SetShow(true)
  ;
  (self._uiRepairAllInvenItemButton):addInputEvent("Mouse_LUp", "PaGlobal_Repair:handleMClickedInvenItemButton()")
  ;
  (self._uiFixEquipItemButton):SetShow(true)
  ;
  (self._uiFixEquipItemButton):addInputEvent("Mouse_LUp", "PaGlobal_FixEquip:handleMClickedFixEquipItemButton()")
  ;
  (self._uiRepairExitButton):SetShow(true)
  ;
  (self._uiRepairExitButton):addInputEvent("Mouse_LUp", "handleMClickedRepairExitButton()")
  self._repairMessage = (UI.getChildControl)(self._uiRepairMessageBG, "StaticText_Repair_Message")
  self._repairMessageJP = (UI.getChildControl)(self._uiRepairMessageBG, "StaticText_Repair_MessageJP")
  if repair_SetRepairMode ~= nil then
    repair_SetRepairMode(false)
  end
  self._uiRepairInvenMoneyTextSizeX = (self._uiRepairInvenMoney):GetTextSizeX()
  self._uiRepairWareHouseMoneyTextSizeX = (self._uiRepairWareHouseMoney):GetTextSizeX()
  if self._uiRepairWareHouseMoneyTextSizeX < self._uiRepairInvenMoneyTextSizeX then
    self._uiRepairTextSizeX = self._uiRepairInvenMoneyTextSizeX
  else
    self._uiRepairTextSizeX = self._uiRepairWareHouseMoneyTextSizeX
  end
end

-- DECOMPILER ERROR at PC135: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_Repair.luckyRepair_Set = function(self)
  -- function num : 0_1 , upvalues : UI_color
  Panel_LuckyRepair_Result:SetSize(getScreenSizeX(), getScreenSizeY())
  Panel_LuckyRepair_Result:SetPosX(0)
  Panel_LuckyRepair_Result:SetPosY(0)
  Panel_LuckyRepair_Result:SetColor(UI_color.C_00FFFFFF)
  Panel_LuckyRepair_Result:SetIgnore(true)
  local tempSlot = {}
  local MSGBG = (UI.getChildControl)(Panel_LuckyRepair_Result, "LuckyRepair_BG")
  tempSlot.MSGBG = MSGBG
  local MSG = (UI.getChildControl)(Panel_LuckyRepair_Result, "LuckyRepair_MSG")
  tempSlot.MSG = MSG
  MSG:SetSize(getScreenSizeX(), 90)
  MSG:ComputePos()
  MSGBG:SetSize(getScreenSizeX() + 40, 90)
  MSGBG:SetPosX(-20)
  MSGBG:ComputePos()
  MSGBG:ResetVertexAni()
  MSGBG:SetVertexAniRun("Ani_Scale_0", true)
  self._luckyRepairMSG = tempSlot
end

PaGlobal_Repair:luckyRepair_Set()
FromClient_LuckyRepair_resultShow = function()
  -- function num : 0_2
  local self = PaGlobal_Repair
  if Panel_LuckyRepair_Result:GetShow() == false then
    ((self._luckyRepairMSG).MSG):SetText(PAGetString(Defines.StringSheet_GAME, "REPAIR_LUCKY_TEXT"))
    Panel_LuckyRepair_Result:SetShow(true)
    self._resultMsg_ShowTime = 0
  end
end

Chk_LuckyRepair_ResultMsg_ShowTime = function(deltaTime)
  -- function num : 0_3
  local self = PaGlobal_Repair
  self._resultMsg_ShowTime = self._resultMsg_ShowTime + deltaTime
  if self._resultMsg_ShowTime > 3 and Panel_LuckyRepair_Result:GetShow() == true then
    Panel_LuckyRepair_Result:SetShow(false)
  end
  if self._resultMsg_ShowTime > 5 then
    self._resultMsg_ShowTime = 0
  end
end

-- DECOMPILER ERROR at PC145: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_Repair.repair_BtnResize = function(self)
  -- function num : 0_4
  local btnRepairStableSizeX = (self._uiRepairStableEquippedItemButton):GetSizeX() + 23
  local btnRepairStableTextPosX = btnRepairStableSizeX - btnRepairStableSizeX / 2 - (self._uiRepairStableEquippedItemButton):GetTextSizeX() / 2
  local btnRepairWharfSizeX = (self._uiRepairWharfEquippedItemButton):GetSizeX() + 23
  local btnRepairWharfTextPosX = btnRepairWharfSizeX - btnRepairWharfSizeX / 2 - (self._uiRepairWharfEquippedItemButton):GetTextSizeX() / 2
  local btnRepairElephantSizeX = (self._uiRepairElephantButton):GetSizeX() + 23
  local btnRepairElephantTextPosX = btnRepairElephantSizeX - btnRepairElephantSizeX / 2 - (self._uiRepairElephantButton):GetTextSizeX() / 2
  local btnRepairAllSizeX = (self._uiRepairAllEquippedItemButton):GetSizeX() + 23
  local btnRepairAllTextPosX = btnRepairAllSizeX - btnRepairAllSizeX / 2 - (self._uiRepairAllEquippedItemButton):GetTextSizeX() / 2
  local btnRepairAllInvenSizeX = (self._uiRepairAllInvenItemButton):GetSizeX() + 23
  local btnRepairAllInvenTextPosX = btnRepairAllInvenSizeX - btnRepairAllInvenSizeX / 2 - (self._uiRepairAllInvenItemButton):GetTextSizeX() / 2
  local btnFixEquipSizeX = (self._uiFixEquipItemButton):GetSizeX() + 23
  local btnFixEquipTextPosX = btnFixEquipSizeX - btnFixEquipSizeX / 2 - (self._uiFixEquipItemButton):GetTextSizeX() / 2
  local btnExitSizeX = (self._uiRepairExitButton):GetSizeX() + 23
  local btnExitTextPosX = btnExitSizeX - btnExitSizeX / 2 - (self._uiRepairExitButton):GetTextSizeX() / 2
  ;
  (self._uiRepairStableEquippedItemButton):SetTextSpan(btnRepairStableTextPosX, 5)
  ;
  (self._uiRepairWharfEquippedItemButton):SetTextSpan(btnRepairWharfTextPosX, 5)
  ;
  (self._uiRepairElephantButton):SetTextSpan(btnRepairElephantTextPosX, 5)
  ;
  (self._uiRepairAllEquippedItemButton):SetTextSpan(btnRepairAllTextPosX, 5)
  ;
  (self._uiRepairAllInvenItemButton):SetTextSpan(btnRepairAllInvenTextPosX, 5)
  ;
  (self._uiFixEquipItemButton):SetTextSpan(btnFixEquipTextPosX, 5)
  ;
  (self._uiRepairExitButton):SetTextSpan(btnExitTextPosX, 5)
end

Repair_Resize = function()
  -- function num : 0_5 , upvalues : UI_color
  local self = PaGlobal_Repair
  self._screenX = getScreenSizeX()
  self._screenY = getScreenSizeY()
  Panel_Window_Repair:SetSize(self._screenX, Panel_Window_Repair:GetSizeY())
  Panel_Window_Repair:ComputePos()
  ;
  (self._uiRepairBG):SetSize(self._screenX, (self._uiRepairBG):GetSizeY())
  ;
  (self._uiRepairBG):ComputePos()
  ;
  (self._uiRepairStableEquippedItemButton):ComputePos()
  ;
  (self._uiRepairWharfEquippedItemButton):ComputePos()
  ;
  (self._uiRepairElephantButton):ComputePos()
  ;
  (self._uiRepairAllEquippedItemButton):ComputePos()
  ;
  (self._uiRepairAllInvenItemButton):ComputePos()
  ;
  (self._uiRepairExitButton):ComputePos()
  ;
  (self._uiFixEquipItemButton):ComputePos()
  Panel_LuckyRepair_Result:SetSize(getScreenSizeX(), getScreenSizeY())
  Panel_LuckyRepair_Result:SetPosX(0)
  Panel_LuckyRepair_Result:SetPosY(0)
  Panel_LuckyRepair_Result:SetColor(UI_color.C_00FFFFFF)
  Panel_LuckyRepair_Result:SetIgnore(true)
  ;
  ((self._luckyRepairMSG).MSGBG):SetSize(getScreenSizeX() + 40, 90)
  ;
  ((self._luckyRepairMSG).MSGBG):SetPosX(-20)
  ;
  ((self._luckyRepairMSG).MSGBG):ComputePos()
  ;
  ((self._luckyRepairMSG).MSG):SetSize(getScreenSizeX(), 90)
  ;
  ((self._luckyRepairMSG).MSG):ComputePos()
  ;
  ((self._luckyRepairMSG).MSGBG):ResetVertexAni()
  ;
  ((self._luckyRepairMSG).MSGBG):SetVertexAniRun("Ani_Scale_0", true)
end

-- DECOMPILER ERROR at PC151: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_Repair.repair_OpenPanel = function(self, isShow)
  -- function num : 0_6
  self._isCamping = PaGlobal_Camp:getIsCamping()
  if isShow == true then
    SetUIMode((Defines.UIMode).eUIMode_Repair)
    repair_SetRepairMode(true)
    setIgnoreShowDialog(true)
    ;
    (UIAni.fadeInSCR_Down)(Panel_Window_Repair)
    Inventory_SetFunctor(Repair_InvenFilter, Repair_InvenRClick, handleMClickedRepairExitButton, nil)
    InventoryWindow_Show(true)
    if ToClient_HasWareHouseFromNpc() then
      if toInt64(0, 0) == warehouse_moneyFromNpcShop_s64() then
        (self._uiRepairInvenMoney):SetCheck(true)
        ;
        (self._uiRepairWareHouseMoney):SetCheck(false)
        ;
        (self._uiRepairWareHouseMoney):SetShow(true)
        ;
        (self._uiRepairWareHouse):SetShow(true)
      else
        ;
        (self._uiRepairInvenMoney):SetCheck(false)
        ;
        (self._uiRepairWareHouseMoney):SetCheck(true)
        ;
        (self._uiRepairWareHouseMoney):SetShow(true)
        ;
        (self._uiRepairWareHouse):SetShow(true)
      end
    else
      ;
      (self._uiRepairInvenMoney):SetCheck(true)
      ;
      (self._uiRepairWareHouseMoney):SetCheck(false)
      ;
      (self._uiRepairWareHouseMoney):SetShow(false)
      ;
      (self._uiRepairWareHouse):SetShow(false)
    end
  else
    if self._isCamping then
      SetUIMode((Defines.UIMode).eUIMode_Default)
    else
      SetUIMode((Defines.UIMode).eUIMode_NpcDialog)
    end
    repair_SetRepairMode(false)
    setIgnoreShowDialog(false)
    Inventory_SetFunctor(nil, nil, nil, nil)
    ;
    (self._uiRepairWareHouseMoney):SetShow(false)
    ;
    (self._uiRepairWareHouse):SetShow(false)
    InventoryWindow_Close()
  end
  Panel_Equipment:SetShow(isShow, true)
  self:repairMoneyUpdate()
  Panel_Npc_Dialog:SetShow(not isShow)
  Panel_Window_Repair:SetShow(isShow, false)
  if isGameTypeKorea() == false then
    (self._uiRepairMessageBG):SetShow(isShow)
    ;
    (self._uiRepairInven):SetShow(isShow)
    ;
    (self._uiRepairInvenMoney):SetShow(isShow)
    FGlobal_Equipment_SetFunctionButtonHide(not isShow)
    ;
    (self._repairMessage):SetShow(false)
    ;
    (self._repairMessageJP):SetShow(true)
    ;
    (self._repairMessageJP):SetText(PAGetString(Defines.StringSheet_GAME, "REPAIR_SELECTITEM_TEXT"))
  else
    ;
    (self._uiRepairMessageBG):SetShow(isShow)
    ;
    (self._uiRepairInven):SetShow(isShow)
    ;
    (self._uiRepairInvenMoney):SetShow(isShow)
    FGlobal_Equipment_SetFunctionButtonHide(not isShow)
    ;
    (self._repairMessageJP):SetShow(false)
    ;
    (self._repairMessage):SetShow(true)
    ;
    (self._repairMessage):SetText(PAGetString(Defines.StringSheet_GAME, "REPAIR_SELECTITEM_TEXT"))
  end
  if not Panel_Equipment:IsShow() then
    (self._uiRepairMessageBG):SetShow(false)
  end
  self:Repair_Money_SetPos()
  if self._isCamping then
    (self._uiRepairStableEquippedItemButton):SetIgnore(true)
    ;
    (self._uiRepairWharfEquippedItemButton):SetIgnore(true)
    ;
    (self._uiRepairElephantButton):SetIgnore(true)
    ;
    (self._uiFixEquipItemButton):SetIgnore(true)
  else
    ;
    (self._uiRepairStableEquippedItemButton):SetIgnore(false)
    ;
    (self._uiRepairWharfEquippedItemButton):SetIgnore(false)
    ;
    (self._uiRepairElephantButton):SetIgnore(false)
    ;
    (self._uiFixEquipItemButton):SetIgnore(false)
  end
end

-- DECOMPILER ERROR at PC154: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_Repair.repairMoneyUpdate = function(self)
  -- function num : 0_7
  Repair_Money_Update()
end

Repair_Money_Update = function()
  -- function num : 0_8
  local self = PaGlobal_Repair
  ;
  (self._uiRepairInven):SetText(makeDotMoney((((getSelfPlayer()):get()):getInventory()):getMoney_s64()))
  ;
  (self._uiRepairWareHouse):SetText(makeDotMoney(warehouse_moneyFromNpcShop_s64()))
end

-- DECOMPILER ERROR at PC159: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_Repair.cursor_PosUpdate = function(self)
  -- function num : 0_9
  (self._uiRepairCursor):SetPosX(getMousePosX() - Panel_Window_Repair:GetPosX())
  ;
  (self._uiRepairCursor):SetPosY(getMousePosY() - Panel_Window_Repair:GetPosY())
end

-- DECOMPILER ERROR at PC162: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_Repair.Repair_Money_SetPos = function(self)
  -- function num : 0_10
  if (self._uiRepairInven):GetPosX() - (self._uiRepairInvenMoney):GetPosX() - 24 < self._uiRepairTextSizeX then
    local sizeX = self._uiRepairTextSizeX - (self._uiRepairInven):GetPosX() - (self._uiRepairInvenMoney):GetPosX() + 36
    ;
    (self._uiRepairInven):SetSpanSize((self._uiRepairInven):GetPosX() - sizeX, (self._uiRepairInven):GetPosY())
    ;
    (self._uiRepairWareHouse):SetSpanSize((self._uiRepairWareHouse):GetPosX() - sizeX, (self._uiRepairWareHouse):GetPosY())
  end
end

-- DECOMPILER ERROR at PC165: Confused about usage of register: R4 in 'UnsetPending'

PaGlobal_Repair.repair_registMessageHandler = function(self)
  -- function num : 0_11
  registerEvent("onScreenResize", "Repair_Resize")
  registerEvent("FromClient_MaxEnduranceLuckyRepairEvent", "FromClient_LuckyRepair_resultShow")
  registerEvent("EventWarehouseUpdate", "Repair_Money_Update")
  Panel_LuckyRepair_Result:RegisterUpdateFunc("Chk_LuckyRepair_ResultMsg_ShowTime")
end

PaGlobal_Repair:initialize()
PaGlobal_Repair:repair_BtnResize()
PaGlobal_Repair:repair_registMessageHandler()
PaGlobal_Repair:repairMoneyUpdate()

