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
  _ui = {
    stc_title = UI.getChildControl(_panel, "Static_Title"),
    stc_mainBG = UI.getChildControl(_panel, "Static_MainBG"),
    txt_descSub = nil,
    stc_innerBG = UI.getChildControl(_panel, "Static_InnerBG"),
    staticEnchantItem = nil,
    staticSocket = {},
    staticSocketName = {},
    staticSocketDesc = {},
    staticSocketBackground = {},
    stc_bottom = UI.getChildControl(_panel, "Static_Bottom"),
    stc_focusBox = nil,
    txt_keyGuideDestroy = nil
  },
  slotConfig = {
    createIcon = false,
    createBorder = true,
    createCount = true,
    createEnchant = true,
    createCash = true
  },
  config = {socketSlotCount = 3, curSlotCount = 3},
  text = {
    [1] = PAGetString(Defines.StringSheet_GAME, "LUA_SOCKET_EMPTYSLOT")
  },
  desc = {
    [1] = PAGetString(Defines.StringSheet_GAME, "LUA_SOCKET_EMPTYSLOT_DESC")
  },
  slotMain = nil,
  slotSocket = Array.new(),
  _indexSocket = nil,
  _jewelInvenSlotNo = nil,
  _currentSlot = 0
}
local isItemLock = false
local _onlySocketListBG = {}
function FromClient_luaLoadComplete_SocketInfo_Init()
  socketInfo:initialize()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_SocketInfo_Init")
function socketInfo:initialize()
  self._ui.txt_descSub = UI.getChildControl(self._ui.stc_mainBG, "StaticText_DescSub")
  self._ui.txt_descSub:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  self._ui.txt_descSub:SetText(self._ui.txt_descSub:GetText())
  self._ui.staticEnchantItem = UI.getChildControl(self._ui.stc_innerBG, "Static_SlotBase")
  self._ui.staticSocket = {
    UI.getChildControl(self._ui.stc_innerBG, "Static_GemSlot1"),
    UI.getChildControl(self._ui.stc_innerBG, "Static_GemSlot2"),
    UI.getChildControl(self._ui.stc_innerBG, "Static_GemSlot3")
  }
  self._ui.staticSocketName = {
    UI.getChildControl(self._ui.stc_innerBG, "StaticText_GemTitle1"),
    UI.getChildControl(self._ui.stc_innerBG, "StaticText_GemTitle2"),
    UI.getChildControl(self._ui.stc_innerBG, "StaticText_GemTitle3")
  }
  self._ui.staticSocketDesc = {
    UI.getChildControl(self._ui.stc_innerBG, "StaticText_GemInfo1"),
    UI.getChildControl(self._ui.stc_innerBG, "StaticText_GemInfo2"),
    UI.getChildControl(self._ui.stc_innerBG, "StaticText_GemInfo3")
  }
  self._ui.staticSocketBackground = {
    UI.getChildControl(self._ui.stc_innerBG, "Static_Socket_1_Background"),
    UI.getChildControl(self._ui.stc_innerBG, "Static_Socket_2_Background"),
    UI.getChildControl(self._ui.stc_innerBG, "Static_Socket_3_Background")
  }
  _onlySocketListBG = {
    [1] = UI.getChildControl(self._ui.stc_innerBG, "Static_SocketFrame1"),
    [2] = UI.getChildControl(self._ui.stc_innerBG, "Static_SocketFrame2"),
    [3] = UI.getChildControl(self._ui.stc_innerBG, "Static_SocketFrame3")
  }
  self._ui.stc_focusBox = UI.getChildControl(self._ui.stc_innerBG, "Static_FocusBox")
  self._ui.txt_keyGuideDestroy = UI.getChildControl(self._ui.stc_innerBG, "StaticText_Trash_ConsoleUI")
  self._ui.txt_keyGuideDiscard = UI.getChildControl(self._ui.stc_bottom, "StaticText_KeyGuideCancel_ConsoleUI")
  self:createControl()
  self:registEventHandler()
  self:registMessageHandler()
end
function socketInfo:registEventHandler()
  _panel:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_Y, "Socket_SlotRClick()")
end
function socketInfo:registMessageHandler()
  registerEvent("EventSocketResult", "PaGlobalFunc_SocketInfo_Result")
