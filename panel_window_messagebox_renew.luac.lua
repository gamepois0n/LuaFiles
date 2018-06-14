-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\messagebox\panel_window_messagebox_renew.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
Panel_Win_System:RegisterShowEventFunc(true, "MessageBox_ShowAni()")
Panel_Win_System:RegisterShowEventFunc(false, "MessageBox_HideAni()")
Panel_Win_System:registerPadUpEvent(__eCONSOLE_UI_INPUT_TYPE_A, "MessageBox.keyProcessEnter()")
Panel_Win_System:SetShow(false, false)
Panel_Win_System:setMaskingChild(true)
Panel_Win_System:setGlassBackground(true)
local UI_TM = CppEnums.TextMode
local UI_PP = CppEnums.PAUIMB_PRIORITY
local UI_color = Defines.Color
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local staticText_Title = (UI.getChildControl)(Panel_Win_System, "StaticText_Title")
local staticText_Desc = (UI.getChildControl)(Panel_Win_System, "StaticText_Desc")
local staticText_OK_ConsoleUI = (UI.getChildControl)(Panel_Win_System, "StaticText_OK_ConsoleUI")
local staticText_NO_ConsoleUI = (UI.getChildControl)(Panel_Win_System, "StaticText_NO_ConsoleUI")
local button_Ok = (UI.getChildControl)(Panel_Win_System, "Button_Ok")
local button_No = (UI.getChildControl)(Panel_Win_System, "Button_No")
local globalButtonShowCount = 0
MessageBox = {}
local MessageData = {title = nil, content = nil, functionYes = nil, functionApply = nil, functionNo = nil, functionIgnore = nil, functionCancel = nil, priority = UI_PP.PAUIMB_PRIORITY_LOW, clientMessage = nil, exitButton = true, isTimeCount = false, countTime = 10, timeString = nil, isStartTimer = nil, afterFunction = nil, isCancelClose = false}
local functionKeyUse = true
local functionYes, list = nil, nil
local elapsedTime = 0
local _currentMessageBoxData = nil
local Panel_Window_MessageBox_Info = {}
Panel_Window_MessageBox_Info.open = function(self, showAni)
  -- function num : 0_0
  if showAni == nil then
    Panel_Win_System:SetShow(true, false)
  else
    Panel_Win_System:SetShow(true, showAni)
  end
end

Panel_Window_MessageBox_Info.close = function(self, showAni)
  -- function num : 0_1
  if showAni == nil then
    Panel_Win_System:SetShow(false, false)
  else
    Panel_Win_System:SetShow(false, showAni)
  end
end

