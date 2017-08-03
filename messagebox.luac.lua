-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\messagebox\messagebox.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
Panel_Win_System:RegisterShowEventFunc(true, "MessageBox_ShowAni()")
Panel_Win_System:RegisterShowEventFunc(false, "MessageBox_HideAni()")
Panel_Win_System:SetShow(false, false)
Panel_Win_System:setMaskingChild(true)
Panel_Win_System:setGlassBackground(true)
local UI_TM = CppEnums.TextMode
local UI_PP = CppEnums.PAUIMB_PRIORITY
local UI_color = Defines.Color
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local textTitle = (UI.getChildControl)(Panel_Win_System, "Static_Text_Title")
local textBG = (UI.getChildControl)(Panel_Win_System, "Static_Text")
local textContent = (UI.getChildControl)(Panel_Win_System, "StaticText_Content")
local buttonYes = (UI.getChildControl)(Panel_Win_System, "Button_Yes")
local buttonApply = (UI.getChildControl)(Panel_Win_System, "Button_Apply")
local buttonNo = (UI.getChildControl)(Panel_Win_System, "Button_No")
local buttonIgnore = (UI.getChildControl)(Panel_Win_System, "Button_Ignore")
local buttonCancel = (UI.getChildControl)(Panel_Win_System, "Button_Cancel")
local buttonClose = (UI.getChildControl)(Panel_Win_System, "Button_Close")
local blockBG = (UI.getChildControl)(Panel_Win_System, "Static_BlockBG")
local static_Beginner_BG = (UI.getChildControl)(Panel_Win_System, "Static_Beginner_BG")
local static_BeginnerTitleBG = (UI.getChildControl)(Panel_Win_System, "Static_BeginnerTitleBG")
local staticText_BeginnerTxt1 = (UI.getChildControl)(Panel_Win_System, "StaticText_BeginnerTxt1")
local staticText_BeginnerTxt2 = (UI.getChildControl)(Panel_Win_System, "StaticText_BeginnerTxt2")
local globalButtonShowCount = 0
local buttonTextSizeX = buttonYes:GetTextSizeX()
buttonTextSizeX = (math.max)(buttonTextSizeX, buttonApply:GetTextSizeX())
buttonTextSizeX = (math.max)(buttonTextSizeX, buttonNo:GetTextSizeX())
buttonTextSizeX = (math.max)(buttonTextSizeX, buttonIgnore:GetTextSizeX())
buttonTextSizeX = (math.max)(buttonTextSizeX, buttonCancel:GetTextSizeX())
buttonTextSizeX = (math.min)(buttonTextSizeX, 150)
if buttonYes:GetSizeX() < buttonTextSizeX + 20 then
  buttonYes:SetSize(buttonTextSizeX + 20, buttonYes:GetSizeY())
  buttonApply:SetSize(buttonTextSizeX + 20, buttonApply:GetSizeY())
  buttonNo:SetSize(buttonTextSizeX + 20, buttonNo:GetSizeY())
  buttonIgnore:SetSize(buttonTextSizeX + 20, buttonIgnore:GetSizeY())
  buttonCancel:SetSize(buttonTextSizeX + 20, buttonCancel:GetSizeY())
