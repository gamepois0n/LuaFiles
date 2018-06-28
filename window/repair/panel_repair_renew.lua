local _panel = Panel_Repair_Renew
local REPAIR_TYPE = {
  UNDEFINED = 0,
  GUILD = 1,
  MAX_ENDURANCE = 2,
  SHIP = 3,
  SERVANT = 4,
  EQUIP = 5,
  INVEN = 6,
  COUNT = 6
}
local RepairInfo = {
  _ui = {
    stc_titleBar = UI.getChildControl(_panel, "Static_TitleBar"),
    txt_title = nil,
    stc_titleIcon = nil,
    stc_bodyBG = UI.getChildControl(_panel, "Static_BodyBG"),
    btn_template = nil,
    btn_repairs = nil,
    stc_clipAreas = nil,
    stc_buttonBGs = nil,
    txt_buttonNames = nil,
    stc_bottomLeft = UI.getChildControl(_panel, "Static_BottomLeft"),
    txt_moneyInChar = nil,
    txt_moneyInCharVal = nil,
    stc_bottomRight = UI.getChildControl(_panel, "Static_BottomRight"),
    txt_moneyInWarehouse = nil,
    txt_moneyInWarehouseVal = nil,
    stc_keyGuideSelect = UI.getChildControl(_panel, "Static_SelectKeyImage"),
    txt_keyGuide = UI.getChildControl(_panel, "StaticText_KeyGuide"),
    stc_cursorEffect = UI.getChildControl(_panel, "Static_CursorEffect")
  },
  _buttonsYGap = 101,
  _mainButtonCount = 6,
  _currentButtonSelected = 0,
  _lateInitDone = false,
  _resultMsg_ShowTime = 0,
  _buttonBGSpeed = 1000,
  _buttonBGSelectedX = 320,
  _buttonBGDeselectedX = 360,
  _buttonBGAniThreshold = 40,
  _isAnimating = {},
  _aniTargetForButtonBG = {},
  _isCamping = nil
}
local _buttonsData = {
  [REPAIR_TYPE.GUILD] = {
    uv = {
      1,
      200,
      511,
      297
    },
    text = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_REPAIR_ELEPHANT")
  },
  [REPAIR_TYPE.MAX_ENDURANCE] = {
    uv = {
      1,
      299,
      511,
      396
    },
    text = PAGetString(Defines.StringSheet_RESOURCE, "REPAIR_MAXENDURANCE_TITLE")
  },
  [REPAIR_TYPE.SHIP] = {
    uv = {
      1,
      1,
      511,
      98
    },
    text = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_REPAIR_BTN_REPAIR_SHIP")
  },
  [REPAIR_TYPE.SERVANT] = {
    uv = {
      1,
      100,
      511,
      197
    },
    text = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_REPAIR_BTN_REPAIR_VEHICLE")
  },
  [REPAIR_TYPE.EQUIP] = {
    uv = {
      1,
      399,
      511,
      496
    },
    text = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_REPAIR_BTN_EQUIPITEM")
  },
  [REPAIR_TYPE.INVEN] = {
    uv = {
      1,
      498,
      511,
      595
    },
    text = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_REPAIR_BTN_IVNENITEM")
  }
}
function FromClient_luaLoadComplete_Repair_Init()
  RepairInfo:initialize()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_Repair_Init")
