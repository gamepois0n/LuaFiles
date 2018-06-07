-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\repair\panel_repair_renew.luac 

-- params : ...
-- function num : 0
local _panel = Panel_Repair_Renew
local REPAIR_TYPE = {UNDEFINED = 0, GUILD = 1, MAX_ENDURANCE = 2, SHIP = 3, SERVANT = 4, EQUIP = 5, INVEN = 6, COUNT = 6}
local RepairInfo = {
_ui = {stc_titleBar = (UI.getChildControl)(_panel, "Static_TitleBar"), txt_title = nil, stc_titleIcon = nil, stc_BodyBG = (UI.getChildControl)(_panel, "Static_BodyBG"), btn_template = nil, btn_repairs = nil, stc_clipAreas = nil, stc_buttonBGs = nil, txt_buttonNames = nil, stc_bottomLeft = (UI.getChildControl)(_panel, "Static_BottomLeft"), txt_moneyInChar = nil, txt_moneyInCharVal = nil, stc_bottomRight = (UI.getChildControl)(_panel, "Static_BottomRight"), txt_moneyInWarehouse = nil, txt_moneyInWarehouseVal = nil, stc_keyGuideSelect = (UI.getChildControl)(_panel, "Static_SelectKeyImage"), txt_keyGuide = (UI.getChildControl)(_panel, "StaticText_KeyGuide")}
, _buttonsYGap = 101, _mainButtonCount = 6, _currentButtonSelected = 0, _lateInitDone = false, _resultMsg_ShowTime = 0, _buttonBGSpeed = 5, _buttonBGSelectedX = 320, _buttonBGDeselectedX = 360, 
_isAnimating = {}
, 
_aniTargetForButtonBG = {}
, _isCamping = nil}
local _buttonsData = {
[REPAIR_TYPE.GUILD] = {
uv = {1, 200, 511, 297}
, text = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_REPAIR_ELEPHANT")}
, 
[REPAIR_TYPE.MAX_ENDURANCE] = {
uv = {1, 299, 511, 396}
, text = PAGetString(Defines.StringSheet_RESOURCE, "REPAIR_MAXENDURANCE_TITLE")}
, 
[REPAIR_TYPE.SHIP] = {
uv = {1, 1, 511, 98}
, text = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_REPAIR_BTN_REPAIR_SHIP")}
, 
[REPAIR_TYPE.SERVANT] = {
uv = {1, 100, 511, 197}
, text = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_REPAIR_BTN_REPAIR_VEHICLE")}
, 
[REPAIR_TYPE.EQUIP] = {
uv = {1, 399, 511, 496}
, text = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_REPAIR_BTN_EQUIPITEM")}
, 
[REPAIR_TYPE.INVEN] = {
uv = {1, 498, 511, 595}
, text = PAGetString(Defines.StringSheet_RESOURCE, "PANEL_REPAIR_BTN_IVNENITEM")}
}
FromClient_luaLoadComplete_Repair_Init = function()
  -- function num : 0_0 , upvalues : RepairInfo
  RepairInfo:initialize()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_Repair_Init")
RepairInfo.initialize = function(self)
  -- function num : 0_1 , upvalues : REPAIR_TYPE
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).txt_title = (UI.getChildControl)((self._ui).stc_titleBar, "StaticText_Title")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_titleIcon = (UI.getChildControl)((self._ui).stc_titleBar, "Static_TitleIcon")
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).btn_template = (UI.getChildControl)((self._ui).stc_BodyBG, "Button_Template")
  local buttonStartX = ((self._ui).btn_template):GetPosX()
  local buttonStartY = ((self._ui).btn_template):GetPosY()
  -- DECOMPILER ERROR at PC34: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui).btn_repairs = {}
  for ii = 1, REPAIR_TYPE.COUNT do
    -- DECOMPILER ERROR at PC52: Confused about usage of register: R7 in 'UnsetPending'

    ((self._ui).btn_repairs)[ii] = (UI.cloneControl)((self._ui).btn_template, (self._ui).stc_BodyBG, "Button_Repair_" .. ii)
    ;
    (((self._ui).btn_repairs)[ii]):SetShow(true)
    ;
    (((self._ui).btn_repairs)[ii]):SetPosX(buttonStartX)
    ;
    (((self._ui).btn_repairs)[ii]):SetPosY(buttonStartY + (ii - 1) * self._buttonsYGap)
    ;
    (((self._ui).btn_repairs)[ii]):addInputEvent("Mouse_LUp", "InputMLUp_RepairInfo_PressButton(" .. ii .. ")")
    ;
    (((self._ui).btn_repairs)[ii]):addInputEvent("Mouse_On", "InputMOn_RepairInfo_SelectButton(" .. ii .. ")")
  end
  ;
  ((self._ui).btn_template):SetShow(false)
  -- DECOMPILER ERROR at PC107: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui).txt_moneyInChar = (UI.getChildControl)((self._ui).stc_bottomLeft, "StaticText_MoneyInCharacter")
  -- DECOMPILER ERROR at PC115: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui).txt_moneyInCharVal = (UI.getChildControl)((self._ui).stc_bottomLeft, "StaticText_MoneyInCharacterVal")
  -- DECOMPILER ERROR at PC123: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui).txt_moneyInWarehouse = (UI.getChildControl)((self._ui).stc_bottomRight, "StaticText_MoneyInWarehouse")
  -- DECOMPILER ERROR at PC131: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui).txt_moneyInWarehouseVal = (UI.getChildControl)((self._ui).stc_bottomRight, "StaticText_MoneyInWarehouseVal")
  self:registMessageHandler()
  self:initLuckyRepair()
