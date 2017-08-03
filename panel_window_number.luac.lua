-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\keypad\panel_window_number.luac 

-- params : ...
-- function num : 0
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
local numberPad = {confirmFunction; MAX_NUMBER_BTN_COUNT = 10, s64_maxNumber = (Defines.s64_const).s64_0, s64_inputNumber = (Defines.s64_const).s64_0, param0 = nil, param1 = nil, init_Number = false, _buttonNumber = (Array.new)(), numberPadUiModeNotInput = false}
local numberKeyCode = {VCK.KeyCode_0, VCK.KeyCode_1, VCK.KeyCode_2, VCK.KeyCode_3, VCK.KeyCode_4, VCK.KeyCode_5, VCK.KeyCode_6, VCK.KeyCode_7, VCK.KeyCode_8, VCK.KeyCode_9, VCK.KeyCode_NUMPAD0, VCK.KeyCode_NUMPAD1, VCK.KeyCode_NUMPAD2, VCK.KeyCode_NUMPAD3, VCK.KeyCode_NUMPAD4, VCK.KeyCode_NUMPAD5, VCK.KeyCode_NUMPAD6, VCK.KeyCode_NUMPAD7, VCK.KeyCode_NUMPAD8, VCK.KeyCode_NUMPAD9}
local realNumber = nil
local _textNumber = (UI.getChildControl)(Panel_Window_Exchange_Number, "Static_DisplayNumber")
_textNumber:addInputEvent("Mouse_UpScroll", "Panel_NumberPad_Mouse_Scroll_Event(true)")
_textNumber:addInputEvent("Mouse_DownScroll", "Panel_NumberPad_Mouse_Scroll_Event(false)")
local _buttonClose = (UI.getChildControl)(Panel_Window_Exchange_Number, "Button_Close")
_buttonClose:addInputEvent("Mouse_LUp", "Panel_NumberPad_ButtonCancel_Mouse_Click()")
_buttonClose:addInputEvent("Mouse_UpScroll", "Panel_NumberPad_Mouse_Scroll_Event(true)")
_buttonClose:addInputEvent("Mouse_DownScroll", "Panel_NumberPad_Mouse_Scroll_Event(false)")
local _buttonCancel = (UI.getChildControl)(Panel_Window_Exchange_Number, "Button_Cancel")
_buttonCancel:addInputEvent("Mouse_LUp", "Panel_NumberPad_ButtonCancel_Mouse_Click()")
_buttonCancel:addInputEvent("Mouse_UpScroll", "Panel_NumberPad_Mouse_Scroll_Event(true)")
_buttonCancel:addInputEvent("Mouse_DownScroll", "Panel_NumberPad_Mouse_Scroll_Event(false)")
local _buttonClear = (UI.getChildControl)(Panel_Window_Exchange_Number, "Button_Clear")
_buttonClear:addInputEvent("Mouse_LUp", "Panel_NumberPad_ButtonClear_Mouse_Click()")
_buttonClear:addInputEvent("Mouse_UpScroll", "Panel_NumberPad_Mouse_Scroll_Event(true)")
_buttonClear:addInputEvent("Mouse_DownScroll", "Panel_NumberPad_Mouse_Scroll_Event(false)")
local _buttonBackSpace = (UI.getChildControl)(Panel_Window_Exchange_Number, "Button_Back")
_buttonBackSpace:addInputEvent("Mouse_LUp", "Panel_NumberPad_ButtonBackSpace_Mouse_Click(false)")
_buttonBackSpace:addInputEvent("Mouse_UpScroll", "Panel_NumberPad_Mouse_Scroll_Event(true)")
_buttonBackSpace:addInputEvent("Mouse_DownScroll", "Panel_NumberPad_Mouse_Scroll_Event(false)")
local _buttonConfirm = (UI.getChildControl)(Panel_Window_Exchange_Number, "Button_Apply")
_buttonConfirm:addInputEvent("Mouse_LUp", "Panel_NumberPad_ButtonConfirm_Mouse_Click()")
_buttonConfirm:addInputEvent("Mouse_UpScroll", "Panel_NumberPad_Mouse_Scroll_Event(true)")
_buttonConfirm:addInputEvent("Mouse_DownScroll", "Panel_NumberPad_Mouse_Scroll_Event(false)")
local _buttonAllSelect = (UI.getChildControl)(Panel_Window_Exchange_Number, "Button_AllSelect")
_buttonAllSelect:addInputEvent("Mouse_LUp", "Panel_NumberPad_ButtonAllSelect_Mouse_Click(0)")
_buttonAllSelect:addInputEvent("Mouse_UpScroll", "Panel_NumberPad_Mouse_Scroll_Event(true)")
_buttonAllSelect:addInputEvent("Mouse_DownScroll", "Panel_NumberPad_Mouse_Scroll_Event(false)")
local _checkButtonMaxCount = (UI.getChildControl)(Panel_Window_Exchange_Number, "CheckButton_MaxCount")
_checkButtonMaxCount:addInputEvent("Mouse_LUp", "Panel_NumberPad_ButtonAllSelect_Mouse_Click(1)")
_checkButtonMaxCount:SetCheck(false)
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

