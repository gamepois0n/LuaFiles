-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\workertrade\panel_workertrade_hireoffice.luac 

-- params : ...
-- function num : 0
Panel_WorkerTrade_HireOffice:SetShow(false, false)
Panel_WorkerTrade_HireOffice:setGlassBackground(true)
Panel_WorkerTrade_HireOffice:SetDragAll(true)
Panel_WorkerTrade_HireOffice:RegisterShowEventFunc(true, "Panel_WorkerTrade_HireOffice_ShowAni()")
Panel_WorkerTrade_HireOffice:RegisterShowEventFunc(false, "Panel_WorkerTrade_HireOffice_HideAni()")
local UI_TM = CppEnums.TextMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_color = Defines.Color
Panel_WorkerTrade_HireOffice_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_WorkerTrade_HireOffice)
  local aniInfo1 = Panel_WorkerTrade_HireOffice:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_WorkerTrade_HireOffice:GetSizeX() / 2
  aniInfo1.AxisY = Panel_WorkerTrade_HireOffice:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_WorkerTrade_HireOffice:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_WorkerTrade_HireOffice:GetSizeX() / 2
  aniInfo2.AxisY = Panel_WorkerTrade_HireOffice:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_WorkerTrade_HireOffice_HideAni = function()
  -- function num : 0_1 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_WorkerTrade_HireOffice:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_WorkerTrade_HireOffice:addColorAnimation(0, 0.25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

local hireOffice = {
control = {_haveMoney = (UI.getChildControl)(Panel_WorkerTrade_HireOffice, "StaticText_CoinIcon"), 
_buySlotBg = {[1] = (UI.getChildControl)(Panel_WorkerTrade_HireOffice, "Static_BuySlotBg1"), [2] = (UI.getChildControl)(Panel_WorkerTrade_HireOffice, "Static_BuySlotBg3"), [3] = (UI.getChildControl)(Panel_WorkerTrade_HireOffice, "Static_BuySlotBg2"), [4] = (UI.getChildControl)(Panel_WorkerTrade_HireOffice, "Static_BuySlotBg4"), [5] = (UI.getChildControl)(Panel_WorkerTrade_HireOffice, "Static_BuySlotBg5"), [6] = (UI.getChildControl)(Panel_WorkerTrade_HireOffice, "Static_BuySlotBg6")}
, 
_price = {}
, 
_btnPlus = {}
, 
_btnMinus = {}
, 
_assetCount = {}
, 
_btnBuy = {}
, _carriageCount = (UI.getChildControl)(Panel_WorkerTrade_HireOffice, "StaticText_CarriageCount"), _workerCount = (UI.getChildControl)(Panel_WorkerTrade_HireOffice, "StaticText_WorkerCount"), _guardCount = (UI.getChildControl)(Panel_WorkerTrade_HireOffice, "StaticText_GuardCount"), _FACount = (UI.getChildControl)(Panel_WorkerTrade_HireOffice, "StaticText_FACount")}
, _buySlotCount = 6, 
_assetPrice = {}
, 
_assetSetCount = {}
}
hireOffice.ControlInit = function(self)
  -- function num : 0_2
  local control = self.control
  for index = 1, self._buySlotCount do
    -- DECOMPILER ERROR at PC12: Confused about usage of register: R6 in 'UnsetPending'

    (control._price)[index] = (UI.getChildControl)((control._buySlotBg)[index], "StaticText_Price")
    -- DECOMPILER ERROR at PC20: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (control._btnPlus)[index] = (UI.getChildControl)((control._buySlotBg)[index], "Static_Plus")
    -- DECOMPILER ERROR at PC28: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (control._btnMinus)[index] = (UI.getChildControl)((control._buySlotBg)[index], "Static_Minus")
    -- DECOMPILER ERROR at PC36: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (control._assetCount)[index] = (UI.getChildControl)((control._buySlotBg)[index], "Static_Count")
    -- DECOMPILER ERROR at PC44: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (control._btnBuy)[index] = (UI.getChildControl)((control._buySlotBg)[index], "Button_Buy")
  end
end

hireOffice:ControlInit()
hireOffice.DataInit = function(self)
  -- function num : 0_3
  self._assetPrice = {[1] = ToClient_GetCarriagePrice(), [2] = ToClient_GetPorterPrice(), [3] = ToClient_GetGuardPrice(), [4] = ToClient_GetAmuletPrice(), [5] = nil, [6] = nil}
  local control = self.control
  for index = 1, self._buySlotCount do
    ((control._assetCount)[index]):SetText("0")
    ;
    ((control._btnPlus)[index]):addInputEvent("Mouse_LUp", "WorkerTrade_HireOffice_SetAssetCount(" .. index .. ", " .. 1 .. ")")
    ;
    ((control._btnMinus)[index]):addInputEvent("Mouse_LUp", "WorkerTrade_HireOffice_SetAssetCount(" .. index .. ", " .. -1 .. ")")
    ;
    ((control._btnBuy)[index]):addInputEvent("Mouse_LUp", "WorkerTrade_HireOffice_BuyAsset(" .. index .. ")")
    -- DECOMPILER ERROR at PC58: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._assetSetCount)[index] = 0
  end
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  if tradeCompanyWrapper == nil then
    return 
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
  self:Update()
