local Panel_Dialog_Main_Right_Info = {
  _initialize = false,
  _ui = {
    static_RightBg = UI.getChildControl(Panel_Dialog_Main, "Static_RightBg"),
    staticText_DialogTitle = nil,
    static_Bg = nil,
    staticText_Dialog_Text = nil,
    btn_DialogTemplete = nil,
    btn_Dialog_List = {
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil
    },
    static_TypeIcon = nil,
    staticText_Name = nil,
    staticText_Needs = nil,
    list2_Dialog_List = nil,
    static_ExchangeBg = nil,
    staticText_Exchange_Title = nil,
    list2_Exchange_List = nil,
    list2_2_Content = nil,
    staticText_BeforeTemplete = nil,
    static_ArrowTemplete = nil,
    staticText_AfterTemplete = nil,
    list2_3_VerticalScroll = nil
  },
  _config = {
    maxButtonDialogCount = 6,
    maxExchangeSlotCount = 6,
    itemSlot = {
      createIcon = true,
      createBorder = true,
      createCount = true,
      createEnchant = false,
      createCash = false,
      createEnduranceIcon = false
    }
  },
  _enum = {eDefaultIndex = -1, eDefaultDialogSize = 4},
  _value = {
    currentDialogButtonIndex = 0,
    lastDialogButtonIndex = -1,
    exchangelistCount = 0,
    promiseTokenKey = 44192,
    allContentsSize = 0,
    isSetData = false
  },
  _text = {},
  _localize = {localizedType = nil, mainDialogLocalizedKey = nil},
  _pos = {
    exchangeStartPosY = 0,
    exchangeArrowStartPosY = 0,
    textstartPosY = 0,
    liststartPosY = 0,
    exchangePosY = 0
  },
  _space = {contentsSpace = 16, exchangeTextSpace = 0},
  _exchangIcon = {
    [0] = {
      texture = "Renewal/UI_Icon/Console_DialogueIcon_00.dds",
      x1 = 1,
      y1 = 1,
      x2 = 31,
      y2 = 31
    },
    [1] = {
      texture = "Renewal/UI_Icon/Console_DialogueIcon_00.dds",
      x1 = 32,
      y1 = 1,
      x2 = 62,
      y2 = 31
    },
    [2] = {
      texture = "Renewal/UI_Icon/Console_DialogueIcon_00.dds",
      x1 = 63,
      y1 = 1,
      x2 = 93,
      y2 = 31
    }
  },
  _exchangeSlot = {},
  _dialogId = {},
  _exchangeId = {}
}
function Panel_Dialog_Main_Right_Info:initialize()
  self:close()
  self:initControl()
end
function Panel_Dialog_Main_Right_Info:initControl()
  self._ui.static_RightBg = UI.getChildControl(Panel_Dialog_Main, "Static_RightBg")
  self._ui.staticText_DialogTitle = UI.getChildControl(self._ui.static_RightBg, "StaticText_DialogTitle")
  self._ui.staticText_DialogTitle:SetTextMode(CppEnums.TextMode.eTextMode_LimitText)
  self._ui.static_Bg = UI.getChildControl(self._ui.static_RightBg, "Static_Bg")
  self._ui.staticText_Dialog_Text = UI.getChildControl(self._ui.static_RightBg, "StaticText_Dialog_Text")
  self._ui.list2_Dialog_List = UI.getChildControl(self._ui.static_RightBg, "List2_Dialog_List")
  self._ui.list2_Dialog_List:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobalFunc_MainDialog_Right_List2EventControlCreate")
  self._ui.list2_Dialog_List:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
  self._ui.static_ExchangeBg = UI.getChildControl(self._ui.static_RightBg, "Static_ExchangeBg")
  self._ui.staticText_Title = UI.getChildControl(self._ui.static_ExchangeBg, "StaticText_Title")
  self._ui.list2_Exchange_List = UI.getChildControl(self._ui.static_ExchangeBg, "List2_Exchange_List")
  self._ui.list2_Exchange_List:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobalFunc_MainDialog_Right_List2EventControlCreateExchange")
  self._ui.list2_Exchange_List:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
end
function Panel_Dialog_Main_Right_Info:open()
  self._ui.static_RightBg:SetShow(true)
end
function Panel_Dialog_Main_Right_Info:close()
  self._ui.static_RightBg:SetShow(false)
end
function Panel_Dialog_Main_Right_Info:sizeX()
  return self._ui.static_RightBg:GetSizeX()
