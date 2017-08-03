-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\option\panel_keycustom_ui.luac 

-- params : ...
-- function num : 0
local INPUT_COUNT_START_UI = 0
local INPUT_COUNT_END_UI = 14
local STATIC_INPUT_TITLE_UI = {}
local BUTTON_KEY_UI = {}
local BUTTON_PAD_UI = {}
local INPUT_TYPE_UI = nil
local controls = {title = (UI.getChildControl)(Panel_KeyCustom_Ui, "StaticText_Title"), subtitle1 = (UI.getChildControl)(Panel_KeyCustom_Ui, "StaticText_Keyboard"), subtitle2 = (UI.getChildControl)(Panel_KeyCustom_Ui, "StaticText_Gamepad"), BG = (UI.getChildControl)(Panel_KeyCustom_Ui, "Static_BG"), confirm = (UI.getChildControl)(Panel_KeyCustom_Ui, "Button_Confirm"), cancel = (UI.getChildControl)(Panel_KeyCustom_Ui, "Button_Cancel"), apply = (UI.getChildControl)(Panel_KeyCustom_Ui, "Button_Apply"), scrollbar = (UI.getChildControl)(Panel_KeyCustom_Ui, "Scroll_Vertical"), scrollbarBtn = nil, sample_staticInputTitle = (UI.getChildControl)(Panel_KeyCustom_Ui, "StaticText_MoveFoward"), sample_keyButton = (UI.getChildControl)(Panel_KeyCustom_Ui, "Button_Key_MoveFoward"), sample_padButton = (UI.getChildControl)(Panel_KeyCustom_Ui, "Button_Pad_MoveFoward")}
local keyConfigListShowCount_UI = 10
local configDataIndex_UI = 0
local keyConfigData_UI = {}
local getKeyConfigData_UI = function(index)
  -- function num : 0_0 , upvalues : keyConfigData_UI, configDataIndex_UI
  return keyConfigData_UI[configDataIndex_UI + index]
end

local setKeyConfigData_UI = function(index, title, button, padKey)
  -- function num : 0_1 , upvalues : keyConfigData_UI
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R4 in 'UnsetPending'

  if title ~= nil then
    keyConfigData_UI[index] = {titleText = title, buttonKeyText = button, padKeyText = padKey}
  else
    -- DECOMPILER ERROR at PC13: Confused about usage of register: R4 in 'UnsetPending'

    if button ~= nil then
      (keyConfigData_UI[index]).buttonKeyText = button
    else
      -- DECOMPILER ERROR at PC17: Confused about usage of register: R4 in 'UnsetPending'

      ;
      (keyConfigData_UI[index]).padKeyText = padKey
    end
  end
end

local setKeyConfigData_UITitle = function(index, title)
  -- function num : 0_2 , upvalues : setKeyConfigData_UI
  setKeyConfigData_UI(index, title, "", "")
end

local setKeyConfigData_UIConfigButton = function(index, button)
  -- function num : 0_3 , upvalues : setKeyConfigData_UI
  setKeyConfigData_UI(index, nil, button, nil)
end

local setKeyConfigData_UIConfigPad = function(index, pad)
  -- function num : 0_4 , upvalues : setKeyConfigData_UI
  setKeyConfigData_UI(index, nil, nil, pad)
end