end
MessageBox = {}
local MessageData = {title = nil, content = nil, functionYes = nil, functionApply = nil, functionNo = nil, functionIgnore = nil, functionCancel = nil, priority = UI_PP.PAUIMB_PRIORITY_LOW, clientMessage = nil, exitButton = true, isTimeCount = false, countTime = 10, timeString = nil, isStartTimer = nil, afterFunction = nil, isCancelClose = false}
local functionKeyUse = true
local functionYes, list = nil, nil
local elapsedTime = 0
local _currentMessageBoxData = nil
setCurrentMessageData = function(currentData, position, isConsoleLockFocus)
  -- function num : 0_0 , upvalues : buttonYes, buttonApply, buttonNo, buttonIgnore, buttonCancel, buttonClose, textTitle, textContent, UI_TM, globalButtonShowCount, _currentMessageBoxData
  if currentData ~= nil then
    buttonYes:SetShow(false)
    buttonApply:SetShow(false)
    buttonNo:SetShow(false)
    buttonIgnore:SetShow(false)
    buttonCancel:SetShow(false)
    buttonClose:SetShow(false)
    Panel_Win_System:SetShow(true, false)
    Panel_Win_System:SetScaleChild(1, 1)
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
    if currentData.functionYes ~= nil then
      buttonYes:SetShow(true)
      buttonShowCount = buttonShowCount + 1
    else
      if currentData.functionApply ~= nil then
        buttonApply:SetShow(true)
        buttonShowCount = buttonShowCount + 1
      end
    end
    if currentData.functionNo ~= nil then
      buttonNo:SetShow(true)
      buttonShowCount = buttonShowCount + 1
    else
      if currentData.functionIgnore ~= nil then
        buttonIgnore:SetShow(true)
        buttonShowCount = buttonShowCount + 1
      end
    end
    if currentData.functionCancel ~= nil then
      buttonCancel:SetShow(true)
      buttonShowCount = buttonShowCount + 1
    end
    if currentData.exitButton == true then
      buttonClose:SetShow(true)
    end
    globalButtonShowCount = buttonShowCount
    Panel_Win_System:deleteConsoleUIGroup(0)
    if isConsoleLockFocus ~= nil then
      Panel_Win_System:setLockFocusPanel(isConsoleLockFocus)
    end
    local group_0 = Panel_Win_System:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
    if buttonShowCount == 1 then
      buttonYes:SetPosX(Panel_Win_System:GetSizeX() / 2 - buttonYes:GetSizeX() / 2)
      buttonApply:SetPosX(Panel_Win_System:GetSizeX() / 2 - buttonApply:GetSizeX() / 2)
      buttonNo:SetPosX(Panel_Win_System:GetSizeX() / 2 - buttonNo:GetSizeX() / 2)
      buttonIgnore:SetPosX(Panel_Win_System:GetSizeX() / 2 - buttonIgnore:GetSizeX() / 2)
      buttonCancel:SetPosX(Panel_Win_System:GetSizeX() / 2 - buttonCancel:GetSizeX() / 2)
      if buttonYes:GetShow() then
        group_0:addControl(0, 0, 1, 1, buttonYes)
      else
        if buttonApply:GetShow() then
          group_0:addControl(0, 0, 1, 1, buttonApply)
        else
          if buttonNo:GetShow() then
            group_0:addControl(0, 0, 1, 1, buttonNo)
          else
            if buttonIgnore:GetShow() then
              group_0:addControl(0, 0, 1, 1, buttonIgnore)
            else
              if buttonCancel:GetShow() then
                group_0:addControl(0, 0, 1, 1, buttonCancel)
              end
            end
          end
        end
      end
    else
      if buttonShowCount == 2 then
        buttonYes:SetPosX(Panel_Win_System:GetSizeX() / 2 - (buttonYes:GetSizeX() / 2 + 5))
        buttonNo:SetPosX(Panel_Win_System:GetSizeX() / 2 + (buttonNo:GetSizeX() / 2 + 5))
        buttonApply:SetPosX(Panel_Win_System:GetSizeX() / 2 - (buttonApply:GetSizeX() / 2 + 5))
        buttonIgnore:SetPosX(Panel_Win_System:GetSizeX() / 2 + (buttonIgnore:GetSizeX() / 2 + 5))
        buttonCancel:SetPosX(Panel_Win_System:GetSizeX() / 2 + (buttonCancel:GetSizeX() / 2 + 5))
        if buttonYes:GetShow() then
          group_0:addControl(0, 0, 2, 1, buttonYes)
        else
          if buttonApply:GetShow() then
            group_0:addControl(0, 0, 2, 1, buttonApply)
          end
        end
        if buttonNo:GetShow() then
          group_0:addControl(1, 0, 2, 1, buttonNo)
        else
          if buttonIgnore:GetShow() then
            group_0:addControl(1, 0, 2, 1, buttonIgnore)
          else
            if buttonCancel:GetShow() then
              group_0:addControl(1, 0, 2, 1, buttonCancel)
            end
          end
        end
      else
        if buttonShowCount == 3 then
          local buttonSize = buttonYes:GetSizeX()
          buttonYes:SetPosX(5)
          buttonNo:SetPosX(buttonSize + 10)
          buttonApply:SetPosX(5)
          buttonIgnore:SetPosX(buttonSize + 10)
          buttonCancel:SetPosX(buttonSize * 2 + 15)
          if buttonYes:GetShow() then
            group_0:addControl(0, 0, 3, 1, buttonYes)
          else
            if buttonApply:GetShow() then
              group_0:addControl(0, 0, 3, 1, buttonApply)
            end
          end
          if buttonNo:GetShow() then
            group_0:addControl(1, 0, 3, 1, buttonNo)
          else
            if buttonIgnore:GetShow() then
              group_0:addControl(1, 0, 3, 1, buttonIgnore)
            end
          end
          if buttonCancel:GetShow() then
            group_0:addControl(2, 0, 3, 1, buttonCancel)
          end
        end
      end
    end
    do
      _currentMessageBoxData = currentData
    end
  end
