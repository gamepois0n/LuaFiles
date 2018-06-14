-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\dialogue\panel_dialog_main_right_renew.luac 

-- params : ...
-- function num : 0
local Panel_Dialog_Main_Right_Info = {_initialize = false, 
_ui = {static_RightBg = (UI.getChildControl)(Panel_Dialog_Main, "Static_RightBg"), staticText_DialogTitle = nil, static_Bg = nil, staticText_Dialog_Text = nil, btn_DialogTemplete = nil, 
btn_Dialog_List = {nil, nil, nil, nil, nil, nil, nil, nil}
, static_TypeIcon = nil, staticText_Name = nil, staticText_Needs = nil, list2_Dialog_List = nil, static_ExchangeBg = nil, staticText_Exchange_Title = nil, list2_Exchange_List = nil, list2_2_Content = nil, staticText_BeforeTemplete = nil, static_ArrowTemplete = nil, staticText_AfterTemplete = nil, list2_3_VerticalScroll = nil}
, 
_config = {maxButtonDialogCount = 6, maxExchangeSlotCount = 6}
, 
_enum = {eDefaultIndex = -1, eDefaultDialogSize = 4}
, 
_value = {currentDialogButtonIndex = 0, lastDialogButtonIndex = -1, exchangelistCount = 0, promiseTokenKey = 44192, allContentsSize = 0, isSetData = false}
, 
_text = {}
, 
_localize = {localizedType = nil, mainDialogLocalizedKey = nil}
, 
_pos = {exchangeStartPosY = 0, exchangeArrowStartPosY = 0, textstartPosY = 0, liststartPosY = 0, exchangePosY = 0}
, 
_space = {contentsSpace = 16, exchangeTextSpace = 0}
, 
_exchangIcon = {
[0] = {texture = "Renewal/UI_Icon/Console_DialogueIcon_00.dds", x1 = 1, y1 = 1, x2 = 31, y2 = 31}
, 
[1] = {texture = "Renewal/UI_Icon/Console_DialogueIcon_00.dds", x1 = 32, y1 = 1, x2 = 62, y2 = 31}
, 
[2] = {texture = "Renewal/UI_Icon/Console_DialogueIcon_00.dds", x1 = 63, y1 = 1, x2 = 93, y2 = 31}
}
, 
_exchangeSlot = {}
, 
_dialogId = {}
, 
_exchangeId = {}
}
Panel_Dialog_Main_Right_Info.initialize = function(self)
  -- function num : 0_0
  self:close()
  self:initControl()
end

Panel_Dialog_Main_Right_Info.initControl = function(self)
  -- function num : 0_1
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).static_RightBg = (UI.getChildControl)(Panel_Dialog_Main, "Static_RightBg")
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_DialogTitle = (UI.getChildControl)((self._ui).static_RightBg, "StaticText_DialogTitle")
  ;
  ((self._ui).staticText_DialogTitle):SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_Bg = (UI.getChildControl)((self._ui).static_RightBg, "Static_Bg")
  -- DECOMPILER ERROR at PC37: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Dialog_Text = (UI.getChildControl)((self._ui).static_RightBg, "StaticText_Dialog_Text")
  -- DECOMPILER ERROR at PC45: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).list2_Dialog_List = (UI.getChildControl)((self._ui).static_RightBg, "List2_Dialog_List")
  ;
  ((self._ui).list2_Dialog_List):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "PaGlobalFunc_MainDialog_Right_List2EventControlCreate")
  ;
  ((self._ui).list2_Dialog_List):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  -- DECOMPILER ERROR at PC68: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_ExchangeBg = (UI.getChildControl)((self._ui).static_RightBg, "Static_ExchangeBg")
  -- DECOMPILER ERROR at PC76: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Title = (UI.getChildControl)((self._ui).static_ExchangeBg, "StaticText_Title")
  -- DECOMPILER ERROR at PC84: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).list2_Exchange_List = (UI.getChildControl)((self._ui).static_ExchangeBg, "List2_Exchange_List")
  ;
  ((self._ui).list2_Exchange_List):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "PaGlobalFunc_MainDialog_Right_List2EventControlCreateExchange")
  ;
  ((self._ui).list2_Exchange_List):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