end
function Panel_Dialog_Main_Right_Info:update()
  self:close()
  local dialogData = ToClient_GetCurrentDialogData()
  if nil == dialogData then
    return
  end
  self._localize.localizedType = dialogData:getLocalizedTypeForLua()
  self._localize.mainDialogLocalizedKey = dialogData:getMainDialogLocalizedKey()
  if self._localize.mainDialogLocalizedKey == nil then
    ToClient_PopDialogueFlush()
    return
  end
  self._ui.staticText_Dialog_Text:setLocalizedStaticType(self._localize.localizedType)
  self._ui.staticText_Dialog_Text:setLocalizedKey(self._localize.mainDialogLocalizedKey)
  local npcWord = dialogData:getMainDialog()
  local ignoreWord = PaGlobalFunc_MainDialog_Right_CheckSceneChange(npcWord)
  local realDialog = ToClient_getReplaceDialog(ignoreWord)
  if true == PaGlobalFunc_MainDialog_Quest_GetShow() then
    self._value.isSetData = true
    self:setData(dialogData, realDialog)
    return
  end
  local openCheck = PaGlobalFunc_Dialog_Main_GetShowCheckOnce()
  if true == openCheck then
    self._value.isSetData = true
    self:openAndSetData(dialogData, realDialog, true, true)
  elseif true == PaGlobalFunc_MainDialog_Bottom_IsLeastFunButtonDefault() then
    self._value.isSetData = true
    self:openAndSetData(dialogData, realDialog, true, true)
  else
    local leasFunButtomIndex = PaGlobalFunc_MainDialog_Bottom_GetLeastFunButtonIndex()
    local funcButton = dialogData:getFuncButtonAt(leasFunButtomIndex)
    if funcButton == nil then
      return
    end
    local QuestCount = dialogData:getHaveQuestCount()
    local funcButtonType = tonumber(funcButton._param)
    if funcButtonType == CppEnums.ContentsType.Contents_HelpDesk then
      self._value.isSetData = true
      self:openAndSetData(dialogData, realDialog, true, false)
    elseif false then
    end
  end
end
function Panel_Dialog_Main_Right_Info:setData(dialogData, realDialog, showButton, showExchange)
  local npcName = dialogData:getContactNpcName()
  local talkerNpcKey = dialog_getTalkNpcKey()
  if 0 == talkerNpcKey then
    self._ui.staticText_DialogTitle:SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_QUESTLIST_BLACKSOUL"))
  else
    self._ui.staticText_DialogTitle:SetText(npcName)
  end
  if "" == realDialog or nil == realDialog then
    self._ui.staticText_Dialog_Text:SetShow(false)
  else
    local newNpcWord = ""
    local stringList = string.split(realDialog, "\n")
    local strFirst, strSecond
    if #stringList < 2 then
      newNpcWord = realDialog
    else
      for line = 1, #stringList / 2 do
        strFirst = stringList[line * 2 - 1]
        strSecond = stringList[line * 2]
        newNpcWord = newNpcWord .. strFirst .. "\n" .. strSecond .. "\n"
        if line ~= #stringList / 2 then
          newNpcWord = newNpcWord .. "\n"
        end
      end
    end
    self._ui.staticText_Dialog_Text:SetShow(true)
    self._ui.staticText_Dialog_Text:SetAutoResize(true)
    self._ui.staticText_Dialog_Text:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
    self._ui.staticText_Dialog_Text:SetText(newNpcWord)
  end
  self:ResizeContents(dialogData, showButton, showExchange)
  self:updateDialogList(dialogData, showButton)
  self:updateExchange(dialogData, showExchange)
end
function Panel_Dialog_Main_Right_Info:setDataOnlyMent(dialogData, realDialog)
  local npcName = dialogData:getContactNpcName()
  local talkerNpcKey = dialog_getTalkNpcKey()
  if 0 == talkerNpcKey then
    self._ui.staticText_DialogTitle:SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_QUESTLIST_BLACKSOUL"))
  else
    self._ui.staticText_DialogTitle:SetText(npcName)
  end
  if "" == realDialog or nil == realDialog then
    self._ui.staticText_Dialog_Text:SetShow(false)
  else
    local newNpcWord = ""
    local stringList = string.split(realDialog, "\n")
    local strFirst, strSecond
    if #stringList < 2 then
      newNpcWord = realDialog
    else
      for line = 1, #stringList / 2 do
        strFirst = stringList[line * 2 - 1]
        strSecond = stringList[line * 2]
        newNpcWord = newNpcWord .. strFirst .. "\n" .. strSecond .. "\n"
        if line ~= #stringList / 2 then
          newNpcWord = newNpcWord .. "\n"
        end
      end
    end
    self._ui.staticText_Dialog_Text:SetShow(true)
    self._ui.staticText_Dialog_Text:SetAutoResize(true)
    self._ui.staticText_Dialog_Text:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
    self._ui.staticText_Dialog_Text:SetText(newNpcWord)
  end
  self:ResizeContents(dialogData, false, false)