end
function socketInfo:createControl()
  local slotMain = {}
  slotMain.icon = self._ui.staticEnchantItem
  SlotItem.new(slotMain, "Equip_Socket", 0, _panel, self.slotConfig)
  slotMain:createChild()
  slotMain.icon:addInputEvent("Mouse_RUp", "Socket_EquipSlotRClick()")
  Panel_Tooltip_Item_SetPosition(0, slotMain, "Socket")
  slotMain.empty = true
  self.slotMain = slotMain
  self.slotMain.whereType = nil
  self.slotMain.slotNo = nil
  for ii = 1, self.config.socketSlotCount do
    slotSocket = {
      icon = self._ui.staticSocket[ii],
      iconBg = self._ui.staticSocketBackground[ii],
      name = self._ui.staticSocketName[ii],
      desc = self._ui.staticSocketDesc[ii]
    }
    slotSocket.desc:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
    function slotSocket:setShow(bShow)
      self.icon:SetShow(bShow)
      self.name:SetShow(bShow)
      self.desc:SetShow(bShow)
    end
    _onlySocketListBG[ii]:SetShow(true)
    SlotItem.new(slotSocket, "Socket_" .. ii, ii, _panel, self.slotConfig)
    slotSocket:createChild()
    slotSocket.iconBg:addInputEvent("Mouse_On", "Input_SocketInfo_Select(" .. ii .. ", \"Socket_Insert\", true)")
    Panel_Tooltip_Item_SetPosition(ii, slotSocket, "Socket_Insert")
    slotSocket.empty = true
    self.slotSocket:push_back(slotSocket)
  end
end
function PaGlobalFunc_SocketInfo_Close()
  Inventory_SetFunctor(nil, nil, nil, nil)
  _panel:SetShow(false, false)
  InventoryWindow_Close()
  ToClient_BlackspiritEnchantClose()
end
function PaGlobalFunc_SocketInfo_GetShow()
  return _panel:GetShow()
end
function PaGlobalFunc_SocketInfo_Open()
  local self = socketInfo
  _panel:SetShow(true, true)
  Input_SocketInfo_Select(1)
  self._ui.txt_keyGuideDiscard:SetText("Exit")
  Inventory_SetFunctor(Socket_InvenFiler_EquipItem, Panel_Socket_InteractortionFromInventory, nil, nil)
  self:clearData()
  InventoryWindow_Show()
end
function socketInfo:clearData(uiOnly)
  self.slotMain:clearItem()
  self.slotMain.empty = true
  self.slotMain.whereType = nil
  self.slotMain.slotNo = nil
  self.slotMain.icon:SetShow(false)
  for ii = 1, self.config.socketSlotCount do
    local socketBG_1 = _onlySocketListBG[ii]:addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
    socketBG_1:SetStartColor(UI_color.C_FFFFFFFF)
    socketBG_1:SetEndColor(UI_color.C_FF626262)
    _onlySocketListBG[ii]:EraseAllEffect()
    self.slotSocket[ii]:setShow(false)
    self.slotSocket[ii]:clearItem()
    self.slotSocket[ii].empty = true
    self._ui.staticSocketName[ii]:SetText("")
    self._ui.staticSocketDesc[ii]:SetText("")
  end
  if not uiOnly then
    getSocketInformation():clearData()
  end
  Panel_Tooltip_Item_hideTooltip()
