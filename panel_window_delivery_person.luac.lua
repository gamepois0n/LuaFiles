-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\delivery\panel_window_delivery_person.luac 

-- params : ...
-- function num : 0
local deliveryForPerson = {_buttonClose = (UI.getChildControl)(Panel_Window_DeliveryForPerson, "Button_Close"), _buttonQuestion = (UI.getChildControl)(Panel_Window_DeliveryForPerson, "Button_Question"), _buttonGetOn = (UI.getChildControl)(Panel_Window_DeliveryForPerson, "Button_GetOn"), _comboBoxDest = (UI.getChildControl)(Panel_Window_DeliveryForPerson, "Combobox_Destination"), _comboBoxCarriage = (UI.getChildControl)(Panel_Window_DeliveryForPerson, "Combobox_Carriage"), _comboBoxSwapCharacter = (UI.getChildControl)(Panel_Window_DeliveryForPerson, "Combobox_Character"), _staticText_NoticeMsg = (UI.getChildControl)(Panel_Window_DeliveryForPerson, "StaticText_NoticeText"), _staticText_NoticeAlert = (UI.getChildControl)(Panel_Window_DeliveryForPerson, "StaticText_Alert"), _selectDestinationWaypointKey = -1, _selectDestCarriageKey = -1, _selectCharacterIndex = -1, 
_carriageList = {}
, _selectCharacterIndexPos = -1}
local changeDelayTime = -1
delivery_Person_UpdatePerFrame = function(deltaTime)
  -- function num : 0_0 , upvalues : changeDelayTime, deliveryForPerson
  if changeDelayTime > 0 then
    changeDelayTime = changeDelayTime - deltaTime
    local remainTime = (math.floor)(changeDelayTime)
    if prevTime ~= remainTime then
      if remainTime < 0 then
        remainTime = 0
      end
      prevTime = remainTime
      ;
      (deliveryForPerson._staticText_NoticeMsg):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "Lua_deliveryPerson_ChangeMsg", "changeTime", tostring(remainTime)))
      if prevTime <= 0 then
        changeDelayTime = -1
        ;
        (deliveryForPerson._staticText_NoticeMsg):SetText(PAGetString(Defines.StringSheet_GAME, "Lua_deliveryPerson_GoChange"))
      end
    end
  end
end

setPlayerDeliveryDelayTime = function(delayTime)
  -- function num : 0_1 , upvalues : deliveryForPerson, changeDelayTime
  if Panel_Window_DeliveryForPerson:GetShow() == false then
    return 
  end
  ;
  (deliveryForPerson._buttonGetOn):SetShow(false)
  ;
  (deliveryForPerson._staticText_NoticeMsg):SetShow(true)
  ;
  (deliveryForPerson._staticText_NoticeMsg):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "Lua_deliveryPerson_ChangeMsg", "changeTime", tostring(delayTime)))
  changeDelayTime = delayTime
end

deliveryForPerson.fillData = function()
  -- function num : 0_2 , upvalues : deliveryForPerson
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
  (deliveryForPerson._comboBoxDest):DeleteAllItem()
  local waypointKeyList = delivery_listWaypointKey(getCurrentWaypointKey(), true)
  if waypointKeyList == nil then
    return false
  end
  local size = waypointKeyList:size()
  for count = 1, size do
    (deliveryForPerson._comboBoxDest):AddItem((waypointKeyList:atPointer(count - 1)):getName())
  end
  ;
  (deliveryForPerson._comboBoxCarriage):DeleteAllItem()
  ;
  (deliveryForPerson._comboBoxSwapCharacter):DeleteAllItem()
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
      (deliveryForPerson._comboBoxSwapCharacter):AddItem(characterNameLv)
    else
      do
        do
          -- DECOMPILER ERROR at PC124: Confused about usage of register: R10 in 'UnsetPending'

          deliveryForPerson._selectCharacterIndexPos = idx
          -- DECOMPILER ERROR at PC125: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC125: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC125: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  return true
end

deliveryForPerson.resetData = function()
  -- function num : 0_3 , upvalues : deliveryForPerson
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  deliveryForPerson._selectDestinationWaypointKey = -1
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R0 in 'UnsetPending'

  deliveryForPerson._selectDestCarriageKey = -1
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

  deliveryForPerson._selectCharacterIndex = -1
  ;
  (deliveryForPerson._comboBoxDest):DeleteAllItem()
  ;
  (deliveryForPerson._comboBoxDest):SetText(PAGetString(Defines.StringSheet_RESOURCE, "DELIVERY_PERSON_SELECT_DESTINATION"))
  ;
  (deliveryForPerson._comboBoxCarriage):DeleteAllItem()
  ;
  (deliveryForPerson._comboBoxCarriage):SetText(PAGetString(Defines.StringSheet_RESOURCE, "DELIVERY_PERSON_SELECT_CARRIAGE"))
  ;
  (deliveryForPerson._comboBoxSwapCharacter):DeleteAllItem()
  ;
  (deliveryForPerson._comboBoxSwapCharacter):SetText(PAGetString(Defines.StringSheet_RESOURCE, "DELIVERY_PERSON_SELECT_CHANRACTER"))