end

-- DECOMPILER ERROR at PC221: Confused about usage of register: R28 in 'UnsetPending'

MessageBox.showMessageBox = function(MessageData, position, isGameExit, keyUse, isConsoleLockFocus)
  -- function num : 0_1 , upvalues : list, functionKeyUse, elapsedTime, textBG, static_Beginner_BG, static_BeginnerTitleBG, staticText_BeginnerTxt1, staticText_BeginnerTxt2, textContent, blockBG
  if Panel_Win_System:GetShow() and MessageData.enablePriority == nil then
    return 
  end
  local Front = list
  local preList = nil
  functionKeyUse = keyUse
  while 1 do
    while 1 do
      if list == nil or MessageData.priority < (list.data).priority then
        list = {next = list, pre = preList, data = MessageData}
        if list.pre == nil then
          setCurrentMessageData(list.data, position, isConsoleLockFocus)
        else
          -- DECOMPILER ERROR at PC41: Confused about usage of register: R7 in 'UnsetPending'

          ;
          (list.pre).next = list
          list = Front
        end
        -- DECOMPILER ERROR at PC44: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC44: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
    preList = list
    list = list.next
  end
  if MessageData.countTime ~= nil then
    elapsedTime = 0
  end
  if isGameExit == true and ToClient_GetUserPlayMinute() < 1440 then
    Panel_Win_System:SetSize(441, 317)
    textBG:SetSize(420, 120)
    static_Beginner_BG:SetShow(true)
    static_BeginnerTitleBG:SetShow(true)
    staticText_BeginnerTxt1:SetShow(true)
    staticText_BeginnerTxt2:SetShow(true)
    static_Beginner_BG:ComputePos()
    static_BeginnerTitleBG:ComputePos()
    staticText_BeginnerTxt1:ComputePos()
    staticText_BeginnerTxt2:ComputePos()
  else
    static_Beginner_BG:SetShow(false)
    static_BeginnerTitleBG:SetShow(false)
    staticText_BeginnerTxt1:SetShow(false)
    staticText_BeginnerTxt2:SetShow(false)
    Panel_Win_System:SetSize(350, 220)
    textBG:SetSize(334, 153)
  end
  local textSizeY = textContent:GetTextSizeY()
  local textBGSizeY = textContent:GetSizeY()
  local panelSizeY = textBG:GetSizeY()
  local resizePanelY = textSizeY + 90
  if textBGSizeY < textSizeY then
    textContent:SetTextVerticalTop()
    Panel_Win_System:SetSize(350, resizePanelY)
    textBG:SetSize(334, textSizeY + 20)
  else
    Panel_Win_System:SetSize(350, 220)
    textBG:SetSize(334, 153)
  end
  textContent:ComputePos()
  blockBG:SetSize(getScreenSizeX() + 500, getScreenSizeY() + 500)
  blockBG:ComputePos()
  messageBoxComputePos()
