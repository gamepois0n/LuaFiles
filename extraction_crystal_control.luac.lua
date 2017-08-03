-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\extraction\extraction_crystal_control.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
-- DECOMPILER ERROR at PC6: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_ExtractionCrystal.createControl = function(self)
  -- function num : 0_0
  self:createControl_uiEquipMain()
  self:createControl_uiSlotSocket()
  self:createControl_uiSlotExtractionMaterial()
end

-- DECOMPILER ERROR at PC9: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_ExtractionCrystal.createControl_uiEquipMain = function(self)
  -- function num : 0_1
  local extractionEquipMain = {}
  extractionEquipMain.icon = (self._uiControl).staticEquipSocket
  ;
  (SlotItem.new)(extractionEquipMain, "ExtractionEquip_Socket", 0, Panel_Window_Extraction_Crystal, self._slotConfig)
  extractionEquipMain:createChild()
  ;
  (extractionEquipMain.icon):addInputEvent("Mouse_RUp", "PaGlobal_ExtractionCrystal:handleMRUpEquipSocket()")
  Panel_Tooltip_Item_SetPosition(0, extractionEquipMain, "Socket")
  CopyBaseProperty(self._enchantNumber, extractionEquipMain.enchantText)
  ;
  (extractionEquipMain.enchantText):SetSize((extractionEquipMain.icon):GetSizeX(), (extractionEquipMain.icon):GetSizeY())
  ;
  (extractionEquipMain.enchantText):SetPosX(0)
  ;
  (extractionEquipMain.enchantText):SetPosY(0)
  ;
  (extractionEquipMain.enchantText):SetTextHorizonCenter()
  ;
  (extractionEquipMain.enchantText):SetTextVerticalCenter()
  ;
  (extractionEquipMain.enchantText):SetShow(true)
  extractionEquipMain.empty = true
  self._uiEquipMain = extractionEquipMain
  -- DECOMPILER ERROR at PC58: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._uiEquipMain).slotNo = -1
end

-- DECOMPILER ERROR at PC12: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_ExtractionCrystal.createControl_uiSlotSocket = function(self)
  -- function num : 0_2
  local slotSocket = {}
  for ii = 1, (self._config).socketSlotCount do
    slotSocket = {icon = ((self._uiControl).staticSocket)[ii], iconBg = ((self._uiControl).staticSocketBackground)[ii], name = ((self._uiControl).staticSocketName)[ii], desc = ((self._uiControl).staticSocketDesc)[ii], extractionButton = ((self._uiControl).staticSocketExtractionButton)[ii], staticStuffSlotBG = ((self._uiControl).staticStuffSlotBG)[ii]}
    slotSocket.setShow = function(self, bShow)
    -- function num : 0_2_0
    (self.icon):SetShow(bShow)
    ;
    (self.iconBg):SetShow(bShow)
    ;
    (self.name):SetShow(bShow)
    ;
    (self.desc):SetShow(bShow)
    ;
    (self.extractionButton):SetShow(bShow)
    ;
    (self.staticStuffSlotBG):SetShow(bShow)
  end

    ;
    (slotSocket.name):SetText("")
    ;
    (slotSocket.desc):SetText("")
    ;
    ((self._onlySocketListBG)[ii]):SetShow(true)
    local indexSocket = ii - 1
    ;
    (SlotItem.new)(slotSocket, "Socket_" .. ii, ii, Panel_Window_Extraction_Crystal, self._slotConfig)
    slotSocket:createChild()
    ;
    (slotSocket.icon):addInputEvent("Mouse_RUp", "PaGlobal_ExtractionCrystal:removeCrystal( " .. indexSocket .. " )")
    ;
    (slotSocket.icon):addInputEvent("Mouse_On", "Panel_Tooltip_Item_Show_GeneralStatic(" .. ii .. ", \"Socket_Insert\", true)")
    ;
    (slotSocket.icon):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_Show_GeneralStatic(" .. ii .. ", \"Socket_Insert\", false)")
    ;
    (slotSocket.extractionButton):addInputEvent("Mouse_LUp", "PaGlobal_ExtractionCrystal:handleMLUpExtractionButton(" .. indexSocket .. ")")
    slotSocket.empty = true
    ;
    (self._uiSlotSocket):push_back(slotSocket)
  end