end

Panel_Dialog_Main_Right_Info.open = function(self)
  -- function num : 0_2
  ((self._ui).static_RightBg):SetShow(true)
end

Panel_Dialog_Main_Right_Info.close = function(self)
  -- function num : 0_3
  ((self._ui).static_RightBg):SetShow(false)
end

Panel_Dialog_Main_Right_Info.update = function(self)
  -- function num : 0_4
  self:close()
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
    return 
  end
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._localize).localizedType = dialogData:getLocalizedTypeForLua()
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._localize).mainDialogLocalizedKey = dialogData:getMainDialogLocalizedKey()
  if (self._localize).mainDialogLocalizedKey == nil then
    ToClient_PopDialogueFlush()
    return 
  end
  ;
  ((self._ui).staticText_Dialog_Text):setLocalizedStaticType((self._localize).localizedType)
  ;
  ((self._ui).staticText_Dialog_Text):setLocalizedKey((self._localize).mainDialogLocalizedKey)
  local npcWord = dialogData:getMainDialog()
  local realDialog = ToClient_getReplaceDialog(npcWord)
  -- DECOMPILER ERROR at PC44: Confused about usage of register: R4 in 'UnsetPending'

  if PaGlobalFunc_MainDialog_Quest_GetShow() == true then
    (self._value).isSetData = true
    self:setData(dialogData, realDialog)
    return 
  end
  local openCheck = PaGlobalFunc_MainDialog_Bottom_IsLeastFunButtonDefault()
  -- DECOMPILER ERROR at PC55: Confused about usage of register: R5 in 'UnsetPending'

  if openCheck == true then
    (self._value).isSetData = true
    self:openAndSetData(dialogData, realDialog)
  else
    local leasFunButtomIndex = PaGlobalFunc_MainDialog_Bottom_GetLeastFunButtonIndex()
    local funcButton = dialogData:getFuncButtonAt(leasFunButtomIndex)
    if funcButton == nil then
      return 
    end
    local QuestCount = dialogData:getHaveQuestCount()
    local funcButtonType = tonumber(funcButton._param)
    -- DECOMPILER ERROR at PC80: Confused about usage of register: R9 in 'UnsetPending'

    if funcButtonType == (CppEnums.ContentsType).Contents_HelpDesk then
      (self._value).isSetData = false
      self:openAndSetData(dialogData, realDialog)
    else
    end
  end
  do
    if false then
    end
  end
end

Panel_Dialog_Main_Right_Info.setData = function(self, dialogData, realDialog)
  -- function num : 0_5
  local npcName = dialogData:getContactNpcName()
  local talkerNpcKey = dialog_getTalkNpcKey()
  if talkerNpcKey == 0 then
    ((self._ui).staticText_DialogTitle):SetText(PAGetString(Defines.StringSheet_GAME, "PANEL_QUESTLIST_BLACKSOUL"))
  else
    ;
    ((self._ui).staticText_DialogTitle):SetText(npcName)
  end
  if realDialog == "" or realDialog == nil then
    ((self._ui).staticText_Dialog_Text):SetShow(false)
  else
    local newNpcWord = ""
    local stringList = ((string.split)(realDialog, "\n"))
    local strFirst, strSecond = nil, nil
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
    do
      do
        ;
        ((self._ui).staticText_Dialog_Text):SetShow(true)
        ;
        ((self._ui).staticText_Dialog_Text):SetAutoResize(true)
        ;
        ((self._ui).staticText_Dialog_Text):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
        ;
        ((self._ui).staticText_Dialog_Text):SetText(newNpcWord)
        self:ResizeContents(dialogData)
        self:updateDialogList(dialogData)
        self:updateExchange(dialogData)
      end
    end
  end
end

Panel_Dialog_Main_Right_Info.openAndSetData = function(self, dialogData, realDialog)
  -- function num : 0_6
  self:open()
  self:setData(dialogData, realDialog)
