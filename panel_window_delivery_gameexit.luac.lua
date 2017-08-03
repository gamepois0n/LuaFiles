-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\delivery\panel_window_delivery_gameexit.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local deliveryForGameExit = {_buttonClose = (UI.getChildControl)(Panel_Window_DeliveryForGameExit, "Button_Close"), _buttonGetOn = (UI.getChildControl)(Panel_Window_DeliveryForGameExit, "Button_GetOn"), _comboBoxDest = (UI.getChildControl)(Panel_Window_DeliveryForGameExit, "Combobox_Destination"), _comboBoxSwapCharacter = (UI.getChildControl)(Panel_Window_DeliveryForGameExit, "Combobox_Character"), _panelBg = (UI.getChildControl)(Panel_Window_DeliveryForGameExit, "Static_Sample_Background"), _bg = (UI.getChildControl)(Panel_Window_DeliveryForGameExit, "Static_BG"), _staticText_NoticeMsg = (UI.getChildControl)(Panel_Window_DeliveryForGameExit, "StaticText_NoticeText"), _staticText_NoticeAlert = (UI.getChildControl)(Panel_Window_DeliveryForGameExit, "StaticText_Alert"), _selectDestinationWaypointKey = -1, _selectDestCarriageKey = -1, _selectCharacterIndex = -1, _selectCharacterIndexPos = -1}
deliveryForGameExit.PanelResize_ByFontSize = function(self)
  -- function num : 0_0 , upvalues : UI_TM
  (self._staticText_NoticeAlert):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self._staticText_NoticeAlert):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_DELIVERYFORGAMEEXIT_ALERT"))
  local descSizeY = (self._staticText_NoticeAlert):GetTextSizeY()
  local bgSize = (math.max)((self._staticText_NoticeAlert):GetPosY() + descSizeY - 25, 140)
  ;
  (self._bg):SetSize((self._bg):GetSizeX(), bgSize)
  Panel_Window_DeliveryForGameExit:SetSize(Panel_Window_DeliveryForGameExit:GetSizeX(), (self._bg):GetPosY() + bgSize + 65)
  ;
  (self._panelBg):SetSize(Panel_Window_DeliveryForGameExit:GetSizeX(), Panel_Window_DeliveryForGameExit:GetSizeY())
  ;
  (self._buttonGetOn):SetPosY(Panel_Window_DeliveryForGameExit:GetSizeY() - (self._buttonGetOn):GetSizeY() - 10)
end

local changeDelayTime = -1
delivery_GameExit_UpdatePerFrame = function(deltaTime)
  -- function num : 0_1 , upvalues : changeDelayTime, deliveryForGameExit
  if changeDelayTime > 0 then
    changeDelayTime = changeDelayTime - deltaTime
    local remainTime = (math.floor)(changeDelayTime)
    if prevTime ~= remainTime then
      if remainTime < 0 then
        remainTime = 0
      end
      prevTime = remainTime
      ;
      (deliveryForGameExit._staticText_NoticeMsg):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "Lua_deliveryPerson_ChangeMsg", "changeTime", tostring(remainTime)))
      if prevTime <= 0 then
        changeDelayTime = -1
        ;
        (deliveryForGameExit._staticText_NoticeMsg):SetText(PAGetString(Defines.StringSheet_GAME, "Lua_deliveryPerson_GoChange"))
      end
    end
  end
end

setPlayerDeliveryDelayTime = function(delayTime)
  -- function num : 0_2 , upvalues : deliveryForGameExit, changeDelayTime
  if Panel_Window_DeliveryForGameExit:GetShow() == false then
    return 
  end
  ;
  (deliveryForGameExit._buttonGetOn):SetShow(false)
  ;
  (deliveryForGameExit._staticText_NoticeMsg):SetShow(true)
  if delayTime == 0 then
    (deliveryForGameExit._staticText_NoticeMsg):SetText(PAGetString(Defines.StringSheet_GAME, "Lua_deliveryPerson_GoChange"))
  else
    ;
    (deliveryForGameExit._staticText_NoticeMsg):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "Lua_deliveryPerson_ChangeMsg", "changeTime", tostring(delayTime)))
  end
  changeDelayTime = delayTime
end