end

-- DECOMPILER ERROR at PC15: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_ExtractionCrystal.createControl_uiSlotExtractionMaterial = function(self)
  -- function num : 0_3
  local slot_ExtractionMaterial = {}
  for ii = 1, (self._config).socketSlotCount do
    slot_ExtractionMaterial = {staticStuffSlot = ((self._uiControl).staticStuffSlot)[ii]}
    ;
    (SlotItem.new)(slot_ExtractionMaterial, "CreateStuffSlot_" .. ii, ii, Panel_Window_Extraction_Crystal, self._slotConfig)
    slot_ExtractionMaterial:createChild()
    slot_ExtractionMaterial.empty = true
    ;
    (self._uiSlotExtractionMaterial):push_back(slot_ExtractionMaterial)
  end
end

Socket_Extraction_InvenFiler_EquipItem = function(slotNo, itemWrapper, WhereType)
  -- function num : 0_4
  if itemWrapper == nil then
    return true
  end
  local invenItemWrapper = getInventoryItemByType(WhereType, slotNo)
  local maxCount = (itemWrapper:get()):getUsableItemSocketCount()
  do
    local blankSlot_Count = maxCount
    for sock_idx = 1, maxCount do
      local itemStaticWrapper = itemWrapper:getPushedItem(sock_idx - 1)
      if itemStaticWrapper == nil then
        blankSlot_Count = blankSlot_Count - 1
      end
    end
    do return not ((itemWrapper:getStaticStatus()):get()):doHaveSocket() or blankSlot_Count == 0 end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

Socket_Extraction_InvenFiler_Stuff = function(slotNo, itemWrapper, whereType)
  -- function num : 0_5
  if itemWrapper == nil then
    return true
  end
  local isAble = (getSocketInformation()):isExtractionSource(whereType, slotNo)
  return not isAble
end

