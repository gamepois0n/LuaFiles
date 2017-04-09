-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\workertrade\panel_workertrade.luac 

-- params : ...
-- function num : 0
Panel_WorkerTrade:SetShow(false, false)
Panel_WorkerTrade:setGlassBackground(true)
Panel_WorkerTrade:SetDragAll(true)
Panel_WorkerTrade:RegisterShowEventFunc(true, "Panel_WorkerTrade_ShowAni()")
Panel_WorkerTrade:RegisterShowEventFunc(false, "Panel_WorkerTrade_HideAni()")
local UI_TM = CppEnums.TextMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_color = Defines.Color
local isWorkerTradeContentOpen = ToClient_IsContentsGroupOpen("209")
Panel_WorkerTrade_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_WorkerTrade)
  local aniInfo1 = Panel_WorkerTrade:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_WorkerTrade:GetSizeX() / 2
  aniInfo1.AxisY = Panel_WorkerTrade:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_WorkerTrade:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_WorkerTrade:GetSizeX() / 2
  aniInfo2.AxisY = Panel_WorkerTrade:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_WorkerTrade_HideAni = function()
  -- function num : 0_1 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_WorkerTrade:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_WorkerTrade:addColorAnimation(0, 0.25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

local workerTrade = {mainImage = (UI.getChildControl)(Panel_WorkerTrade, "Static_MainImage"), btn_ChangeImg = (UI.getChildControl)(Panel_WorkerTrade, "Button_Change"), playerName = (UI.getChildControl)(Panel_WorkerTrade, "StaticText_PlayerName"), tradeLv = (UI.getChildControl)(Panel_WorkerTrade, "StaticText_TradeLevel"), caravanCount = (UI.getChildControl)(Panel_WorkerTrade, "StaticText_CaravaCount"), caravanName = (UI.getChildControl)(Panel_WorkerTrade, "StaticText_CaravanName"), haveItemCount = (UI.getChildControl)(Panel_WorkerTrade, "StaticText_DropItemCount"), btn_HaveItem = (UI.getChildControl)(Panel_WorkerTrade, "Button_ItemList"), coinValue = (UI.getChildControl)(Panel_WorkerTrade, "StaticText_CoinIcon"), btn_CoinChange = (UI.getChildControl)(Panel_WorkerTrade, "Button_CoinChange"), btn_Recieve = (UI.getChildControl)(Panel_WorkerTrade, "Button_Recieve"), btnBuy_Part1 = (UI.getChildControl)(Panel_WorkerTrade, "Button_OfficePart1_Sell"), haveCount_Part1 = (UI.getChildControl)(Panel_WorkerTrade, "StaticText_OfficePart1_HaveCount"), useCount_Part1 = (UI.getChildControl)(Panel_WorkerTrade, "StaticText_OfficePart1_UseCount"), price_Part1 = (UI.getChildControl)(Panel_WorkerTrade, "StaticText_OfficePart1_Price"), btnBuy_Part2 = (UI.getChildControl)(Panel_WorkerTrade, "Button_OfficePart2_Sell"), haveCount_Part2 = (UI.getChildControl)(Panel_WorkerTrade, "StaticText_OfficePart2_HaveCount"), useCount_Part2 = (UI.getChildControl)(Panel_WorkerTrade, "StaticText_OfficePart2_UseCount"), price_Part2 = (UI.getChildControl)(Panel_WorkerTrade, "StaticText_OfficePart2_Price"), btnBuy_Part3 = (UI.getChildControl)(Panel_WorkerTrade, "Button_OfficePart3_Sell"), haveCount_Part3 = (UI.getChildControl)(Panel_WorkerTrade, "StaticText_OfficePart3_HaveCount"), useCount_Part3 = (UI.getChildControl)(Panel_WorkerTrade, "StaticText_OfficePart3_UseCount"), price_Part3 = (UI.getChildControl)(Panel_WorkerTrade, "StaticText_OfficePart3_Price"), btnBuy_Part4 = (UI.getChildControl)(Panel_WorkerTrade, "Button_OfficePart4_Sell"), haveCount_Part4 = (UI.getChildControl)(Panel_WorkerTrade, "StaticText_OfficePart4_HaveCount"), useCount_Part4 = (UI.getChildControl)(Panel_WorkerTrade, "StaticText_OfficePart4_UseCount"), price_Part4 = (UI.getChildControl)(Panel_WorkerTrade, "StaticText_OfficePart4_Price"), 
caravanCondition = {[1] = (UI.getChildControl)(Panel_WorkerTrade, "StaticText_Caravan1_Condition"), [2] = (UI.getChildControl)(Panel_WorkerTrade, "StaticText_Caravan2_Condition"), [3] = (UI.getChildControl)(Panel_WorkerTrade, "StaticText_Caravan3_Condition"), [4] = (UI.getChildControl)(Panel_WorkerTrade, "StaticText_Caravan4_Condition"), [5] = (UI.getChildControl)(Panel_WorkerTrade, "StaticText_Caravan5_Condition")}
, 
bntManagement = {[1] = (UI.getChildControl)(Panel_WorkerTrade, "Button_Caravan1_Management"), [2] = (UI.getChildControl)(Panel_WorkerTrade, "Button_Caravan2_Management"), [3] = (UI.getChildControl)(Panel_WorkerTrade, "Button_Caravan3_Management"), [4] = (UI.getChildControl)(Panel_WorkerTrade, "Button_Caravan4_Management"), [5] = (UI.getChildControl)(Panel_WorkerTrade, "Button_Caravan5_Management")}
, list2_LogList = (UI.getChildControl)(Panel_WorkerTrade, "List2_TradeLog"), btnClose = (UI.getChildControl)(Panel_WorkerTrade, "Button_Close"), btnQuestion = (UI.getChildControl)(Panel_WorkerTrade, "Button_Question"), dropItemListBg = (UI.getChildControl)(Panel_WorkerTrade, "Static_DropItemList"), maxItemListCount = 10, 
dropItemList = {}
}
local templateSlot = {slotBg = (UI.getChildControl)(workerTrade.dropItemListBg, "Static_Slot_BG"), btn_Close = (UI.getChildControl)(workerTrade.dropItemListBg, "Button_ItemListClose"), 
config = {createBorder = true, createCount = true}
}
workerTrade.init = function(self)
  -- function num : 0_2 , upvalues : templateSlot
  for index = 0, self.maxItemListCount - 1 do
    local temp = {}
    temp.slotBg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, self.dropItemListBg, "WorkerTrade_DropItemListSlotBg_" .. index)
    CopyBaseProperty(templateSlot.slotBg, temp.slotBg)
    ;
    (temp.slotBg):SetShow(true)
    ;
    (temp.slotBg):SetPosX(10 + ((templateSlot.slotBg):GetSizeX() + 10) * (index % 5))
    ;
    (temp.slotBg):SetPosY(10 + ((templateSlot.slotBg):GetSizeY() + 10) * (math.floor)(index / 5))
    temp.slot = {}
    ;
    (SlotItem.new)(temp.slot, "DropItemSlot_", index, temp.slotBg, templateSlot.config)
    ;
    (temp.slot):createChild()
    ;
    ((temp.slot).icon):SetPosX(4)
    ;
    ((temp.slot).icon):SetPosY(4)
    -- DECOMPILER ERROR at PC76: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self.dropItemList)[index] = temp
  end
  ;
  (self.dropItemListBg):SetSize((((self.dropItemList)[4]).slotBg):GetPosX() + (((self.dropItemList)[4]).slotBg):GetSizeX() + 10, (((self.dropItemList)[5]).slotBg):GetPosY() + (((self.dropItemList)[5]).slotBg):GetSizeY() + 50)
  ;
  (templateSlot.btn_Close):ComputePos()
  self:registerEvent()