end
function socketInfo:updateSocket()
  if self.slotMain.empty then
    UI.ASSERT(false, "Must not be EMPTY!!!!")
    return
  end
  local invenItemWrapper = getInventoryItemByType(self.slotMain.whereType, self.slotMain.slotNo)
  local maxCount = invenItemWrapper:get():getUsableItemSocketCount()
  local classType = getSelfPlayer():getClassType()
  for ii = 1, self.config.socketSlotCount do
    self.slotSocket[ii].icon:SetShow(false)
  end
  for ii = 1, maxCount do
    self.slotSocket[ii].icon:SetShow(true)
    local socketSlot = self.slotSocket[ii]
    local itemStaticWrapper = invenItemWrapper:getPushedItem(ii - 1)
    socketSlot:setShow(true)
    _onlySocketListBG[ii]:EraseAllEffect()
    if nil == itemStaticWrapper then
      if ii == 1 then
        local socketBG_1 = _onlySocketListBG[1]:addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
        socketBG_1:SetStartColor(UI_color.C_FF626262)
        socketBG_1:SetEndColor(UI_color.C_FFFFFFFF)
        _onlySocketListBG[2]:SetColor(UI_color.C_FF626262)
        _onlySocketListBG[3]:SetColor(UI_color.C_FF626262)
      elseif ii == 2 then
        local socketBG_1 = _onlySocketListBG[1]:addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
        socketBG_1:SetStartColor(UI_color.C_FF626262)
        socketBG_1:SetEndColor(UI_color.C_FFFFFFFF)
        local socketBG_2 = _onlySocketListBG[2]:addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
        socketBG_2:SetStartColor(UI_color.C_FF626262)
        socketBG_2:SetEndColor(UI_color.C_FFFFFFFF)
        _onlySocketListBG[3]:SetColor(UI_color.C_FF626262)
      elseif ii == 3 then
        local socketBG_1 = _onlySocketListBG[1]:addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
        socketBG_1:SetStartColor(UI_color.C_FF626262)
        socketBG_1:SetEndColor(UI_color.C_FFFFFFFF)
        local socketBG_2 = _onlySocketListBG[2]:addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
        socketBG_2:SetStartColor(UI_color.C_FF626262)
        socketBG_2:SetEndColor(UI_color.C_FFFFFFFF)
        local socketBG_3 = _onlySocketListBG[3]:addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
        socketBG_3:SetStartColor(UI_color.C_FF626262)
        socketBG_3:SetEndColor(UI_color.C_FFFFFFFF)
      end
      socketSlot:clearItem()
      socketSlot.empty = true
      socketSlot.name:SetText(self.text[1])
      socketSlot.desc:SetText(self.desc[1])
      self.slotMain.icon:AddEffect("UI_ItemJewel", false, 0, 0)
    else
      if ii == 1 then
        local socketBG_1 = _onlySocketListBG[1]:addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
        socketBG_1:SetStartColor(UI_color.C_FF626262)
        socketBG_1:SetEndColor(UI_color.C_FFFFFFFF)
        _onlySocketListBG[2]:SetColor(UI_color.C_FF626262)
        _onlySocketListBG[3]:SetColor(UI_color.C_FF626262)
        audioPostEvent_SystemUi(5, 6)
        _onlySocketListBG[1]:AddEffect("UI_LimitMetastasis_TopLoop", true, -222, 40)
      elseif ii == 2 then
        local socketBG_1 = _onlySocketListBG[1]:addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
        socketBG_1:SetStartColor(UI_color.C_FF626262)
        socketBG_1:SetEndColor(UI_color.C_FFFFFFFF)
        local socketBG_2 = _onlySocketListBG[2]:addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
        socketBG_2:SetStartColor(UI_color.C_FF626262)
        socketBG_2:SetEndColor(UI_color.C_FFFFFFFF)
        _onlySocketListBG[3]:SetColor(UI_color.C_FF626262)
        audioPostEvent_SystemUi(5, 6)
        _onlySocketListBG[2]:AddEffect("UI_LimitMetastasis_MidLoop", true, -217, 0)
      elseif ii == 3 then
        local socketBG_1 = _onlySocketListBG[1]:addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
        socketBG_1:SetStartColor(UI_color.C_FF626262)
        socketBG_1:SetEndColor(UI_color.C_FFFFFFFF)
        local socketBG_2 = _onlySocketListBG[2]:addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
        socketBG_2:SetStartColor(UI_color.C_FF626262)
        socketBG_2:SetEndColor(UI_color.C_FFFFFFFF)
        local socketBG_3 = _onlySocketListBG[3]:addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
        socketBG_3:SetStartColor(UI_color.C_FF626262)
        socketBG_3:SetEndColor(UI_color.C_FFFFFFFF)
        audioPostEvent_SystemUi(5, 6)
        _onlySocketListBG[3]:AddEffect("UI_LimitMetastasis_BotLoop", true, -212, -30)
      end
      socketSlot:setItemByStaticStatus(itemStaticWrapper, 0)
      socketSlot.empty = false
      local text = itemStaticWrapper:getName()
      local desc = ""
      socketSlot.name:SetText(text)
      local jewelSkillStaticWrapper = itemStaticWrapper:getSkillByIdx(classType)
      if nil ~= jewelSkillStaticWrapper then
        for buffIdx = 0, jewelSkillStaticWrapper:getBuffCount() - 1 do
          local descCurrent = jewelSkillStaticWrapper:getBuffDescription(buffIdx)
          if nil == descCurrent or "" == descCurrent then
            break
          end
          if desc == "" then
            desc = descCurrent
          else
            desc = desc .. "\n" .. descCurrent
          end
        end
      end
      socketSlot.desc:SetText(desc)
    end
  end
  for ii = maxCount + 1, self.config.socketSlotCount do
    local socketSlot = self.slotSocket[ii]
    socketSlot:setShow(false)
    socketSlot:clearItem()
  end
  self:checkSocketAndShowKeyGuide()
