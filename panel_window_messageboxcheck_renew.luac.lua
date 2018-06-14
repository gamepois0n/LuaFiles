-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\messagebox\panel_window_messageboxcheck_renew.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
Panel_Win_Check:RegisterShowEventFunc(true, "MessageBoxCheck_ShowAni()")
Panel_Win_Check:RegisterShowEventFunc(false, "MessageBoxCheck_HideAni()")
Panel_Win_Check:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_A, "MessageBoxCheck.keyProcessEnter()")
Panel_Win_Check:SetShow(false, false)
Panel_Win_Check:setMaskingChild(true)
Panel_Win_Check:setGlassBackground(true)
local UI_TM = CppEnums.TextMode
local UI_PP = CppEnums.PAUIMB_PRIORITY
local UI_color = Defines.Color
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local staticText_Title = (UI.getChildControl)(Panel_Win_Check, "StaticText_Title")
local staticText_Desc = (UI.getChildControl)(Panel_Win_Check, "StaticText_Desc")
local radioButton_Me = (UI.getChildControl)(Panel_Win_Check, "RadioButton_Me")
local staticText_SilverIven = (UI.getChildControl)(radioButton_Me, "StaticText_SilverIven")
local staticText_SilverInInven = (UI.getChildControl)(radioButton_Me, "StaticText_SilverInInven")
local radioButton_All = (UI.getChildControl)(Panel_Win_Check, "RadioButton_All")
local staticText_SilverStorage = (UI.getChildControl)(radioButton_All, "StaticText_SilverStorage")
local staticText_SilverInStorage = (UI.getChildControl)(radioButton_All, "StaticText_SilverInStorage")
local button_OK_ConsoleUI = (UI.getChildControl)(Panel_Win_Check, "Button_OK_ConsoleUI")
local button_NO_ConsoleUI = (UI.getChildControl)(Panel_Win_Check, "Button_NO_ConsoleUI")
local button_Ok = (UI.getChildControl)(Panel_Win_Check, "Button_Ok")
local button_No = (UI.getChildControl)(Panel_Win_Check, "Button_No")
local globalButtonShowCount = 0
MessageBoxCheck = {}
local MessageCheckData = {title = nil, content = nil, functionApply = nil, functionCancel = nil, priority = UI_PP.PAUIMB_PRIORITY_LOW, clientMessage = nil, exitButton = true, isTimeCount = false, countTime = 10, timeString = nil, isStartTimer = nil, afterFunction = nil, isCancelClose = false}
local functionKeyUse = true
local list = nil
local elapsedTime = 0
local _currentMessageBoxCheckData = nil
setCurrentMessageCheckData = function(currentData, position)
  -- function num : 0_0 , upvalues : button_OK_ConsoleUI, button_NO_ConsoleUI, button_Ok, button_No, staticText_Title, staticText_Desc, UI_TM, globalButtonShowCount, _currentMessageBoxCheckData
  if currentData ~= nil then
    button_OK_ConsoleUI:SetShow(false)
    button_NO_ConsoleUI:SetShow(false)
    button_Ok:SetShow(false)
    button_No:SetShow(false)
    Panel_Win_Check:SetShow(true, false)
    Panel_Win_Check:SetScaleChild(1, 1)
    if currentData.title ~= nil then
      staticText_Title:SetText(currentData.title)
    end
    if currentData.content ~= nil then
      staticText_Desc:SetTextMode(UI_TM.eTextMode_AutoWrap)
      staticText_Desc:SetText(currentData.content)
    end
    local buttonShowCount = 0
    if currentData.functionApply ~= nil then
      if ToClient_isXBox == true then
        button_OK_ConsoleUI:SetShow(true)
      else
        button_Ok:SetShow(true)
      end
      buttonShowCount = buttonShowCount + 1
    end
    if currentData.functionCancel ~= nil then
      if ToClient_isXBox == true then
        button_NO_ConsoleUI:SetShow(true)
      else
        button_No:SetShow(true)
      end
      buttonShowCount = buttonShowCount + 1
    end
    if currentData.exitButton == true then
      globalButtonShowCount = buttonShowCount
      if buttonShowCount == 1 then
        button_OK_ConsoleUI:SetPosX(Panel_Win_Check:GetSizeX() / 2 - button_OK_ConsoleUI:GetSizeX() / 2 - (button_OK_ConsoleUI:GetTextSpan()).x / 2)
        button_NO_ConsoleUI:SetPosX(Panel_Win_Check:GetSizeX() / 2 - button_NO_ConsoleUI:GetSizeX() / 2 - (button_NO_ConsoleUI:GetTextSpan()).x / 2)
        button_Ok:SetHorizonCenter()
        button_No:SetHorizonCenter()
      else
        if buttonShowCount == 2 then
          button_OK_ConsoleUI:ComputePos()
          button_NO_ConsoleUI:ComputePos()
          button_Ok:ComputePos()
          button_No:ComputePos()
        else
          if buttonShowCount == 3 then
            _PA_LOG("mingu", "메시�\128�\144 buttonShowCount�\128 3개인 경우�\128 존재한다.")
            button_OK_ConsoleUI:ComputePos()
            button_NO_ConsoleUI:ComputePos()
            button_Ok:ComputePos()
            button_No:ComputePos()
          end
        end
      end
      _currentMessageBoxCheckData = currentData
    end
  end
end

-- DECOMPILER ERROR at PC142: Confused about usage of register: R24 in 'UnsetPending'