function RepairInfo:initialize()
  self._ui.txt_title = UI.getChildControl(self._ui.stc_titleBar, "StaticText_Title")
  self._ui.stc_titleIcon = UI.getChildControl(self._ui.stc_titleBar, "Static_TitleIcon")
  self._ui.btn_template = UI.getChildControl(self._ui.stc_bodyBG, "Button_Template")
  local buttonStartX = self._ui.btn_template:GetPosX()
  local buttonStartY = self._ui.btn_template:GetPosY()
  self._ui.btn_repairs = {}
  for ii = 1, REPAIR_TYPE.COUNT do
    self._ui.btn_repairs[ii] = UI.cloneControl(self._ui.btn_template, self._ui.stc_bodyBG, "Button_Repair_" .. ii)
    self._ui.btn_repairs[ii]:SetShow(true)
    self._ui.btn_repairs[ii]:SetPosX(buttonStartX)
    self._ui.btn_repairs[ii]:SetPosY(buttonStartY + (ii - 1) * self._buttonsYGap)
    self._ui.btn_repairs[ii]:addInputEvent("Mouse_LUp", "InputMLUp_RepairInfo_PressButton(" .. ii .. ")")
    self._ui.btn_repairs[ii]:addInputEvent("Mouse_On", "InputMOn_RepairInfo_SelectButton(" .. ii .. ")")
  end
  self._ui.btn_template:SetShow(false)
  self._ui.txt_moneyInChar = UI.getChildControl(self._ui.stc_bottomLeft, "StaticText_MoneyInCharacter")
  self._ui.txt_moneyInCharVal = UI.getChildControl(self._ui.stc_bottomLeft, "StaticText_MoneyInCharacterVal")
  self._ui.txt_moneyInWarehouse = UI.getChildControl(self._ui.stc_bottomRight, "StaticText_MoneyInWarehouse")
  self._ui.txt_moneyInWarehouseVal = UI.getChildControl(self._ui.stc_bottomRight, "StaticText_MoneyInWarehouseVal")
  self._ui.txt_keyGuide:SetText("Exit")
  self:registMessageHandler()
  self:initLuckyRepair()
end
function RepairInfo:registMessageHandler()
  _panel:RegisterUpdateFunc("PaGlobalFunc_RepairInfo_UpdatePerFrame")
  Panel_LuckyRepair_Result:RegisterUpdateFunc("PaGlobalFunc_RepairInfo_UpdatePerFrameLuckyRepair")
  registerEvent("FromClient_MaxEnduranceLuckyRepairEvent", "FromClient_RepairInfo_resultShow")
end
function RepairInfo:lateInit()
  if true == self._lateInitDone then
    return
  end
  self._ui.stc_buttonBGs = {}
  self._ui.txt_buttonNames = {}
  for ii = 1, REPAIR_TYPE.COUNT do
    self._ui.stc_clipAreas[ii] = UI.getChildControl(self._ui.btn_repairs[ii], "Static_ClipArea")
    self._ui.stc_buttonBGs[ii] = UI.getChildControl(self._ui.stc_clipAreas[ii], "Static_ButtonBG")
    local x1, y1, x2, y2 = setTextureUV_Func(self._ui.stc_buttonBGs[ii], _buttonsData[ii].uv[1], _buttonsData[ii].uv[2], _buttonsData[ii].uv[3], _buttonsData[ii].uv[4])
    self._ui.stc_buttonBGs[ii]:getBaseTexture():setUV(x1, y1, x2, y2)
    self._ui.stc_buttonBGs[ii]:setRenderTexture(self._ui.stc_buttonBGs[ii]:getBaseTexture())
    self._ui.stc_buttonBGs[ii]:SetPosX(self._buttonBGDeselectedX)
    self._ui.stc_clipAreas[ii]:SetRectClipOnArea(float2(0, 0), float2(self._ui.stc_clipAreas[ii]:GetSizeX(), self._ui.stc_clipAreas[ii]:GetSizeY()))
    self._ui.txt_buttonNames[ii] = UI.getChildControl(self._ui.btn_repairs[ii], "StaticText_Name")
    self._ui.txt_buttonNames[ii]:SetText(_buttonsData[ii].text)
  end
  self._lateInitDone = true
end
function PaGlobalFunc_RepairInfo_GetShow()
  return _panel:GetShow()
end
function PaGlobalFunc_RepairInfo_Open()
  RepairInfo:open()