end

Panel_Dialog_Main_Right_Info.updateExchange = function(self, dialogData)
  -- function num : 0_7
  self:closeExchange()
  local exchangeShow = false
  if exchangeShow == true then
    self:openExchange()
    self:updateExchangeList(displayExchangeWrapper)
  end
end

Panel_Dialog_Main_Right_Info.updateDialogList = function(self, dialogData)
  -- function num : 0_8
  (((self._ui).list2_Dialog_List):getElementManager()):clearKey()
  for k in pairs(self._dialogId) do
    -- DECOMPILER ERROR at PC11: Confused about usage of register: R6 in 'UnsetPending'

    (self._dialogId)[k] = nil
  end
  local dialogCount = dialogData:getDialogButtonCount()
  if dialogCount == 0 then
    ((self._ui).list2_Dialog_List):SetShow(false)
    return 
  end
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._value).currentDialogButtonIndex = 0
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._value).lastDialogButtonIndex = -1
  ;
  ((self._ui).list2_Dialog_List):SetShow(true)
  for index = 0, dialogCount - 1 do
    -- DECOMPILER ERROR at PC38: Confused about usage of register: R7 in 'UnsetPending'

    (self._dialogId)[index] = index
    ;
    (((self._ui).list2_Dialog_List):getElementManager()):pushKey(toInt64(0, (self._dialogId)[index]))
    ;
    ((self._ui).list2_Dialog_List):requestUpdateByKey(toInt64(0, (self._dialogId)[index]))
  end
  ;
  ((self._ui).list2_Dialog_List):SetSize(((self._ui).list2_Dialog_List):GetSizeX(), ((self._ui).list2_Dialog_List):GetSizeY())
end

Panel_Dialog_Main_Right_Info.updateExchangeList = function(self, displayExchangeWrapper)
  -- function num : 0_9
  (((self._ui).list2_Exchange_List):getElementManager()):clearKey()
  for k in pairs(self._exchangeId) do
    -- DECOMPILER ERROR at PC11: Confused about usage of register: R6 in 'UnsetPending'

    (self._exchangeId)[k] = nil
  end
  local exchangelistCount = displayExchangeWrapper:getItemExchangeByNpcListSize()
  if exchangelistCount == 0 then
    return 
  end
  for index = 0, exchangelistCount - 1 do
    -- DECOMPILER ERROR at PC24: Confused about usage of register: R7 in 'UnsetPending'

    (self._exchangeId)[index] = index
    ;
    (((self._ui).list2_Exchange_List):getElementManager()):pushKey(toInt64(0, (self._exchangeId)[index]))
    ;
    ((self._ui).list2_Exchange_List):requestUpdateByKey(toInt64(0, (self._exchangeId)[index]))
  end
end

Panel_Dialog_Main_Right_Info.closeExchange = function(self)
  -- function num : 0_10
  ((self._ui).static_ExchangeBg):SetShow(false)
end

Panel_Dialog_Main_Right_Info.openExchange = function(self)
  -- function num : 0_11
  ((self._ui).static_ExchangeBg):SetShow(true)
end

Panel_Dialog_Main_Right_Info.getGradeToColorString = function(self, grade)
  -- function num : 0_12
  if grade == 0 then
    return "<PAColor0xffc4bebe>"
  else
    if grade == 1 then
      return "<PAColor0xFF5DFF70>"
    else
      if grade == 2 then
        return "<PAColor0xFF4B97FF>"
      else
        if grade == 3 then
          return "<PAColor0xFFFFC832>"
        else
          if grade == 4 then
            return "<PAColor0xFFFF6C00>"
          else
            return "<PAColor0xffc4bebe>"
          end
        end
      end
    end
  end
end

Panel_Dialog_Main_Right_Info.HandleClickedDialogButton_ShowData = function(self, index)
  -- function num : 0_13
  local displayData = Dialog_getButtonDisplayData(index)
  if displayData == nil then
    return 
  end
  if displayData:empty() then
    Dialog_clickDialogButtonReq(index)
  else
    TalkPopup_SelectedIndex(index)
    TalkPopup_Show(displayData)
  end
