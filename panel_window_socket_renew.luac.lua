-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\enchant\console\panel_window_socket_renew.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_TT = CppEnums.PAUI_TEXTURE_TYPE
local IM = CppEnums.EProcessorInputMode
local UI_color = Defines.Color
local _panel = Panel_Window_Socket_Renew
_panel:SetShow(false, false)
_panel:setMaskingChild(true)
_panel:setGlassBackground(true)
_panel:SetDragEnable(true)
_panel:SetDragAll(true)
_panel:RegisterShowEventFunc(true, "SocketShowAni()")
_panel:RegisterShowEventFunc(false, "SocketHideAni()")
local socketInfo = {
_ui = {stc_title = (UI.getChildControl)(_panel, "Static_Title"), stc_mainBG = (UI.getChildControl)(_panel, "Static_MainBG"), txt_descSub = nil, stc_innerBG = (UI.getChildControl)(_panel, "Static_InnerBG"), staticEnchantItem = nil, 
staticSocket = {}
, 
staticSocketName = {}
, 
staticSocketDesc = {}
, 
staticSocketBackground = {}
, stc_bottom = (UI.getChildControl)(_panel, "Static_Bottom"), stc_focusBox = nil, txt_keyGuideDestroy = nil}
, 
slotConfig = {createIcon = false, createBorder = true, createCount = true, createEnchant = true, createCash = true}
, 
config = {socketSlotCount = 3, curSlotCount = 3}
, 
text = {[1] = PAGetString(Defines.StringSheet_GAME, "LUA_SOCKET_EMPTYSLOT")}
, 
desc = {[1] = PAGetString(Defines.StringSheet_GAME, "LUA_SOCKET_EMPTYSLOT_DESC")}
, slotMain = nil, slotSocket = (Array.new)(), _indexSocket = nil, _jewelInvenSlotNo = nil, _currentSlot = 0}
local isItemLock = false
local _onlySocketListBG = {}
FromClient_luaLoadComplete_SocketInfo_Init = function()
  -- function num : 0_0 , upvalues : socketInfo
  socketInfo:initialize()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_SocketInfo_Init")
socketInfo.initialize = function(self)
  -- function num : 0_1 , upvalues : _onlySocketListBG
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).txt_descSub = (UI.getChildControl)((self._ui).stc_mainBG, "StaticText_DescSub")
  ;
  ((self._ui).txt_descSub):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui).txt_descSub):SetText(((self._ui).txt_descSub):GetText())
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticEnchantItem = (UI.getChildControl)((self._ui).stc_innerBG, "Static_SlotBase")
  -- DECOMPILER ERROR at PC52: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticSocket = {(UI.getChildControl)((self._ui).stc_innerBG, "Static_GemSlot1"), (UI.getChildControl)((self._ui).stc_innerBG, "Static_GemSlot2"), (UI.getChildControl)((self._ui).stc_innerBG, "Static_GemSlot3")}
  -- DECOMPILER ERROR at PC74: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticSocketName = {(UI.getChildControl)((self._ui).stc_innerBG, "StaticText_GemTitle1"), (UI.getChildControl)((self._ui).stc_innerBG, "StaticText_GemTitle2"), (UI.getChildControl)((self._ui).stc_innerBG, "StaticText_GemTitle3")}
  -- DECOMPILER ERROR at PC96: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticSocketDesc = {(UI.getChildControl)((self._ui).stc_innerBG, "StaticText_GemInfo1"), (UI.getChildControl)((self._ui).stc_innerBG, "StaticText_GemInfo2"), (UI.getChildControl)((self._ui).stc_innerBG, "StaticText_GemInfo3")}
  -- DECOMPILER ERROR at PC118: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticSocketBackground = {(UI.getChildControl)((self._ui).stc_innerBG, "Static_Socket_1_Background"), (UI.getChildControl)((self._ui).stc_innerBG, "Static_Socket_2_Background"), (UI.getChildControl)((self._ui).stc_innerBG, "Static_Socket_3_Background")}
  _onlySocketListBG = {[1] = (UI.getChildControl)((self._ui).stc_innerBG, "Static_SocketFrame1"), [2] = (UI.getChildControl)((self._ui).stc_innerBG, "Static_SocketFrame2"), [3] = (UI.getChildControl)((self._ui).stc_innerBG, "Static_SocketFrame3")}
  -- DECOMPILER ERROR at PC149: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_focusBox = (UI.getChildControl)((self._ui).stc_innerBG, "Static_FocusBox")
  -- DECOMPILER ERROR at PC157: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_keyGuideDestroy = (UI.getChildControl)((self._ui).stc_innerBG, "StaticText_Trash_ConsoleUI")
  -- DECOMPILER ERROR at PC165: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_keyGuideDiscard = (UI.getChildControl)((self._ui).stc_bottom, "StaticText_KeyGuideCancel_ConsoleUI")
  self:createControl()
  self:registEventHandler()
  self:registMessageHandler()
