-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\keypad\panel_window_number_renew.luac 

-- params : ...
-- function num : 0
Panel_Window_Exchange_Number:ignorePanelMoveSnapping()
Panel_Window_Exchange_Number:SetShow(false, false)
Panel_Window_Exchange_Number:setMaskingChild(true)
Panel_Window_Exchange_Number:ActiveMouseEventEffect(true)
Panel_Window_Exchange_Number:setGlassBackground(true)
Panel_Window_Exchange_Number:RegisterShowEventFunc(true, "ExchangeNumberShowAni()")
Panel_Window_Exchange_Number:RegisterShowEventFunc(false, "ExchangeNumberHideAni()")
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local IM = CppEnums.EProcessorInputMode
local VCK = CppEnums.VirtualKeyCode
local UI_color = Defines.Color
local strlen = string.len
local substring = string.sub
local numberPad = {confirmFunction; MAX_NUMBER_BTN_COUNT = 10, s64_moneyMaxNumber = (Defines.s64_const).s64_0, s64_weightMaxNumber = (Defines.s64_const).s64_0, s64_inputNumber = (Defines.s64_const).s64_0, param0 = nil, param1 = nil, init_Number = false, _buttonNumber = (Array.new)(), _type = ""}
local numberKeyCode = {VCK.KeyCode_0, VCK.KeyCode_1, VCK.KeyCode_2, VCK.KeyCode_3, VCK.KeyCode_4, VCK.KeyCode_5, VCK.KeyCode_6, VCK.KeyCode_7, VCK.KeyCode_8, VCK.KeyCode_9, VCK.KeyCode_NUMPAD0, VCK.KeyCode_NUMPAD1, VCK.KeyCode_NUMPAD2, VCK.KeyCode_NUMPAD3, VCK.KeyCode_NUMPAD4, VCK.KeyCode_NUMPAD5, VCK.KeyCode_NUMPAD6, VCK.KeyCode_NUMPAD7, VCK.KeyCode_NUMPAD8, VCK.KeyCode_NUMPAD9}
local realNumber = nil
local _edit_Number = (UI.getChildControl)(Panel_Window_Exchange_Number, "Edit_Number")
_edit_Number:addInputEvent("Mouse_UpScroll", "Panel_NumberPad_Mouse_Scroll_Event(true)")
_edit_Number:addInputEvent("Mouse_DownScroll", "Panel_NumberPad_Mouse_Scroll_Event(false)")
local _staticText_Cancel_ConsoleUI = (UI.getChildControl)(Panel_Window_Exchange_Number, "StaticText_Cancel_ConsoleUI")
local _button_Cancel = (UI.getChildControl)(Panel_Window_Exchange_Number, "Button_Cancel")
_button_Cancel:addInputEvent("Mouse_LUp", "Panel_NumberPad_ButtonCancel_Mouse_Click()")
_button_Cancel:addInputEvent("Mouse_UpScroll", "Panel_NumberPad_Mouse_Scroll_Event(true)")
_button_Cancel:addInputEvent("Mouse_DownScroll", "Panel_NumberPad_Mouse_Scroll_Event(false)")
local _button_Clear = (UI.getChildControl)(Panel_Window_Exchange_Number, "Button_Clear")
_button_Clear:addInputEvent("Mouse_LUp", "Panel_NumberPad_ButtonClear_Mouse_Click()")
_button_Clear:addInputEvent("Mouse_UpScroll", "Panel_NumberPad_Mouse_Scroll_Event(true)")
_button_Clear:addInputEvent("Mouse_DownScroll", "Panel_NumberPad_Mouse_Scroll_Event(false)")
local _button_Back = (UI.getChildControl)(Panel_Window_Exchange_Number, "Button_Back")
_button_Back:addInputEvent("Mouse_LUp", "Panel_NumberPad_ButtonBackSpace_Mouse_Click(false)")
_button_Back:addInputEvent("Mouse_UpScroll", "Panel_NumberPad_Mouse_Scroll_Event(true)")
_button_Back:addInputEvent("Mouse_DownScroll", "Panel_NumberPad_Mouse_Scroll_Event(false)")
local _staticText_Confirm_ConsoleUI = (UI.getChildControl)(Panel_Window_Exchange_Number, "StaticText_Confirm_ConsoleUI")
local _button_Confirm = (UI.getChildControl)(Panel_Window_Exchange_Number, "Button_Confirm")
_button_Confirm:addInputEvent("Mouse_LUp", "Panel_NumberPad_ButtonConfirm_Mouse_Click()")
_button_Confirm:addInputEvent("Mouse_UpScroll", "Panel_NumberPad_Mouse_Scroll_Event(true)")
_button_Confirm:addInputEvent("Mouse_DownScroll", "Panel_NumberPad_Mouse_Scroll_Event(false)")
local _checkButton_MaxCount = (UI.getChildControl)(Panel_Window_Exchange_Number, "CheckButton_MaxCount")
_checkButton_MaxCount:addInputEvent("Mouse_LUp", "Panel_NumberPad_ButtonAllSelect_Mouse_Click(1)")
if _ContentsGroup_RenewUI_Number == false then
  _checkButton_MaxCount:SetShow(true)