end

Panel_Dialog_Main_Right_Info.Resize = function(self)
  -- function num : 0_14
  ((self._ui).static_RightBg):ComputePos()
  ;
  ((self._ui).staticText_DialogTitle):ComputePos()
  ;
  ((self._ui).staticText_Dialog_Text):ComputePos()
end

Panel_Dialog_Main_Right_Info.ResizeContents = function(self, dialogData)
  -- function num : 0_15
  self:Resize()
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._pos).textstartPosY = ((self._ui).staticText_Dialog_Text):GetPosY()
  local _bgSize = (self._pos).textstartPosY
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R3 in 'UnsetPending'

  if ((self._ui).staticText_Dialog_Text):GetShow() == true then
    (self._pos).liststartPosY = (self._pos).textstartPosY + ((self._ui).staticText_Dialog_Text):GetSizeY() + (self._space).contentsSpace
  else
    -- DECOMPILER ERROR at PC32: Confused about usage of register: R3 in 'UnsetPending'

    ;
    (self._pos).liststartPosY = (self._pos).textstartPosY
  end
  ;
  ((self._ui).static_Bg):SetSize(((self._ui).static_Bg):GetSizeX(), (self._pos).liststartPosY - _bgSize + (self._space).contentsSpace)
  local dialogCount = dialogData:getDialogButtonCount()
  if dialogCount > 0 then
    ((self._ui).list2_Dialog_List):SetPosY((self._pos).liststartPosY)
    -- DECOMPILER ERROR at PC76: Confused about usage of register: R4 in 'UnsetPending'

    if dialogCount < (self._enum).eDefaultDialogSize then
      (self._pos).exchangePosY = (self._pos).liststartPosY + (self._space).contentsSpace + ((self._ui).list2_Dialog_List):GetSizeY() * dialogCount / (self._enum).eDefaultDialogSize
    else
      -- DECOMPILER ERROR at PC89: Confused about usage of register: R4 in 'UnsetPending'

      ;
      (self._pos).exchangePosY = (self._pos).liststartPosY + (self._space).contentsSpace + ((self._ui).list2_Dialog_List):GetSizeY()
    end
  else
    -- DECOMPILER ERROR at PC94: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (self._pos).exchangePosY = (self._pos).liststartPosY
  end
  local exchangeShow = false
  if exchangeShow == true then
    ((self._ui).static_ExchangeBg):SetPosY((self._pos).exchangePosY)
    -- DECOMPILER ERROR at PC115: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self._value).allContentsSize = (self._pos).exchangePosY + ((self._ui).static_ExchangeBg):GetSizeY() + (self._space).contentsSpace
  else
    -- DECOMPILER ERROR at PC120: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self._value).allContentsSize = (self._pos).exchangePosY
  end
  ;
  ((self._ui).static_RightBg):SetSize(((self._ui).static_RightBg):GetSizeX(), (self._value).allContentsSize)
  ;
  ((self._ui).static_RightBg):ComputePos()
end

Panel_Dialog_Main_Right_Info.ExpirationItemCheck = function(self, itemKey)
  -- function num : 0_16
  local selfProxy = (getSelfPlayer()):get()
  if selfProxy == nil then
    return 
  end
  local inventory = selfProxy:getInventory()
  local invenSize = ((getSelfPlayer()):get()):getInventorySlotCount(true)
  for i = 1, invenSize - 1 do
    if not inventory:empty(i) then
      local itemWrapper = getInventoryItem(i)
      if itemWrapper ~= nil and itemKey == ((itemWrapper:get()):getKey()):getItemKey() then
        local itemExpiration = itemWrapper:getExpirationDate()
        if itemExpiration ~= nil and itemExpiration:isIndefinite() == false then
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