end

socketInfo.registEventHandler = function(self)
  -- function num : 0_2 , upvalues : _panel
  _panel:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_Y, "Socket_SlotRClick(" .. self._currentSlot .. ")")
end

socketInfo.registMessageHandler = function(self)
  -- function num : 0_3
  registerEvent("EventSocketResult", "PaGlobalFunc_SocketInfo_Result")
end

socketInfo.createControl = function(self)
  -- function num : 0_4 , upvalues : _panel, _onlySocketListBG
  local slotMain = {}
  slotMain.icon = (self._ui).staticEnchantItem
  ;
  (SlotItem.new)(slotMain, "Equip_Socket", 0, _panel, self.slotConfig)
  slotMain:createChild()
  ;
  (slotMain.icon):addInputEvent("Mouse_RUp", "Socket_EquipSlotRClick()")
  ;
  (slotMain.icon):addInputEvent("Mouse_On", "Panel_Tooltip_Item_Show_GeneralNormal(0, \"Socket\", true)")
  ;
  (slotMain.icon):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_Show_GeneralNormal(0, \"Socket\", false)")
  Panel_Tooltip_Item_SetPosition(0, slotMain, "Socket")
  slotMain.empty = true
  self.slotMain = slotMain
  -- DECOMPILER ERROR at PC37: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self.slotMain).whereType = nil
  -- DECOMPILER ERROR at PC39: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self.slotMain).slotNo = nil
  for ii = 1, (self.config).socketSlotCount do
    slotSocket = {icon = ((self._ui).staticSocket)[ii], iconBg = ((self._ui).staticSocketBackground)[ii], name = ((self._ui).staticSocketName)[ii], desc = ((self._ui).staticSocketDesc)[ii]}
    ;
    (slotSocket.desc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
    -- DECOMPILER ERROR at PC72: Confused about usage of register: R6 in 'UnsetPending'

    slotSocket.setShow = function(self, bShow)
    -- function num : 0_4_0
    (self.icon):SetShow(bShow)
    ;
    (self.iconBg):SetShow(bShow)
    ;
    (self.name):SetShow(bShow)
    ;
    (self.desc):SetShow(bShow)
  end

    ;
    (_onlySocketListBG[ii]):SetShow(true)
    local indexSocket = ii - 1
    ;
    (SlotItem.new)(slotSocket, "Socket_" .. ii, ii, _panel, self.slotConfig)
    slotSocket:createChild()
    ;
    (slotSocket.icon):addInputEvent("Mouse_RUp", "Socket_SlotRClick(" .. indexSocket .. ")")
    ;
    (slotSocket.icon):addInputEvent("Mouse_LUp", "Socket_SlotLClick(" .. indexSocket .. ")")
    ;
    (slotSocket.icon):addInputEvent("Mouse_PressMove", "Socket_SlotDrag(" .. indexSocket .. ")")
    ;
    (slotSocket.icon):addInputEvent("Mouse_On", "Input_SocketInfo_Select(" .. ii .. ", \"Socket_Insert\", true)")
    ;
    (slotSocket.icon):addInputEvent("Mouse_Out", "Input_SocketInfo_Select(" .. ii .. ", \"Socket_Insert\", false)")
    Panel_Tooltip_Item_SetPosition(ii, slotSocket, "Socket_Insert")
    -- DECOMPILER ERROR at PC143: Confused about usage of register: R7 in 'UnsetPending'

    slotSocket.empty = true
    ;
    (self.slotSocket):push_back(slotSocket)
  end
end

PaGlobalFunc_SocketInfo_Close = function()
  -- function num : 0_5 , upvalues : _panel
  Inventory_SetFunctor(nil, nil, nil, nil)
  _panel:SetShow(false, false)
  InventoryWindow_Close()
  ToClient_BlackspiritEnchantClose()
end

PaGlobalFunc_SocketInfo_GetShow = function()
  -- function num : 0_6 , upvalues : _panel
  return _panel:GetShow()
end

PaGlobalFunc_SocketInfo_Open = function()
  -- function num : 0_7 , upvalues : socketInfo, _panel
  local self = socketInfo
  _panel:SetShow(true, true)
  Input_SocketInfo_Select(1)
  ;
  ((self._ui).txt_keyGuideDiscard):SetText("Exit")
  Inventory_SetFunctor(Socket_InvenFiler_EquipItem, Panel_Socket_InteractortionFromInventory, nil, nil)
  self:clearData()
  InventoryWindow_Show()
end

socketInfo.clearData = function(self, uiOnly)
  -- function num : 0_8 , upvalues : _onlySocketListBG, UI_ANI_ADV, UI_color
  (self.slotMain):clearItem()
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self.slotMain).empty = true
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self.slotMain).whereType = nil
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self.slotMain).slotNo = nil
  ;
  ((self.slotMain).icon):SetShow(false)
  for ii = 1, (self.config).socketSlotCount do
    local socketBG_1 = (_onlySocketListBG[ii]):addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
    socketBG_1:SetStartColor(UI_color.C_FFFFFFFF)
    socketBG_1:SetEndColor(UI_color.C_FF626262)
    ;
    (_onlySocketListBG[ii]):EraseAllEffect()
    ;
    ((self.slotSocket)[ii]):setShow(false)
    -- DECOMPILER ERROR at PC46: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self.slotSocket)[ii]).empty = true
  end
  if not uiOnly then
    (getSocketInformation()):clearData()
  end
  Panel_Tooltip_Item_hideTooltip()
