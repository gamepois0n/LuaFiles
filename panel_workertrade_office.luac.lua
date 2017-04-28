-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\workertrade\panel_workertrade_office.luac 

-- params : ...
-- function num : 0
Panel_WorkerTrade_Office:SetShow(false, false)
Panel_WorkerTrade_Office:setGlassBackground(true)
Panel_WorkerTrade_Office:SetDragAll(true)
Panel_WorkerTrade_Office:RegisterShowEventFunc(true, "Panel_WorkerTrade_Office_ShowAni()")
Panel_WorkerTrade_Office:RegisterShowEventFunc(false, "Panel_WorkerTrade_Office_HideAni()")
local UI_TM = CppEnums.TextMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_color = Defines.Color
Panel_WorkerTrade_Office_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_WorkerTrade_Office)
  local aniInfo1 = Panel_WorkerTrade_Office:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_WorkerTrade_Office:GetSizeX() / 2
  aniInfo1.AxisY = Panel_WorkerTrade_Office:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_WorkerTrade_Office:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_WorkerTrade_Office:GetSizeX() / 2
  aniInfo2.AxisY = Panel_WorkerTrade_Office:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_WorkerTrade_Office_HideAni = function()
  -- function num : 0_1 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_WorkerTrade_Office:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_WorkerTrade_Office:addColorAnimation(0, 0.25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

local workerTradeOffice = {
control = {_btnClose = (UI.getChildControl)(Panel_WorkerTrade_Office, "Button_Close"), _btnQuestion = (UI.getChildControl)(Panel_WorkerTrade_Office, "Button_Question"), _title = (UI.getChildControl)(Panel_WorkerTrade_Office, "StaticText_OfficeStatTitle"), _grade = (UI.getChildControl)(Panel_WorkerTrade_Office, "StaticText_OfficeGrade"), _btnCoin = (UI.getChildControl)(Panel_WorkerTrade_Office, "Button_ChangeCoin"), _btnSilver = (UI.getChildControl)(Panel_WorkerTrade_Office, "Button_ChangeSilver"), _warehouseMoeny = (UI.getChildControl)(Panel_WorkerTrade_Office, "StaticText_SilverIcon"), _officeMoney = (UI.getChildControl)(Panel_WorkerTrade_Office, "StaticText_CoinIcon"), _carriageCount = (UI.getChildControl)(Panel_WorkerTrade_Office, "StaticText_CarriageCount"), _workerCount = (UI.getChildControl)(Panel_WorkerTrade_Office, "StaticText_WorkerCount"), _guardCount = (UI.getChildControl)(Panel_WorkerTrade_Office, "StaticText_GuardCount"), _FACount = (UI.getChildControl)(Panel_WorkerTrade_Office, "StaticText_FACount"), _caravanCount = (UI.getChildControl)(Panel_WorkerTrade_Office, "StaticText_CaravanCount"), 
_caravanState = {[1] = (UI.getChildControl)(Panel_WorkerTrade_Office, "StaticText_CaravanState1"), [2] = (UI.getChildControl)(Panel_WorkerTrade_Office, "StaticText_CaravanState2"), [3] = (UI.getChildControl)(Panel_WorkerTrade_Office, "StaticText_CaravanState3"), [4] = (UI.getChildControl)(Panel_WorkerTrade_Office, "StaticText_CaravanState4"), [5] = (UI.getChildControl)(Panel_WorkerTrade_Office, "StaticText_CaravanState5")}
, _list2Log = (UI.getChildControl)(Panel_WorkerTrade_Office, "List2_TradeLog")}
, _caravanMaxCount = 5}
WorkerTrade_ManagementCaravan = function(index)
  -- function num : 0_2
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local caravanCount = tradeCompanyWrapper:getGroupCount()
  if caravanCount < index then
    ToClient_RequestCreateTradeGroup(index)
  else
    FGlobal_WorkerTradeCaravan_Show(index)
  end
end

WorkerTrade_HireWorker = function(workerType)
  -- function num : 0_3
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
    -- function num : 0_3_0 , upvalues : workerType
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

workerTradeOffice.update = function(self)
  -- function num : 0_4
  local player = getSelfPlayer()
  if not player then
    return 
  end
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local coinCount = tradeCompanyWrapper:getTradeCompanyMoney()
  local caravanCount = tradeCompanyWrapper:getGroupCount()
  local familyName = player:getUserNickname()
  local userName = player:getOriginalName()
  local altinobaWaypointKey = 202
  local warehouseMoney = warehouse_moneyFromRegionKey_s64(altinobaWaypointKey)
  local control = self.control
  ;
  (control._title):SetText("<" .. familyName .. ">�\128문의 무역 사무�\140")
  ;
  (control._officeMoney):SetText(makeDotMoney(coinCount))
  ;
  (control._warehouseMoeny):SetText(makeDotMoney(warehouseMoney))
  ;
  (control._caravanCount):SetText("운용 상단 : " .. caravanCount .. " / " .. self._caravanMaxCount)
  for index = 1, self._caravanMaxCount do
    local tradeGroupWrapper = tradeCompanyWrapper:getGroup(index - 1)
    if tradeGroupWrapper ~= nil then
      local state = tradeGroupWrapper:getState()
      ;
      ((control._caravanState)[index]):SetText(WorkerTrade_StateString(state))
    else
      do
        do
          ;
          ((control._caravanState)[index]):SetText("미계�\189")
          -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC71: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  local carriageCount = tradeCompanyWrapper:getTradeCompanyCarriage()
  local porterCount = tradeCompanyWrapper:getTradeCompanyPorter()
  local guardCount = tradeCompanyWrapper:getTradeCompanyGuard()
  local amuletCount = tradeCompanyWrapper:getTradeCompanyAmulet()
  ;
  (control._carriageCount):SetText(carriageCount)
  ;
  (control._workerCount):SetText(porterCount)
  ;
  (control._guardCount):SetText(guardCount)
  ;
  (control._FACount):SetText(amuletCount)
end

WorkerTrade_StateString = function(state)
  -- function num : 0_5
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
  -- function num : 0_6
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
  -- function num : 0_7
  ToClient_RequestAcceptObtainElement(index)
end

WorkerTradeOffice_ExchangeMoneyToCompany = function()
  -- function num : 0_8
  local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
  if regionInfo == nil then
    return 
  end
  local myAffiliatedTownRegionKey = regionInfo:getAffiliatedTownRegionKey()
  local altinobaWaypointKey = 202
  local warehouseMoney = warehouse_moneyFromRegionKey_s64(altinobaWaypointKey)
  local exchangeRate = ToClient_GetExchangeRate()
  local exchangeableMoney = Int64toInt32(warehouseMoney / toInt64(0, exchangeRate))
  if exchangeableMoney < 1 then
    Proc_ShowMessage_Ack("알티노바 창고�\144 보유�\156 �\128화가 적어 환전�\160 �\152 없습니다.")
    return 
  end
  local exchangeConfirm_TradeMoney = function(inputNumber)
    -- function num : 0_8_0 , upvalues : exchangeRate
    local doExchange = function()
      -- function num : 0_8_0_0 , upvalues : inputNumber
      ToClient_RequestExchangeWorkerTradeMoney(inputNumber, (CppEnums.ItemWhereType).eWarehouse)
    end

    local messageBoxMemo = "<" .. makeDotMoney(toInt64(0, Int64toInt32(inputNumber) * exchangeRate)) .. "> �\128화를 <" .. makeDotMoney(inputNumber) .. "> 알티노바 주화�\156 환전하시겠습니까?"
    local messageBoxData = {title = "주화 환전", content = messageBoxMemo, functionYes = doExchange, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  end

  Panel_NumberPad_Show(true, toInt64(0, exchangeableMoney), 0, exchangeConfirm_TradeMoney)
end

WorkerTradeOffice_ExchangeMoneyToWarehouse = function()
  -- function num : 0_9
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local coinCount = tradeCompanyWrapper:getTradeCompanyMoney()
  if Int64toInt32(coinCount) <= 0 then
    Proc_ShowMessage_Ack("환전�\160 주화�\128 없습니다.")
    return 
  end
  local coinExchangeRate = ToClient_GetCoinExchangeRate()
  local exchangeConfirm_TradeMoney = function(inputNumber)
    -- function num : 0_9_0 , upvalues : coinExchangeRate
    local doExchange = function()
      -- function num : 0_9_0_0 , upvalues : inputNumber
      ToClient_RequestCollectWorkerTradeMoney(inputNumber, (CppEnums.ItemWhereType).eWarehouse)
    end

    local exchangeableMoney = Int64toInt32(inputNumber) * coinExchangeRate
    local messageBoxMemo = "<" .. makeDotMoney(inputNumber) .. "> 주화�\188 <" .. makeDotMoney(toInt64(0, exchangeableMoney)) .. "> �\128화로 환전하시겠습니까?"
    local messageBoxData = {title = "�\128�\148 환전", content = messageBoxMemo, functionYes = doExchange, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  end

  Panel_NumberPad_Show(true, coinCount, 0, exchangeConfirm_TradeMoney)
end

FGlobal_WorkerTradeOffice_ShowToggle = function()
  -- function num : 0_10
  if Panel_WorkerTrade_Office:GetShow() then
    WorkerTradeOffice_Close()
  else
    WorkerTradeOffice_Show()
  end
end

WorkerTradeOffice_Show = function()
  -- function num : 0_11 , upvalues : workerTradeOffice
  WorldMapPopupManager:increaseLayer(true)
  WorldMapPopupManager:push(Panel_WorkerTrade_Office, true)
  Panel_WorkerTrade_Office:SetShow(true, true)
  workerTradeOffice:update()
  FromClient_ResponseWorkerTradeLog()
  ToClient_RequestOpenWorkerTrade()
end

WorkerTradeOffice_Close = function()
  -- function num : 0_12
  Panel_WorkerTrade_Office:SetShow(false, false)
  WorldMapPopupManager:pop()
end

FromClient_ResponseWorkerTradeLog = function()
  -- function num : 0_13 , upvalues : workerTradeOffice
  local control = workerTradeOffice.control
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local logCount = tradeCompanyWrapper:getLogCount()
  ;
  ((control._list2Log):getElementManager()):clearKey()
  for index = 0, logCount - 1 do
    ((control._list2Log):getElementManager()):pushKey(toInt64(0, index))
  end
end

TradeLogListControlCreate = function(content, key)
  -- function num : 0_14
  local tradeLog = (UI.getChildControl)(content, "StaticText_Log")
  tradeLog:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
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

FromClient_ResponseWorkerTradeInfo = function(notifytype, param1, param2)
  -- function num : 0_15 , upvalues : workerTradeOffice
  local msg = nil
  if notifytype == 0 then
    msg = "환전�\180 성공적으�\156 진행되었습니�\164."
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
          else
            if notifytype == 5 then
              msg = "시작"
              FGlobal_WorkerTradeCaravan_Hide()
            else
              if notifytype == 6 then
                msg = "일꾼 등록"
              else
                if notifytype == 7 then
                  msg = "일꾼 해제"
                else
                end
              end
            end
          end
        end
      end
    end
  end
  if notifytype == 8 then
    Proc_ShowMessage_Ack(msg)
    workerTradeOffice:update()
    FGlobal_WorkerTrade_Update()
    FGlobal_WorkerTradeCaravan_SetData()
    FGlbal_WorkerTradeHire_Update()
  end
end

workerTradeOffice.registerEvent = function(self)
  -- function num : 0_16
  local control = self.control
  ;
  (control._btnClose):addInputEvent("Mouse_LUp", "WorkerTradeOffice_Close()")
  ;
  (control._btnQuestion):addInputEvent("Mouse_LUp", "")
  ;
  (control._btnQuestion):SetShow(false)
  ;
  (control._btnCoin):addInputEvent("Mouse_LUp", "WorkerTradeOffice_ExchangeMoneyToCompany()")
  ;
  (control._btnSilver):addInputEvent("Mouse_LUp", "WorkerTradeOffice_ExchangeMoneyToWarehouse()")
  registerEvent("FromClient_ResponseWorkerTradeInfo", "FromClient_ResponseWorkerTradeInfo")
  registerEvent("FromClient_ResponseWorkerTradeLog", "FromClient_ResponseWorkerTradeLog")
  ;
  (control._list2Log):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "TradeLogListControlCreate")
  ;
  (control._list2Log):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
end

workerTradeOffice:registerEvent()