Panel_Dialog_Main_Right_Info.ExchangeItem_HaveCount = function(self, itemKey)
  -- function num : 0_17
  local selfProxy = (getSelfPlayer()):get()
  if selfProxy == nil then
    return 
  end
  local itemCount = 0
  local inventory = selfProxy:getInventory()
  local invenUseSize = ((getSelfPlayer()):get()):getInventorySlotCount(true)
  local useStartSlot = inventorySlotNoUserStart()
  local invenSize = invenUseSize - useStartSlot
  for i = 1, invenSize - 1 do
    if not inventory:empty(i) then
      local itemWrapper = getInventoryItem(i)
      if itemWrapper ~= nil and itemKey == ((itemWrapper:get()):getKey()):getItemKey() then
        itemCount = Int64toInt32((itemWrapper:get()):getCount_s64())
        return itemCount
      end
    end
  end
  return itemCount
end

Panel_Dialog_Main_Right_Info.HandleClickedDialogButton_Trade = function(self, index)
  -- function num : 0_18
  audioPostEvent_SystemUi(0, 17)
  local dialogData = ToClient_GetCurrentDialogData()
  local dialogButton = dialogData:getDialogButtonAt(index)
  if self:ExpirationItemCheck(dialogButton:getNeedItemKey()) then
    local CancelExchange = function()
    -- function num : 0_18_0
    return 
  end

    do
      local GoExchange = function()
    -- function num : 0_18_1 , upvalues : self, index
    self:HandleClickedDialogButton_ShowData(index)
  end

      local stringExchange = PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_ITEMEXCHANGE_EXPIRATIONCHECK")
      local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_ITEMEXCHANGE_TITLE"), content = stringExchange, functionYes = GoExchange, functionNo = CancelExchange, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageboxData)
    end
  else
    do
      local needItemCount = dialogButton:getNeedItemCount()
      if (CppEnums.DialogButtonType).eDialogButton_Exchange == dialogButton._dialogButtonType and needItemCount > 0 then
        local itemStaticWrapper = getItemEnchantStaticStatus(ItemEnchantKey(dialogButton:getNeedItemKey()))
        if itemStaticWrapper ~= nil then
          local itemCount = self:ExchangeItem_HaveCount(dialogButton:getNeedItemKey())
          if itemCount > 0 then
            local exchangeCount = (math.floor)(itemCount / needItemCount)
            if exchangeCount > 1 and dialogButton._isValidMultipleExchange then
              local dialogExchangeCountSet = function(inputNum)
    -- function num : 0_18_2 , upvalues : dialogButton, dialogData, self, index, needItemCount
    local itemStaticWrapper = getItemEnchantStaticStatus(ItemEnchantKey(dialogButton:getNeedItemKey()))
    local _exchangeCount = Int64toInt32(inputNum)
    local doExchange = function()
      -- function num : 0_18_2_0 , upvalues : dialogData, _exchangeCount, self, index
      dialogData:setExchangeCount(_exchangeCount)
      self:HandleClickedDialogButton_ShowData(index)
    end

    local exchangeOne = function()
      -- function num : 0_18_2_1 , upvalues : dialogData, self, index
      dialogData:setExchangeCount(1)
      self:HandleClickedDialogButton_ShowData(index)
    end

    local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS")
    local messageBoxMemo = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_DIALOG_EXCHANGEITEM", "itemName", itemStaticWrapper:getName(), "count", _exchangeCount * needItemCount)
    local messageBoxData = {title = messageBoxTitle, content = messageBoxMemo, functionYes = doExchange, functionNo = exchangeOne, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData, "middle")
  end

              Panel_NumberPad_Show(true, toInt64(0, exchangeCount), 0, dialogExchangeCountSet)
              return 
            end
          end
        end
      end
      do
        self:HandleClickedDialogButton_ShowData(index)
      end
    end
  end
end

PaGlobalFunc_MainDialog_Right_Open = function()
  -- function num : 0_19 , upvalues : Panel_Dialog_Main_Right_Info
  local self = Panel_Dialog_Main_Right_Info
  self:open()
end

PaGlobalFunc_MainDialog_Right_Close = function()
  -- function num : 0_20 , upvalues : Panel_Dialog_Main_Right_Info
  local self = Panel_Dialog_Main_Right_Info
  self:close()