else
  _checkButton_MaxCount:SetShow(false)
end
numberPad.init = function(self)
  -- function num : 0_0 , upvalues : numberPad
  for ii = 1, numberPad.MAX_NUMBER_BTN_COUNT do
    local btn = (UI.getChildControl)(Panel_Window_Exchange_Number, "Button_" .. ii - 1)
    btn:addInputEvent("Mouse_LUp", "Panel_NumberPad_ButtonNumber_Mouse_Click(" .. ii - 1 .. ")")
    btn:addInputEvent("Mouse_UpScroll", "Panel_NumberPad_Mouse_Scroll_Event(true)")
    btn:addInputEvent("Mouse_DownScroll", "Panel_NumberPad_Mouse_Scroll_Event(false)")
    -- DECOMPILER ERROR at PC29: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (numberPad._buttonNumber)[ii] = btn
  end
  confirmFunction = Panel_NumberPad_Default_ConfirmFunction
end

Panel_NumberPad_CheckButtonShow = function()
  -- function num : 0_1 , upvalues : numberPad, _button_Back, _button_Clear, _button_Confirm, _button_Cancel, _checkButton_MaxCount
  ((numberPad._buttonNumber)[1]):ComputePos()
  ;
  ((numberPad._buttonNumber)[2]):ComputePos()
  ;
  ((numberPad._buttonNumber)[3]):ComputePos()
  ;
  ((numberPad._buttonNumber)[4]):ComputePos()
  ;
  ((numberPad._buttonNumber)[5]):ComputePos()
  ;
  ((numberPad._buttonNumber)[6]):ComputePos()
  ;
  ((numberPad._buttonNumber)[7]):ComputePos()
  ;
  ((numberPad._buttonNumber)[8]):ComputePos()
  ;
  ((numberPad._buttonNumber)[9]):ComputePos()
  ;
  ((numberPad._buttonNumber)[10]):ComputePos()
  _button_Back:ComputePos()
  _button_Clear:ComputePos()
  _button_Confirm:ComputePos()
  _button_Cancel:ComputePos()
  if _ContentsGroup_RenewUI_Number == false then
    _checkButton_MaxCount:SetShow(true)
  else
    _checkButton_MaxCount:SetShow(false)
  end
end

ExchangeNumberShowAni = function()
  -- function num : 0_2
  (UIAni.fadeInSCR_Down)(Panel_Window_Exchange_Number)
end

ExchangeNumberHideAni = function()
  -- function num : 0_3 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_Window_Exchange_Number:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_Window_Exchange_Number:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