end

socketInfo.updateSocket = function(self)
  -- function num : 0_9 , upvalues : _onlySocketListBG, UI_ANI_ADV, UI_color
  if (self.slotMain).empty then
    (UI.ASSERT)(false, "Must not be EMPTY!!!!")
    return 
  end
  local invenItemWrapper = getInventoryItemByType((self.slotMain).whereType, (self.slotMain).slotNo)
  local maxCount = (invenItemWrapper:get()):getUsableItemSocketCount()
  local classType = (getSelfPlayer()):getClassType()
  for ii = 1, maxCount do
    local socketSlot = (self.slotSocket)[ii]
    local itemStaticWrapper = invenItemWrapper:getPushedItem(ii - 1)
    socketSlot:setShow(true)
    ;
    (_onlySocketListBG[ii]):EraseAllEffect()
    if itemStaticWrapper == nil then
      if ii == 1 then
        local socketBG_1 = (_onlySocketListBG[1]):addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
        socketBG_1:SetStartColor(UI_color.C_FF626262)
        socketBG_1:SetEndColor(UI_color.C_FFFFFFFF)
        ;
        (_onlySocketListBG[2]):SetColor(UI_color.C_FF626262)
        ;
        (_onlySocketListBG[3]):SetColor(UI_color.C_FF626262)
      else
        do
          if ii == 2 then
            local socketBG_1 = (_onlySocketListBG[1]):addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
            socketBG_1:SetStartColor(UI_color.C_FF626262)
            socketBG_1:SetEndColor(UI_color.C_FFFFFFFF)
            local socketBG_2 = (_onlySocketListBG[2]):addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
            socketBG_2:SetStartColor(UI_color.C_FF626262)
            socketBG_2:SetEndColor(UI_color.C_FFFFFFFF)
            ;
            (_onlySocketListBG[3]):SetColor(UI_color.C_FF626262)
          else
            do
              if ii == 3 then
                local socketBG_1 = (_onlySocketListBG[1]):addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
                socketBG_1:SetStartColor(UI_color.C_FF626262)
                socketBG_1:SetEndColor(UI_color.C_FFFFFFFF)
                local socketBG_2 = (_onlySocketListBG[2]):addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
                socketBG_2:SetStartColor(UI_color.C_FF626262)
                socketBG_2:SetEndColor(UI_color.C_FFFFFFFF)
                local socketBG_3 = (_onlySocketListBG[3]):addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
                socketBG_3:SetStartColor(UI_color.C_FF626262)
                socketBG_3:SetEndColor(UI_color.C_FFFFFFFF)
              end
              do
                socketSlot:clearItem()
                socketSlot.empty = true
                ;
                (socketSlot.name):SetText((self.text)[1])
                ;
                (socketSlot.desc):SetText((self.desc)[1])
                ;
                ((self.slotMain).icon):AddEffect("UI_ItemJewel", false, 0, 0)
                if ii == 1 then
                  local socketBG_1 = (_onlySocketListBG[1]):addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
                  socketBG_1:SetStartColor(UI_color.C_FF626262)
                  socketBG_1:SetEndColor(UI_color.C_FFFFFFFF)
                  ;
                  (_onlySocketListBG[2]):SetColor(UI_color.C_FF626262)
                  ;
                  (_onlySocketListBG[3]):SetColor(UI_color.C_FF626262)
                  audioPostEvent_SystemUi(5, 6)
                  ;
                  (_onlySocketListBG[1]):AddEffect("UI_LimitMetastasis_TopLoop", true, -222, 40)
                else
                  do
                    if ii == 2 then
                      local socketBG_1 = (_onlySocketListBG[1]):addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
                      socketBG_1:SetStartColor(UI_color.C_FF626262)
                      socketBG_1:SetEndColor(UI_color.C_FFFFFFFF)
                      local socketBG_2 = (_onlySocketListBG[2]):addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
                      socketBG_2:SetStartColor(UI_color.C_FF626262)
                      socketBG_2:SetEndColor(UI_color.C_FFFFFFFF)
                      ;
                      (_onlySocketListBG[3]):SetColor(UI_color.C_FF626262)
                      audioPostEvent_SystemUi(5, 6)
                      ;
                      (_onlySocketListBG[2]):AddEffect("UI_LimitMetastasis_MidLoop", true, -217, 0)
                    else
                      do
                        if ii == 3 then
                          local socketBG_1 = (_onlySocketListBG[1]):addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
                          socketBG_1:SetStartColor(UI_color.C_FF626262)
                          socketBG_1:SetEndColor(UI_color.C_FFFFFFFF)
                          local socketBG_2 = (_onlySocketListBG[2]):addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
                          socketBG_2:SetStartColor(UI_color.C_FF626262)
                          socketBG_2:SetEndColor(UI_color.C_FFFFFFFF)
                          local socketBG_3 = (_onlySocketListBG[3]):addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
                          socketBG_3:SetStartColor(UI_color.C_FF626262)
                          socketBG_3:SetEndColor(UI_color.C_FFFFFFFF)
                          audioPostEvent_SystemUi(5, 6)
                          ;
                          (_onlySocketListBG[3]):AddEffect("UI_LimitMetastasis_BotLoop", true, -212, -30)
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
                                    -- DECOMPILER ERROR at PC383: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                    -- DECOMPILER ERROR at PC383: LeaveBlock: unexpected jumping out IF_STMT

                                  end
                                end
                              end
                            end
                            ;
                            (socketSlot.desc):SetText(desc)
                            -- DECOMPILER ERROR at PC388: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC388: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC388: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                            -- DECOMPILER ERROR at PC388: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC388: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC388: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                            -- DECOMPILER ERROR at PC388: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC388: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC388: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC388: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                            -- DECOMPILER ERROR at PC388: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC388: LeaveBlock: unexpected jumping out DO_STMT

                            -- DECOMPILER ERROR at PC388: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                            -- DECOMPILER ERROR at PC388: LeaveBlock: unexpected jumping out IF_STMT

                            -- DECOMPILER ERROR at PC388: LeaveBlock: unexpected jumping out IF_THEN_STMT

                            -- DECOMPILER ERROR at PC388: LeaveBlock: unexpected jumping out IF_STMT

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
  for ii = maxCount + 1, (self.config).socketSlotCount do
    local socketSlot = (self.slotSocket)[ii]
    socketSlot:setShow(false)
  end