setCurrentMessageData = function(currentData, position)
  -- function num : 0_2 , upvalues : Panel_Window_MessageBox_Info, staticText_OK_ConsoleUI, staticText_NO_ConsoleUI, button_Ok, button_No, staticText_Title, staticText_Desc, globalButtonShowCount, _currentMessageBoxData
  local self = Panel_Window_MessageBox_Info
  if currentData ~= nil then
    staticText_OK_ConsoleUI:SetShow(false)
    staticText_NO_ConsoleUI:SetShow(false)
    button_Ok:SetShow(false)
    button_No:SetShow(false)
    self:open(false)
    Panel_Win_System:SetScaleChild(1, 1)
    if currentData.title ~= nil then
      staticText_Title:SetText(currentData.title)
    end
    if currentData.content ~= nil then
      staticText_Desc:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
      staticText_Desc:SetText(currentData.content)
      staticText_Desc:ComputePos()
    end
    local buttonShowCount = 0
    if currentData.functionYes ~= nil then
      if _ContentsGroup_RenewUI_MessageBox == true then
        staticText_OK_ConsoleUI:SetShow(true)
      else
        button_Ok:SetShow(true)
      end
      staticText_OK_ConsoleUI:SetText(PAGetString(Defines.StringSheet_RESOURCE, "MESSAGEBOX_BTN_YES_WITHOUT_KEY"))
      button_Ok:SetText(PAGetString(Defines.StringSheet_RESOURCE, "MESSAGEBOX_BTN_YES"))
      staticText_OK_ConsoleUI:addInputEvent("Mouse_LUp", "messageBox_YesButtonUp()")
      button_Ok:addInputEvent("Mouse_LUp", "messageBox_YesButtonUp()")
      buttonShowCount = buttonShowCount + 1
    else
      if currentData.functionApply ~= nil then
        if _ContentsGroup_RenewUI_MessageBox == true then
          staticText_OK_ConsoleUI:SetShow(true)
        else
          button_Ok:SetShow(true)
        end
        staticText_OK_ConsoleUI:SetText(PAGetString(Defines.StringSheet_RESOURCE, "MESSAGEBOX_BTN_APPLY_WITHOUT_KEY"))
        button_Ok:SetText(PAGetString(Defines.StringSheet_RESOURCE, "MESSAGEBOX_BTN_APPLY"))
        staticText_OK_ConsoleUI:addInputEvent("Mouse_LUp", "messageBox_ApplyButtonUp()")
        button_Ok:addInputEvent("Mouse_LUp", "messageBox_ApplyButtonUp()")
        buttonShowCount = buttonShowCount + 1
      end
    end
    if currentData.functionNo ~= nil then
      if _ContentsGroup_RenewUI_MessageBox == true then
        staticText_NO_ConsoleUI:SetShow(true)
      else
        button_No:SetShow(true)
      end
      staticText_NO_ConsoleUI:SetText(PAGetString(Defines.StringSheet_RESOURCE, "MESSAGEBOX_BTN_NO_WITHOUT_KEY"))
      button_No:SetText(PAGetString(Defines.StringSheet_RESOURCE, "MESSAGEBOX_BTN_NO"))
      staticText_NO_ConsoleUI:addInputEvent("Mouse_LUp", "messageBox_NoButtonUp()")
      button_No:addInputEvent("Mouse_LUp", "messageBox_NoButtonUp()")
      buttonShowCount = buttonShowCount + 1
    else
      if currentData.functionCancel ~= nil then
        if _ContentsGroup_RenewUI_MessageBox == true then
          staticText_NO_ConsoleUI:SetShow(true)
        else
          button_No:SetShow(true)
        end
        staticText_NO_ConsoleUI:SetText(PAGetString(Defines.StringSheet_RESOURCE, "MESSAGEBOX_BTN_CANCEL_WITHOUT_KEY"))
        button_No:SetText(PAGetString(Defines.StringSheet_RESOURCE, "MESSAGEBOX_BTN_CANCEL"))
        staticText_NO_ConsoleUI:addInputEvent("Mouse_LUp", "messageBox_CancelButtonUp()")
        button_No:addInputEvent("Mouse_LUp", "messageBox_CancelButtonUp()")
        buttonShowCount = buttonShowCount + 1
      end
    end
    if currentData.functionIgnore ~= nil then
      buttonShowCount = buttonShowCount + 1
    end
    if currentData.exitButton == true then
      globalButtonShowCount = buttonShowCount
      messageBoxComputePos()
      _currentMessageBoxData = currentData
    end
  end
end

messageBoxComputePos = function()
  -- function num : 0_3 , upvalues : staticText_Title, staticText_Desc, staticText_OK_ConsoleUI, staticText_NO_ConsoleUI, button_Ok, button_No, globalButtonShowCount
  Panel_Win_System:ComputePos()
  staticText_Title:ComputePos()
  staticText_Desc:ComputePos()
  staticText_OK_ConsoleUI:ComputePos()
  staticText_NO_ConsoleUI:ComputePos()
  button_Ok:ComputePos()
  button_No:ComputePos()
  local consoleSize = staticText_OK_ConsoleUI:GetSizeX() + (staticText_OK_ConsoleUI:GetTextSpan()).x
  if globalButtonShowCount == 1 then
    staticText_OK_ConsoleUI:SetPosX(Panel_Win_System:GetSizeX() / 2 - consoleSize / 2)
    staticText_NO_ConsoleUI:SetPosX(Panel_Win_System:GetSizeX() / 2 - consoleSize / 2)
    button_Ok:SetPosX(Panel_Win_System:GetSizeX() / 2 - button_Ok:GetSizeX() / 2)
    button_No:SetPosX(Panel_Win_System:GetSizeX() / 2 - button_No:GetSizeX() / 2)
  else
    if globalButtonShowCount == 2 then
      staticText_OK_ConsoleUI:SetPosX(Panel_Win_System:GetSizeX() / 2 - consoleSize - consoleSize / 2)
      staticText_NO_ConsoleUI:SetPosX(Panel_Win_System:GetSizeX() / 2 + consoleSize / 2)
      button_Ok:SetPosX(Panel_Win_System:GetSizeX() / 2 - button_Ok:GetSizeX() - 10)
      button_No:SetPosX(Panel_Win_System:GetSizeX() / 2 + 10)
    else
      if globalButtonShowCount == 3 then
        _PA_ASSERT(true, "messageBox에서 표시해야�\160 갯수�\128  " .. tostring(buttonShowCount) .. "개인 경우�\128 발생했습니다.")
        local buttonSize = nil
        if _ContentsGroup_RenewUI_MessageBox == true then
          buttonSize = staticText_OK_ConsoleUI:GetSizeX() + (staticText_OK_ConsoleUI:GetTextSpan()).x
        else
          buttonSize = button_Ok:GetSizeX()
        end
        staticText_OK_ConsoleUI:SetPosX(5)
        staticText_NO_ConsoleUI:SetPosX(buttonSize + 10)
        button_Ok:SetPosX(5)
        button_No:SetPosX(buttonSize + 10)
      end
    end
  end