Panel_NumberPad_Init = function(param0, confirmFunction, isShow, param1, param2)
  -- function num : 0_4 , upvalues : numberPad, realNumber, _edit_Number
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R5 in 'UnsetPending'

  numberPad.param0 = param0
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R5 in 'UnsetPending'

  numberPad.param1 = param1
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R5 in 'UnsetPending'

  numberPad.param2 = param2
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R5 in 'UnsetPending'

  numberPad.confirmFunction = confirmFunction
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R5 in 'UnsetPending'

  numberPad.init_Number = true
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R5 in 'UnsetPending'

  numberPad._type = ""
  realNumber = numberPad.s64_inputNumber
  _edit_Number:SetEditText(tostring(numberPad.s64_inputNumber))
  _edit_Number:SetNumberMode(true)
  numberPad:updateConfirmButton(true)
  if not Panel_Window_Exchange_Number:GetShow() then
    Panel_Window_Exchange_Number:SetPosX(getMousePosX())
    Panel_Window_Exchange_Number:SetPosY(getMousePosY())
  end
  local keyPadPosY = Panel_Window_Exchange_Number:GetPosY()
  keyPadPosY = keyPadPosY + Panel_Window_Exchange_Number:GetSizeY()
  if getScreenSizeY() < keyPadPosY then
    Panel_Window_Exchange_Number:SetPosY(getScreenSizeY() - Panel_Window_Exchange_Number:GetSizeY() - 30)
  end
  local keyPadPosX = Panel_Window_Exchange_Number:GetPosX()
  keyPadPosX = keyPadPosX + Panel_Window_Exchange_Number:GetSizeX()
  if getScreenSizeX() < keyPadPosX then
    Panel_Window_Exchange_Number:SetPosX(getScreenSizeX() - Panel_Window_Exchange_Number:GetSizeX())
  end
  if _ContentsGroup_isConsolePadControl then
    _edit_Number:SetIgnore(true)
  end
  if isShow then
    Panel_NumberPad_Open()
  end
end

Panel_NumberPad_Open = function()
  -- function num : 0_5
  if not Panel_Window_Exchange_Number:IsShow() then
    Panel_Window_Exchange_Number:SetShow(true, true)
  end
end

Panel_NumberPad_Close = function()
  -- function num : 0_6 , upvalues : numberPad
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R0 in 'UnsetPending'

  if Panel_Window_Exchange_Number:IsShow() then
    numberPad.s64_moneyMaxNumber = (Defines.s64_const).s64_0
    -- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

    numberPad.s64_weightMaxNumber = (Defines.s64_const).s64_0
    -- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

    numberPad.s64_inputNumber = (Defines.s64_const).s64_0
    -- DECOMPILER ERROR at PC21: Confused about usage of register: R0 in 'UnsetPending'

    numberPad.param0 = nil
    -- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

    numberPad.param1 = nil
    -- DECOMPILER ERROR at PC25: Confused about usage of register: R0 in 'UnsetPending'

    numberPad.param2 = nil
    -- DECOMPILER ERROR at PC27: Confused about usage of register: R0 in 'UnsetPending'

    numberPad.confirmFunction = nil
    Panel_Window_Exchange_Number:SetShow(false, true)
  end
end

Panel_NumberPad_Show_Min = function(isShow, s64_minNumber, param0, confirmFunction, param1)
  -- function num : 0_7 , upvalues : numberPad, realNumber, _edit_Number
  if not isShow then
    Panel_NumberPad_Close()
    ClearFocusEdit()
  else
    -- DECOMPILER ERROR at PC11: Confused about usage of register: R5 in 'UnsetPending'

    numberPad.s64_moneyMaxNumber = (Defines.s64_const).s64_max
    -- DECOMPILER ERROR at PC13: Confused about usage of register: R5 in 'UnsetPending'

    numberPad.s64_inputNumber = s64_minNumber
    Panel_NumberPad_Init(param0, confirmFunction, true, param1)
    if _ContentsGroup_isConsolePadControl == false then
      SetFocusEdit(edit_Number)
    end
    realNumber = numberPad.s64_moneyMaxNumber
    _edit_Number:SetEditText(makeDotMoney(numberPad.s64_moneyMaxNumber))
  end
end