end
function RepairInfo:open()
  self:lateInit()
  self._isCamping = PaGlobal_Camp:getIsCamping()
  PaGlobalFunc_MainDialog_setIgnoreShowDialog(true)
  if Defines.UIMode.eUIMode_Repair ~= GetUIMode() then
    SetUIMode(Defines.UIMode.eUIMode_Repair)
  end
  repair_SetRepairMode(true)
  Inventory_SetFunctor(PaGlobalFunc_RepairInfo_Filter, PaGlobalFunc_RepairInfo_InvenRClick, nil, nil)
  if false == PaGlobalFunc_InventoryInfo_GetShow() then
    PaGlobalFunc_InventoryInfo_Open(1)
  end
  _panel:SetShow(true, false)
  local initialSelect = REPAIR_TYPE.GUILD
  self:updateButtonSelection(initialSelect)
  self:updateMoneyDisplay()
end
function PaGlobalFunc_RepairInfo_Close()
  RepairInfo:close()
end
function RepairInfo:close()
  _panel:SetShow(false, false)
  repair_SetRepairMode(false)
  if self._isCamping then
    SetUIMode(Defines.UIMode.eUIMode_Default)
  else
    SetUIMode(Defines.UIMode.eUIMode_NpcDialog)
  end
  if true == _ContentsGroup_RenewUI_Dailog then
    PaGlobalFunc_MainDialog_setIgnoreShowDialog(false)
    PaGlobalFunc_MainDialog_ReOpen()
  else
    setIgnoreShowDialog(false)
  end
  InventoryWindow_Close()
  Inventory_SetFunctor(nil, nil, nil, nil)
end
function RepairInfo:updateButtonSelection(selection)
  self._currentButtonSelected = selection
  local keyGuideStartY = self._ui.stc_bodyBG:GetPosY() + self._ui.btn_template:GetPosY() + self._ui.btn_template:GetSizeY() / 2 - self._ui.stc_keyGuideSelect:GetSizeY() / 2
  self._ui.stc_keyGuideSelect:SetPosY(keyGuideStartY + (selection - 1) * self._buttonsYGap)
  for ii = 1, REPAIR_TYPE.COUNT do
    self._aniTargetForButtonBG[ii] = self._buttonBGDeselectedX
    self._isAnimating[ii] = true
  end
  self._aniTargetForButtonBG[selection] = self._buttonBGSelectedX
end
function RepairInfo:updateMoneyDisplay()
  self._ui.txt_moneyInCharVal:SetText(makeDotMoney(getSelfPlayer():get():getInventory():getMoney_s64()))
  if ToClient_HasWareHouseFromNpc() then
    self._ui.txt_moneyInWarehouseVal:SetText(makeDotMoney(warehouse_moneyFromNpcShop_s64()))
    self._ui.txt_moneyInWarehouseVal:SetShow(true)
    self._ui.txt_moneyInWarehouse:SetShow(true)
  else
    self._ui.txt_moneyInWarehouseVal:SetShow(false)
    self._ui.txt_moneyInWarehouse:SetShow(false)
  end
end
function PaGlobalFunc_RepairInfo_UpdatePerFrame(deltaTime)
  for ii = 1, REPAIR_TYPE.COUNT do
    if true == RepairInfo._isAnimating[ii] then
      RepairInfo:animateButtonBG(ii, deltaTime)
    end
  end
end
function RepairInfo:animateButtonBG(buttonIndex, deltaTime)
  local stc_BG = self._ui.stc_buttonBGs[buttonIndex]
  local target = self._aniTargetForButtonBG[buttonIndex]
  local currentPos = stc_BG:GetPosX()
  local distance = target - currentPos
  local acc = distance / self._buttonBGAniThreshold * deltaTime * self._buttonBGSpeed
  if acc > -1 and acc < 0 then
    acc = -1
  elseif acc < 1 and acc > 0 then
    acc = 1
  end
  if 1 < math.abs(distance) then
    stc_BG:SetPosX(currentPos + acc)
  else
    stc_BG:SetPosX(target)
    self._isAnimating[buttonIndex] = false
  end
end
function PaGlobalFunc_RepairInfo_UpdatePerFrameLuckyRepair(deltaTime)
  RepairInfo:resultMsg(deltaTime)