Panel_NumberPad_CheckButtonShow = function(isShow)
  -- function num : 0_1 , upvalues : numberPad, _buttonBackSpace, _buttonClear, _buttonAllSelect, _buttonConfirm, _buttonCancel, _checkButtonMaxCount
  if isShow then
    ((numberPad._buttonNumber)[1]):SetPosY(180)
    ;
    ((numberPad._buttonNumber)[2]):SetPosY(148)
    ;
    ((numberPad._buttonNumber)[3]):SetPosY(148)
    ;
    ((numberPad._buttonNumber)[4]):SetPosY(148)
    ;
    ((numberPad._buttonNumber)[5]):SetPosY(116)
    ;
    ((numberPad._buttonNumber)[6]):SetPosY(116)
    ;
    ((numberPad._buttonNumber)[7]):SetPosY(116)
    ;
    ((numberPad._buttonNumber)[8]):SetPosY(84)
    ;
    ((numberPad._buttonNumber)[9]):SetPosY(84)
    ;
    ((numberPad._buttonNumber)[10]):SetPosY(84)
    _buttonBackSpace:SetPosY(180)
    _buttonClear:SetPosY(180)
    _buttonAllSelect:SetPosY(216)
    _buttonConfirm:SetPosY(237)
    _buttonCancel:SetPosY(237)
  else
    ;
    ((numberPad._buttonNumber)[1]):SetPosY(160)
    ;
    ((numberPad._buttonNumber)[2]):SetPosY(128)
    ;
    ((numberPad._buttonNumber)[3]):SetPosY(128)
    ;
    ((numberPad._buttonNumber)[4]):SetPosY(128)
    ;
    ((numberPad._buttonNumber)[5]):SetPosY(96)
    ;
    ((numberPad._buttonNumber)[6]):SetPosY(96)
    ;
    ((numberPad._buttonNumber)[7]):SetPosY(96)
    ;
    ((numberPad._buttonNumber)[8]):SetPosY(64)
    ;
    ((numberPad._buttonNumber)[9]):SetPosY(64)
    ;
    ((numberPad._buttonNumber)[10]):SetPosY(64)
    _buttonBackSpace:SetPosY(160)
    _buttonClear:SetPosY(160)
    _buttonAllSelect:SetPosY(196)
    _buttonConfirm:SetPosY(217)
    _buttonCancel:SetPosY(217)
  end
  _checkButtonMaxCount:SetShow(isShow)
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