local _isExchange = nil
Panel_NumberPad_Show = function(isShow, s64_moneyMaxNumber, param0, confirmFunction, isExchange, param1, isItemMarket, param2, s64_weightMaxNumber)
  -- function num : 0_8 , upvalues : numberPad, _isExchange, _edit_Number, _checkButton_MaxCount, realNumber
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R9 in 'UnsetPending'

  if s64_weightMaxNumber ~= nil then
    numberPad.s64_weightMaxNumber = s64_weightMaxNumber
  else
    -- DECOMPILER ERROR at PC9: Confused about usage of register: R9 in 'UnsetPending'

    numberPad.s64_weightMaxNumber = (Defines.s64_const).s64_0
  end
  _isExchange = isExchange
  local maxLength = (string.len)(tostring(s64_moneyMaxNumber))
  _edit_Number:SetMaxInput(maxLength + 1)
  if not isShow then
    Panel_NumberPad_Close()
    ClearFocusEdit()
  else
    -- DECOMPILER ERROR at PC29: Confused about usage of register: R10 in 'UnsetPending'

    numberPad.s64_moneyMaxNumber = s64_moneyMaxNumber
    -- DECOMPILER ERROR at PC33: Confused about usage of register: R10 in 'UnsetPending'

    if s64_weightMaxNumber ~= nil then
      numberPad.s64_weightMaxNumber = s64_weightMaxNumber
    else
      -- DECOMPILER ERROR at PC39: Confused about usage of register: R10 in 'UnsetPending'

      numberPad.s64_weightMaxNumber = (Defines.s64_const).s64_0
    end
    -- DECOMPILER ERROR at PC43: Confused about usage of register: R10 in 'UnsetPending'

    if isItemMarket == true then
      numberPad.s64_inputNumber = s64_moneyMaxNumber
    else
      local value = nil
      if (Defines.s64_const).s64_0 ~= numberPad.s64_weightMaxNumber and (Defines.s64_const).s64_0 ~= numberPad.s64_moneyMaxNumber then
        if numberPad.s64_weightMaxNumber < numberPad.s64_moneyMaxNumber then
          value = numberPad.s64_weightMaxNumber
        else
          value = numberPad.s64_moneyMaxNumber
        end
      else
        if numberPad.s64_weightMaxNumber < numberPad.s64_moneyMaxNumber then
          value = numberPad.s64_moneyMaxNumber
        else
          value = numberPad.s64_weightMaxNumber
        end
      end
      -- DECOMPILER ERROR at PC89: Confused about usage of register: R11 in 'UnsetPending'

      if _checkButton_MaxCount:IsCheck() then
        numberPad.s64_inputNumber = value
      else
        -- DECOMPILER ERROR at PC95: Confused about usage of register: R11 in 'UnsetPending'

        numberPad.s64_inputNumber = (Defines.s64_const).s64_1
      end
    end
    do
      if (Defines.s64_const).s64_1 == s64_moneyMaxNumber then
        Panel_NumberPad_Init(param0, confirmFunction, false, param1, param2)
        Panel_NumberPad_ButtonConfirm_Mouse_Click()
      else
        Panel_NumberPad_Init(param0, confirmFunction, true, param1, param2)
        if _ContentsGroup_isConsolePadControl == false then
          SetFocusEdit(_edit_Number)
        end
        if isItemMarket == true then
          realNumber = s64_moneyMaxNumber
          _edit_Number:SetEditText(makeDotMoney(s64_moneyMaxNumber))
        else
          local value = nil
          if (Defines.s64_const).s64_0 ~= numberPad.s64_weightMaxNumber and (Defines.s64_const).s64_0 ~= numberPad.s64_moneyMaxNumber then
            if numberPad.s64_weightMaxNumber < numberPad.s64_moneyMaxNumber then
              value = numberPad.s64_weightMaxNumber
            else
              value = numberPad.s64_moneyMaxNumber
            end
          else
            if numberPad.s64_weightMaxNumber < numberPad.s64_moneyMaxNumber then
              value = numberPad.s64_moneyMaxNumber
            else
              value = numberPad.s64_weightMaxNumber
            end
          end
          if _checkButton_MaxCount:IsCheck() then
            _checkButton_MaxCount:SetCheck(true)
            _edit_Number:SetEditText(makeDotMoney(value))
            realNumber = value
          else
            _checkButton_MaxCount:SetCheck(false)
            _edit_Number:SetEditText(makeDotMoney((Defines.s64_const).s64_1))
            realNumber = (Defines.s64_const).s64_1
          end
        end
      end
      do
        Panel_NumberPad_CheckButtonShow(true)
      end
    end
  end
