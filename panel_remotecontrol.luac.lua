-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\remotecontrol\panel_remotecontrol.luac 

-- params : ...
-- function num : 0
Panel_RemoteControl:SetShow(false)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local VCK = CppEnums.VirtualKeyCode
local remoteCheck = false
local remoteControl = {main = (UI.getChildControl)(Panel_RemoteControl, "Static_RemoteMain"), interaction = (UI.getChildControl)(Panel_RemoteControl, "Button_Interaction"), 
fishing = {doFishing = (UI.getChildControl)(Panel_RemoteControl, "CheckButton_Fishing"), showInven = (UI.getChildControl)(Panel_RemoteControl, "CheckButton_Inven"), gotoWarehouse = (UI.getChildControl)(Panel_RemoteControl, "Button_Warehouse"), gotoTrade = (UI.getChildControl)(Panel_RemoteControl, "Button_Trade")}
, 
trade = {tradeGame = (UI.getChildControl)(Panel_RemoteControl, "Button_TradeGame"), allSell = (UI.getChildControl)(Panel_RemoteControl, "Button_AllSell")}
, 
warehouse = {manufacture = (UI.getChildControl)(Panel_RemoteControl, "CheckButton_Manufacture"), money = (UI.getChildControl)(Panel_RemoteControl, "Button_Money")}
, 
dialog = {leaveDialog = (UI.getChildControl)(Panel_RemoteControl, "Button_Leave"), trade = (UI.getChildControl)(Panel_RemoteControl, "Button_DialogTrade"), warehouse = (UI.getChildControl)(Panel_RemoteControl, "Button_DialogWarehouse")}
, 
openType = {fishing = 1, trade = 2, warehouse = 3, interaction = 4, dialogTrade = 5, dialogWarehouse = 6}
, isSpread = true, currentOpenType = 0, 
animationConfig = {playTime = 0.3, gapY = -185}
}
remoteControl.Show = function(self, openType)
  -- function num : 0_0 , upvalues : remoteCheck
  if not remoteCheck then
    return 
  end
  if (self.openType).fishing == openType then
    self:ControlHide()
    ;
    (self.main):SetShow(true)
    ;
    ((self.fishing).gotoTrade):SetShow(true)
    ;
    ((self.fishing).gotoWarehouse):SetShow(true)
    ;
    ((self.fishing).showInven):SetShow(true)
    ;
    ((self.fishing).doFishing):SetShow(Panel_Fishing:GetShow())
    ;
    ((self.fishing).doFishing):SetCheck(FGlobal_FishCheck())
    self:SetInventory()
  else
    if (self.openType).trade == openType then
      local mySellCount = npcShop_getSellCount()
      local vhicleSellCount = npcShop_getVehicleSellCount()
      local isShow = mySellCount + vhicleSellCount > 0
      self:ControlHide()
      ;
      (self.main):SetShow(true)
      ;
      ((self.dialog).leaveDialog):SetShow(true)
      ;
      ((self.trade).allSell):SetShow(isShow)
      ;
      ((self.trade).tradeGame):SetShow(isShow)
    elseif (self.openType).warehouse == openType then
      self:ControlHide()
      ;
      (self.main):SetShow(true)
      ;
      ((self.dialog).leaveDialog):SetShow(true)
      ;
      ((self.warehouse).money):SetShow(true)
      if ToClient_isPossibleManufactureAtWareHouse() then
        ((self.warehouse).manufacture):SetShow(true)
      end
    elseif (self.openType).dialogTrade == openType then
      self:ControlHide()
      ;
      (self.main):SetShow(true)
      ;
      ((self.dialog).leaveDialog):SetShow(true)
      ;
      ((self.dialog).trade):SetShow(true)
    elseif (self.openType).dialogWarehouse == openType then
      self:ControlHide()
      ;
      (self.main):SetShow(true)
      ;
      ((self.dialog).leaveDialog):SetShow(true)
      ;
      ((self.dialog).warehouse):SetShow(true)
    end
  end
  if (self.openType).interaction == openType then
    (self.interaction):SetShow(true)
  end
  self.currentOpenType = openType
  self.isSpread = true
  Panel_RemoteControl:SetShow(true)
  RemoteControl_ShowToggle()
  -- DECOMPILER ERROR: 6 unprocessed JMP targets
end