end

postProcessMessageData = function()
  -- function num : 0_4 , upvalues : Panel_Window_MessageBox_Info, _currentMessageBoxData, list
  local self = Panel_Window_MessageBox_Info
  self:close(false)
  _currentMessageBoxData = nil
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R1 in 'UnsetPending'

  if list ~= nil and list.data ~= nil then
    list.data = nil
    list = list.next
    if list ~= nil then
      setCurrentMessageData(list.data)
    end
  end
end

allClearMessageData = function()
  -- function num : 0_5 , upvalues : Panel_Window_MessageBox_Info, list
  local self = Panel_Window_MessageBox_Info
  self:close(false)
  if list == nil then
    return 
  end
  while 1 do
    -- DECOMPILER ERROR at PC16: Confused about usage of register: R1 in 'UnsetPending'

    if list ~= nil and list.data ~= nil then
      list.data = nil
      list = list.next
      -- DECOMPILER ERROR at PC20: LeaveBlock: unexpected jumping out IF_THEN_STMT

      -- DECOMPILER ERROR at PC20: LeaveBlock: unexpected jumping out IF_STMT

    end
  end
end

-- DECOMPILER ERROR at PC138: Confused about usage of register: R20 in 'UnsetPending'

MessageBox.showMessageBox = function(MessageData, position, isGameExit, keyUse)
  -- function num : 0_6 , upvalues : list, functionKeyUse, button_Ok, button_No, staticText_OK_ConsoleUI, staticText_NO_ConsoleUI, elapsedTime
  if Panel_Win_System:GetShow() and MessageData.enablePriority == nil then
    return 
  end
  local Front = list
  local preList = nil
  functionKeyUse = keyUse
  if functionKeyUse ~= nil and functionKeyUse == false then
    button_Ok:SetText(PAGetString(Defines.StringSheet_RESOURCE, "MESSAGEBOX_BTN_YES_WITHOUT_KEY"))
    button_No:SetText(PAGetString(Defines.StringSheet_RESOURCE, "MESSAGEBOX_BTN_NO_WITHOUT_KEY"))
    staticText_OK_ConsoleUI:SetText(PAGetString(Defines.StringSheet_RESOURCE, "MESSAGEBOX_BTN_YES_WITHOUT_KEY"))
    staticText_NO_ConsoleUI:SetText(PAGetString(Defines.StringSheet_RESOURCE, "MESSAGEBOX_BTN_NO_WITHOUT_KEY"))
  else
    button_Ok:SetText(PAGetString(Defines.StringSheet_RESOURCE, "MESSAGEBOX_BTN_YES"))
    button_No:SetText(PAGetString(Defines.StringSheet_RESOURCE, "MESSAGEBOX_BTN_NO"))
    staticText_OK_ConsoleUI:SetText(PAGetString(Defines.StringSheet_RESOURCE, "MESSAGEBOX_BTN_YES_WITHOUT_KEY"))
    staticText_NO_ConsoleUI:SetText(PAGetString(Defines.StringSheet_RESOURCE, "MESSAGEBOX_BTN_NO_WITHOUT_KEY"))
  end
  while 1 do
    while 1 do
      if list == nil or MessageData.priority < (list.data).priority then
        list = {next = list, pre = preList, data = MessageData}
        if list.pre == nil then
          setCurrentMessageData(list.data, position)
        else
          -- DECOMPILER ERROR at PC111: Confused about usage of register: R6 in 'UnsetPending'

          ;
          (list.pre).next = list
          list = Front
        end
        -- DECOMPILER ERROR at PC114: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC114: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
    preList = list
    list = list.next
  end
  if MessageData.countTime ~= nil then
    elapsedTime = 0
  end
  messageBoxComputePos()