end

WorkerTrade_DropItemList_Close = function()
  -- function num : 0_3 , upvalues : workerTrade
  (workerTrade.dropItemListBg):SetShow(false)
end

workerTrade.registerEvent = function(self)
  -- function num : 0_4 , upvalues : templateSlot
  (self.btnClose):addInputEvent("Mouse_LUp", "WorkerTrade_Close()")
  ;
  (self.btnQuestion):SetShow(false)
  ;
  (self.btn_HaveItem):addInputEvent("Mouse_LUp", "HandleClicked_HaveItemListView()")
  ;
  (self.btn_CoinChange):addInputEvent("Mouse_LUp", "WorkerTrade_ExchangeMoneyToCompany()")
  ;
  (self.btn_Recieve):addInputEvent("Mouse_LUp", "WorkerTrade_ExchangeMoneyToWarehouse()")
  ;
  (self.btnBuy_Part1):addInputEvent("Mouse_LUp", "WorkerTrade_HireWorker(" .. 1 .. ")")
  ;
  (self.btnBuy_Part2):addInputEvent("Mouse_LUp", "WorkerTrade_HireWorker(" .. 2 .. ")")
  ;
  (self.btnBuy_Part3):addInputEvent("Mouse_LUp", "WorkerTrade_HireWorker(" .. 3 .. ")")
  ;
  (self.btnBuy_Part4):addInputEvent("Mouse_LUp", "WorkerTrade_HireWorker(" .. 4 .. ")")
  ;
  (templateSlot.btn_Close):addInputEvent("Mouse_LUp", "WorkerTrade_DropItemList_Close()")
  for index = 1, #self.bntManagement do
    ((self.bntManagement)[index]):addInputEvent("Mouse_LUp", "WorkerTrade_ManagementCaravan(" .. index .. ")")
  end
  registerEvent("FromClient_ResponseWorkerTradeInfo", "FromClient_ResponseWorkerTradeInfo")
  registerEvent("FromClient_ResponseWorkerTradeLog", "FromClient_ResponseWorkerTradeLog")
  ;
  (self.list2_LogList):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "TradeLogListControlCreate")
  ;
  (self.list2_LogList):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
