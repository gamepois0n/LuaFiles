-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\alchemy\panel_manufacture.luac 

-- params : ...
-- function num : 0
Panel_Manufacture:ActiveMouseEventEffect(true)
Panel_Manufacture:SetShow(false, false)
Panel_Manufacture:setGlassBackground(true)
Panel_Manufacture:RegisterShowEventFunc(true, "ManufactureShowAni()")
Panel_Manufacture:RegisterShowEventFunc(false, "ManufactureHideAni()")
registerEvent("Event_ManufactureUpdateSlot", "Manufacture_Response")
registerEvent("EventShowManufactureWindow", "Manufacture_ToggleWindow")
registerEvent("Event_ManufactureResultList", "Manufacture_ResponseResultItem")
local IM = CppEnums.EProcessorInputMode
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UIMode = Defines.UIMode
local territorySupply = ToClient_IsContentsGroupOpen("22")
local contentsOption = ToClient_IsContentsGroupOpen("36")
local enableCraft = ToClient_IsContentsGroupOpen("285")
local manufacture_Init = function()
  -- function num : 0_0
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  Panel_Manufacture:SetPosX((screenSizeX - Panel_Manufacture:GetSizeX()) / 2)
  Panel_Manufacture:SetPosY((screenSizeY - Panel_Manufacture:GetSizeY()) / 2)
end

manufacture_Init()
manufacture_Repos = function()
  -- function num : 0_1
  local screenSizeX = getScreenSizeX()
  local screenSizeY = getScreenSizeY()
  Panel_Manufacture:SetPosX((screenSizeX - Panel_Manufacture:GetSizeX()) / 2)
  Panel_Manufacture:SetPosY((screenSizeY - Panel_Manufacture:GetSizeY()) / 2)
end

local noneStackItemList = (Array.new)()
local noneStackItemCheck = false
local hasNoneStackItem = false
local selectedWarehouseItemKey = -1
local selectedWarehouseItemSlotNo = -1
local targetWarehouseSlotNo = -1
local noneStackItem_ChkBtn = (UI.getChildControl)(Panel_Manufacture, "CheckButton_Action2")
noneStackItem_ChkBtn:SetShow(false)
noneStackItem_ChkBtn:SetCheck(false)
noneStackItem_ChkBtn:addInputEvent("Mouse_LUp", "noneStackItemCheckBT()")
local _ACTIONNAME_SHAKE = "MANUFACTURE_SHAKE"
local _ACTIONNAME_GRIND = "MANUFACTURE_GRIND"
local _ACTIONNAME_FIREWOOD = "MANUFACTURE_FIREWOOD"
local _ACTIONNAME_DRY = "MANUFACTURE_DRY"
local _ACTIONNAME_THINNING = "MANUFACTURE_THINNING"
local _ACTIONNAME_HEAT = "MANUFACTURE_HEAT"
local _ACTIONNAME_RAINWATER = "MANUFACTURE_RAINWATER"
local _ACTIONNAME_REPAIR = "REPAIR_ITEM"
local _ACTIONNAME_ALCHEMY = "MANUFACTURE_ALCHEMY"
local _ACTIONNAME_COOK = "MANUFACTURE_COOK"
local _ACTIONNAME_RG_COOK = "MANUFACTURE_ROYALGIFT_COOK"
local _ACTIONNAME_RG_ALCHEMY = "MANUFACTURE_ROYALGIFT_ALCHEMY"
local _ACTIONNAME_GUILDMANUFACTURE = "MANUFACTURE_GUILD"
local _ACTIONNAME_CRAFT = "MANUFACTURE_CRAFT"
local CURRENT_ACTIONNAME = ""
local MAX_ACTION_BTN = 13
local SUBTEXT_OFFSETX = 60
local SUBTEXT_OFFSETY = 17
local ACTION_BTN_HEIGHT = 50
local waypointKey_ByWareHouse = 0
local invenShow = false
local isEnableMsg = {}
local materialItemWhereType = (CppEnums.ItemWhereType).eInventory
local INSTALLATIONTYPE_ACTIONNAME = {}
INSTALLATIONTYPE_ACTIONNAME[(CppEnums.InstallationType).eType_Mortar] = _ACTIONNAME_GRIND
INSTALLATIONTYPE_ACTIONNAME[(CppEnums.InstallationType).eType_Stump] = _ACTIONNAME_FIREWOOD
INSTALLATIONTYPE_ACTIONNAME[(CppEnums.InstallationType).eType_FireBowl] = _ACTIONNAME_HEAT
INSTALLATIONTYPE_ACTIONNAME[(CppEnums.InstallationType).eType_Anvil] = _ACTIONNAME_REPAIR
local _defaultSlotNo = 255
local _materialSlotNoList = {_defaultSlotNo, _defaultSlotNo, _defaultSlotNo, _defaultSlotNo; [0] = _defaultSlotNo}
local _materialSlotNoListItemIn = {false, false, false, false; [0] = false}
local _actionIndex = -1
local _actionName = "NONE"
local _usingInstallationType = (CppEnums.InstallationType).TypeCount
local _listAction = {}
local manufactureAction = {_radioBtn, _actionName}
local manufactureListDesc = {[0] = "GAME_MANUFACTURE_DESC_SHAKE", [1] = "GAME_MANUFACTURE_DESC_GRIND", [2] = "GAME_MANUFACTURE_DESC_FIREWOOD", [3] = "GAME_MANUFACTURE_DESC_DRY", [4] = "GAME_MANUFACTURE_DESC_THINNING", [5] = "GAME_MANUFACTURE_DESC_HEAT", [6] = "GAME_MANUFACTURE_DESC_RAINWATER", [7] = "GAME_MANUFACTURE_DESC_REPAIR", [8] = "GAME_MANUFACTURE_DESC_ALCHEMY", [9] = "GAME_MANUFACTURE_DESC_COOK", [10] = "GAME_MANUFACTURE_DESC_ROYALGIFT_COOK", [11] = "GAME_MANUFACTURE_DESC_ROYALGIFT_ALCHEMY", [12] = "LUA_MANUFACTURE_GUILDMANURACTURE_NAME", [13] = "LUA_MANUFACTURE_CRAFT_NAME"}
local manufactureListName = {[0] = "ALCHEMY_MANUFACTURE_SHAKE", [1] = "ALCHEMY_MANUFACTURE_GRIND", [2] = "ALCHEMY_MANUFACTURE_WOODSPLITTING", [3] = "ALCHEMY_MANUFACTURE_DRY", [4] = "ALCHEMY_MANUFACTURE_THINNING", [5] = "ALCHEMY_MANUFACTURE_HEATING", [6] = "", [7] = "ALCHEMY_MANUFACTURE_REPAIR", [8] = "LUA_ALCHEMY_MANUFACTURE_ALCHEMY", [9] = "LUA_ALCHEMY_MANUFACTURE_COOK", [10] = "LUA_ALCHEMY_MANUFACTURE_ROYALGIFT_COOK", [11] = "LUA_ALCHEMY_MANUFACTURE_ROYALGIFT_ALCHEMY", [12] = "LUA_MANUFACTURE_GUILDMANURACTURE_NAME", [13] = "LUA_MANUFACTURE_CRAFT_NAME"}
local _usingItemSlotCount = 0
local _whiteCircle = (UI.getChildControl)(Panel_Manufacture, "Static_WhiteCircle")
local _slotConfig = {createIcon = true, createBorder = false, createCount = true, createCash = true}
local _slotCount = 5
local _pointList = {}
local contentsOptionCheck = function()
  -- function num : 0_2 , upvalues : contentsOption, enableCraft, MAX_ACTION_BTN
  if contentsOption then
    if enableCraft then
      MAX_ACTION_BTN = 14
    else
      MAX_ACTION_BTN = 13
    end
  else
    if enableCraft then
      MAX_ACTION_BTN = 13
    else
      MAX_ACTION_BTN = 12
    end
  end
end

contentsOptionCheck()
for ii = 0, _slotCount - 1 do
  _pointList[ii] = (UI.getChildControl)(Panel_Manufacture, "Static_Point_" .. ii + 1)
  ;
  (_pointList[ii]):SetShow(false)
end
local _slotList = {}
for index = 0, _slotCount - 1 do
  local createdSlot = {}
  ;
  (SlotItem.new)(createdSlot, "ItemIconSlot" .. index, 0, Panel_Manufacture, _slotConfig)
  createdSlot:createChild()
  ;
  (createdSlot.icon):addInputEvent("Mouse_RUp", "Material_Mouse_RUp(" .. index .. ")")
  _slotList[index] = createdSlot
end
local SLOT_POSITION = {}
SLOT_POSITION[0] = {
[0] = {106, 66}
}
SLOT_POSITION[1] = {
[0] = {32, 139}
, 
[1] = {180, 139}
}
SLOT_POSITION[2] = {
[0] = {106, 66}
, 
[1] = {35, 165}
, 
[2] = {177, 165}
}
SLOT_POSITION[3] = {
[0] = {39, 110}
, 
[1] = {174, 110}
, 
[2] = {60, 200}
, 
[3] = {151, 200}
}
SLOT_POSITION[4] = {
[0] = {106, 66}
, 
[1] = {39, 110}
, 
[2] = {174, 110}
, 
[3] = {60, 200}
, 
[4] = {151, 200}
}
local _manufactureText = (UI.getChildControl)(Panel_Manufacture, "StaticText_CircleName")
_manufactureText:SetShow(false)
local _uiButtonManufacture = (UI.getChildControl)(Panel_Manufacture, "Button_Manufacture")
_uiButtonManufacture:addInputEvent("Mouse_LUp", "Manufacture_RepeatAction()")
_uiButtonManufacture:addInputEvent("Mouse_On", "Manufacture_Mouse_On()")
local _uiButtonClose = (UI.getChildControl)(Panel_Manufacture, "Button_Close")
_uiButtonClose:addInputEvent("Mouse_LUp", "Manufacture_Close()")
local _buttonQuestion = (UI.getChildControl)(Panel_Manufacture, "Button_Question")
_buttonQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelManufacture\" )")
_buttonQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelManufacture\", \"true\")")
_buttonQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelManufacture\", \"false\")")
local _currentActionIcon = (UI.getChildControl)(Panel_Manufacture, "Static_CurrentActionIcon")
_currentActionIcon:SetShow(false)
_currentActionIcon:SetIgnore(true)
local _manufactureName = (UI.getChildControl)(Panel_Manufacture, "StaticText_ManufactureName")
_manufactureName:SetShow(false)
_manufactureName:SetIgnore(true)
_manufactureName:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
local _textTemp = (UI.getChildControl)(Panel_Manufacture, "StaticText_Template")
_textTemp:SetShow(false)
_textTemp:SetIgnore(true)
_textTemp:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
local _textDescBG = (UI.getChildControl)(Panel_Manufacture, "Static_DescBG")
_textDescBG:SetIgnore(true)
local _textDesc = (UI.getChildControl)(Panel_Manufacture, "StaticText_Desc")
_textDesc:SetIgnore(true)
_textDesc:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
_textDesc:SetText("")
local _btn_funcBG = (UI.getChildControl)(Panel_Manufacture, "Static_FrameBG")
local list2 = (UI.getChildControl)(Panel_Manufacture, "List2_Manufacture")
local limitTextTooltip = {}
local IsLimitText = {}
local selectIndex = -1
local Manufacture_Notify = {_progress_BG = (UI.getChildControl)(Panel_Manufacture_Notify, "Static_Progress_BG"), _progress_Bar = (UI.getChildControl)(Panel_Manufacture_Notify, "Progress2_Manufacture"), _progress_Text = (UI.getChildControl)(Panel_Manufacture_Notify, "StaticText_Manufacture_Progress"), _progress_Effect = (UI.getChildControl)(Panel_Manufacture_Notify, "Static_Progress_Effect"), _type_Name = (UI.getChildControl)(Panel_Manufacture_Notify, "StaticText_Manufacture_Type"), _result_Title = (UI.getChildControl)(Panel_Manufacture_Notify, "StaticText_Result_Title"), 
_item_Resource = {}
, 
_icon_ResourceBG = {}
, 
_icon_Resource = {}
, 
_item_Result = {}
, 
_icon_ResultBG = {}
, 
_icon_Result = {}
, 
_templat = {_item_Resource = (UI.getChildControl)(Panel_Manufacture_Notify, "StaticText_ResourceItem"), _icon_ResourceBG = (UI.getChildControl)(Panel_Manufacture_Notify, "Static_ResourceIcon_BG"), _icon_Resource = (UI.getChildControl)(Panel_Manufacture_Notify, "Static_ResourceIcon"), _item_Result = (UI.getChildControl)(Panel_Manufacture_Notify, "StaticText_ResultItem"), _icon_ResultBG = (UI.getChildControl)(Panel_Manufacture_Notify, "Static_ResultIcon_BG"), _icon_Result = (UI.getChildControl)(Panel_Manufacture_Notify, "Static_ResultIcon")}
, 
_data_Resource = {}
, 
_data_Result = {}
, _gapY = 20, _defalutSpanY = 0, _failCount = 0, _successCount = 0}
local _defaultMSG1 = (UI.getChildControl)(Panel_Manufacture, "StaticText_DefaultMSG1")
_defaultMSG1:SetShow(false)
_defaultMSG1:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
local _defaultMSG2 = (UI.getChildControl)(Panel_Manufacture, "StaticText_DefaultMSG2")
_defaultMSG2:SetShow(false)
local _uiButtonNote = (UI.getChildControl)(Panel_Manufacture, "Button_Note")
if isGameTypeKR2() then
  _uiButtonNote:SetShow(false)