Panel_NumberPad_Init = function(param0, confirmFunction, isShow, param1)
  -- function num : 0_4 , upvalues : numberPad, realNumber, _textNumber, _buttonConfirm, UI_color
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R4 in 'UnsetPending'

  numberPad.param0 = param0
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R4 in 'UnsetPending'

  numberPad.param1 = param1
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R4 in 'UnsetPending'

  numberPad.confirmFunction = confirmFunction
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R4 in 'UnsetPending'

  numberPad.init_Number = true
  realNumber = numberPad.s64_inputNumber
  _textNumber:SetEditText(tostring(numberPad.s64_inputNumber))
  _textNumber:SetNumberMode(true)
  _buttonConfirm:SetEnable(true)
  _buttonConfirm:SetMonoTone(false)
  _buttonConfirm:SetFontColor(UI_color.C_FFFFFFFF)
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
    numberPad.s64_maxNumber = (Defines.s64_const).s64_0
    -- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

    numberPad.s64_inputNumber = (Defines.s64_const).s64_0
    -- DECOMPILER ERROR at PC16: Confused about usage of register: R0 in 'UnsetPending'

    numberPad.param0 = nil
    -- DECOMPILER ERROR at PC18: Confused about usage of register: R0 in 'UnsetPending'

    numberPad.param1 = nil
    -- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

    numberPad.confirmFunction = nil
    Panel_Window_Exchange_Number:SetShow(false, true)
  end
end

Panel_NumberPad_Show_Min = function(isShow, s64_minNumber, param0, confirmFunction, param1)
  -- function num : 0_7 , upvalues : IM, numberPad, _textNumber, realNumber
  if not isShow then
    Panel_NumberPad_Close()
    ;
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    ClearFocusEdit()
    if numberPad.numberPadUiModeNotInput then
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiModeNotInput)
    end
  else
    -- DECOMPILER ERROR at PC25: Confused about usage of register: R5 in 'UnsetPending'

    numberPad.s64_maxNumber = (Defines.s64_const).s64_max
    -- DECOMPILER ERROR at PC27: Confused about usage of register: R5 in 'UnsetPending'

    numberPad.s64_inputNumber = s64_minNumber
    Panel_NumberPad_Init(param0, confirmFunction, true, param1)
    ;
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
    SetFocusEdit(_textNumber)
    realNumber = numberPad.s64_maxNumber
    _textNumber:SetEditText(makeDotMoney(numberPad.s64_maxNumber))
  end
end

local _isExchange = nil
Panel_NumberPad_Show = function(isShow, s64_maxNumber, param0, confirmFunction, isExchange, param1, isItemMarket)
  -- function num : 0_8 , upvalues : _isExchange, _textNumber, IM, numberPad, _checkButtonMaxCount, realNumber
  _isExchange = isExchange
  local maxLength = (string.len)(tostring(s64_maxNumber))
  _textNumber:SetMaxInput(maxLength + 1)
  if not isShow then
    Panel_NumberPad_Close()
    ;
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    ClearFocusEdit()
    if numberPad.numberPadUiModeNotInput then
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiModeNotInput)
    end
  else
    -- DECOMPILER ERROR at PC33: Confused about usage of register: R8 in 'UnsetPending'

    numberPad.s64_maxNumber = s64_maxNumber
    -- DECOMPILER ERROR at PC37: Confused about usage of register: R8 in 'UnsetPending'

    if isItemMarket == true then
      numberPad.s64_inputNumber = s64_maxNumber
    else
      -- DECOMPILER ERROR at PC45: Confused about usage of register: R8 in 'UnsetPending'

      if _checkButtonMaxCount:IsCheck() then
        numberPad.s64_inputNumber = s64_maxNumber
      else
        -- DECOMPILER ERROR at PC51: Confused about usage of register: R8 in 'UnsetPending'

        numberPad.s64_inputNumber = (Defines.s64_const).s64_1
      end
    end
    if (Defines.s64_const).s64_1 == s64_maxNumber then
      Panel_NumberPad_Init(param0, confirmFunction, false, param1)
      Panel_NumberPad_ButtonConfirm_Mouse_Click()
    else
      Panel_NumberPad_Init(param0, confirmFunction, true, param1)
      ;
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
      SetFocusEdit(_textNumber)
      if isItemMarket == true then
        realNumber = s64_maxNumber
        _textNumber:SetEditText(makeDotMoney(s64_maxNumber))
      else
        if _checkButtonMaxCount:IsCheck() then
          realNumber = s64_maxNumber
          _textNumber:SetEditText(makeDotMoney(s64_maxNumber))
        else
          realNumber = (Defines.s64_const).s64_1
          _textNumber:SetEditText("1")
        end
      end
    end
  end
  Panel_Window_Exchange_Number:SetSize(200, 260)
  Panel_NumberPad_CheckButtonShow(true)
