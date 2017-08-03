-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\itemmarket\panel_window_itemmarket_function.luac 

-- params : ...
-- function num : 0
Panel_Window_ItemMarket_Function:SetShow(false)
local ItemMarketFunction = {static_bg = (UI.getChildControl)(Panel_Window_ItemMarket_Function, "Static_Title"), btn_Market = (UI.getChildControl)(Panel_Window_ItemMarket_Function, "Button_Market"), btn_ItemSet = (UI.getChildControl)(Panel_Window_ItemMarket_Function, "Button_ItemSet"), btn_PreBidManager = (UI.getChildControl)(Panel_Window_ItemMarket_Function, "Button_PreBidManager"), btn_AlarmManager = (UI.getChildControl)(Panel_Window_ItemMarket_Function, "Button_AlarmManager"), btn_Exit = (UI.getChildControl)(Panel_Window_ItemMarket_Function, "Button_Exit")}
local isPreBidOpen = ToClient_IsContentsGroupOpen("88")
ItemMarketFunction.SetPosition = function(self)
  -- function num : 0_0 , upvalues : isPreBidOpen
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelSizeX = Panel_Window_ItemMarket_Function:GetSizeX()
  local panelSizeY = Panel_Window_ItemMarket_Function:GetSizeY()
  Panel_Window_ItemMarket_Function:SetSize(scrSizeX, panelSizeY)
  ;
  (self.static_bg):SetSize(scrSizeX, panelSizeY)
  Panel_Window_ItemMarket_Function:SetPosX(0)
  Panel_Window_ItemMarket_Function:SetPosY(scrSizeY - panelSizeY)
  ;
  (self.btn_PreBidManager):SetShow(isPreBidOpen)
  ;
  (self.btn_PreBidManager):SetSpanSize(75, 20)
  if isPreBidOpen == true then
    (self.btn_Market):SetSpanSize(-235, 20)
    ;
    (self.btn_ItemSet):SetSpanSize(-80, 20)
    ;
    (self.btn_AlarmManager):SetSpanSize(230, 20)
  else
    ;
    (self.btn_Market):SetSpanSize(-155, 20)
    ;
    (self.btn_ItemSet):SetSpanSize(0, 20)
    ;
    (self.btn_AlarmManager):SetSpanSize(155, 20)
  end
  ;
  (self.btn_Market):ComputePos()
  ;
  (self.btn_ItemSet):ComputePos()
  ;
  (self.btn_PreBidManager):ComputePos()
  ;
  (self.btn_AlarmManager):ComputePos()
  ;
  (self.btn_Exit):ComputePos()
end

ItemMarketFunction.SetBtnPosition = function(self)
  -- function num : 0_1
  local btnMarketSizeX = (self.btn_Market):GetSizeX() + 23
  local btnMarketTextPosX = btnMarketSizeX - btnMarketSizeX / 2 - (self.btn_Market):GetTextSizeX() / 2
  local btnItemSetSizeX = (self.btn_ItemSet):GetSizeX() + 23
  local btnItemSetTextPosX = btnItemSetSizeX - btnItemSetSizeX / 2 - (self.btn_ItemSet):GetTextSizeX() / 2
  local btnPreBidSizeX = (self.btn_PreBidManager):GetSizeX() + 23
  local btnPreBidTextPosX = btnPreBidSizeX - btnPreBidSizeX / 2 - (self.btn_PreBidManager):GetTextSizeX() / 2
  local btnAlarmSizeX = (self.btn_AlarmManager):GetSizeX() + 23
  local btnAlarmTextPosX = btnAlarmSizeX - btnAlarmSizeX / 2 - (self.btn_AlarmManager):GetTextSizeX() / 2
  local btnExitSizeX = (self.btn_Exit):GetSizeX() + 23
  local btnExitTextPosX = btnExitSizeX - btnExitSizeX / 2 - (self.btn_Exit):GetTextSizeX() / 2
  ;
  (self.btn_Market):SetTextSpan(btnMarketTextPosX, 5)
  ;
  (self.btn_ItemSet):SetTextSpan(btnItemSetTextPosX, 5)
  ;
  (self.btn_PreBidManager):SetTextSpan(btnPreBidTextPosX, 5)
  ;
  (self.btn_AlarmManager):SetTextSpan(btnAlarmTextPosX, 5)
  ;
  (self.btn_Exit):SetTextSpan(btnExitTextPosX, 5)