end

WorkerTrade_ManagementCaravan = function(index)
  -- function num : 0_5
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local caravanCount = tradeCompanyWrapper:getGroupCount()
  if caravanCount < index then
    ToClient_RequestCreateTradeGroup(index)
  else
    FGlobal_WorkerTradeCaravan_Show(index)
  end
end

WorkerTrade_HireWorker = function(workerType)
  -- function num : 0_6
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local coinCount = tradeCompanyWrapper:getTradeCompanyMoney()
  local maxHireCount = 0
  local workerPrice = 1
  if workerType == 1 then
    workerPrice = ToClient_GetCarriagePrice()
  else
    if workerType == 2 then
      workerPrice = ToClient_GetPorterPrice()
    else
      if workerType == 3 then
        workerPrice = ToClient_GetGuardPrice()
      else
        if workerType == 4 then
          workerPrice = ToClient_GetAmuletPrice()
        end
      end
    end
  end
  maxHireCount = (math.floor)(Int64toInt32(coinCount) / Int64toInt32(workerPrice))
  if maxHireCount <= 0 then
    Proc_ShowMessage_Ack("보유 코인�\180 �\128족해 고용�\160 �\152 없습니다.")
    return 
  end
  local workerTrade_HireConfirm = function(inputNumber)
    -- function num : 0_6_0 , upvalues : workerType
    inputNumber = Int64toInt32(inputNumber)
    if workerType == 1 then
      ToClient_RequestEmployCarriage(inputNumber)
    else
      if workerType == 2 then
        ToClient_RequestEmployPorter(inputNumber)
      else
        if workerType == 3 then
          ToClient_RequestEmployGuard(inputNumber)
        else
          if workerType == 4 then
            ToClient_RequestEmployAmulet(inputNumber)
          end
        end
      end
    end
  end

  Panel_NumberPad_Show(true, toInt64(0, maxHireCount), 0, workerTrade_HireConfirm)
end