end

panel_DeliveryForPorson_Show = function(show)
  -- function num : 0_4 , upvalues : deliveryForPerson
  if show == true then
    local rv = (deliveryForPerson.fillData)()
    if rv == false then
      return 
    end
  else
    do
      ;
      (deliveryForPerson.resetData)()
      ;
      (deliveryForPerson._staticText_NoticeMsg):SetShow(false)
      Panel_Window_DeliveryForPerson:SetShow(show)
    end
  end
end

click_DeliveryForPerson_Close = function()
  -- function num : 0_5 , upvalues : changeDelayTime, deliveryForPerson
  if changeDelayTime ~= -1 then
    sendGameDelayExitCancel()
  end
  changeDelayTime = -1
  panel_DeliveryForPorson_Show(false)
  ;
  (deliveryForPerson._buttonGetOn):SetShow(true)
end

click_DeliveryForPerson_GetOn = function()
  -- function num : 0_6 , upvalues : deliveryForPerson
  local talkerNpc = dialog_getTalker()
  if talkerNpc == nil then
    (UI.debugMessage)("nil talks")
  end
  if deliveryForPerson._selectDestinationWaypointKey == -1 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "Lua_deliveryPerson_NotDestination"))
    return 
  end
  if deliveryForPerson._selectDestCarriageKey == -1 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "Lua_deliveryPerson_SelectMove"))
    return 
  end
  if deliveryForPerson._selectCharacterIndex == -1 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "Lua_deliveryPerson_SelectCharacter"))
    return 
  end
  local characterData = getCharacterDataByIndex(deliveryForPerson._selectCharacterIndex)
  local classType = getCharacterClassType(characterData)
  if ToClient_IsCustomizeOnlyClass(classType) then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DELIVERY_PERSON_NOTCHANGE"))
    return 
  end
  if characterData == nil then
    return 
  end
  if characterData._level < 5 then
    NotifyDisplay(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GAMEEXIT_DONT_CHAGECHARACTER", "iLevel", 4))
    return 
  end
  local removeTime = getCharacterDataRemoveTime(deliveryForPerson._selectCharacterIndex)
  if removeTime ~= nil then
    NotifyDisplay(PAGetString(Defines.StringSheet_GAME, "GAMEEXIT_TEXT_CHARACTER_DELETE"))
    return 
  end
  local messageContent = PAGetStringParam2(Defines.StringSheet_RESOURCE, "DELIVERY_PERSON_READY_CHK", "now_character", (getSelfPlayer()):getName(), "change_character", getCharacterName(getCharacterDataByIndex(deliveryForPerson._selectCharacterIndex)))
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "Lua_deliveryPerson_Information"), content = messageContent, functionYes = DeliveryForPerson_YouSure, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

DeliveryForPerson_YouSure = function()
  -- function num : 0_7 , upvalues : deliveryForPerson
  deliveryPerson_SendReserve(deliveryForPerson._selectDestinationWaypointKey, deliveryForPerson._selectDestCarriageKey, (dialog_getTalker()):getActorKey())
end

click_DeliveryForPerson_Dest = function()
  -- function num : 0_8 , upvalues : deliveryForPerson
  (deliveryForPerson._comboBoxDest):ToggleListbox()
  local destList = (deliveryForPerson._comboBoxDest):GetListControl()
  destList:addInputEvent("Mouse_LUp", "click_DeliveryForPerson_DestList()")
end

click_DeliveryForPerson_DestList = function()
  -- function num : 0_9 , upvalues : deliveryForPerson
  local DestSelectIndex = (deliveryForPerson._comboBoxDest):GetSelectIndex()
  if DestSelectIndex == -1 then
    return 
  end
  local currentWaypointKey = getCurrentWaypointKey()
  local waypointKeyList = delivery_listWaypointKey(currentWaypointKey, true)
  local destWaypointKey = (waypointKeyList:atPointer(DestSelectIndex)):getWaypointKey()
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R4 in 'UnsetPending'

  deliveryForPerson._selectDestinationWaypointKey = destWaypointKey
  ;
  (deliveryForPerson._comboBoxDest):SetSelectItemIndex(DestSelectIndex)
  ;
  (deliveryForPerson._comboBoxDest):ToggleListbox()
  local carriageList = delivery_listCarriage(currentWaypointKey, deliveryForPerson._selectDestinationWaypointKey, true)
  if carriageList == nil then
    return 
  end
  local size = carriageList:size()
  ;
  (deliveryForPerson._comboBoxCarriage):DeleteAllItem()
  -- DECOMPILER ERROR at PC45: Confused about usage of register: R6 in 'UnsetPending'

  deliveryForPerson._carriageList = nil
  for ii = 0, size - 1 do
    local carriageData = carriageList:atPointer(ii)
    ;
    (deliveryForPerson._comboBoxCarriage):AddItem(carriageData:getName())
    -- DECOMPILER ERROR at PC63: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (deliveryForPerson._carriageList)[ii] = carriageData:getCharacterKeyRaw()
  end