end
function Panel_Dialog_Main_Right_Info:openAndSetData(dialogData, realDialog, showButton, showExchange)
  if false == self._ui.static_RightBg:GetShow() then
    self:open()
  end
  self:setData(dialogData, realDialog, showButton, showExchange)
end
function Panel_Dialog_Main_Right_Info:updateExchange(dialogData, showExchange)
  self:closeExchange()
  showExchange = false
  if false == showExchange then
    return
  end
  if true == exchangeShow then
    self:openExchange()
    self:updateExchangeList(displayExchangeWrapper)
  end
end
function Panel_Dialog_Main_Right_Info:updateDialogList(dialogData, showButton)
  self._ui.list2_Dialog_List:getElementManager():clearKey()
  for k in pairs(self._dialogId) do
    self._dialogId[k] = nil
  end
  if false == showButton then
    self._ui.list2_Dialog_List:SetShow(false)
    return
  end
  local dialogCount = dialogData:getDialogButtonCount()
  if 0 == dialogCount then
    self._ui.list2_Dialog_List:SetShow(false)
    return
  end
  self._value.currentDialogButtonIndex = 0
  self._value.lastDialogButtonIndex = -1
  self._ui.list2_Dialog_List:SetShow(true)
  for index = 0, dialogCount - 1 do
    self._dialogId[index] = index
    self._ui.list2_Dialog_List:getElementManager():pushKey(toInt64(0, self._dialogId[index]))
    self._ui.list2_Dialog_List:requestUpdateByKey(toInt64(0, self._dialogId[index]))
  end
  self._ui.list2_Dialog_List:SetSize(self._ui.list2_Dialog_List:GetSizeX(), self._ui.list2_Dialog_List:GetSizeY())
  ToClient_padSnapResetControl()
end
function Panel_Dialog_Main_Right_Info:updateExchangeList(displayExchangeWrapper)
  self._ui.list2_Exchange_List:getElementManager():clearKey()
  for k in pairs(self._exchangeId) do
    self._exchangeId[k] = nil
  end
  local exchangelistCount = displayExchangeWrapper:getItemExchangeByNpcListSize()
  if 0 == exchangelistCount then
    return
  end
  for index = 0, exchangelistCount - 1 do
    self._exchangeId[index] = index
    self._ui.list2_Exchange_List:getElementManager():pushKey(toInt64(0, self._exchangeId[index]))
    self._ui.list2_Exchange_List:requestUpdateByKey(toInt64(0, self._exchangeId[index]))
  end
end
function Panel_Dialog_Main_Right_Info:closeExchange()
  self._ui.static_ExchangeBg:SetShow(false)
end
function Panel_Dialog_Main_Right_Info:openExchange()
  self._ui.static_ExchangeBg:SetShow(true)
end
function Panel_Dialog_Main_Right_Info:getGradeToColorString(grade)
  if 0 == grade then
    return "<PAColor0xffc4bebe>"
  elseif 1 == grade then
    return "<PAColor0xFF5DFF70>"
  elseif 2 == grade then
    return "<PAColor0xFF4B97FF>"
  elseif 3 == grade then
    return "<PAColor0xFFFFC832>"
  elseif 4 == grade then
    return "<PAColor0xFFFF6C00>"
  else
    return "<PAColor0xffc4bebe>"
  end
end
function Panel_Dialog_Main_Right_Info:HandleClickedDialogButton_ShowData(index)
  local displayData = Dialog_getButtonDisplayData(index)
  if nil == displayData then
    return
  end
  if displayData:empty() then
    Dialog_clickDialogButtonReq(index)
  else
    PaGlobalFunc_Dialog_ItemTake_SelectedIndex(index)
    PaGlobalFunc_Dialog_ItemTake_Show(displayData)
  end
end
function Panel_Dialog_Main_Right_Info:Resize()
  self._ui.static_RightBg:ComputePos()
  self._ui.staticText_DialogTitle:ComputePos()
  self._ui.staticText_Dialog_Text:ComputePos()