end

RepairInfo.registMessageHandler = function(self)
  -- function num : 0_2 , upvalues : _panel
  _panel:RegisterUpdateFunc("PaGlobalFunc_RepairInfo_UpdatePerFrame")
  Panel_LuckyRepair_Result:RegisterUpdateFunc("PaGlobalFunc_RepairInfo_UpdatePerFrame")
  registerEvent("FromClient_MaxEnduranceLuckyRepairEvent", "FromClient_RepairInfo_resultShow")
end

RepairInfo.lateInit = function(self)
  -- function num : 0_3 , upvalues : REPAIR_TYPE, _buttonsData
  if self._lateInitDone == true then
    return 
  end
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_buttonBGs = {}
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_buttonNames = {}
  for ii = 1, REPAIR_TYPE.COUNT do
    -- DECOMPILER ERROR at PC24: Confused about usage of register: R5 in 'UnsetPending'

    ((self._ui).stc_clipAreas)[ii] = (UI.getChildControl)(((self._ui).btn_repairs)[ii], "Static_ClipArea")
    -- DECOMPILER ERROR at PC34: Confused about usage of register: R5 in 'UnsetPending'

    ;
    ((self._ui).stc_buttonBGs)[ii] = (UI.getChildControl)(((self._ui).stc_clipAreas)[ii], "Static_ButtonBG")
    local stc_BG = ((self._ui).stc_buttonBGs)[ii]
    local x1, y1, x2, y2 = setTextureUV_Func(stc_BG, ((_buttonsData[ii]).uv)[1], ((_buttonsData[ii]).uv)[2], ((_buttonsData[ii]).uv)[3], ((_buttonsData[ii]).uv)[4])
    ;
    (stc_BG:getBaseTexture()):setUV(x1, y1, x2, y2)
    stc_BG:setRenderTexture(stc_BG:getBaseTexture())
    stc_BG:SetPosX(self._buttonBGDeselectedX)
    ;
    (((self._ui).stc_clipAreas)[ii]):SetRectClipOnArea(float2(0, 0), float2((((self._ui).stc_clipAreas)[ii]):GetSizeX(), (((self._ui).stc_clipAreas)[ii]):GetSizeY()))
    -- DECOMPILER ERROR at PC102: Confused about usage of register: R10 in 'UnsetPending'

    ;
    ((self._ui).txt_buttonNames)[ii] = (UI.getChildControl)(((self._ui).btn_repairs)[ii], "StaticText_Name")
    ;
    (((self._ui).txt_buttonNames)[ii]):SetText((_buttonsData[ii]).text)
  end
  self._lateInitDone = true
end

PaGlobalFunc_RepairInfo_IsOpened = function()
  -- function num : 0_4 , upvalues : _panel
  return _panel:GetShow()
end

