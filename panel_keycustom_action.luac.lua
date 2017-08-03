-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\option\panel_keycustom_action.luac 

-- params : ...
-- function num : 0
local INPUT_COUNT_START = 0
local INPUT_COUNT_END = 29
local STATIC_INPUT_TITLE = {}
local BUTTON_KEY = {}
local BUTTON_PAD = {}
local INPUT_TYPE = nil
local controls = {title = (UI.getChildControl)(Panel_KeyCustom_Action, "StaticText_Title"), subtitle1 = (UI.getChildControl)(Panel_KeyCustom_Action, "StaticText_Keyboard"), subtitle2 = (UI.getChildControl)(Panel_KeyCustom_Action, "StaticText_Gamepad"), BG = (UI.getChildControl)(Panel_KeyCustom_Action, "Static_BG"), confirm = (UI.getChildControl)(Panel_KeyCustom_Action, "Button_Confirm"), cancel = (UI.getChildControl)(Panel_KeyCustom_Action, "Button_Cancel"), apply = (UI.getChildControl)(Panel_KeyCustom_Action, "Button_Apply"), scrollbar = (UI.getChildControl)(Panel_KeyCustom_Action, "Scroll_Vertical"), scrollbarBtn = nil, staticInputTitle_Func1 = (UI.getChildControl)(Panel_KeyCustom_Action, "StaticText_PadFunc1"), staticInputTitle_Func2 = (UI.getChildControl)(Panel_KeyCustom_Action, "StaticText_PadFunc2"), button_key = (UI.getChildControl)(Panel_KeyCustom_Action, "Button_Key"), button_Pad_Func1 = (UI.getChildControl)(Panel_KeyCustom_Action, "Button_PadFunc1"), button_Pad_Func2 = (UI.getChildControl)(Panel_KeyCustom_Action, "Button_PadFunc2"), sample_staticInputTitle = (UI.getChildControl)(Panel_KeyCustom_Action, "StaticText_PadFunc2"), sample_keyButton = (UI.getChildControl)(Panel_KeyCustom_Action, "Button_Key"), sample_padButton = (UI.getChildControl)(Panel_KeyCustom_Action, "Button_PadFunc2")}
local keyConfigListShowCount = 10
local configDataIndex = 0
local keyConfigData = {}
local getKeyConfigData = function(index)
  -- function num : 0_0 , upvalues : keyConfigData, configDataIndex
  return keyConfigData[configDataIndex + index - 2]
end

local setKeyConfigDataTitle = function(index, title)
  -- function num : 0_1 , upvalues : keyConfigData
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R2 in 'UnsetPending'

  keyConfigData[index] = {titleText = title, buttonKeyText = "", padKeyText = "", padOnly = false}
end

local setKeyConfigDataConfigButton = function(index, button)
  -- function num : 0_2 , upvalues : keyConfigData
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R2 in 'UnsetPending'

  (keyConfigData[index]).buttonKeyText = button
end

local setKeyConfigDataConfigPad = function(index, pad)
  -- function num : 0_3 , upvalues : keyConfigData
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R2 in 'UnsetPending'

  (keyConfigData[index]).padKeyText = pad
end

local setKeyConfigDataConfigOnlyPad = function(index, padOnly)
  -- function num : 0_4 , upvalues : keyConfigData
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R2 in 'UnsetPending'

  (keyConfigData[index]).padOnly = padOnly
end

local updateKeyConfig = function()
  -- function num : 0_5 , upvalues : keyConfigListShowCount, getKeyConfigData, STATIC_INPUT_TITLE, BUTTON_KEY, BUTTON_PAD
  for index = 0, keyConfigListShowCount - 1 do
    local keyConfigData = getKeyConfigData(index)
    if keyConfigData ~= nil then
      (STATIC_INPUT_TITLE[index]):SetText(keyConfigData.titleText)
      if keyConfigData.padOnly == false then
        (BUTTON_KEY[index]):SetText(keyConfigData.buttonKeyText)
        ;
        (BUTTON_KEY[index]):SetShow(true)
      else
        ;
        (BUTTON_KEY[index]):SetShow(false)
      end
      ;
      (BUTTON_PAD[index]):SetText(keyConfigData.padKeyText)
    else
      ;
      (STATIC_INPUT_TITLE[index]):SetText(" ")
      ;
      (BUTTON_KEY[index]):SetText(" ")
      ;
      (BUTTON_PAD[index]):SetText(" ")
    end
  end
