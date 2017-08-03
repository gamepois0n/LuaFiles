-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\popup\panel_popup_moveitem.luac 

-- params : ...
-- function num : 0
Panel_Popup_MoveItem:SetShow(false, false)
Panel_Popup_MoveItem:setMaskingChild(true)
Panel_Popup_MoveItem:ActiveMouseEventEffect(true)
Panel_Popup_MoveItem:SetDragEnable(true)
Panel_Popup_MoveItem:setGlassBackground(true)
Panel_Popup_MoveItem:RegisterShowEventFunc(true, "Popup_MoveItemShowAni()")
Panel_Popup_MoveItem:RegisterShowEventFunc(false, "Popup_MoveItemHideAni()")
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_color = Defines.Color
local popupMoveItem = {
_config = {constSlotStartX = 6, constSlotStartY = 5, constSlotGapY = 35}
, _staticBG = (UI.getChildControl)(Panel_Popup_MoveItem, "Static_FunctionBG"), _whereType = nil, _slotNo = nil, _s64_count = (Defines.s64_const).s64_0, _fromWindowType = (CppEnums.MoveItemToType).Type_Count, _fromActorKeyRaw = nil, _toActorKeyRaw = nil, _slots = (Array.new)()}
Popup_MoveItemShowAni = function()
  -- function num : 0_0
  (UIAni.fadeInSCR_Right)(Panel_Popup_MoveItem)
end

Popup_MoveItemHideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color
  Panel_Popup_MoveItem:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_Popup_MoveItem:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