end
function Panel_Dialog_Main_Right_Info:ResizeContents(dialogData, showDialogButton, showExchange)
  self:Resize()
  self._pos.textstartPosY = self._ui.staticText_Dialog_Text:GetPosY()
  local _bgSize = self._pos.textstartPosY
  if true == self._ui.staticText_Dialog_Text:GetShow() then
    self._pos.liststartPosY = self._pos.textstartPosY + self._ui.staticText_Dialog_Text:GetSizeY() + self._space.contentsSpace
    self._ui.static_Bg:SetShow(true)
    self._ui.static_Bg:SetSize(self._ui.static_Bg:GetSizeX(), self._pos.liststartPosY - _bgSize + self._space.contentsSpace)
  else
    self._ui.static_Bg:SetShow(false)
    self._pos.liststartPosY = self._pos.textstartPosY
  end
  local dialogCount = 0
  if nil == showDialogButton or true == showDialogButton then
    dialogCount = dialogData:getDialogButtonCount()
  else
    dialogCount = 0
  end
  if dialogCount > 0 then
    self._ui.list2_Dialog_List:SetPosY(self._pos.liststartPosY)
    if dialogCount < self._enum.eDefaultDialogSize then
      self._pos.exchangePosY = self._pos.liststartPosY + self._space.contentsSpace + self._ui.list2_Dialog_List:GetSizeY() * dialogCount / self._enum.eDefaultDialogSize
    else
      self._pos.exchangePosY = self._pos.liststartPosY + self._space.contentsSpace + self._ui.list2_Dialog_List:GetSizeY()
    end
  else
    self._pos.exchangePosY = self._pos.liststartPosY
  end
  local exchangeShow = false
  if nil == showExchange or true == showExchange then
  else
    exchangeShow = false
  end
  if true == exchangeShow then
    self._ui.static_ExchangeBg:SetPosY(self._pos.exchangePosY)
    self._value.allContentsSize = self._pos.exchangePosY + self._ui.static_ExchangeBg:GetSizeY() + self._space.contentsSpace
  else
    self._value.allContentsSize = self._pos.exchangePosY
  end
  self._ui.static_RightBg:SetSize(self._ui.static_RightBg:GetSizeX(), self._value.allContentsSize)
  self._ui.static_RightBg:ComputePos()
end
function Panel_Dialog_Main_Right_Info:ExpirationItemCheck(itemKey)
  local selfProxy = getSelfPlayer():get()
  if nil == selfProxy then
    return
  end
  local inventory = selfProxy:getInventory()
  local invenSize = getSelfPlayer():get():getInventorySlotCount(true)
  for i = 1, invenSize - 1 do
    if not inventory:empty(i) then
      local itemWrapper = getInventoryItem(i)
      if nil ~= itemWrapper and itemKey == itemWrapper:get():getKey():getItemKey() then
        local itemExpiration = itemWrapper:getExpirationDate()
        if nil ~= itemExpiration and false == itemExpiration:isIndefinite() then
          local remainTime = Int64toInt32(getLeftSecond_s64(itemExpiration))
          if remainTime <= 0 then
            return true
          end
        end
      end
    end
  end
  return false
end
function Panel_Dialog_Main_Right_Info:ExchangeItem_HaveCount(itemKey)
  local selfProxy = getSelfPlayer():get()
  if nil == selfProxy then
    return
  end
  local itemCount = 0
  local inventory = selfProxy:getInventory()
  local invenUseSize = getSelfPlayer():get():getInventorySlotCount(true)
  local useStartSlot = inventorySlotNoUserStart()
  local invenSize = invenUseSize - useStartSlot
  for i = 1, invenSize - 1 do
    if not inventory:empty(i) then
      local itemWrapper = getInventoryItem(i)
      if nil ~= itemWrapper and itemKey == itemWrapper:get():getKey():getItemKey() then
        itemCount = Int64toInt32(itemWrapper:get():getCount_s64())
        return itemCount
      end
    end
  end
  return itemCount