end

-- DECOMPILER ERROR at PC142: Confused about usage of register: R20 in 'UnsetPending'

MessageBox.doHaveMessageBoxData = function(title)
  -- function num : 0_7 , upvalues : list
  while list ~= nil and list.data ~= nil do
    if (list.data).title == title then
      return true
    end
    list = list.next
  end
  if (MessageBox.isCurrentOpen)(title) then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC145: Confused about usage of register: R20 in 'UnsetPending'

MessageBox.isPopUp = function()
  -- function num : 0_8
  return Panel_Win_System:IsShow()
end

-- DECOMPILER ERROR at PC149: Confused about usage of register: R20 in 'UnsetPending'

MessageBox.isCurrentOpen = function(title)
  -- function num : 0_9 , upvalues : _currentMessageBoxData
  if _currentMessageBoxData ~= nil and _currentMessageBoxData.title == title then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC154: Confused about usage of register: R20 in 'UnsetPending'

MessageBox.keyProcessEnter = function()
  -- function num : 0_10 , upvalues : functionKeyUse, list
  local enterkeyExecute = nil
  if not functionKeyUse and functionKeyUse ~= nil then
    return 
  end
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R1 in 'UnsetPending'

  if list ~= nil and (list.data).functionYes ~= nil then
    (list.data).isStartTimer = true
    enterkeyExecute = (list.data).functionYes
  end
  if list ~= nil and (list.data).functionApply ~= nil then
    enterkeyExecute = (list.data).functionApply
  end
  if list ~= nil and (list.data).functionYes == nil and (list.data).functionApply == nil then
    enterkeyExecute = nil
    return 
  end
  if list ~= nil and (list.data).clientMessage ~= nil then
    sendGameMessageParam0((list.data).clientMessage)
  end
  postProcessMessageData()
  if enterkeyExecute ~= nil then
    enterkeyExecute()
  end
end

-- DECOMPILER ERROR at PC159: Confused about usage of register: R20 in 'UnsetPending'

MessageBox.keyProcessEscape = function()
  -- function num : 0_11 , upvalues : functionKeyUse, list
  if not functionKeyUse and functionKeyUse ~= nil then
    return 
  end
  if list ~= nil and ((list.data).exitButton or (list.data).functionCancel or (list.data).functionNo) then
    messageBox_CloseButtonUp()
  end
end