end

on_DeliveryForPerson_DestList = function()
  -- function num : 0_10 , upvalues : deliveryForPerson
  local onSelectIndex = (deliveryForPerson._comboBoxDest):GetSelectIndex()
  if onSelectIndex == -1 then
    return 
  end
end

click_DeliveryForPerson_Carriage = function()
  -- function num : 0_11 , upvalues : deliveryForPerson
  (deliveryForPerson._comboBoxCarriage):ToggleListbox()
  local characterList = (deliveryForPerson._comboBoxCarriage):GetListControl()
  characterList:addInputEvent("Mouse_LUp", "click_DeliveryForPerson_CarriageList()")
end

click_DeliveryForPerson_CarriageList = function()
  -- function num : 0_12 , upvalues : deliveryForPerson
  local carriageSelectIndex = (deliveryForPerson._comboBoxCarriage):GetSelectIndex()
  ;
  (deliveryForPerson._comboBoxCarriage):SetSelectItemIndex(carriageSelectIndex)
  ;
  (deliveryForPerson._comboBoxCarriage):ToggleListbox()
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R1 in 'UnsetPending'

  deliveryForPerson._selectDestCarriageKey = (deliveryForPerson._carriageList)[carriageSelectIndex]
end

click_DeliveryForPerson_SwapCharacter = function()
  -- function num : 0_13 , upvalues : deliveryForPerson
  (deliveryForPerson._comboBoxSwapCharacter):ToggleListbox()
  local swapCharacterList = (deliveryForPerson._comboBoxSwapCharacter):GetListControl()
  swapCharacterList:addInputEvent("Mouse_LUp", "click_DeliveryForPerson_SwapCharacterList()")
end

click_DeliveryForPerson_SwapCharacterList = function()
  -- function num : 0_14 , upvalues : deliveryForPerson
  local characterSelectIndex = (deliveryForPerson._comboBoxSwapCharacter):GetSelectIndex()
  ;
  (deliveryForPerson._comboBoxSwapCharacter):SetSelectItemIndex(characterSelectIndex)
  ;
  (deliveryForPerson._comboBoxSwapCharacter):ToggleListbox()
  if deliveryForPerson._selectCharacterIndexPos <= characterSelectIndex then
    characterSelectIndex = characterSelectIndex + 1
  end
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

  deliveryForPerson._selectCharacterIndex = characterSelectIndex
end

deliveryForPersonChangeCharacter = function()
  -- function num : 0_15 , upvalues : deliveryForPerson
  if deliveryForPerson._selectCharacterIndex == -1 then
    return 
  end
  local rv = swapCharacter_Select(deliveryForPerson._selectCharacterIndex, true)
  if rv == false then
    return 
  end
end

local initialize = function()
  -- function num : 0_16 , upvalues : deliveryForPerson
  (deliveryForPerson._buttonClose):addInputEvent("Mouse_LUp", "click_DeliveryForPerson_Close()")
  ;
  (deliveryForPerson._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"DeliveryPerson\" )")
  ;
  (deliveryForPerson._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"DeliveryPerson\", \"true\")")
  ;
  (deliveryForPerson._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"DeliveryPerson\", \"false\")")
  ;
  (deliveryForPerson._buttonGetOn):addInputEvent("Mouse_LUp", "click_DeliveryForPerson_GetOn()")
  ;
  (deliveryForPerson._comboBoxDest):addInputEvent("Mouse_LUp", "click_DeliveryForPerson_Dest()")
  ;
  (deliveryForPerson._comboBoxCarriage):addInputEvent("Mouse_LUp", "click_DeliveryForPerson_Carriage()")
  ;
  (deliveryForPerson._comboBoxSwapCharacter):addInputEvent("Mouse_LUp", "click_DeliveryForPerson_SwapCharacter()")
  registerEvent("EventDeliveryForPersonChangeCharacter", "deliveryForPersonChangeCharacter()")
  registerEvent("EventGameExitDelayTime", "setPlayerDeliveryDelayTime")
  Panel_Window_DeliveryForPerson:RegisterUpdateFunc("delivery_Person_UpdatePerFrame")
end

initialize()