end
function Panel_Dialog_Main_Right_Info:HandleClickedDialogButton_Trade(index)
  _AudioPostEvent_SystemUiForXBOX(0, 17)
  local dialogData = ToClient_GetCurrentDialogData()
  local dialogButton = dialogData:getDialogButtonAt(index)
  if self:ExpirationItemCheck(dialogButton:getNeedItemKey()) then
    local CancelExchange = function()
      return
    end
    local function GoExchange()
      self:HandleClickedDialogButton_ShowData(index)
    end
    local stringExchange = PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_ITEMEXCHANGE_EXPIRATIONCHECK")
    local messageboxData = {
      title = PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_ITEMEXCHANGE_TITLE"),
      content = stringExchange,
      functionYes = GoExchange,
      functionNo = CancelExchange,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageboxData)
  else
    do
      local needItemCount = dialogButton:getNeedItemCount()
      if CppEnums.DialogButtonType.eDialogButton_Exchange == dialogButton._dialogButtonType and needItemCount > 0 then
        local itemStaticWrapper = getItemEnchantStaticStatus(ItemEnchantKey(dialogButton:getNeedItemKey()))
        if itemStaticWrapper ~= nil then
          local itemCount = self:ExchangeItem_HaveCount(dialogButton:getNeedItemKey())
          if itemCount > 0 then
            local exchangeCount = math.floor(itemCount / needItemCount)
            if exchangeCount > 1 and dialogButton._isValidMultipleExchange then
              local function dialogExchangeCountSet(inputNum)
                local itemStaticWrapper = getItemEnchantStaticStatus(ItemEnchantKey(dialogButton:getNeedItemKey()))
                local _exchangeCount = Int64toInt32(inputNum)
                local function doExchange()
                  dialogData:setExchangeCount(_exchangeCount)
                  self:HandleClickedDialogButton_ShowData(index)
                end
                local function exchangeOne()
                  dialogData:setExchangeCount(1)
                  self:HandleClickedDialogButton_ShowData(index)
                end
                local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS")
                local messageBoxMemo = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_DIALOG_EXCHANGEITEM", "itemName", itemStaticWrapper:getName(), "count", _exchangeCount * needItemCount)
                local messageBoxData = {
                  title = messageBoxTitle,
                  content = messageBoxMemo,
                  functionYes = doExchange,
                  functionNo = exchangeOne,
                  priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
                }
                MessageBox.showMessageBox(messageBoxData, "middle")
              end
              Panel_NumberPad_Show(true, toInt64(0, exchangeCount), 0, dialogExchangeCountSet)
              return
            end
          end
        end
      end
      self:HandleClickedDialogButton_ShowData(index)
    end
  end
end
function PaGlobalFunc_MainDialog_Right_Open()
  local self = Panel_Dialog_Main_Right_Info
  self:open()
end
function PaGlobalFunc_MainDialog_Right_Close()
  local self = Panel_Dialog_Main_Right_Info
  self:close()
end
function PaGlobalFunc_MainDialog_Right_GetSizeX()
  local self = Panel_Dialog_Main_Right_Info
  return self:sizeX()
end
function PaGlobalFunc_MainDialog_Right_GetShow()
  local self = Panel_Dialog_Main_Right_Info
  return self._ui.static_RightBg:GetShow()
end
function PaGlobalFunc_MainDialog_Right_Update()
  local self = Panel_Dialog_Main_Right_Info
  self:update()
end
function PaGlobalFunc_MainDialog_Right_InitValue()
  Panel_Dialog_Main_Right_Info._value.isSetData = false
end
function PaGlobalFunc_MainDialog_Right_ReOpen(isButton, ignoreAction)
  local self = Panel_Dialog_Main_Right_Info
  if true == self._value.isSetData then
    local dialogData = ToClient_GetCurrentDialogData()
    if nil == dialogData then
      return
    end
    local npcWord = dialogData:getMainDialog()
    local ignoreWord = PaGlobalFunc_MainDialog_Right_CheckSceneChange(npcWord)
    if true == ignoreAction then
      ignoreWord = PaGlobalFunc_MainDialog_Right_CheckChangeAction(ignoreWord)
    end
    local realDialog = ToClient_getReplaceDialog(ignoreWord)
    if nil == isButton or true == isButton then
      if true == PaGlobalFunc_MainDialog_Bottom_IsLeastFunButtonDefault() then
        self:openAndSetData(dialogData, realDialog, true, false)
      else
        self:openAndSetData(dialogData, realDialog, false, false)
        PaGlobalFunc_MainDialog_Bottom_resetBottomKeyguide()
      end
    else
      self:openAndSetData(dialogData, realDialog, false, false)
    end
  end
end
function PaGlobalFunc_MainDialog_Right_ReOpenWithOtherMent(npcWord)
  local self = Panel_Dialog_Main_Right_Info
  if true == self._value.isSetData then
    local dialogData = ToClient_GetCurrentDialogData()
    if nil == dialogData then
      return
    end
    if nil == npcWord or "" == npcWord then
      return
    end
    local ignoreWord = PaGlobalFunc_MainDialog_Right_CheckSceneChange(npcWord)
    local realDialog = ToClient_getReplaceDialog(ignoreWord)
    self:open()
    self:setDataOnlyMent(dialogData, realDialog)
  end