end
function Input_SocketInfo_Select(index, socketInsert, isShowTooltip)
  _PA_LOG("\235\176\149\235\178\148\236\164\128", "Input_SocketInfo_Select : " .. index)
  local self = socketInfo
  self._currentSlot = index
  self._ui.stc_focusBox:SetPosY(self._ui.staticSocketBackground[index]:GetPosY() - 12)
  self._ui.txt_keyGuideDestroy:SetPosY(120 + (index - 1) * 75)
  self:checkSocketAndShowKeyGuide()
end
local function Socket_Pop_Confirm()
  local self = socketInfo
  Socket_PopJewelFromSocket(self._currentSlot, CppEnums.ItemWhereType.eCount, CppEnums.TInventorySlotNoUndefined)
  if true == self.slotSocket[self._currentSlot].empty then
    self._ui.txt_keyGuideDestroy:SetShow(false)
  else
    self._ui.txt_keyGuideDestroy:SetShow(true)
  end
end
local function Socket_Push_Confirm()
  local self = socketInfo
  local socketInfo = getSocketInformation()
  local index = socketInfo._indexPush
  local socketSlot = self.slotSocket[index + 1]
  if false == isItemLock then
    socketSlot.iconBg:AddEffect("UI_ItemJewel02", false, 0, 0)
    socketSlot.desc:AddEffect("UI_ItemJewel03", false, 0, 0)
    socketSlot.iconBg:AddEffect("fUI_ItemJewel01", false, -1, -1)
    self.slotMain.icon:AddEffect("fUI_ItemJewel01", false, -1, -1)
    self.slotMain.icon:AddEffect("UI_LimitMetastasis_Box01", false, -1, -1)
    socketSlot.icon:AddEffect("UI_LimitMetastasis_Box02", false, -1, -1)
  end
  Socket_ConfirmPushJewel(true)
  if false == isItemLock then
    if index == 0 then
      audioPostEvent_SystemUi(0, 7)
      self.slotMain.icon:AddEffect("UI_LimitMetastasis_Top01", false, -1, -1)
    elseif index == 1 then
      audioPostEvent_SystemUi(0, 7)
      self.slotMain.icon:AddEffect("UI_LimitMetastasis_Mid01", false, -1, -1)
    elseif index == 2 then
      audioPostEvent_SystemUi(0, 7)
      self.slotMain.icon:AddEffect("UI_LimitMetastasis_Bot01", false, -1, -1)
    end
  end
end
local function Socket_OverWrite_Confirm()
  local self = socketInfo
  local rv = Socket_OverWriteToSocket(self.slotMain.whereType, self.slotMain.slot, self._currentSlot)
  if 0 ~= rv then
    self:clearData()
    Inventory_SetFunctor(Socket_InvenFiler_EquipItem, Panel_Socket_InteractortionFromInventory, PaGlobalFunc_SocketInfo_Close, nil)
  end
end
local Socket_Deny = function()
  Socket_ConfirmPushJewel(false)
end
function Socket_InvenFiler_EquipItem(slotNo, itemWrapper)
  if nil == itemWrapper then
    return true
  end
  local itemSSW = itemWrapper:getStaticStatus()
  if true == itemSSW:get():doHaveSocket() then
    if 22 == itemSSW:getEquipType() and false == itemWrapper:get():isVested() then
      return true
    else
      return false
    end
  end
  return true
end
function Socket_InvenFiler_Jewel(slotNo, itemWrapper, whereType)
  if nil == itemWrapper then
    return true
  end
  if CppEnums.ItemWhereType.eCashInventory == whereType then
    return true
  end
  if ToClient_Inventory_CheckItemLock(slotNo, whereType) then
    return true
  end
  local isAble = getSocketInformation():isFilterJewelEquipType(whereType, slotNo)
  return not isAble
end
function SocketItem_FromItemWrapper()
  local self = socketInfo
  if nil == self.slotMain.slotNo then
    return nil
  end
  return (getInventoryItemByType(self.slotMain.whereType, self.slotMain.slotNo))
end
function Socket_SlotRClick()
  local self = socketInfo
  if true == self.slotSocket[self._currentSlot].empty then
    return
  end
  socketInfo._indexSocket = indexSocket
  local titleString = PAGetString(Defines.StringSheet_GAME, "LUA_SOCKET_REMOVE_TITLE")
  local contentString = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SOCKET_REMOVE_MESSAGE", "socketNum", string.format("%d", indexSocket + 1))
  local messageboxData = {
    title = titleString,
    content = contentString,
    functionYes = Socket_Pop_Confirm,
    functionCancel = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageboxData)