end

local slotNo, whereType = nil, nil
Panel_NumberPad_Show_MaxCount = function(isShow, s64_maxNumber, param0, confirmFunction, isExchange, param1, isItemMarket)
  -- function num : 0_9 , upvalues : _isExchange, _edit_Number, numberPad, _checkButton_MaxCount, realNumber, slotNo, whereType
  _isExchange = isExchange
  local maxLength = (string.len)(tostring(s64_maxNumber))
  _edit_Number:SetMaxInput(maxLength + 1)
  if not isShow then
    Panel_NumberPad_Close()
    ClearFocusEdit()
  else
    -- DECOMPILER ERROR at PC22: Confused about usage of register: R8 in 'UnsetPending'

    numberPad.s64_weightMaxNumber = (Defines.s64_const).s64_0
    -- DECOMPILER ERROR at PC24: Confused about usage of register: R8 in 'UnsetPending'

    numberPad.s64_moneyMaxNumber = s64_maxNumber
    -- DECOMPILER ERROR at PC31: Confused about usage of register: R8 in 'UnsetPending'

    if _checkButton_MaxCount:IsCheck() then
      numberPad.s64_inputNumber = s64_maxNumber
    else
      -- DECOMPILER ERROR at PC37: Confused about usage of register: R8 in 'UnsetPending'

      numberPad.s64_inputNumber = (Defines.s64_const).s64_1
    end
    if (Defines.s64_const).s64_1 == s64_maxNumber then
      Panel_NumberPad_Init(param0, confirmFunction, false, param1)
      Panel_NumberPad_ButtonConfirm_Mouse_Click()
    else
      Panel_NumberPad_Init(param0, confirmFunction, true, param1)
      if _ContentsGroup_isConsolePadControl == false then
        SetFocusEdit(_edit_Number)
      end
      if _checkButton_MaxCount:IsCheck() then
        realNumber = s64_maxNumber
        _edit_Number:SetEditText(makeDotMoney(s64_maxNumber))
      else
        realNumber = (Defines.s64_const).s64_1
        _edit_Number:SetEditText("1")
      end
    end
  end
  slotNo = param0
  whereType = param1
  Panel_NumberPad_CheckButtonShow(true)
end

Panel_NumberPad_SetMaxCount = function()
  -- function num : 0_10 , upvalues : numberPad, slotNo, whereType
  Panel_NumberPad_Show_MaxCount(true, numberPad.s64_moneyMaxNumber, slotNo, Warehouse_PushFromInventoryItemXXX, nil, whereType)
end

Panel_NumberPad_ButtonClose_Mouse_Click = function()
  -- function num : 0_11
  Panel_NumberPad_Show(false, (Defines.s64_const).s64_0, 0, nil)
end

Panel_NumberPad_ButtonCancel_Mouse_Click = function()
  -- function num : 0_12
  Panel_NumberPad_Show(false, (Defines.s64_const).s64_0, 0, nil)
end

numberPad.checkConfirmEnable = function(self)
  -- function num : 0_13
  do return (Defines.s64_const).s64_0 < self.s64_inputNumber end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

numberPad.updateConfirmButton = function(self, forceFlag)
  -- function num : 0_14 , upvalues : _button_Confirm, UI_color
  if forceFlag or self:checkConfirmEnable() then
    _button_Confirm:SetEnable(true)
    _button_Confirm:SetMonoTone(false)
    _button_Confirm:SetFontColor(UI_color.C_FFFFFFFF)
  else
    _button_Confirm:SetEnable(false)
    _button_Confirm:SetMonoTone(true)
    _button_Confirm:SetFontColor(UI_color.C_FFC4BEBE)
  end
end

Panel_NumberPad_ButtonClear_Mouse_Click = function()
  -- function num : 0_15 , upvalues : numberPad, _edit_Number, realNumber
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R0 in 'UnsetPending'

  numberPad.s64_inputNumber = (Defines.s64_const).s64_0
  _edit_Number:SetEditText("0")
  realNumber = numberPad.s64_inputNumber
  numberPad:updateConfirmButton()