end
function PaGlobalFunc_MainDialog_Right_List2EventControlCreate(list_content, key)
  local self = Panel_Dialog_Main_Right_Info
  local id = Int64toInt32(key)
  local dialogData = ToClient_GetCurrentDialogData()
  if nil == dialogData then
    return
  end
  local dialogButton = dialogData:getDialogButtonAt(id)
  local btn_Dialog = UI.getChildControl(list_content, "Button_Dialog")
  local static_TypeIcon = UI.getChildControl(btn_Dialog, "Static_TypeIcon")
  local text_Dialog = UI.getChildControl(list_content, "StaticText_Dialog_Name")
  local textNeed_Dialog = UI.getChildControl(list_content, "StaticText_Dialog_Needs")
  local button_A = UI.getChildControl(list_content, "Button_A")
  local needItemIcon = UI.getChildControl(list_content, "Static_NeedItemIcon")
  local needWpIcon = UI.getChildControl(list_content, "Static_NeedEnergyIcon")
  local dialogText = dialogButton:getText()
  btn_Dialog:addInputEvent("Mouse_LUp", "PaGlobalFunc_MainDialog_Right_HandleClickedDialogButton(" .. id .. ")")
  btn_Dialog:addInputEvent("Mouse_On", "PaGlobalFunc_MainDialog_Right_HandleOnDialogButton(" .. id .. ")")
  static_TypeIcon:SetShow(false)
  textNeed_Dialog:SetShow(false)
  btn_Dialog:SetMonoTone(false)
  btn_Dialog:setRenderTexture(btn_Dialog:getBaseTexture())
  text_Dialog:SetText(dialogText)
  needItemIcon:SetShow(false)
  needWpIcon:SetShow(false)
  local linkType = dialogButton._linkType
  if CppEnums.DialogState.eDialogState_ReContact == tostring(linkType) then
    return
  end
  local displayData = Dialog_getButtonDisplayData(id)
  if nil ~= displayData and not displayData:empty() then
    static_TypeIcon:SetShow(true)
    local IconType = self._exchangIcon[1]
    static_TypeIcon:ChangeTextureInfoName(IconType.texture)
    local x1, y1, x2, y2 = setTextureUV_Func(static_TypeIcon, IconType.x1, IconType.y1, IconType.x2, IconType.y2)
    static_TypeIcon:getBaseTexture():setUV(x1, y1, x2, y2)
    static_TypeIcon:setRenderTexture(static_TypeIcon:getBaseTexture())
  end
  if CppEnums.DialogButtonType.eDialogButton_Exchange == dialogButton._dialogButtonType then
    btn_Dialog:addInputEvent("Mouse_LUp", "PaGlobalFunc_MainDialog_Right_HandleClickedDialogButton(" .. id .. ",\"trade\"" .. ")")
    static_TypeIcon:SetShow(true)
    local IconType = self._exchangIcon[2]
    static_TypeIcon:ChangeTextureInfoName(IconType.texture)
    local x1, y1, x2, y2 = setTextureUV_Func(static_TypeIcon, IconType.x1, IconType.y1, IconType.x2, IconType.y2)
    static_TypeIcon:getBaseTexture():setUV(x1, y1, x2, y2)
    static_TypeIcon:setRenderTexture(static_TypeIcon:getBaseTexture())
  end
  local needThings = ""
  local isNeedThings = false
  local isNeedItem = false
  local isNeedWp = false
  local itemStaticWrapper
  local selfPlayer = getSelfPlayer()
  local Wp = selfPlayer:getWp()
  local needWp = dialogButton:getNeedWp()
  local needItemCount = 0
  if CppEnums.DialogState.eDialogState_Talk == tostring(linkType) and needWp > 0 then
    isNeedThings = true
    isNeedWp = true
    if 0 < dialogButton:getNeedItemCount() then
      itemStaticWrapper = getItemEnchantStaticStatus(ItemEnchantKey(dialogButton:getNeedItemKey()))
      if itemStaticWrapper ~= nil then
        isNeedItem = true
        needItemCount = dialogButton:getNeedItemCount()
      end
    end
  else
    if 0 < dialogButton:getNeedItemCount() then
      itemStaticWrapper = getItemEnchantStaticStatus(ItemEnchantKey(dialogButton:getNeedItemKey()))
      if itemStaticWrapper ~= nil then
        isNeedThings = true
        isNeedItem = true
        needItemCount = dialogButton:getNeedItemCount()
        if dialogButton:getNeedItemKey() == self._value.promiseTokenKey then
        end
      end
    else
    end
  end
  if isNeedThings then
    if dialogButton._invenPushable then
      textNeed_Dialog:SetShow(false)
      if true == isNeedItem then
        needItemIcon:SetShow(true)
        needItemIcon:ChangeTextureInfoName("Icon/" .. itemStaticWrapper:getIconPath())
        local x1, y1, x2, y2 = setTextureUV_Func(needItemIcon, 0, 0, 47, 47)
        needItemIcon:getBaseTexture():setUV(x1, y1, x2, y2)
        needItemIcon:setRenderTexture(needItemIcon:getBaseTexture())
        needItemIcon:SetText("x " .. needItemCount)
        local posX = button_A:GetPosX() - needItemIcon:GetSizeX() - needItemIcon:GetTextSizeX()
        needItemIcon:SetPosX(posX)
      end
      if true == isNeedWp then
        needWpIcon:SetShow(true)
        needWpIcon:SetText(needWp .. "/" .. Wp)
        local posX = button_A:GetPosX() - needWpIcon:GetSizeX() - needWpIcon:GetTextSizeX()
        if needItemIcon:GetShow() then
          posX = needItemIcon:GetPosX() - needWpIcon:GetSizeX() - needWpIcon:GetTextSizeX() - 7
        end
        needWpIcon:SetPosX(posX)
      end
    else
      textNeed_Dialog:SetShow(true)
      textNeed_Dialog:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PLAYER_INVENTORY_FULL"))
    end
  elseif CppEnums.DialogButtonType.eDialogButton_Knowledge == dialogButton._dialogButtonType then
    textNeed_Dialog:SetShow(false)
  end
  if false == dialogButton._enable then
    btn_Dialog:SetMonoTone(true)
  end