workerTrade.update = function(self)
  -- function num : 0_7
  local player = getSelfPlayer()
  if not player then
    return 
  end
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local coinCount = tradeCompanyWrapper:getTradeCompanyMoney()
  local caravanCount = tradeCompanyWrapper:getGroupCount()
  local familyName = player:getUserNickname()
  local userName = player:getOriginalName()
  local dropItemCount = tradeCompanyWrapper:getObtainItemListSize()
  ;
  (self.playerName):SetText("상단�\188 : " .. userName)
  ;
  (self.caravanCount):SetText("보유 상단 : " .. caravanCount .. "�\156")
  ;
  (self.coinValue):SetText(makeDotMoney(coinCount) .. " 코인")
  ;
  (self.caravanName):SetText("상단�\133 : <" .. familyName .. "> 상단")
  ;
  (self.haveItemCount):SetText("전리�\136 획득 �\152 : " .. dropItemCount .. "�\156")
  local part1Count = tradeCompanyWrapper:getTradeCompanyCarriage()
  local part2Count = tradeCompanyWrapper:getTradeCompanyPorter()
  local part3Count = tradeCompanyWrapper:getTradeCompanyGuard()
  local part4Count = tradeCompanyWrapper:getTradeCompanyAmulet()
  local part1Price = ToClient_GetCarriagePrice()
  local part2Price = ToClient_GetPorterPrice()
  local part3Price = ToClient_GetGuardPrice()
  local part4Price = ToClient_GetAmuletPrice()
  local part1UseCount = 0
  local part2UseCount = 0
  local part3UseCount = 0
  local part4UseCount = 0
  ;
  (self.haveCount_Part1):SetText("보유 : " .. part1Count .. "�\128")
  ;
  (self.haveCount_Part2):SetText("보유 : " .. part2Count .. "�\133")
  ;
  (self.haveCount_Part3):SetText("보유 : " .. part3Count .. "�\133")
  ;
  (self.haveCount_Part4):SetText("보유 : " .. part4Count .. "�\156")
  ;
  (self.price_Part1):SetText("�\128�\169 : " .. tostring(part1Price) .. "코인")
  ;
  (self.price_Part2):SetText("�\128�\169 : " .. tostring(part2Price) .. "코인")
  ;
  (self.price_Part3):SetText("�\128�\169 : " .. tostring(part3Price) .. "코인")
  ;
  (self.price_Part4):SetText("�\128�\169 : " .. tostring(part4Price) .. "코인")
  for index = 1, 5 do
    local tradeGroupWrapper = tradeCompanyWrapper:getGroup(index)
    if tradeGroupWrapper ~= nil then
      part1UseCount = part1UseCount + tradeGroupWrapper:getTradeGroupCarriage()
      part2UseCount = part2UseCount + tradeGroupWrapper:getTradeGroupPorter()
      part3UseCount = part3UseCount + tradeGroupWrapper:getTradeGroupGuard()
      part4UseCount = part4UseCount + tradeGroupWrapper:getTradeGroupAmulet()
    end
    if caravanCount < index then
      ((self.caravanCondition)[index]):SetText("�\156 " .. index .. " 상단 : 보유하지 않음")
      if caravanCount == index - 1 then
        ((self.bntManagement)[index]):SetShow(true)
        ;
        ((self.bntManagement)[index]):SetText("추가")
      else
        ;
        ((self.bntManagement)[index]):SetShow(false)
      end
    else
      ;
      ((self.caravanCondition)[index]):SetText("�\156 " .. index .. " 상단 : �\128기중")
      do
        do
          if tradeGroupWrapper ~= nil then
            local state = tradeGroupWrapper:getState()
            ;
            ((self.caravanCondition)[index]):SetText("�\156 " .. index .. " 상단 : " .. WorkerTrade_StateString(state))
          end
          ;
          ((self.bntManagement)[index]):SetShow(true)
          ;
          ((self.bntManagement)[index]):SetText("�\128�\172")
          -- DECOMPILER ERROR at PC220: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC220: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC220: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  ;
  (self.useCount_Part1):SetText("사용 : " .. part1UseCount .. "�\128")
  ;
  (self.useCount_Part2):SetText("사용 : " .. part2UseCount .. "�\133")
  ;
  (self.useCount_Part3):SetText("사용 : " .. part3UseCount .. "�\133")
  ;
  (self.useCount_Part4):SetText("사용 : " .. part4UseCount .. "�\156")
