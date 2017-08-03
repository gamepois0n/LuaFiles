-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\workertrade\panel_workertrade_office.luac 

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
_caravanIcon = {[1] = (UI.getChildControl)(Panel_WorkerTrade_Office, "StaticText_CaravanIcon1"), [2] = (UI.getChildControl)(Panel_WorkerTrade_Office, "StaticText_CaravanIcon2"), [3] = (UI.getChildControl)(Panel_WorkerTrade_Office, "StaticText_CaravanIcon3"), [4] = (UI.getChildControl)(Panel_WorkerTrade_Office, "StaticText_CaravanIcon4"), [5] = (UI.getChildControl)(Panel_WorkerTrade_Office, "StaticText_CaravanIcon5")}
, 
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

workerTradeOffice.update = function(self)
  -- function num : 0_3
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
  (control._title):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORKERTRADEOFFICE_FAMILY", "name", familyName))
  ;
  (control._officeMoney):SetText(makeDotMoney(coinCount))
  ;
  (control._warehouseMoeny):SetText(makeDotMoney(warehouseMoney))
  ;
  (control._caravanCount):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_WORKERTRADEOFFICE_CARAVANCOUNT", "count", caravanCount, "maxCount", self._caravanMaxCount))
  for index = 1, self._caravanMaxCount do
    local tradeGroupWrapper = tradeCompanyWrapper:getGroup(index - 1)
    if tradeGroupWrapper ~= nil then
      local state = tradeGroupWrapper:getState()
      ;
      ((control._caravanState)[index]):SetText(WorkerTrade_StateString(state))
      ;
      ((control._caravanIcon)[index]):ChangeTextureInfoName("New_UI_Common_forLua/Window/Trade/WorkerTrade_02.dds")
      local x1, y1, x2, y2 = setTextureUV_Func((control._caravanIcon)[index], 1, 151, 41, 171)
      ;
      (((control._caravanIcon)[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      ((control._caravanIcon)[index]):setRenderTexture(((control._caravanIcon)[index]):getBaseTexture())
    else
      do
        do
          if index >= 4 then
            ((control._caravanState)[index]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADEMAIN_DISABLECONTRACT"))
          else
            ;
            ((control._caravanState)[index]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADEMAIN_NOCONTRACT"))
          end
          -- DECOMPILER ERROR at PC125: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC125: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC125: LeaveBlock: unexpected jumping out IF_STMT

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
  -- function num : 0_4
  local string = nil
  if state == 0 then
    string = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADEOFFICE_STATE_0")
  else
    if state == 1 then
      string = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADEOFFICE_STATE_1")
    else
      if state == 2 then
        string = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADEOFFICE_STATE_2")
      else
        if state == 3 then
          string = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADEOFFICE_STATE_3")
        else
          if state == 4 then
            string = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADEOFFICE_STATE_4")
          else
            if state == 5 then
              string = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADEOFFICE_STATE_5")
            end
          end
        end
      end
    end
  end
  return string
end

WorkerTradeOffice_ExchangeMoneyToCompany = function()
  -- function num : 0_5
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
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADEOFFICE_SILVERALERT"))
    return 
  end
  local exchangeConfirm_TradeMoney = function(inputNumber)
    -- function num : 0_5_0 , upvalues : exchangeRate
    local doExchange = function()
      -- function num : 0_5_0_0 , upvalues : inputNumber
      ToClient_RequestExchangeWorkerTradeMoney(inputNumber, (CppEnums.ItemWhereType).eWarehouse)
    end

    local _title = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADEOFFICE_EXCHANGETITLE_1")
    local messageBoxMemo = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_WORKERTRADEOFFICE_EXCHANGECONTENT_1", "silver", makeDotMoney(toInt64(0, Int64toInt32(inputNumber) * exchangeRate)), "money", makeDotMoney(inputNumber))
    local messageBoxData = {title = _title, content = messageBoxMemo, functionYes = doExchange, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  end

  Panel_NumberPad_Show(true, toInt64(0, exchangeableMoney), 0, exchangeConfirm_TradeMoney)
end

WorkerTradeOffice_ExchangeMoneyToWarehouse = function()
  -- function num : 0_6
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local coinCount = tradeCompanyWrapper:getTradeCompanyMoney()
  if Int64toInt32(coinCount) <= 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADEOFFICE_COINALERT"))
    return 
  end
  local coinExchangeRate = ToClient_GetCoinExchangeRate()
  local exchangeConfirm_TradeMoney = function(inputNumber)
    -- function num : 0_6_0 , upvalues : coinExchangeRate
    local doExchange = function()
      -- function num : 0_6_0_0 , upvalues : inputNumber
      ToClient_RequestCollectWorkerTradeMoney(inputNumber, (CppEnums.ItemWhereType).eWarehouse)
    end

    local exchangeableMoney = Int64toInt32(inputNumber) * coinExchangeRate
    local _title = PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADEOFFICE_EXCHANGETITLE_2")
    local messageBoxMemo = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_WORKERTRADEOFFICE_EXCHANGECONTENT_2", "money", makeDotMoney(inputNumber), "silver", makeDotMoney(toInt64(0, exchangeableMoney)))
    local messageBoxData = {title = _title, content = messageBoxMemo, functionYes = doExchange, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  end

  Panel_NumberPad_Show(true, coinCount, 0, exchangeConfirm_TradeMoney)
end

FGlobal_WorkerTradeOffice_ShowToggle = function()
  -- function num : 0_7
  if Panel_WorkerTrade_Office:GetShow() then
    WorkerTradeOffice_Close()
  else
    WorkerTradeOffice_Show()
  end
end

WorkerTradeOffice_Show = function()
  -- function num : 0_8 , upvalues : workerTradeOffice
  WorldMapPopupManager:increaseLayer(true)
  WorldMapPopupManager:push(Panel_WorkerTrade_Office, true)
  Panel_WorkerTrade_Office:SetShow(true, true)
  workerTradeOffice:update()
  FromClient_ResponseWorkerTradeLog()
  ToClient_RequestOpenWorkerTrade()
end

WorkerTradeOffice_Close = function()
  -- function num : 0_9
  Panel_WorkerTrade_Office:SetShow(false, false)
  WorldMapPopupManager:pop()
end

FromClient_ResponseWorkerTradeLog = function()
  -- function num : 0_10 , upvalues : workerTradeOffice
  local control = workerTradeOffice.control
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local logCount = tradeCompanyWrapper:getLogCount()
  ;
  ((control._list2Log):getElementManager()):clearKey()
  for index = logCount - 1, 0, -1 do
    ((control._list2Log):getElementManager()):pushKey(toInt64(0, index))
  end
  ;
  (control._list2Log):moveIndex(logCount)
end

TradeLogListControlCreate = function(content, key)
  -- function num : 0_11
  local tradeLog = (UI.getChildControl)(content, "StaticText_Log")
  local icon = (UI.getChildControl)(content, "StaticText_Icon")
  tradeLog:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  local _key = Int64toInt32(key)
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local logCount = tradeCompanyWrapper:getLogCount()
  for index = 0, logCount - 1 do
    if logCount - 1 == _key then
      icon:ChangeTextureInfoName("New_UI_Common_forLua/Window/Trade/WorkerTrade_01.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(icon, 433, 366, 440, 406)
      ;
      (icon:getBaseTexture()):setUV(x1, y1, x2, y2)
      icon:setRenderTexture(icon:getBaseTexture())
    else
      do
        if _key == 0 then
          icon:ChangeTextureInfoName("New_UI_Common_forLua/Window/Trade/WorkerTrade_01.dds")
          local x1, y1, x2, y2 = setTextureUV_Func(icon, 433, 448, 440, 488)
          ;
          (icon:getBaseTexture()):setUV(x1, y1, x2, y2)
          icon:setRenderTexture(icon:getBaseTexture())
        else
          do
            icon:ChangeTextureInfoName("New_UI_Common_forLua/Window/Trade/WorkerTrade_01.dds")
            do
              do
                local x1, y1, x2, y2 = setTextureUV_Func(icon, 433, 407, 440, 447)
                ;
                (icon:getBaseTexture()):setUV(x1, y1, x2, y2)
                icon:setRenderTexture(icon:getBaseTexture())
                if index == _key and tradeCompanyWrapper:getLog(index) ~= nil then
                  tradeLog:SetText(tradeCompanyWrapper:getLog(index))
                  tradeLog:SetShow(true)
                  break
                end
                -- DECOMPILER ERROR at PC115: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC115: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC115: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC115: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC115: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC115: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC115: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
  end
end

FromClient_ResponseWorkerTradeInfo = function(notifytype, param1, param2)
  -- function num : 0_12 , upvalues : workerTradeOffice
  local msg = nil
  if notifytype == 0 then
    msg = "환전�\180 성공적으�\156 진행되었습니�\164."
  else
  end
  if notifytype ~= 1 or notifytype == 2 then
    msg = "생성"
  else
  end
  if (notifytype == 3 and notifytype ~= 4) or notifytype == 5 then
    msg = "시작"
    FGlobal_WorkerTradeCaravan_Hide()
  else
  end
  if ((notifytype == 6 and notifytype ~= 7) or notifytype == 8) then
    workerTradeOffice:update()
    FGlobal_WorkerTrade_Update()
    FGlobal_WorkerTradeCaravan_SetData()
    FGlbal_WorkerTradeHire_Update()
  end
end

workerTradeOffice.registerEvent = function(self)
  -- function num : 0_13
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