end

local slotNo, whereType = nil, nil
Panel_NumberPad_Show_MaxCount = function(isShow, s64_maxNumber, param0, confirmFunction, isExchange, param1, isItemMarket)
  -- function num : 0_9 , upvalues : _isExchange, _textNumber, IM, numberPad, _checkButtonMaxCount, realNumber, slotNo, whereType
  _isExchange = isExchange
  local maxLength = (string.len)(tostring(s64_maxNumber))
  _textNumber:SetMaxInput(maxLength + 1)
  if not isShow then
    Panel_NumberPad_Close()
    ;
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    ClearFocusEdit()
    if numberPad.numberPadUiModeNotInput then
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiModeNotInput)
    end
  else
    -- DECOMPILER ERROR at PC33: Confused about usage of register: R8 in 'UnsetPending'

    numberPad.s64_maxNumber = s64_maxNumber
    -- DECOMPILER ERROR at PC40: Confused about usage of register: R8 in 'UnsetPending'

    if _checkButtonMaxCount:IsCheck() then
      numberPad.s64_inputNumber = s64_maxNumber
    else
      -- DECOMPILER ERROR at PC46: Confused about usage of register: R8 in 'UnsetPending'

      numberPad.s64_inputNumber = (Defines.s64_const).s64_1
    end
    if (Defines.s64_const).s64_1 == s64_maxNumber then
      Panel_NumberPad_Init(param0, confirmFunction, false, param1)
      Panel_NumberPad_ButtonConfirm_Mouse_Click()
    else
      Panel_NumberPad_Init(param0, confirmFunction, true, param1)
      ;
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
      SetFocusEdit(_textNumber)
      if _checkButtonMaxCount:IsCheck() then
        realNumber = s64_maxNumber
        _textNumber:SetEditText(makeDotMoney(s64_maxNumber))
      else
        realNumber = (Defines.s64_const).s64_1
        _textNumber:SetEditText("1")
      end
    end
  end
  slotNo = param0
  whereType = param1
  Panel_Window_Exchange_Number:SetSize(200, 260)
  Panel_NumberPad_CheckButtonShow(true)
end

Panel_NumberPad_SetMaxCount = function()
  -- function num : 0_10 , upvalues : numberPad, slotNo, whereType
  Panel_NumberPad_Show_MaxCount(true, numberPad.s64_maxNumber, slotNo, Warehouse_PushFromInventoryItemXXX, nil, whereType)
end

FGlobal_SetNumberPadUiModeNotInput = function(isSet)
  -- function num : 0_11 , upvalues : numberPad
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  numberPad.numberPadUiModeNotInput = isSet
end

Panel_NumberPad_ButtonClose_Mouse_Click = function()
  -- function num : 0_12
  Panel_NumberPad_Show(false, (Defines.s64_const).s64_0, 0, nil)
end

Panel_NumberPad_ButtonCancel_Mouse_Click = function()
  -- function num : 0_13
  Panel_NumberPad_Show(false, (Defines.s64_const).s64_0, 0, nil)
end

Panel_NumberPad_ButtonClear_Mouse_Click = function()
  -- function num : 0_14 , upvalues : numberPad, _textNumber, realNumber, _isExchange, _buttonConfirm, UI_color
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R0 in 'UnsetPending'

  numberPad.s64_inputNumber = (Defines.s64_const).s64_0
  _textNumber:SetEditText("0")
  realNumber = numberPad.s64_inputNumber
  if _isExchange ~= true then
    _buttonConfirm:SetEnable(false)
    _buttonConfirm:SetMonoTone(true)
    _buttonConfirm:SetFontColor(UI_color.C_FFC4BEBE)
  end