end

messageBoxComputePos = function()
  -- function num : 0_2 , upvalues : blockBG, textTitle, textContent, textBG, buttonYes, buttonApply, buttonNo, buttonIgnore, buttonCancel, buttonClose, globalButtonShowCount
  blockBG:SetSize(getScreenSizeX() + 500, getScreenSizeY() + 500)
  Panel_Win_System:ComputePos()
  textTitle:ComputePos()
  textContent:ComputePos()
  textBG:ComputePos()
  buttonYes:ComputePos()
  buttonApply:ComputePos()
  buttonNo:ComputePos()
  buttonIgnore:ComputePos()
  buttonCancel:ComputePos()
  buttonClose:ComputePos()
  blockBG:ComputePos()
  if globalButtonShowCount == 1 then
    buttonYes:SetPosX(Panel_Win_System:GetSizeX() / 2 - buttonYes:GetSizeX() / 2)
    buttonApply:SetPosX(Panel_Win_System:GetSizeX() / 2 - buttonApply:GetSizeX() / 2)
    buttonNo:SetPosX(Panel_Win_System:GetSizeX() / 2 - buttonNo:GetSizeX() / 2)
    buttonIgnore:SetPosX(Panel_Win_System:GetSizeX() / 2 - buttonIgnore:GetSizeX() / 2)
    buttonCancel:SetPosX(Panel_Win_System:GetSizeX() / 2 - buttonCancel:GetSizeX() / 2)
  else
    if globalButtonShowCount == 2 then
      buttonYes:SetPosX(Panel_Win_System:GetSizeX() / 2 - (buttonYes:GetSizeX() + 5))
      buttonNo:SetPosX(Panel_Win_System:GetSizeX() / 2 + 5)
      buttonApply:SetPosX(Panel_Win_System:GetSizeX() / 2 - (buttonApply:GetSizeX() + 5))
      buttonIgnore:SetPosX(Panel_Win_System:GetSizeX() / 2 + 5)
      buttonCancel:SetPosX(Panel_Win_System:GetSizeX() / 2 + 5)
    else
      if globalButtonShowCount == 3 then
        local buttonSize = buttonYes:GetSizeX()
        buttonYes:SetPosX(5)
        buttonNo:SetPosX(buttonSize + 10)
        buttonApply:SetPosX(5)
        buttonIgnore:SetPosX(buttonSize + 10)
        buttonCancel:SetPosX(buttonSize * 2 + 15)
      end
    end
  end
end

postProcessMessageData = function()
  -- function num : 0_3 , upvalues : _currentMessageBoxData, list
  Panel_Win_System:SetShow(false, false)
  if Panel_Win_System:isLockFocusPanel() then
    Panel_Win_System:setLockFocusPanel(false)
  end
  _currentMessageBoxData = nil
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R0 in 'UnsetPending'

  if list ~= nil and list.data ~= nil then
    list.data = nil
    list = list.next
    if list ~= nil then
      setCurrentMessageData(list.data)
    end
  end
end

allClearMessageData = function()
  -- function num : 0_4 , upvalues : list
  Panel_Win_System:SetShow(false, false)
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

-- DECOMPILER ERROR at PC245: Confused about usage of register: R28 in 'UnsetPending'

MessageBox.doHaveMessageBoxData = function(title)
  -- function num : 0_5 , upvalues : list
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

-- DECOMPILER ERROR at PC248: Confused about usage of register: R28 in 'UnsetPending'

MessageBox.isPopUp = function()
  -- function num : 0_6
  return Panel_Win_System:IsShow()
end

-- DECOMPILER ERROR at PC252: Confused about usage of register: R28 in 'UnsetPending'

MessageBox.isCurrentOpen = function(title)
  -- function num : 0_7 , upvalues : _currentMessageBoxData
  if _currentMessageBoxData ~= nil and _currentMessageBoxData.title == title then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC257: Confused about usage of register: R28 in 'UnsetPending'