RemoteControl_Check = function()
  -- function num : 0_1 , upvalues : remoteCheck, remoteControl
  if remoteCheck then
    remoteControl:Show(1)
  else
    FGlobal_RemoteControl_Hide()
  end
end

FGlobal_RemoteControl_Check = function()
  -- function num : 0_2 , upvalues : remoteCheck
  remoteCheck = not remoteCheck
  RemoteControl_Check()
end

FGlobal_EquipFishingToolCheck = function()
  -- function num : 0_3 , upvalues : remoteControl
  if ((remoteControl.fishing).doFishing):GetShow() ~= Panel_Fishing:GetShow() then
    remoteControl:Show(1)
  end
end

remoteControl.SetInventory = function(self)
  -- function num : 0_4
  local useStartSlot = inventorySlotNoUserStart()
  local invenUseSize = ((getSelfPlayer()):get()):getInventorySlotCount(not FGlobal_RemoteInven_CheckNormalInven())
  local inventory = ((getSelfPlayer()):get()):getInventoryByType(FGboal_RemoteInven_CurrentWhereType())
  local freeCount = inventory:getFreeCount()
  ;
  ((self.fishing).showInven):SetText(invenUseSize - freeCount - useStartSlot .. "/" .. invenUseSize - 2)
end

FGlobal_RemoteControl_SetInven = function()
  -- function num : 0_5 , upvalues : remoteControl
  remoteControl:SetInventory()
end

remoteControl.Init = function(self)
  -- function num : 0_6
  (self.main):ActiveMouseEventEffect(true)
  ;
  (self.interaction):ActiveMouseEventEffect(true)
  ;
  (self.interaction):SetShow(false)
  for v,control in pairs(self.fishing) do
    control:ActiveMouseEventEffect(true)
  end
  for v,control in pairs(self.trade) do
    control:ActiveMouseEventEffect(true)
  end
  for v,control in pairs(self.warehouse) do
    control:ActiveMouseEventEffect(true)
  end
  for v,control in pairs(self.dialog) do
    control:ActiveMouseEventEffect(true)
  end
end

remoteControl.ControlHide = function(self)
  -- function num : 0_7
  (self.main):SetShow(false)
  for v,control in pairs(self.fishing) do
    control:SetShow(false)
  end
  for v,control in pairs(self.trade) do
    control:SetShow(false)
  end
  for v,control in pairs(self.warehouse) do
    control:SetShow(false)
  end
  for v,control in pairs(self.dialog) do
    control:SetShow(false)
  end
end

RemoteControl_ShowToggle = function()
  -- function num : 0_8 , upvalues : remoteControl
  local self = remoteControl
  self:ControlAnimate(self.isSpread)
  self.isSpread = not self.isSpread
end

