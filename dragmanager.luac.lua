-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\dragmanager.luac 

-- params : ...
-- function num : 0
DragManager = {dragStartPanel = nil, dragSlotInfo = nil, groundClickFunc = nil}
local dragPanel = (UI.createPanelAndSetPanelRenderMode)("DragIconPanel", (Defines.UIGroup).PAGameUIGroup_ModalDialog, PAUIRenderModeBitSet({(Defines.RenderMode).eRenderMode_Default, (Defines.RenderMode).eRenderMode_Dialog}))
dragPanel:SetSize(40, 40)
dragPanel:SetPosX(100)
dragPanel:SetPosY(100)
dragPanel:SetIgnore(true)
dragPanel:SetShow(false, false)
DragPanel_PosUpdate = function()
  -- function num : 0_0 , upvalues : dragPanel
  dragPanel:SetPosX(getMousePosX())
  dragPanel:SetPosY(getMousePosY())
end

dragPanel:RegisterUpdateFunc("DragPanel_PosUpdate")
-- DECOMPILER ERROR at PC48: Confused about usage of register: R1 in 'UnsetPending'

DragManager.setDragImageSize = function(self, x, y)
  -- function num : 0_1 , upvalues : dragPanel
  dragPanel:SetSize(x, y)
end

-- DECOMPILER ERROR at PC52: Confused about usage of register: R1 in 'UnsetPending'

DragManager.getDragImageSize = function(self)
  -- function num : 0_2 , upvalues : dragPanel
  return dragPanel:GetSizeX(), dragPanel:GetSizeY()
end

-- DECOMPILER ERROR at PC56: Confused about usage of register: R1 in 'UnsetPending'

DragManager.setDragInfo = function(self, panel, whereType, slot, IconPath, groundHitCallbackFunction, fromActorKeyRaw)
  -- function num : 0_3 , upvalues : dragPanel
  if (panel == Panel_QuickSlot or panel == Panel_Window_Skill) and not isUseNewQuickSlot() then
    QuickSlot_ShowBackGround()
  end
  self.dragStartPanel = panel
  self.dragWhereTypeInfo = whereType
  self.dragSlotInfo = slot
  self.groundClickFunc = groundHitCallbackFunction
  self.fromActorKeyRaw = fromActorKeyRaw
  dragPanel:ChangeTextureInfoName(IconPath)
  dragPanel:SetShow(true, false)
  dragPanel:OnDragItemPanelForUISubApp()
  DragPanel_PosUpdate()
end

-- DECOMPILER ERROR at PC59: Confused about usage of register: R1 in 'UnsetPending'

DragManager.isDragging = function(self)
  -- function num : 0_4
  do return self.groundClickFunc ~= nil end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

-- DECOMPILER ERROR at PC63: Confused about usage of register: R1 in 'UnsetPending'

DragManager.clearInfo = function(self)
  -- function num : 0_5 , upvalues : dragPanel
  if dragPanel:IsShow() then
    dragPanel:SetShow(false, false)
    dragPanel:ClearDragItemPanelForUISubApp()
    self.dragStartPanel = nil
    self.dragWhereTypeInfo = nil
    self.dragSlotInfo = nil
    self.groundClickFunc = nil
    self.fromActorKeyRaw = nil
    QuickSlot_HideBackGround()
  end
end

dragManagerGroundMouseClick = function()
  -- function num : 0_6
  if DragManager.groundClickFunc ~= nil then
    (DragManager.groundClickFunc)(DragManager.dragWhereTypeInfo, DragManager.dragSlotInfo)
    if DragManager.dragStartPanel == Panel_QuickSlot then
      DragManager:clearInfo()
    end
    return true
  end
  return false
end

local GroundMouseEmpty = function()
  -- function num : 0_7
end

-- DECOMPILER ERROR at PC71: Confused about usage of register: R2 in 'UnsetPending'

DragManager.cancelInfo = function(self)
  -- function num : 0_8 , upvalues : dragPanel, GroundMouseEmpty
  dragPanel:SetShow(false, false)
  self.dragStartPanel = nil
  self.dragWhereTypeInfo = nil
  self.dragSlotInfo = nil
  self.groundClickFunc = GroundMouseEmpty
  self.fromActorKeyRaw = nil
end

-- DECOMPILER ERROR at PC74: Confused about usage of register: R2 in 'UnsetPending'

DragManager.getFromMoveType = function(self)
  -- function num : 0_9
  local fromMoveType = nil
  if Panel_Window_Inventory == self.dragStartPanel then
    fromMoveType = (CppEnums.MoveItemToType).Type_Player
  else
    if Panel_Window_ServantInventory == DragManager.dragStartPanel then
      fromMoveType = (CppEnums.MoveItemToType).Type_Vehicle
    else
      if Panel_Window_Warehouse == self.dragStartPanel then
        fromMoveType = (CppEnums.MoveItemToType).Type_Warehouse
      end
    end
  end
  return fromMoveType
end

-- DECOMPILER ERROR at PC77: Confused about usage of register: R2 in 'UnsetPending'

DragManager.itemDragMove = function(self, toType, toActorKey)
  -- function num : 0_10
  local fromWhereType = self.dragWhereTypeInfo
  local fromSlotNo = self.dragSlotInfo
  local fromMoveType = self:getFromMoveType()
  if fromMoveType == nil then
    return false
  end
  if (CppEnums.MoveItemToType).Type_Player ~= fromMoveType and self.fromActorKeyRaw == toActorKey then
    return 
  end
  FGlobal_PopupMoveItem_Init(fromWhereType, fromSlotNo, fromMoveType, self.fromActorKeyRaw, false)
  HandleClickedMoveItemButtonXXX(toType, toActorKey)
  self:clearInfo()
  return true
end

registerEvent("FromClient_GroundMouseClick", "dragManagerGroundMouseClick")

