Panel_Window_PetFood_Renew:SetShow(false)
Panel_Window_PetFood_Renew:ignorePadSnapMoveToOtherPanel()
local petFood = {
  _ui = {
    _static_MainTitleBG = UI.getChildControl(Panel_Window_PetFood_Renew, "Static_MainTitleBG"),
    _static_SubFrameBG = UI.getChildControl(Panel_Window_PetFood_Renew, "Static_SubFrameBG"),
    _static_BottomKeyBG = UI.getChildControl(Panel_Window_PetFood_Renew, "Static_BottomKeyBG"),
    _static_ItemSlots = {}
  },
  _config = {
    _slotConfig = {createIcon = true, createCount = true},
    _feedStaticItemCount = ToClient_Pet_GetFeedStaticItemCount(),
    _startX = 45,
    _startY = 106,
    _gapX = 50
  },
  _selectItemIndex,
  _feedingPetIndex,
  _isFeedAll
}
function petFood:initialize()
  self:initControl()
  self:createControl()
  self:setPosition()
  self._selectItemIndex = -1
  self._feedingPetIndex = -1
  self._isFeedAll = false
end
function petFood:initControl()
  local petInfoUI = self._ui
  petInfoUI._static_FoodDesc = UI.getChildControl(petInfoUI._static_SubFrameBG, "StaticText_FoodDesc")
  petInfoUI._static_FoodEmpty = UI.getChildControl(petInfoUI._static_SubFrameBG, "StaticText_NoFood")
  petInfoUI._static_ButtonTemplate = UI.getChildControl(petInfoUI._static_SubFrameBG, "Static_ItemSlotBg_Template")
  petInfoUI._static_ButtonTemplate:SetShow(false)
  petInfoUI._static_templateSlot = UI.getChildControl(petInfoUI._static_ButtonTemplate, "Static_ItemIcon")
  petInfoUI._static_Feed = UI.getChildControl(petInfoUI._static_BottomKeyBG, "StaticText_Feed_ConsoleUI")
  petInfoUI._static_Cancle = UI.getChildControl(petInfoUI._static_BottomKeyBG, "StaticText_Cancel_ConsoleUI")
  petInfoUI._static_FeedFull = UI.getChildControl(petInfoUI._static_BottomKeyBG, "StaticText_FeedAll_ConsoleUI")
  local UCT = CppEnums.PA_UI_CONTROL_TYPE
  petInfoUI._static_Feed:addInputEvent("Mouse_LUp", "FromClient_FeedItem()")
  petInfoUI._static_Cancle:addInputEvent("Mouse_LUp", "FGlobal_PetFeedClose()")
  petInfoUI._static_FeedFull:addInputEvent("Mouse_LUp", "FromClient_FeedItem_Full()")
  Panel_Window_PetFood_Renew:registerPadEvent(__eConsoleUIPadEvent_Up_X, "FromClient_FeedItem_Full()")
  Panel_Window_PetFood_Renew:registerPadEvent(__eConsoleUIPadEvent_Up_A, "FromClient_FeedItem()")
end
function petFood:createControl()
  local petInfoUI = self._ui
  local UCT = CppEnums.PA_UI_CONTROL_TYPE
  for i = 0, self._config._feedStaticItemCount - 1 do
    local info = {}
    info._button = UI.createControl(UCT.PA_UI_CONTROL_RADIOBUTTON, petInfoUI._static_SubFrameBG, "sealButton_" .. i)
    CopyBaseProperty(petInfoUI._static_ButtonTemplate, info._button)
    local itemSlot = {}
    SlotItem.new(itemSlot, "Item_Slot_" .. i, i, info._button, self._config._slotConfig)
    itemSlot:createChild()
    local slotConfig = self._config
    info._button:SetPosX(slotConfig._startX + slotConfig._gapX * i)
    info._button:SetPosY(slotConfig._startY)
    info._button:addInputEvent("Mouse_On", "HandleClicked_FeedItem(" .. i .. ")")
    info._slot = itemSlot
    info._button:SetShow(false)
    petInfoUI._static_ItemSlots[i] = info
  end
end
function petFood:setPosition()
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelSizeX = Panel_Window_PetFood_Renew:GetSizeX()
  local panelSizeY = Panel_Window_PetFood_Renew:GetSizeY()
  Panel_Window_PetFood_Renew:SetPosX(scrSizeX / 2 - panelSizeX / 2)
  Panel_Window_PetFood_Renew:SetPosY(scrSizeY / 2 - panelSizeY / 2)