end
function PaGlobalFunc_SocketInfo_OnPadB()
  local self = socketInfo
  if nil ~= self.slotMain.slotNo then
    Socket_EquipSlotRClick()
    return false
  else
    PaGlobalFunc_SocketInfo_Close()
    return true
  end
end
function Socket_EquipSlotRClick()
  local self = socketInfo
  getSocketInformation():popEquip()
  socketInfo:clearData()
  self._ui.txt_keyGuideDiscard:SetText("Exit")
  Inventory_SetFunctor(Socket_InvenFiler_EquipItem, Panel_Socket_InteractortionFromInventory, PaGlobalFunc_SocketInfo_Close, nil)
end
function Panel_Socket_InteractortionFromInventory(slotNo, itemWrapper, count_s64, inventoryType)
  local self = socketInfo
  local socketInfo = getSocketInformation()
  local success = 0 == Socket_SetItemHaveSocket(inventoryType, slotNo)
  if not success then
    self:clearData()
    self._ui.txt_keyGuideDiscard:SetText("Exit")
    Inventory_SetFunctor(Socket_InvenFiler_EquipItem, Panel_Socket_InteractortionFromInventory, PaGlobalFunc_SocketInfo_Close, nil)
    return
  end
  local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  UI.ASSERT(nil ~= itemWrapper, "Item Is Null?!?!?!")
  if socketInfo._setEquipItem then
    self.slotMain.empty = false
    self.slotMain.whereType = inventoryType
    self.slotMain.slotNo = slotNo
    self.slotMain:setItem(itemWrapper)
    self.slotMain.icon:SetShow(true)
    Panel_Tooltip_Item_SetPosition(slotNo, self.slotMain, "SocketItem")
    self:updateSocket()
    self._ui.txt_keyGuideDiscard:SetText("Discard")
    Inventory_SetFunctor(Socket_InvenFiler_Jewel, Panel_Socket_InteractortionFromInventory, PaGlobalFunc_SocketInfo_Close, nil)
  else
    local rv = self:checkPushJewelToEmptySoket(inventoryType, slotNo)
    isItemLock = ToClient_Inventory_CheckItemLock(self.slotMain.slotNo)
    if 0 == rv then
      local index = self._indexPush
      local titleString = PAGetString(Defines.StringSheet_GAME, "LUA_SOCKET_INSERT_TITLE")
      local contentString = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_SOCKET_INSERT_MESSAGE", "socketNum", string.format("%d", index + 1), "itemName", itemWrapper:getStaticStatus():getName())
      local messageboxData = {
        title = titleString,
        content = contentString,
        functionYes = Socket_Push_Confirm,
        functionCancel = Socket_Deny,
        priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
      }
      MessageBox.showMessageBox(messageboxData)
    end
  end
  self:checkSocketAndShowKeyGuide()
end
function socketInfo:checkSocketAndShowKeyGuide()
  if true == self.slotSocket[self._currentSlot].empty then
    self._ui.txt_keyGuideDestroy:SetShow(false)
  else
    self._ui.txt_keyGuideDestroy:SetShow(true)
  end
end
function PaGlobalFunc_SocketInfo_Result()
  if _panel:GetShow() then
    socketInfo:updateSocket()
  else
    PaGlobal_ExtractionCrystal:result()
  end
end
local function Socket_fadeInSCR_Down(panel)
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
  panel:SetShowWithFade(CppEnums.PAUI_SHOW_FADE_TYPE.PAUI_ANI_TYPE_FADE_IN)
  local aniInfo3 = panel:addColorAnimation(0, 0.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo3:SetEndColor(UI_color.C_FFFFFFFF)
  for key, value in pairs(_onlySocketListBG) do
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
function SocketShowAni()
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
function SocketHideAni()
  local socketHide = UIAni.AlphaAnimation(0, _panel, 0, 0.2)
  socketHide:SetHideAtEnd(true)
  audioPostEvent_SystemUi(1, 1)
end
function PaGlobalFunc_SocketInfo_OnScreenResize()
  local sizeX = getScreenSizeX()
  local sizeY = getScreenSizeY()
  _panel:SetPosX(sizeX / 2 - _panel:GetSizeX() / 2)
  _panel:SetPosY(sizeY / 3.5)
  _panel:ComputePos()
end
function Socket_GetSlotNo()
  return socketInfo.slotMain.slotNo
end