end
_uiButtonNote:addInputEvent("Mouse_LUp", "Note_Mouse_LUp()")
_uiButtonNote:addInputEvent("Mouse_On", "Note_Mouse_On()")
local _frameManufactureDesc = (UI.getChildControl)(Panel_Manufacture, "Frame_ManufactureDesc")
local _frameContent = (UI.getChildControl)(_frameManufactureDesc, "Frame_1_Content")
local _uiKnowledgeDesc = (UI.getChildControl)(_frameContent, "StaticText_KnowledgeDesc")
_uiKnowledgeDesc:SetAutoResize(true)
local _uiKnowledgeIcon = (UI.getChildControl)(Panel_Manufacture, "Static_KnoeledgeIcon")
local _startKnowledgeIndex = 0
local SHAKE_MENTALTHEMEKEY = 30200
local DRY_MENTALTHEMEKEY = 30300
local THINNING_MENTALTHEMEKEY = 30400
local GRIND_MENTALTHEMEKEY = 30500
local HEAT_MENTALTHEMEKEY = 30600
local FIREWOOD_MENTALTHEMEKEY = 30700
local COOK_MENTALTHEMEKEY = 30109
local ALCHEMY_MENTALTHEMEKEY = 31009
local ROYALCOOK_MENTALTHEMEKEY = 30110
local ROYALALCHEMY_MENTALTHEMEKEY = 31012
local GUILDMANUFACTURE_MENTALTHEMEKEY = 31013
local CRAFT_MENTALTHEMEKEY = 30800
local RAINWATER_MENTALTHEMEKEY = 30800
local iconPosY = _currentActionIcon:GetPosY()
local textTempPosY = _textTemp:GetPosY()
local textDescPosY = _textDesc:GetPosY()
local manufactureNamePosY = _manufactureName:GetPosY()
ManufactureControlInit = function()
  -- function num : 0_3 , upvalues : _ACTIONNAME_SHAKE, _listAction, _ACTIONNAME_GRIND, _ACTIONNAME_FIREWOOD, _ACTIONNAME_DRY, _ACTIONNAME_THINNING, _ACTIONNAME_HEAT, _ACTIONNAME_RAINWATER, _ACTIONNAME_REPAIR, _ACTIONNAME_ALCHEMY, _ACTIONNAME_COOK, _ACTIONNAME_RG_COOK, _ACTIONNAME_RG_ALCHEMY, contentsOption, _ACTIONNAME_GUILDMANUFACTURE, enableCraft, _ACTIONNAME_CRAFT, _btn_funcBG, list2
  local manufactureAction1 = {}
  manufactureAction1._actionName = _ACTIONNAME_SHAKE
  manufactureAction1._radioBtn = (UI.getChildControl)(Panel_Manufacture, "RadioButton_Action1")
  ;
  (manufactureAction1._radioBtn):addInputEvent("Mouse_LUp", "Manufacture_Button_LUp_Shake(true)")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  _listAction[0] = manufactureAction1
  local manufactureAction2 = {}
  manufactureAction2._actionName = _ACTIONNAME_GRIND
  manufactureAction2._radioBtn = (UI.getChildControl)(Panel_Manufacture, "RadioButton_Action2")
  ;
  (manufactureAction2._radioBtn):addInputEvent("Mouse_LUp", "Manufacture_Button_LUp_Grind(true)")
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R2 in 'UnsetPending'

  _listAction[1] = manufactureAction2
  local manufactureAction3 = {}
  manufactureAction3._actionName = _ACTIONNAME_FIREWOOD
  manufactureAction3._radioBtn = (UI.getChildControl)(Panel_Manufacture, "RadioButton_Action3")
  ;
  (manufactureAction3._radioBtn):addInputEvent("Mouse_LUp", "Manufacture_Button_LUp_FireWood(true)")
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R3 in 'UnsetPending'

  _listAction[2] = manufactureAction3
  local manufactureAction4 = {}
  manufactureAction4._actionName = _ACTIONNAME_DRY
  manufactureAction4._radioBtn = (UI.getChildControl)(Panel_Manufacture, "RadioButton_Action4")
  ;
  (manufactureAction4._radioBtn):addInputEvent("Mouse_LUp", "Manufacture_Button_LUp_Dry(true)")
  -- DECOMPILER ERROR at PC63: Confused about usage of register: R4 in 'UnsetPending'

  _listAction[3] = manufactureAction4
  local manufactureAction5 = {}
  manufactureAction5._actionName = _ACTIONNAME_THINNING
  manufactureAction5._radioBtn = (UI.getChildControl)(Panel_Manufacture, "RadioButton_Action5")
  ;
  (manufactureAction5._radioBtn):addInputEvent("Mouse_LUp", "Manufacture_Button_LUp_Thinning(true)")
  -- DECOMPILER ERROR at PC79: Confused about usage of register: R5 in 'UnsetPending'

  _listAction[4] = manufactureAction5
  local manufactureAction6 = {}
  manufactureAction6._actionName = _ACTIONNAME_HEAT
  manufactureAction6._radioBtn = (UI.getChildControl)(Panel_Manufacture, "RadioButton_Action6")
  ;
  (manufactureAction6._radioBtn):addInputEvent("Mouse_LUp", "Manufacture_Button_LUp_Heat(true)")
  -- DECOMPILER ERROR at PC95: Confused about usage of register: R6 in 'UnsetPending'

  _listAction[5] = manufactureAction6
  local manufactureAction7 = {}
  manufactureAction7._actionName = _ACTIONNAME_RAINWATER
  manufactureAction7._radioBtn = (UI.getChildControl)(Panel_Manufacture, "RadioButton_Action7")
  ;
  (manufactureAction7._radioBtn):addInputEvent("Mouse_LUp", "Manufacture_Button_LUp_Rainwater(true)")
  -- DECOMPILER ERROR at PC111: Confused about usage of register: R7 in 'UnsetPending'

  _listAction[6] = manufactureAction7
  local manufactureAction8 = {}
  manufactureAction8._actionName = _ACTIONNAME_REPAIR
  manufactureAction8._radioBtn = (UI.getChildControl)(Panel_Manufacture, "RadioButton_RepairItem")
  ;
  (manufactureAction8._radioBtn):addInputEvent("Mouse_LUp", "Manufacture_Button_LUp_RepairItem(true)")
  -- DECOMPILER ERROR at PC127: Confused about usage of register: R8 in 'UnsetPending'

  _listAction[7] = manufactureAction8
  local manufactureAction9 = {}
  manufactureAction9._actionName = _ACTIONNAME_ALCHEMY
  manufactureAction9._radioBtn = (UI.getChildControl)(Panel_Manufacture, "RadioButton_Action9")
  ;
  (manufactureAction9._radioBtn):addInputEvent("Mouse_LUp", "Manufacture_Button_LUp_Alchemy(true)")
  -- DECOMPILER ERROR at PC143: Confused about usage of register: R9 in 'UnsetPending'

  _listAction[8] = manufactureAction9
  local manufactureAction10 = {}
  manufactureAction10._actionName = _ACTIONNAME_COOK
  manufactureAction10._radioBtn = (UI.getChildControl)(Panel_Manufacture, "RadioButton_Action10")
  ;
  (manufactureAction10._radioBtn):addInputEvent("Mouse_LUp", "Manufacture_Button_LUp_Cook(true)")
  -- DECOMPILER ERROR at PC159: Confused about usage of register: R10 in 'UnsetPending'

  _listAction[9] = manufactureAction10
  local manufactureAction11 = {}
  manufactureAction11._actionName = _ACTIONNAME_RG_COOK
  manufactureAction11._radioBtn = (UI.getChildControl)(Panel_Manufacture, "RadioButton_Action11")
  ;
  (manufactureAction11._radioBtn):addInputEvent("Mouse_LUp", "Manufacture_Button_LUp_RGCook(true)")
  -- DECOMPILER ERROR at PC175: Confused about usage of register: R11 in 'UnsetPending'

  _listAction[10] = manufactureAction11
  local manufactureAction12 = {}
  manufactureAction12._actionName = _ACTIONNAME_RG_ALCHEMY
  manufactureAction12._radioBtn = (UI.getChildControl)(Panel_Manufacture, "RadioButton_Action12")
  ;
  (manufactureAction12._radioBtn):addInputEvent("Mouse_LUp", "Manufacture_Button_LUp_RGAlchemy(true)")
  -- DECOMPILER ERROR at PC191: Confused about usage of register: R12 in 'UnsetPending'

  _listAction[11] = manufactureAction12
  local manufactureAction13 = {}
  if contentsOption then
    manufactureAction13._actionName = _ACTIONNAME_GUILDMANUFACTURE
    manufactureAction13._radioBtn = (UI.getChildControl)(Panel_Manufacture, "RadioButton_Action13")
    ;
    (manufactureAction13._radioBtn):addInputEvent("Mouse_LUp", "Manufacture_Button_LUp_GuildManufacture(true)")
    -- DECOMPILER ERROR at PC210: Confused about usage of register: R13 in 'UnsetPending'

    _listAction[12] = manufactureAction13
  else
    manufactureAction13._radioBtn = (UI.getChildControl)(Panel_Manufacture, "RadioButton_Action13")
    ;
    (manufactureAction13._radioBtn):SetShow(false)
  end
  local manufactureAction14 = {}
  if enableCraft then
    manufactureAction14._actionName = _ACTIONNAME_CRAFT
    manufactureAction14._radioBtn = (UI.getChildControl)(Panel_Manufacture, "RadioButton_Action14")
    ;
    (manufactureAction14._radioBtn):addInputEvent("Mouse_LUp", "Manufacture_Button_LUp_Craft(true)")
    -- DECOMPILER ERROR at PC240: Confused about usage of register: R14 in 'UnsetPending'

    _listAction[13] = manufactureAction14
    _btn_funcBG:SetSize(_btn_funcBG:GetSizeX(), 195)
    list2:SetSize(list2:GetSizeX(), 360)
    Panel_Manufacture:SetSize(Panel_Manufacture:GetSizeX(), 597)
  else
    manufactureAction14._radioBtn = (UI.getChildControl)(Panel_Manufacture, "RadioButton_Action14")
    ;
    (manufactureAction14._radioBtn):SetShow(false)
    Panel_Manufacture:SetSize(Panel_Manufacture:GetSizeX(), 540)
    _btn_funcBG:SetSize(_btn_funcBG:GetSizeX(), 133)
    list2:SetSize(list2:GetSizeX(), 300)
  end
end

ManufactureControlEnable = function(control, isEnable)
  -- function num : 0_4
  if isEnable == true then
    control:SetIgnore(false)
    control:SetEnable(true)
    control:SetDisableColor(false)
  else
    control:SetIgnore(false)
    control:SetEnable(false)
    control:SetDisableColor(true)
  end
end

ManufactureShowAni = function()
  -- function num : 0_5 , upvalues : _whiteCircle, UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_Manufacture)
  _whiteCircle:SetShow(true)
  _whiteCircle:SetAlpha(0)
  ;
  (UIAni.AlphaAnimation)(1, _whiteCircle, 0, 0.2)
  local aniInfo1 = Panel_Manufacture:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_Manufacture:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Manufacture:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_Manufacture:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Manufacture:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Manufacture:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