remoteControl.ControlAnimate = function(self, isSpread)
  -- function num : 0_9 , upvalues : UI_ANI_ADV
  if (self.openType).fishing == self.currentOpenType then
    if isSpread then
      local moveAni1 = ((self.fishing).doFishing):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
      moveAni1:SetStartPosition((self.main):GetPosX(), (self.main):GetPosY())
      moveAni1:SetEndPosition((self.main):GetPosX(), (self.animationConfig).gapY * 4)
      local moveAni2 = ((self.fishing).showInven):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
      moveAni2:SetStartPosition((self.main):GetPosX(), (self.main):GetPosY())
      moveAni2:SetEndPosition((self.main):GetPosX(), (self.animationConfig).gapY * 3)
      local moveAni3 = ((self.fishing).gotoWarehouse):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
      moveAni3:SetStartPosition((self.main):GetPosX(), (self.main):GetPosY())
      moveAni3:SetEndPosition((self.main):GetPosX(), (self.animationConfig).gapY * 2)
      local moveAni4 = ((self.fishing).gotoTrade):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
      moveAni4:SetStartPosition((self.main):GetPosX(), (self.main):GetPosY())
      moveAni4:SetEndPosition((self.main):GetPosX(), (self.animationConfig).gapY * 1)
    else
      do
        local moveAni1 = ((self.fishing).doFishing):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
        moveAni1:SetStartPosition((self.main):GetPosX(), (self.animationConfig).gapY * 4)
        moveAni1:SetEndPosition((self.main):GetPosX(), (self.main):GetPosY())
        local moveAni2 = ((self.fishing).showInven):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
        moveAni2:SetStartPosition((self.main):GetPosX(), (self.animationConfig).gapY * 3)
        moveAni2:SetEndPosition((self.main):GetPosX(), (self.main):GetPosY())
        local moveAni3 = ((self.fishing).gotoWarehouse):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
        moveAni3:SetStartPosition((self.main):GetPosX(), (self.animationConfig).gapY * 2)
        moveAni3:SetEndPosition((self.main):GetPosX(), (self.main):GetPosY())
        do
          local moveAni4 = ((self.fishing).gotoTrade):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
          moveAni4:SetStartPosition((self.main):GetPosX(), (self.animationConfig).gapY * 1)
          moveAni4:SetEndPosition((self.main):GetPosX(), (self.main):GetPosY())
          if (self.openType).trade == self.currentOpenType then
            if isSpread then
              local moveAni1 = ((self.trade).tradeGame):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
              moveAni1:SetStartPosition((self.main):GetPosX(), (self.main):GetPosY())
              moveAni1:SetEndPosition((self.main):GetPosX(), (self.animationConfig).gapY * 3)
              local moveAni2 = ((self.trade).allSell):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
              moveAni2:SetStartPosition((self.main):GetPosX(), (self.main):GetPosY())
              moveAni2:SetEndPosition((self.main):GetPosX(), (self.animationConfig).gapY * 2)
              local moveAni3 = ((self.dialog).leaveDialog):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
              moveAni3:SetStartPosition((self.main):GetPosX(), (self.main):GetPosY())
              moveAni3:SetEndPosition((self.main):GetPosX(), (self.animationConfig).gapY * 1)
            else
              do
                local moveAni1 = ((self.trade).tradeGame):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
                moveAni1:SetStartPosition((self.main):GetPosX(), (self.animationConfig).gapY * 3)
                moveAni1:SetEndPosition((self.main):GetPosX(), (self.main):GetPosY())
                local moveAni2 = ((self.trade).allSell):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
                moveAni2:SetStartPosition((self.main):GetPosX(), (self.animationConfig).gapY * 2)
                moveAni2:SetEndPosition((self.main):GetPosX(), (self.main):GetPosY())
                do
                  local moveAni3 = ((self.dialog).leaveDialog):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
                  moveAni3:SetStartPosition((self.main):GetPosX(), (self.animationConfig).gapY * 1)
                  moveAni3:SetEndPosition((self.main):GetPosX(), (self.main):GetPosY())
                  if (self.openType).warehouse == self.currentOpenType then
                    if isSpread then
                      local moveAni1 = ((self.warehouse).manufacture):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
                      moveAni1:SetStartPosition((self.main):GetPosX(), (self.main):GetPosY())
                      moveAni1:SetEndPosition((self.main):GetPosX(), (self.animationConfig).gapY * 3)
                      local moveAni2 = ((self.warehouse).money):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
                      moveAni2:SetStartPosition((self.main):GetPosX(), (self.main):GetPosY())
                      moveAni2:SetEndPosition((self.main):GetPosX(), (self.animationConfig).gapY * 2)
                      local moveAni3 = ((self.dialog).leaveDialog):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
                      moveAni3:SetStartPosition((self.main):GetPosX(), (self.main):GetPosY())
                      moveAni3:SetEndPosition((self.main):GetPosX(), (self.animationConfig).gapY * 1)
                    else
                      do
                        local moveAni1 = ((self.warehouse).manufacture):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
                        moveAni1:SetStartPosition((self.main):GetPosX(), (self.animationConfig).gapY * 3)
                        moveAni1:SetEndPosition((self.main):GetPosX(), (self.main):GetPosY())
                        local moveAni2 = ((self.warehouse).money):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
                        moveAni2:SetStartPosition((self.main):GetPosX(), (self.animationConfig).gapY * 2)
                        moveAni2:SetEndPosition((self.main):GetPosX(), (self.main):GetPosY())
                        do
                          local moveAni3 = ((self.dialog).leaveDialog):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
                          moveAni3:SetStartPosition((self.main):GetPosX(), (self.animationConfig).gapY * 1)
                          moveAni3:SetEndPosition((self.main):GetPosX(), (self.main):GetPosY())
                          if (self.openType).dialogTrade == self.currentOpenType then
                            if isSpread then
                              local moveAni1 = ((self.dialog).trade):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
                              moveAni1:SetStartPosition((self.main):GetPosX(), (self.main):GetPosY())
                              moveAni1:SetEndPosition((self.main):GetPosX(), (self.animationConfig).gapY * 2)
                              local moveAni2 = ((self.dialog).leaveDialog):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
                              moveAni2:SetStartPosition((self.main):GetPosX(), (self.main):GetPosY())
                              moveAni2:SetEndPosition((self.main):GetPosX(), (self.animationConfig).gapY * 1)
                            else
                              do
                                local moveAni1 = ((self.dialog).trade):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
                                moveAni1:SetStartPosition((self.main):GetPosX(), (self.animationConfig).gapY * 2)
                                moveAni1:SetEndPosition((self.main):GetPosX(), (self.main):GetPosY())
                                do
                                  local moveAni2 = ((self.dialog).leaveDialog):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
                                  moveAni2:SetStartPosition((self.main):GetPosX(), (self.animationConfig).gapY * 1)
                                  moveAni2:SetEndPosition((self.main):GetPosX(), (self.main):GetPosY())
                                  if (self.openType).dialogWarehouse == self.currentOpenType then
                                    if isSpread then
                                      local moveAni1 = ((self.dialog).warehouse):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
                                      moveAni1:SetStartPosition((self.main):GetPosX(), (self.main):GetPosY())
                                      moveAni1:SetEndPosition((self.main):GetPosX(), (self.animationConfig).gapY * 2)
                                      local moveAni2 = ((self.dialog).leaveDialog):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
                                      moveAni2:SetStartPosition((self.main):GetPosX(), (self.main):GetPosY())
                                      moveAni2:SetEndPosition((self.main):GetPosX(), (self.animationConfig).gapY * 1)
                                    else
                                      do
                                        local moveAni1 = ((self.dialog).warehouse):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
                                        moveAni1:SetStartPosition((self.main):GetPosX(), (self.animationConfig).gapY * 2)
                                        moveAni1:SetEndPosition((self.main):GetPosX(), (self.main):GetPosY())
                                        local moveAni2 = ((self.dialog).leaveDialog):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
                                        moveAni2:SetStartPosition((self.main):GetPosX(), (self.animationConfig).gapY * 1)
                                        moveAni2:SetEndPosition((self.main):GetPosX(), (self.main):GetPosY())
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