end

WorkerTrade_StateString = function(state)
  -- function num : 0_8
  local string = nil
  if state == 0 then
    string = "출발 �\128비중"
  else
    if state == 1 then
      string = "이동�\145"
    else
      if state == 2 then
        string = "거점 도착"
      else
        if state == 3 then
          string = "무역�\136 거래�\145"
        else
          if state == 4 then
            string = "�\128기중"
          else
            if state == 5 then
              string = "무역회사 �\128�\152"
            end
          end
        end
      end
    end
  end
  return string
end

HandleClicked_HaveItemListView = function()
  -- function num : 0_9 , upvalues : workerTrade
  local self = workerTrade
  ;
  (self.dropItemListBg):SetShow(false)
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local dropItemCount = tradeCompanyWrapper:getObtainItemListSize()
  if dropItemCount <= 0 then
    Proc_ShowMessage_Ack("보유�\156 전리품이 없습니다.")
    return 
  end
  ;
  (self.dropItemListBg):SetShow(true)
  for index = 0, self.maxItemListCount - 1 do
    (((self.dropItemList)[index]).slot):clearItem()
    ;
    ((((self.dropItemList)[index]).slot).icon):addInputEvent("Mouse_Out", "WorkerTrade_ItemToolTipShow()")
    if index < dropItemCount then
      local itemEnchantKey = tradeCompanyWrapper:getObtainItemEnchantKey(index)
      local itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(itemEnchantKey))
      local haveCount = tradeCompanyWrapper:getObtainItemCount(index)
      ;
      (((self.dropItemList)[index]).slot):setItemByStaticStatus(itemSSW, haveCount)
      ;
      ((((self.dropItemList)[index]).slot).icon):addInputEvent("Mouse_RUp", "WorkerTrade_getItemToWarehouse(" .. index .. ")")
      ;
      ((((self.dropItemList)[index]).slot).icon):addInputEvent("Mouse_On", "WorkerTrade_ItemToolTipShow(" .. index .. ")")
    else
      do
        do
          ;
          ((((self.dropItemList)[index]).slot).icon):addInputEvent("Mouse_On", "WorkerTrade_ItemToolTipShow()")
          ;
          ((((self.dropItemList)[index]).slot).icon):addInputEvent("Mouse_RUp", "")
          -- DECOMPILER ERROR at PC96: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC96: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC96: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end

WorkerTrade_getItemToWarehouse = function(index)
  -- function num : 0_10
  ToClient_RequestAcceptObtainElement(index)
end

WorkerTrade_ItemToolTipShow = function(index)
  -- function num : 0_11 , upvalues : workerTrade
  if index == nil then
    Panel_Tooltip_Item_hideTooltip()
    return 
  end
  local self = workerTrade
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local itemEnchantKey = tradeCompanyWrapper:getObtainItemEnchantKey(index)
  local itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(itemEnchantKey))
  Panel_Tooltip_Item_Show(itemSSW, (((self.dropItemList)[index]).slot).icon, true, false)
end

