-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\dye\panel_dye.luac 

-- params : ...
-- function num : 0
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UI_EquipSlotNo = CppEnums.EquipSlotNo
local UI_MouseCursorType = CppEnums.MouseCursorType
Panel_Dye:setGlassBackground(true)
Panel_Dye:ActiveMouseEventEffect(true)
Panel_Dye:RegisterShowEventFunc(true, "Panel_Dye_ShowAni()")
Panel_Dye:RegisterShowEventFunc(false, "Panel_Dye_HideAni()")
local Dye = {
_slotConfig = {createIcon = false, createBorder = true, createCount = true, createEnchant = true, createCash = true}
, _dyeingTargetSlotCount = 6, _startAvatarSlotNoIndex = 6, _colorAmpuleSlotRow = 4, _colorAmpuleSlotCol = 6, _colorAmpuleSlotCount = nil}
local ui = {_btn_Close = (UI.getChildControl)(Panel_Dye, "Button_Close"), _btn_Question = (UI.getChildControl)(Panel_Dye, "Button_Question"), _btn_Prev = (UI.getChildControl)(Panel_Dye, "Button_Prev"), _btn_Next = (UI.getChildControl)(Panel_Dye, "Button_Next"), _pageNo = (UI.getChildControl)(Panel_Dye, "Static_PageNo"), _RadioButton_Helm = (UI.getChildControl)(Panel_Dye, "Radiobutton_IconSlot_Helm"), _RadioButton_Upper = (UI.getChildControl)(Panel_Dye, "Radiobutton_IconSlot_Upper"), _RadioButton_Boots = (UI.getChildControl)(Panel_Dye, "Radiobutton_IconSlot_Boots"), _RadioButton_Glove = (UI.getChildControl)(Panel_Dye, "Radiobutton_IconSlot_Glove"), _RadioButton_Weapon1 = (UI.getChildControl)(Panel_Dye, "Radiobutton_IconSlot_W1"), _RadioButton_Weapon2 = (UI.getChildControl)(Panel_Dye, "Radiobutton_IconSlot_W2"), _RadioButton_Color1 = (UI.getChildControl)(Panel_Dye, "Radiobutton_PartColor_1"), _RadioButton_Color2 = (UI.getChildControl)(Panel_Dye, "Radiobutton_PartColor_2"), _RadioButton_Color3 = (UI.getChildControl)(Panel_Dye, "Radiobutton_PartColor_3"), _Button_Clear_Color1 = (UI.getChildControl)(Panel_Dye, "Button_Part1_Clear"), _Button_Clear_Color2 = (UI.getChildControl)(Panel_Dye, "Button_Part2_Clear"), _Button_Clear_Color3 = (UI.getChildControl)(Panel_Dye, "Button_Part3_Clear"), _helpDescBG = (UI.getChildControl)(Panel_Dye, "Static_HelpDescBG"), _helpDesc = (UI.getChildControl)(Panel_Dye, "StaticText_HelpDesc"), _CheckBox_Outfit = (UI.getChildControl)(Panel_Dye, "Checkbox_Outfit"), _letsDye = (UI.getChildControl)(Panel_Dye, "Button_StartDye"), _colorBalance = (UI.getChildControl)(Panel_Dye, "Button_StartMix"), _styleSlotBg = (UI.getChildControl)(Panel_Dye, "Static_SlotBG")}
local _dyeTargetRadioButton = {[0] = ui._RadioButton_Helm, [1] = ui._RadioButton_Upper, [2] = ui._RadioButton_Boots, [3] = ui._RadioButton_Glove, [4] = ui._RadioButton_Weapon1, [5] = ui._RadioButton_Weapon2}
local _meshViewer = (UI.getChildControl)(Panel_Dye, "Static_Object")
_meshViewer:addInputEvent("Mouse_RDown", "Panel_Dye_StartRotatedPreview()")
_meshViewer:addInputEvent("Mouse_RPress", "Panel_Dye_RotatePreview()")
_meshViewer:addInputEvent("Mouse_RUp", "Panel_Dye_StopRotatedPreview()")
_meshViewer:addInputEvent("Mouse_UpScroll", "Panel_Dye_PreviewZoomIn()")
_meshViewer:addInputEvent("Mouse_DownScroll", "Panel_Dye_PreviewZoomOut()")
local _dyeingTargetSlot = {}
local _colorAmpuleSlotBg = {}
local _colorAmpuleSlot = {}
local _selectedDyeingTarget = -1
local _selectedPart = -1
local _currentPage = 1
local _totalPage = 0
local _doItDye = false
local _isShowAvatar = false
;
(ui._btn_Close):addInputEvent("Mouse_LUp", "Panel_Dye_ShowToggle()")
;
(ui._btn_Question):addInputEvent("Mouse_LUp", "")
;
(ui._colorBalance):addInputEvent("Mouse_LUp", "Panel_ColorBalance_Show()")
local _buttonQuestion = (UI.getChildControl)(Panel_Dye, "Button_Question")
_buttonQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"Dye\" )")
_buttonQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"Dye\", \"true\")")
_buttonQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"Dye\", \"false\")")
Panel_Dye_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_Dye)
  local aniInfo1 = Panel_Dye:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_Dye:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Dye:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_Dye:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Dye:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Dye:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_Dye_HideAni = function()
  -- function num : 0_1
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_Dye, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