end
function petFood:update()
  local petInfoUI = self._ui
  local userFeedItemCount = ToClient_Pet_GetFeedItemCount()
  if userFeedItemCount <= 0 then
    petInfoUI._static_FoodEmpty:SetShow(true)
    petInfoUI._static_FoodEmpty:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PET_FOOD_EMPTY"))
    petInfoUI._static_FeedFull:SetShow(false)
    petInfoUI._static_Feed:SetShow(false)
  else
    petInfoUI._static_FoodEmpty:SetShow(false)
    petInfoUI._static_Feed:SetShow(true)
    if true == self._isFeedAll then
      petInfoUI._static_FeedFull:SetShow(false)
    end
  end
  for i = 0, self._config._feedStaticItemCount - 1 do
    local targetSlot = petInfoUI._static_ItemSlots[i]
    if userFeedItemCount > i then
      local feedItem = ToClient_Pet_GetFeedItemByIndex(i)
      if not feedItem then
        return
      end
      local feedItemStatic = feedItem:getStaticStatus():get()
      targetSlot._slot.icon:ChangeTextureInfoNameAsync("icon/" .. getItemIconPath(feedItemStatic))
      targetSlot._slot.count:SetText(tostring(feedItem:getCount()))
      targetSlot._slot.count:SetShow(true)
      targetSlot._button:SetShow(true)
      targetSlot._button:SetCheck(false)
      if (-1 == self._selectItemIndex or userFeedItemCount <= self._selectItemIndex) and 0 == i then
        targetSlot._button:SetCheck(true)
        self._selectItemIndex = i
      elseif i == self._selectItemIndex then
        targetSlot._button:SetCheck(true)
      end
    else
      targetSlot._button:SetShow(false)
      targetSlot._button:SetCheck(false)
    end
  end
end
function petFood:useFeedOneItem()
  if self._selectItemIndex < 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PETLISTNEW_SELECTFOODALERT"))
    return
  end
  local petData = ToClient_getPetUnsealedDataByIndex(self._feedingPetIndex)
  local petNo = petData:getPcPetNo()
  ToClient_Pet_UseFeedItemByIndex(self._selectItemIndex, petNo)
end
function petFood:useFeedFullItem()
  if self._selectItemIndex < 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PETLISTNEW_SELECTFOODALERT"))
    return
  end
  local petData = ToClient_getPetUnsealedDataByIndex(self._feedingPetIndex)
  local petNo = petData:getPcPetNo()
  ToClient_Pet_UseFeedItemFullByIndex(self._selectItemIndex, petNo)
end
function petFood:useFeedItemToAll()
  if self._selectItemIndex < 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PETLISTNEW_SELECTFOODALERT"))
    return
  end
  ToClient_Pet_UseFeedItemFullAll(self._selectItemIndex)
end
function petFood:open(isFeedAll)
  local petInfoUI = self._ui
  ToClient_padSnapResetControl()
  self._isFeedAll = isFeedAll
  if true == isFeedAll then
    self._selectItemIndex = -1
    self._feedingPetIndex = -1
  end
  if Panel_Window_PetFood_Renew:GetShow() then
    Panel_Window_PetFood_Renew:SetShow(false)
  end
  Panel_Window_PetFood_Renew:SetShow(true)
  if true == isFeedAll then
    Panel_Window_PetFood_Renew:registerPadEvent(__eConsoleUIPadEvent_Up_A, "FromClient_FeedItem_ToAll()")
    Panel_Window_PetFood_Renew:registerPadEvent(__eConsoleUIPadEvent_Up_X, "")
    petInfoUI._static_Feed:addInputEvent("Mouse_LUp", "FromClient_FeedItem_ToAll()")
    petInfoUI._static_FeedFull:SetShow(false)
    petInfoUI._static_Feed:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_PETLISTNEW_FEEDINGALLBTN"))
  else
    Panel_Window_PetFood_Renew:registerPadEvent(__eConsoleUIPadEvent_Up_A, "FromClient_FeedItem()")
    Panel_Window_PetFood_Renew:registerPadEvent(__eConsoleUIPadEvent_Up_X, "FromClient_FeedItem_Full()")
    petInfoUI._static_Feed:addInputEvent("Mouse_LUp", "FromClient_FeedItem()")
    petInfoUI._static_FeedFull:SetShow(true)
    petInfoUI._static_Feed:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_PETLISTNEW_FEEDONEBTN"))
  end
  petFood:update()
end
function petFood:close()
  self._selectItemIndex = -1
  self._feedingPetIndex = -1
  if not Panel_Window_PetFood_Renew:GetShow() then
    return
  end
  Panel_Window_PetFood_Renew:SetShow(false)
end
function petFood:registEventHandler()
  registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_PetFood")
  registerEvent("FromClient_InventoryUpdate", "FromClient_PetList_UpdateFood")
end
function FGlobal_PetFeedOpen(feedingPetIndex, isFeedAll)
  petFood._feedingPetIndex = feedingPetIndex
  petFood:open(isFeedAll)
end
function FGlobal_PetFeedClose()
  petFood:close()
end
function FromClient_luaLoadComplete_PetFood()
  petFood:initialize()
end
function FromClient_PetList_UpdateFood()
  if false == Panel_Window_PetFood_Renew:GetShow() then
    return
  end
  petFood:update()
end
function FromClient_FeedItem()
  petFood:useFeedOneItem()
end
function FromClient_FeedItem_Full()
  petFood:useFeedFullItem()
end
function FromClient_FeedItem_ToAll()
  petFood:useFeedItemToAll()
end
function HandleClicked_FeedItem(itemIndex)
  local self = petFood
  local petInfoUI = self._ui
  local feedItem = ToClient_Pet_GetFeedItemByIndex(itemIndex)
  if not feedItem then
    return
  end
  self._selectItemIndex = itemIndex
  local UCT = CppEnums.PA_UI_CONTROL_TYPE
  for i = 0, self._config._feedStaticItemCount - 1 do
    petInfoUI._static_ItemSlots[i]._button:SetCheck(false)
  end
  petInfoUI._static_ItemSlots[itemIndex]._button:SetCheck(true)
end
petFood:registEventHandler()