PaGlobalFunc_RepairInfo_Open = function()
  -- function num : 0_5 , upvalues : RepairInfo
  RepairInfo:open()
end

RepairInfo.open = function(self)
  -- function num : 0_6 , upvalues : _panel, REPAIR_TYPE
  _panel:SetShow(true, false)
  self:lateInit()
  self._isCamping = PaGlobal_Camp:getIsCamping()
  SetUIMode((Defines.UIMode).eUIMode_Repair)
  repair_SetRepairMode(true)
  PaGlobalFunc_MainDialog_Close()
  InventoryWindow_Show()
  local initialSelect = REPAIR_TYPE.GUILD
  self:updateButtonSelection(initialSelect)
  self:updateMoneyDisplay()
end

PaGlobalFunc_RepairInfo_Close = function()
  -- function num : 0_7 , upvalues : RepairInfo
  RepairInfo:close()
end

RepairInfo.close = function(self)
  -- function num : 0_8 , upvalues : _panel
  _panel:SetShow(false, false)
  repair_SetRepairMode(false)
  if self._isCamping then
    SetUIMode((Defines.UIMode).eUIMode_Default)
  else
    SetUIMode((Defines.UIMode).eUIMode_NpcDialog)
  end
  if _ContentsGroup_RenewUI_Dailog == true then
    PaGlobalFunc_MainDialog_setIgnoreShowDialog(false)
  else
    setIgnoreShowDialog(false)
  end
  InventoryWindow_Close()
  PaGlobalFunc_MainDialog_ReOpen()
end

RepairInfo.updateButtonSelection = function(self, selection)
  -- function num : 0_9 , upvalues : REPAIR_TYPE
  self._currentButtonSelected = selection
  local keyGuideStartY = ((self._ui).stc_BodyBG):GetPosY() + ((self._ui).btn_template):GetPosY() + ((self._ui).btn_template):GetSizeY() / 2 - ((self._ui).stc_keyGuideSelect):GetSizeY() / 2
  ;
  ((self._ui).stc_keyGuideSelect):SetPosY(keyGuideStartY + (selection - 1) * self._buttonsYGap)
  for ii = 1, REPAIR_TYPE.COUNT do
    -- DECOMPILER ERROR at PC37: Confused about usage of register: R7 in 'UnsetPending'

    (self._aniTargetForButtonBG)[ii] = self._buttonBGDeselectedX
    -- DECOMPILER ERROR at PC39: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self._isAnimating)[ii] = true
  end
  -- DECOMPILER ERROR at PC43: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._aniTargetForButtonBG)[selection] = self._buttonBGSelectedX
end

RepairInfo.updateMoneyDisplay = function(self)
  -- function num : 0_10
  ((self._ui).txt_moneyInCharVal):SetText(makeDotMoney((((getSelfPlayer()):get()):getInventory()):getMoney_s64()))
  if ToClient_HasWareHouseFromNpc() then
    ((self._ui).txt_moneyInWarehouseVal):SetText(makeDotMoney(warehouse_moneyFromNpcShop_s64()))
    ;
    ((self._ui).txt_moneyInWarehouseVal):SetShow(true)
    ;
    ((self._ui).txt_moneyInWarehouse):SetShow(true)
  else
    ;
    ((self._ui).txt_moneyInWarehouseVal):SetShow(false)
    ;
    ((self._ui).txt_moneyInWarehouse):SetShow(false)
  end
end

PaGlobalFunc_RepairInfo_UpdatePerFrame = function(deltaTime)
  -- function num : 0_11 , upvalues : REPAIR_TYPE, RepairInfo
  for ii = 1, REPAIR_TYPE.COUNT do
    if (RepairInfo._isAnimating)[ii] == true then
      RepairInfo:animateButtonBG(ii, deltaTime)
    end
  end
end

RepairInfo.animateButtonBG = function(self, buttonIndex, deltaTime)
  -- function num : 0_12
  local stc_BG = ((self._ui).stc_buttonBGs)[buttonIndex]
  local target = (self._aniTargetForButtonBG)[buttonIndex]
  local currentPos = stc_BG:GetPosX()
  local distance = target - currentPos
  _PA_LOG("박범�\128", "buttonIndex : " .. buttonIndex .. ", distance : " .. distance)
  if (math.abs)(distance) > 2 then
    stc_BG:SetPosX(currentPos + distance * deltaTime * self._buttonBGSpeed)
  else
    stc_BG:SetPosX(target)
    -- DECOMPILER ERROR at PC33: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self._isAnimating)[buttonIndex] = false
  end