end

Input_SocketInfo_Select = function(index, socketInsert, isShowTooltip)
  -- function num : 0_10 , upvalues : socketInfo
  local self = socketInfo
  self._currentSlot = index
  ;
  ((self._ui).stc_focusBox):SetPosY((((self._ui).staticSocketBackground)[index]):GetPosY() - 12)
  ;
  ((self._ui).txt_keyGuideDestroy):SetPosY(120 + (index - 1) * 75)
  Panel_Tooltip_Item_Show_GeneralStatic(index, socketInsert, isShowTooltip)
end

local Socket_Pop_Confirm = function()
  -- function num : 0_11 , upvalues : socketInfo
  Socket_PopJewelFromSocket(socketInfo._indexSocket, (CppEnums.ItemWhereType).eCount, CppEnums.TInventorySlotNoUndefined)
end

local Socket_Push_Confirm = function()
  -- function num : 0_12 , upvalues : socketInfo, isItemLock
  local self = socketInfo
  local socketInfo = getSocketInformation()
  local index = socketInfo._indexPush
  local socketSlot = (self.slotSocket)[index + 1]
  if isItemLock == false then
    (socketSlot.iconBg):AddEffect("UI_ItemJewel02", false, 0, 0)
    ;
    (socketSlot.desc):AddEffect("UI_ItemJewel03", false, 0, 0)
    ;
    (socketSlot.iconBg):AddEffect("fUI_ItemJewel01", false, -1, -1)
    ;
    ((self.slotMain).icon):AddEffect("fUI_ItemJewel01", false, -1, -1)
    ;
    ((self.slotMain).icon):AddEffect("UI_LimitMetastasis_Box01", false, -1, -1)
    ;
    (socketSlot.icon):AddEffect("UI_LimitMetastasis_Box02", false, -1, -1)
  end
  Socket_ConfirmPushJewel(true)
  if isItemLock == false then
    if index == 0 then
      audioPostEvent_SystemUi(0, 7)
      ;
      ((self.slotMain).icon):AddEffect("UI_LimitMetastasis_Top01", false, -1, -1)
    else
      if index == 1 then
        audioPostEvent_SystemUi(0, 7)
        ;
        ((self.slotMain).icon):AddEffect("UI_LimitMetastasis_Mid01", false, -1, -1)
      else
        if index == 2 then
          audioPostEvent_SystemUi(0, 7)
          ;
          ((self.slotMain).icon):AddEffect("UI_LimitMetastasis_Bot01", false, -1, -1)
        end
      end
    end
  end
