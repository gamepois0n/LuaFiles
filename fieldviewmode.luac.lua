-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\fieldviewmode\fieldviewmode.luac 

-- params : ...
-- function num : 0
local var_UI = {panel = Panel_FieldViewMode, btn_left = (UI.getChildControl)(Panel_FieldViewMode, "Button_Arrow_Left"), btn_right = (UI.getChildControl)(Panel_FieldViewMode, "Button_Arrow_Right"), btn_top = (UI.getChildControl)(Panel_FieldViewMode, "Button_Arrow_Top"), btn_bottom = (UI.getChildControl)(Panel_FieldViewMode, "Button_Arrow_Bottom"), btn_init = (UI.getChildControl)(Panel_FieldViewMode, "Button_Pos_Init"), btn_FreeSet1 = (UI.getChildControl)(Panel_FieldViewMode, "Button_FreeSet_1"), btn_FreeSet2 = (UI.getChildControl)(Panel_FieldViewMode, "Button_FreeSet_2"), btn_FreeSet3 = (UI.getChildControl)(Panel_FieldViewMode, "Button_FreeSet_3"), text_arrow = (UI.getChildControl)(Panel_FieldViewMode, "Button_TextManual"), bg_arrow = (UI.getChildControl)(Panel_FieldViewMode, "Static_ArrowBG"), text_preset = (UI.getChildControl)(Panel_FieldViewMode, "Button_TextPreset"), bg_preset = (UI.getChildControl)(Panel_FieldViewMode, "Static_PresetBG")}
local constVar = {modifyRate = 5}
local variable = {isShow = false}
local fieldViewText = (UI.getChildControl)(Panel_FieldViewMode, "StaticText_viewModeText")
FieldViewMode_ScreenResize = function()
  -- function num : 0_0 , upvalues : var_UI
  for _,v in pairs(var_UI) do
    v:ComputePos()
  end
end

FieldViewMode_PushLeft = function()
  -- function num : 0_1 , upvalues : constVar
  characterCameraModify(-constVar.modifyRate, 0)
end

FieldViewMode_PushRight = function()
  -- function num : 0_2 , upvalues : constVar
  characterCameraModify(constVar.modifyRate, 0)
end

FieldViewMode_PushTop = function()
  -- function num : 0_3 , upvalues : constVar
  characterCameraModify(0, constVar.modifyRate)
end

FieldViewMode_PushBottom = function()
  -- function num : 0_4 , upvalues : constVar
  characterCameraModify(0, -constVar.modifyRate)
end

FieldViewMode_PushReset = function()
  -- function num : 0_5
  characterCameraReset()
end

FieldViewMode_PushFreeSet = function(number)
  -- function num : 0_6
  local x, y, wheel, distance = nil
  if number == 1 then
    x = 75
    y = -19
    wheel = 369.200378
    distance = 230
  else
    if number == 2 then
      x = 100
      y = -19
      wheel = 196.40036
      distance = 400
    else
      if number == 3 then
        x = -105
        y = -19
        wheel = 407.600433
        distance = 800
      else
        return 
      end
    end
  end
  characterCameraSetPosAndWheel(float2(x, y), wheel, distance)
end

FieldViewMode_ShowToggle = function(isShow)
  -- function num : 0_7 , upvalues : variable, var_UI
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  if isShow == nil then
    variable.isShow = not variable.isShow
  else
    -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

    variable.isShow = isShow
  end
  if variable.isShow then
    (var_UI.panel):SetShow(true)
  end
end