end
function RepairInfo:resultMsg(deltaTime)
  local self = RepairInfo
  self._resultMsg_ShowTime = self._resultMsg_ShowTime + deltaTime
  if self._resultMsg_ShowTime > 3 and true == Panel_LuckyRepair_Result:GetShow() then
    Panel_LuckyRepair_Result:SetShow(false)
  end
  if self._resultMsg_ShowTime > 5 then
    self._resultMsg_ShowTime = 0
  end
end
function PaGlobalFunc_RepairInfo_Filter(slotNo, itemWrapper)
  if nil == itemWrapper then
    return true
  end
  local isAble = itemWrapper:checkToRepairItem()
  return not isAble
end
function PaGlobalFunc_RepairInfo_InvenRClick(slotNo, itemWrapper, s64_itemCount, itemWhereType)
  local self = RepairInfo
  local isAble = itemWrapper:checkToRepairItem()
  if not isAble then
    return
  end
  local repairPrice = repair_getRepairPrice_s64(itemWhereType, slotNo, CppEnums.ServantType.Type_Count, PaGlobal_Camp:getIsCamping())
  if repairPrice > Defines.s64_const.s64_0 then
    local strPrice = string.format("%d", Int64toInt32(repairPrice))
    local messageboxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "REPAIR_MESSAGEBOX_MEMO", "price", makeDotMoney(strPrice))
    local messageboxData = {
      title = PAGetString(Defines.StringSheet_GAME, "REPAIR_MESSAGEBOX_TITLE"),
      content = messageboxMemo,
      functionApply = Repair_Item_MessageBox_Confirm,
      functionCancel = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBoxCheck.showMessageBox(messageboxData)
    self._repairWhereType = itemWhereType
    self._repairSlotNo = slotNo
  end
end
function PaGlobalFunc_RepairInfo_EquipRClick(equipSlotNo, itemWrapper)
  local self = RepairInfo
  local isAble = itemWrapper:checkToRepairItem()
  if not isAble then
    return
  end
  local function onConfirmButton()
    local invenMoney = MessageBoxCheck.isCheck()
    local moneyWhereType = CppEnums.ItemWhereType.eInventory
    if invenMoney then
      moneyWhereType = CppEnums.ItemWhereType.eInventory
    else
      moneyWhereType = CppEnums.ItemWhereType.eWarehouse
    end
    if PaGlobal_Camp:getIsCamping() then
      repair_ItemByCamping(self._repairWhereType, self._repairSlotNo, CppEnums.ServantType.Type_Count)
    else
      repair_Item(self._repairWhereType, self._repairSlotNo, moneyWhereType, CppEnums.ServantType.Type_Count)
    end
  end
  local repairPrice = repair_getRepairPrice_s64(CppEnums.ItemWhereType.eEquip, equipSlotNo, CppEnums.ServantType.Type_Count, PaGlobal_Camp:getIsCamping())
  if repairPrice > Defines.s64_const.s64_0 then
    local strPrice = string.format("%d", Int64toInt32(repairPrice))
    local messageboxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "REPAIR_MESSAGEBOX_MEMO", "price", makeDotMoney(strPrice))
    local messageboxData = {
      title = PAGetString(Defines.StringSheet_GAME, "REPAIR_MESSAGEBOX_TITLE"),
      content = messageboxMemo,
      functionApply = onConfirmButton,
      functionCancel = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBoxCheck.showMessageBox(messageboxData)
    self._repairWhereType = CppEnums.ItemWhereType.eEquip
    self._repairSlotNo = equipSlotNo
  end
end
function PaGlobalFunc_RepairInfo_OnPadB()
  PaGlobalFunc_RepairInfo_Close()
end
function InputMOn_RepairInfo_SelectButton(buttonIndex)
  RepairInfo:updateButtonSelection(buttonIndex)
end
function InputMLUp_RepairInfo_PressButton(buttonIndex)
  RepairInfo:updateButtonSelection(buttonIndex)
  if buttonIndex == REPAIR_TYPE.GUILD then
    RepairInfo:onClickGuildRepair()
  elseif buttonIndex == REPAIR_TYPE.MAX_ENDURANCE then
    RepairInfo:onClickMaxEndurance()
  elseif buttonIndex == REPAIR_TYPE.SHIP then
    RepairInfo:onClickShipRepair()
  elseif buttonIndex == REPAIR_TYPE.SERVANT then
    RepairInfo:onClickServantRepair()
  elseif buttonIndex == REPAIR_TYPE.EQUIP then
    RepairInfo:onClickEquipRepair()
  elseif buttonIndex == REPAIR_TYPE.INVEN then
    RepairInfo:onClickInvenRepair()
  end
end
function RepairInfo:onClickGuildRepair()
  local s64_totalPrice = repair_RepairAllPrice_s64(CppEnums.ItemWhereType.eServantEquip, true, CppEnums.ServantType.Type_Vehicle, true, false)
  local GuildMoneyRepairElephant = function()
    repair_AllItem(CppEnums.ItemWhereType.eGuildWarehouse)
  end
  if s64_totalPrice > Defines.s64_const.s64_0 then
    local strPrice = string.format("%d", Int64toInt32(s64_totalPrice))
    local messageboxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "REPAIR_EQUIP_MESSAGEBOX_MEMO_ELEPHANT", "price", makeDotMoney(strPrice))
    local messageboxData = {
      title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"),
      content = messageboxMemo,
      functionYes = GuildMoneyRepairElephant,
      functionCancel = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageboxData)
  else
    local messageboxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_REPAIR_SERVANT_DISTANCEREPAIR")
    local messageboxData = {
      title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"),
      content = messageboxMemo,
      functionYes = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageboxData)
  end