end

KeyCustom_OnButton = function()
  -- function num : 0_6 , upvalues : controls, configDataIndex, INPUT_COUNT_END, keyConfigListShowCount, updateKeyConfig
  local volume = (controls.scrollbarBtn):GetPosY() / ((controls.scrollbar):GetSizeY() - (controls.scrollbarBtn):GetSizeY())
  configDataIndex = (math.floor)((INPUT_COUNT_END - keyConfigListShowCount + 1) * volume)
  updateKeyConfig()
end

KeyCustom_OnSlider = function()
  -- function num : 0_7 , upvalues : controls, configDataIndex, INPUT_COUNT_END, keyConfigListShowCount, updateKeyConfig
  local volume = (controls.scrollbar):GetControlPos()
  configDataIndex = (math.floor)((INPUT_COUNT_END - keyConfigListShowCount + 1) * volume)
  updateKeyConfig()
end

local init = function()
  -- function num : 0_8 , upvalues : controls, keyConfigListShowCount, STATIC_INPUT_TITLE, BUTTON_KEY, BUTTON_PAD, INPUT_COUNT_START, INPUT_COUNT_END, setKeyConfigDataTitle, setKeyConfigDataConfigOnlyPad, updateKeyConfig
  local adderPosY = 35
  local titleStaticPosY = (controls.button_Pad_Func1):GetPosY()
  local keyButtonPosY = (controls.button_Pad_Func1):GetPosY()
  local padButtonPosY = (controls.button_Pad_Func1):GetPosY()
  for ii = 0, keyConfigListShowCount - 1 do
    -- DECOMPILER ERROR at PC31: Confused about usage of register: R8 in 'UnsetPending'

    STATIC_INPUT_TITLE[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_KeyCustom_Action, "StaticText_InputTitle_" .. tostring(ii))
    -- DECOMPILER ERROR at PC45: Confused about usage of register: R8 in 'UnsetPending'

    BUTTON_KEY[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, Panel_KeyCustom_Action, "Button_Key_" .. tostring(ii))
    -- DECOMPILER ERROR at PC59: Confused about usage of register: R8 in 'UnsetPending'

    BUTTON_PAD[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, Panel_KeyCustom_Action, "Button_Pad_" .. tostring(ii))
    CopyBaseProperty(controls.staticInputTitle_Func1, STATIC_INPUT_TITLE[ii])
    CopyBaseProperty(controls.button_key, BUTTON_KEY[ii])
    CopyBaseProperty(controls.button_Pad_Func2, BUTTON_PAD[ii])
    ;
    (STATIC_INPUT_TITLE[ii]):SetIgnore(true)
    ;
    (STATIC_INPUT_TITLE[ii]):SetShow(true)
    ;
    (BUTTON_KEY[ii]):SetShow(true)
    ;
    (BUTTON_PAD[ii]):SetShow(true)
    ;
    (STATIC_INPUT_TITLE[ii]):SetPosY(titleStaticPosY)
    ;
    (BUTTON_KEY[ii]):SetPosY(keyButtonPosY)
    ;
    (BUTTON_PAD[ii]):SetPosY(padButtonPosY)
    ;
    (BUTTON_KEY[ii]):addInputEvent("Mouse_LUp", "KeyCustom_Action_ButtonPushed_Key(" .. ii .. ")")
    ;
    (BUTTON_KEY[ii]):addInputEvent("Mouse_UpScroll", "KeyCustom_Action_Scroll( true )")
    ;
    (BUTTON_KEY[ii]):addInputEvent("Mouse_DownScroll", "KeyCustom_Action_Scroll( false )")
    ;
    (BUTTON_PAD[ii]):addInputEvent("Mouse_LUp", "KeyCustom_Action_ButtonPushed_Pad(" .. ii .. ")")
    ;
    (BUTTON_PAD[ii]):addInputEvent("Mouse_UpScroll", "KeyCustom_Action_Scroll( true )")
    ;
    (BUTTON_PAD[ii]):addInputEvent("Mouse_DownScroll", "KeyCustom_Action_Scroll( false )")
    titleStaticPosY = titleStaticPosY + adderPosY
    keyButtonPosY = keyButtonPosY + adderPosY
    padButtonPosY = padButtonPosY + adderPosY
  end
  for index = INPUT_COUNT_START, INPUT_COUNT_END do
    local titleString = PAGetString(Defines.StringSheet_GAME, "Lua_KeyCustom_Action_" .. index)
    setKeyConfigDataTitle(index, titleString)
  end
  setKeyConfigDataTitle(-2, (controls.staticInputTitle_Func1):GetText())
  setKeyConfigDataTitle(-1, (controls.staticInputTitle_Func2):GetText())
  setKeyConfigDataConfigOnlyPad(-2, true)
  setKeyConfigDataConfigOnlyPad(-1, true)
  ;
  (controls.button_key):SetShow(false)
  ;
  (controls.button_Pad_Func2):SetShow(false)
  ;
  (controls.staticInputTitle_Func1):SetShow(false)
  ;
  (controls.staticInputTitle_Func2):SetShow(false)
  ;
  (controls.button_Pad_Func1):SetShow(false)
  ;
  (controls.button_Pad_Func2):SetShow(false)
  updateKeyConfig()
  -- DECOMPILER ERROR at PC236: Confused about usage of register: R4 in 'UnsetPending'

  controls.scrollbarBtn = (UI.getChildControl)(controls.scrollbar, "Scroll_CtrlButton")
  ;
  (controls.scrollbar):addInputEvent("Mouse_LPress", "KeyCustom_OnSlider()")
  ;
  (controls.scrollbarBtn):addInputEvent("Mouse_LPress", "KeyCustom_OnButton()")
  Panel_KeyCustom_Action:addInputEvent("Mouse_UpScroll", "KeyCustom_Action_Scroll( true )")
  Panel_KeyCustom_Action:addInputEvent("Mouse_DownScroll", "KeyCustom_Action_Scroll( false )")
  ;
  (controls.scrollbarBtn):SetSize((controls.scrollbarBtn):GetSizeX(), (controls.scrollbar):GetSizeY() / (INPUT_COUNT_END - keyConfigListShowCount))