end
function PaGlobalFunc_MainDialog_Right_List2EventControlCreateExchange(list_content, key)
  local self = Panel_Dialog_Main_Right_Info
  local id = Int64toInt32(key)
  local dialogData = ToClient_GetCurrentDialogData()
  if nil == dialogData then
    return
  end
  local displayExchangeWrapper = dialogData:getCurrentDisplayExchangeWrapper()
  if nil == displayExchangeWrapper then
    return
  end
  local StaticText_Before = UI.getChildControl(list_content, "StaticText_BeforeTemplete")
  local Static_Arrow = UI.getChildControl(list_content, "Static_ArrowTemplete")
  local StaticText_After = UI.getChildControl(list_content, "StaticText_AfterTemplete")
  StaticText_Before:SetTextMode(CppEnums.TextMode.eTextMode_Limit_AutoWrap)
  StaticText_Before:setLineCountByLimitAutoWrap(2)
  StaticText_After:SetTextMode(CppEnums.TextMode.eTextMode_Limit_AutoWrap)
  StaticText_After:setLineCountByLimitAutoWrap(2)
  StaticText_Before:setLocalizedStaticType(self._localize.localizedType)
  StaticText_Before:setLocalizedKey(self._localize.mainDialogLocalizedKey)
  StaticText_After:setLocalizedStaticType(self._localize.localizedType)
  StaticText_After:setLocalizedKey(self._localize.mainDialogLocalizedKey)
  local itemWrapperLua = displayExchangeWrapper:getItemExchangeByNpcStaticStatusWrapperAtIndex(id)
  if nil ~= itemWrapperLua then
    local needItemWrapperLua = itemWrapperLua:getNeedItemStaticStatusWrapper()
    local resultItemWrapperLua = itemWrapperLua:getToItemStaticStatusWrapper()
    if nil ~= needItemWrapperLua and nil ~= resultItemWrapperLua then
      local needItemCount = itemWrapperLua:getNeedItemCount_s64()
      local needItemColorGrade = needItemWrapperLua:getGradeType()
      local needItemName = needItemWrapperLua:getName()
      local resultItemCount = itemWrapperLua:getToItemCount_s64()
      local resultItemColorGrade = resultItemWrapperLua:getGradeType()
      local resultItemName = resultItemWrapperLua:getName()
      StaticText_Before:SetText(self:getGradeToColorString(needItemColorGrade) .. needItemName .. "<PAOldColor> x" .. tostring(needItemCount))
      StaticText_After:SetText(self:getGradeToColorString(resultItemColorGrade) .. resultItemName .. "<PAOldColor> x" .. tostring(resultItemCount))
      StaticText_Before:SetShow(true)
      StaticText_After:SetShow(true)
      Static_Arrow:SetShow(true)
    end
  end