end

FGolbal_ItemMarket_Function_Open = function()
  -- function num : 0_2 , upvalues : ItemMarketFunction
  local self = ItemMarketFunction
  SetUIMode((Defines.UIMode).eUIMode_ItemMarket)
  Panel_Npc_Dialog:SetShow(false)
  self:SetBtnPosition()
  self:SetPosition()
  Panel_Window_ItemMarket_Function:SetShow(true)
  if isNewItemmarket_chk() then
    FGlobal_ItemMarketNew_Open()
  else
    FGlobal_ItemMarket_Open()
  end
end

FGolbal_ItemMarket_Function_Close = function()
  -- function num : 0_3
  SetUIMode((Defines.UIMode).eUIMode_NpcDialog)
  Panel_Npc_Dialog:SetShow(true)
  if isNewItemmarket_chk() then
    FGolbal_ItemMarketNew_Close()
  else
    FGolbal_ItemMarket_Close()
  end
  FGlobal_ItemMarketItemSet_Close()
  FGlobal_ItemMarket_BuyConfirm_Close()
  FGlobal_ItemMarketRegistItem_Close()
  FGlobal_ItemMarketAlarmList_Close()
  FGlobal_ItemMarketPreBid_Manager_Close()
  Panel_Window_ItemMarket_Function:SetShow(false)
end

HandleClicked_ItemMarketFunction_PreBidManager = function()
  -- function num : 0_4
  FGlobal_ItemMarketPreBid_Manager_Open()
end

HandleClicked_ItemMarketFunction_AlarmManager = function()
  -- function num : 0_5
  FGlobal_ItemMarketAlarmList_Open()
end

FromClient_responseItemMarkgetInfo = function(infoType, param1, param2)
  -- function num : 0_6
  if infoType == 0 then
    Update_ItemMarketMasterInfo()
  else
    if infoType == 1 then
      Update_ItemMarketSummaryInfo()
    else
      if infoType == 2 then
        Update_ItemMarketSellInfo()
      else
        if infoType == 3 then
          FGlobal_ItemMarketMyItems_Update()
        else
          if infoType == 4 then
            FGlobal_ItemMarketPreBid_Manager_Update()
          end
        end
      end
    end
  end
end

ItemMarketFunction.registEventHandler = function(self)
  -- function num : 0_7
  if isNewItemmarket_chk() then
    (self.btn_Market):addInputEvent("Mouse_LUp", "FGlobal_ItemMarketNew_Open()")
  else
    ;
    (self.btn_Market):addInputEvent("Mouse_LUp", "FGlobal_ItemMarket_Open()")
  end
  ;
  (self.btn_ItemSet):addInputEvent("Mouse_LUp", "FGlobal_ItemMarketItemSet_Open()")
  ;
  (self.btn_Exit):addInputEvent("Mouse_LUp", "FGolbal_ItemMarket_Function_Close()")
  ;
  (self.btn_PreBidManager):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarketFunction_PreBidManager()")
  ;
  (self.btn_AlarmManager):addInputEvent("Mouse_LUp", "HandleClicked_ItemMarketFunction_AlarmManager()")
end

ItemMarketFunction.registMessageHandler = function(self)
  -- function num : 0_8
  registerEvent("FromClient_responseItemMarkgetInfo", "FromClient_responseItemMarkgetInfo")
end

ItemMarketFunction:registEventHandler()
ItemMarketFunction:registMessageHandler()