end

InputMOn_RepairInfo_SelectButton = function(buttonIndex)
  -- function num : 0_13 , upvalues : RepairInfo
  RepairInfo:updateButtonSelection(buttonIndex)
end

InputMLUp_RepairInfo_PressButton = function(buttonIndex)
  -- function num : 0_14 , upvalues : RepairInfo, REPAIR_TYPE
  RepairInfo:updateButtonSelection(buttonIndex)
  if buttonIndex == REPAIR_TYPE.GUILD then
    RepairInfo:onClickGuildRepair()
  else
    if buttonIndex == REPAIR_TYPE.MAX_ENDURANCE then
      RepairInfo:onClickMaxEndurance()
    else
      if buttonIndex == REPAIR_TYPE.SHIP then
        RepairInfo:onClickShipRepair()
      else
        if buttonIndex == REPAIR_TYPE.SERVANT then
          RepairInfo:onClickServantRepair()
        else
          if buttonIndex == REPAIR_TYPE.EQUIP then
            RepairInfo:onClickEquipRepair()
          else
            if buttonIndex == REPAIR_TYPE.INVEN then
              RepairInfo:onClickInvenRepair()
            end
          end
        end
      end
    end
  end
end

RepairInfo.onClickGuildRepair = function(self)
  -- function num : 0_15
  local s64_totalPrice = repair_RepairAllPrice_s64((CppEnums.ItemWhereType).eServantEquip, true, (CppEnums.ServantType).Type_Vehicle, true, false)
  local GuildMoneyRepairElephant = function()
    -- function num : 0_15_0
    repair_AllItem((CppEnums.ItemWhereType).eGuildWarehouse)
  end

  if (Defines.s64_const).s64_0 < s64_totalPrice then
    local strPrice = (string.format)("%d", Int64toInt32(s64_totalPrice))
    local messageboxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "REPAIR_EQUIP_MESSAGEBOX_MEMO_ELEPHANT", "price", makeDotMoney(strPrice))
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"), content = messageboxMemo, functionYes = GuildMoneyRepairElephant, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  else
    do
      local messageboxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_REPAIR_SERVANT_DISTANCEREPAIR")
      local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"), content = messageboxMemo, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageboxData)
    end
  end
end

RepairInfo.onClickMaxEndurance = function(self)
  -- function num : 0_16
end

RepairInfo.onClickShipRepair = function(self)
  -- function num : 0_17
  local s64_totalPrice = repair_RepairAllPrice_s64((CppEnums.ItemWhereType).eServantEquip, true, (CppEnums.ServantType).Type_Ship, false, false)
  if (Defines.s64_const).s64_0 < s64_totalPrice then
    local strPrice = (string.format)("%d", Int64toInt32(s64_totalPrice))
    local messageboxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "REPAIR_EQUIP_MESSAGEBOX_MEMO", "price", makeDotMoney(strPrice))
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"), content = messageboxMemo, functionYes = PaGlobalFunc_RepairInfo_RepairAll, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  else
    do
      local messageboxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_REPAIR_SERVANT_DISTANCEREPAIR")
      local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"), content = messageboxMemo, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageboxData)
    end
  end
end

RepairInfo.onClickServantRepair = function(self)
  -- function num : 0_18
  local s64_totalPrice = repair_RepairAllPrice_s64((CppEnums.ItemWhereType).eServantEquip, true, (CppEnums.ServantType).Type_Vehicle, false, false)
  if (Defines.s64_const).s64_0 < s64_totalPrice then
    local strPrice = (string.format)("%d", Int64toInt32(s64_totalPrice))
    local messageboxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "REPAIR_EQUIP_MESSAGEBOX_MEMO", "price", makeDotMoney(strPrice))
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"), content = messageboxMemo, functionYes = PaGlobalFunc_RepairInfo_RepairAll, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  else
    do
      local messageboxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_REPAIR_SERVANT_DISTANCEREPAIR")
      local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"), content = messageboxMemo, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageboxData)
    end
  end