MessageBox_ShowAni = function()
  -- function num : 0_12 , upvalues : UI_ANI_ADV, UI_color
  local aniInfo8 = Panel_Win_System:addColorAnimation(0, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo8:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo8:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo8:SetStartIntensity(5)
  aniInfo8:SetEndIntensity(1)
  local aniInfo1 = Panel_Win_System:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.1)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_Win_System:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Win_System:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_Win_System:addScaleAnimation(0.08, 0.14, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Win_System:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Win_System:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

MessageBox_HideAni = function()
  -- function num : 0_13
  Panel_Win_System:SetShow(false, false)
end

messageBox_YesButtonUp = function()
  -- function num : 0_14 , upvalues : list
  local functionYes = nil
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

  if list ~= nil and (list.data).functionYes ~= nil then
    (list.data).isStartTimer = true
    functionYes = (list.data).functionYes
  end
  if list ~= nil and (list.data).clientMessage ~= nil then
    sendGameMessageParam0((list.data).clientMessage)
  end
  postProcessMessageData()
  if functionYes ~= nil then
    functionYes()
  end
end

messageBox_ApplyButtonUp = function()
  -- function num : 0_15 , upvalues : list, elapsedTime
  local functionApply = nil
  if list ~= nil and (list.data).functionApply ~= nil then
    elapsedTime = 0
    functionApply = (list.data).functionApply
  end
  if list ~= nil and (list.data).clientMessage ~= nil then
    sendGameMessageParam0((list.data).clientMessage)
  end
  postProcessMessageData()
  if functionApply ~= nil then
    functionApply()
  end
end

messageBox_NoButtonUp = function()
  -- function num : 0_16 , upvalues : list
  local functionNo = nil
  if list ~= nil and (list.data).functionNo ~= nil then
    functionNo = (list.data).functionNo
  end
  postProcessMessageData()
  if functionNo ~= nil then
    functionNo()
  end
end

messageBox_IgnoreButtonUp = function()
  -- function num : 0_17 , upvalues : list
  local functionIgnore = nil
  if list ~= nil and (list.data).functionIgnore ~= nil then
    functionIgnore = (list.data).functionIgnore
  end
  postProcessMessageData()
  if functionIgnore ~= nil then
    functionIgnore()
  end
end

messageBox_CancelButtonUp = function()
  -- function num : 0_18 , upvalues : list, elapsedTime
  local functionCancel = nil
  if list ~= nil and (list.data).functionCancel ~= nil then
    elapsedTime = 0
    functionCancel = (list.data).functionCancel
  end
  postProcessMessageData()
  if functionCancel ~= nil then
    functionCancel()
  end
end

messageBox_CloseButtonUp = function()
  -- function num : 0_19 , upvalues : list
  local functionNo = nil
  if list ~= nil and (list.data).functionNo ~= nil then
    functionNo = (list.data).functionNo
  end
  local functionCancel = nil
  if list ~= nil and (list.data).functionCancel ~= nil then
    functionCancel = (list.data).functionCancel
  else
    if isCancelClose == true then
      MessageBox_Empty_function()
    end
  end
  postProcessMessageData()
  if functionNo ~= nil then
    functionNo()
  end
  if functionCancel ~= nil then
    functionCancel()
  end
end

Event_MessageBox_NotifyMessage_CashAlert = function(message)
  -- function num : 0_20 , upvalues : UI_PP
  local titleText = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY")
  local messageboxData = {title = titleText, content = message, functionApply = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW, exitButton = false}
  ;
  (MessageBox.showMessageBox)(messageboxData, "top")
end

Event_MessageBox_NotifyMessage = function(message)
  -- function num : 0_21 , upvalues : UI_PP
  local titleText = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY")
  local messageboxData = {title = titleText, content = message, functionApply = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW, exitButton = false}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

Event_MessageBox_NotifyMessage_FreeButton = function(message)
  -- function num : 0_22 , upvalues : UI_PP
  local messageboxData = {title = "", content = message, priority = UI_PP.PAUIMB_PRIORITY_1, exitButton = false}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

Event_MessageBox_NotifyMessage_With_ClientMessage = function(message, gameMessageType)
  -- function num : 0_23 , upvalues : UI_PP
  local titleText = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY")
  local messageboxData = {title = titleText, content = message, functionApply = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_1, clientMessage = gameMessageType, exitButton = false}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

MessageBox_Empty_function = function()
  -- function num : 0_24
end

messageBox_UpdatePerFrame = function(deltaTime)
  -- function num : 0_25 , upvalues : list, elapsedTime, staticText_Title
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
  -- function num : 0_26 , upvalues : _currentMessageBoxData
  if _currentMessageBoxData == nil then
    return 
  end
  setCurrentMessageData(_currentMessageBoxData)
end

registerEvent("EventNotifyMessage", "Event_MessageBox_NotifyMessage")
registerEvent("EventNotifyMessageFreeButton", "Event_MessageBox_NotifyMessage_FreeButton")
registerEvent("EventNotifyFreeButtonMessageProcess", "postProcessMessageData")
registerEvent("EventNotifyAllClearMessageData", "allClearMessageData")
registerEvent("EventNotifyMessageWithClientMessage", "Event_MessageBox_NotifyMessage_With_ClientMessage")
registerEvent("EventNotifyMessageCashAlert", "Event_MessageBox_NotifyMessage_CashAlert")
Panel_Win_System:RegisterUpdateFunc("messageBox_UpdatePerFrame")