deliveryForGameExit.fillData = function()
  -- function num : 0_3 , upvalues : deliveryForGameExit
  local selfProxy = getSelfPlayer()
  if selfProxy == nil then
    return false
  end
  if (selfProxy:get()):isTradingPvpable() == true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "Lua_deliveryPerson_TradingPvPAble"))
    return false
  end
  if toInt64(0, 0) < ((selfProxy:get()):getInventory()):getTradeItemCount() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "Lua_deliveryPerson_HaveTradeItem"))
    return false
  end
  local characterNo_64 = toInt64(0, 0)
  characterNo_64 = selfProxy:getCharacterNo_64()
  ;
  (deliveryForGameExit._comboBoxDest):DeleteAllItem()
  local deliveryPersonInfoList = ToClient_DeliveryPersonInfo()
  local deliverySize = deliveryPersonInfoList:size()
  if deliverySize < 0 then
    return 
  end
  for kk = 0, deliverySize - 1 do
    local deliveryPersonInfo = deliveryPersonInfoList:atPointer(kk)
    local destinationRegionInfo = deliveryPersonInfo:getRegionInfo()
    local regionInfoWrapper = getRegionInfoWrapper((destinationRegionInfo._regionKey):get())
    ;
    (deliveryForGameExit._comboBoxDest):AddItem(regionInfoWrapper:getAreaName())
  end
  ;
  (deliveryForGameExit._comboBoxSwapCharacter):DeleteAllItem()
  local count = getCharacterDataCount()
  for idx = 0, count - 1 do
    local characterData = getCharacterDataByIndex(idx)
    if characterData == nil then
      break
    end
    if characterNo_64 ~= characterData._characterNo_s64 then
      local strLevel = (string.format)("%d", characterData._level)
      local characterNameLv = PAGetStringParam2(Defines.StringSheet_GAME, "CHARACTER_SELECT_LV", "character_level", strLevel, "character_name", getCharacterName(characterData))
      ;
      (deliveryForGameExit._comboBoxSwapCharacter):AddItem(characterNameLv)
    else
      do
        do
          -- DECOMPILER ERROR at PC123: Confused about usage of register: R10 in 'UnsetPending'

          deliveryForGameExit._selectCharacterIndexPos = idx
          -- DECOMPILER ERROR at PC124: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC124: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC124: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  return true
end

deliveryForGameExit.resetData = function()
  -- function num : 0_4 , upvalues : deliveryForGameExit
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  deliveryForGameExit._selectDestinationWaypointKey = -1
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R0 in 'UnsetPending'

  deliveryForGameExit._selectDestCarriageKey = -1
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

  deliveryForGameExit._selectCharacterIndex = -1
  ;
  (deliveryForGameExit._comboBoxDest):DeleteAllItem()
  ;
  (deliveryForGameExit._comboBoxDest):SetText(PAGetString(Defines.StringSheet_RESOURCE, "DELIVERY_PERSON_SELECT_DESTINATION"))
  ;
  (deliveryForGameExit._comboBoxSwapCharacter):DeleteAllItem()
  ;
  (deliveryForGameExit._comboBoxSwapCharacter):SetText(PAGetString(Defines.StringSheet_RESOURCE, "DELIVERY_PERSON_SELECT_CHANRACTER"))
end

FGlobal_DeliveryForGameExit_Show = function(show)
  -- function num : 0_5 , upvalues : deliveryForGameExit
  if show == true then
    local rv = (deliveryForGameExit.fillData)()
    if rv == false then
      return 
    end
  else
    do
      ;
      (deliveryForGameExit.resetData)()
      ;
      (deliveryForGameExit._staticText_NoticeMsg):SetShow(false)
      Panel_Window_DeliveryForGameExit:SetShow(show)
    end
  end
end

click_DeliveryForGameExit_Close = function()
  -- function num : 0_6 , upvalues : changeDelayTime, deliveryForGameExit
  changeDelayTime = -1
  FGlobal_DeliveryForGameExit_Show(false)
  ;
  (deliveryForGameExit._buttonGetOn):SetShow(true)
end