end

Panel_NumberPad_ButtonNumber_Mouse_Click = function(number)
  -- function num : 0_16 , upvalues : _edit_Number, numberPad, strlen, substring, realNumber, _isExchange
  local newStr = _edit_Number:GetEditText()
  if number ~= nil then
    newStr = newStr .. tostring(number)
  end
  newStr = (string.gsub)(newStr, ",", "")
  local s64_newNumber = tonumber64(newStr)
  local s64_MAX = numberPad.s64_moneyMaxNumber
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R4 in 'UnsetPending'

  if numberPad.init_Number == true then
    numberPad.init_Number = false
    if number == nil then
      local length = strlen(newStr)
      newStr = substring(newStr, -1)
    else
      do
        newStr = tostring(number)
        s64_newNumber = tonumber64(newStr)
        -- DECOMPILER ERROR at PC52: Confused about usage of register: R4 in 'UnsetPending'

        if s64_MAX < s64_newNumber then
          numberPad.s64_inputNumber = numberPad.s64_moneyMaxNumber
        else
          if (string.len)(newStr) == 0 then
            _edit_Number:SetEditText("0")
            -- DECOMPILER ERROR at PC65: Confused about usage of register: R4 in 'UnsetPending'

            numberPad.s64_inputNumber = 0
          else
            -- DECOMPILER ERROR at PC68: Confused about usage of register: R4 in 'UnsetPending'

            numberPad.s64_inputNumber = s64_newNumber
          end
        end
        realNumber = numberPad.s64_inputNumber
        _edit_Number:SetEditText(makeDotMoney(numberPad.s64_inputNumber))
        numberPad:updateConfirmButton(_isExchange)
      end
    end
  end
end

Panel_NumberPad_ButtonBackSpace_Mouse_Click = function(fromOnKey)
  -- function num : 0_17 , upvalues : realNumber, strlen, substring, numberPad, _edit_Number
  local str = tostring(realNumber)
  local length = strlen(str)
  local newStr = ""
  if fromOnKey then
    if length >= 1 then
      newStr = substring(str, 1, length - 1)
      -- DECOMPILER ERROR at PC21: Confused about usage of register: R4 in 'UnsetPending'

      numberPad.s64_inputNumber = tonumber64(newStr)
      newStr = tostring(numberPad.s64_inputNumber)
    else
      newStr = "0"
      -- DECOMPILER ERROR at PC30: Confused about usage of register: R4 in 'UnsetPending'

      numberPad.init_Number = true
      -- DECOMPILER ERROR at PC35: Confused about usage of register: R4 in 'UnsetPending'

      numberPad.s64_inputNumber = (Defines.s64_const).s64_0
    end
  else
    if length > 1 then
      newStr = substring(str, 1, length - 1)
      -- DECOMPILER ERROR at PC49: Confused about usage of register: R4 in 'UnsetPending'

      numberPad.s64_inputNumber = tonumber64(newStr)
      newStr = tostring(numberPad.s64_inputNumber)
    else
      newStr = "0"
      -- DECOMPILER ERROR at PC58: Confused about usage of register: R4 in 'UnsetPending'

      numberPad.init_Number = true
      -- DECOMPILER ERROR at PC63: Confused about usage of register: R4 in 'UnsetPending'

      numberPad.s64_inputNumber = (Defines.s64_const).s64_0
    end
  end
  realNumber = numberPad.s64_inputNumber
  _edit_Number:SetEditText(makeDotMoney(numberPad.s64_inputNumber))
  numberPad:updateConfirmButton()
end

Panel_NumberPad_ButtonConfirm_Mouse_Click = function()
  -- function num : 0_18 , upvalues : numberPad, _isExchange
  if numberPad:checkConfirmEnable() or _isExchange == true then
    if numberPad.confirmFunction ~= nil then
      (numberPad.confirmFunction)(numberPad.s64_inputNumber, numberPad.param0, numberPad.param1, numberPad.param2)
    end
    Panel_NumberPad_Show(false, (Defines.s64_const).s64_0, 0, nil)
  end