ManufactureHideAni = function()
  -- function num : 0_6 , upvalues : UI_ANI_ADV, UI_color, _whiteCircle
  Panel_Manufacture:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_Manufacture:addColorAnimation(0, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
  local alphaAni = (UIAni.AlphaAnimation)(0, _whiteCircle, 0, 0.12)
  alphaAni:SetHideAtEnd(true)
end

Manufacture_SetRadioBtnFontColor = function(control)
  -- function num : 0_7 , upvalues : UI_color
  if control:IsChecked() then
    control:SetFontColor(UI_color.C_FFFFFFFF)
  else
    control:SetFontColor(UI_color.C_FFC4BEBE)
  end
end

Manufacture_UpdateCheckRadioButton = function(isClear)
  -- function num : 0_8 , upvalues : MAX_ACTION_BTN, _listAction
  for i = 0, MAX_ACTION_BTN - 1 do
    if isClear ~= nil and isClear == true then
      ((_listAction[i])._radioBtn):SetCheck(false)
    end
    Manufacture_SetRadioBtnFontColor((_listAction[i])._radioBtn)
  end
end

Manufacture_UpdateVisibleRadioButton = function(installationType)
  -- function num : 0_9 , upvalues : INSTALLATIONTYPE_ACTIONNAME, MAX_ACTION_BTN, _listAction, territorySupply, _ACTIONNAME_GRIND, isEnableMsg, _ACTIONNAME_FIREWOOD, _ACTIONNAME_HEAT, _ACTIONNAME_REPAIR
  if installationType ~= nil and (CppEnums.InstallationType).TypeCount ~= installationType then
    local tempActionName = INSTALLATIONTYPE_ACTIONNAME[installationType]
    for i = 0, MAX_ACTION_BTN - 1 do
      if tempActionName == (_listAction[i])._actionName then
        local isVisible = isVisibleManufactureAction((_listAction[i])._actionName)
        ;
        ((_listAction[i])._radioBtn):SetShow(isVisible)
      else
        do
          do
            ;
            ((_listAction[i])._radioBtn):SetShow(false)
            -- DECOMPILER ERROR at PC37: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC37: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC37: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  else
    do
      for i = 0, MAX_ACTION_BTN - 1 do
        local isVisible = isVisibleManufactureAction((_listAction[i])._actionName)
        ;
        ((_listAction[i])._radioBtn):SetShow(isVisible)
      end
      do
        if not territorySupply then
          ((_listAction[10])._radioBtn):SetShow(false)
          ;
          ((_listAction[11])._radioBtn):SetShow(false)
        end
        local isNearAnvil = isNearInstallation((CppEnums.InstallationType).eType_Anvil)
        local isNearMortar = true
        local isNearStump = true
        local isNearFireBowl = true
        for i = 0, MAX_ACTION_BTN - 1 do
          if ((_listAction[i])._radioBtn):GetShow() == true then
            local isEnable = isEnableManufactureAction((_listAction[i])._actionName)
            if isEnable then
              ManufactureControlEnable((_listAction[i])._radioBtn, _ACTIONNAME_GRIND ~= (_listAction[i])._actionName or isNearMortar)
              -- DECOMPILER ERROR at PC119: Confused about usage of register: R10 in 'UnsetPending'

              isEnableMsg[i] = isEnable and isNearMortar and true or false
              if isEnable then
                ManufactureControlEnable((_listAction[i])._radioBtn, _ACTIONNAME_FIREWOOD ~= (_listAction[i])._actionName or isNearStump)
                -- DECOMPILER ERROR at PC144: Confused about usage of register: R10 in 'UnsetPending'

                isEnableMsg[i] = isEnable and isNearStump and true or false
                if isEnable then
                  ManufactureControlEnable((_listAction[i])._radioBtn, _ACTIONNAME_HEAT ~= (_listAction[i])._actionName or isNearFireBowl)
                  -- DECOMPILER ERROR at PC169: Confused about usage of register: R10 in 'UnsetPending'

                  isEnableMsg[i] = isEnable and isNearFireBowl and true or false
                  if isEnable then
                    do
                      ManufactureControlEnable((_listAction[i])._radioBtn, _ACTIONNAME_REPAIR ~= (_listAction[i])._actionName or isNearAnvil)
                      -- DECOMPILER ERROR at PC194: Confused about usage of register: R10 in 'UnsetPending'

                      isEnableMsg[i] = isEnable and isNearAnvil and true or false
                      ManufactureControlEnable((_listAction[i])._radioBtn, isEnable)
                      -- DECOMPILER ERROR at PC203: Confused about usage of register: R10 in 'UnsetPending'

                      isEnableMsg[i] = true
                      -- DECOMPILER ERROR at PC204: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC204: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC204: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC204: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC204: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC204: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC204: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC204: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC204: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC204: LeaveBlock: unexpected jumping out IF_STMT

                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

local slideBtnSize = 0
Manufacture_Show = function(installationType, materialWhereType, isClear, showType, waypointKey)
  -- function num : 0_10 , upvalues : invenShow, materialItemWhereType, waypointKey_ByWareHouse, _listAction, _textDesc, _uiButtonManufacture, contentsOption, _frameManufactureDesc
  if ToClient_GetMyTeamNoLocalWar() ~= 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_LOCALWAR_ALERT"))
    return 
  end
  if selfPlayerIsInCompetitionArea() then
    return 
  end
  if Panel_AlchemyFigureHead:GetShow() then
    FGlobal_AlchemyFigureHead_Close()
  end
  if Panel_AlchemyStone:GetShow() then
    FGlobal_AlchemyStone_Close()
  end
  if Panel_DyePalette:GetShow() then
    FGlobal_DyePalette_Close()
  end
  if Panel_Equipment:GetShow() then
    EquipmentWindow_Close()
  end
  local noticeText = ""
  invenShow = showType
  StopManufactureAction()
  Manufacture_Reset_ContinueGrindJewel()
  if materialWhereType == nil then
    return 
  end
  if materialWhereType ~= (CppEnums.ItemWhereType).eInventory and materialWhereType ~= (CppEnums.ItemWhereType).eCashInventory and materialWhereType ~= (CppEnums.ItemWhereType).eWarehouse then
    return 
  end
  materialItemWhereType = materialWhereType
  if materialWhereType == (CppEnums.ItemWhereType).eWarehouse and waypointKey == nil then
    return 
  end
  if (CppEnums.ItemWhereType).eInventory == materialWhereType or (CppEnums.ItemWhereType).eCashInventory == materialWhereType then
    InventoryWindow_Show()
    Inventory_SetFunctor(Manufacture_SelectCheck1, Manufacture_SelectCheck2, Manufacture_Close, nil)
  else
    waypointKey_ByWareHouse = waypointKey
    InventoryWindow_Close()
    Warehouse_OpenPanelFromManufacture()
    Warehouse_SetFunctor(nil, nil)
  end
  ReconstructionAlchemyKnowledge()
  Panel_Manufacture:SetShow(true, true)
  if Panel_Window_Inventory:IsUISubApp() then
    Panel_Manufacture:OpenUISubApp()
  end
  if isClear ~= nil and isClear == true then
    Manufacture_ClearMaterial()
  end
  Manufacture_UpdateVisibleRadioButton(installationType)
  if installationType ~= nil then
    local isEnable = false
    if installationType == (CppEnums.InstallationType).eType_Mortar then
      isEnable = isEnableManufactureAction((_listAction[1])._actionName)
      ;
      ((_listAction[1])._radioBtn):SetCheck(true)
      Manufacture_Button_LUp_Grind(false)
      if not isEnable then
        _textDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_NEED_KNOWLEDGE_MORTAR"))
      end
    else
      if installationType == (CppEnums.InstallationType).eType_Anvil then
        isEnable = isEnableManufactureAction((_listAction[7])._actionName)
        ;
        ((_listAction[7])._radioBtn):SetCheck(true)
        Manufacture_Button_LUp_RepairItem(false)
        if not isEnable then
          _textDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_NEED_KNOWLEDGE_ANVIL"))
        end
      else
        if installationType == (CppEnums.InstallationType).eType_Stump then
          isEnable = isEnableManufactureAction((_listAction[2])._actionName)
          ;
          ((_listAction[2])._radioBtn):SetCheck(true)
          Manufacture_Button_LUp_FireWood(false)
          if not isEnable then
            _textDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_NEED_KNOWLEDGE_STUMP"))
          end
        else
          if installationType == (CppEnums.InstallationType).eType_FireBowl then
            isEnable = isEnableManufactureAction((_listAction[5])._actionName)
            ;
            ((_listAction[5])._radioBtn):SetCheck(true)
            Manufacture_Button_LUp_Heat(false)
            if not isEnable then
              _textDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_NEED_KNOWLEDGE_FIREBOWL"))
            end
          else
            _textDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_SELECT_TYPE"))
          end
        end
      end
    end
    Manufacture_UpdateCheckRadioButton()
    if isEnable then
      do
        _uiButtonManufacture:SetShow(isEnable)
        Manufacture_UpdateCheckRadioButton(true)
        ManufactureKnowledge_ShowList(true)
        _uiButtonManufacture:SetShow(false)
        local houseWrapper = housing_getHouseholdActor_CurrentPosition()
        if contentsOption then
          if houseWrapper ~= nil then
            local isMyGuildHouse = houseWrapper:isMyGuildHouse()
            if isMyGuildHouse == true then
              ((_listAction[12])._radioBtn):SetIgnore(false)
              ;
              ((_listAction[12])._radioBtn):SetMonoTone(false)
            else
              ;
              ((_listAction[12])._radioBtn):SetIgnore(true)
              ;
              ((_listAction[12])._radioBtn):SetMonoTone(true)
            end
          else
            do
              ;
              ((_listAction[12])._radioBtn):SetIgnore(true)
              ;
              ((_listAction[12])._radioBtn):SetMonoTone(true)
              _frameManufactureDesc:UpdateContentPos()
            end
          end
        end
      end
    end
  end
end

Manufacture_Close = function()
  -- function num : 0_11 , upvalues : list2, selectIndex, invenShow, _manufactureName, _textTemp, _currentActionIcon
  (list2:getElementManager()):clearKey()
  selectIndex = -1
  Panel_Manufacture:SetShow(false, false)
  Panel_Manufacture:CloseUISubApp()
  Inventory_SetFunctor(nil, nil, nil, nil)
  Warehouse_SetFunctor(nil, nil)
  if invenShow == true then
    Panel_Equipment:SetShow(true)
    Panel_Window_Inventory:SetShow(true)
    invenShow = false
  else
    EquipmentWindow_Close()
    InventoryWindow_Close()
    HelpMessageQuestion_Out()
  end
  TooltipSimple_Hide()
  _manufactureName:SetShow(false)
  _textTemp:SetShow(false)
  _currentActionIcon:SetShow(false)
end

Manufacture_ClearMaterial = function()
  -- function num : 0_12 , upvalues : _materialSlotNoList, _defaultSlotNo, _materialSlotNoListItemIn, _actionIndex, _usingInstallationType, _usingItemSlotCount, _slotCount, _pointList, _manufactureText, _textDesc, _uiButtonManufacture
  audioPostEvent_SystemUi(10, 3)
  _materialSlotNoList = {_defaultSlotNo, _defaultSlotNo, _defaultSlotNo, _defaultSlotNo; [0] = _defaultSlotNo}
  _materialSlotNoListItemIn = {false, false, false; [0] = false}
  _actionIndex = -1
  _usingInstallationType = (CppEnums.InstallationType).TypeCount
  _usingItemSlotCount = 0
  for ii = 0, _slotCount - 1 do
    (_pointList[ii]):SetShow(false)
  end
  _manufactureText:SetText("")
  _manufactureText:SetShow(false)
  _textDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_SELECT_TYPE"))
  _uiButtonManufacture:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"))
  Manufacture_UpdateSlot()
end

Manufacture_SelectCheck1 = function()
  -- function num : 0_13
  return true
end

Manufacture_SelectCheck2 = function()
  -- function num : 0_14
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_SELECTCHECK2"))
end

Manufacture_PushItemFromInventory = function(slotNo, itemWrapper, count, inventoryType)
  -- function num : 0_15 , upvalues : noneStackItemList, _usingItemSlotCount, _materialSlotNoList, _defaultSlotNo, materialItemWhereType, _materialSlotNoListItemIn, noneStackItem_ChkBtn
  if checkManufactureAction() and (#noneStackItemList == 0 or #noneStackItemList == nil) then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_DONT_CHANGE_ACTION"))
    return 
  end
  local inventory = ((getSelfPlayer()):get()):getInventory()
  local invenSize = inventory:size()
  for ii = 0, _usingItemSlotCount - 1 do
    if slotNo == _materialSlotNoList[ii] then
      break
    end
    -- DECOMPILER ERROR at PC44: Confused about usage of register: R10 in 'UnsetPending'

    if _defaultSlotNo == _materialSlotNoList[ii] then
      _materialSlotNoList[ii] = slotNo
      audioPostEvent_SystemUi(13, 8)
      break
    end
  end
  do
    materialItemWhereType = inventoryType
    if (#noneStackItemList == 0 or #noneStackItemList == nil) and (_materialSlotNoListItemIn[0] ~= true or _materialSlotNoListItemIn[1] ~= true or _materialSlotNoListItemIn[2] ~= true or _materialSlotNoListItemIn[3] ~= true) then
      noneStackItemList = (Array.new)()
      local selectedItemWrapper = getInventoryItemByType(inventoryType, slotNo)
      local selectedItemKey = ((selectedItemWrapper:get()):getKey()):getItemKey()
      local inventory = Inventory_GetCurrentInventory()
      local curentInventoryType = Inventory_GetCurrentInventoryType()
      local invenMaxSize = inventory:sizeXXX()
      for ii = 2, invenMaxSize - 1 do
        local itemWrapper = getInventoryItemByType(inventoryType, ii)
        if itemWrapper ~= nil then
          local itemKey = ((itemWrapper:get()):getKey()):getItemKey()
          if selectedItemKey == itemKey and not (selectedItemWrapper:getStaticStatus()):isStackable() and slotNo ~= ii then
            noneStackItemList:push_back(ii)
          end
        end
      end
      if #noneStackItemList > 0 then
        noneStackItem_ChkBtn:SetCheck(false)
        noneStackItem_ChkBtn:SetShow(true)
      end
    end
    do
      Manufacture_UpdateSlot()
    end
  end
end

Manufacture_PushItemFromWarehouse = function(slotNo, itemWrapper, count)
  -- function num : 0_16 , upvalues : noneStackItemList, _usingItemSlotCount, _materialSlotNoList, _defaultSlotNo
  if checkManufactureAction() and (#noneStackItemList == 0 or #noneStackItemList == nil) then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_DONT_CHANGE_ACTION"))
    return 
  end
  for ii = 0, _usingItemSlotCount - 1 do
    if slotNo == _materialSlotNoList[ii] then
      break
    end
    -- DECOMPILER ERROR at PC36: Confused about usage of register: R7 in 'UnsetPending'

    if _defaultSlotNo == _materialSlotNoList[ii] then
      _materialSlotNoList[ii] = slotNo
      audioPostEvent_SystemUi(13, 8)
      break
    end
  end
  do
    Manufacture_UpdateSlotWarehouse()
    Manufacture_HasNoneStackItem(slotNo)
  end
end

Manufacture_HasNoneStackItem = function(slotNo)
  -- function num : 0_17 , upvalues : hasNoneStackItem, selectedWarehouseItemSlotNo, waypointKey_ByWareHouse, selectedWarehouseItemKey, noneStackItem_ChkBtn
  hasNoneStackItem = false
  selectedWarehouseItemSlotNo = slotNo
  local warehouseWrapper = warehouse_get(waypointKey_ByWareHouse)
  local useMaxCount = warehouseWrapper:getUseMaxCount()
  local selectedItemWrapper = warehouseWrapper:getItem(slotNo)
  selectedWarehouseItemKey = ((selectedItemWrapper:get()):getKey()):getItemKey()
  local hasNoneStackItemCount = 0
  for ii = 1, useMaxCount - 1 do
    local itemWrapper = warehouseWrapper:getItem(ii)
    if itemWrapper ~= nil then
      local itemKey = ((itemWrapper:get()):getKey()):getItemKey()
      if selectedWarehouseItemKey == itemKey and not (selectedItemWrapper:getStaticStatus()):isStackable() and slotNo ~= ii then
        hasNoneStackItemCount = hasNoneStackItemCount + 1
      end
    end
  end
  if hasNoneStackItemCount > 0 then
    hasNoneStackItem = true
    noneStackItem_ChkBtn:SetCheck(false)
    noneStackItem_ChkBtn:SetShow(true)
  end
end

Manufacture_GetNextNoneStackItemSlotNo_ByWarehouse = function()
  -- function num : 0_18 , upvalues : waypointKey_ByWareHouse, selectedWarehouseItemKey, targetWarehouseSlotNo, hasNoneStackItem
  local warehouseWrapper = warehouse_get(waypointKey_ByWareHouse)
  local useMaxCount = warehouseWrapper:getUseMaxCount()
  for ii = 1, useMaxCount - 1 do
    local itemWrapper = warehouseWrapper:getItem(ii)
    if itemWrapper ~= nil then
      local itemKey = ((itemWrapper:get()):getKey()):getItemKey()
      if selectedWarehouseItemKey == itemKey then
        targetWarehouseSlotNo = ii
        hasNoneStackItem = true
        break
      end
    end
  end
  do
    return hasNoneStackItem
  end
end

Manufacture_ShowPointEffect = function()
  -- function num : 0_19 , upvalues : _slotCount, _usingItemSlotCount, _pointList
  for ii = 0, _slotCount - 1 do
    if ii < _usingItemSlotCount then
      (_pointList[ii]):SetShow(true)
      ;
      (_pointList[ii]):AddEffect("fUI_Light", true, 0, 0)
    else
      ;
      (_pointList[ii]):SetShow(false)
    end
  end
end

Manufacture_UpdateSlotPos = function()
  -- function num : 0_20 , upvalues : _usingItemSlotCount, SLOT_POSITION, _slotList, _pointList
  local posIndex = _usingItemSlotCount - 1
  if posIndex < 0 then
    return 
  end
  local posArray = SLOT_POSITION[posIndex]
  for ii = 0, posIndex do
    local pos = posArray[ii]
    ;
    ((_slotList[ii]).icon):SetPosX(pos[1] + 14)
    ;
    ((_slotList[ii]).icon):SetPosY(pos[2] + 9)
    ;
    (_pointList[ii]):SetPosX(pos[1] + 28)
    ;
    (_pointList[ii]):SetPosY(pos[2] + 18)
  end
end

Manufacture_UpdateSlotWarehouse = function()
  -- function num : 0_21 , upvalues : _whiteCircle, _slotCount, _slotList, _materialSlotNoList, _materialSlotNoListItemIn, _defaultSlotNo, MAX_ACTION_BTN, _listAction, _uiButtonManufacture
  _whiteCircle:EraseAllEffect()
  local warehouseSize = 0
  local warehouseWrapper = Warehouse_GetWarehouseWarpper()
  if warehouseWrapper == nil then
    return 
  end
  warehouseSize = warehouseWrapper:getUseMaxCount()
  for ii = 0, _slotCount - 1 do
    ((_slotList[ii]).icon):SetShow(false)
    ;
    ((_slotList[ii]).icon):addInputEvent("Mouse_On", "")
    ;
    ((_slotList[ii]).icon):addInputEvent("Mouse_Out", "")
    if _materialSlotNoList[ii] ~= nil and _materialSlotNoList[ii] <= warehouseSize then
      local itemWrapper = warehouseWrapper:getItem(_materialSlotNoList[ii])
      if itemWrapper ~= nil then
        (_slotList[ii]):setItemByStaticStatus(itemWrapper:getStaticStatus(), (itemWrapper:get()):getCount_s64())
        ;
        ((_slotList[ii]).icon):SetShow(true)
        ;
        ((_slotList[ii]).icon):AddEffect("fUI_ItemInstall_Produce", false, 0, 0)
        ;
        ((_slotList[ii]).icon):addInputEvent("Mouse_On", "Material_Mouse_On( " .. ii .. " )")
        ;
        ((_slotList[ii]).icon):addInputEvent("Mouse_Out", "Material_Mouse_Out( " .. ii .. " )")
        _whiteCircle:AddEffect("UI_ItemInstall_ProduceRing", false, 0, 0)
        -- DECOMPILER ERROR at PC104: Confused about usage of register: R7 in 'UnsetPending'

        _materialSlotNoListItemIn[ii] = true
      else
        -- DECOMPILER ERROR at PC108: Confused about usage of register: R7 in 'UnsetPending'

        _materialSlotNoList[ii] = _defaultSlotNo
        -- DECOMPILER ERROR at PC110: Confused about usage of register: R7 in 'UnsetPending'

        _materialSlotNoListItemIn[ii] = false
      end
    end
  end
  local isEnable = false
  for i = 0, MAX_ACTION_BTN - 1 do
    if ((_listAction[i])._radioBtn):IsCheck() == true then
      isEnable = true
    end
  end
  _uiButtonManufacture:SetShow(isEnable)
  Warehouse_updateSlotData()
end

Manufacture_UpdateSlot = function()
  -- function num : 0_22 , upvalues : _whiteCircle, _slotCount, _slotList, _materialSlotNoList, materialItemWhereType, _materialSlotNoListItemIn, noneStackItem_ChkBtn, _defaultSlotNo, MAX_ACTION_BTN, _listAction, _uiButtonManufacture
  _whiteCircle:EraseAllEffect()
  local inventory = Inventory_GetCurrentInventory()
  if inventory == nil then
    return 
  end
  local invenSize = inventory:size()
  for ii = 0, _slotCount - 1 do
    ((_slotList[ii]).icon):SetShow(false)
    ;
    ((_slotList[ii]).icon):addInputEvent("Mouse_On", "")
    ;
    ((_slotList[ii]).icon):addInputEvent("Mouse_Out", "")
    if _materialSlotNoList[ii] ~= nil and _materialSlotNoList[ii] <= invenSize then
      local itemWrapper = nil
      if (CppEnums.ItemWhereType).eWarehouse == materialItemWhereType then
        itemWrapper = (Warehouse_GetWarehouseWarpper()):getItem(_materialSlotNoList[ii])
      else
        local curentInventoryType = Inventory_GetCurrentInventoryType()
        itemWrapper = getInventoryItemByType(curentInventoryType, _materialSlotNoList[ii])
      end
      do
        if itemWrapper ~= nil then
          (_slotList[ii]):setItemByStaticStatus(itemWrapper:getStaticStatus(), (itemWrapper:get()):getCount_s64())
          ;
          ((_slotList[ii]).icon):SetShow(true)
          ;
          ((_slotList[ii]).icon):AddEffect("fUI_ItemInstall_Produce", false, 0, 0)
          ;
          ((_slotList[ii]).icon):addInputEvent("Mouse_On", "Material_Mouse_On( " .. ii .. " )")
          ;
          ((_slotList[ii]).icon):addInputEvent("Mouse_Out", "Material_Mouse_Out( " .. ii .. " )")
          _whiteCircle:AddEffect("UI_ItemInstall_ProduceRing", false, 0, 0)
          -- DECOMPILER ERROR at PC121: Confused about usage of register: R7 in 'UnsetPending'

          _materialSlotNoListItemIn[ii] = true
          local isStack = (itemWrapper:getStaticStatus()):isStackable()
          if isStack then
            noneStackItem_ChkBtn:SetCheck(false)
            noneStackItem_ChkBtn:SetShow(false)
          end
        else
          do
            do
              -- DECOMPILER ERROR at PC139: Confused about usage of register: R7 in 'UnsetPending'

              _materialSlotNoList[ii] = _defaultSlotNo
              -- DECOMPILER ERROR at PC141: Confused about usage of register: R7 in 'UnsetPending'

              _materialSlotNoListItemIn[ii] = false
              -- DECOMPILER ERROR at PC142: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC142: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC142: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC142: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC142: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC142: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
  local isEnable = false
  for i = 0, MAX_ACTION_BTN - 1 do
    if ((_listAction[i])._radioBtn):IsCheck() == true then
      isEnable = true
    end
  end
  _uiButtonManufacture:SetShow(isEnable)
  Inventory_updateSlotData()
end

Manufacture_Response = function()
  -- function num : 0_23 , upvalues : noneStackItemList, noneStackItemCheck, materialItemWhereType
  local _uiMode = GetUIMode()
  if #noneStackItemList ~= nil and #noneStackItemList > 0 and noneStackItemCheck == true then
    return 
  end
  if _uiMode == (Defines.UIMode).eUIMode_Default then
    Manufacture_Show(nil, materialItemWhereType, true)
  end
end

Manufacture_RepeatManufacture = function()
  -- function num : 0_24 , upvalues : _actionIndex
  if _actionIndex == -1 then
    return 
  end
  if _actionIndex == 0 then
    Manufacture_Button_LUp_Shake(true)
  else
    if _actionIndex == 1 then
      Manufacture_Button_LUp_Grind(true)
    else
      if _actionIndex == 2 then
        Manufacture_Button_LUp_FireWood(true)
      else
        if _actionIndex == 3 then
          Manufacture_Button_LUp_Dry(true)
        else
          if _actionIndex == 4 then
            Manufacture_Button_LUp_Thinning(true)
          else
            if _actionIndex == 5 then
              Manufacture_Button_LUp_Heat(true)
            else
              if _actionIndex == 6 then
                Manufacture_Button_LUp_Rainwater(true)
              else
                if _actionIndex == 7 then
                  Manufacture_Button_LUp_RepairItem(true)
                else
                  if _actionIndex == 8 then
                    Manufacture_Button_LUp_Alchemy(true)
                  else
                    if _actionIndex == 9 then
                      Manufacture_Button_LUp_Cook(true)
                    else
                      if _actionIndex == 10 then
                        Manufacture_Button_LUp_RGCook(true)
                      else
                        if _actionIndex == 11 then
                          Manufacture_Button_LUp_RGAlchemy(true)
                        else
                          if _actionIndex == 12 then
                            Manufacture_Button_LUp_GuildManufacture(true)
                          else
                            if _actionIndex == 13 then
                              Manufacture_Button_LUp_Craft(true)
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

Manufacture_ContinueGrindJewel = function()
  -- function num : 0_25 , upvalues : materialItemWhereType, noneStackItemList, noneStackItemCheck, hasNoneStackItem, waypointKey_ByWareHouse, targetWarehouseSlotNo
  -- DECOMPILER ERROR at PC24: Unhandled construct in 'MakeBoolean' P1

  if ((CppEnums.ItemWhereType).eInventory == materialItemWhereType or (CppEnums.ItemWhereType).eCashInventory == materialItemWhereType) and #noneStackItemList ~= nil and #noneStackItemList > 0 and noneStackItemCheck == true then
    Manufacture_RepeatManufacture()
    local nextSlotNo = noneStackItemList[1]
    local curentInventoryType = Inventory_GetCurrentInventoryType()
    local itemWrapper = getInventoryItemByType(curentInventoryType, nextSlotNo)
    if itemWrapper == nil then
      return 
    end
    local itemCount = (itemWrapper:get()):getCount_s64()
    Manufacture_PushItemFromInventory(nextSlotNo, itemWrapper, itemCount, curentInventoryType)
    Manufacture_Mouse_LUp()
    noneStackItemList:pop_front()
  end
  do
    local hasNext = Manufacture_GetNextNoneStackItemSlotNo_ByWarehouse()
    if hasNext == true and hasNoneStackItem == true and noneStackItemCheck == true then
      local warehouseWrapper = warehouse_get(waypointKey_ByWareHouse)
      if warehouseWrapper == nil then
        return 
      end
      local itemWrapper = warehouseWrapper:getItem(targetWarehouseSlotNo)
      if itemWrapper == nil then
        return 
      end
      Manufacture_RepeatManufacture()
      Manufacture_PushItemFromWarehouse(targetWarehouseSlotNo, itemWrapper, 1)
      Manufacture_Mouse_LUp()
    end
  end
end

Manufacture_ResponseResultItem = function(itemDynamicListWrapper, failReason)
  -- function num : 0_26 , upvalues : Manufacture_Notify, materialItemWhereType, waypointKey_ByWareHouse, noneStackItemList, noneStackItemCheck, hasNoneStackItem
  local size = itemDynamicListWrapper:getSize()
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R3 in 'UnsetPending'

  if size > 0 then
    Manufacture_Notify._failCount = 0
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R3 in 'UnsetPending'

    Manufacture_Notify._successCount = Manufacture_Notify._successCount + 1
    for index = 0, size - 1 do
      local itemDynamicInformationWrapper = itemDynamicListWrapper:getElement(index)
      local ItemEnchantStaticStatusWrapper = itemDynamicInformationWrapper:getStaticStatus()
      local itemKey = (ItemEnchantStaticStatusWrapper:get())._key
      local s64_stackCount = (Int64toInt32(itemDynamicInformationWrapper:getCount_s64()))
      local idx = nil
      for key,value in pairs(Manufacture_Notify._data_Result) do
        if (value._key):getItemKey() == itemKey:getItemKey() then
          idx = key
        end
      end
      if idx == nil then
        idx = #Manufacture_Notify._data_Result + 1
        -- DECOMPILER ERROR at PC52: Confused about usage of register: R12 in 'UnsetPending'

        ;
        (Manufacture_Notify._data_Result)[idx] = {}
        -- DECOMPILER ERROR at PC56: Confused about usage of register: R12 in 'UnsetPending'

        ;
        ((Manufacture_Notify._data_Result)[idx])._key = itemKey
        -- DECOMPILER ERROR at PC62: Confused about usage of register: R12 in 'UnsetPending'

        ;
        ((Manufacture_Notify._data_Result)[idx])._name = ItemEnchantStaticStatusWrapper:getName()
        -- DECOMPILER ERROR at PC70: Confused about usage of register: R12 in 'UnsetPending'

        ;
        ((Manufacture_Notify._data_Result)[idx])._iconPath = "Icon/" .. ItemEnchantStaticStatusWrapper:getIconPath()
        -- DECOMPILER ERROR at PC74: Confused about usage of register: R12 in 'UnsetPending'

        ;
        ((Manufacture_Notify._data_Result)[idx])._currentCnt = s64_stackCount
      else
        -- DECOMPILER ERROR at PC84: Confused about usage of register: R12 in 'UnsetPending'

        ;
        ((Manufacture_Notify._data_Result)[idx])._currentCnt = ((Manufacture_Notify._data_Result)[idx])._currentCnt + s64_stackCount
      end
    end
    for key,value in pairs(Manufacture_Notify._data_Resource) do
      local itemWrapper = nil
      local count = 0
      if (CppEnums.ItemWhereType).eInventory == materialItemWhereType or (CppEnums.ItemWhereType).eCashInventory == materialItemWhereType then
        local curentInventoryType = Inventory_GetCurrentInventoryType()
        itemWrapper = getInventoryItemByType(curentInventoryType, value._slotNo)
      else
        do
          do
            local warehouseWrapper = warehouse_get(waypointKey_ByWareHouse)
            itemWrapper = warehouseWrapper:getItem(value._slotNo)
            do
              do
                if itemWrapper ~= nil then
                  local itemStaticWrapper = itemWrapper:getStaticStatus()
                  count = Int64toInt32((itemWrapper:get()):getCount_s64())
                end
                value._currentCnt = count
                -- DECOMPILER ERROR at PC132: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC132: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC132: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC132: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC132: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
    end
    if (CppEnums.ItemWhereType).eInventory == materialItemWhereType or (CppEnums.ItemWhereType).eCashInventory == materialItemWhereType then
      if #noneStackItemList ~= nil and #noneStackItemList > 0 and noneStackItemCheck == true then
        StopManufactureAction()
        luaTimer_AddEvent(Manufacture_ContinueGrindJewel, 500, false, 0)
      else
        if noneStackItemCheck then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_COMPLETE_REPEAT"))
        end
        Manufacture_Reset_ContinueGrindJewel()
      end
      Manufacture_Progress_Update(materialItemWhereType)
    else
      if hasNoneStackItem == true then
        StopManufactureAction()
        luaTimer_AddEvent(Manufacture_ContinueGrindJewel, 500, false, 0)
      else
        if noneStackItemCheck then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_COMPLETE_REPEAT"))
        end
        Manufacture_Reset_ContinueGrindJewel()
      end
      Manufacture_Progress_Update(materialItemWhereType)
    end
  else
    local message = nil
    if failReason ~= 0 or failReason == 1 then
      message = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_FAILREASON1")
      Manufacture_Response()
    else
      if failReason == 2 then
        message = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_FAILREASON2")
        Manufacture_ClearValues()
        Manufacture_Response()
      else
        if failReason == 3 then
          message = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_FAILREASON3")
        else
          if failReason == 4 then
            message = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_FAILREASON4")
          else
            if failReason == 5 then
              message = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_FAILREASON5")
            else
            end
          end
        end
      end
    end
    if failReason ~= 6 or failReason == 7 then
      message = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_FAILREASON7")
    else
      if failReason == 8 then
        message = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_INVENTORY_LEAST_ONE")
        Manufacture_ClearValues()
        Manufacture_Response()
      else
        if failReason == 9 then
          message = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_INVENTORY_WEIGHTOVER")
          Manufacture_ClearValues()
          Manufacture_Response()
        else
          if failReason == 10 then
            message = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_WP_IS_LACK")
            Manufacture_ClearValues()
            Manufacture_Response()
          end
        end
      end
    end
    if failReason ~= 6 and message ~= nil then
      Proc_ShowMessage_Ack(message)
    end
    -- DECOMPILER ERROR at PC326: Confused about usage of register: R4 in 'UnsetPending'

    Manufacture_Notify._failCount = Manufacture_Notify._failCount + 1
    if Manufacture_Notify._failCount >= 30 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_DONT_THIS_WAY"))
      -- DECOMPILER ERROR at PC339: Confused about usage of register: R4 in 'UnsetPending'

      Manufacture_Notify._failCount = 0
      Manufacture_Response()
    end
  end
end

Manufacture_Reset_ContinueGrindJewel = function()
  -- function num : 0_27 , upvalues : noneStackItemList, noneStackItemCheck, hasNoneStackItem, selectedWarehouseItemKey, selectedWarehouseItemSlotNo, targetWarehouseSlotNo, noneStackItem_ChkBtn
  noneStackItemList = (Array.new)()
  noneStackItemCheck = false
  hasNoneStackItem = false
  selectedWarehouseItemKey = -1
  selectedWarehouseItemSlotNo = -1
  targetWarehouseSlotNo = -1
  noneStackItem_ChkBtn:SetCheck(false)
  noneStackItem_ChkBtn:SetShow(false)
end

Manufacture_ToggleWindow = function(installationType, isClear)
  -- function num : 0_28
  if Panel_Manufacture:GetShow() then
    Manufacture_Close()
  else
    InventoryWindow_Show()
    local curentInventoryType = Inventory_GetCurrentInventoryType()
    Manufacture_Show(installationType, curentInventoryType, isClear)
  end
end

Manufacture_Mouse_LUp = function()
  -- function num : 0_29 , upvalues : _actionIndex, _listAction, materialItemWhereType, waypointKey_ByWareHouse, Manufacture_Notify, _usingItemSlotCount, _materialSlotNoList, _materialSlotNoListItemIn, _whiteCircle, CURRENT_ACTIONNAME, _usingInstallationType
  if _actionIndex == -1 then
    return 
  end
  if ((_listAction[3])._radioBtn):IsCheck() then
    local terraintype = selfPlayerNaviMaterial()
    local onBoat = selfplayerIsCurrentlyOnShip()
    if (terraintype == 2 or terraintype == 4 or terraintype == 6 or terraintype == 8 or ((getSelfPlayer()):getCurrentRegionInfo()):isOcean()) and not onBoat then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_DONT_WARTER_ACK"))
      return 
    end
  end
  do
    local houseWrapper = housing_getHouseholdActor_CurrentPosition()
    if houseWrapper == nil and _actionIndex == 12 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_INNTER_GUILDHOUSE_USE"))
      return 
    end
    local inventory = ((getSelfPlayer()):get()):getInventory()
    local cashInventory = ((getSelfPlayer()):get()):getInventoryByType((CppEnums.ItemWhereType).eCashInventory)
    local freeCount = inventory:getFreeCount()
    local size = 0
    if (CppEnums.ItemWhereType).eInventory == materialItemWhereType then
      size = inventory:size()
    else
      if (CppEnums.ItemWhereType).eCashInventory == materialItemWhereType then
        size = cashInventory:size()
      else
        local warehouseWrapper = warehouse_get(waypointKey_ByWareHouse)
        size = warehouseWrapper:getSize()
      end
    end
    do
      if freeCount < 2 then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_INVENTORY_LEAST_ONE"))
        return 
      end
      local selfPlayerWrapper = getSelfPlayer()
      local selfPlayer = selfPlayerWrapper:get()
      local s64_allWeight = selfPlayer:getCurrentWeight_s64()
      local s64_maxWeight = selfPlayer:getPossessableWeight_s64()
      local allWeight = Int64toInt32(s64_allWeight) / 10000
      local maxWeight = Int64toInt32(s64_maxWeight) / 10000
      local playerWeightPercent = allWeight / maxWeight * 100
      local s64_moneyWeight = (selfPlayer:getInventory()):getMoneyWeight_s64()
      local s64_equipmentWeight = (selfPlayer:getEquipment()):getWeight_s64()
      local s64_allWeight = selfPlayer:getCurrentWeight_s64()
      local s64_maxWeight = selfPlayer:getPossessableWeight_s64()
      local moneyWeight = Int64toInt32(s64_moneyWeight) / 10000
      local equipmentWeight = Int64toInt32(s64_equipmentWeight) / 10000
      local allWeight = Int64toInt32(s64_allWeight) / 10000
      local maxWeight = Int64toInt32(s64_maxWeight) / 10000
      local invenWeight = allWeight - equipmentWeight - moneyWeight
      local totalWeight = allWeight / maxWeight * 100
      if totalWeight >= 100 then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_INVENTORY_WEIGHTOVER"))
        return 
      end
      do
        local sum_MaterialSlot = {}
        Manufacture_Notify:clear()
        for index = 0, _usingItemSlotCount - 1 do
          _PA_LOG("�\128창욱", "체크 : " .. index .. "/" .. tostring(_materialSlotNoList[index] <= size) .. "/" .. _materialSlotNoList[index] .. ":" .. size)
          if _materialSlotNoListItemIn[index] == true and _materialSlotNoList[index] <= size then
            sum_MaterialSlot[#sum_MaterialSlot + 1] = _materialSlotNoList[index]
            local itemWrapper = nil
            if (CppEnums.ItemWhereType).eInventory == materialItemWhereType or (CppEnums.ItemWhereType).eCashInventory == materialItemWhereType then
              local curentInventoryType = Inventory_GetCurrentInventoryType()
              itemWrapper = getInventoryItemByType(curentInventoryType, _materialSlotNoList[index])
            else
              local warehouseWrapper = warehouse_get(waypointKey_ByWareHouse)
              itemWrapper = warehouseWrapper:getItem(_materialSlotNoList[index])
            end
            local itemStaticWrapper = itemWrapper:getStaticStatus()
            local idx = #Manufacture_Notify._data_Resource + 1
            -- DECOMPILER ERROR at PC251: Confused about usage of register: R30 in 'UnsetPending'

            ;
            (Manufacture_Notify._data_Resource)[idx] = {}
            -- DECOMPILER ERROR at PC257: Confused about usage of register: R30 in 'UnsetPending'

            ;
            ((Manufacture_Notify._data_Resource)[idx])._slotNo = _materialSlotNoList[index]
            -- DECOMPILER ERROR at PC264: Confused about usage of register: R30 in 'UnsetPending'

            ;
            ((Manufacture_Notify._data_Resource)[idx])._key = (itemStaticWrapper:get())._key
            -- DECOMPILER ERROR at PC270: Confused about usage of register: R30 in 'UnsetPending'

            ;
            ((Manufacture_Notify._data_Resource)[idx])._name = itemStaticWrapper:getName()
            -- DECOMPILER ERROR at PC278: Confused about usage of register: R30 in 'UnsetPending'

            ;
            ((Manufacture_Notify._data_Resource)[idx])._iconPath = "Icon/" .. itemStaticWrapper:getIconPath()
            -- DECOMPILER ERROR at PC288: Confused about usage of register: R30 in 'UnsetPending'

            ;
            ((Manufacture_Notify._data_Resource)[idx])._originalCnt = Int64toInt32((itemWrapper:get()):getCount_s64())
            -- DECOMPILER ERROR at PC296: Confused about usage of register: R30 in 'UnsetPending'

            ;
            ((Manufacture_Notify._data_Resource)[idx])._currentCnt = ((Manufacture_Notify._data_Resource)[idx])._originalCnt
          end
        end
        if #sum_MaterialSlot == 0 then
          if _actionIndex == 0 or _actionIndex == 5 then
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_SLOT_LEAST_ONE"))
          else
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_SLOT_EMPTY"))
          end
          return 
        end
        Panel_Window_Warehouse:SetShow(false)
        _whiteCircle:AddEffect("UI_ItemInstall_Spin", true, 0, 0)
        if _actionIndex == 7 then
          for key,value in pairs(sum_MaterialSlot) do
            local rv = repair_RepairItemBySelf(value)
            if rv == 0 then
              break
            end
          end
        else
          if (CppEnums.ItemWhereType).eWarehouse == materialItemWhereType then
            FGlobal_HideDialog()
          end
          CURRENT_ACTIONNAME = (_listAction[_actionIndex])._actionName
          local rv = Manufacture_Do(_usingInstallationType, CURRENT_ACTIONNAME, materialItemWhereType, _materialSlotNoList[0], _materialSlotNoList[1], _materialSlotNoList[2], _materialSlotNoList[3], _materialSlotNoList[4])
        end
        audioPostEvent_SystemUi(0, 0)
        -- DECOMPILER ERROR at PC383: Confused about usage of register: R23 in 'UnsetPending'

        Manufacture_Notify._failCount = 0
        -- DECOMPILER ERROR at PC385: Confused about usage of register: R23 in 'UnsetPending'

        Manufacture_Notify._successCount = 0
        Manufacture_Close()
        Interaction_Close()
        audioPostEvent_SystemUi(13, 11)
        -- DECOMPILER ERROR: 13 unprocessed JMP targets
      end
    end
  end
end

Manufacture_Mouse_On = function()
  -- function num : 0_30
  audioPostEvent_SystemUi(1, 13)
end

Manufacture_UpdateRepairTime = function()
  -- function num : 0_31 , upvalues : _materialSlotNoList, _manufactureText
  local repairTime = repair_getRepairTime(_materialSlotNoList[0])
  if toUint64(0, 0) < repairTime then
    local tempString = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_REPAIR_TOTAL_TIME") .. " : " .. convertStringFromMillisecondtime(repairTime)
    _manufactureText:SetText(tempString)
  end
end

Material_Mouse_RUp = function(index)
  -- function num : 0_32 , upvalues : noneStackItemList, noneStackItemCheck, hasNoneStackItem, selectedWarehouseItemKey, selectedWarehouseItemSlotNo, targetWarehouseSlotNo, noneStackItem_ChkBtn, _usingItemSlotCount, _materialSlotNoList, _defaultSlotNo, _materialSlotNoListItemIn, materialItemWhereType
  if Panel_Win_System:GetShow() then
    return 
  end
  audioPostEvent_SystemUi(13, 12)
  StopManufactureAction()
  noneStackItemList = (Array.new)()
  noneStackItemCheck = false
  hasNoneStackItem = false
  selectedWarehouseItemKey = -1
  selectedWarehouseItemSlotNo = -1
  targetWarehouseSlotNo = -1
  noneStackItem_ChkBtn:SetCheck(false)
  noneStackItem_ChkBtn:SetShow(false)
  -- DECOMPILER ERROR at PC39: Confused about usage of register: R1 in 'UnsetPending'

  if index < _usingItemSlotCount then
    _materialSlotNoList[index] = _defaultSlotNo
    -- DECOMPILER ERROR at PC41: Confused about usage of register: R1 in 'UnsetPending'

    _materialSlotNoListItemIn[index] = false
    for ii = index, _usingItemSlotCount - 1 - 1 do
      -- DECOMPILER ERROR at PC63: Confused about usage of register: R5 in 'UnsetPending'

      if _defaultSlotNo == _materialSlotNoList[ii] and _defaultSlotNo ~= _materialSlotNoList[ii + 1] then
        _materialSlotNoList[ii] = _materialSlotNoList[ii + 1]
        -- DECOMPILER ERROR at PC67: Confused about usage of register: R5 in 'UnsetPending'

        _materialSlotNoList[ii + 1] = _defaultSlotNo
      else
        break
      end
    end
  end
  do
    Panel_Tooltip_Item_hideTooltip()
    if materialItemWhereType == (CppEnums.ItemWhereType).eInventory or (CppEnums.ItemWhereType).eCashInventory == materialItemWhereType then
      Manufacture_UpdateSlot()
    else
      Manufacture_UpdateSlotWarehouse()
    end
  end
end

Material_Mouse_On = function(index)
  -- function num : 0_33 , upvalues : materialItemWhereType, _materialSlotNoList, _slotList
  local itemWrapper = nil
  if materialItemWhereType == (CppEnums.ItemWhereType).eInventory or (CppEnums.ItemWhereType).eCashInventory == materialItemWhereType then
    local curentInventoryType = Inventory_GetCurrentInventoryType()
    itemWrapper = getInventoryItemByType(curentInventoryType, _materialSlotNoList[index])
  else
    do
      itemWrapper = (Warehouse_GetWarehouseWarpper()):getItem(_materialSlotNoList[index])
      local slot = (_slotList[index]).icon
      Panel_Tooltip_Item_Show(itemWrapper, slot, false, true, nil, nil, nil)
    end
  end
end

Material_Mouse_Out = function(index)
  -- function num : 0_34
  Panel_Tooltip_Item_hideTooltip()
end

Manufacture_Button_LUp_Shake = function(isClear)
  -- function num : 0_35 , upvalues : _actionIndex, _usingItemSlotCount, _usingInstallationType, _currentActionIcon, _manufactureText, _manufactureName, _textDesc, _textTemp, _uiButtonManufacture, _startKnowledgeIndex, SHAKE_MENTALTHEMEKEY, _defaultMSG1, _defaultMSG2, materialItemWhereType
  if Panel_Win_System:GetShow() then
    return 
  end
  if not IsSelfPlayerWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_MANUFACTURE"))
    return 
  end
  audioPostEvent_SystemUi(13, 10)
  if isClear ~= nil and isClear == true then
    Manufacture_ClearMaterial()
  end
  StopManufactureAction()
  _actionIndex = 0
  _usingItemSlotCount = 2
  Manufacture_UpdateSlotPos()
  Manufacture_ShowPointEffect()
  _usingInstallationType = (CppEnums.InstallationType).TypeCount
  _currentActionIcon:SetShow(true)
  manufactureClickSetTextureUV(_currentActionIcon, 172, 58, 228, 114, 0)
  _manufactureText:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_SHAKE"))
  _manufactureText:SetShow(true)
  _manufactureName:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_SHAKE"))
  _manufactureName:SetShow(true)
  _textDesc:SetText(PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC2_SHAKE"))
  _textTemp:SetText(PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_SHAKE"))
  _textTemp:SetShow(true)
  FontSize_SetPos()
  _uiButtonManufacture:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"))
  Manufacture_UpdateCheckRadioButton()
  _startKnowledgeIndex = 0
  ReconstructionAlchemyKnowledge(SHAKE_MENTALTHEMEKEY)
  ManufactureKnowledge_UpdateList()
  _defaultMSG1:SetShow(false)
  _defaultMSG2:SetShow(false)
  Material_Update(_usingItemSlotCount)
  if (CppEnums.ItemWhereType).eInventory == materialItemWhereType or (CppEnums.ItemWhereType).eCashInventory == materialItemWhereType then
    Inventory_SetFunctor(ManufactureAction_InvenFiler, Manufacture_PushItemFromInventory, Manufacture_Close, nil)
    Inventory_updateSlotData()
  else
    Warehouse_SetFunctor(ManufactureAction_WarehouseFilter, Manufacture_PushItemFromWarehouse)
    Warehouse_updateSlotData()
  end
end

Manufacture_Button_LUp_Grind = function(isClear)
  -- function num : 0_36 , upvalues : _actionIndex, _usingItemSlotCount, _usingInstallationType, _currentActionIcon, _manufactureText, _manufactureName, _textDesc, _textTemp, _uiButtonManufacture, _startKnowledgeIndex, GRIND_MENTALTHEMEKEY, _defaultMSG1, _defaultMSG2, materialItemWhereType
  if Panel_Win_System:GetShow() then
    return 
  end
  if not IsSelfPlayerWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_MANUFACTURE"))
    return 
  end
  audioPostEvent_SystemUi(13, 2)
  if isClear ~= nil and isClear == true then
    Manufacture_ClearMaterial()
  end
  StopManufactureAction()
  _actionIndex = 1
  _usingItemSlotCount = 2
  Manufacture_UpdateSlotPos()
  Manufacture_ShowPointEffect()
  _usingInstallationType = (CppEnums.InstallationType).TypeCount
  _currentActionIcon:SetShow(true)
  manufactureClickSetTextureUV(_currentActionIcon, 115, 1, 171, 57, 1)
  _manufactureText:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_GRIND"))
  _manufactureText:SetShow(true)
  _manufactureName:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_GRIND"))
  _manufactureName:SetShow(true)
  _textDesc:SetText(PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC2_GRIND"))
  _textTemp:SetText(PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_GRIND"))
  _textTemp:SetShow(true)
  FontSize_SetPos()
  _uiButtonManufacture:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"))
  Manufacture_UpdateCheckRadioButton()
  _startKnowledgeIndex = 0
  ReconstructionAlchemyKnowledge(GRIND_MENTALTHEMEKEY)
  ManufactureKnowledge_UpdateList()
  _defaultMSG1:SetShow(false)
  _defaultMSG2:SetShow(false)
  Material_Update(_usingItemSlotCount)
  if (CppEnums.ItemWhereType).eInventory == materialItemWhereType or (CppEnums.ItemWhereType).eCashInventory == materialItemWhereType then
    Inventory_SetFunctor(ManufactureAction_InvenFiler, Manufacture_PushItemFromInventory, Manufacture_Close, nil)
    Inventory_updateSlotData()
  else
    Warehouse_SetFunctor(ManufactureAction_WarehouseFilter, Manufacture_PushItemFromWarehouse)
    Warehouse_updateSlotData()
  end
end

Manufacture_Button_LUp_FireWood = function(isClear)
  -- function num : 0_37 , upvalues : _actionIndex, _usingItemSlotCount, _usingInstallationType, _currentActionIcon, _manufactureText, _manufactureName, _textDesc, _textTemp, _uiButtonManufacture, _startKnowledgeIndex, FIREWOOD_MENTALTHEMEKEY, _defaultMSG1, _defaultMSG2, materialItemWhereType
  if Panel_Win_System:GetShow() then
    return 
  end
  if not IsSelfPlayerWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_MANUFACTURE"))
    return 
  end
  audioPostEvent_SystemUi(13, 0)
  if isClear ~= nil and isClear == true then
    Manufacture_ClearMaterial()
  end
  StopManufactureAction()
  _actionIndex = 2
  _usingItemSlotCount = 1
  Manufacture_UpdateSlotPos()
  Manufacture_ShowPointEffect()
  _usingInstallationType = (CppEnums.InstallationType).TypeCount
  _currentActionIcon:SetShow(true)
  manufactureClickSetTextureUV(_currentActionIcon, 1, 58, 57, 114, 2)
  _manufactureText:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_WOODSPLITTING"))
  _manufactureText:SetShow(true)
  _manufactureName:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_WOODSPLITTING"))
  _manufactureName:SetShow(true)
  _textDesc:SetText(PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC2_FIREWOOD"))
  _textTemp:SetText(PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_FIREWOOD"))
  _textTemp:SetShow(true)
  FontSize_SetPos()
  _uiButtonManufacture:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"))
  Manufacture_UpdateCheckRadioButton()
  _startKnowledgeIndex = 0
  ReconstructionAlchemyKnowledge(FIREWOOD_MENTALTHEMEKEY)
  ManufactureKnowledge_UpdateList()
  _defaultMSG1:SetShow(false)
  _defaultMSG2:SetShow(false)
  Material_Update(_usingItemSlotCount)
  if (CppEnums.ItemWhereType).eInventory == materialItemWhereType or (CppEnums.ItemWhereType).eCashInventory == materialItemWhereType then
    Inventory_SetFunctor(ManufactureAction_InvenFiler, Manufacture_PushItemFromInventory, Manufacture_Close, nil)
    Inventory_updateSlotData()
  else
    Warehouse_SetFunctor(ManufactureAction_WarehouseFilter, Manufacture_PushItemFromWarehouse)
    Warehouse_updateSlotData()
  end
end

Manufacture_Button_LUp_Dry = function(isClear)
  -- function num : 0_38 , upvalues : _actionIndex, _usingItemSlotCount, _usingInstallationType, _currentActionIcon, _manufactureText, _manufactureName, _textDesc, _textTemp, _uiButtonManufacture, _startKnowledgeIndex, DRY_MENTALTHEMEKEY, _defaultMSG1, _defaultMSG2, materialItemWhereType
  if Panel_Win_System:GetShow() then
    return 
  end
  if not IsSelfPlayerWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_MANUFACTURE"))
    return 
  end
  audioPostEvent_SystemUi(13, 1)
  if isClear ~= nil and isClear == true then
    Manufacture_ClearMaterial()
  end
  StopManufactureAction()
  _actionIndex = 3
  _usingItemSlotCount = 1
  Manufacture_UpdateSlotPos()
  Manufacture_ShowPointEffect()
  _usingInstallationType = (CppEnums.InstallationType).TypeCount
  _currentActionIcon:SetShow(true)
  manufactureClickSetTextureUV(_currentActionIcon, 286, 1, 342, 58, 3)
  _manufactureText:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_DRY"))
  _manufactureText:SetShow(true)
  _manufactureName:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_DRY"))
  _manufactureName:SetShow(true)
  _textDesc:SetText(PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC2_DRY"))
  _textTemp:SetText(PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_DRY"))
  _textTemp:SetShow(true)
  FontSize_SetPos()
  _uiButtonManufacture:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"))
  Manufacture_UpdateCheckRadioButton()
  _startKnowledgeIndex = 0
  ReconstructionAlchemyKnowledge(DRY_MENTALTHEMEKEY)
  ManufactureKnowledge_UpdateList()
  _defaultMSG1:SetShow(false)
  _defaultMSG2:SetShow(false)
  Material_Update(_usingItemSlotCount)
  if (CppEnums.ItemWhereType).eInventory == materialItemWhereType or (CppEnums.ItemWhereType).eCashInventory == materialItemWhereType then
    Inventory_SetFunctor(ManufactureAction_InvenFiler, Manufacture_PushItemFromInventory, Manufacture_Close, nil)
    Inventory_updateSlotData()
  else
    Warehouse_SetFunctor(ManufactureAction_WarehouseFilter, Manufacture_PushItemFromWarehouse)
    Warehouse_updateSlotData()
  end
end

Manufacture_Button_LUp_Thinning = function(isClear)
  -- function num : 0_39 , upvalues : _actionIndex, _usingItemSlotCount, _usingInstallationType, _currentActionIcon, _manufactureText, _manufactureName, _textDesc, _textTemp, _uiButtonManufacture, _startKnowledgeIndex, THINNING_MENTALTHEMEKEY, _defaultMSG1, _defaultMSG2, materialItemWhereType
  if Panel_Win_System:GetShow() then
    return 
  end
  if not IsSelfPlayerWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_MANUFACTURE"))
    return 
  end
  audioPostEvent_SystemUi(13, 3)
  if isClear ~= nil and isClear == true then
    Manufacture_ClearMaterial()
  end
  StopManufactureAction()
  _actionIndex = 4
  _usingItemSlotCount = 1
  Manufacture_UpdateSlotPos()
  Manufacture_ShowPointEffect()
  _usingInstallationType = (CppEnums.InstallationType).TypeCount
  _currentActionIcon:SetShow(true)
  manufactureClickSetTextureUV(_currentActionIcon, 58, 115, 114, 171, 4)
  _manufactureText:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_THINNING"))
  _manufactureText:SetShow(true)
  _manufactureName:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_THINNING"))
  _manufactureName:SetShow(true)
  _textDesc:SetText(PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC2_THINNING"))
  _textTemp:SetText(PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_THINNING"))
  _textTemp:SetShow(true)
  FontSize_SetPos()
  _uiButtonManufacture:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"))
  Manufacture_UpdateCheckRadioButton()
  _startKnowledgeIndex = 0
  ReconstructionAlchemyKnowledge(THINNING_MENTALTHEMEKEY)
  ManufactureKnowledge_UpdateList()
  _defaultMSG1:SetShow(false)
  _defaultMSG2:SetShow(false)
  Material_Update(_usingItemSlotCount)
  if (CppEnums.ItemWhereType).eInventory == materialItemWhereType or (CppEnums.ItemWhereType).eCashInventory == materialItemWhereType then
    Inventory_SetFunctor(ManufactureAction_InvenFiler, Manufacture_PushItemFromInventory, Manufacture_Close, nil)
    Inventory_updateSlotData()
  else
    Warehouse_SetFunctor(ManufactureAction_WarehouseFilter, Manufacture_PushItemFromWarehouse)
    Warehouse_updateSlotData()
  end
end

Manufacture_Button_LUp_Heat = function(isClear)
  -- function num : 0_40 , upvalues : _actionIndex, _usingItemSlotCount, _usingInstallationType, _currentActionIcon, _manufactureText, _manufactureName, _textDesc, _textTemp, _uiButtonManufacture, _startKnowledgeIndex, HEAT_MENTALTHEMEKEY, _defaultMSG1, _defaultMSG2, materialItemWhereType
  if Panel_Win_System:GetShow() then
    return 
  end
  if not IsSelfPlayerWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_MANUFACTURE"))
    return 
  end
  audioPostEvent_SystemUi(13, 4)
  if isClear ~= nil and isClear == true then
    Manufacture_ClearMaterial()
  end
  StopManufactureAction()
  _actionIndex = 5
  _usingItemSlotCount = 2
  Manufacture_UpdateSlotPos()
  Manufacture_ShowPointEffect()
  _usingInstallationType = (CppEnums.InstallationType).TypeCount
  _currentActionIcon:SetShow(true)
  manufactureClickSetTextureUV(_currentActionIcon, 343, 58, 399, 114, 5)
  _manufactureText:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_HEATING"))
  _manufactureText:SetShow(true)
  _manufactureName:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_HEATING"))
  _manufactureName:SetShow(true)
  _textDesc:SetText(PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC2_HEAT"))
  _textTemp:SetText(PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_HEAT"))
  _textTemp:SetShow(true)
  FontSize_SetPos()
  _uiButtonManufacture:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"))
  Manufacture_UpdateCheckRadioButton()
  _startKnowledgeIndex = 0
  ReconstructionAlchemyKnowledge(HEAT_MENTALTHEMEKEY)
  ManufactureKnowledge_UpdateList()
  _defaultMSG1:SetShow(false)
  _defaultMSG2:SetShow(false)
  Material_Update(_usingItemSlotCount)
  if (CppEnums.ItemWhereType).eInventory == materialItemWhereType or (CppEnums.ItemWhereType).eCashInventory == materialItemWhereType then
    Inventory_SetFunctor(ManufactureAction_InvenFiler, Manufacture_PushItemFromInventory, Manufacture_Close, nil)
    Inventory_updateSlotData()
  else
    Warehouse_SetFunctor(ManufactureAction_WarehouseFilter, Manufacture_PushItemFromWarehouse)
    Warehouse_updateSlotData()
  end
end

Manufacture_Button_LUp_Rainwater = function(isClear)
  -- function num : 0_41 , upvalues : _actionIndex, _usingItemSlotCount, _usingInstallationType, _currentActionIcon, _manufactureText, _manufactureName, _textDesc, _textTemp, _uiButtonManufacture, _startKnowledgeIndex, RAINWATER_MENTALTHEMEKEY, _defaultMSG1, _defaultMSG2, materialItemWhereType
  if Panel_Win_System:GetShow() then
    return 
  end
  if not IsSelfPlayerWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_MANUFACTURE"))
    return 
  end
  audioPostEvent_SystemUi(0, 0)
  if isClear ~= nil and isClear == true then
    Manufacture_ClearMaterial()
  end
  StopManufactureAction()
  _actionIndex = 6
  _usingItemSlotCount = 1
  Manufacture_UpdateSlotPos()
  Manufacture_ShowPointEffect()
  _usingInstallationType = (CppEnums.InstallationType).TypeCount
  _currentActionIcon:SetShow(true)
  manufactureClickSetTextureUV(_currentActionIcon, 400, 115, 456, 171, 6)
  _manufactureText:SetText(PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_RAINWATER"))
  _manufactureText:SetShow(true)
  _manufactureName:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_RAINWATER"))
  _manufactureName:SetShow(true)
  _textDesc:SetText(PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC2_RAINWATER"))
  _textTemp:SetText(PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_RAINWATER"))
  _textTemp:SetShow(true)
  FontSize_SetPos()
  _uiButtonManufacture:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"))
  Manufacture_UpdateCheckRadioButton()
  _startKnowledgeIndex = 0
  ReconstructionAlchemyKnowledge(RAINWATER_MENTALTHEMEKEY)
  ManufactureKnowledge_UpdateList()
  _defaultMSG1:SetShow(false)
  _defaultMSG2:SetShow(false)
  if (CppEnums.ItemWhereType).eInventory == materialItemWhereType or (CppEnums.ItemWhereType).eCashInventory == materialItemWhereType then
    Inventory_SetFunctor(ManufactureAction_InvenFiler, Manufacture_PushItemFromInventory, Manufacture_Close, nil)
    Inventory_updateSlotData()
  else
    Warehouse_SetFunctor(ManufactureAction_WarehouseFilter, Manufacture_PushItemFromWarehouse)
    Warehouse_updateSlotData()
  end
end

Manufacture_Button_LUp_RepairItem = function(isClear)
  -- function num : 0_42 , upvalues : _actionIndex, _usingItemSlotCount, _usingInstallationType, _currentActionIcon, _manufactureText, _manufactureName, _textDesc, _textTemp, _uiButtonManufacture, _defaultMSG1, _defaultMSG2, materialItemWhereType
  if Panel_Win_System:GetShow() then
    return 
  end
  if not IsSelfPlayerWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_MANUFACTURE"))
    return 
  end
  audioPostEvent_SystemUi(13, 9)
  if isClear ~= nil and isClear == true then
    Manufacture_ClearMaterial()
  end
  StopManufactureAction()
  _actionIndex = 7
  _usingItemSlotCount = 1
  Manufacture_UpdateSlotPos()
  Manufacture_ShowPointEffect()
  _usingInstallationType = (CppEnums.InstallationType).eType_Anvil
  _currentActionIcon:SetShow(true)
  manufactureClickSetTextureUV(_currentActionIcon, 229, 115, 285, 171, 7)
  _manufactureText:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_REPAIR"))
  _manufactureText:SetShow(true)
  _manufactureName:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_REPAIR"))
  _manufactureName:SetShow(true)
  _textDesc:SetText(PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC2_REPAIR"))
  _textTemp:SetText(PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_REPAIR"))
  _textTemp:SetShow(true)
  FontSize_SetPos()
  _uiButtonManufacture:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_REPAIR"))
  Manufacture_UpdateCheckRadioButton()
  ManufactureKnowledge_ClearList()
  _defaultMSG1:SetShow(false)
  _defaultMSG2:SetShow(false)
  if (CppEnums.ItemWhereType).eInventory == materialItemWhereType or (CppEnums.ItemWhereType).eCashInventory == materialItemWhereType then
    Inventory_SetFunctor(ManufactureAction_InvenFiler, Manufacture_PushItemFromInventory, Manufacture_Close, nil)
    Inventory_updateSlotData()
  else
    Warehouse_SetFunctor(ManufactureAction_WarehouseFilter, Manufacture_PushItemFromWarehouse)
    Warehouse_updateSlotData()
  end
end

Manufacture_Button_LUp_Alchemy = function(isClear)
  -- function num : 0_43 , upvalues : _actionIndex, _usingItemSlotCount, _usingInstallationType, _currentActionIcon, _manufactureText, _manufactureName, _textDesc, _textTemp, _uiButtonManufacture, _startKnowledgeIndex, ALCHEMY_MENTALTHEMEKEY, _defaultMSG1, _defaultMSG2, materialItemWhereType
  if Panel_Win_System:GetShow() then
    return 
  end
  if not IsSelfPlayerWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_MANUFACTURE"))
    return 
  end
  audioPostEvent_SystemUi(13, 13)
  if isClear ~= nil and isClear == true then
    Manufacture_ClearMaterial()
  end
  StopManufactureAction()
  _actionIndex = 8
  _usingItemSlotCount = 5
  Manufacture_UpdateSlotPos()
  Manufacture_ShowPointEffect()
  _usingInstallationType = (CppEnums.InstallationType).TypeCount
  _currentActionIcon:SetShow(true)
  manufactureClickSetTextureUV(_currentActionIcon, 400, 115, 456, 171, 8)
  _manufactureText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_MANUFACTURE_ALCHEMY"))
  _manufactureText:SetShow(true)
  _manufactureName:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_MANUFACTURE_ALCHEMY"))
  _manufactureName:SetShow(true)
  _textDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAME_MANUFACTURE_DESC2_ALCHEMY"))
  _textTemp:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAME_MANUFACTURE_DESC_ALCHEMY"))
  _textTemp:SetShow(true)
  FontSize_SetPos()
  _uiButtonManufacture:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"))
  Manufacture_UpdateCheckRadioButton()
  _startKnowledgeIndex = 0
  ReconstructionAlchemyKnowledge(ALCHEMY_MENTALTHEMEKEY)
  ManufactureKnowledge_UpdateList()
  _defaultMSG1:SetShow(false)
  _defaultMSG2:SetShow(false)
  if (CppEnums.ItemWhereType).eInventory == materialItemWhereType or (CppEnums.ItemWhereType).eCashInventory == materialItemWhereType then
    Inventory_SetFunctor(ManufactureAction_InvenFiler, Manufacture_PushItemFromInventory, Manufacture_Close, nil)
    Inventory_updateSlotData()
  else
    Warehouse_SetFunctor(ManufactureAction_WarehouseFilter, Manufacture_PushItemFromWarehouse)
    Warehouse_updateSlotData()
  end
end

Manufacture_Button_LUp_Cook = function(isClear)
  -- function num : 0_44 , upvalues : _actionIndex, _usingItemSlotCount, _usingInstallationType, _currentActionIcon, _manufactureText, _manufactureName, _textDesc, _textTemp, _uiButtonManufacture, _startKnowledgeIndex, COOK_MENTALTHEMEKEY, _defaultMSG1, _defaultMSG2, materialItemWhereType
  if Panel_Win_System:GetShow() then
    return 
  end
  if not IsSelfPlayerWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_MANUFACTURE"))
    return 
  end
  audioPostEvent_SystemUi(13, 14)
  if isClear ~= nil and isClear == true then
    Manufacture_ClearMaterial()
  end
  StopManufactureAction()
  _actionIndex = 9
  if ToClient_IsContentsGroupOpen("327") then
    _usingItemSlotCount = 4
  else
    if ToClient_IsContentsGroupOpen("228") then
      _usingItemSlotCount = 3
    else
      _usingItemSlotCount = 2
    end
  end
  Manufacture_UpdateSlotPos()
  Manufacture_ShowPointEffect()
  _usingInstallationType = (CppEnums.InstallationType).TypeCount
  _currentActionIcon:SetShow(true)
  manufactureClickSetTextureUV(_currentActionIcon, 115, 172, 171, 228, 9)
  _manufactureText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_MANUFACTURE_COOK"))
  _manufactureText:SetShow(true)
  _manufactureName:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_MANUFACTURE_COOK"))
  _manufactureName:SetShow(true)
  _textDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAME_MANUFACTURE_DESC2_COOK"))
  _textTemp:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_GAME_MANUFACTURE_DESC_COOK"))
  _textTemp:SetShow(true)
  FontSize_SetPos()
  _uiButtonManufacture:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"))
  Manufacture_UpdateCheckRadioButton()
  _startKnowledgeIndex = 0
  ReconstructionAlchemyKnowledge(COOK_MENTALTHEMEKEY)
  ManufactureKnowledge_UpdateList()
  _defaultMSG1:SetShow(false)
  _defaultMSG2:SetShow(false)
  if (CppEnums.ItemWhereType).eInventory == materialItemWhereType or (CppEnums.ItemWhereType).eCashInventory == materialItemWhereType then
    Inventory_SetFunctor(ManufactureAction_InvenFiler, Manufacture_PushItemFromInventory, Manufacture_Close, nil)
    Inventory_updateSlotData()
  else
    Warehouse_SetFunctor(ManufactureAction_WarehouseFilter, Manufacture_PushItemFromWarehouse)
    Warehouse_updateSlotData()
  end
end

Manufacture_Button_LUp_RGCook = function(isClear)
  -- function num : 0_45 , upvalues : _actionIndex, _usingItemSlotCount, _usingInstallationType, _currentActionIcon, _manufactureText, _manufactureName, _textDesc, _textTemp, _uiButtonManufacture, _startKnowledgeIndex, ROYALCOOK_MENTALTHEMEKEY, _defaultMSG1, _defaultMSG2, materialItemWhereType
  if Panel_Win_System:GetShow() then
    return 
  end
  if not IsSelfPlayerWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_MANUFACTURE"))
    return 
  end
  audioPostEvent_SystemUi(13, 14)
  if isClear ~= nil and isClear == true then
    Manufacture_ClearMaterial()
  end
  StopManufactureAction()
  _actionIndex = 10
  _usingItemSlotCount = 3
  Manufacture_UpdateSlotPos()
  Manufacture_ShowPointEffect()
  _usingInstallationType = (CppEnums.InstallationType).TypeCount
  _currentActionIcon:SetShow(true)
  manufactureClickSetTextureUV(_currentActionIcon, 345, 456, 401, 512, 10)
  _manufactureText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_MANUFACTURE_ROYALGIFT_COOK"))
  _manufactureText:SetShow(true)
  _manufactureName:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_MANUFACTURE_ROYALGIFT_COOK"))
  _manufactureName:SetShow(true)
  _textDesc:SetText(PAGetString(Defines.StringSheet_RESOURCE, "GAME_MANUFACTURE_DESC_ROYALGIFT_COOK"))
  _textTemp:SetText(PAGetString(Defines.StringSheet_RESOURCE, "LUA_GAME_MANUFACTURE_DESC2_ROYALGIFT_COOK"))
  _textTemp:SetShow(true)
  FontSize_SetPos()
  _uiButtonManufacture:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"))
  Manufacture_UpdateCheckRadioButton()
  _startKnowledgeIndex = 0
  ReconstructionAlchemyKnowledge(ROYALCOOK_MENTALTHEMEKEY)
  ManufactureKnowledge_UpdateList()
  _defaultMSG1:SetShow(false)
  _defaultMSG2:SetShow(false)
  if (CppEnums.ItemWhereType).eInventory == materialItemWhereType or (CppEnums.ItemWhereType).eCashInventory == materialItemWhereType then
    Inventory_SetFunctor(ManufactureAction_InvenFiler, Manufacture_PushItemFromInventory, Manufacture_Close, nil)
    Inventory_updateSlotData()
  else
    Warehouse_SetFunctor(ManufactureAction_WarehouseFilter, Manufacture_PushItemFromWarehouse)
    Warehouse_updateSlotData()
  end
end

Manufacture_Button_LUp_RGAlchemy = function(isClear)
  -- function num : 0_46 , upvalues : _actionIndex, _usingItemSlotCount, _usingInstallationType, _currentActionIcon, _manufactureText, _manufactureName, _textDesc, _textTemp, _uiButtonManufacture, _startKnowledgeIndex, ROYALALCHEMY_MENTALTHEMEKEY, _defaultMSG1, _defaultMSG2, materialItemWhereType
  if Panel_Win_System:GetShow() then
    return 
  end
  if not IsSelfPlayerWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_MANUFACTURE"))
    return 
  end
  audioPostEvent_SystemUi(13, 13)
  if isClear ~= nil and isClear == true then
    Manufacture_ClearMaterial()
  end
  StopManufactureAction()
  _actionIndex = 11
  _usingItemSlotCount = 3
  Manufacture_UpdateSlotPos()
  Manufacture_ShowPointEffect()
  _usingInstallationType = (CppEnums.InstallationType).TypeCount
  _currentActionIcon:SetShow(true)
  manufactureClickSetTextureUV(_currentActionIcon, 400, 172, 456, 228, 11)
  _manufactureText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_MANUFACTURE_ROYALGIFT_ALCHEMY"))
  _manufactureText:SetShow(true)
  _manufactureName:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_MANUFACTURE_ROYALGIFT_ALCHEMY"))
  _manufactureName:SetShow(true)
  _textDesc:SetText(PAGetString(Defines.StringSheet_RESOURCE, "GAME_MANUFACTURE_DESC_ROYALGIFT_ALCHEMY"))
  _textTemp:SetText(PAGetString(Defines.StringSheet_RESOURCE, "LUA_GAME_MANUFACTURE_DESC2_ROYALGIFT_ALCHEMY"))
  _textTemp:SetShow(true)
  FontSize_SetPos()
  _uiButtonManufacture:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"))
  Manufacture_UpdateCheckRadioButton()
  _startKnowledgeIndex = 0
  ReconstructionAlchemyKnowledge(ROYALALCHEMY_MENTALTHEMEKEY)
  ManufactureKnowledge_UpdateList()
  _defaultMSG1:SetShow(false)
  _defaultMSG2:SetShow(false)
  if (CppEnums.ItemWhereType).eInventory == materialItemWhereType or (CppEnums.ItemWhereType).eCashInventory == materialItemWhereType then
    Inventory_SetFunctor(ManufactureAction_InvenFiler, Manufacture_PushItemFromInventory, Manufacture_Close, nil)
    Inventory_updateSlotData()
  else
    Warehouse_SetFunctor(ManufactureAction_WarehouseFilter, Manufacture_PushItemFromWarehouse)
    Warehouse_updateSlotData()
  end
end

Manufacture_Button_LUp_GuildManufacture = function(isClear)
  -- function num : 0_47 , upvalues : _actionIndex, _usingItemSlotCount, _usingInstallationType, _currentActionIcon, _manufactureText, _manufactureName, _textDesc, _textTemp, _uiButtonManufacture, _startKnowledgeIndex, GUILDMANUFACTURE_MENTALTHEMEKEY, _defaultMSG1, _defaultMSG2, materialItemWhereType
  if Panel_Win_System:GetShow() then
    return 
  end
  if not IsSelfPlayerWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_MANUFACTURE"))
    return 
  end
  local houseWrapper = housing_getHouseholdActor_CurrentPosition()
  if houseWrapper == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_INNTER_GUILDHOUSE_USE"))
    return 
  end
  audioPostEvent_SystemUi(13, 13)
  if isClear ~= nil and isClear == true then
    Manufacture_ClearMaterial()
  end
  StopManufactureAction()
  _actionIndex = 12
  _usingItemSlotCount = 5
  Manufacture_UpdateSlotPos()
  Manufacture_ShowPointEffect()
  _usingInstallationType = (CppEnums.InstallationType).TypeCount
  _currentActionIcon:SetShow(true)
  manufactureClickSetTextureUV(_currentActionIcon, 3, 116, 59, 172, 12)
  _manufactureText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_GUILDMANURACTURE_NAME"))
  _manufactureText:SetShow(true)
  _manufactureName:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_GUILDMANURACTURE_NAME"))
  _manufactureName:SetShow(true)
  _textDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_GUILDMANUFACTURE_DESC"))
  _textTemp:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_GUILDMANUFACTURE_SUBDESC"))
  _textTemp:SetShow(true)
  FontSize_SetPos()
  _uiButtonManufacture:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"))
  Manufacture_UpdateCheckRadioButton()
  _startKnowledgeIndex = 0
  ReconstructionAlchemyKnowledge(GUILDMANUFACTURE_MENTALTHEMEKEY)
  ManufactureKnowledge_UpdateList()
  _defaultMSG1:SetShow(false)
  _defaultMSG2:SetShow(false)
  if (CppEnums.ItemWhereType).eInventory == materialItemWhereType or (CppEnums.ItemWhereType).eCashInventory == materialItemWhereType then
    Inventory_SetFunctor(ManufactureAction_InvenFiler, Manufacture_PushItemFromInventory, Manufacture_Close, nil)
    Inventory_updateSlotData()
  else
    Warehouse_SetFunctor(ManufactureAction_WarehouseFilter, Manufacture_PushItemFromWarehouse)
    Warehouse_updateSlotData()
  end
end

Manufacture_Button_LUp_Craft = function(isClear)
  -- function num : 0_48 , upvalues : enableCraft, _actionIndex, _usingItemSlotCount, _usingInstallationType, _currentActionIcon, _manufactureText, _manufactureName, _textDesc, _textTemp, _uiButtonManufacture, _startKnowledgeIndex, CRAFT_MENTALTHEMEKEY, _defaultMSG1, _defaultMSG2, materialItemWhereType
  if Panel_Win_System:GetShow() then
    return 
  end
  if not IsSelfPlayerWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_MANUFACTURE"))
    return 
  end
  if not enableCraft then
    return 
  end
  audioPostEvent_SystemUi(13, 23)
  if isClear ~= nil and isClear == true then
    Manufacture_ClearMaterial()
  end
  StopManufactureAction()
  _actionIndex = 13
  _usingItemSlotCount = 5
  Manufacture_UpdateSlotPos()
  Manufacture_ShowPointEffect()
  _usingInstallationType = (CppEnums.InstallationType).TypeCount
  _currentActionIcon:SetShow(true)
  manufactureClickSetTextureUV(_currentActionIcon, 64, 117, 120, 173, 13)
  _manufactureText:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_CRAFT_NAME"))
  _manufactureText:SetShow(true)
  _manufactureName:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_CRAFT_NAME"))
  _manufactureName:SetShow(true)
  _textDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_CRAFT_DESC"))
  _textTemp:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_CRAFT_SUBDESC"))
  _textTemp:SetShow(true)
  FontSize_SetPos()
  _uiButtonManufacture:SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_BTN_MANUFACTURE"))
  Manufacture_UpdateCheckRadioButton()
  _startKnowledgeIndex = 0
  ReconstructionAlchemyKnowledge(CRAFT_MENTALTHEMEKEY)
  ManufactureKnowledge_UpdateList()
  _defaultMSG1:SetShow(false)
  _defaultMSG2:SetShow(false)
  if (CppEnums.ItemWhereType).eInventory == materialItemWhereType or (CppEnums.ItemWhereType).eCashInventory == materialItemWhereType then
    Inventory_SetFunctor(ManufactureAction_InvenFiler, Manufacture_PushItemFromInventory, Manufacture_Close, nil)
    Inventory_updateSlotData()
  else
    Warehouse_SetFunctor(ManufactureAction_WarehouseFilter, Manufacture_PushItemFromWarehouse)
    Warehouse_updateSlotData()
  end
end

Manufacture_KnowledgeList_SelectKnowledge = function(index)
  -- function num : 0_49 , upvalues : _startKnowledgeIndex, _uiKnowledgeDesc, _frameContent, _uiKnowledgeIcon, selectIndex, list2
  if Panel_Win_System:GetShow() then
    return 
  end
  local knowledgeIndex = _startKnowledgeIndex + index
  local mentalCardStaticWrapper = getAlchemyKnowledge(knowledgeIndex)
  if mentalCardStaticWrapper ~= nil then
    local isLearn = isLearnMentalCardForAlchemy(mentalCardStaticWrapper:getKey())
    if isLearn == true then
      _uiKnowledgeDesc:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
      _uiKnowledgeDesc:SetText(mentalCardStaticWrapper:getDesc())
      _frameContent:SetSize(_frameContent:GetSizeX(), _uiKnowledgeDesc:GetSizeY())
      _uiKnowledgeIcon:ChangeTextureInfoName(mentalCardStaticWrapper:getImagePath())
      local x1, y1, x2, y2 = setTextureUV_Func(_uiKnowledgeIcon, 0, 0, 360, 360)
      ;
      (_uiKnowledgeIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
      _uiKnowledgeIcon:setRenderTexture(_uiKnowledgeIcon:getBaseTexture())
    else
      do
        do
          _uiKnowledgeDesc:SetText(" ")
          _uiKnowledgeIcon:ChangeTextureInfoName("UI_Artwork/Unkown_Intelligence.dds")
          _frameContent:SetSize(_frameContent:GetSizeX(), _uiKnowledgeDesc:GetSizeY())
          local prevSelectIndex = selectIndex
          selectIndex = index
          list2:requestUpdateByKey(toInt64(0, index))
          list2:requestUpdateByKey(toInt64(0, prevSelectIndex))
        end
      end
    end
  end
end

Manufacture_KnowledgeList_Tooltip = function(isShow, index)
  -- function num : 0_50 , upvalues : _startKnowledgeIndex
  local knowledgeIndex = _startKnowledgeIndex + index
  local mentalCardStaticWrapper = getAlchemyKnowledge(knowledgeIndex)
  -- DECOMPILER ERROR at PC13: Unhandled construct in 'MakeBoolean' P1

  if isShow and mentalCardStaticWrapper ~= nil then
    local isLearn = isLearnMentalCardForAlchemy(mentalCardStaticWrapper:getKey())
    if not isLearn then
      local name = "???"
      local desc = mentalCardStaticWrapper:getKeyword()
      TooltipSimple_Show(uiControl, name, desc)
    end
  end
  do
    TooltipSimple_Hide()
  end
end

ManufactureKnowledge_UpdateList = function()
  -- function num : 0_51 , upvalues : list2, selectIndex, _startKnowledgeIndex
  (list2:getElementManager()):clearKey()
  selectIndex = -1
  ManufactureKnowledge_ClearList()
  local count = getCountAlchemyKnowledge()
  for index = _startKnowledgeIndex, count - 1 do
    (list2:getElementManager()):pushKey(toInt64(0, index))
  end
end

ManufactureKnowledge_ShowList = function(isShow)
  -- function num : 0_52 , upvalues : _defaultMSG1, _defaultMSG2, _uiKnowledgeIcon, _uiKnowledgeDesc, _frameContent
  if isShow then
    _defaultMSG1:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_DEFAULT_MSG_1"))
    _defaultMSG2:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_DEFAULT_MSG_2"))
    _defaultMSG1:SetShow(true)
    _defaultMSG2:SetShow(true)
  end
  _uiKnowledgeIcon:ComputePos()
  _uiKnowledgeIcon:ReleaseTexture()
  _uiKnowledgeIcon:SetShow(isShow)
  _uiKnowledgeDesc:SetText("")
  _uiKnowledgeDesc:SetShow(isShow)
  _frameContent:SetSize(_frameContent:GetSizeX(), _uiKnowledgeDesc:GetSizeY())
  ;
  ((UI.getChildControl)(Panel_Manufacture, "Button_Close")):ComputePos()
  ;
  ((UI.getChildControl)(Panel_Manufacture, "Button_Question")):ComputePos()
  ;
  ((UI.getChildControl)(Panel_Manufacture, "StaticText_Title")):ComputePos()
end

ManufactureKnowledge_ClearList = function()
  -- function num : 0_53 , upvalues : _uiKnowledgeIcon, _uiKnowledgeDesc, _frameContent
  _uiKnowledgeIcon:ReleaseTexture()
  _uiKnowledgeIcon:SetShow(true)
  _uiKnowledgeDesc:SetText("")
  _frameContent:SetSize(_frameContent:GetSizeX(), _uiKnowledgeDesc:GetSizeY())
  _uiKnowledgeDesc:SetShow(true)
end

Note_Mouse_LUp = function()
  -- function num : 0_54
  if Panel_Win_System:GetShow() then
    return 
  end
  Panel_ProductNote_ShowToggle()
end

Note_Mouse_On = function()
  -- function num : 0_55
  audioPostEvent_SystemUi(1, 13)
end

ManufactureControlInit()
Manufacture_Reset_ContinueGrindJewel()
Material_Update = function(slotCount)
  -- function num : 0_56 , upvalues : _materialSlotNoList, _slotList
  local inventory = ((getSelfPlayer()):get()):getInventory()
  local invenSize = inventory:size()
  for ii = 0, slotCount - 1 do
    if _materialSlotNoList[ii] ~= nil and _materialSlotNoList[ii] <= invenSize then
      local curentInventoryType = Inventory_GetCurrentInventoryType()
      local itemWrapper = getInventoryItemByType(curentInventoryType, _materialSlotNoList[ii])
      if itemWrapper ~= nil then
        (_slotList[ii]):setItemByStaticStatus(itemWrapper:getStaticStatus(), (itemWrapper:get()):getCount_s64())
      end
    end
  end
end

Manufacture_Notify.Init = function(self)
  -- function num : 0_57
  for key,value in pairs(self._templat) do
    value:SetShow(false)
  end
  self._defalutSpanY = (Panel_Manufacture_Notify:GetSpanSize()).y
  ;
  (self._result_Title):SetText(PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_RESULT"))
  ;
  (self._progress_Effect):AddEffect("UI_Quest_Complete_GreenAura", true, 15, 0)
end

Manufacture_Notify:Init()
Manufacture_Notify.createResultControl = function(self, index)
  -- function num : 0_58
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R2 in 'UnsetPending'

  if (self._item_Result)[index] == nil or (self._icon_ResultBG)[index] == nil or (self._icon_Result)[index] == nil then
    (self._item_Result)[index] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_Manufacture_Notify, "item_Result_" .. index)
    -- DECOMPILER ERROR at PC35: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (self._icon_ResultBG)[index] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Manufacture_Notify, "icon_ResultBG_" .. index)
    -- DECOMPILER ERROR at PC47: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (self._icon_Result)[index] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Manufacture_Notify, "icon_Result_" .. index)
    CopyBaseProperty((self._templat)._item_Result, (self._item_Result)[index])
    CopyBaseProperty((self._templat)._icon_ResultBG, (self._icon_ResultBG)[index])
    CopyBaseProperty((self._templat)._icon_Result, (self._icon_Result)[index])
    ;
    ((self._item_Result)[index]):SetSpanSize((((self._item_Result)[index]):GetSpanSize()).x, (((self._item_Result)[index]):GetSpanSize()).y - self._gapY * (index - 1))
    ;
    ((self._icon_ResultBG)[index]):SetSpanSize((((self._icon_ResultBG)[index]):GetSpanSize()).x, (((self._icon_ResultBG)[index]):GetSpanSize()).y - self._gapY * (index - 1))
    ;
    ((self._icon_Result)[index]):SetSpanSize((((self._icon_Result)[index]):GetSpanSize()).x, (((self._icon_Result)[index]):GetSpanSize()).y - self._gapY * (index - 1))
    ;
    ((self._icon_ResultBG)[index]):addInputEvent("Mouse_On", "Manufacture_Tooltip_Item_Show(" .. index .. ", true)")
    ;
    ((self._icon_ResultBG)[index]):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_hideTooltip()")
  end
end

Manufacture_Notify.createResourceControl = function(self, index)
  -- function num : 0_59
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R2 in 'UnsetPending'

  if (self._item_Resource)[index] == nil or (self._icon_ResourceBG)[index] == nil or (self._icon_Resource)[index] == nil then
    (self._item_Resource)[index] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_Manufacture_Notify, "item_Resource_" .. index)
    -- DECOMPILER ERROR at PC35: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (self._icon_ResourceBG)[index] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Manufacture_Notify, "icon_ResourceBG_" .. index)
    -- DECOMPILER ERROR at PC47: Confused about usage of register: R2 in 'UnsetPending'

    ;
    (self._icon_Resource)[index] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Manufacture_Notify, "icon_Resource_" .. index)
    CopyBaseProperty((self._templat)._item_Resource, (self._item_Resource)[index])
    CopyBaseProperty((self._templat)._icon_ResourceBG, (self._icon_ResourceBG)[index])
    CopyBaseProperty((self._templat)._icon_Resource, (self._icon_Resource)[index])
    ;
    ((self._item_Resource)[index]):SetSpanSize((((self._templat)._item_Resource):GetSpanSize()).x, (((self._templat)._item_Resource):GetSpanSize()).y + self._gapY * (index - 1))
    ;
    ((self._icon_ResourceBG)[index]):SetSpanSize((((self._templat)._icon_ResourceBG):GetSpanSize()).x, (((self._templat)._icon_ResourceBG):GetSpanSize()).y + self._gapY * (index - 1))
    ;
    ((self._icon_Resource)[index]):SetSpanSize((((self._templat)._icon_Resource):GetSpanSize()).x, (((self._templat)._icon_Resource):GetSpanSize()).y + self._gapY * (index - 1))
    ;
    ((self._icon_ResourceBG)[index]):addInputEvent("Mouse_On", "Manufacture_Tooltip_Item_Show(" .. index .. ", false)")
    ;
    ((self._icon_ResourceBG)[index]):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_hideTooltip()")
  end
end

Manufacture_Notify.clear = function(self)
  -- function num : 0_60 , upvalues : Manufacture_Notify
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  Manufacture_Notify._data_Resource = {}
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  Manufacture_Notify._data_Result = {}
  ;
  (Manufacture_Notify._progress_Bar):SetSmoothMode(false)
  ;
  (Manufacture_Notify._progress_Bar):SetProgressRate(0)
  for key,value in pairs(self._item_Resource) do
    value:SetShow(false)
  end
  for key,value in pairs(self._icon_ResourceBG) do
    value:SetShow(false)
  end
  for key,value in pairs(self._icon_Resource) do
    value:SetShow(false)
  end
  for key,value in pairs(self._item_Result) do
    value:SetShow(false)
  end
  for key,value in pairs(self._icon_ResultBG) do
    value:SetShow(false)
  end
  for key,value in pairs(self._icon_Result) do
    value:SetShow(false)
  end
end

Manufacture_Notify.SetPos = function(self)
  -- function num : 0_61
  local gapCnt = #self._data_Resource
  Panel_Manufacture_Notify:SetSpanSize((Panel_Manufacture_Notify:GetSpanSize()).x, self._defalutSpanY + self._gapY * gapCnt)
end

Manufacture_Progress_Update = function(materialItemWhereType)
  -- function num : 0_62 , upvalues : Manufacture_Notify
  local progressRate = 0
  local currentInventoryType = Inventory_GetCurrentInventoryType()
  for key,value in pairs(Manufacture_Notify._data_Resource) do
    local index = key
    local _name = value._name
    local _originalCnt = value._originalCnt
    local _currentCnt = value._currentCnt
    local _iconPath = value._iconPath
    local _param = Manufacture_Notify._successCount / (math.floor)(_originalCnt / ((_originalCnt - _currentCnt) / Manufacture_Notify._successCount))
    local _rate = (math.floor)(_param * 100)
    Manufacture_Notify:createResourceControl(index)
    ;
    ((Manufacture_Notify._item_Resource)[index]):SetText(_name .. " (" .. _currentCnt .. ")")
    ;
    ((Manufacture_Notify._icon_Resource)[index]):ChangeTextureInfoName(_iconPath)
    local width = nil
    ;
    ((Manufacture_Notify._item_Resource)[index]):SetShow(true)
    ;
    ((Manufacture_Notify._icon_Resource)[index]):SetShow(true)
    ;
    ((Manufacture_Notify._icon_ResourceBG)[index]):SetShow(true)
    ;
    ((Manufacture_Notify._icon_ResourceBG)[index]):SetEnableArea(0, 0, ((Manufacture_Notify._icon_ResourceBG)[index]):GetSizeX() + ((Manufacture_Notify._item_Resource)[index]):GetTextSizeX(), ((Manufacture_Notify._icon_ResourceBG)[index]):GetSizeY())
    if progressRate < _rate then
      progressRate = _rate
    end
  end
  if Manufacture_Notify._successCount > 0 then
    (Manufacture_Notify._progress_Bar):SetSmoothMode(true)
  end
  ;
  (Manufacture_Notify._progress_Bar):SetProgressRate(progressRate)
  ;
  (Manufacture_Notify._progress_Text):SetText(progressRate .. "%")
  if materialItemWhereType ~= currentInventoryType and currentInventoryType ~= 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_BAG_TABSELECT"))
    Manufacture_ClearValues()
    Manufacture_Response()
  end
  for key,value in pairs(Manufacture_Notify._data_Result) do
    local index = key
    local _name = value._name
    local _iconPath = value._iconPath
    local _currentCnt = value._currentCnt
    Manufacture_Notify:createResultControl(index)
    ;
    ((Manufacture_Notify._item_Result)[index]):SetText(_name .. " (" .. _currentCnt .. ")")
    ;
    ((Manufacture_Notify._icon_Result)[index]):ChangeTextureInfoName(_iconPath)
    ;
    ((Manufacture_Notify._item_Result)[index]):SetShow(true)
    ;
    ((Manufacture_Notify._icon_Result)[index]):SetShow(true)
    ;
    ((Manufacture_Notify._icon_ResultBG)[index]):SetShow(true)
    ;
    ((Manufacture_Notify._icon_ResultBG)[index]):SetEnableArea(-((Manufacture_Notify._item_Result)[index]):GetTextSizeX(), 0, ((Manufacture_Notify._icon_ResultBG)[index]):GetSizeX(), ((Manufacture_Notify._icon_ResultBG)[index]):GetSizeY())
  end
  if #Manufacture_Notify._data_Result > 0 then
    (Manufacture_Notify._result_Title):SetSpanSize(((Manufacture_Notify._result_Title):GetSpanSize()).x, (((Manufacture_Notify._templat)._item_Result):GetSpanSize()).y - Manufacture_Notify._gapY * #Manufacture_Notify._data_Result)
    ;
    (Manufacture_Notify._result_Title):SetShow(true)
  else
    ;
    (Manufacture_Notify._result_Title):SetShow(false)
  end
end

Manufacture_Tooltip_Item_Show = function(index, isResult)
  -- function num : 0_63 , upvalues : Manufacture_Notify
  local itemKey, uiBase = nil
  if isResult then
    itemKey = ((Manufacture_Notify._data_Result)[index])._key
    uiBase = (Manufacture_Notify._icon_ResultBG)[index]
  else
    if isResult == false then
      itemKey = ((Manufacture_Notify._data_Resource)[index])._key
      uiBase = (Manufacture_Notify._icon_ResourceBG)[index]
    end
  end
  if itemKey == nil or uiBase == nil then
    return 
  end
  local staticStatusWrapper = getItemEnchantStaticStatus(itemKey)
  Panel_Tooltip_Item_Show(staticStatusWrapper, uiBase, true, false)
end

IsManufacture_Chk = function(variableName, value)
  -- function num : 0_64 , upvalues : Manufacture_Notify, manufactureListName, _actionIndex, materialItemWhereType, IM
  if variableName == "IsManufactureChk" then
    if value == 0 then
      Panel_Manufacture_Notify:SetShow(false)
      Manufacture_Notify:clear()
    else
      Panel_Manufacture_Notify:SetShow(true)
      ;
      (Manufacture_Notify._type_Name):SetText(PAGetString(Defines.StringSheet_GAME, manufactureListName[_actionIndex]))
      Manufacture_Notify:SetPos()
      Manufacture_Progress_Update(materialItemWhereType)
    end
    if AllowChangeInputMode() then
      if check_ShowWindow() then
        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
      else
        ;
        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
      end
    else
      SetFocusChatting()
    end
  else
    Panel_Manufacture_Notify:SetShow(false)
    Manufacture_Notify:clear()
  end
end

Manufacture_Notify_Check = function()
  -- function num : 0_65 , upvalues : Manufacture_Notify
  if Panel_Manufacture_Notify:GetShow() == true and #Manufacture_Notify._data_Resource == 0 then
    Panel_Manufacture_Notify:SetShow(false)
  end
end

Manufacture_Full_Check = function()
  -- function num : 0_66 , upvalues : _usingItemSlotCount, _defaultSlotNo, _materialSlotNoList
  local useSlotCount = 0
  for ii = 0, _usingItemSlotCount - 1 do
    if _defaultSlotNo ~= _materialSlotNoList[ii] then
      useSlotCount = useSlotCount + 1
    end
  end
  if useSlotCount == _usingItemSlotCount then
    return true
  end
  return false
end

ManufactureAction_InvenFiler = function(slotNo, itemWrapper, inventoryType)
  -- function num : 0_67 , upvalues : _actionIndex, _listAction
  if _actionIndex == -1 then
    return false
  end
  local isVested = (itemWrapper:get()):isVested()
  local isPersonalTrade = (itemWrapper:getStaticStatus()):isPersonalTrade()
  if Manufacture_Full_Check() == true then
    return true
  end
  do
    if isVested then
      local isFilter = not isUsePcExchangeInLocalizingValue() or isPersonalTrade
    end
    if isFilter then
      return isFilter
    end
    local actionName = (_listAction[_actionIndex])._actionName
    local isEnable = nil
    if _actionIndex == 7 then
      isEnable = itemWrapper:checkToRepairItem()
    else
      isEnable = isManufactureItem(inventoryType, slotNo, actionName)
    end
    return not isEnable
  end
end

ManufactureAction_WarehouseFilter = function(slotNo, itemWrapper, stackCount)
  -- function num : 0_68 , upvalues : _actionIndex, _listAction
  if _actionIndex == -1 then
    return false
  end
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return false
  end
  local isVested = (itemWrapper:get()):isVested()
  local isPersonalTrade = (itemWrapper:getStaticStatus()):isPersonalTrade()
  if Manufacture_Full_Check() == true then
    return true
  end
  do
    if isVested then
      local isFilter = not isUsePcExchangeInLocalizingValue() or isPersonalTrade
    end
    if isFilter then
      return isFilter
    end
    local regionKey = selfPlayer:getRegionKey()
    local actionName = (_listAction[_actionIndex])._actionName
    local isEnable = nil
    if _actionIndex == 7 then
      isEnable = itemWrapper:checkToRepairItem()
    else
      isEnable = isManufactureItemInWareHouse(regionKey, slotNo, actionName)
    end
    return not isEnable
  end
end

manufactureClickSetTextureUV = function(uiBase, x1, y1, x2, y2, isType)
  -- function num : 0_69
  if isType > 11 then
    uiBase:ChangeTextureInfoName("new_ui_common_forlua/window/manufacture/manufacture_01.dds")
  else
    uiBase:ChangeTextureInfoName("new_ui_common_forlua/window/manufacture/manufacture_00.dds")
  end
  local x1, y1, x2, y2 = setTextureUV_Func(uiBase, x1, y1, x2, y2)
  ;
  (uiBase:getBaseTexture()):setUV(x1, y1, x2, y2)
  uiBase:setRenderTexture(uiBase:getBaseTexture())
  uiBase:SetShow(true)
end

manufacture_ShowIconToolTip = function(isShow, idx)
  -- function num : 0_70 , upvalues : isEnableMsg, _listAction
  local name, desc = nil
  if isShow == true then
    audioPostEvent_SystemUi(1, 13)
    if idx == 0 then
      name = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_SHAKE")
      desc = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_SHAKE")
    else
      if idx == 1 then
        name = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_GRIND")
        desc = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_GRIND")
      else
        if idx == 2 then
          name = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_WOODSPLITTING")
          desc = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_FIREWOOD")
        else
          if idx == 3 then
            name = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_DRY")
            desc = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_DRY")
          else
            if idx == 4 then
              name = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_THINNING")
              desc = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_THINNING")
            else
              if idx == 5 then
                name = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_HEATING")
                desc = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_HEAT")
              else
                if idx == 6 then
                  name = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_RAINWATER")
                  desc = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_RAINWATER")
                else
                  if idx == 7 then
                    name = PAGetString(Defines.StringSheet_GAME, "ALCHEMY_MANUFACTURE_REPAIR")
                    desc = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_REPAIR")
                  else
                    if idx == 8 then
                      name = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_MANUFACTURE_ALCHEMY")
                      desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAME_MANUFACTURE_DESC_ALCHEMY")
                    else
                      if idx == 9 then
                        name = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_MANUFACTURE_COOK")
                        desc = PAGetString(Defines.StringSheet_GAME, "LUA_GAME_MANUFACTURE_DESC_COOK")
                      else
                        if idx == 10 then
                          name = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_MANUFACTURE_ROYALGIFT_COOK")
                          desc = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_ROYALGIFT_COOK")
                        else
                          if idx == 11 then
                            name = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_MANUFACTURE_ROYALGIFT_ALCHEMY")
                            desc = PAGetString(Defines.StringSheet_GAME, "GAME_MANUFACTURE_DESC_ROYALGIFT_ALCHEMY")
                          else
                            if idx == 12 then
                              name = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_GUILDMANURACTURE_NAME")
                              desc = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_GUILDMANUFACTURE_SUBDESC")
                            else
                              if idx == 13 then
                                name = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_CRAFT_NAME")
                                desc = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_CRAFT_SUBDESC")
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    if isEnableMsg[idx] == false then
      desc = desc .. "\n" .. PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_NEED_KNOWLEDGE")
    end
    registTooltipControl((_listAction[idx])._radioBtn, Panel_Tooltip_SimpleText)
    TooltipSimple_Show((_listAction[idx])._radioBtn, name, desc)
  else
    TooltipSimple_Hide()
  end
end

noneStackItemCheckBT = function()
  -- function num : 0_71 , upvalues : noneStackItemCheck, noneStackItem_ChkBtn
  if Panel_Manufacture:GetShow() then
    noneStackItemCheck = noneStackItem_ChkBtn:IsCheck()
  end
end

Manufacture_RepeatAction = function()
  -- function num : 0_72 , upvalues : noneStackItemList, noneStackItemCheck, hasNoneStackItem
  if Panel_Win_System:GetShow() then
    return 
  end
  if (#noneStackItemList ~= nil and #noneStackItemList > 0 and noneStackItemCheck == true) or hasNoneStackItem == true and noneStackItemCheck == true then
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE"), content = PAGetString(Defines.StringSheet_GAME, "LUA_MANUFACTURE_CONTINUEGRIND_MSGBOX_DESC"), functionYes = Manufacture_Mouse_LUp, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData, "middle")
  else
    do
      Manufacture_Mouse_LUp()
    end
  end
end

registEventHandler = function()
  -- function num : 0_73 , upvalues : MAX_ACTION_BTN, _listAction
  for i = 0, MAX_ACTION_BTN - 1 do
    ((_listAction[i])._radioBtn):addInputEvent("Mouse_On", "manufacture_ShowIconToolTip( true, " .. i .. " )")
    ;
    ((_listAction[i])._radioBtn):addInputEvent("Mouse_Out", "manufacture_ShowIconToolTip( false )")
  end
end

FontSize_SetPos = function()
  -- function num : 0_74 , upvalues : _currentActionIcon, iconPosY, _textDesc, textDescPosY, _textTemp, textTempPosY, _manufactureName, manufactureNamePosY
  if getUiFontSize() ~= 0 then
    _currentActionIcon:SetPosY(iconPosY - 5)
    _textDesc:SetPosY(textDescPosY - 8)
    _textTemp:SetPosY(textTempPosY - 5)
    _manufactureName:SetPosY(manufactureNamePosY - 5)
  else
    _currentActionIcon:SetPosY(iconPosY)
    _textDesc:SetPosY(textDescPosY)
    _textTemp:SetPosY(textTempPosY)
    _manufactureName:SetPosY(manufactureNamePosY)
  end
end

Manufacture_ListControlCreate = function(content, key)
  -- function num : 0_75 , upvalues : selectIndex, UI_color, limitTextTooltip, IsLimitText
  local index = Int64toInt32(key)
  local recipe = (UI.getChildControl)(content, "StaticText_List2_AlchemyRecipe")
  local selectList = (UI.getChildControl)(content, "Static_List2_SelectList")
  local mentalCardStaticWrapper = getAlchemyKnowledge(index)
  selectList:SetIgnore(true)
  if selectIndex == index then
    selectList:SetShow(true)
  else
    selectList:SetShow(false)
  end
  if mentalCardStaticWrapper ~= nil then
    local isLearn = isLearnMentalCardForAlchemy(mentalCardStaticWrapper:getKey())
    recipe:SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
    if isLearn == true then
      recipe:SetFontColor(UI_color.C_FF84FFF5)
      recipe:SetText(mentalCardStaticWrapper:getName())
      -- DECOMPILER ERROR at PC53: Confused about usage of register: R7 in 'UnsetPending'

      limitTextTooltip[index] = mentalCardStaticWrapper:getName()
    else
      recipe:SetFontColor(UI_color.C_FF888888)
      recipe:SetText("??? ( " .. mentalCardStaticWrapper:getKeyword() .. " )")
      -- DECOMPILER ERROR at PC69: Confused about usage of register: R7 in 'UnsetPending'

      limitTextTooltip[index] = mentalCardStaticWrapper:getKeyword()
    end
    -- DECOMPILER ERROR at PC75: Confused about usage of register: R7 in 'UnsetPending'

    if recipe:IsLimitText() then
      IsLimitText[index] = true
    else
      -- DECOMPILER ERROR at PC78: Confused about usage of register: R7 in 'UnsetPending'

      IsLimitText[index] = false
    end
    recipe:addInputEvent("Mouse_On", "ManufactureLimitTextTooptip( true, " .. index .. " )")
    recipe:addInputEvent("Mouse_Out", "ManufactureLimitTextTooptip( false )")
    recipe:SetShow(true)
    recipe:SetPosY(6)
    recipe:addInputEvent("Mouse_LUp", "Manufacture_KnowledgeList_SelectKnowledge( " .. index .. " )")
  else
    do
      recipe:SetShow(false)
    end
  end
end

ManufactureLimitTextTooptip = function(isShow, index)
  -- function num : 0_76 , upvalues : IsLimitText, limitTextTooltip
  if isShow == false or IsLimitText[index] == false then
    TooltipSimple_Hide()
    return 
  end
  TooltipSimple_Show(Panel_Manufacture, limitTextTooltip[index])
end

registerEvent("onScreenResize", "manufacture_Repos")
registerEvent("EventChangedSelfPlayerActionVariable", "IsManufacture_Chk")
list2:changeAnimationSpeed(10)
list2:registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "Manufacture_ListControlCreate")
list2:createChildContent((CppEnums.PAUIList2ElementManagerType).list)
Panel_Manufacture_Notify:RegisterUpdateFunc("Manufacture_Notify_Check")
registEventHandler()