end

PaGlobalFunc_MainDialog_Right_GetShow = function()
  -- function num : 0_21 , upvalues : Panel_Dialog_Main_Right_Info
  local self = Panel_Dialog_Main_Right_Info
  return ((self._ui).static_RightBg):GetShow()
end

PaGlobalFunc_MainDialog_Right_Update = function()
  -- function num : 0_22 , upvalues : Panel_Dialog_Main_Right_Info
  local self = Panel_Dialog_Main_Right_Info
  self:update()
end

PaGlobalFunc_MainDialog_Right_InitValue = function()
  -- function num : 0_23 , upvalues : Panel_Dialog_Main_Right_Info
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R0 in 'UnsetPending'

  (Panel_Dialog_Main_Right_Info._value).isSetData = false
end

PaGlobalFunc_MainDialog_Right_ReOpen = function()
  -- function num : 0_24 , upvalues : Panel_Dialog_Main_Right_Info
  local self = Panel_Dialog_Main_Right_Info
  if (self._value).isSetData == true then
    local dialogData = ToClient_GetCurrentDialogData()
    if dialogData == nil then
      return 
    end
    local npcWord = dialogData:getMainDialog()
    local realDialog = ToClient_getReplaceDialog(npcWord)
    self:openAndSetData(dialogData, realDialog)
  end
end

