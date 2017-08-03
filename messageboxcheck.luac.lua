-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\messagebox\messageboxcheck.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
Panel_Win_Check:RegisterShowEventFunc(true, "MessageBoxCheck_ShowAni()")
Panel_Win_Check:RegisterShowEventFunc(false, "MessageBoxCheck_HideAni()")
Panel_Win_Check:SetShow(false, false)
Panel_Win_Check:setMaskingChild(true)
Panel_Win_Check:setGlassBackground(true)
local UI_TM = CppEnums.TextMode
local UI_PP = CppEnums.PAUIMB_PRIORITY
local UI_color = Defines.Color
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local textTitle = (UI.getChildControl)(Panel_Win_Check, "Static_Text_Title")
local textBG = (UI.getChildControl)(Panel_Win_Check, "Static_Text")
local textContent = (UI.getChildControl)(Panel_Win_Check, "StaticText_Content")
local buttonApply = (UI.getChildControl)(Panel_Win_Check, "Button_Apply")
local buttonCancel = (UI.getChildControl)(Panel_Win_Check, "Button_Cancel")
local buttonClose = (UI.getChildControl)(Panel_Win_Check, "Button_Close")
local iconInven = (UI.getChildControl)(Panel_Win_Check, "RadioButton_Icon_Inven")
local iconWarehouse = (UI.getChildControl)(Panel_Win_Check, "RadioButton_Icon_Warehouse")
local checkInven = (UI.getChildControl)(Panel_Win_Check, "Static_Text_InvenMoney")
local checkWarehouse = (UI.getChildControl)(Panel_Win_Check, "Static_Text_WarehouseMoney")
local globalButtonShowCount = 0
local group_0 = Panel_Win_Check:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
group_0:addControl(0, 0, 2, 1, iconInven)
group_0:addControl(1, 0, 2, 1, iconWarehouse)
MessageBoxCheck = {}
local MessageCheckData = {title = nil, content = nil, functionApply = nil, functionCancel = nil, priority = UI_PP.PAUIMB_PRIORITY_LOW, clientMessage = nil, exitButton = true, isTimeCount = false, countTime = 10, timeString = nil, isStartTimer = nil, afterFunction = nil, isCancelClose = false}
local functionKeyUse = true
local list = nil
local elapsedTime = 0
local _currentMessageBoxCheckData = nil
setCurrentMessageCheckData = function(currentData, position)
  -- function num : 0_0 , upvalues : buttonApply, buttonCancel, buttonClose, textTitle, textContent, UI_TM, globalButtonShowCount, _currentMessageBoxCheckData
  if currentData ~= nil then
    buttonApply:SetShow(false)
    buttonCancel:SetShow(false)
    buttonClose:SetShow(false)
    Panel_Win_Check:SetShow(true, false)
    Panel_Win_Check:SetScaleChild(1, 1)
    if currentData.title ~= nil then
      textTitle:SetText(currentData.title)
    end
    if currentData.content ~= nil then
      textContent:SetTextMode(UI_TM.eTextMode_AutoWrap)
      textContent:SetText(currentData.content)
      if position == "top" then
        textContent:SetTextVerticalTop()
        textContent:SetSpanSize(0, 37)
        textContent:ComputePos()
      else
        textContent:SetTextVerticalCenter()
        textContent:SetSpanSize(0, 37)
        textContent:ComputePos()
      end
    end
    local buttonShowCount = 0
    if currentData.functionApply ~= nil then
      buttonApply:SetShow(true)
      buttonShowCount = buttonShowCount + 1
    end
    if currentData.functionCancel ~= nil then
      buttonCancel:SetShow(true)
      buttonShowCount = buttonShowCount + 1
    end
    if currentData.exitButton == true then
      buttonClose:SetShow(true)
    end
    Panel_Win_Check:deleteConsoleUIGroup(1)
    local group_1 = Panel_Win_Check:addConsoleUIGroup(1, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
    globalButtonShowCount = buttonShowCount
    if buttonShowCount == 1 then
      buttonApply:SetPosX(Panel_Win_Check:GetSizeX() / 2 - buttonApply:GetSizeX() / 2)
      buttonCancel:SetPosX(Panel_Win_Check:GetSizeX() / 2 - buttonCancel:GetSizeX() / 2)
      if buttonApply:GetShow() then
        group_1:addControl(0, 0, 1, 1, buttonApply)
      end
      if buttonCancel:GetShow() then
        group_1:addControl(0, 0, 1, 1, buttonCancel)
      end
    else
      if buttonShowCount == 2 then
        buttonApply:SetPosX(Panel_Win_Check:GetSizeX() / 2 - 95)
        buttonCancel:SetPosX(Panel_Win_Check:GetSizeX() / 2 + 4)
        group_1:addControl(0, 0, 2, 1, buttonApply)
        group_1:addControl(1, 0, 2, 1, buttonCancel)
      else
        if buttonShowCount == 3 then
          local buttonSize = buttonApply:GetSizeX()
          buttonApply:SetPosX(5)
          buttonCancel:SetPosX(buttonSize * 2 + 15)
          group_1:addControl(0, 0, 2, 1, buttonApply)
          group_1:addControl(1, 0, 2, 1, buttonCancel)
        end
      end
    end
    do
      _currentMessageBoxCheckData = currentData
    end
  end
end

-- DECOMPILER ERROR at PC148: Confused about usage of register: R23 in 'UnsetPending'

MessageBoxCheck.showMessageBox = function(MessageCheckData, position, keyUse)
  -- function num : 0_1 , upvalues : list, functionKeyUse, iconInven, iconWarehouse, checkWarehouse, checkInven, textContent, textBG
  local Front = list
  local preList = nil
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local myInvenMoney = ((selfPlayer:get()):getInventory()):getMoney_s64()
  functionKeyUse = keyUse
  while 1 do
    while 1 do
      if list == nil or MessageCheckData.priority < (list.data).priority then
        list = {next = list, pre = preList, data = MessageCheckData}
        if list.pre == nil then
          setCurrentMessageCheckData(list.data, position)
        else
          -- DECOMPILER ERROR at PC42: Confused about usage of register: R7 in 'UnsetPending'

          ;
          (list.pre).next = list
          list = Front
        end
        -- DECOMPILER ERROR at PC45: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC45: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
    preList = list
    list = list.next
  end
  if ToClient_HasWareHouseFromNpc() then
    if toInt64(0, 0) == warehouse_moneyFromNpcShop_s64() then
      iconInven:SetCheck(true)
      iconWarehouse:SetCheck(false)
    else
      iconInven:SetCheck(false)
      iconWarehouse:SetCheck(true)
    end
    checkWarehouse:SetShow(true)
    iconWarehouse:SetShow(true)
  else
    iconInven:SetCheck(true)
    iconWarehouse:SetCheck(false)
    checkWarehouse:SetShow(false)
    iconWarehouse:SetShow(false)
  end
  checkInven:SetText(makeDotMoney(myInvenMoney))
  checkWarehouse:SetText(makeDotMoney(warehouse_moneyFromNpcShop_s64()))
  iconInven:SetEnableArea(0, 0, iconInven:GetTextSizeX() + checkInven:GetTextSizeX() + 100, iconInven:GetSizeY() + 3)
  iconWarehouse:SetEnableArea(0, 0, iconWarehouse:GetTextSizeX() + checkWarehouse:GetTextSizeX() + 100, iconWarehouse:GetSizeY() + 3)
  local textSizeY = textContent:GetTextSizeY() + 50
  local textBGSizeY = textContent:GetSizeY()
  local panelSizeY = textBG:GetSizeY()
  local resizePanelY = textSizeY + 90
  if textBGSizeY < textSizeY then
    textContent:SetTextVerticalTop()
    Panel_Win_Check:SetSize(350, resizePanelY)
    textBG:SetSize(334, textSizeY + 20)
  else
    Panel_Win_Check:SetSize(350, 220)
    textBG:SetSize(334, 153)
  end
  textContent:ComputePos()
  messageBoxCheckComputePos()
end

messageBoxCheckComputePos = function()
  -- function num : 0_2 , upvalues : textTitle, textContent, textBG, buttonApply, buttonCancel, buttonClose, iconInven, iconWarehouse, checkInven, checkWarehouse, globalButtonShowCount
  Panel_Win_Check:ComputePos()
  textTitle:ComputePos()
  textContent:ComputePos()
  textBG:ComputePos()
  buttonApply:ComputePos()
  buttonCancel:ComputePos()
  buttonClose:ComputePos()
  iconInven:ComputePos()
  iconWarehouse:ComputePos()
  checkInven:ComputePos()
  checkWarehouse:ComputePos()
  if globalButtonShowCount == 1 then
    buttonApply:SetPosX(Panel_Win_Check:GetSizeX() / 2 - buttonApply:GetSizeX() / 2)
    buttonCancel:SetPosX(Panel_Win_Check:GetSizeX() / 2 - buttonCancel:GetSizeX() / 2)
  else
    if globalButtonShowCount == 2 then
      buttonApply:SetPosX(Panel_Win_Check:GetSizeX() / 2 - 95)
      buttonCancel:SetPosX(Panel_Win_Check:GetSizeX() / 2 + 4)
    else
      if globalButtonShowCount == 3 then
        local buttonSize = buttonApply:GetSizeX()
        buttonApply:SetPosX(5)
        buttonCancel:SetPosX(buttonSize * 2 + 15)
      end
    end
  end
end

postProcessMessageCheckData = function()
  -- function num : 0_3 , upvalues : _currentMessageBoxCheckData, list
  Panel_Win_Check:SetShow(false, false)
  _currentMessageBoxCheckData = nil
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

  if list ~= nil and list.data ~= nil then
    list.data = nil
    list = list.next
    if list ~= nil then
      setCurrentMessageCheckData(list.data)
    end
  end
end

allClearMessageCheckData = function()
  -- function num : 0_4 , upvalues : list
  Panel_Win_Check:SetShow(false, false)
  if list == nil then
    return 
  end
  while 1 do
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

    if list ~= nil and list.data ~= nil then
      list.data = nil
      list = list.next
      -- DECOMPILER ERROR at PC21: LeaveBlock: unexpected jumping out IF_THEN_STMT

      -- DECOMPILER ERROR at PC21: LeaveBlock: unexpected jumping out IF_STMT

    end
  end
end

-- DECOMPILER ERROR at PC172: Confused about usage of register: R23 in 'UnsetPending'

MessageBoxCheck.doHaveMessageBoxData = function(title)
  -- function num : 0_5 , upvalues : list
  while list ~= nil and list.data ~= nil do
    if (list.data).title == title then
      return true
    end
    list = list.next
  end
  if (MessageBoxCheck.isCurrentOpen)(title) then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC175: Confused about usage of register: R23 in 'UnsetPending'

MessageBoxCheck.isPopUp = function()
  -- function num : 0_6
  return Panel_Win_Check:IsShow()
end

-- DECOMPILER ERROR at PC180: Confused about usage of register: R23 in 'UnsetPending'

MessageBoxCheck.isCheck = function()
  -- function num : 0_7 , upvalues : iconInven, iconWarehouse
  local isMoneyWhereType = (CppEnums.ItemWhereType).eInventory
  if iconInven:IsCheck() then
    isMoneyWhereType = (CppEnums.ItemWhereType).eInventory
  else
    if iconWarehouse:IsCheck() then
      isMoneyWhereType = (CppEnums.ItemWhereType).eWarehouse
    else
      isMoneyWhereType = (CppEnums.ItemWhereType).eInventory
    end
  end
  return isMoneyWhereType
end

-- DECOMPILER ERROR at PC184: Confused about usage of register: R23 in 'UnsetPending'

MessageBoxCheck.isCurrentOpen = function(title)
  -- function num : 0_8 , upvalues : _currentMessageBoxCheckData
  if _currentMessageBoxCheckData ~= nil and _currentMessageBoxCheckData.title == title then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC189: Confused about usage of register: R23 in 'UnsetPending'

MessageBoxCheck.keyProcessEnter = function()
  -- function num : 0_9 , upvalues : functionKeyUse, list
  if not functionKeyUse and functionKeyUse ~= nil then
    return 
  end
  if list ~= nil and (list.data).functionApply ~= nil then
    ((list.data).functionApply)()
  end
  if list ~= nil and (list.data).functionApply == nil then
    return 
  end
  if list ~= nil and (list.data).clientMessage ~= nil then
    sendGameMessageParam0((list.data).clientMessage)
  end
  postProcessMessageCheckData()
end

-- DECOMPILER ERROR at PC194: Confused about usage of register: R23 in 'UnsetPending'

MessageBoxCheck.keyProcessEscape = function()
  -- function num : 0_10 , upvalues : functionKeyUse, list
  if not functionKeyUse and functionKeyUse ~= nil then
    return 
  end
  if list ~= nil and ((list.data).exitButton or (list.data).functionCancel) then
    messageBoxCheck_CloseButtonUp()
  end
end

MessageBoxCheck_ShowAni = function()
  -- function num : 0_11 , upvalues : UI_ANI_ADV, UI_color
  local aniInfo8 = Panel_Win_Check:addColorAnimation(0, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo8:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo8:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo8:SetStartIntensity(5)
  aniInfo8:SetEndIntensity(1)
  local aniInfo1 = Panel_Win_Check:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.1)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_Win_Check:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Win_Check:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_Win_Check:addScaleAnimation(0.08, 0.14, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Win_Check:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Win_Check:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

MessageBoxCheck_HideAni = function()
  -- function num : 0_12
  Panel_Win_Check:SetShow(false, false)
end

messageBoxCheck_ApplyButtonUp = function()
  -- function num : 0_13 , upvalues : list, elapsedTime
  local functionApply = nil
  if list ~= nil and (list.data).functionApply ~= nil then
    elapsedTime = 0
    functionApply = (list.data).functionApply
  end
  if list ~= nil and (list.data).clientMessage ~= nil then
    sendGameMessageParam0((list.data).clientMessage)
  end
  postProcessMessageCheckData()
  if functionApply ~= nil then
    functionApply()
  end
end

messageBoxCheck_CancelButtonUp = function()
  -- function num : 0_14 , upvalues : list, elapsedTime
  local functionCancel = nil
  if list ~= nil and (list.data).functionCancel ~= nil then
    elapsedTime = 0
    functionCancel = (list.data).functionCancel
  end
  postProcessMessageCheckData()
  if functionCancel ~= nil then
    functionCancel()
  end
end

messageBoxCheck_CloseButtonUp = function()
  -- function num : 0_15 , upvalues : list
  local functionCancel = nil
  if list ~= nil and (list.data).functionCancel ~= nil then
    functionCancel = (list.data).functionCancel
  else
    if isCancelClose == true then
      MessageBoxCheck_Empty_function()
    end
  end
  postProcessMessageCheckData()
  if functionCancel ~= nil then
    functionCancel()
  end
end

Event_MessageBoxCheck_NotifyMessage_CashAlert = function(message)
  -- function num : 0_16 , upvalues : UI_PP
  local titleText = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY")
  local messageboxData = {title = titleText, content = message, functionApply = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW, exitButton = false}
  ;
  (MessageBoxCheck.showMessageBox)(messageboxData, "top")
end

Event_MessageBoxCheck_NotifyMessage = function(message)
  -- function num : 0_17 , upvalues : UI_PP
  local titleText = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY")
  local messageboxData = {title = titleText, content = message, functionApply = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW, exitButton = false}
  ;
  (MessageBoxCheck.showMessageBox)(messageboxData)
end

Event_MessageBox_NotifyMessage_FreeButton = function(message)
  -- function num : 0_18 , upvalues : UI_PP
  local messageboxData = {title = "", content = message, priority = UI_PP.PAUIMB_PRIORITY_1, exitButton = false}
  ;
  (MessageBoxCheck.showMessageBox)(messageboxData)
end

Event_MessageBox_NotifyMessage_With_ClientMessage = function(message, gameMessageType)
  -- function num : 0_19 , upvalues : UI_PP
  local titleText = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY")
  local messageboxData = {title = titleText, content = message, functionApply = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_1, clientMessage = gameMessageType, exitButton = false}
  ;
  (MessageBoxCheck.showMessageBox)(messageboxData)
end

MessageBoxCheck_Empty_function = function()
  -- function num : 0_20
end

messageBoxCheck_UpdatePerFrame = function(deltaTime)
  -- function num : 0_21 , upvalues : list, elapsedTime, textTitle
  if list == nil or list.data == nil or (list.data).isTimeCount == nil or (list.data).isStartTimer == false then
    return 
  end
  elapsedTime = elapsedTime + deltaTime
  do
    -- DECOMPILER ERROR at PC40: Unhandled construct in 'MakeBoolean' P1

    if elapsedTime < (list.data).countTime and (list.data).timeString ~= nil then
      local remainTime = (math.floor)((list.data).countTime - elapsedTime)
      textTitle:SetText(remainTime .. (list.data).timeString)
    end
    -- DECOMPILER ERROR at PC56: Confused about usage of register: R1 in 'UnsetPending'

    if (list.data).afterFunction ~= nil then
      (list.data).isTimeCount = false
      ;
      ((list.data).afterFunction)()
    end
  end
end

local postRestoreEvent = function()
  -- function num : 0_22 , upvalues : _currentMessageBoxCheckData
  if _currentMessageBoxCheckData == nil then
    return 
  end
  setCurrentMessageCheckData(_currentMessageBoxCheckData)
end

buttonApply:addInputEvent("Mouse_LUp", "messageBoxCheck_ApplyButtonUp()")
buttonCancel:addInputEvent("Mouse_LUp", "messageBoxCheck_CancelButtonUp()")
buttonClose:addInputEvent("Mouse_LUp", "messageBoxCheck_CloseButtonUp()")
registerEvent("EventNotifyMessageCashAlert", "Event_MessageBoxCheck_NotifyMessage_CashAlert")
Panel_Win_Check:RegisterUpdateFunc("messageBoxCheck_UpdatePerFrame")