end

Panel_NumberPad_ButtonNumber_Mouse_Click = function(number)
  -- function num : 0_15 , upvalues : _textNumber, numberPad, strlen, substring, realNumber, _isExchange, _buttonConfirm, UI_color
  local newStr = _textNumber:GetEditText()
  if number ~= nil then
    newStr = newStr .. tostring(number)
  end
  newStr = (string.gsub)(newStr, ",", "")
  local s64_newNumber = tonumber64(newStr)
  local s64_MAX = numberPad.s64_maxNumber
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
          numberPad.s64_inputNumber = numberPad.s64_maxNumber
        else
          if (string.len)(newStr) == 0 then
            _textNumber:SetEditText("0")
            -- DECOMPILER ERROR at PC65: Confused about usage of register: R4 in 'UnsetPending'

            numberPad.s64_inputNumber = 0
          else
            -- DECOMPILER ERROR at PC68: Confused about usage of register: R4 in 'UnsetPending'

            numberPad.s64_inputNumber = s64_newNumber
          end
        end
        realNumber = numberPad.s64_inputNumber
        _textNumber:SetEditText(makeDotMoney(numberPad.s64_inputNumber))
        if (Defines.s64_const).s64_0 < numberPad.s64_inputNumber or _isExchange == true then
          _buttonConfirm:SetEnable(true)
          _buttonConfirm:SetMonoTone(false)
          _buttonConfirm:SetFontColor(UI_color.C_FFFFFFFF)
        else
          _buttonConfirm:SetEnable(false)
          _buttonConfirm:SetMonoTone(true)
          _buttonConfirm:SetFontColor(UI_color.C_FFC4BEBE)
        end
      end
    end
  end
end

Panel_NumberPad_ButtonBackSpace_Mouse_Click = function(fromOnKey)
  -- function num : 0_16 , upvalues : realNumber, strlen, substring, numberPad, _textNumber, _buttonConfirm, UI_color
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
  _textNumber:SetEditText(makeDotMoney(numberPad.s64_inputNumber))
  if numberPad.s64_inputNumber <= (Defines.s64_const).s64_0 then
    _buttonConfirm:SetEnable(false)
    _buttonConfirm:SetMonoTone(true)
    _buttonConfirm:SetFontColor(UI_color.C_FFC4BEBE)
  end
end

Panel_NumberPad_ButtonConfirm_Mouse_Click = function()
  -- function num : 0_17 , upvalues : numberPad, _isExchange
  if (Defines.s64_const).s64_0 < numberPad.s64_inputNumber or _isExchange == true then
    if numberPad.confirmFunction ~= nil then
      (numberPad.confirmFunction)(numberPad.s64_inputNumber, numberPad.param0, numberPad.param1)
    end
    Panel_NumberPad_Show(false, (Defines.s64_const).s64_0, 0, nil)
  end
end

Panel_NumberPad_ButtonAllSelect_Mouse_Click = function(isType)
  -- function num : 0_18 , upvalues : numberPad, _checkButtonMaxCount, _textNumber, realNumber, IM
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R1 in 'UnsetPending'

  numberPad.s64_inputNumber = numberPad.s64_maxNumber
  if isType == 1 then
    if not _checkButtonMaxCount:IsCheck() then
      Panel_NumberPad_Init(numberPad.param0, numberPad.confirmFunction, false, numberPad.param1)
      SetFocusEdit(_textNumber)
      _textNumber:SetEditText(tostring((Defines.s64_const).s64_1))
      realNumber = (Defines.s64_const).s64_1
      -- DECOMPILER ERROR at PC39: Confused about usage of register: R1 in 'UnsetPending'

      numberPad.s64_inputNumber = (Defines.s64_const).s64_1
    else
      Panel_NumberPad_Init(numberPad.param0, numberPad.confirmFunction, false, numberPad.param1)
      ;
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
      SetFocusEdit(_textNumber)
      _textNumber:SetEditText(makeDotMoney(numberPad.s64_maxNumber))
      realNumber = numberPad.s64_maxNumber
    end
  else
    if isType == 0 then
      if (Defines.s64_const).s64_1 == s64_maxNumber then
        Panel_NumberPad_Init(numberPad.param0, numberPad.confirmFunction, false, numberPad.param1)
        Panel_NumberPad_ButtonConfirm_Mouse_Click()
      else
        Panel_NumberPad_Init(numberPad.param0, numberPad.confirmFunction, false, numberPad.param1)
        ;
        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
        SetFocusEdit(_textNumber)
        _textNumber:SetEditText(makeDotMoney(numberPad.s64_maxNumber))
        realNumber = numberPad.s64_maxNumber
      end
    end
  end