end

local Socket_OverWrite_Confirm = function()
  -- function num : 0_13 , upvalues : socketInfo
  local self = socketInfo
  local rv = Socket_OverWriteToSocket((self.slotMain).whereType, (self.slotMain).slot, self._indexSocket)
  if rv ~= 0 then
    self:clearData()
    Inventory_SetFunctor(Socket_InvenFiler_EquipItem, Panel_Socket_InteractortionFromInventory, PaGlobalFunc_SocketInfo_Close, nil)
  end
end

local Socket_Deny = function()
  -- function num : 0_14
  Socket_ConfirmPushJewel(false)
end

Socket_InvenFiler_EquipItem = function(slotNo, itemWrapper)
  -- function num : 0_15
  if itemWrapper == nil then
    return true
  end
  local itemSSW = itemWrapper:getStaticStatus()
  if (itemSSW:get()):doHaveSocket() == true then
    if itemSSW:getEquipType() == 22 and (itemWrapper:get()):isVested() == false then
      return true
    else
      return false
    end
  end
  return true
end

Socket_InvenFiler_Jewel = function(slotNo, itemWrapper, whereType)
  -- function num : 0_16
  if itemWrapper == nil then
    return true
  end
  if (CppEnums.ItemWhereType).eCashInventory == whereType then
    return true
  end
  if ToClient_Inventory_CheckItemLock(slotNo, whereType) then
    return true
  end
  local isAble = (getSocketInformation()):isFilterJewelEquipType(whereType, slotNo)
  return not isAble
end

SocketItem_FromItemWrapper = function()
  -- function num : 0_17 , upvalues : socketInfo
  local self = socketInfo
  if (self.slotMain).slotNo == nil then
    return nil
  end
  return getInventoryItemByType((self.slotMain).whereType, (self.slotMain).slotNo)
end