end

local registEventHandler = function()
  -- function num : 0_9 , upvalues : controls
  (controls.confirm):addInputEvent("Mouse_LUp", "KeyCustom_Action_Confirm()")
  ;
  (controls.cancel):addInputEvent("Mouse_LUp", "KeyCustom_Action_Cancel()")
  ;
  (controls.apply):addInputEvent("Mouse_LUp", "KeyCustom_Action_Apply()")
end

KeyCustom_Action_Show = function()
  -- function num : 0_10 , upvalues : configDataIndex, controls, updateKeyConfig
  Panel_KeyCustom_Action:SetShow(true)
  SetUIMode((Defines.UIMode).eUIMode_KeyCustom_Wait)
  keyCustom_StartEdit()
  KeyCustom_Action_UpdateButtonText_Key()
  KeyCustom_Action_UpdateButtonText_Pad()
  configDataIndex = 0
  ;
  (controls.scrollbar):SetControlPos(0)
  updateKeyConfig()
end

KeyCustom_Action_Close = function()
  -- function num : 0_11
  Panel_KeyCustom_Action:SetShow(false)
  SetUIMode((Defines.UIMode).eUIMode_Default)
  ;
  (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_UiMode)
end

KeyCustom_Action_UpdateButtonText_Key = function()
  -- function num : 0_12 , upvalues : INPUT_COUNT_START, INPUT_COUNT_END, setKeyConfigDataConfigButton, updateKeyConfig
  for ii = INPUT_COUNT_START, INPUT_COUNT_END do
    setKeyConfigDataConfigButton(ii, keyCustom_GetString_ActionKey(ii))
  end
  updateKeyConfig()