click_DeliveryForGameExit_GetOn = function()
  -- function num : 0_7 , upvalues : deliveryForGameExit
  if deliveryForGameExit._selectDestinationWaypointKey == -1 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "Lua_deliveryPerson_NotDestination"))
    return 
  end
  if deliveryForGameExit._selectCharacterIndex == -1 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "Lua_deliveryPerson_SelectCharacter"))
    return 
  end
  local characterData = getCharacterDataByIndex(deliveryForGameExit._selectCharacterIndex)
  if characterData == nil then
    return 
  end
  local classType = getCharacterClassType(characterData)
  if ToClient_IsCustomizeOnlyClass(classType) then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DELIVERY_PERSON_NOTCHANGE"))
    return 
  end
  if characterData._level < 5 then
    NotifyDisplay(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GAMEEXIT_DONT_CHAGECHARACTER", "iLevel", 4))
    return 
  end
  local removeTime = getCharacterDataRemoveTime(deliveryForGameExit._selectCharacterIndex)
  if removeTime ~= nil then
    NotifyDisplay(PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_CHARACTER_DELETE"))
    return 
  end
  local preText = ""
  local serverUtc64 = getServerUtc64()
  if (characterData._arrivalRegionKey):get() ~= 0 and serverUtc64 < characterData._arrivalTime then
    preText = PAGetString(Defines.StringSheet_GAME, "Lua_deliveryPerson_SelectPcDelivery2") .. "\n"
  end
  local messageContent = preText .. PAGetStringParam2(Defines.StringSheet_RESOURCE, "DELIVERY_PERSON_READY_CHK", "now_character", (getSelfPlayer()):getName(), "change_character", getCharacterName(getCharacterDataByIndex(deliveryForGameExit._selectCharacterIndex)))
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "Lua_deliveryPerson_Information"), content = messageContent, functionYes = DeliveryForGameExit_YouSure, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

DeliveryForGameExit_YouSure = function()
  -- function num : 0_8 , upvalues : deliveryForGameExit
  deliveryPerson_SendReserve(deliveryForGameExit._selectDestinationWaypointKey)
end

click_DeliveryForGameExit_Dest = function()
  -- function num : 0_9 , upvalues : deliveryForGameExit
  (deliveryForGameExit._comboBoxDest):ToggleListbox()
  local destList = (deliveryForGameExit._comboBoxDest):GetListControl()
  destList:addInputEvent("Mouse_LUp", "click_DeliveryForGameExit_DestList()")
end

click_DeliveryForGameExit_DestList = function()
  -- function num : 0_10 , upvalues : deliveryForGameExit
  local destSelectIndex = (deliveryForGameExit._comboBoxDest):GetSelectIndex()
  if destSelectIndex == -1 then
    return 
  end
  local deliveryPersonInfoList = ToClient_DeliveryPersonInfo()
  local deliveryPersonInfo = deliveryPersonInfoList:atPointer(destSelectIndex)
  local destRegionInfo = deliveryPersonInfo:getRegionInfo()
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R4 in 'UnsetPending'

  deliveryForGameExit._selectDestinationWaypointKey = (destRegionInfo._regionKey):get()
  ;
  (deliveryForGameExit._comboBoxDest):SetSelectItemIndex(destSelectIndex)
  ;
  (deliveryForGameExit._comboBoxDest):ToggleListbox()
end

on_DeliveryForGameExit_DestList = function()
  -- function num : 0_11 , upvalues : deliveryForGameExit
  local onSelectIndex = (deliveryForGameExit._comboBoxDest):GetSelectIndex()
  if onSelectIndex == -1 then
    return 
  end
end

click_DeliveryForGameExit_SwapCharacter = function()
  -- function num : 0_12 , upvalues : deliveryForGameExit
  (deliveryForGameExit._comboBoxSwapCharacter):ToggleListbox()
  local swapCharacterList = (deliveryForGameExit._comboBoxSwapCharacter):GetListControl()
  swapCharacterList:addInputEvent("Mouse_LUp", "click_DeliveryForGameExit_SwapCharacterList()")
end

click_DeliveryForGameExit_SwapCharacterList = function()
  -- function num : 0_13 , upvalues : deliveryForGameExit
  local characterSelectIndex = (deliveryForGameExit._comboBoxSwapCharacter):GetSelectIndex()
  ;
  (deliveryForGameExit._comboBoxSwapCharacter):SetSelectItemIndex(characterSelectIndex)
  ;
  (deliveryForGameExit._comboBoxSwapCharacter):ToggleListbox()
  if deliveryForGameExit._selectCharacterIndexPos <= characterSelectIndex then
    characterSelectIndex = characterSelectIndex + 1
  end
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

  deliveryForGameExit._selectCharacterIndex = characterSelectIndex
end

deliveryForGameExitChangeCharacter = function()
  -- function num : 0_14 , upvalues : deliveryForGameExit
  if deliveryForGameExit._selectCharacterIndex == -1 then
    return 
  end
  local rv = swapCharacter_Select(deliveryForGameExit._selectCharacterIndex, true)
  if rv == false then
    return 
  end
end

local initialize = function()
  -- function num : 0_15 , upvalues : deliveryForGameExit
  (deliveryForGameExit._buttonClose):addInputEvent("Mouse_LUp", "click_DeliveryForGameExit_Close()")
  ;
  (deliveryForGameExit._buttonGetOn):addInputEvent("Mouse_LUp", "click_DeliveryForGameExit_GetOn()")
  ;
  (deliveryForGameExit._comboBoxDest):addInputEvent("Mouse_LUp", "click_DeliveryForGameExit_Dest()")
  ;
  (deliveryForGameExit._comboBoxSwapCharacter):addInputEvent("Mouse_LUp", "click_DeliveryForGameExit_SwapCharacter()")
  registerEvent("EventDeliveryForPersonChangeCharacter", "deliveryForGameExitChangeCharacter()")
  registerEvent("EventGameExitDelayTime", "setPlayerDeliveryDelayTime")
  Panel_Window_DeliveryForGameExit:RegisterUpdateFunc("delivery_GameExit_UpdatePerFrame")
end

initialize()
deliveryForGameExit:PanelResize_ByFontSize()