Socket_SlotRClick = function(indexSocket)
  -- function num : 0_18 , upvalues : socketInfo, Socket_Pop_Confirm
  local self = socketInfo
  if ((self.slotSocket)[indexSocket + 1]).empty == true then
    return 
  end
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R2 in 'UnsetPending'

  socketInfo._indexSocket = indexSocket
  local titleString = PAGetString(Defines.StringSheet_GAME, "LUA_SOCKET_REMOVE_TITLE")
  local contentString = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SOCKET_REMOVE_MESSAGE", "socketNum", (string.format)("%d", indexSocket + 1))
  local messageboxData = {title = titleString, content = contentString, functionYes = Socket_Pop_Confirm, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

PaGlobalFunc_SocketInfo_OnPadB = function()
  -- function num : 0_19 , upvalues : socketInfo
  local self = socketInfo
  if (self.slotMain).slotNo ~= nil then
    Socket_EquipSlotRClick()
    return false
  else
    PaGlobalFunc_SocketInfo_Close()
    return true
  end
end

Socket_EquipSlotRClick = function()
  -- function num : 0_20 , upvalues : socketInfo
  local self = socketInfo
  ;
  (getSocketInformation()):popEquip()
  socketInfo:clearData()
  ;
  ((self._ui).txt_keyGuideDiscard):SetText("Exit")
  Inventory_SetFunctor(Socket_InvenFiler_EquipItem, Panel_Socket_InteractortionFromInventory, PaGlobalFunc_SocketInfo_Close, nil)
end

Socket_SlotLClick = function(indexSocket)
  -- function num : 0_21 , upvalues : socketInfo, Socket_Push_Confirm, Socket_Deny
  if DragManager.dragStartPanel ~= Panel_Window_Inventory then
    return 
  end
  local self = socketInfo
  local whereType = DragManager.dragWhereTypeInfo
  local slotNo = DragManager.dragSlotInfo
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if itemWrapper == nil then
    (UI.ASSERT)(false, "Item Is Null?!?!?!")
    return 
  end
  local index = indexSocket + 1
  if Socket_SetItemHaveSocket(whereType, slotNo) ~= 0 then
    local success = ((self.slotSocket)[index]).empty ~= true
    if not success then
      return 
    end
    local titleString = PAGetString(Defines.StringSheet_GAME, "LUA_SOCKET_INSERT_TITLE")
    local contentString = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_SOCKET_INSERT_MESSAGE", "socketNum", (string.format)("%d", index), "itemName", (itemWrapper:getStaticStatus()):getName())
    do
      local messageboxData = {title = titleString, content = contentString, functionYes = Socket_Push_Confirm, functionCancel = Socket_Deny, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageboxData)
      do return  end
      local titleString = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE")
      local contentString = PAGetString(Defines.StringSheet_GAME, "LUA_SOCKET_INSERT_ALREADYCRYSTAL")
      do
        do
          local messageboxData = {title = titleString, content = contentString, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
          ;
          (MessageBox.showMessageBox)(messageboxData)
          do return  end
          ;
          (DragManager.clearInfo)()
          -- DECOMPILER ERROR: 4 unprocessed JMP targets
        end
      end
    end
  end
end

Panel_Socket_InteractortionFromInventory = function(slotNo, itemWrapper, count_s64, inventoryType)
  -- function num : 0_22 , upvalues : socketInfo, isItemLock, Socket_Push_Confirm, Socket_Deny
  local self = socketInfo
  local socketInfo = getSocketInformation()
  local success = Socket_SetItemHaveSocket(inventoryType, slotNo) == 0
  if not success then
    self:clearData()
    ;
    ((self._ui).txt_keyGuideDiscard):SetText("Exit")
    Inventory_SetFunctor(Socket_InvenFiler_EquipItem, Panel_Socket_InteractortionFromInventory, PaGlobalFunc_SocketInfo_Close, nil)
    return 
  end
  local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  ;
  (UI.ASSERT)(itemWrapper ~= nil, "Item Is Null?!?!?!")
  -- DECOMPILER ERROR at PC43: Confused about usage of register: R8 in 'UnsetPending'

  if socketInfo._setEquipItem then
    (self.slotMain).empty = false
    -- DECOMPILER ERROR at PC45: Confused about usage of register: R8 in 'UnsetPending'

    ;
    (self.slotMain).whereType = inventoryType
    -- DECOMPILER ERROR at PC47: Confused about usage of register: R8 in 'UnsetPending'

    ;
    (self.slotMain).slotNo = slotNo
    ;
    (self.slotMain):setItem(itemWrapper)
    ;
    ((self.slotMain).icon):SetShow(true)
    ;
    ((self.slotMain).icon):addInputEvent("Mouse_On", "Panel_Tooltip_Item_Show_GeneralNormal(" .. slotNo .. ", \'SocketItem\', true)")
    ;
    ((self.slotMain).icon):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_Show_GeneralNormal(" .. slotNo .. ", \'SocketItem\', false)")
    Panel_Tooltip_Item_SetPosition(slotNo, self.slotMain, "SocketItem")
    self:updateSocket()
    ;
    ((self._ui).txt_keyGuideDiscard):SetText("Discard")
    Inventory_SetFunctor(Socket_InvenFiler_Jewel, Panel_Socket_InteractortionFromInventory, PaGlobalFunc_SocketInfo_Close, nil)
  else
    local rv = socketInfo:checkPushJewelToEmptySoket(inventoryType, slotNo)
    isItemLock = ToClient_Inventory_CheckItemLock((self.slotMain).slotNo)
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

PaGlobalFunc_SocketInfo_Result = function()
  -- function num : 0_23 , upvalues : _panel, socketInfo
  if _panel:GetShow() then
    socketInfo:updateSocket()
  else
    PaGlobal_ExtractionCrystal:result()
  end
end

local Socket_fadeInSCR_Down = function(panel)
  -- function num : 0_24 , upvalues : UI_ANI_ADV, UI_TT, UI_color, _onlySocketListBG
  local FadeMaskAni = panel:addTextureUVAnimation(0, 0.28, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  FadeMaskAni:SetTextureType(UI_TT.PAUI_TEXTURE_TYPE_MASK)
  FadeMaskAni:SetStartUV(0, 0.6, 0)
  FadeMaskAni:SetEndUV(0, 0.1, 0)
  FadeMaskAni:SetStartUV(1, 0.6, 1)
  FadeMaskAni:SetEndUV(1, 0.1, 1)
  FadeMaskAni:SetStartUV(0, 1, 2)
  FadeMaskAni:SetEndUV(0, 0.4, 2)
  FadeMaskAni:SetStartUV(1, 1, 3)
  FadeMaskAni:SetEndUV(0, 0.4, 3)
  panel:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_IN)
  local aniInfo3 = panel:addColorAnimation(0, 0.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo3:SetEndColor(UI_color.C_FFFFFFFF)
  for key,value in pairs(_onlySocketListBG) do
    local socketBG_1 = value:addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
    socketBG_1:SetStartColor(UI_color.C_00626262)
    socketBG_1:SetEndColor(UI_color.C_FF626262)
  end
  local aniInfo8 = panel:addColorAnimation(0.12, 0.23, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo8:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo8:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo8:SetStartIntensity(3)
  aniInfo8:SetEndIntensity(1)
end

SocketShowAni = function()
  -- function num : 0_25 , upvalues : _panel, UI_ANI_ADV
  local aniInfo1 = _panel:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.13)
  aniInfo1.AxisX = _panel:GetSizeX() / 2
  aniInfo1.AxisY = _panel:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = _panel:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.13)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = _panel:GetSizeX() / 2
  aniInfo2.AxisY = _panel:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
  audioPostEvent_SystemUi(1, 0)
end

SocketHideAni = function()
  -- function num : 0_26 , upvalues : _panel
  local socketHide = (UIAni.AlphaAnimation)(0, _panel, 0, 0.2)
  socketHide:SetHideAtEnd(true)
  audioPostEvent_SystemUi(1, 1)
end

Socket_ShowToggle = function()
  -- function num : 0_27 , upvalues : _panel
  if _panel:GetShow() then
    PaGlobalFunc_SocketInfo_Close()
  else
    PaGlobalFunc_SocketInfo_Open()
    InventoryWindow_Show()
  end
end

PaGlobalFunc_SocketInfo_OnScreenResize = function()
  -- function num : 0_28 , upvalues : _panel
  local sizeX = getScreenSizeX()
  local sizeY = getScreenSizeY()
  _panel:SetPosX(sizeX / 2 - _panel:GetSizeX() / 2)
  _panel:SetPosY(sizeY / 3.5)
  _panel:ComputePos()
end

Socket_GetSlotNo = function()
  -- function num : 0_29 , upvalues : socketInfo
  return (socketInfo.slotMain).slotNo
end