end

RepairInfo.onClickEquipRepair = function(self)
  -- function num : 0_19
  local s64_totalPrice = repair_RepairAllPrice_s64((CppEnums.ItemWhereType).eEquip, true, (CppEnums.ServantType).Type_Count, false, PaGlobal_Camp:getIsCamping())
  if (Defines.s64_const).s64_0 < s64_totalPrice then
    local strPrice = (string.format)("%d", Int64toInt32(s64_totalPrice))
    local messageboxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "REPAIR_EQUIP_MESSAGEBOX_MEMO", "price", makeDotMoney(strPrice))
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"), content = messageboxMemo, functionYes = PaGlobalFunc_RepairInfo_RepairAll, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  else
    do
      local messageboxMemo = PAGetString(Defines.StringSheet_GAME, "REPAIR_NOT_MESSAGEBOX_MEMO")
      local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"), content = messageboxMemo, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageboxData)
    end
  end
end

RepairInfo.onClickInvenRepair = function(self)
  -- function num : 0_20
  local totalPrices_64 = repair_RepairAllPrice_s64((CppEnums.ItemWhereType).eCashInventory, false, (CppEnums.ServantType).Type_Count, false, PaGlobal_Camp:getIsCamping())
  if (Defines.s64_const).s64_0 < totalPrices_64 then
    local strPrice = (string.format)("%d", Int64toInt32(totalPrices_64))
    local messageboxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "REPAIR_INVENTORY_MESSAGEBOX_MEMO", "price", makeDotMoney(strPrice))
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"), content = messageboxMemo, functionYes = PaGlobalFunc_RepairInfo_RepairAll, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  else
    do
      local messageboxMemo = PAGetString(Defines.StringSheet_GAME, "REPAIR_NOT_MESSAGEBOX_MEMO")
      local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "REPAIR_ALL_MESSAGEBOX_TITLE"), content = messageboxMemo, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageboxData)
    end
  end
end

PaGlobalFunc_RepairInfo_RepairAll = function()
  -- function num : 0_21 , upvalues : RepairInfo
  local self = RepairInfo
  local invenMoney = (self._uiRepairInvenMoney):IsCheck()
  local wareHouseMoney = (self._uiRepairWareHouseMoney):IsCheck()
  local moneyWhereType = (CppEnums.ItemWhereType).eInventory
  if invenMoney then
    moneyWhereType = (CppEnums.ItemWhereType).eInventory
  else
    moneyWhereType = (CppEnums.ItemWhereType).eWarehouse
  end
  if PaGlobal_Camp:getIsCamping() then
    repair_AllItemByCamping()
  else
    repair_AllItem(moneyWhereType)
  end
end

RepairInfo.initLuckyRepair = function(self)
  -- function num : 0_22
  Panel_LuckyRepair_Result:SetSize(getScreenSizeX(), getScreenSizeY())
  Panel_LuckyRepair_Result:SetPosX(0)
  Panel_LuckyRepair_Result:SetPosY(0)
  Panel_LuckyRepair_Result:SetColor((Defines.Color).C_00FFFFFF)
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

FromClient_RepairInfo_resultShow = function()
  -- function num : 0_23 , upvalues : RepairInfo
  local self = RepairInfo
  if Panel_LuckyRepair_Result:GetShow() == false then
    ((self._luckyRepairMSG).MSG):SetText(PAGetString(Defines.StringSheet_GAME, "REPAIR_LUCKY_TEXT"))
    Panel_LuckyRepair_Result:SetShow(true)
    self._resultMsg_ShowTime = 0
  end
end

PaGlobalFunc_RepairInfo_UpdatePerFrame = function(deltaTime)
  -- function num : 0_24 , upvalues : RepairInfo
  local self = RepairInfo
  self._resultMsg_ShowTime = self._resultMsg_ShowTime + deltaTime
  if self._resultMsg_ShowTime > 3 and Panel_LuckyRepair_Result:GetShow() == true then
    Panel_LuckyRepair_Result:SetShow(false)
  end
  if self._resultMsg_ShowTime > 5 then
    self._resultMsg_ShowTime = 0
  end
end