WorkerTrade_ExchangeMoneyToCompany = function()
  -- function num : 0_12
  local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
  if regionInfo == nil then
    return 
  end
  local myAffiliatedTownRegionKey = regionInfo:getAffiliatedTownRegionKey()
  local altinobaWaypointKey = 202
  local warehouseMoney = warehouse_moneyFromRegionKey_s64(altinobaWaypointKey)
  local exchangeRate = ToClient_GetExchangeRate()
  local exchangeableMoney = Int64toInt32(warehouseMoney) / exchangeRate
  local exchangeConfirm_TradeMoney = function(inputNumber)
    -- function num : 0_12_0 , upvalues : warehouseMoney, exchangeableMoney
    local doExchange = function()
      -- function num : 0_12_0_0 , upvalues : inputNumber
      ToClient_RequestExchangeWorkerTradeMoney(inputNumber, (CppEnums.ItemWhereType).eWarehouse)
    end

    local messageBoxMemo = "<" .. makeDotMoney(warehouseMoney) .. "> �\128화를 <" .. makeDotMoney(toInt64(0, exchangeableMoney)) .. "> 코인으로 환전하시겠습니까?"
    local messageBoxData = {title = "코인 환전", content = messageBoxMemo, functionYes = doExchange, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  end

  Panel_NumberPad_Show(true, toInt64(0, exchangeableMoney), 0, exchangeConfirm_TradeMoney)
end

WorkerTrade_ExchangeMoneyToWarehouse = function()
  -- function num : 0_13
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local coinCount = tradeCompanyWrapper:getTradeCompanyMoney()
  if Int64toInt32(coinCount) <= 0 then
    Proc_ShowMessage_Ack("환전�\160 코인�\180 없습니다.")
    return 
  end
  local exchangeRate = ToClient_GetExchangeRate()
  local exchangeConfirm_TradeMoney = function(inputNumber)
    -- function num : 0_13_0 , upvalues : exchangeRate
    local doExchange = function()
      -- function num : 0_13_0_0 , upvalues : inputNumber
      ToClient_RequestCollectWorkerTradeMoney(inputNumber, (CppEnums.ItemWhereType).eWarehouse)
    end

    local exchangeableMoney = Int64toInt32(inputNumber) * exchangeRate
    local messageBoxMemo = "<" .. makeDotMoney(inputNumber) .. "> 코인�\132 <" .. makeDotMoney(toInt64(0, exchangeableMoney)) .. "> �\128화로 환전하시겠습니까?"
    local messageBoxData = {title = "코인 환전", content = messageBoxMemo, functionYes = doExchange, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  end

  Panel_NumberPad_Show(true, coinCount, 0, exchangeConfirm_TradeMoney)
end

WorkerTrade_Open = function()
  -- function num : 0_14 , upvalues : workerTrade
  Panel_WorkerTrade:SetShow(true, true)
  workerTrade:update()
  FromClient_ResponseWorkerTradeLog()
  WorkerTrade_CharacterImageChange()
  WorkerTrade_DropItemList_Close()
end

WorkerTrade_Close = function()
  -- function num : 0_15
  Panel_WorkerTrade:SetShow(false, false)
  WorldMapPopupManager:pop()
end

FromClient_ResponseWorkerTradeLog = function()
  -- function num : 0_16 , upvalues : workerTrade
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local logCount = tradeCompanyWrapper:getLogCount()
  ;
  ((workerTrade.list2_LogList):getElementManager()):clearKey()
  for index = 0, logCount - 1 do
    ((workerTrade.list2_LogList):getElementManager()):pushKey(toInt64(0, index))
  end
end

TradeLogListControlCreate = function(content, key)
  -- function num : 0_17 , upvalues : workerTrade
  local tradeLog = (UI.getChildControl)(content, "StaticText_Log")
  local self = workerTrade
  local _key = Int64toInt32(key)
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local logCount = tradeCompanyWrapper:getLogCount()
  for index = 0, logCount - 1 do
    if index == _key and tradeCompanyWrapper:getLog(index) ~= nil then
      tradeLog:SetText(tradeCompanyWrapper:getLog(index))
      tradeLog:SetShow(true)
      break
    end
  end
end

WorkerTrade_CharacterImageChange = function()
  -- function num : 0_18 , upvalues : workerTrade
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local characterNo_s64 = selfPlayer:getCharacterNo_64()
  local characterDatacount = getCharacterDataCount()
  local UI_Class = CppEnums.ClassType
  for index = 0, characterDatacount - 1 do
    local characterData = getCharacterDataByIndex(index)
    if characterNo_s64 == characterData._characterNo_s64 then
      local char_Type = getCharacterClassType(characterData)
      local char_TextureName = getCharacterFaceTextureByIndex(index)
      local isCaptureExist = (workerTrade.mainImage):ChangeTextureInfoNameNotDDS(char_TextureName, char_Type)
      if isCaptureExist then
        ((workerTrade.mainImage):getBaseTexture()):setUV(0, 0, 1, 1)
        ;
        (workerTrade.mainImage):setRenderTexture((workerTrade.mainImage):getBaseTexture())
        break
      end
      if char_Type == UI_Class.ClassType_Warrior then
        (workerTrade.mainImage):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
        do
          local x1, y1, x2, y2 = setTextureUV_Func(workerTrade.mainImage, 1, 1, 156, 201)
          ;
          ((workerTrade.mainImage):getBaseTexture()):setUV(x1, y1, x2, y2)
          ;
          (workerTrade.mainImage):setRenderTexture((workerTrade.mainImage):getBaseTexture())
          do break end
          if char_Type == UI_Class.ClassType_Ranger then
            (workerTrade.mainImage):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
            do
              local x1, y1, x2, y2 = setTextureUV_Func(workerTrade.mainImage, 157, 1, 312, 201)
              ;
              ((workerTrade.mainImage):getBaseTexture()):setUV(x1, y1, x2, y2)
              ;
              (workerTrade.mainImage):setRenderTexture((workerTrade.mainImage):getBaseTexture())
              do break end
              if char_Type == UI_Class.ClassType_Sorcerer then
                (workerTrade.mainImage):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
                do
                  local x1, y1, x2, y2 = setTextureUV_Func(workerTrade.mainImage, 313, 1, 468, 201)
                  ;
                  ((workerTrade.mainImage):getBaseTexture()):setUV(x1, y1, x2, y2)
                  ;
                  (workerTrade.mainImage):setRenderTexture((workerTrade.mainImage):getBaseTexture())
                  do break end
                  if char_Type == UI_Class.ClassType_Giant then
                    (workerTrade.mainImage):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
                    do
                      local x1, y1, x2, y2 = setTextureUV_Func(workerTrade.mainImage, 1, 202, 156, 402)
                      ;
                      ((workerTrade.mainImage):getBaseTexture()):setUV(x1, y1, x2, y2)
                      ;
                      (workerTrade.mainImage):setRenderTexture((workerTrade.mainImage):getBaseTexture())
                      do break end
                      if char_Type == UI_Class.ClassType_Tamer then
                        (workerTrade.mainImage):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
                        do
                          local x1, y1, x2, y2 = setTextureUV_Func(workerTrade.mainImage, 157, 202, 312, 402)
                          ;
                          ((workerTrade.mainImage):getBaseTexture()):setUV(x1, y1, x2, y2)
                          ;
                          (workerTrade.mainImage):setRenderTexture((workerTrade.mainImage):getBaseTexture())
                          do break end
                          if char_Type == UI_Class.ClassType_BladeMaster then
                            (workerTrade.mainImage):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_00.dds")
                            do
                              local x1, y1, x2, y2 = setTextureUV_Func(workerTrade.mainImage, 313, 202, 468, 402)
                              ;
                              ((workerTrade.mainImage):getBaseTexture()):setUV(x1, y1, x2, y2)
                              ;
                              (workerTrade.mainImage):setRenderTexture((workerTrade.mainImage):getBaseTexture())
                              do break end
                              if char_Type == UI_Class.ClassType_Valkyrie then
                                (workerTrade.mainImage):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                do
                                  local x1, y1, x2, y2 = setTextureUV_Func(workerTrade.mainImage, 1, 1, 156, 201)
                                  ;
                                  ((workerTrade.mainImage):getBaseTexture()):setUV(x1, y1, x2, y2)
                                  ;
                                  (workerTrade.mainImage):setRenderTexture((workerTrade.mainImage):getBaseTexture())
                                  do break end
                                  if char_Type == UI_Class.ClassType_BladeMasterWomen then
                                    (workerTrade.mainImage):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                    do
                                      local x1, y1, x2, y2 = setTextureUV_Func(workerTrade.mainImage, 157, 1, 312, 201)
                                      ;
                                      ((workerTrade.mainImage):getBaseTexture()):setUV(x1, y1, x2, y2)
                                      ;
                                      (workerTrade.mainImage):setRenderTexture((workerTrade.mainImage):getBaseTexture())
                                      do break end
                                      if char_Type == UI_Class.ClassType_Wizard then
                                        (workerTrade.mainImage):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                        do
                                          local x1, y1, x2, y2 = setTextureUV_Func(workerTrade.mainImage, 313, 1, 468, 201)
                                          ;
                                          ((workerTrade.mainImage):getBaseTexture()):setUV(x1, y1, x2, y2)
                                          ;
                                          (workerTrade.mainImage):setRenderTexture((workerTrade.mainImage):getBaseTexture())
                                          do break end
                                          if char_Type == UI_Class.ClassType_WizardWomen then
                                            (workerTrade.mainImage):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                            do
                                              local x1, y1, x2, y2 = setTextureUV_Func(workerTrade.mainImage, 1, 202, 156, 402)
                                              ;
                                              ((workerTrade.mainImage):getBaseTexture()):setUV(x1, y1, x2, y2)
                                              ;
                                              (workerTrade.mainImage):setRenderTexture((workerTrade.mainImage):getBaseTexture())
                                              do break end
                                              if char_Type == UI_Class.ClassType_NinjaWomen then
                                                (workerTrade.mainImage):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                                do
                                                  do
                                                    local x1, y1, x2, y2 = setTextureUV_Func(workerTrade.mainImage, 157, 202, 312, 402)
                                                    ;
                                                    ((workerTrade.mainImage):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                    ;
                                                    (workerTrade.mainImage):setRenderTexture((workerTrade.mainImage):getBaseTexture())
                                                    do break end
                                                    if char_Type == UI_Class.ClassType_NinjaMan then
                                                      (workerTrade.mainImage):ChangeTextureInfoName("New_UI_Common_forLua/Window/GameExit/GameExit_CharSlot_01.dds")
                                                      local x1, y1, x2, y2 = setTextureUV_Func(workerTrade.mainImage, 313, 202, 468, 402)
                                                      ;
                                                      ((workerTrade.mainImage):getBaseTexture()):setUV(x1, y1, x2, y2)
                                                      ;
                                                      (workerTrade.mainImage):setRenderTexture((workerTrade.mainImage):getBaseTexture())
                                                    end
                                                    do break end
                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out DO_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out DO_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out DO_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out DO_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out DO_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out DO_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out DO_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out DO_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out DO_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out DO_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out DO_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                                    -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_STMT

                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

FromClient_ResponseWorkerTradeInfo = function(notifytype, param1, param2)
  -- function num : 0_19 , upvalues : workerTrade
  local msg = nil
  if notifytype == 0 then
    msg = "환전"
  else
    if notifytype == 1 then
      msg = "고용"
    else
      if notifytype == 2 then
        msg = "생성"
      else
        if notifytype == 3 then
          msg = "구매"
        else
          if notifytype == 4 then
            msg = "배치"
            FGlobal_WorkerTradeCaravan_SetData()
          else
            if notifytype == 5 then
              msg = "시작"
              FGlobal_WorkerTradeCaravan_SetData()
              FGlobal_WorkerTradeCaravan_Hide()
            else
              if notifytype == 6 then
                msg = "일꾼 등록"
                FGlobal_WorkerTradeCaravan_SetData()
              else
                if notifytype == 7 then
                  msg = "일꾼 해제"
                  FGlobal_WorkerTradeCaravan_SetData()
                else
                  if notifytype == 8 then
                    workerTrade:update()
                    if (workerTrade.dropItemListBg):GetShow() then
                      HandleClicked_HaveItemListView()
                    end
                    return 
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  Proc_ShowMessage_Ack(msg)
  workerTrade:update()
end

workerTrade:init()