end

Panel_NumberPad_Mouse_Scroll_Event = function(isUp)
  -- function num : 0_19 , upvalues : realNumber, numberPad, _textNumber
  local currentNumber_s32 = Int64toInt32(realNumber)
  local currentNumber_s64 = toInt64(0, currentNumber_s32)
  local inputNumber_s64 = currentNumber_s64
  if isUp == true then
    if numberPad.s64_maxNumber <= currentNumber_s64 then
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
  _textNumber:SetEditText(makeDotMoney(inputNumber_s64))
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R4 in 'UnsetPending'

  numberPad.s64_inputNumber = inputNumber_s64
  realNumber = numberPad.s64_inputNumber
end

Panel_NumberPad_Default_ConfirmFunction = function(count, param0, param1)
  -- function num : 0_20
  Panel_NumberPad_Show(false, (Defines.s64_const).s64_0, 0, nil)
end

Panel_NumberPad_IsPopUp = function()
  -- function num : 0_21
  return Panel_Window_Exchange_Number:IsShow()
end

Panel_NumberPad_NumberKey_Input = function()
  -- function num : 0_22 , upvalues : numberKeyCode, VCK
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
ConsoleGroupCreate_Panel_Window_Exchange_Number = function()
  -- function num : 0_23 , upvalues : _textNumber, _checkButtonMaxCount, numberPad, _buttonBackSpace, _buttonClear, _buttonAllSelect, _buttonConfirm, _buttonCancel
  local group_0 = Panel_Window_Exchange_Number:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  local group_1 = Panel_Window_Exchange_Number:addConsoleUIGroup(1, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  local group_2 = Panel_Window_Exchange_Number:addConsoleUIGroup(2, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  group_0:addControl(0, 0, 2, 1, _textNumber)
  group_0:addControl(1, 0, 2, 1, _checkButtonMaxCount)
  group_1:addControl(0, 2, 3, 4, (numberPad._buttonNumber)[2])
  group_1:addControl(1, 2, 3, 4, (numberPad._buttonNumber)[3])
  group_1:addControl(2, 2, 3, 4, (numberPad._buttonNumber)[4])
  group_1:addControl(0, 1, 3, 4, (numberPad._buttonNumber)[5])
  group_1:addControl(1, 1, 3, 4, (numberPad._buttonNumber)[6])
  group_1:addControl(2, 1, 3, 4, (numberPad._buttonNumber)[7])
  group_1:addControl(0, 0, 3, 4, (numberPad._buttonNumber)[8])
  group_1:addControl(1, 0, 3, 4, (numberPad._buttonNumber)[9])
  group_1:addControl(2, 0, 3, 4, (numberPad._buttonNumber)[10])
  group_1:addControl(0, 3, 3, 4, (numberPad._buttonNumber)[1])
  group_1:addControl(1, 3, 3, 4, _buttonBackSpace)
  group_1:addControl(2, 3, 3, 4, _buttonClear)
  group_2:addControl(0, 0, 3, 1, _buttonAllSelect)
  group_2:addControl(1, 0, 3, 1, _buttonConfirm)
  group_2:addControl(2, 0, 3, 1, _buttonCancel)
end

ConsoleGroupCreate_Panel_Window_Exchange_Number()