PaGlobalFunc_MainDialog_Right_List2EventControlCreate = function(list_content, key)
  -- function num : 0_25 , upvalues : Panel_Dialog_Main_Right_Info
  local self = Panel_Dialog_Main_Right_Info
  local id = Int64toInt32(key)
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
    return 
  end
  local dialogButton = dialogData:getDialogButtonAt(id)
  local btn_Dialog = (UI.getChildControl)(list_content, "Button_Dialog")
  local static_TypeIcon = (UI.getChildControl)(btn_Dialog, "Static_TypeIcon")
  local text_Dialog = (UI.getChildControl)(list_content, "StaticText_Dialog_Name")
  local textNeed_Dialog = (UI.getChildControl)(list_content, "StaticText_Dialog_Needs")
  local button_A = (UI.getChildControl)(list_content, "Button_A")
  button_A:SetShow(false)
  local dialogText = dialogButton:getText()
  btn_Dialog:addInputEvent("Mouse_LUp", "PaGlobalFunc_MainDialog_Right_HandleClickedDialogButton(" .. id .. ")")
  btn_Dialog:addInputEvent("Mouse_On", "PaGlobalFunc_MainDialog_Right_HandleOnDialogButton(" .. id .. ")")
  button_A:SetShow(false)
  if (self._value).currentDialogButtonIndex == id then
    button_A:SetShow(true)
  end
  static_TypeIcon:SetShow(false)
  textNeed_Dialog:SetShow(false)
  btn_Dialog:SetMonoTone(false)
  btn_Dialog:SetIgnore(false)
  text_Dialog:SetText(dialogText)
  local linkType = dialogButton._linkType
  if (CppEnums.DialogState).eDialogState_ReContact == tostring(linkType) then
    return 
  end
  if (CppEnums.DialogButtonType).eDialogButton_Normal == dialogButton._dialogButtonType then
    static_TypeIcon:SetShow(true)
    local IconType = (self._exchangIcon)[1]
    static_TypeIcon:ChangeTextureInfoName(IconType.texture)
    local x1, y1, x2, y2 = setTextureUV_Func(static_TypeIcon, IconType.x1, IconType.y1, IconType.x2, IconType.y2)
    ;
    (static_TypeIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
    static_TypeIcon:setRenderTexture(static_TypeIcon:getBaseTexture())
  end
  do
    if (CppEnums.DialogButtonType).eDialogButton_Exchange == dialogButton._dialogButtonType then
      btn_Dialog:addInputEvent("Mouse_LUp", "PaGlobalFunc_MainDialog_Right_HandleClickedDialogButton(" .. id .. ",\"trade\"" .. ")")
      static_TypeIcon:SetShow(true)
      local IconType = (self._exchangIcon)[2]
      static_TypeIcon:ChangeTextureInfoName(IconType.texture)
      local x1, y1, x2, y2 = setTextureUV_Func(static_TypeIcon, IconType.x1, IconType.y1, IconType.x2, IconType.y2)
      ;
      (static_TypeIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
      static_TypeIcon:setRenderTexture(static_TypeIcon:getBaseTexture())
    end
    do
      local needThings = ""
      local isNeedThings = false
      local itemStaticWrapper = nil
      local selfPlayer = getSelfPlayer()
      local Wp = selfPlayer:getWp()
      local needWp = dialogButton:getNeedWp()
      if (CppEnums.DialogState).eDialogState_Talk == tostring(linkType) and needWp > 0 then
        needThings = needThings .. PAGetStringParam1(Defines.StringSheet_GAME, "DIALOG_NEED_WP", "wp", needWp) .. " (" .. PAGetString(Defines.StringSheet_GAME, "DIALOG_WP_GOT") .. "" .. Wp .. ") "
        isNeedThings = true
        if dialogButton:getNeedItemCount() > 0 then
          itemStaticWrapper = getItemEnchantStaticStatus(ItemEnchantKey(dialogButton:getNeedItemKey()))
          if itemStaticWrapper ~= nil then
            needThings = needThings .. itemStaticWrapper:getName() .. " " .. PAGetStringParam1(Defines.StringSheet_GAME, "DIALOG_NEEDCOUNT", "item_count", tostring(dialogButton:getNeedItemCount()))
          end
        end
      else
        if dialogButton:getNeedItemCount() > 0 then
          itemStaticWrapper = getItemEnchantStaticStatus(ItemEnchantKey(dialogButton:getNeedItemKey()))
          if itemStaticWrapper ~= nil then
            needThings = needThings .. itemStaticWrapper:getName() .. " " .. PAGetStringParam1(Defines.StringSheet_GAME, "DIALOG_NEEDCOUNT", "item_count", tostring(dialogButton:getNeedItemCount()))
            isNeedThings = true
          end
        end
      end
      if dialogButton:getNeedItemKey() ~= (self._value).promiseTokenKey or isNeedThings then
        if dialogButton._invenPushable then
          textNeed_Dialog:SetShow(true)
          textNeed_Dialog:SetText(needThings)
        else
          textNeed_Dialog:SetShow(true)
          textNeed_Dialog:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PLAYER_INVENTORY_FULL"))
        end
      else
        if (CppEnums.DialogButtonType).eDialogButton_Knowledge == dialogButton._dialogButtonType then
          textNeed_Dialog:SetShow(true)
        end
      end
      if dialogButton._enable == false then
        btn_Dialog:SetMonoTone(true)
        btn_Dialog:SetIgnore(true)
      end
    end
  end
end

PaGlobalFunc_MainDialog_Right_List2EventControlCreateExchange = function(list_content, key)
  -- function num : 0_26 , upvalues : Panel_Dialog_Main_Right_Info
  local self = Panel_Dialog_Main_Right_Info
  local id = Int64toInt32(key)
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
    return 
  end
  local displayExchangeWrapper = dialogData:getCurrentDisplayExchangeWrapper()
  if displayExchangeWrapper == nil then
    return 
  end
  local StaticText_Before = (UI.getChildControl)(list_content, "StaticText_BeforeTemplete")
  local Static_Arrow = (UI.getChildControl)(list_content, "Static_ArrowTemplete")
  local StaticText_After = (UI.getChildControl)(list_content, "StaticText_AfterTemplete")
  StaticText_Before:SetTextMode((CppEnums.TextMode).eTextMode_Limit_AutoWrap)
  StaticText_Before:setLineCountByLimitAutoWrap(2)
  StaticText_After:SetTextMode((CppEnums.TextMode).eTextMode_Limit_AutoWrap)
  StaticText_After:setLineCountByLimitAutoWrap(2)
  StaticText_Before:setLocalizedStaticType((self._localize).localizedType)
  StaticText_Before:setLocalizedKey((self._localize).mainDialogLocalizedKey)
  StaticText_After:setLocalizedStaticType((self._localize).localizedType)
  StaticText_After:setLocalizedKey((self._localize).mainDialogLocalizedKey)
  local itemWrapperLua = displayExchangeWrapper:getItemExchangeByNpcStaticStatusWrapperAtIndex(id)
  if itemWrapperLua ~= nil then
    local needItemWrapperLua = itemWrapperLua:getNeedItemStaticStatusWrapper()
    local resultItemWrapperLua = itemWrapperLua:getToItemStaticStatusWrapper()
    if needItemWrapperLua ~= nil and resultItemWrapperLua ~= nil then
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

PaGlobalFunc_MainDialog_Right_HandleOnDialogButton = function(id)
  -- function num : 0_27 , upvalues : Panel_Dialog_Main_Right_Info
  local self = Panel_Dialog_Main_Right_Info
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._value).lastDialogButtonIndex = (self._value).currentDialogButtonIndex
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._value).currentDialogButtonIndex = id
  ;
  ((self._ui).list2_Dialog_List):requestUpdateByKey(toInt64(0, (self._value).currentDialogButtonIndex))
  if (self._value).lastDialogButtonIndex ~= -1 then
    ((self._ui).list2_Dialog_List):requestUpdateByKey(toInt64(0, (self._value).lastDialogButtonIndex))
  end