MessageBox.keyProcessEnter = function()
  -- function num : 0_8 , upvalues : functionKeyUse, list
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

-- DECOMPILER ERROR at PC262: Confused about usage of register: R28 in 'UnsetPending'

MessageBox.keyProcessEscape = function()
  -- function num : 0_9 , upvalues : functionKeyUse, list
  if not functionKeyUse and functionKeyUse ~= nil then
    return 
  end
  if list ~= nil and ((list.data).exitButton or (list.data).functionCancel or (list.data).functionNo) then
    messageBox_CloseButtonUp()
  end
end

MessageBox_ShowAni = function()
  -- function num : 0_10 , upvalues : UI_ANI_ADV, UI_color
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
  -- function num : 0_11
  Panel_Win_System:SetShow(false, false)
end

messageBox_YesButtonUp = function()
  -- function num : 0_12 , upvalues : list
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
  -- function num : 0_13 , upvalues : list, elapsedTime
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
  -- function num : 0_14 , upvalues : list
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
  -- function num : 0_15 , upvalues : list
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
  -- function num : 0_16 , upvalues : list, elapsedTime
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
  -- function num : 0_17 , upvalues : list
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
  -- function num : 0_18 , upvalues : UI_PP
  local titleText = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY")
  local messageboxData = {title = titleText, content = message, functionApply = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW, exitButton = false}
  ;
  (MessageBox.showMessageBox)(messageboxData, "top")
end

Event_MessageBox_NotifyMessage = function(message)
  -- function num : 0_19 , upvalues : UI_PP
  local titleText = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY")
  local messageboxData = {title = titleText, content = message, functionApply = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW, exitButton = false}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

Event_MessageBox_NotifyMessage_FreeButton = function(message)
  -- function num : 0_20 , upvalues : UI_PP
  local messageboxData = {title = "", content = message, priority = UI_PP.PAUIMB_PRIORITY_1, exitButton = false}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

Event_MessageBox_NotifyMessage_With_ClientMessage = function(message, gameMessageType)
  -- function num : 0_21 , upvalues : UI_PP
  local titleText = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY")
  local messageboxData = {title = titleText, content = message, functionApply = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_1, clientMessage = gameMessageType, exitButton = false}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

MessageBox_Empty_function = function()
  -- function num : 0_22
end

messageBox_UpdatePerFrame = function(deltaTime)
  -- function num : 0_23 , upvalues : list, elapsedTime, textTitle
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
  -- function num : 0_24 , upvalues : _currentMessageBoxData
  if _currentMessageBoxData == nil then
    return 
  end
  setCurrentMessageData(_currentMessageBoxData)
end

buttonYes:addInputEvent("Mouse_LUp", "messageBox_YesButtonUp()")
buttonApply:addInputEvent("Mouse_LUp", "messageBox_ApplyButtonUp()")
buttonNo:addInputEvent("Mouse_LUp", "messageBox_NoButtonUp()")
buttonIgnore:addInputEvent("Mouse_LUp", "messageBox_IgnoreButtonUp()")
buttonCancel:addInputEvent("Mouse_LUp", "messageBox_CancelButtonUp()")
buttonClose:addInputEvent("Mouse_LUp", "messageBox_CloseButtonUp()")
registerEvent("EventNotifyMessage", "Event_MessageBox_NotifyMessage")
registerEvent("EventNotifyMessageFreeButton", "Event_MessageBox_NotifyMessage_FreeButton")
registerEvent("EventNotifyFreeButtonMessageProcess", "postProcessMessageData")
registerEvent("EventNotifyAllClearMessageData", "allClearMessageData")
registerEvent("EventNotifyMessageWithClientMessage", "Event_MessageBox_NotifyMessage_With_ClientMessage")
registerEvent("EventNotifyMessageCashAlert", "Event_MessageBox_NotifyMessage_CashAlert")
Panel_Win_System:RegisterUpdateFunc("messageBox_UpdatePerFrame")