MessageBoxCheck.showMessageBox = function(MessageCheckData, position, keyUse)
  -- function num : 0_1 , upvalues : list, functionKeyUse, radioButton_Me, radioButton_All, staticText_SilverInStorage, staticText_SilverInInven, staticText_Desc
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
      radioButton_Me:SetCheck(true)
      radioButton_All:SetCheck(false)
    else
      radioButton_Me:SetCheck(false)
      radioButton_All:SetCheck(true)
    end
    staticText_SilverInStorage:SetShow(true)
    radioButton_All:SetShow(true)
  else
    radioButton_Me:SetCheck(true)
    radioButton_All:SetCheck(false)
    staticText_SilverInStorage:SetShow(false)
    radioButton_All:SetShow(false)
  end
  staticText_SilverInInven:SetText(makeDotMoney(myInvenMoney))
  staticText_SilverInStorage:SetText(makeDotMoney(warehouse_moneyFromNpcShop_s64()))
  staticText_Desc:ComputePos()
  messageBoxCheckComputePos()
end

messageBoxCheckComputePos = function()
  -- function num : 0_2 , upvalues : staticText_Title, staticText_Desc, button_OK_ConsoleUI, button_NO_ConsoleUI, button_Ok, button_No, radioButton_Me, radioButton_All, staticText_SilverInInven, staticText_SilverInStorage, globalButtonShowCount
  Panel_Win_Check:ComputePos()
  staticText_Title:ComputePos()
  staticText_Desc:ComputePos()
  button_OK_ConsoleUI:ComputePos()
  button_NO_ConsoleUI:ComputePos()
  button_Ok:ComputePos()
  button_No:ComputePos()
  radioButton_Me:ComputePos()
  radioButton_All:ComputePos()
  staticText_SilverInInven:ComputePos()
  staticText_SilverInStorage:ComputePos()
  if globalButtonShowCount == 1 then
    button_OK_ConsoleUI:SetPosX(Panel_Win_Check:GetSizeX() / 2 - button_OK_ConsoleUI:GetSizeX() / 2 - (button_OK_ConsoleUI:GetTextSpan()).x / 2)
    button_NO_ConsoleUI:SetPosX(Panel_Win_Check:GetSizeX() / 2 - button_OK_ConsoleUI:GetSizeX() / 2 - (button_NO_ConsoleUI:GetTextSpan()).x / 2)
    button_Ok:SetHorizonCenter()
    button_No:SetHorizonCenter()
  else
    if globalButtonShowCount == 2 then
      button_OK_ConsoleUI:ComputePos()
      button_NO_ConsoleUI:ComputePos()
      button_Ok:ComputePos()
      button_No:ComputePos()
    else
      if globalButtonShowCount == 3 then
        button_OK_ConsoleUI:ComputePos()
        button_NO_ConsoleUI:ComputePos()
        button_Ok:ComputePos()
        button_No:ComputePos()
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

-- DECOMPILER ERROR at PC166: Confused about usage of register: R24 in 'UnsetPending'

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

-- DECOMPILER ERROR at PC169: Confused about usage of register: R24 in 'UnsetPending'

MessageBoxCheck.isPopUp = function()
  -- function num : 0_6
  return Panel_Win_Check:IsShow()
end

-- DECOMPILER ERROR at PC174: Confused about usage of register: R24 in 'UnsetPending'

MessageBoxCheck.isCheck = function()
  -- function num : 0_7 , upvalues : radioButton_Me, radioButton_All
  local isMoneyWhereType = (CppEnums.ItemWhereType).eInventory
  if radioButton_Me:IsCheck() then
    isMoneyWhereType = (CppEnums.ItemWhereType).eInventory
  else
    if radioButton_All:IsCheck() then
      isMoneyWhereType = (CppEnums.ItemWhereType).eWarehouse
    else
      isMoneyWhereType = (CppEnums.ItemWhereType).eInventory
    end
  end
  return isMoneyWhereType
end

-- DECOMPILER ERROR at PC178: Confused about usage of register: R24 in 'UnsetPending'

MessageBoxCheck.isCurrentOpen = function(title)
  -- function num : 0_8 , upvalues : _currentMessageBoxCheckData
  if _currentMessageBoxCheckData ~= nil and _currentMessageBoxCheckData.title == title then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC183: Confused about usage of register: R24 in 'UnsetPending'

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

-- DECOMPILER ERROR at PC188: Confused about usage of register: R24 in 'UnsetPending'

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
  -- function num : 0_21 , upvalues : list, elapsedTime, staticText_Title
  if list == nil or list.data == nil or (list.data).isTimeCount == nil or (list.data).isStartTimer == false then
    return 
  end
  elapsedTime = elapsedTime + deltaTime
  do
    -- DECOMPILER ERROR at PC40: Unhandled construct in 'MakeBoolean' P1

    if elapsedTime < (list.data).countTime and (list.data).timeString ~= nil then
      local remainTime = (math.floor)((list.data).countTime - elapsedTime)
      staticText_Title:SetText(remainTime .. (list.data).timeString)
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

button_Ok:addInputEvent("Mouse_LUp", "messageBoxCheck_ApplyButtonUp()")
button_No:addInputEvent("Mouse_LUp", "messageBoxCheck_CancelButtonUp()")
button_OK_ConsoleUI:addInputEvent("Mouse_LUp", "messageBoxCheck_ApplyButtonUp()")
button_NO_ConsoleUI:addInputEvent("Mouse_LUp", "messageBoxCheck_CancelButtonUp()")
registerEvent("EventNotifyMessageCashAlert", "Event_MessageBoxCheck_NotifyMessage_CashAlert")
Panel_Win_Check:RegisterUpdateFunc("messageBoxCheck_UpdatePerFrame")