RemoteControl_Interaction_ShowToggloe = function()
  -- function num : 0_10 , upvalues : remoteControl, UI_ANI_ADV
  local self = remoteControl
  local isShow = Panel_Interaction:GetShow()
  if Panel_Npc_Dialog:IsUse() then
    return 
  end
  ;
  (self.interaction):SetShow(true)
  if isShow then
    local moveAni1 = (self.interaction):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
    moveAni1:SetStartPosition((self.main):GetPosX(), (self.main):GetPosY())
    moveAni1:SetEndPosition((self.animationConfig).gapY * -1, (self.main):GetPosY())
  else
    do
      local moveAni1 = (self.interaction):addMoveAnimation(0, (self.animationConfig).playTime, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
      moveAni1:SetStartPosition((self.animationConfig).gapY * -1, (self.main):GetPosY())
      moveAni1:SetEndPosition((self.main):GetPosX(), (self.main):GetPosY())
    end
  end
end

RemoteControl_LeaveDialog = function()
  -- function num : 0_11 , upvalues : remoteControl
  if Panel_Npc_Trade_Market:GetShow() then
    closeNpcTrade_Basket()
    FGlobal_RemoteControl_Hide()
    remoteControl:Show(5)
  else
    FGlobal_HideDialog()
    FGlobal_RemoteControl_Hide()
    remoteControl:Show(1)
  end
end

RemoteControl_OpenTrade = function()
  -- function num : 0_12
  FGlobal_RemoteControl_Hide()
  FGlobal_Dialog_TradeOpen()
end

RemoteControl_OpenWarehouse = function()
  -- function num : 0_13 , upvalues : remoteControl
  FGlobal_RemoteControl_Hide()
  FGlobal_Dialog_WarehouseOpen()
  remoteControl:Show(3)
end

RemoteControl_Interaction = function()
  -- function num : 0_14
  local interactableActor = interaction_getInteractable()
  if interactableActor ~= nil then
    local interactionType = interactableActor:getSettedFirstInteractionType()
    Interaction_ButtonPushed(interactionType)
  end
end

RemoteControl_DoFishing = function()
  -- function num : 0_15 , upvalues : remoteControl
  if not Panel_Fishing:GetShow() then
    Proc_ShowMessage_Ack("낚싯�\128�\188 장비해주세요.")
  end
  FGlobal_SetFishCheck(((remoteControl.fishing).doFishing):IsCheck())
end

FGlobal_RemoteControl_FishCheck = function(check)
  -- function num : 0_16 , upvalues : remoteControl
  if ((remoteControl.fishing).doFishing):IsCheck() ~= check then
    ((remoteControl.fishing).doFishing):SetCheck(check)
  end
end

RemoteControl_ShowInventory = function()
  -- function num : 0_17
  FGlobal_RemoteInven_ShowToggle()
end

RemoteControl_GotoWarehouse = function()
  -- function num : 0_18
  HandleClicked_TownNpcIcon_NaviStart(6, true)
end

RemoteControl_GotoTrade = function()
  -- function num : 0_19
  HandleClicked_TownNpcIcon_NaviStart(5, true)
end

RemoteControl_AllSell = function()
  -- function num : 0_20
  HandleClicked_TradeItem_AllSellQuestion()
end

RemoteControl_Manufacture = function()
  -- function num : 0_21
  FGlobal_Dialog_ManufactureOpen()
end

local delayTime = 0
RemoteControl_ActionCheck = function(deltaTime)
  -- function num : 0_22 , upvalues : delayTime, remoteControl
  if not Panel_RemoteControl:GetShow() then
    return 
  end
  if IsSelfPlayerWaitAction() and (CppEnums.EProcessorInputMode).eProcessorInputMode_GameMode == getInputMode() then
    delayTime = delayTime + deltaTime
    if delayTime > 3 then
      FGlobal_RemoteControl_Hide()
      remoteControl:Show(1)
    end
  else
    delayTime = 0
  end
end

remoteControl.registEvent = function(self)
  -- function num : 0_23
  (self.main):addInputEvent("Mouse_LUp", "RemoteControl_ShowToggle()")
  ;
  (self.interaction):addInputEvent("Mouse_LUp", "RemoteControl_Interaction()")
  ;
  ((self.fishing).doFishing):addInputEvent("Mouse_LUp", "RemoteControl_DoFishing()")
  ;
  ((self.fishing).showInven):addInputEvent("Mouse_LUp", "RemoteControl_ShowInventory()")
  ;
  ((self.fishing).gotoWarehouse):addInputEvent("Mouse_LUp", "RemoteControl_GotoWarehouse()")
  ;
  ((self.fishing).gotoTrade):addInputEvent("Mouse_LUp", "RemoteControl_GotoTrade()")
  ;
  ((self.trade).tradeGame):addInputEvent("Mouse_LUp", "RemoteControl_TradeGame()")
  ;
  ((self.trade).allSell):addInputEvent("Mouse_LUp", "RemoteControl_AllSell()")
  ;
  ((self.warehouse).manufacture):addInputEvent("Mouse_LUp", "RemoteControl_Manufacture()")
  ;
  ((self.warehouse).money):addInputEvent("Mouse_LUp", "RemoteControl_GotoTrade()")
  ;
  ((self.dialog).leaveDialog):addInputEvent("Mouse_LUp", "RemoteControl_LeaveDialog()")
  ;
  ((self.dialog).trade):addInputEvent("Mouse_LUp", "RemoteControl_OpenTrade()")
  ;
  ((self.dialog).warehouse):addInputEvent("Mouse_LUp", "RemoteControl_OpenWarehouse()")
  registerEvent("EventEquipmentUpdate", "FGlobal_EquipFishingToolCheck")
  Panel_RemoteControl:RegisterUpdateFunc("RemoteControl_ActionCheck")
end

FGlobal_RemoteControl_Show = function(openType)
  -- function num : 0_24 , upvalues : remoteControl
  remoteControl:Show(openType)
end

FGlobal_RemoteControl_Hide = function()
  -- function num : 0_25 , upvalues : remoteControl
  Panel_RemoteControl:SetShow(false)
  Panel_RemoteInventory:SetShow(false)
  Panel_RemoteEquipment:SetShow(false)
  Panel_RemoteWarehouse:SetShow(false)
  Panel_RemoteManufacture:SetShow(false)
  ;
  ((remoteControl.fishing).doFishing):SetCheck(false)
  ;
  ((remoteControl.fishing).showInven):SetCheck(false)
  ;
  ((remoteControl.warehouse).manufacture):SetCheck(false)
end

remoteControl:Init()
remoteControl:registEvent()