end

Panel_NumberPad_ButtonAllSelect_Mouse_Click = function(isType)
  -- function num : 0_19 , upvalues : numberPad, _checkButton_MaxCount, _edit_Number, realNumber
  local value = nil
  if (Defines.s64_const).s64_0 ~= numberPad.s64_weightMaxNumber and (Defines.s64_const).s64_0 ~= numberPad.s64_moneyMaxNumber then
    if numberPad.s64_weightMaxNumber < numberPad.s64_moneyMaxNumber then
      value = numberPad.s64_weightMaxNumber
    else
      value = numberPad.s64_moneyMaxNumber
    end
  else
    if numberPad.s64_weightMaxNumber < numberPad.s64_moneyMaxNumber then
      value = numberPad.s64_moneyMaxNumber
    else
      value = numberPad.s64_weightMaxNumber
    end
  end
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R2 in 'UnsetPending'

  numberPad.s64_inputNumber = value
  if _checkButton_MaxCount:IsCheck() then
    _checkButton_MaxCount:SetCheck(true)
    if _ContentsGroup_isConsolePadControl == false then
      SetFocusEdit(_edit_Number)
    end
    _edit_Number:SetEditText(makeDotMoney(value))
    realNumber = value
  else
    _checkButton_MaxCount:SetCheck(false)
    _edit_Number:SetEditText(makeDotMoney((Defines.s64_const).s64_1))
    realNumber = (Defines.s64_const).s64_1
  end
  numberPad:updateConfirmButton()
end

Panel_NumberPad_Mouse_Scroll_Event = function(isUp)
  -- function num : 0_20 , upvalues : realNumber, numberPad, _edit_Number
  local currentNumber_s32 = Int64toInt32(realNumber)
  local currentNumber_s64 = toInt64(0, currentNumber_s32)
  local inputNumber_s64 = currentNumber_s64
  if isUp == true then
    if numberPad.s64_moneyMaxNumber <= currentNumber_s64 then
      return 
    end
    inputNumber_s64 = currentNumber_s64 + toInt64(0, 1)
  else
    if isUp == false then
      if currentNumber_s32 <= 1 then
        return 
      end
      inputNumber_s64 = currentNumber_s64 - toInt64(0, 1)
    end
  end
  _edit_Number:SetEditText(makeDotMoney(inputNumber_s64))
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R4 in 'UnsetPending'

  numberPad.s64_inputNumber = inputNumber_s64
  realNumber = numberPad.s64_inputNumber
end

Panel_NumberPad_Default_ConfirmFunction = function(count, param0, param1)
  -- function num : 0_21
  Panel_NumberPad_Show(false, (Defines.s64_const).s64_0, 0, nil)
end

Panel_NumberPad_IsPopUp = function()
  -- function num : 0_22
  return Panel_Window_Exchange_Number:IsShow()
end

Panel_NumberPad_IsType = function(_type)
  -- function num : 0_23 , upvalues : numberPad
  do return numberPad._type == _type end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

Panel_NumberPad_SetType = function(_type)
  -- function num : 0_24 , upvalues : numberPad
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  numberPad._type = _type
end

Panel_NumberPad_NumberKey_Input = function()
  -- function num : 0_25 , upvalues : numberKeyCode, VCK
  for idx,val in ipairs(numberKeyCode) do
    if isKeyDown_Once(val) then
      Panel_NumberPad_ButtonNumber_Mouse_Click(nil)
    end
  end
  do
    if isKeyDown_Once(VCK.KeyCode_BACK) or isKeyDown_Once(VCK.KeyCode_DELETE) then
      Panel_NumberPad_ButtonBackSpace_Mouse_Click(true)
    end
  end
end

Panel_Window_Exchange_Number:addInputEvent("Mouse_UpScroll", "Panel_NumberPad_Mouse_Scroll_Event(true)")
Panel_Window_Exchange_Number:addInputEvent("Mouse_DownScroll", "Panel_NumberPad_Mouse_Scroll_Event(false)")
numberPad:init()