local updateKeyConfig_UI = function()
  -- function num : 0_5 , upvalues : keyConfigListShowCount_UI, getKeyConfigData_UI, STATIC_INPUT_TITLE_UI, BUTTON_KEY_UI, BUTTON_PAD_UI
  for index = 0, keyConfigListShowCount_UI - 1 do
    local keyConfigData_UI = getKeyConfigData_UI(index)
    if keyConfigData_UI ~= nil then
      (STATIC_INPUT_TITLE_UI[index]):SetText(keyConfigData_UI.titleText)
      ;
      (BUTTON_KEY_UI[index]):SetText(keyConfigData_UI.buttonKeyText)
      ;
      (BUTTON_PAD_UI[index]):SetText(keyConfigData_UI.padKeyText)
    else
      ;
      (STATIC_INPUT_TITLE_UI[index]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_KEYCUSTOM_KEYSET_EMPTY"))
      ;
      (BUTTON_KEY_UI[index]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_KEYCUSTOM_KEYSET_EMPTY"))
      ;
      (BUTTON_PAD_UI[index]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_KEYCUSTOM_KEYSET_EMPTY"))
    end
  end
end

local init = function()
  -- function num : 0_6 , upvalues : controls, keyConfigListShowCount_UI, STATIC_INPUT_TITLE_UI, BUTTON_KEY_UI, BUTTON_PAD_UI, INPUT_COUNT_START_UI, INPUT_COUNT_END_UI, setKeyConfigData_UITitle, updateKeyConfig_UI
  local adderPosY = 35
  local titleStaticPosY = (controls.sample_staticInputTitle):GetPosY()
  local keyButtonPosY = (controls.sample_keyButton):GetPosY()
  local padButtonPosY = (controls.sample_padButton):GetPosY()
  for ii = 0, keyConfigListShowCount_UI - 1 do
    -- DECOMPILER ERROR at PC31: Confused about usage of register: R8 in 'UnsetPending'

    STATIC_INPUT_TITLE_UI[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_KeyCustom_Ui, "StaticText_InputTitle_" .. tostring(ii))
    -- DECOMPILER ERROR at PC45: Confused about usage of register: R8 in 'UnsetPending'

    BUTTON_KEY_UI[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, Panel_KeyCustom_Ui, "Button_Key_" .. tostring(ii))
    -- DECOMPILER ERROR at PC59: Confused about usage of register: R8 in 'UnsetPending'

    BUTTON_PAD_UI[ii] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, Panel_KeyCustom_Ui, "Button_Pad_" .. tostring(ii))
    CopyBaseProperty(controls.sample_staticInputTitle, STATIC_INPUT_TITLE_UI[ii])
    CopyBaseProperty(controls.sample_keyButton, BUTTON_KEY_UI[ii])
    CopyBaseProperty(controls.sample_padButton, BUTTON_PAD_UI[ii])
    ;
    (STATIC_INPUT_TITLE_UI[ii]):SetIgnore(true)
    ;
    (STATIC_INPUT_TITLE_UI[ii]):SetShow(true)
    ;
    (BUTTON_KEY_UI[ii]):SetShow(true)
    ;
    (BUTTON_PAD_UI[ii]):SetShow(true)
    ;
    (STATIC_INPUT_TITLE_UI[ii]):SetPosY(titleStaticPosY)
    ;
    (BUTTON_KEY_UI[ii]):SetPosY(keyButtonPosY)
    ;
    (BUTTON_PAD_UI[ii]):SetPosY(padButtonPosY)
    ;
    (BUTTON_KEY_UI[ii]):addInputEvent("Mouse_LUp", "KeyCustom_UI_ButtonPushed_Key(" .. ii .. ")")
    ;
    (BUTTON_KEY_UI[ii]):addInputEvent("Mouse_UpScroll", "KeyCustom_Ui_Scroll( true )")
    ;
    (BUTTON_KEY_UI[ii]):addInputEvent("Mouse_DownScroll", "KeyCustom_Ui_Scroll( false )")
    ;
    (BUTTON_PAD_UI[ii]):addInputEvent("Mouse_LUp", "KeyCustom_UI_ButtonPushed_Pad(" .. ii .. ")")
    ;
    (BUTTON_PAD_UI[ii]):addInputEvent("Mouse_UpScroll", "KeyCustom_Ui_Scroll( true )")
    ;
    (BUTTON_PAD_UI[ii]):addInputEvent("Mouse_DownScroll", "KeyCustom_Ui_Scroll( false )")
    titleStaticPosY = titleStaticPosY + adderPosY
    keyButtonPosY = keyButtonPosY + adderPosY
    padButtonPosY = padButtonPosY + adderPosY
  end
  for index = INPUT_COUNT_START_UI, INPUT_COUNT_END_UI do
    local titleString = PAGetString(Defines.StringSheet_GAME, "Lua_KeyCustom_Ui_" .. index)
    setKeyConfigData_UITitle(index, titleString)
  end
  ;
  (controls.sample_staticInputTitle):SetShow(false)
  ;
  (controls.sample_keyButton):SetShow(false)
  ;
  (controls.sample_padButton):SetShow(false)
  updateKeyConfig_UI()
  -- DECOMPILER ERROR at PC199: Confused about usage of register: R4 in 'UnsetPending'

  controls.scrollbarBtn = (UI.getChildControl)(controls.scrollbar, "Scroll_CtrlButton")
  ;
  (controls.scrollbar):addInputEvent("Mouse_LPress", "KeyCustom_OnSlider()")
  ;
  (controls.scrollbarBtn):addInputEvent("Mouse_LPress", "KeyCustom_OnButton()")
  Panel_KeyCustom_Ui:addInputEvent("Mouse_UpScroll", "KeyCustom_Ui_Scroll( true )")
  Panel_KeyCustom_Ui:addInputEvent("Mouse_DownScroll", "KeyCustom_Ui_Scroll( false )")
  ;
  (controls.scrollbarBtn):SetSize((controls.scrollbarBtn):GetSizeX(), (controls.scrollbar):GetSizeY() / (INPUT_COUNT_END_UI - keyConfigListShowCount_UI))
end

local registEventHandler = function()
  -- function num : 0_7 , upvalues : controls
  (controls.confirm):addInputEvent("Mouse_LUp", "KeyCustom_Ui_Confirm()")
  ;
  (controls.cancel):addInputEvent("Mouse_LUp", "KeyCustom_Ui_Cancel()")
  ;
  (controls.apply):addInputEvent("Mouse_LUp", "KeyCustom_Ui_Apply()")
end

KeyCustom_Ui_Show = function()
  -- function num : 0_8
  Panel_KeyCustom_Ui:SetShow(true)
  keyCustom_StartEdit()
  KeyCustom_Ui_UpdateButtonText_Key()
  KeyCustom_Ui_UpdateButtonText_Pad()
end

KeyCustom_Ui_Close = function()
  -- function num : 0_9
  Panel_KeyCustom_Ui:SetShow(false)
  SetUIMode((Defines.UIMode).eUIMode_Default)
  ;
  (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_UiMode)
end

KeyCustom_Ui_UpdateButtonText_Key = function()
  -- function num : 0_10 , upvalues : INPUT_COUNT_START_UI, INPUT_COUNT_END_UI, setKeyConfigData_UIConfigButton, updateKeyConfig_UI
  for ii = INPUT_COUNT_START_UI, INPUT_COUNT_END_UI do
    setKeyConfigData_UIConfigButton(ii, keyCustom_GetString_UiKey(ii))
  end
  updateKeyConfig_UI()
end

KeyCustom_Ui_UpdateButtonText_Pad = function()
  -- function num : 0_11 , upvalues : INPUT_COUNT_START_UI, INPUT_COUNT_END_UI, setKeyConfigData_UIConfigPad, updateKeyConfig_UI
  for ii = INPUT_COUNT_START_UI, INPUT_COUNT_END_UI do
    setKeyConfigData_UIConfigPad(ii, keyCustom_GetString_UiPad(ii))
  end
  updateKeyConfig_UI()
end

KeyCustom_Ui_GetInputType = function()
  -- function num : 0_12 , upvalues : INPUT_TYPE_UI
  return INPUT_TYPE_UI
end

KeyCustom_Ui_Confirm = function()
  -- function num : 0_13
  keyCustom_applyChange()
  KeyCustom_Ui_Close()
end

KeyCustom_Ui_Cancel = function()
  -- function num : 0_14
  keyCustom_RollBack()
  KeyCustom_Ui_Close()
end

KeyCustom_Ui_Apply = function()
  -- function num : 0_15
  KeyCustom_Ui_Close()
end

KeyCustom_UI_ButtonPushed_Key = function(inputTypeIndex)
  -- function num : 0_16 , upvalues : configDataIndex_UI, INPUT_TYPE_UI
  local inputType = configDataIndex_UI + inputTypeIndex
  INPUT_TYPE_UI = inputType
  SetUIMode((Defines.UIMode).eUIMode_KeyCustom_UiKey)
end

KeyCustom_UI_ButtonPushed_Pad = function(inputTypeIndex)
  -- function num : 0_17 , upvalues : configDataIndex_UI, INPUT_TYPE_UI
  local inputType = configDataIndex_UI + inputTypeIndex
  INPUT_TYPE_UI = inputType
  SetUIMode((Defines.UIMode).eUIMode_KeyCustom_UiPad)
end

KeyCustom_Ui_Scroll = function(isUp)
  -- function num : 0_18 , upvalues : configDataIndex_UI, INPUT_COUNT_END_UI, keyConfigListShowCount_UI, controls, updateKeyConfig_UI
  if isUp then
    configDataIndex_UI = configDataIndex_UI - 1
  else
    configDataIndex_UI = configDataIndex_UI + 1
  end
  configDataIndex_UI = (math.min)((math.max)(configDataIndex_UI, 0), INPUT_COUNT_END_UI - keyConfigListShowCount_UI)
  ;
  (controls.scrollbar):SetControlPos(configDataIndex_UI / (INPUT_COUNT_END_UI - keyConfigListShowCount_UI))
  updateKeyConfig_UI()
end

Panel_KeyCustom_Ui:SetShow(false, false)
Panel_KeyCustom_Ui:ActiveMouseEventEffect(true)
Panel_KeyCustom_Ui:setGlassBackground(true)
init()
registEventHandler()