Panel_Dye_Initialize = function()
  -- function num : 0_2 , upvalues : Dye, ui, UI_TM, _dyeingTargetSlot, _dyeTargetRadioButton, _colorAmpuleSlotBg, _colorAmpuleSlot
  local self = Dye
  dye_Normal_ChangeTexture()
  self._colorAmpuleSlotCount = self._colorAmpuleSlotRow * self._colorAmpuleSlotCol
  ;
  (ui._helpDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (ui._helpDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_DYE_INFO"))
  ;
  (ui._helpDesc):SetSize((ui._helpDesc):GetSizeX(), (ui._helpDesc):GetTextSizeY())
  ;
  (ui._helpDesc):SetIgnore(true)
  ;
  (ui._helpDescBG):SetSize((ui._helpDescBG):GetSizeX(), (ui._helpDesc):GetTextSizeY() + 7)
  ;
  (ui._RadioButton_Color1):addInputEvent("Mouse_LUp", "dye_SelectPart( " .. 0 .. " )")
  ;
  (ui._RadioButton_Color2):addInputEvent("Mouse_LUp", "dye_SelectPart( " .. 1 .. " )")
  ;
  (ui._RadioButton_Color3):addInputEvent("Mouse_LUp", "dye_SelectPart( " .. 2 .. " )")
  ;
  (ui._RadioButton_Color1):SetAlphaIgnore(true)
  ;
  (ui._RadioButton_Color2):SetAlphaIgnore(true)
  ;
  (ui._RadioButton_Color3):SetAlphaIgnore(true)
  ;
  (ui._RadioButton_Helm):addInputEvent("Mouse_LUp", "dye_SelectDyeingTarget( " .. 0 .. " )")
  ;
  (ui._RadioButton_Upper):addInputEvent("Mouse_LUp", "dye_SelectDyeingTarget( " .. 1 .. " )")
  ;
  (ui._RadioButton_Boots):addInputEvent("Mouse_LUp", "dye_SelectDyeingTarget( " .. 2 .. " )")
  ;
  (ui._RadioButton_Glove):addInputEvent("Mouse_LUp", "dye_SelectDyeingTarget( " .. 3 .. " )")
  ;
  (ui._RadioButton_Weapon1):addInputEvent("Mouse_LUp", "dye_SelectDyeingTarget( " .. 4 .. " )")
  ;
  (ui._RadioButton_Weapon2):addInputEvent("Mouse_LUp", "dye_SelectDyeingTarget( " .. 5 .. " )")
  ;
  (ui._Button_Clear_Color1):addInputEvent("Mouse_LUp", "dye_ClearUsedColor( " .. 0 .. " )")
  ;
  (ui._Button_Clear_Color2):addInputEvent("Mouse_LUp", "dye_ClearUsedColor( " .. 1 .. " )")
  ;
  (ui._Button_Clear_Color3):addInputEvent("Mouse_LUp", "dye_ClearUsedColor( " .. 2 .. " )")
  ;
  (ui._btn_Prev):addInputEvent("Mouse_LUp", "handleMouseLUpPagePrevAndNextButton( false )")
  ;
  (ui._btn_Next):addInputEvent("Mouse_LUp", "handleMouseLUpPagePrevAndNextButton( true )")
  ;
  (ui._CheckBox_Outfit):addInputEvent("Mouse_LUp", "dye_ShowOutfit_Toggle()")
  ;
  (ui._styleSlotBg):SetShow(false)
  for i = 0, self._dyeingTargetSlotCount - 1 do
    local _slot = {}
    ;
    (SlotItem.new)(_slot, "DyeingTargetSlot" .. i, i, Panel_Dye, self._slotConfig)
    _slot:createChild()
    _slot.empty = true
    ;
    (_slot.icon):SetPosX(25 + 53 * i)
    ;
    (_slot.icon):SetPosY(84)
    -- DECOMPILER ERROR at PC227: Confused about usage of register: R6 in 'UnsetPending'

    _dyeingTargetSlot[i] = _slot
    ;
    (_dyeTargetRadioButton[i]):addInputEvent("Mouse_RUp", "dye_clearDyeingTargetSlot( " .. i .. " )")
    ;
    (_dyeTargetRadioButton[i]):addInputEvent("Mouse_On", "handleMouseOnDyeingTargetSlotTooltip( " .. i .. " )")
    ;
    (_dyeTargetRadioButton[i]):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_hideTooltip()")
    Panel_Dye:SetChildOrder((_slot.icon):GetKey(), (_dyeTargetRadioButton[i]):GetKey())
  end
  for i = 0, self._colorAmpuleSlotRow - 1 do
    for j = 0, self._colorAmpuleSlotCol - 1 do
      local index = self._colorAmpuleSlotCol * i + j
      -- DECOMPILER ERROR at PC287: Confused about usage of register: R10 in 'UnsetPending'

      _colorAmpuleSlotBg[index] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Dye, "colorAmpuleSlotBg" .. index)
      CopyBaseProperty(ui._styleSlotBg, _colorAmpuleSlotBg[index])
      ;
      (_colorAmpuleSlotBg[index]):SetPosX(25 + j * 53)
      ;
      (_colorAmpuleSlotBg[index]):SetPosY(345 + i * 55)
      ;
      (_colorAmpuleSlotBg[index]):SetShow(true)
      local _slot = {}
      ;
      (SlotItem.new)(_slot, "ColorAmpuleSlot" .. index, index, Panel_Dye, self._slotConfig)
      _slot:createChild()
      _slot.empty = true
      ;
      (_slot.icon):SetPosX(25 + j * 53)
      ;
      (_slot.icon):SetPosY(345 + i * 55)
      -- DECOMPILER ERROR at PC336: Confused about usage of register: R11 in 'UnsetPending'

      _colorAmpuleSlot[index] = _slot
      ;
      ((_colorAmpuleSlot[index]).icon):addInputEvent("Mouse_LUp", "dye_SelectColorAmplue( " .. index .. " )")
      ;
      ((_colorAmpuleSlot[index]).icon):addInputEvent("Mouse_On", "handleMouseOnColorAmpuleSlotTooltip( " .. index .. " )")
      ;
      ((_colorAmpuleSlot[index]).icon):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_hideTooltip()")
    end
  end
  ;
  (ui._letsDye):addInputEvent("Mouse_LUp", "dye_DoDyeing()")
end

handleMouseOnColorAmpuleSlotTooltip = function(colorAmpuleSlotNo)
  -- function num : 0_3 , upvalues : Dye, _currentPage, _colorAmpuleSlot
  local paramColorAmpuleSlotNo = Dye._colorAmpuleSlotCount * (_currentPage - 1) + colorAmpuleSlotNo
  local itemWrapper = ToClient_RequestGetColorAmpuleItem(paramColorAmpuleSlotNo)
  Panel_Tooltip_Item_Show(itemWrapper, (_colorAmpuleSlot[colorAmpuleSlotNo]).icon, false, true)
end

handleMouseOnDyeingTargetSlotTooltip = function(targetSlotNo)
  -- function num : 0_4 , upvalues : _isShowAvatar, Dye, _dyeTargetRadioButton
  local targetItemNo = targetSlotNo
  if _isShowAvatar then
    targetItemNo = targetItemNo + Dye._dyeingTargetSlotCount
  end
  local itemWrapper = ToClient_RequestGetDyeingTargetItem(targetItemNo)
  Panel_Tooltip_Item_Show(itemWrapper, _dyeTargetRadioButton[targetSlotNo], false, true)
end

handleMouseLUpPagePrevAndNextButton = function(isNext)
  -- function num : 0_5 , upvalues : _currentPage
  if isNext then
    _currentPage = _currentPage + 1
  else
    _currentPage = _currentPage - 1
  end
  dye_setPagePrevAndNextButtonState()
  dye_updateColorAmpuleList()
end

dye_setPagePrevAndNextButtonState = function()
  -- function num : 0_6 , upvalues : ui, _currentPage, _totalPage
  (ui._pageNo):SetText(_currentPage .. "/" .. _totalPage)
  if _currentPage <= 1 then
    (ui._btn_Prev):SetEnable(false)
    ;
    (ui._btn_Prev):SetIgnore(true)
    ;
    (ui._btn_Prev):SetMonoTone(true)
  else
    ;
    (ui._btn_Prev):SetEnable(true)
    ;
    (ui._btn_Prev):SetIgnore(false)
    ;
    (ui._btn_Prev):SetMonoTone(false)
  end
  if _totalPage == _currentPage then
    (ui._btn_Next):SetEnable(false)
    ;
    (ui._btn_Next):SetIgnore(true)
    ;
    (ui._btn_Next):SetMonoTone(true)
  else
    ;
    (ui._btn_Next):SetEnable(true)
    ;
    (ui._btn_Next):SetIgnore(false)
    ;
    (ui._btn_Next):SetMonoTone(false)
  end
end

dye_SelectColorAmplue = function(colorAmpuleSlotNo)
  -- function num : 0_7 , upvalues : _selectedDyeingTarget, _selectedPart, _currentPage, Dye
  if _selectedDyeingTarget == -1 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DYE_NAKMSG_SELECT_EQUIPITEM"))
    return 
  end
  if _selectedPart == -1 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DYE_NAKMSG_SELECT_PARTSITEM"))
    return 
  end
  colorAmpuleSlotNo = colorAmpuleSlotNo + (_currentPage - 1) * Dye._colorAmpuleSlotCount
  ToClient_RequestSelectedColorAmpule(_selectedDyeingTarget, colorAmpuleSlotNo, _selectedPart)
end

dye_SelectDyeingTarget = function(dyeingTargetSlotNo)
  -- function num : 0_8 , upvalues : _isShowAvatar, Dye, _selectedDyeingTarget
  if _isShowAvatar then
    dyeingTargetSlotNo = dyeingTargetSlotNo + Dye._startAvatarSlotNoIndex
  end
  _selectedDyeingTarget = dyeingTargetSlotNo
  dye_updateDyeingPartList()
end

dye_ClearUsedColor = function(clearPartNo)
  -- function num : 0_9 , upvalues : _selectedDyeingTarget
  if _selectedDyeingTarget == -1 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DYE_NAKMSG_SELECT_RESETTARGET"))
    return 
  end
  ToClient_RequestClearUsedColorAmpule(_selectedDyeingTarget, clearPartNo)
end

dye_Normal_ChangeTexture = function()
  -- function num : 0_10 , upvalues : _dyeTargetRadioButton
  (_dyeTargetRadioButton[0]):ChangeTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_01.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[0], 1, 1, 53, 62)
  ;
  ((_dyeTargetRadioButton[0]):getBaseTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[0]):setRenderTexture((_dyeTargetRadioButton[0]):getBaseTexture())
  ;
  (_dyeTargetRadioButton[0]):ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_01.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[0], 54, 1, 106, 62)
  ;
  ((_dyeTargetRadioButton[0]):getOnTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[0]):ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_01.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[0], 107, 1, 159, 62)
  ;
  ((_dyeTargetRadioButton[0]):getClickTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[1]):ChangeTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[1], 226, 1, 278, 62)
  ;
  ((_dyeTargetRadioButton[1]):getBaseTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[1]):setRenderTexture((_dyeTargetRadioButton[1]):getBaseTexture())
  ;
  (_dyeTargetRadioButton[1]):ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[1], 226, 63, 278, 124)
  ;
  ((_dyeTargetRadioButton[1]):getOnTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[1]):ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[1], 226, 125, 278, 186)
  ;
  ((_dyeTargetRadioButton[1]):getClickTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[2]):ChangeTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[2], 279, 1, 331, 62)
  ;
  ((_dyeTargetRadioButton[2]):getBaseTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[2]):setRenderTexture((_dyeTargetRadioButton[2]):getBaseTexture())
  ;
  (_dyeTargetRadioButton[2]):ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[2], 279, 63, 331, 124)
  ;
  ((_dyeTargetRadioButton[2]):getOnTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[2]):ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[2], 279, 125, 331, 186)
  ;
  ((_dyeTargetRadioButton[2]):getClickTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[3]):ChangeTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[3], 332, 1, 384, 62)
  ;
  ((_dyeTargetRadioButton[3]):getBaseTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[3]):setRenderTexture((_dyeTargetRadioButton[3]):getBaseTexture())
  ;
  (_dyeTargetRadioButton[3]):ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[3], 332, 63, 384, 124)
  ;
  ((_dyeTargetRadioButton[3]):getOnTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[3]):ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[3], 332, 125, 384, 186)
  ;
  ((_dyeTargetRadioButton[3]):getClickTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[4]):ChangeTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[4], 385, 1, 437, 62)
  ;
  ((_dyeTargetRadioButton[4]):getBaseTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[4]):setRenderTexture((_dyeTargetRadioButton[4]):getBaseTexture())
  ;
  (_dyeTargetRadioButton[4]):ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[4], 385, 63, 437, 124)
  ;
  ((_dyeTargetRadioButton[4]):getOnTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[4]):ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[4], 385, 125, 437, 186)
  ;
  ((_dyeTargetRadioButton[4]):getClickTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[5]):ChangeTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[5], 438, 1, 490, 62)
  ;
  ((_dyeTargetRadioButton[5]):getBaseTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[5]):setRenderTexture((_dyeTargetRadioButton[5]):getBaseTexture())
  ;
  (_dyeTargetRadioButton[5]):ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[5], 438, 63, 490, 124)
  ;
  ((_dyeTargetRadioButton[5]):getOnTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[5]):ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[5], 438, 125, 490, 186)
  ;
  ((_dyeTargetRadioButton[5]):getClickTexture()):setUV(x1, y1, x2, y2)