Panel_Socket_ExtractionCrystal_InteractortionFromInventory = function(slotNo, itemWrapper, count_s64, inventoryType)
  -- function num : 0_6
  local self = PaGlobal_ExtractionCrystal
  local socketInfo = getSocketInformation()
  local success = Socket_SetItemHaveSocket(inventoryType, slotNo) == 0
  if not success then
    self:clearData()
    Inventory_SetFunctor(Socket_Extraction_InvenFiler_EquipItem, Panel_Socket_ExtractionCrystal_InteractortionFromInventory, Socket_ExtractionCrystal_WindowClose, nil)
    return 
  end
  local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  ;
  (UI.ASSERT)(itemWrapper ~= nil, "Item Is Null?!?!?!")
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R8 in 'UnsetPending'

  if socketInfo._setEquipItem then
    (self._uiEquipMain).empty = false
    -- DECOMPILER ERROR at PC40: Confused about usage of register: R8 in 'UnsetPending'

    ;
    (self._uiEquipMain).slotNo = slotNo
    -- DECOMPILER ERROR at PC42: Confused about usage of register: R8 in 'UnsetPending'

    ;
    (self._uiEquipMain).invenType = inventoryType
    ;
    (self._uiEquipMain):setItem(itemWrapper)
    ;
    ((self._uiEquipMain).icon):SetShow(true)
    ;
    ((self._uiEquipMain).icon):addInputEvent("Mouse_On", "Panel_Tooltip_Item_Show_GeneralNormal(" .. slotNo .. ", \'SocketItem\', true)")
    ;
    ((self._uiEquipMain).icon):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_Show_GeneralNormal(" .. slotNo .. ", \'SocketItem\', false)")
    Panel_Tooltip_Item_SetPosition(slotNo, self._uiEquipMain, "SocketItem")
    self:updateSocket()
    Inventory_SetFunctor(Socket_Extraction_InvenFiler_Stuff, Click_ExtractionCrystal_Stuff, Socket_ExtractionCrystal_WindowClose, nil)
  else
    local rv = socketInfo:checkPushJewelToEmptySoket(slotNo)
    if rv == 0 then
      local index = socketInfo._indexPush
      local titleString = PAGetString(Defines.StringSheet_GAME, "LUA_SOCKET_INSERT_TITLE")
      local contentString = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_SOCKET_INSERT_MESSAGE", "socketNum", (string.format)("%d", index + 1), "itemName", (itemWrapper:getStaticStatus()):getName())
      local messageboxData = {title = titleString, content = contentString, functionYes = Socket_Push_Confirm, functionCancel = Socket_Deny, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageboxData)
    end
  end
  -- DECOMPILER ERROR: 5 unprocessed JMP targets
end

Click_ExtractionCrystal_Stuff = function(slotNo, itemWrapper, count_s64, inventoryType)
  -- function num : 0_7
  local self = PaGlobal_ExtractionCrystal
  local socketInfo = getSocketInformation()
  local invenItemWrapper = getInventoryItemByType((self._uiEquipMain).invenType, (self._uiEquipMain).slotNo)
  local maxCount = (invenItemWrapper:get()):getUsableItemSocketCount()
  local _IsMaterial = socketInfo:isExtractionSource(inventoryType, slotNo)
  local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  ;
  (UI.ASSERT)(itemWrapper ~= nil, "Item Is Null?!?!?!")
  do
    local slotExtractionMaterial_Pos = {
[1] = {X = 397, Y = 58}
, 
[2] = {X = 397, Y = 133}
, 
[3] = {X = 397, Y = 208}
}
    if _IsMaterial then
      self._stuffSlotNo = slotNo
      self._stuffInvenType = inventoryType
      for ii = 1, maxCount do
        if (self._useSlot)[ii] == true then
          ((self._uiSlotExtractionMaterial)[ii]):setItem(itemWrapper)
          ;
          (((self._uiControl).staticStuffSlot)[ii]):SetShow(false)
          ;
          (((self._uiSlotExtractionMaterial)[ii]).icon):SetPosX((slotExtractionMaterial_Pos[ii]).X)
          ;
          (((self._uiSlotExtractionMaterial)[ii]).icon):SetPosY((slotExtractionMaterial_Pos[ii]).Y)
          ;
          (((self._uiControl).staticSocketExtractionButton)[ii]):SetShow(true)
          ;
          (((self._uiControl).staticSocketExtractionButton)[ii]):SetIgnore(false)
          ;
          (((self._uiControl).staticSocketExtractionButton)[ii]):SetMonoTone(false)
        else
          (((self._uiControl).staticStuffSlot)[ii]):SetShow(false)
          ;
          (((self._uiControl).staticSocketExtractionButton)[ii]):SetShow(false)
          ;
          (((self._uiControl).staticSocketExtractionButton)[ii]):SetIgnore(true)
          ;
          (((self._uiControl).staticSocketExtractionButton)[ii]):SetMonoTone(true)
        end
      end
      self:updateSocket()
    end
    -- DECOMPILER ERROR: 4 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC26: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_ExtractionCrystal.removeCrystal = function(self, indexSocket)
  -- function num : 0_8
  if ((self._uiSlotSocket)[indexSocket + 1]).empty == true then
    return 
  end
  local titleString = PAGetString(Defines.StringSheet_GAME, "LUA_SOCKET_REMOVE_TITLE")
  local contentString = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SOCKET_REMOVE_MESSAGE", "socketNum", (string.format)("%d", indexSocket + 1))
  local remove_crystal_do = function()
    -- function num : 0_8_0 , upvalues : indexSocket
    Socket_PopJewelFromSocket(indexSocket, (CppEnums.ItemWhereType).eCount, CppEnums.TInventorySlotNoUndefined)
  end

  self._extractionType = 1
  local messageboxData = {title = titleString, content = contentString, functionYes = remove_crystal_do, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

-- DECOMPILER ERROR at PC31: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_ExtractionCrystal.updateSocket = function(self)
  -- function num : 0_9 , upvalues : UI_ANI_ADV, UI_color
  if (self._uiEquipMain).empty then
    (UI.ASSERT)(false, "Must not be EMPTY!!!!")
    return 
  end
  local invenItemWrapper = getInventoryItemByType((self._uiEquipMain).invenType, (self._uiEquipMain).slotNo)
  local maxCount = (invenItemWrapper:get()):getUsableItemSocketCount()
  if self._save_ExtractionMateria_Slot_status ~= 0 then
    for ii = 1, maxCount do
      ((self._uiSlotExtractionMaterial)[ii]):clearItem()
      ;
      (((self._uiControl).staticStuffSlot)[ii]):SetShow(false)
      ;
      (((self._uiControl).staticSocketExtractionButton)[ii]):SetShow(false)
      ;
      (((self._uiControl).staticSocketExtractionButton)[ii]):SetIgnore(true)
      ;
      (((self._uiControl).staticSocketExtractionButton)[ii]):SetMonoTone(true)
    end
  end
  do
    self._save_ExtractionMateria_Slot_status = 0
    local classType = (getSelfPlayer()):getClassType()
    for ii = 1, maxCount do
      local socketSlot = (self._uiSlotSocket)[ii]
      local itemStaticWrapper = invenItemWrapper:getPushedItem(ii - 1)
      socketSlot:setShow(true)
      ;
      ((self._onlySocketListBG)[ii]):EraseAllEffect()
      if itemStaticWrapper == nil then
        if ii == 1 then
          local socketBG_1 = ((self._onlySocketListBG)[1]):addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
          socketBG_1:SetStartColor(UI_color.C_FF626262)
          socketBG_1:SetEndColor(UI_color.C_FFFFFFFF)
          ;
          ((self._onlySocketListBG)[2]):SetColor(UI_color.C_FF626262)
          ;
          ((self._onlySocketListBG)[3]):SetColor(UI_color.C_FF626262)
        else
          do
            if ii == 2 then
              local socketBG_1 = ((self._onlySocketListBG)[1]):addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
              socketBG_1:SetStartColor(UI_color.C_FF626262)
              socketBG_1:SetEndColor(UI_color.C_FFFFFFFF)
              local socketBG_2 = ((self._onlySocketListBG)[2]):addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
              socketBG_2:SetStartColor(UI_color.C_FF626262)
              socketBG_2:SetEndColor(UI_color.C_FFFFFFFF)
              ;
              ((self._onlySocketListBG)[3]):SetColor(UI_color.C_FF626262)
            else
              do
                if ii == 3 then
                  local socketBG_1 = ((self._onlySocketListBG)[1]):addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
                  socketBG_1:SetStartColor(UI_color.C_FF626262)
                  socketBG_1:SetEndColor(UI_color.C_FFFFFFFF)
                  local socketBG_2 = ((self._onlySocketListBG)[2]):addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
                  socketBG_2:SetStartColor(UI_color.C_FF626262)
                  socketBG_2:SetEndColor(UI_color.C_FFFFFFFF)
                  local socketBG_3 = ((self._onlySocketListBG)[3]):addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
                  socketBG_3:SetStartColor(UI_color.C_FF626262)
                  socketBG_3:SetEndColor(UI_color.C_FFFFFFFF)
                end
                do
                  socketSlot:clearItem()
                  socketSlot.empty = true
                  ;
                  (socketSlot.name):SetText((self._text)[1])
                  ;
                  (socketSlot.desc):SetText((self._desc)[1])
                  ;
                  ((self._uiEquipMain).icon):AddEffect("UI_ItemJewel", false, 0, 0)
                  -- DECOMPILER ERROR at PC223: Confused about usage of register: R10 in 'UnsetPending'

                  ;
                  (self._useSlot)[ii] = false
                  if ii == 1 then
                    local socketBG_1 = ((self._onlySocketListBG)[1]):addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
                    socketBG_1:SetStartColor(UI_color.C_FF626262)
                    socketBG_1:SetEndColor(UI_color.C_FFFFFFFF)
                    ;
                    ((self._onlySocketListBG)[2]):SetColor(UI_color.C_FF626262)
                    ;
                    ((self._onlySocketListBG)[3]):SetColor(UI_color.C_FF626262)
                    audioPostEvent_SystemUi(5, 6)
                    ;
                    ((self._onlySocketListBG)[1]):AddEffect("UI_LimitMetastasis_TopLoop", true, -217, 40)
                  else
                    do
                      if ii == 2 then
                        local socketBG_1 = ((self._onlySocketListBG)[1]):addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
                        socketBG_1:SetStartColor(UI_color.C_FF626262)
                        socketBG_1:SetEndColor(UI_color.C_FFFFFFFF)
                        local socketBG_2 = ((self._onlySocketListBG)[2]):addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
                        socketBG_2:SetStartColor(UI_color.C_FF626262)
                        socketBG_2:SetEndColor(UI_color.C_FFFFFFFF)
                        ;
                        ((self._onlySocketListBG)[3]):SetColor(UI_color.C_FF626262)
                        audioPostEvent_SystemUi(5, 6)
                        ;
                        ((self._onlySocketListBG)[2]):AddEffect("UI_LimitMetastasis_MidLoop", true, -217, 0)
                      else
                        do
                          if ii == 3 then
                            local socketBG_1 = ((self._onlySocketListBG)[1]):addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
                            socketBG_1:SetStartColor(UI_color.C_FF626262)
                            socketBG_1:SetEndColor(UI_color.C_FFFFFFFF)
                            local socketBG_2 = ((self._onlySocketListBG)[2]):addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
                            socketBG_2:SetStartColor(UI_color.C_FF626262)
                            socketBG_2:SetEndColor(UI_color.C_FFFFFFFF)
                            local socketBG_3 = ((self._onlySocketListBG)[3]):addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
                            socketBG_3:SetStartColor(UI_color.C_FF626262)
                            socketBG_3:SetEndColor(UI_color.C_FFFFFFFF)
                            audioPostEvent_SystemUi(5, 6)
                            ;
                            ((self._onlySocketListBG)[3]):AddEffect("UI_LimitMetastasis_BotLoop", true, -212, -30)
                          end
                          do
                            socketSlot:setItemByStaticStatus(itemStaticWrapper, 0)
                            socketSlot.empty = false
                            local text = itemStaticWrapper:getName()
                            local desc = ""
                            ;
                            (socketSlot.name):SetText(text)
                            do
                              local jewelSkillStaticWrapper = itemStaticWrapper:getSkillByIdx(classType)
                              if jewelSkillStaticWrapper ~= nil then
                                for buffIdx = 0, jewelSkillStaticWrapper:getBuffCount() - 1 do
                                  local descCurrent = jewelSkillStaticWrapper:getBuffDescription(buffIdx)
                                  if descCurrent ~= nil then
                                    do
                                      if descCurrent == "" then
                                        break
                                      end
                                      if desc == "" then
                                        desc = descCurrent
                                      else
                                        desc = desc .. "\n" .. descCurrent
                                      end
                                      -- DECOMPILER ERROR at PC422: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                      -- DECOMPILER ERROR at PC422: LeaveBlock: unexpected jumping out IF_STMT

                                    end
                                  end
                                end
                                -- DECOMPILER ERROR at PC424: Confused about usage of register: R13 in 'UnsetPending'

                                ;
                                (self._useSlot)[ii] = true
                              end
                              ;
                              (socketSlot.desc):SetText(desc)
                              -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                              -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                              -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                              -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out DO_STMT

                              -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                              -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_STMT

                              -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_THEN_STMT

                              -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_STMT

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
    for ii = maxCount + 1, (self._config).socketSlotCount do
      local socketSlot = (self._uiSlotSocket)[ii]
      socketSlot:setShow(false)
    end
  end
end

-- DECOMPILER ERROR at PC34: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_ExtractionCrystal.result = function(self)
  -- function num : 0_10
  PaGlobal_ExtractionCrystal:resultShow()
  PaGlobal_ExtractionCrystal:updateSocket()
end

-- DECOMPILER ERROR at PC39: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_ExtractionCrystal.clearData = function(self, uiOnly)
  -- function num : 0_11 , upvalues : UI_ANI_ADV, UI_color
  (self._uiEquipMain):clearItem()
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._uiEquipMain).empty = true
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._uiEquipMain).slotNo = -1
  ;
  ((self._uiEquipMain).icon):SetShow(false)
  for ii = 1, (self._config).socketSlotCount do
    local socketBG_1 = ((self._onlySocketListBG)[ii]):addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
    socketBG_1:SetStartColor(UI_color.C_FFFFFFFF)
    socketBG_1:SetEndColor(UI_color.C_FF626262)
    ;
    ((self._onlySocketListBG)[ii]):EraseAllEffect()
    ;
    ((self._uiSlotSocket)[ii]):setShow(false)
    -- DECOMPILER ERROR at PC44: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self._uiSlotSocket)[ii]).empty = true
    ;
    ((self._uiSlotExtractionMaterial)[ii]):clearItem()
    ;
    (((self._uiControl).staticStuffSlot)[ii]):SetShow(false)
    -- DECOMPILER ERROR at PC58: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (((self._uiControl).staticStuffSlot)[ii]).empty = true
    ;
    (((self._uiControl).staticSocketExtractionButton)[ii]):SetShow(false)
    ;
    (((self._uiControl).staticSocketExtractionButton)[ii]):SetIgnore(true)
    ;
    (((self._uiControl).staticSocketExtractionButton)[ii]):SetMonoTone(true)
  end
  if not uiOnly then
    (getSocketInformation()):clearData()
  end
  self._stuffInvenType = -1
  self._stuffSlotNo = -1
  Panel_Tooltip_Item_hideTooltip()