end

KeyCustom_Action_UpdateButtonText_Pad = function()
  -- function num : 0_13 , upvalues : keyConfigData, INPUT_COUNT_START, INPUT_COUNT_END, setKeyConfigDataConfigPad, updateKeyConfig
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R0 in 'UnsetPending'

  (keyConfigData[-2]).padKeyText = keyCustom_GetString_ActionPadFunc1()
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (keyConfigData[-1]).padKeyText = keyCustom_GetString_ActionPadFunc2()
  for ii = INPUT_COUNT_START, INPUT_COUNT_END do
    setKeyConfigDataConfigPad(ii, keyCustom_GetString_ActionPad(ii))
  end
  updateKeyConfig()
end

KeyCustom_Action_GetInputType = function()
  -- function num : 0_14 , upvalues : INPUT_TYPE
  return INPUT_TYPE
end

KeyCustom_Action_Confirm = function()
  -- function num : 0_15
  keyCustom_applyChange()
  KeyCustom_Action_Close()
end

KeyCustom_Action_Cancel = function()
  -- function num : 0_16
  keyCustom_RollBack()
  KeyCustom_Action_Close()
end

KeyCustom_Action_Apply = function()
  -- function num : 0_17
  KeyCustom_Action_Close()
end

KeyCustom_Action_ButtonPushed_Key = function(inputTypeIndex)
  -- function num : 0_18 , upvalues : configDataIndex, INPUT_TYPE
  local inputType = configDataIndex + inputTypeIndex - 2
  if inputType >= 0 then
    INPUT_TYPE = inputType
    SetUIMode((Defines.UIMode).eUIMode_KeyCustom_ActionKey)
  end
end

KeyCustom_Action_ButtonPushed_Pad = function(inputTypeIndex)
  -- function num : 0_19 , upvalues : configDataIndex, INPUT_TYPE
  local inputType = configDataIndex + inputTypeIndex - 2
  if inputType >= 0 then
    INPUT_TYPE = inputType
    SetUIMode((Defines.UIMode).eUIMode_KeyCustom_ActionPad)
  else
    if inputType == -1 then
      KeyCustom_Action_ButtonPushed_PadFunc2()
    else
      KeyCustom_Action_ButtonPushed_PadFunc1()
    end
  end
end

KeyCustom_Action_ButtonPushed_PadFunc1 = function()
  -- function num : 0_20
  SetUIMode((Defines.UIMode).eUIMode_KeyCustom_ActionPadFunc1)
end

KeyCustom_Action_ButtonPushed_PadFunc2 = function()
  -- function num : 0_21
  SetUIMode((Defines.UIMode).eUIMode_KeyCustom_ActionPadFunc2)
end

KeyCustom_Action_Scroll = function(isUp)
  -- function num : 0_22 , upvalues : configDataIndex, INPUT_COUNT_END, keyConfigListShowCount, controls, updateKeyConfig
  if isUp then
    configDataIndex = configDataIndex - 1
  else
    configDataIndex = configDataIndex + 1
  end
  configDataIndex = (math.min)((math.max)(configDataIndex, 0), INPUT_COUNT_END - keyConfigListShowCount + 2)
  ;
  (controls.scrollbar):SetControlPos(configDataIndex / (INPUT_COUNT_END - keyConfigListShowCount + 2))
  updateKeyConfig()
end

Panel_KeyCustom_Action:SetShow(false, false)
Panel_KeyCustom_Action:ActiveMouseEventEffect(true)
Panel_KeyCustom_Action:setGlassBackground(true)
init()
registEventHandler()

