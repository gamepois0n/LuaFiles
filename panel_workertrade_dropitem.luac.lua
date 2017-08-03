-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\workertrade\panel_workertrade_dropitem.luac 

-- params : ...
-- function num : 0
Panel_WorkerTrade_DropItem:SetShow(false, false)
Panel_WorkerTrade_DropItem:setGlassBackground(true)
Panel_WorkerTrade_DropItem:SetDragAll(true)
Panel_WorkerTrade_DropItem:RegisterShowEventFunc(true, "Panel_WorkerTrade_DropItem_ShowAni()")
Panel_WorkerTrade_DropItem:RegisterShowEventFunc(false, "Panel_WorkerTrade_DropItem_HideAni()")
local UI_TM = CppEnums.TextMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_color = Defines.Color
local isWorkerTradeContentOpen = ToClient_IsContentsGroupOpen("209")
Panel_WorkerTrade_DropItem_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_WorkerTrade_DropItem)
  local aniInfo1 = Panel_WorkerTrade_DropItem:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_WorkerTrade_DropItem:GetSizeX() / 2
  aniInfo1.AxisY = Panel_WorkerTrade_DropItem:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_WorkerTrade_DropItem:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_WorkerTrade_DropItem:GetSizeX() / 2
  aniInfo2.AxisY = Panel_WorkerTrade_DropItem:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_WorkerTrade_DropItem_HideAni = function()
  -- function num : 0_1 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_WorkerTrade_DropItem:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_WorkerTrade_DropItem:addColorAnimation(0, 0.25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

local workerTradeDropItem = {
control = {_btnClose = (UI.getChildControl)(Panel_WorkerTrade_DropItem, "Button_Close"), 
_slot = {[0] = (UI.getChildControl)(Panel_WorkerTrade_DropItem, "Static_Slot0"), [1] = (UI.getChildControl)(Panel_WorkerTrade_DropItem, "Static_Slot1"), [2] = (UI.getChildControl)(Panel_WorkerTrade_DropItem, "Static_Slot2"), [3] = (UI.getChildControl)(Panel_WorkerTrade_DropItem, "Static_Slot3"), [4] = (UI.getChildControl)(Panel_WorkerTrade_DropItem, "Static_Slot4"), [5] = (UI.getChildControl)(Panel_WorkerTrade_DropItem, "Static_Slot5"), [6] = (UI.getChildControl)(Panel_WorkerTrade_DropItem, "Static_Slot6"), [7] = (UI.getChildControl)(Panel_WorkerTrade_DropItem, "Static_Slot7"), [8] = (UI.getChildControl)(Panel_WorkerTrade_DropItem, "Static_Slot8"), [9] = (UI.getChildControl)(Panel_WorkerTrade_DropItem, "Static_Slot9")}
, _btnRecieve = (UI.getChildControl)(Panel_WorkerTrade_DropItem, "Button_ItemRecieve")}
, _maxCount = 10, 
_itemSlot = {}
, 
_config = {createBorder = true, createCount = true}
}
workerTradeDropItem.Update = function(self)
  -- function num : 0_2
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local dropItemCount = tradeCompanyWrapper:getObtainItemListSize()
  for index = 0, self._maxCount - 1 do
    ((self._itemSlot)[index]):clearItem()
    ;
    (((self._itemSlot)[index]).icon):addInputEvent("Mouse_Out", "WorkerTrade_ItemToolTipShow()")
    if index < dropItemCount then
      local itemEnchantKey = tradeCompanyWrapper:getObtainItemEnchantKey(index)
      local itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(itemEnchantKey))
      local haveCount = tradeCompanyWrapper:getObtainItemCount(index)
      ;
      ((self._itemSlot)[index]):setItemByStaticStatus(itemSSW, haveCount)
      ;
      (((self._itemSlot)[index]).icon):addInputEvent("Mouse_On", "WorkerTrade_ItemToolTipShow(" .. index .. ")")
    else
      do
        do
          ;
          (((self._itemSlot)[index]).icon):addInputEvent("Mouse_On", "WorkerTrade_ItemToolTipShow()")
          -- DECOMPILER ERROR at PC57: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC57: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC57: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end

WorkerTrade_getItemToWarehouse = function(index)
  -- function num : 0_3
  ToClient_RequestAcceptObtainElement(index)
end

WorkerTrade_ItemToolTipShow = function(index)
  -- function num : 0_4 , upvalues : workerTradeDropItem
  if index == nil then
    Panel_Tooltip_Item_hideTooltip()
    return 
  end
  local self = workerTradeDropItem
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local itemEnchantKey = tradeCompanyWrapper:getObtainItemEnchantKey(index)
  local itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(itemEnchantKey))
  Panel_Tooltip_Item_Show(itemSSW, ((self._itemSlot)[index]).icon, true, false)
end

WorkerTradeDropItem_RecieveAll = function()
  -- function num : 0_5 , upvalues : workerTradeDropItem
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local dropItemCount = tradeCompanyWrapper:getObtainItemListSize()
  if dropItemCount > 0 then
    for index = 0, dropItemCount - 1 do
      ToClient_RequestAcceptObtainElement(index)
    end
  end
  do
    workerTradeDropItem:Update()
  end
end

workerTradeDropItem.Show = function(self)
  -- function num : 0_6
  local tradeCompanyWrapper = ToClient_GetTradeCompanyWrapper()
  local dropItemCount = tradeCompanyWrapper:getObtainItemListSize()
  if dropItemCount <= 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORKERTRADEDROPITEM_ALERT"))
    return 
  end
  WorldMapPopupManager:increaseLayer(true)
  WorldMapPopupManager:push(Panel_WorkerTrade_DropItem, true)
  self:Update()
end

workerTradeDropItem.Hide = function(self)
  -- function num : 0_7
  WorldMapPopupManager:pop()
end

FGlobal_WorkerTradeTreasure_ShowToggle = function()
  -- function num : 0_8 , upvalues : workerTradeDropItem
  if Panel_WorkerTrade_DropItem:GetShow() then
    workerTradeDropItem:Hide()
  else
    workerTradeDropItem:Show()
  end
end

workerTradeDropItem.registerEvent = function(self)
  -- function num : 0_9
  ((self.control)._btnClose):addInputEvent("Mouse_LUp", "FGlobal_WorkerTradeTreasure_ShowToggle()")
  ;
  ((self.control)._btnRecieve):addInputEvent("Mouse_LUp", "WorkerTradeDropItem_RecieveAll()")
  for index = 0, self._maxCount - 1 do
    local temp = {}
    ;
    (SlotItem.new)(temp, "DropItemSlot_", index, ((self.control)._slot)[index], self._config)
    temp:createChild()
    ;
    (temp.icon):SetPosX(4)
    ;
    (temp.icon):SetPosY(4)
    -- DECOMPILER ERROR at PC39: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._itemSlot)[index] = temp
  end
end

workerTradeDropItem:registerEvent()