end

-- DECOMPILER ERROR at PC42: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_ExtractionCrystal.handleMRUpEquipSocket = function(self)
  -- function num : 0_12
  (getSocketInformation()):popEquip()
  self:clearData()
  Inventory_SetFunctor(Socket_Extraction_InvenFiler_EquipItem, Panel_Socket_ExtractionCrystal_InteractortionFromInventory, Socket_ExtractionCrystal_WindowClose, nil)
end

-- DECOMPILER ERROR at PC45: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_ExtractionCrystal.handleMLUpExtractionButton = function(self, indexSocket)
  -- function num : 0_13
  if ((self._uiSlotSocket)[indexSocket + 1]).empty == true then
    return 
  end
  self._indexSocket = indexSocket
  self._extractionType = 0
  local titleString = PAGetString(Defines.StringSheet_GAME, "LUA_EXTRACTION_CRYSTAL_EXTRACT")
  local contentString = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SOCKET_EXTRACTION_MESSAGE", "socketNum", (string.format)("%d", indexSocket + 1))
  local ExtractionCrystal_Pop_Confirm = function()
    -- function num : 0_13_0 , upvalues : self
    -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

    self._save_ExtractionMateria_Slot_status = 1
    local self = PaGlobal_ExtractionCrystal
    Socket_PopJewelFromSocket(PaGlobal_ExtractionCrystal._indexSocket, self._stuffInvenType, self._stuffSlotNo)
  end

  local messageboxData = {title = titleString, content = contentString, functionYes = ExtractionCrystal_Pop_Confirm, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end


