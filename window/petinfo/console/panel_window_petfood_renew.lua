Panel_Window_PetFood_Renew:SetShow(false)
local petFood = {
  _ui = {
    _static_MainTitleBG = UI.getChildControl(Panel_Window_PetFood_Renew, "Static_MainTitleBG"),
    _static_SubFrameBG = UI.getChildControl(Panel_Window_PetFood_Renew, "Static_SubFrameBG"),
    _static_BottomKeyBG = UI.getChildControl(Panel_Window_PetFood_Renew, "Static_BottomKeyBG"),
    _static_ItemSlots = {}
  },
  _config = {
    _feedStaticItemCount = ToClient_Pet_GetFeedStaticItemCount(),
    _startX = 45,
    _startY = 106,
    _gapX = 50
  },
  _selectItemIndex,
  _feedingPetIndex
}
function petFood:initialize()
  self:initControl()
  self:createControl()
  self:setPosition()
  self._selectItemIndex = -1
end
function petFood:initControl()
  local petInfoUI = self._ui
  petInfoUI._static_FoodDesc = UI.getChildControl(petInfoUI._static_SubFrameBG, "StaticText_FoodDesc")
  petInfoUI._static_ButtonTemplate = UI.getChildControl(petInfoUI._static_SubFrameBG, "Static_ItemSlotBg_Template")
  petInfoUI._static_ButtonTemplate:SetShow(false)
  petInfoUI._static_templateSlot = UI.getChildControl(petInfoUI._static_ButtonTemplate, "Static_ItemIcon")
  petInfoUI._static_Feed = UI.getChildControl(petInfoUI._static_BottomKeyBG, "StaticText_Feed_ConsoleUI")
  petInfoUI._static_Cancle = UI.getChildControl(petInfoUI._static_BottomKeyBG, "StaticText_Cancel_ConsoleUI")
  petInfoUI._static_FeedFull = UI.getChildControl(petInfoUI._static_BottomKeyBG, "StaticText_FeedAll_ConsoleUI")
  local UCT = CppEnums.PA_UI_CONTROL_TYPE
  petInfoUI._button_Feed = UI.createControl(UCT.PA_UI_CONTROL_RADIOBUTTON, petInfoUI._static_BottomKeyBG, "button_feed")
  CopyBaseProperty(petInfoUI._static_Feed, petInfoUI._button_Feed)
  petInfoUI._button_Feed:addInputEvent("Mouse_LUp", "FromClient_FeedItem()")
  petInfoUI._button_Cancle = UI.createControl(UCT.PA_UI_CONTROL_RADIOBUTTON, petInfoUI._static_BottomKeyBG, "button_cancle")
  CopyBaseProperty(petInfoUI._static_Cancle, petInfoUI._button_Cancle)
  petInfoUI._button_Cancle:addInputEvent("Mouse_LUp", "FGlobal_PetFeedClose()")
  petInfoUI._button_FeedFull = UI.createControl(UCT.PA_UI_CONTROL_RADIOBUTTON, petInfoUI._static_BottomKeyBG, "button_feedFull")
  CopyBaseProperty(petInfoUI._static_FeedFull, petInfoUI._button_FeedFull)
  petInfoUI._button_FeedFull:addInputEvent("Mouse_LUp", "FromClient_FeedItem_Full()")
  Panel_Window_PetFood_Renew:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_A, "FromClient_FeedItem_Full()")
  Panel_Window_PetFood_Renew:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_B, "FGlobal_PetFeedClose()")
  Panel_Window_PetFood_Renew:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_X, "FromClient_FeedItem()")
end
function petFood:createControl()
  local petInfoUI = self._ui
  local UCT = CppEnums.PA_UI_CONTROL_TYPE
  for i = 0, self._config._feedStaticItemCount - 1 do
    local info = {}
    info._button = UI.createControl(UCT.PA_UI_CONTROL_RADIOBUTTON, petInfoUI._static_SubFrameBG, "sealButton_" .. i)
    CopyBaseProperty(petInfoUI._static_ButtonTemplate, info._button)
    info._slot = UI.createControl(UCT.PA_UI_CONTROL_RADIOBUTTON, info._button, "sealSlot_" .. i)
    CopyBaseProperty(petInfoUI._static_templateSlot, info._slot)
    local slotConfig = self._config
    info._button:SetPosX(slotConfig._startX + slotConfig._gapX * i)
    info._button:SetPosY(slotConfig._startY)
    info._slot:addInputEvent("Mouse_LUp", "HandleClicked_FeedItem(" .. i .. ")")
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
  for i = 0, self._config._feedStaticItemCount - 1 do
    local targetSlot = petInfoUI._static_ItemSlots[i]
    if i < userFeedItemCount then
      local feedItem = ToClient_Pet_GetFeedItemByIndex(i)
      if not feedItem then
        return
      end
      local feedItemStatic = feedItem:getStaticStatus():get()
      targetSlot._slot:ChangeTextureInfoNameAsync("icon/" .. getItemIconPath(feedItemStatic))
      targetSlot._button:SetShow(true)
    else
      targetSlot._button:SetShow(false)
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
  ToClient_Pet_UseFeedItemByIndex(self.selectItemIndex, petNo)
end
function petFood:useFeedFullItem()
  if self._selectItemIndex < 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PETLISTNEW_SELECTFOODALERT"))
    return
  end
  local petData = ToClient_getPetUnsealedDataByIndex(self._feedingPetIndex)
  local petNo = petData:getPcPetNo()
  ToClient_Pet_UseFeedItemFullByIndex(self.selectItemIndex, petNo)
end
function petFood:open()
  Panel_Window_PetFood_Renew:SetShow(true)
  petFood:update()
end
function petFood:close()
  if not Panel_Window_PetFood_Renew:GetShow() then
    return
  end
  Panel_Window_PetFood_Renew:SetShow(false)
end
function petFood:registEventHandler()
  registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_PetFood")
  registerEvent("FromClient_InventoryUpdate", "FromClient_PetList_UpdateFood")
end
function FGlobal_PetFeedOpen(feedingPetIndex)
  petFood._feedingPetIndex = feedingPetIndex
  petFood.open()
end
function FGlobal_PetFeedClose()
  petFood.close()
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
function HandleClicked_FeedItem(itemIndex)
  local self = petFood
  local petInfoUI = self._ui
  local feedItem = ToClient_Pet_GetFeedItemByIndex(itemIndex)
  if not feedItem then
    return
  end
  self._selectItemIndex = itemIndex
end
petFood:registEventHandler()