end

hireOffice.Update = function(self)
  -- function num : 0_4
  local control = self.control
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  if tradeCompanyWrapper == nil then
    return 
  end
  local haveMoney = tradeCompanyWrapper:getTradeCompanyMoney()
  ;
  (control._haveMoney):SetText(makeDotMoney(haveMoney))
  for index = 1, self._buySlotCount do
    if (self._assetPrice)[index] ~= nil then
      ((control._price)[index]):SetText(makeDotMoney((self._assetPrice)[index]))
    end
  end
end

WorkerTrade_HireOffice_SetAssetCount = function(index, increaseCount)
  -- function num : 0_5 , upvalues : hireOffice
  local self = hireOffice
  local control = self.control
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  if tradeCompanyWrapper == nil then
    return 
  end
  local haveMoney = Int64toInt32(tradeCompanyWrapper:getTradeCompanyMoney())
  for uiIndex = 1, self._buySlotCount do
    -- DECOMPILER ERROR at PC21: Confused about usage of register: R10 in 'UnsetPending'

    if index == uiIndex then
      (self._assetSetCount)[uiIndex] = (self._assetSetCount)[uiIndex] + increaseCount
      -- DECOMPILER ERROR at PC29: Confused about usage of register: R10 in 'UnsetPending'

      ;
      (self._assetSetCount)[uiIndex] = (math.max)(0, (self._assetSetCount)[uiIndex])
      -- DECOMPILER ERROR at PC43: Confused about usage of register: R10 in 'UnsetPending'

      if haveMoney < (self._assetSetCount)[uiIndex] * Int64toInt32((self._assetPrice)[uiIndex]) then
        (self._assetSetCount)[uiIndex] = (self._assetSetCount)[uiIndex] - 1
      end
    else
      -- DECOMPILER ERROR at PC46: Confused about usage of register: R10 in 'UnsetPending'

      ;
      (self._assetSetCount)[uiIndex] = 0
    end
    ;
    ((control._assetCount)[uiIndex]):SetText((self._assetSetCount)[uiIndex])
  end
end

WorkerTrade_HireOffice_BuyAsset = function(index)
  -- function num : 0_6 , upvalues : hireOffice
  local self = hireOffice
  local count = (self._assetSetCount)[index]
  if count > 0 then
    if index == 1 then
      ToClient_RequestEmployCarriage(count)
    else
      if index == 2 then
        ToClient_RequestEmployPorter(count)
      else
        if index == 3 then
          ToClient_RequestEmployGuard(count)
        else
          if index == 4 then
            ToClient_RequestEmployAmulet(count)
          end
        end
      end
    end
  else
    Proc_ShowMessage_Ack("먼저 수량�\132 결정해주세요.")
  end
end

hireOffice.Show = function(self)
  -- function num : 0_7
  WorldMapPopupManager:increaseLayer(true)
  WorldMapPopupManager:push(Panel_WorkerTrade_HireOffice, true)
  Panel_WorkerTrade_HireOffice:SetShow(true, true)
  self:DataInit()
end

hireOffice.Hide = function(self)
  -- function num : 0_8
  WorldMapPopupManager:pop()
  Panel_WorkerTrade_HireOffice:SetShow(false, true)
end

FGlobal_WorkerTradeHire_ShowToggle = function()
  -- function num : 0_9 , upvalues : hireOffice
  if Panel_WorkerTrade_HireOffice:GetShow() then
    hireOffice:Hide()
  else
    hireOffice:Show()
  end
end

FGlbal_WorkerTradeHire_Update = function()
  -- function num : 0_10 , upvalues : hireOffice
  hireOffice:DataInit()
end