end

PaGlobalFunc_MainDialog_Right_HandleClickedDialogButton = function(index, type)
  -- function num : 0_28 , upvalues : Panel_Dialog_Main_Right_Info
  local self = Panel_Dialog_Main_Right_Info
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
    return 
  end
  local dlgBtnCnt = dialogData:getDialogButtonCount()
  if dlgBtnCnt <= 0 then
    _PA_LOG("�\128민구", "0일리�\128 없는�\176 발생�\168 확인 필요.")
    return 
  end
  if type == "trade" then
    self:HandleClickedDialogButton_Trade(index)
  else
    local dialogButton = dialogData:getDialogButtonAt(index)
    local linkType = dialogButton._linkType
    if (CppEnums.DialogButtonType).eDialogButton_CutScene == dialogButton._dialogButtonType and (CppEnums.DialogState).eDialogState_Talk == tostring(linkType) then
      FGlobal_SetIsCutScenePlay(true)
    end
    self:HandleClickedDialogButton_ShowData(index)
  end
end

PaGlobalFunc_MainDialog_Right_InteractionCheck = function()
  -- function num : 0_29 , upvalues : Panel_Dialog_Main_Right_Info
  local self = Panel_Dialog_Main_Right_Info
  local isShow = ((self._ui).static_RightBg):GetShow()
  if isShow == false then
    return 
  end
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
    return 
  end
  local dialogButtonCount = dialogData:getDialogButtonCount()
  if dialogButtonCount == 0 then
    return 
  end
  local enableDailogButtonIndex = nil
  for index = 0, dialogButtonCount - 1 do
    local dialogButton = dialogData:getDialogButtonAt(index)
    if dialogButton._enable == true then
      enableDailogButtonIndex = index
      break
    end
  end
  do
    if enableDailogButtonIndex == nil then
      return 
    end
    audioPostEvent_SystemUi(0, 0)
    PaGlobalFunc_MainDialog_Right_HandleClickedDialogButton(enableDailogButtonIndex)
  end
end

FromClient_InitMainDialog_Right = function()
  -- function num : 0_30 , upvalues : Panel_Dialog_Main_Right_Info
  local self = Panel_Dialog_Main_Right_Info
  self:initialize()
  self:Resize()
  registerEvent("onScreenResize", "FromClient_onScreenResize_MainDialog_Right")
end

FromClient_onScreenResize_MainDialog_Right = function()
  -- function num : 0_31 , upvalues : Panel_Dialog_Main_Right_Info
  local self = Panel_Dialog_Main_Right_Info
  self:Resize()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_InitMainDialog_Right")