end

dye_Outfit_ChangeTexture = function()
  -- function num : 0_11 , upvalues : _dyeTargetRadioButton
  (_dyeTargetRadioButton[0]):ChangeTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_01.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[0], 1, 63, 53, 124)
  ;
  ((_dyeTargetRadioButton[0]):getBaseTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[0]):setRenderTexture((_dyeTargetRadioButton[0]):getBaseTexture())
  ;
  (_dyeTargetRadioButton[0]):ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_01.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[0], 54, 63, 106, 124)
  ;
  ((_dyeTargetRadioButton[0]):getOnTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[0]):ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_01.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[0], 107, 63, 159, 124)
  ;
  ((_dyeTargetRadioButton[0]):getClickTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[1]):ChangeTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[1], 235, 187, 287, 248)
  ;
  ((_dyeTargetRadioButton[1]):getBaseTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[1]):setRenderTexture((_dyeTargetRadioButton[1]):getBaseTexture())
  ;
  (_dyeTargetRadioButton[1]):ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[1], 235, 249, 287, 310)
  ;
  ((_dyeTargetRadioButton[1]):getOnTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[1]):ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[1], 235, 311, 287, 372)
  ;
  ((_dyeTargetRadioButton[1]):getClickTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[2]):ChangeTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[2], 288, 187, 340, 248)
  ;
  ((_dyeTargetRadioButton[2]):getBaseTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[2]):setRenderTexture((_dyeTargetRadioButton[2]):getBaseTexture())
  ;
  (_dyeTargetRadioButton[2]):ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[2], 288, 249, 340, 310)
  ;
  ((_dyeTargetRadioButton[2]):getOnTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[2]):ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[2], 288, 311, 340, 372)
  ;
  ((_dyeTargetRadioButton[2]):getClickTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[3]):ChangeTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[3], 341, 187, 393, 248)
  ;
  ((_dyeTargetRadioButton[3]):getBaseTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[3]):setRenderTexture((_dyeTargetRadioButton[3]):getBaseTexture())
  ;
  (_dyeTargetRadioButton[3]):ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[3], 341, 249, 393, 310)
  ;
  ((_dyeTargetRadioButton[3]):getOnTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[3]):ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[3], 341, 311, 393, 372)
  ;
  ((_dyeTargetRadioButton[3]):getClickTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[4]):ChangeTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[4], 394, 187, 446, 248)
  ;
  ((_dyeTargetRadioButton[4]):getBaseTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[4]):setRenderTexture((_dyeTargetRadioButton[4]):getBaseTexture())
  ;
  (_dyeTargetRadioButton[4]):ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[4], 394, 249, 446, 310)
  ;
  ((_dyeTargetRadioButton[4]):getOnTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[4]):ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[4], 394, 311, 446, 372)
  ;
  ((_dyeTargetRadioButton[4]):getClickTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[5]):ChangeTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[5], 447, 187, 499, 248)
  ;
  ((_dyeTargetRadioButton[5]):getBaseTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[5]):setRenderTexture((_dyeTargetRadioButton[5]):getBaseTexture())
  ;
  (_dyeTargetRadioButton[5]):ChangeOnTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[5], 447, 249, 499, 310)
  ;
  ((_dyeTargetRadioButton[5]):getOnTexture()):setUV(x1, y1, x2, y2)
  ;
  (_dyeTargetRadioButton[5]):ChangeClickTextureInfoName("New_UI_Common_forLua/Window/Dye/Dye_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(_dyeTargetRadioButton[5], 447, 311, 499, 372)
  ;
  ((_dyeTargetRadioButton[5]):getClickTexture()):setUV(x1, y1, x2, y2)
end

dye_ShowOutfit_Toggle = function()
  -- function num : 0_12 , upvalues : _isShowAvatar, _currentPage
  dye_clearSelectedDyeingTarget()
  dye_clearSelectedPart()
  if _isShowAvatar then
    _isShowAvatar = false
    dye_Normal_ChangeTexture()
  else
    _isShowAvatar = true
    dye_Outfit_ChangeTexture()
  end
  _currentPage = 1
  if _isShowAvatar then
    Inventory_SetFunctor(FGlobal_InventoryFilterForShowAvatarEquipment, dye_EquipItem_InteractortionFromInventory, dye_WindowClose, nil)
  else
    Inventory_SetFunctor(FGlobal_InventoryFilterForShowNormalEquipment, dye_EquipItem_InteractortionFromInventory, dye_WindowClose, nil)
  end
  dye_setPagePrevAndNextButtonState()
  ToClient_RequestShowOutfitToggle()
end

dye_updateDyeingTargetList = function()
  -- function num : 0_13 , upvalues : _isShowAvatar, Dye, _dyeingTargetSlot, _dyeTargetRadioButton
  local startEquipSlotNo = 0
  if _isShowAvatar then
    startEquipSlotNo = Dye._startAvatarSlotNoIndex
  end
  for i = 0, Dye._dyeingTargetSlotCount - 1 do
    (_dyeingTargetSlot[i]):clearItem()
    local itemWrapper = ToClient_RequestGetDyeingTargetItem(startEquipSlotNo + i)
    -- DECOMPILER ERROR at PC23: Confused about usage of register: R6 in 'UnsetPending'

    if itemWrapper ~= nil then
      (_dyeingTargetSlot[i]).empty = false
      -- DECOMPILER ERROR at PC26: Confused about usage of register: R6 in 'UnsetPending'

      ;
      (_dyeingTargetSlot[i]).slotNo = nil
      ;
      (_dyeingTargetSlot[i]):setItem(itemWrapper)
      ;
      ((_dyeingTargetSlot[i]).icon):SetShow(true)
      ;
      (_dyeTargetRadioButton[i]):SetEnable(true)
      ;
      (_dyeTargetRadioButton[i]):SetIgnore(false)
      ;
      (_dyeTargetRadioButton[i]):SetMonoTone(false)
    else
      ;
      (_dyeTargetRadioButton[i]):SetEnable(false)
      ;
      (_dyeTargetRadioButton[i]):SetIgnore(true)
      ;
      (_dyeTargetRadioButton[i]):SetMonoTone(true)
      ;
      ((_dyeingTargetSlot[i]).icon):SetShow(false)
    end
  end
end

dye_updateColorAmpuleList = function()
  -- function num : 0_14 , upvalues : Dye, _colorAmpuleSlot, _currentPage
  local colorAmpuleSlotCount = Dye._colorAmpuleSlotCol * Dye._colorAmpuleSlotRow
  for i = 0, colorAmpuleSlotCount - 1 do
    (_colorAmpuleSlot[i]):clearItem()
    ;
    ((_colorAmpuleSlot[i]).icon):SetShow(false)
  end
  local colorAmpuleCount = ToClient_RequestGetColorAmpuleListCount()
  local startIndex = colorAmpuleSlotCount * (_currentPage - 1)
  local endIndex = startIndex + colorAmpuleSlotCount - 1
  for i = startIndex, colorAmpuleCount - 1 do
    if endIndex < i then
      break
    end
    local itemWrapper = ToClient_RequestGetColorAmpuleItem(i)
    ;
    (_colorAmpuleSlot[i - startIndex]):setItem(itemWrapper)
    ;
    ((_colorAmpuleSlot[i - startIndex]).icon):SetShow(true)
  end
end

dye_updateDyeingPartList = function()
  -- function num : 0_15 , upvalues : _selectedDyeingTarget, ui
  for i = 1, 3 do
    local paletteColor = ToClient_RequestGetUsedPartColor(_selectedDyeingTarget, i - 1)
    ;
    (ui["_RadioButton_Color" .. i]):SetColor(paletteColor)
  end
end

dye_setTotalPage = function()
  -- function num : 0_16 , upvalues : Dye, _totalPage, _currentPage
  local colorAmpuleSlotCount = Dye._colorAmpuleSlotCol * Dye._colorAmpuleSlotRow
  local colorAmpuleCount = ToClient_RequestGetColorAmpuleListCount()
  _totalPage = (math.floor)(colorAmpuleCount / colorAmpuleSlotCount) + 1
  if colorAmpuleCount % colorAmpuleSlotCount == 0 then
    _totalPage = _totalPage - 1
  end
  if _totalPage == 0 then
    _currentPage = 0
  end
  dye_setPagePrevAndNextButtonState()
end

Panel_Dye_ShowToggle = function()
  -- function num : 0_17 , upvalues : _meshViewer
  if Panel_Dye:IsShow() then
    ToClient_RequestEndDyePreview()
    Panel_Dye:SetShow(false, true)
    ToClient_RequestClearDyeingManager()
    dye_clear()
    InventoryWindow_Close()
  else
    ToClient_RequestStartDyePreview()
    ToClient_RequestSetSceneTexture(_meshViewer)
    ToClient_RequestPrepareDyeing()
    Panel_Dye:SetShow(true, true)
    Inventory_SetFunctor(FGlobal_InventoryFilterForShowNormalEquipment, dye_EquipItem_InteractortionFromInventory, dye_WindowClose, nil)
    InventoryWindow_Show()
  end
end

FGlobal_InventoryFilterForShowAvatarEquipment = function(InvenSlotNo, itemWrapper)
  -- function num : 0_18 , upvalues : UI_EquipSlotNo
  if itemWrapper == nil then
    return true
  end
  local equipSlotNo = (itemWrapper:getStaticStatus()):getEquipSlotNo()
  if UI_EquipSlotNo.avatarChest == equipSlotNo then
    return false
  else
    if UI_EquipSlotNo.avatarGlove == equipSlotNo then
      return false
    else
      if UI_EquipSlotNo.avatarBoots == equipSlotNo then
        return false
      else
        if UI_EquipSlotNo.avatarWeapon == equipSlotNo then
          return false
        else
          if UI_EquipSlotNo.avatarSubWeapon == equipSlotNo then
            return false
          else
            if UI_EquipSlotNo.avatarHelm == equipSlotNo then
              return false
            else
              return true
            end
          end
        end
      end
    end
  end
end

FGlobal_InventoryFilterForShowNormalEquipment = function(InvenSlotNo, itemWrapper)
  -- function num : 0_19 , upvalues : UI_EquipSlotNo
  if itemWrapper == nil then
    return true
  end
  local equipSlotNo = (itemWrapper:getStaticStatus()):getEquipSlotNo()
  if UI_EquipSlotNo.rightHand == equipSlotNo then
    return false
  else
    if UI_EquipSlotNo.leftHand == equipSlotNo then
      return false
    else
      if UI_EquipSlotNo.chest == equipSlotNo then
        return false
      else
        if UI_EquipSlotNo.glove == equipSlotNo then
          return false
        else
          if UI_EquipSlotNo.boots == equipSlotNo then
            return false
          else
            if UI_EquipSlotNo.helm == equipSlotNo then
              return false
            else
              return true
            end
          end
        end
      end
    end
  end
end

dye_EquipItem_InteractortionFromInventory = function(invenSlotNo)
  -- function num : 0_20
  ToClient_RequestSetDyeTargetSlotByInventorySlotNo(invenSlotNo)
end

dye_clearDyeingTargetSlot = function(targetSlotNum)
  -- function num : 0_21 , upvalues : _isShowAvatar, Dye, _selectedDyeingTarget
  if _isShowAvatar then
    targetSlotNum = targetSlotNum + Dye._startAvatarSlotNoIndex
  end
  if _selectedDyeingTarget == targetSlotNum then
    dye_clearSelectedDyeingTarget()
    dye_clearSelectedPart()
    Panel_Tooltip_Item_hideTooltip()
  end
  ToClient_RequestClearDyeingTargetSlot(targetSlotNum)
end

dye_SelectPart = function(targetNum)
  -- function num : 0_22 , upvalues : _selectedPart
  _selectedPart = targetNum
end

dye_DoDyeing = function()
  -- function num : 0_23 , upvalues : _selectedDyeingTarget, _selectedPart
  if _selectedDyeingTarget == -1 or _selectedPart == -1 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DYE_HAVENOT_TARGETITEM"))
    return 
  end
  if ToClient_RequestCheckUsedDyeing() == false then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DYE_HAVENOT_AMPLE"))
    return 
  end
  if ToClient_RequestCheckDyeable() == false then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DYE_ENOUGH_AMPLE"))
    return 
  end
  ToClient_RequestDye()
  Panel_Dye_ShowToggle()
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DYE_NAKMSG_DONE_DYE"))
end

dye_WindowClose = function()
  -- function num : 0_24
  Inventory_SetFunctor(nil)
  ToClient_RequestClearDyeingManager()
  dye_clear()
  Panel_Dye:SetShow(false, true)
end

dye_clear = function()
  -- function num : 0_25 , upvalues : _isShowAvatar, _currentPage, ui
  dye_clearSelectedDyeingTarget()
  dye_clearSelectedPart()
  _isShowAvatar = false
  _currentPage = 1
  ;
  (ui._CheckBox_Outfit):SetCheck(false)
end

dye_clearSelectedDyeingTarget = function()
  -- function num : 0_26 , upvalues : _selectedDyeingTarget, _isShowAvatar, Dye, _dyeTargetRadioButton
  if _selectedDyeingTarget ~= -1 then
    if _isShowAvatar then
      _selectedDyeingTarget = _selectedDyeingTarget - Dye._dyeingTargetSlotCount
    end
    ;
    (_dyeTargetRadioButton[_selectedDyeingTarget]):SetUnchecked()
    _selectedDyeingTarget = -1
  end
end

dye_clearSelectedPart = function()
  -- function num : 0_27 , upvalues : _selectedPart, ui
  if _selectedPart ~= -1 then
    local index = _selectedPart + 1
    ;
    (ui["_RadioButton_Color" .. index]):SetUnchecked()
    _selectedPart = -1
  end
end

local _lastRotationPosX = 0
Panel_Dye_StartRotatedPreview = function()
  -- function num : 0_28 , upvalues : _lastRotationPosX
  _lastRotationPosX = getMousePosX()
end

Panel_Dye_RotatePreview = function()
  -- function num : 0_29 , upvalues : _lastRotationPosX
  local _currentRotationPosX = getMousePosX()
  local mouseDeltaX = _currentRotationPosX - _lastRotationPosX
  _lastRotationPosX = _currentRotationPosX
  ToClient_RequestUpdateDyePreviewRotation(mouseDeltaX)
end

Panel_Dye_StopRotatedPreview = function()
  -- function num : 0_30 , upvalues : _lastRotationPosX
  _lastRotationPosX = 0
end

Panel_Dye_PreviewZoomIn = function()
  -- function num : 0_31
  ToClient_RequestUpdateDyePreviewZoom(true)
end

Panel_Dye_PreviewZoomOut = function()
  -- function num : 0_32
  ToClient_RequestUpdateDyePreviewZoom(false)
end

registerEvent("FromClient_updateDyeingTargetList", "FromClient_updateDyeingTargetList")
registerEvent("FromClient_updateColorAmpuleList", "FromClient_updateColorAmpuleList")
registerEvent("FromClient_updateDyeingPartList", "FromClient_updateDyeingPartList")
registerEvent("FromClient_setTotalPage", "FromClient_setTotalPage")
FromClient_updateDyeingTargetList = function()
  -- function num : 0_33
  dye_updateDyeingTargetList()
end

FromClient_updateColorAmpuleList = function()
  -- function num : 0_34
  dye_updateColorAmpuleList()
end

FromClient_updateDyeingPartList = function()
  -- function num : 0_35
  dye_updateDyeingPartList()
end

FromClient_setTotalPage = function()
  -- function num : 0_36
  dye_setTotalPage()
end

Panel_Dye_Initialize()