end
function PaGlobalFunc_MainDialog_Right_HandleOnDialogButton(id)
  local self = Panel_Dialog_Main_Right_Info
  self._value.lastDialogButtonIndex = self._value.currentDialogButtonIndex
  self._value.currentDialogButtonIndex = id
end
function PaGlobalFunc_MainDialog_Right_HandleClickedDialogButton(index, type)
  local self = Panel_Dialog_Main_Right_Info
  local dialogData = ToClient_GetCurrentDialogData()
  if nil == dialogData then
    return
  end
  local dlgBtnCnt = dialogData:getDialogButtonCount()
  if dlgBtnCnt <= 0 then
    _PA_LOG("\234\185\128\235\175\188\234\181\172", "0\236\157\188\235\166\172\234\176\128 \236\151\134\235\138\148\235\141\176 \235\176\156\236\131\157\237\149\168 \237\153\149\236\157\184 \237\149\132\236\154\148.")
    return
  end
  local dialogButton = dialogData:getDialogButtonAt(index)
  if nil == dialogButton or false == dialogButton._enable then
    local msg = PAGetString(Defines.StringSheet_GAME, "LUA_QUESTWIDGET_NEXTQUEST_NOTYET_BLACKSPIRIT")
    Proc_ShowMessage_Ack(msg)
    return
  end
  if type == "trade" then
    self:HandleClickedDialogButton_Trade(index)
  else
    local dialogButton = dialogData:getDialogButtonAt(index)
    local linkType = dialogButton._linkType
    if CppEnums.DialogButtonType.eDialogButton_CutScene == dialogButton._dialogButtonType and CppEnums.DialogState.eDialogState_Talk == tostring(linkType) then
      FGlobal_SetIsCutScenePlay(true)
    end
    self:HandleClickedDialogButton_ShowData(index)
  end
end
function PaGlobalFunc_MainDialog_Right_InteractionCheck()
  local self = Panel_Dialog_Main_Right_Info
  local isShow = self._ui.static_RightBg:GetShow()
  if false == isShow then
    return
  end
  local dialogData = ToClient_GetCurrentDialogData()
  if nil == dialogData then
    return
  end
  local dialogButtonCount = dialogData:getDialogButtonCount()
  if 0 == dialogButtonCount then
    return
  end
  local enableDailogButtonIndex
  for index = 0, dialogButtonCount - 1 do
    local dialogButton = dialogData:getDialogButtonAt(index)
    if true == dialogButton._enable then
      enableDailogButtonIndex = index
      break
    end
  end
  if nil == enableDailogButtonIndex then
    return
  end
  _AudioPostEvent_SystemUiForXBOX(50, 2)
  PaGlobalFunc_MainDialog_Right_HandleClickedDialogButton(enableDailogButtonIndex)
end
function PaGlobalFunc_MainDialog_Right_CheckSceneChange(_npcWord)
  if nil == _npcWord or false == _ContentsGroup_RenewUI_Main then
    return _npcWord
  end
  local firstParam = string.split(_npcWord, "{")
  if nil == firstParam[2] then
    return _npcWord
  end
  local secondParam = string.split(firstParam[2], "(")
  local firstMessage = firstParam[1]
  if "ChangeScene" == secondParam[1] then
    local returntext = firstMessage
    local afterChangeScene = string.split(secondParam[2], "}")
    if nil == afterChangeScene[2] then
      return returntext
    else
      returntext = returntext .. afterChangeScene[2]
      return returntext
    end
  else
    return _npcWord
  end
end
function PaGlobalFunc_MainDialog_Right_CheckChangeAction(_npcWord)
  if nil == _npcWord or false == _ContentsGroup_RenewUI_Main then
    return _npcWord
  end
  local firstParam = string.split(_npcWord, "{")
  if nil == firstParam[2] then
    return _npcWord
  end
  local secondParam = string.split(firstParam[2], "(")
  local firstMessage = firstParam[1]
  if "ChangeAction" == secondParam[1] then
    local returntext = firstMessage
    local afterChangeScene = string.split(secondParam[2], "}")
    if nil == afterChangeScene[2] then
      return returntext
    else
      returntext = returntext .. afterChangeScene[2]
      return returntext
    end
  else
    return _npcWord
  end
end
function FromClient_InitMainDialog_Right()
  local self = Panel_Dialog_Main_Right_Info
  self:initialize()
  self:Resize()
  registerEvent("onScreenResize", "FromClient_onScreenResize_MainDialog_Right")
end
function FromClient_onScreenResize_MainDialog_Right()
  local self = Panel_Dialog_Main_Right_Info
  self:Resize()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_InitMainDialog_Right")