end
function RepairInfo:onClickMaxEndurance()
  PaGlobalFunc_FixMaxEnduranceInfo_Open()
  _panel:SetShow(false)
end
function RepairInfo:onClickShipRepair()
  local s64_totalPrice = repair_RepairAllPrice_s64(CppEnums.ItemWhereType.eServantEquip, true, CppEnums.ServantType.Type_Ship, false, false)
  if s64_totalPrice > Defines.s64_const.s64_0 then
    local strPrice = string.format("%d", Int64toInt32(s64_totalPrice))
    local messageboxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "REPAIR_EQUIP_MESSAGEBOX_MEMO", "price", makeDotMoney(strPrice))
    local messageboxData = {
      title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"),
      content = messageboxMemo,
      functionApply = PaGlobalFunc_RepairInfo_RepairAll,
      functionCancel = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBoxCheck.showMessageBox(messageboxData)
  else
    local messageboxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_REPAIR_SERVANT_DISTANCEREPAIR")
    local messageboxData = {
      title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"),
      content = messageboxMemo,
      functionYes = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageboxData)
  end
end
function RepairInfo:onClickServantRepair()
  local s64_totalPrice = repair_RepairAllPrice_s64(CppEnums.ItemWhereType.eServantEquip, true, CppEnums.ServantType.Type_Vehicle, false, false)
  if s64_totalPrice > Defines.s64_const.s64_0 then
    local strPrice = string.format("%d", Int64toInt32(s64_totalPrice))
    local messageboxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "REPAIR_EQUIP_MESSAGEBOX_MEMO", "price", makeDotMoney(strPrice))
    local messageboxData = {
      title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"),
      content = messageboxMemo,
      functionApply = PaGlobalFunc_RepairInfo_RepairAll,
      functionCancel = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBoxCheck.showMessageBox(messageboxData)
  else
    local messageboxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_REPAIR_SERVANT_DISTANCEREPAIR")
    local messageboxData = {
      title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"),
      content = messageboxMemo,
      functionYes = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageboxData)
  end
end
function RepairInfo:onClickEquipRepair()
  local s64_totalPrice = repair_RepairAllPrice_s64(CppEnums.ItemWhereType.eEquip, true, CppEnums.ServantType.Type_Count, false, PaGlobal_Camp:getIsCamping())
  if s64_totalPrice > Defines.s64_const.s64_0 then
    local strPrice = string.format("%d", Int64toInt32(s64_totalPrice))
    local messageboxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "REPAIR_EQUIP_MESSAGEBOX_MEMO", "price", makeDotMoney(strPrice))
    local messageboxData = {
      title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"),
      content = messageboxMemo,
      functionApply = PaGlobalFunc_RepairInfo_RepairAll,
      functionCancel = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBoxCheck.showMessageBox(messageboxData)
  else
    local messageboxMemo = PAGetString(Defines.StringSheet_GAME, "REPAIR_NOT_MESSAGEBOX_MEMO")
    local messageboxData = {
      title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"),
      content = messageboxMemo,
      functionYes = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageboxData)
  end
end
function RepairInfo:onClickInvenRepair()
  local inventory_s64 = repair_RepairAllPrice_s64(CppEnums.ItemWhereType.eInventory, true, CppEnums.ServantType.Type_Count, false, PaGlobal_Camp:getIsCamping())
  local totalPrices_64 = repair_RepairAllPrice_s64(CppEnums.ItemWhereType.eCashInventory, false, CppEnums.ServantType.Type_Count, false, PaGlobal_Camp:getIsCamping())
  _PA_LOG("\235\176\149\235\178\148\236\164\128", "totalPrices_64 : " .. tostring(totalPrices_64))
  if totalPrices_64 > Defines.s64_const.s64_0 then
    local strPrice = string.format("%d", Int64toInt32(totalPrices_64))
    local messageboxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "REPAIR_INVENTORY_MESSAGEBOX_MEMO", "price", makeDotMoney(strPrice))
    local messageboxData = {
      title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"),
      content = messageboxMemo,
      functionApply = PaGlobalFunc_RepairInfo_RepairAll,
      functionCancel = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBoxCheck.showMessageBox(messageboxData)
  else
    local messageboxMemo = PAGetString(Defines.StringSheet_GAME, "REPAIR_NOT_MESSAGEBOX_MEMO")
    local messageboxData = {
      title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"),
      content = messageboxMemo,
      functionYes = MessageBox_Empty_function,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageboxData)
  end
end
function PaGlobalFunc_RepairInfo_RepairAll()
  local self = RepairInfo
  local invenMoney = MessageBoxCheck.isCheck()
  local moneyWhereType = CppEnums.ItemWhereType.eInventory
  if invenMoney then
    moneyWhereType = CppEnums.ItemWhereType.eInventory
  else
    moneyWhereType = CppEnums.ItemWhereType.eWarehouse
  end
  if PaGlobal_Camp:getIsCamping() then
    repair_AllItemByCamping()
  else
    repair_AllItem(moneyWhereType)
  end
end
function RepairInfo:initLuckyRepair()
  Panel_LuckyRepair_Result:SetSize(getScreenSizeX(), getScreenSizeY())
  Panel_LuckyRepair_Result:SetPosX(0)
  Panel_LuckyRepair_Result:SetPosY(0)
  Panel_LuckyRepair_Result:SetColor(Defines.Color.C_00FFFFFF)
  Panel_LuckyRepair_Result:SetIgnore(true)
  local tempSlot = {}
  local MSGBG = UI.getChildControl(Panel_LuckyRepair_Result, "LuckyRepair_BG")
  tempSlot.MSGBG = MSGBG
  local MSG = UI.getChildControl(Panel_LuckyRepair_Result, "LuckyRepair_MSG")
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
function FromClient_RepairInfo_resultShow()
  local self = RepairInfo
  if false == Panel_LuckyRepair_Result:GetShow() then
    self._luckyRepairMSG.MSG:SetText(PAGetString(Defines.StringSheet_GAME, "REPAIR_LUCKY_TEXT"))
    Panel_LuckyRepair_Result:SetShow(true)
    self._resultMsg_ShowTime = 0
  end
end