popupMoveItem.init = function(self)
  -- function num : 0_2
  ;
  (UI.ASSERT)(self._staticBG ~= nil and type(self._staticBG) ~= "number", "Static_FunctionBG")
  for ii = 0, (CppEnums.MoveItemToType).Type_Count - 1 do
    local slot = {}
    slot.button = (UI.createAndCopyBasePropertyControl)(Panel_Popup_MoveItem, "Button_Function", Panel_Popup_MoveItem, "PopupMoveItem_Button_" .. ii)
    if ii == 0 or ii == 1 or ii == 2 then
      (slot.button):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(slot.button, 1, 397, 155, 429)
      ;
      ((slot.button):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (slot.button):setRenderTexture((slot.button):getBaseTexture())
      ;
      (slot.button):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(slot.button, 156, 397, 310, 429)
      ;
      ((slot.button):getOnTexture()):setUV(x1, y1, x2, y2)
      ;
      (slot.button):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(slot.button, 311, 397, 465, 429)
      ;
      ((slot.button):getClickTexture()):setUV(x1, y1, x2, y2)
    elseif ii == 3 then
      (slot.button):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(slot.button, 1, 430, 155, 462)
      ;
      ((slot.button):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (slot.button):setRenderTexture((slot.button):getBaseTexture())
      ;
      (slot.button):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(slot.button, 156, 430, 310, 462)
      ;
      ((slot.button):getOnTexture()):setUV(x1, y1, x2, y2)
      ;
      (slot.button):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(slot.button, 311, 430, 465, 462)
      ;
      ((slot.button):getClickTexture()):setUV(x1, y1, x2, y2)
    elseif ii == 4 then
      (slot.button):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(slot.button, 1, 133, 155, 165)
      ;
      ((slot.button):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (slot.button):setRenderTexture((slot.button):getBaseTexture())
      ;
      (slot.button):ChangeOnTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(slot.button, 156, 133, 310, 165)
      ;
      ((slot.button):getOnTexture()):setUV(x1, y1, x2, y2)
      ;
      (slot.button):ChangeClickTextureInfoName("New_UI_Common_forLua/Widget/Dialogue/Dialogue_Btn_01.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(slot.button, 311, 133, 465, 165)
      ;
      ((slot.button):getClickTexture()):setUV(x1, y1, x2, y2)
    end
    ;
    (slot.button):SetPosX((self._config).constSlotStartX)
    ;
    (slot.button):SetPosY((self._config).constSlotStartY + (self._config).constSlotGapY * ii)
    ;
    (slot.button):SetShow(true)
    ;
    (slot.button):addInputEvent("Mouse_LUp", "HandleClickedMoveItemButton(" .. ii .. ")")
    slot._toType = nil
    slot._toActorKeyRaw = nil
    -- DECOMPILER ERROR at PC271: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._slots)[ii] = slot
  end
  ;
  (self._staticBG):SetShow(true)
  -- DECOMPILER ERROR: 5 unprocessed JMP targets
end

popupMoveItem.update = function(self)
  -- function num : 0_3
  for ii = 0, (CppEnums.MoveItemToType).Type_Count - 1 do
    local slot = (self._slots)[ii]
    ;
    (slot.button):SetShow(false)
  end
  local count = 0
  local index = 0
  for ii = 0, (CppEnums.MoveItemToType).Type_Count - 1 do
    if ii ~= self._fromWindowType then
      local slot = (self._slots)[ii]
      slot._toType = nil
      slot._toActorKeyRaw = nil
      if PopupMoveItem_IsButtonShow(slot, ii) then
        (slot.button):SetPosX((self._config).constSlotStartX)
        ;
        (slot.button):SetPosY((self._config).constSlotStartY + (self._config).constSlotGapY * count)
        if ii == 0 then
          local temporaryWrapper = getTemporaryInformationWrapper()
          local vehicleWrapper = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Vehicle)
          if temporaryWrapper ~= nil and vehicleWrapper ~= nil then
            (slot.button):SetText(vehicleWrapper:getName())
          end
        else
          do
            if ii == 1 then
              local temporaryWrapper = getTemporaryInformationWrapper()
              local vehicleWrapper = temporaryWrapper:getUnsealVehicle((CppEnums.ServantType).Type_Ship)
              if temporaryWrapper ~= nil and vehicleWrapper ~= nil then
                (slot.button):SetText(vehicleWrapper:getName())
              end
            else
              do
                do
                  if ii == 2 then
                    (slot.button):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITEM_TO_BUTTON_TOPET"))
                  else
                    ;
                    (slot.button):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MOVEITEM_TO_BUTTON" .. tostring(ii)))
                  end
                  ;
                  (slot.button):SetShow(true)
                  count = count + 1
                  index = ii
                  -- DECOMPILER ERROR at PC117: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC117: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC117: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC117: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC117: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC117: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC117: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC117: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC117: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC117: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
    end
  end
  if count == 0 then
    if (CppEnums.MoveItemToType).Type_Warehouse == self._fromWindowType then
      HandleClickedMoveItemButtonXXX(nil, nil)
    end
    return false
  else
    if count == 1 then
      HandleClickedMoveItemButton(index)
      return false
    end
  end
  return true
end

popupMoveItem.registEventHandler = function(self)
  -- function num : 0_4
end

popupMoveItem.registMessageHandler = function(self)
  -- function num : 0_5
end

FGlobal_PopupMoveItem_InitByInventory = function(slotNo, itemWrapper, s64_count, inventoryType)
  -- function num : 0_6
  FGlobal_PopupMoveItem_Init(inventoryType, slotNo, (CppEnums.MoveItemToType).Type_Player, (getSelfPlayer()):getActorKey(), true)
end

FGlobal_PopupMoveItem_Init = function(whereType, slotNo, fromWindowType, fromActorKeyRaw, isOpen)
  -- function num : 0_7 , upvalues : popupMoveItem
  local self = popupMoveItem
  local itemWrapper = getItemFromTypeAndSlot(fromWindowType, fromActorKeyRaw, whereType, slotNo)
  if itemWrapper == nil or itemWrapper == false then
    return 
  end
  self._whereType = whereType
  self._slotNo = slotNo
  self._fromWindowType = fromWindowType
  self._fromActorKeyRaw = fromActorKeyRaw
  self._s64_count = (itemWrapper:get()):getCount_s64()
  if not isOpen then
    return 
  end
  local isShow = self:update()
  local mousePosX = getMousePosX()
  local scrX = getScreenSizeX()
  if isShow then
    if scrX < mousePosX + Panel_Popup_MoveItem:GetSizeX() then
      Panel_Popup_MoveItem:SetPosX(scrX - Panel_Popup_MoveItem:GetSizeX() - 5)
    else
      Panel_Popup_MoveItem:SetPosX(getMousePosX())
    end
    Panel_Popup_MoveItem:SetPosY(getMousePosY() + 5)
    PopupMoveItem_Open()
  end
  audioPostEvent_SystemUi(1, 0)
  local itemWrapper = nil
  if (CppEnums.MoveItemToType).Type_Player == fromWindowType then
    itemWrapper = getInventoryItemByType(whereType, slotNo)
  else
    if (CppEnums.MoveItemToType).Type_Warehouse == fromWindowType then
      itemWrapper = Warehouse_GetItem(slotNo)
    else
      if (CppEnums.MoveItemToType).Type_Vehicle == fromWindowType or (CppEnums.MoveItemToType).Type_Ship == fromWindowType then
        itemWrapper = getServantInventoryItemBySlotNo(self._fromActorKeyRaw, slotNo)
      end
    end
  end
  if itemWrapper ~= nil then
    Item_Move_Sound(itemWrapper)
  end
end

HandleClickedMoveItemButton = function(index)
  -- function num : 0_8 , upvalues : popupMoveItem
  local self = popupMoveItem
  if (CppEnums.MoveItemToType).Type_Count == self._fromWindowType then
    return 
  end
  if (self._slots)[index] == nil then
    return 
  end
  local toWhereType = ((self._slots)[index])._toType
  local toActorKeyRaw = ((self._slots)[index])._toActorKeyRaw
  HandleClickedMoveItemButtonXXX(toWhereType, toActorKeyRaw)
end

HandleClickedMoveItemButtonXXX = function(toWhereType, toActorKeyRaw)
  -- function num : 0_9 , upvalues : popupMoveItem
  local self = popupMoveItem
  local fromWhereType = self._fromWindowType
  local fromActorKeyRaw = self._fromActorKeyRaw
  if (CppEnums.MoveItemToType).Type_Player == fromWhereType then
    if (CppEnums.MoveItemToType).Type_Vehicle == toWhereType or (CppEnums.MoveItemToType).Type_Ship == toWhereType or (CppEnums.MoveItemToType).Type_Pet == toWhereType then
      PopupMoveItem_MoveInventoryItemFromActorToActor(toActorKeyRaw, self._s64_count, self._whereType, self._slotNo)
    else
      if (CppEnums.MoveItemToType).Type_Warehouse == toWhereType then
        if FGlobal_WarehouseOpenByMaidCheck() then
          local itemWrapper = getInventoryItemByType(self._whereType, self._slotNo)
          if itemWrapper ~= nil then
            local itemSSW = itemWrapper:getStaticStatus()
            local weight = Int64toInt32((itemSSW:get())._weight) / 10000
            self._s64_count = toInt64(0, (math.min)((math.floor)(100 / weight), Int64toInt32(self._s64_count)))
          end
        end
        do
          Warehouse_PushFromInventoryItem(self._s64_count, self._whereType, self._slotNo, fromActorKeyRaw)
          if (CppEnums.MoveItemToType).Type_Vehicle == fromWhereType or (CppEnums.MoveItemToType).Type_Ship == fromWhereType or (CppEnums.MoveItemToType).Type_Pet == fromWhereType then
            if (CppEnums.MoveItemToType).Type_Vehicle == toWhereType or (CppEnums.MoveItemToType).Type_Ship == toWhereType or (CppEnums.MoveItemToType).Type_Pet == toWhereType or (CppEnums.MoveItemToType).Type_Player == toWhereType then
              PopupMoveItem_MoveInventoryItemFromActorToActor(toActorKeyRaw, self._s64_count, self._whereType, self._slotNo)
            else
              if (CppEnums.MoveItemToType).Type_Warehouse == toWhereType then
                Warehouse_PushFromInventoryItem(self._s64_count, self._whereType, self._slotNo, fromActorKeyRaw)
              end
            end
          else
            if (CppEnums.MoveItemToType).Type_Warehouse == fromWhereType then
              Warehouse_PopToSomewhere(self._s64_count, self._slotNo, toActorKeyRaw)
            else
              ;
              (UI.ASSERT)(false, "아이�\156 이동 �\128입이 정상적이�\128 않습니다!!!")
            end
          end
          PopupMoveItem_Close()
          audioPostEvent_SystemUi(1, 1)
        end
      end
    end
  end
end

PopupMoveItem_MoveInventoryItemFromActorToActor = function(toActorKeyRaw, s64_count, whereType, slotNo)
  -- function num : 0_10 , upvalues : popupMoveItem
  local self = popupMoveItem
  self._toActorKeyRaw = toActorKeyRaw
  Panel_NumberPad_Show(true, s64_count, slotNo, PopupMoveItem_MoveInventoryItemFromActorToActorXXX, nil, whereType)
end

PopupMoveItem_MoveInventoryItemFromActorToActorXXX = function(s64_count, slotNo, whereType)
  -- function num : 0_11 , upvalues : popupMoveItem
  local self = popupMoveItem
  moveInventoryItemFromActorToActor(self._fromActorKeyRaw, self._toActorKeyRaw, whereType, slotNo, s64_count)
end

getItemFromTypeAndSlot = function(type, actorKeyRaw, whereType, slotNo)
  -- function num : 0_12
  local itemWrapper = nil
  if (CppEnums.MoveItemToType).Type_Player == type then
    itemWrapper = getInventoryItemByType(whereType, slotNo)
    if itemWrapper == nil then
      return false
    end
  else
    if (CppEnums.MoveItemToType).Type_Vehicle == type or (CppEnums.MoveItemToType).Type_Ship == type then
      itemWrapper = getServantInventoryItemBySlotNo(actorKeyRaw, slotNo)
    else
      if (CppEnums.MoveItemToType).Type_Warehouse == type then
        itemWrapper = Warehouse_GetItem(slotNo)
      end
    end
  end
  return itemWrapper
end

PopupMoveItem_IsButtonShow = function(slot, type)
  -- function num : 0_13 , upvalues : popupMoveItem
  local self = popupMoveItem
  if (CppEnums.MoveItemToType).Type_Vehicle == type or (CppEnums.MoveItemToType).Type_Ship == type or (CppEnums.MoveItemToType).Type_Pet == type then
    if not Panel_Window_ServantInventory:GetShow() then
      return false
    end
    local inventory = ServantInventory_getInventoryFromType(type)
    if inventory == nil then
      return false
    end
    if inventory._actorKeyRaw == nil then
      return false
    end
    if getMoneySlotNo() == self._slotNo then
      return false
    end
    slot._toActorKeyRaw = inventory._actorKeyRaw
  else
    do
      if (CppEnums.MoveItemToType).Type_Player == type then
        if not Panel_Window_Inventory:GetShow() then
          return false
        end
        slot._toActorKeyRaw = (getSelfPlayer()):getActorKey()
      else
        if (CppEnums.MoveItemToType).Type_Warehouse == type then
          if not FGlobal_Warehouse_IsMoveItem() then
            return false
          end
          if not Panel_Window_Warehouse:GetShow() then
            return false
          end
        end
      end
      slot._toType = type
      return true
    end
  end
end

Item_Move_Sound = function(itemWrapper)
  -- function num : 0_14
  local itemSSW = itemWrapper:getStaticStatus()
  local itemType = itemSSW:getItemType()
  do
    local isTradeItem = itemSSW:isTradeAble()
    if (((((((itemType == 1 and itemType ~= 2) or itemType == 3) and itemType ~= 4) or itemType == 5) and itemType ~= 6) or itemType == 8) and itemType ~= 10) or isTradeItem == true then
    end
  end
end

PopupMoveItem_Open = function()
  -- function num : 0_15
  if Panel_Popup_MoveItem:GetShow() then
    return 
  end
  Panel_Popup_MoveItem:SetShow(true)
end

PopupMoveItem_Close = function()
  -- function num : 0_16
  if not Panel_Popup_MoveItem:GetShow() then
    return 
  end
  Panel_Popup_MoveItem:SetShow(false)
end

popupMoveItem:init()
popupMoveItem:registEventHandler()
popupMoveItem:registMessageHandler()