local Alpha_Rate_Setting = function(alpha)
  -- function num : 0_8 , upvalues : var_UI
  for k,v in pairs(var_UI) do
    v:SetAlpha(alpha)
  end
  ;
  (var_UI.btn_left):SetFontAlpha(alpha)
  ;
  (var_UI.btn_right):SetFontAlpha(alpha)
  ;
  (var_UI.btn_top):SetFontAlpha(alpha)
  ;
  (var_UI.btn_bottom):SetFontAlpha(alpha)
  ;
  (var_UI.btn_init):SetFontAlpha(alpha)
  ;
  (var_UI.btn_FreeSet1):SetFontAlpha(alpha)
  ;
  (var_UI.btn_FreeSet2):SetFontAlpha(alpha)
  ;
  (var_UI.btn_FreeSet3):SetFontAlpha(alpha)
  ;
  (var_UI.text_preset):SetFontAlpha(alpha)
  ;
  (var_UI.text_arrow):SetFontAlpha(alpha)
end

FieldViewMode_UpdateShowHide = function()
  -- function num : 0_9 , upvalues : variable, var_UI, Alpha_Rate_Setting
  local rate = 0.1
  if variable.isShow then
    local alpha = (var_UI.panel):GetAlpha() + rate
    if alpha < 1 then
      Alpha_Rate_Setting(alpha)
    else
      Alpha_Rate_Setting(1)
    end
  else
    do
      local alpha = (var_UI.panel):GetAlpha() - rate
      if alpha > 0 then
        Alpha_Rate_Setting(alpha)
      else
        ;
        (var_UI.panel):SetShow(false)
        Alpha_Rate_Setting(0)
      end
    end
  end
end

FieldViewMode_ChangeTexture_On = function()
  -- function num : 0_10 , upvalues : var_UI, fieldViewText
  (var_UI.panel):ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_drag.dds")
  fieldViewText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FIELDVIEWMODE_UI_MOVE"))
end

FieldViewMode_ChangeTexture_Off = function()
  -- function num : 0_11 , upvalues : var_UI, fieldViewText
  if Panel_UIControl:IsShow() then
    (var_UI.panel):ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_isWidget.dds")
    fieldViewText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_FIELDVIEWMODE_UI"))
  else
    ;
    (var_UI.panel):ChangeTextureInfoName("new_ui_common_forlua/default/window_sample_empty.dds")
  end
end

local initialize = function()
  -- function num : 0_12 , upvalues : Alpha_Rate_Setting, var_UI
  Panel_FieldViewMode:SetShow(false, false)
  Alpha_Rate_Setting(0)
  FieldViewMode_ScreenResize()
  registerEvent("onScreenResize", "FieldViewMode_ScreenResize")
  ;
  (var_UI.panel):RegisterUpdateFunc("FieldViewMode_UpdateShowHide")
  ;
  (var_UI.btn_init):addInputEvent("Mouse_LDown", "FieldViewMode_PushReset()")
  ;
  (var_UI.panel):addInputEvent("Mouse_On", "FieldViewMode_ChangeTexture_On()")
  ;
  (var_UI.panel):addInputEvent("Mouse_Out", "FieldViewMode_ChangeTexture_Off()")
  ;
  (var_UI.panel):SetPosX(0)
  ;
  (var_UI.panel):SetPosY(getScreenSizeY() - (var_UI.panel):GetSizeY() - 300)
  ;
  (var_UI.btn_left):addInputEvent("Mouse_LPress", "FieldViewMode_PushLeft()")
  ;
  (var_UI.btn_right):addInputEvent("Mouse_LPress", "FieldViewMode_PushRight()")
  ;
  (var_UI.btn_top):addInputEvent("Mouse_LPress", "FieldViewMode_PushTop()")
  ;
  (var_UI.btn_bottom):addInputEvent("Mouse_LPress", "FieldViewMode_PushBottom()")
  ;
  (var_UI.btn_FreeSet1):addInputEvent("Mouse_LPress", "FieldViewMode_PushFreeSet(1)")
  ;
  (var_UI.btn_FreeSet2):addInputEvent("Mouse_LPress", "FieldViewMode_PushFreeSet(2)")
  ;
  (var_UI.btn_FreeSet3):addInputEvent("Mouse_LPress", "FieldViewMode_PushFreeSet(3)")
  characterCameraReset()
end

initialize()

