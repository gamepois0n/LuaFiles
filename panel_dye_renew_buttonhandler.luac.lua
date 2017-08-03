-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\dye\panel_dye_renew_buttonhandler.luac 

-- params : ...
-- function num : 0
local UI_BUFFTYPE = CppEnums.UserChargeType
local enValue = {MaxCharacterTypeList = 7, MaxEquipSlotCount = 18}
local enToggleIndex = {Underwear = 0, Avater = 1, Helmet = 2, AwakenWeapon = 3, FaceViewHair = 4, FaceGuard = 5, WarStance = 6}
FGlobal_Panel_Dye_ReNew_Reset = function()
  -- function num : 0_0
  for idx = 0, 4 do
    local static_BG = (UI.getChildControl)(Panel_Dye_ReNew, "Static_BG")
    local staticBG_CharacterType = (UI.getChildControl)(static_BG, "Static_SlotBG_CharacterType_" .. idx)
    local radioButton_CharacterType = (UI.getChildControl)(staticBG_CharacterType, "RadioButton_CharacterType_" .. idx)
    radioButton_CharacterType:SetCheck(false)
    if idx == 0 then
      radioButton_CharacterType:SetCheck(true)
    end
  end
  local checkButton_ToggleWarStance = (UI.getChildControl)(Panel_Dye_ReNew, "CheckButton_WarStance")
  local checkButton_ToggleShowUnderwear = (UI.getChildControl)(Panel_Dye_ReNew, "CheckButton_ShowUnderWear")
  local checkButton_ToggleHideAvatar = (UI.getChildControl)(Panel_Dye_ReNew, "CheckButton_HideAvatar")
  local checkButton_ToggleHideHair = (UI.getChildControl)(Panel_Dye_ReNew, "CheckButton_HideHair")
  local checkButton_ToggleHideHelmet = (UI.getChildControl)(Panel_Dye_ReNew, "CheckButton_HideHelmet")
  local checkButton_ToggleOpenFaceGuard = (UI.getChildControl)(Panel_Dye_ReNew, "CheckButton_OpenFaceGuard")
  local checkButton_ToggleAwakenWeapon = (UI.getChildControl)(Panel_Dye_ReNew, "CheckButton_AwakenWeapon")
  local txt_Endurance = (UI.getChildControl)(Panel_Dye_ReNew, "StaticText_Endurance")
  local slider_Endurance = (UI.getChildControl)(Panel_Dye_ReNew, "Slider_Endurance")
  checkButton_ToggleWarStance:SetCheck(true)
  checkButton_ToggleShowUnderwear:SetCheck(true)
  checkButton_ToggleHideAvatar:SetCheck(true)
  checkButton_ToggleHideHair:SetCheck(false)
  checkButton_ToggleHideHelmet:SetCheck(false)
  checkButton_ToggleOpenFaceGuard:SetCheck(false)
  checkButton_ToggleAwakenWeapon:SetCheck(false)
  slider_Endurance:SetControlPos(100)
end

local dyePartString = {
{[3] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_BARD"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_STIRRUP"), [5] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_SADDLE"), [6] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_HORSEHEAD"), [12] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_FOOT"), [14] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_ARMOR"), [15] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_STIRRUP"), [16] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_SADDLE"), [17] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_FACE")}
, 
{[3] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_BODY"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_TIRE"), [5] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_FLAG"), [6] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_INSIGNIA"), [13] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_LAMP"), [25] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_CORVER"), [14] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_AVATAR_BODY"), [15] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_AVATAR_TIRE"), [16] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_AVATAR_FLAG"), [17] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_AVATAR_INSIGNIA"), [26] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_AVATAR_CORVER")}
, 
{[3] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_BARD"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_STIRRUP"), [5] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_SADDLE"), [6] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_HORSEHEAD"), [12] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_FOOT"), [14] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_ARMOR"), [15] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_STIRRUP"), [16] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_SADDLE"), [17] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_FACE")}
; 
[0] = {[0] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_MAINHAND"), [1] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_SUBHAND"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CHARACTER_ARMOR"), [4] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_GLOVES"), [5] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_BOOTS"), [6] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_HELM"), [18] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_AVATAR_MAINHAND"), [19] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_AVATAR_SUBHAND"), [14] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_BODY"), [15] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_HANDS"), [16] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_BOOTS"), [17] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_HELM"), [20] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_UNDERWEAR"), [21] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CHARACTER_ACC_0"), [22] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CHARACTER_ACC_1"), [23] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CHARACTER_ACC_2"), [29] = PAGetString(Defines.StringSheet_GAME, "Lua_EquipSlotNo_String_awakenWeapon"), [30] = PAGetString(Defines.StringSheet_GAME, "Lua_EquipSlotNo_String_avatarAwakenWeapon")}
}
FGlobal_Panel_Dye_ReNew_AddEvent = function()
  -- function num : 0_1 , upvalues : enValue, enToggleIndex
  local radioButton_CharacterType, staticBG_CharacterType = nil, nil
  local Static_BG = (UI.getChildControl)(Panel_Dye_ReNew, "Static_BG")
  for ii = 0, enValue.MaxCharacterTypeList - 1 do
    staticBG_CharacterType = (UI.getChildControl)(Static_BG, "Static_SlotBG_CharacterType_" .. ii)
    radioButton_CharacterType = (UI.getChildControl)(staticBG_CharacterType, "RadioButton_CharacterType_" .. ii)
    radioButton_CharacterType:addInputEvent("Mouse_LUp", "HandleClicked_DyeReNew_SelectCharacterType( " .. ii .. " )")
    if ii == 3 and FGlobal_DyeReNew_GetEnableCamel() == false then
      radioButton_CharacterType:SetShow(false)
    end
  end
  local buttonQuestion = (UI.getChildControl)(Panel_Dye_ReNew, "Button_Question")
  buttonQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"Dye\" )")
  buttonQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"Dye\", \"true\")")
  buttonQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"Dye\", \"false\")")
  local slider_Endurance = (UI.getChildControl)(Panel_Dye_ReNew, "Slider_Endurance")
  local slider_EnduranceController = (UI.getChildControl)(slider_Endurance, "Slider_Endurance_Button")
  slider_Endurance:addInputEvent("Mouse_LUp", "HandleClicked_DyeReNew_SetEndurance()")
  slider_EnduranceController:addInputEvent("Mouse_LPress", "HandleClicked_DyeReNew_SetEndurance()")
  local txt_Endurance = (UI.getChildControl)(Panel_Dye_ReNew, "StaticText_Endurance")
  if FGlobal_DyeReNew_GetEnableKR2() == true then
    txt_Endurance:SetShow(false)
    slider_Endurance:SetShow(false)
  end
  local checkButton_ToggleWarStance = (UI.getChildControl)(Panel_Dye_ReNew, "CheckButton_WarStance")
  checkButton_ToggleWarStance:addInputEvent("Mouse_LUp", "HandleClicked_DyeReNew_ToggleWarStance()")
  checkButton_ToggleWarStance:addInputEvent("Mouse_On", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(true," .. enToggleIndex.WarStance .. ")")
  checkButton_ToggleWarStance:addInputEvent("Mouse_Out", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(false," .. enToggleIndex.WarStance .. ")")
  local checkButton_ToggleShowUnderwear = (UI.getChildControl)(Panel_Dye_ReNew, "CheckButton_ShowUnderWear")
  checkButton_ToggleShowUnderwear:addInputEvent("Mouse_LUp", "HandleClicked_DyeReNew_SetShowUnderwear()")
  checkButton_ToggleShowUnderwear:addInputEvent("Mouse_On", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(true," .. enToggleIndex.Underwear .. ")")
  checkButton_ToggleShowUnderwear:addInputEvent("Mouse_Out", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(false," .. enToggleIndex.Underwear .. ")")
  if FGlobal_DyeReNew_GetEnableKR2() == true then
    checkButton_ToggleShowUnderwear:SetShow(false)
  end
  local checkButton_ToggleHideAvatar = (UI.getChildControl)(Panel_Dye_ReNew, "CheckButton_HideAvatar")
  checkButton_ToggleHideAvatar:addInputEvent("Mouse_LUp", "HandleClicked_DyeReNew_SetHideAvartar()")
  checkButton_ToggleHideAvatar:addInputEvent("Mouse_On", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(true," .. enToggleIndex.Avater .. ")")
  checkButton_ToggleHideAvatar:addInputEvent("Mouse_Out", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(false," .. enToggleIndex.Avater .. ")")
  local checkButton_ToggleHideHair = (UI.getChildControl)(Panel_Dye_ReNew, "CheckButton_HideHair")
  checkButton_ToggleHideHair:addInputEvent("Mouse_LUp", "HandleClicked_DyeReNew_SetFaceViewHair()")
  checkButton_ToggleHideHair:addInputEvent("Mouse_On", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(true," .. enToggleIndex.FaceViewHair .. ")")
  checkButton_ToggleHideHair:addInputEvent("Mouse_Out", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(false," .. enToggleIndex.FaceViewHair .. ")")
  local checkButton_ToggleHideHelmet = (UI.getChildControl)(Panel_Dye_ReNew, "CheckButton_HideHelmet")
  checkButton_ToggleHideHelmet:addInputEvent("Mouse_LUp", "HandleClicked_DyeReNew_SetHideHelmet()")
  checkButton_ToggleHideHelmet:addInputEvent("Mouse_On", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(true," .. enToggleIndex.Helmet .. ")")
  checkButton_ToggleHideHelmet:addInputEvent("Mouse_Out", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(false," .. enToggleIndex.Helmet .. ")")
  local checkButton_ToggleOpenFaceGuard = (UI.getChildControl)(Panel_Dye_ReNew, "CheckButton_OpenFaceGuard")
  checkButton_ToggleOpenFaceGuard:addInputEvent("Mouse_LUp", "HandleClicked_DyeReNew_SetFaceGuard()")
  checkButton_ToggleOpenFaceGuard:addInputEvent("Mouse_On", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(true," .. enToggleIndex.FaceGuard .. ")")
  checkButton_ToggleOpenFaceGuard:addInputEvent("Mouse_Out", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(false," .. enToggleIndex.FaceGuard .. ")")
  local checkButton_ToggleAwakenWeapon = (UI.getChildControl)(Panel_Dye_ReNew, "CheckButton_AwakenWeapon")
  checkButton_ToggleAwakenWeapon:addInputEvent("Mouse_LUp", "HandleClicked_DyeReNew_SetAwakenWeapon()")
  checkButton_ToggleAwakenWeapon:addInputEvent("Mouse_On", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(true," .. enToggleIndex.AwakenWeapon .. ")")
  checkButton_ToggleAwakenWeapon:addInputEvent("Mouse_Out", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(false," .. enToggleIndex.AwakenWeapon .. ")")
  if FGlobal_DyeReNew_GetEnableAwaken() == false then
    checkButton_ToggleAwakenWeapon:SetShow(false)
  end
  local UIAmpuleTargetBG = (UI.getChildControl)(Static_BG, "Static_AmpuleTartget_BG")
  local RadioButton_Tab_ALL = (UI.getChildControl)(UIAmpuleTargetBG, "RadioButton_Tab_ALL")
  local RadioButton_Tab_My = (UI.getChildControl)(UIAmpuleTargetBG, "RadioButton_Tab_My")
  local RadioButton_Tab_Pearl = (UI.getChildControl)(UIAmpuleTargetBG, "RadioButton_Tab_Pearl")
  RadioButton_Tab_ALL:addInputEvent("Mouse_LUp", "HandleClicked_LUp_Ampule_SelectedType( true, false )")
  RadioButton_Tab_ALL:addInputEvent("Mouse_On", "HandleOnOut_DyeReNew_Palette_Category_Tooltip( true, " .. 8 .. ")")
  RadioButton_Tab_ALL:addInputEvent("Mouse_Out", "HandleOnOut_DyeReNew_Palette_Category_Tooltip( false, " .. 8 .. ")")
  RadioButton_Tab_My:addInputEvent("Mouse_LUp", "HandleClicked_LUp_Ampule_SelectedType( false, false )")
  RadioButton_Tab_My:addInputEvent("Mouse_On", "HandleOnOut_DyeReNew_Palette_Category_Tooltip( true, " .. 9 .. ")")
  RadioButton_Tab_My:addInputEvent("Mouse_Out", "HandleOnOut_DyeReNew_Palette_Category_Tooltip( false, " .. 9 .. ")")
  RadioButton_Tab_Pearl:addInputEvent("Mouse_LUp", "HandleClicked_LUp_Ampule_SelectedType( true, true )")
  RadioButton_Tab_Pearl:addInputEvent("Mouse_On", "HandleOnOut_DyeReNew_Palette_Category_Tooltip( true, " .. 10 .. ")")
  RadioButton_Tab_Pearl:addInputEvent("Mouse_Out", "HandleOnOut_DyeReNew_Palette_Category_Tooltip( false, " .. 10 .. ")")
  if FGlobal_DyeReNew_GetEnableDyePearl() == false then
    RadioButton_Tab_Pearl:SetShow(false)
  end
  for ii = 0, 7 do
    local UIMaterial = (UI.getChildControl)(UIAmpuleTargetBG, "RadioButton_Material_" .. ii)
    UIMaterial:addInputEvent("Mouse_LUp", "HandleClicked_LUp_Ampule_SelectCategory( " .. ii .. ")")
    UIMaterial:addInputEvent("Mouse_On", "HandleOnOut_DyeReNew_Palette_Category_Tooltip( true, " .. ii .. ")")
    UIMaterial:addInputEvent("Mouse_Out", "HandleOnOut_DyeReNew_Palette_Category_Tooltip( false, " .. ii .. ")")
    if ii == 0 then
      UIMaterial:SetCheck(true)
    end
  end
  local ButtonDoDye = (UI.getChildControl)(Panel_Dye_ReNew, "Button_DoDye")
  ButtonDoDye:addInputEvent("Mouse_LUp", "HandleClicked_DeyReNew_DoDye()")
end

HandleReset_DyeReNew_AmpuleTab_BySelectCharacterType = function()
  -- function num : 0_2
  local Static_BG = (UI.getChildControl)(Panel_Dye_ReNew, "Static_BG")
  local UIAmpuleTargetBG = (UI.getChildControl)(Static_BG, "Static_AmpuleTartget_BG")
  local RadioButton_Tab_ALL = (UI.getChildControl)(UIAmpuleTargetBG, "RadioButton_Tab_ALL")
  local RadioButton_Tab_My = (UI.getChildControl)(UIAmpuleTargetBG, "RadioButton_Tab_My")
  local RadioButton_Tab_Pearl = (UI.getChildControl)(UIAmpuleTargetBG, "RadioButton_Tab_Pearl")
  RadioButton_Tab_ALL:SetCheck(false)
  RadioButton_Tab_My:SetCheck(true)
  RadioButton_Tab_Pearl:SetCheck(false)
end

HandleClicked_DyeReNew_SelectCharacterType = function(idx)
  -- function num : 0_3 , upvalues : enValue
  local self = FGlobal_DyeReNew_GetInstance()
  local oldSelectedCharacterType = self._selected_CharacterTarget
  local oldSelectEquipSlotNo = self._selected_EquipSlotNo
  if enValue.MaxCharacterTypeList <= idx or oldSelectedCharacterType == idx then
    return 
  end
  self._selected_EquipSlotNo = -1
  local bChangeSelectedCharacterType = ToClient_RequestSetTargetType(idx)
  if bChangeSelectedCharacterType then
    self._selected_CharacterTarget = idx
    self._paletteShowAll = false
    self._isPearlPalette = false
    self._scrollStartIndex = 0
    ;
    (self._AmpuleScroll):SetControlTop()
    Inventory_SetFunctor(FGlobal_Panel_DyeReNew_InventoryFilter, FGlobal_Panel_DyeReNew_Interaction_FromInventory, nil, nil)
    HandleReset_DyeReNew_AmpuleTab_BySelectCharacterType()
    self:Change_EquipIcon()
    self:Update_Part()
    self:Update_AmpuleList()
    self._selectedDyePart = {}
    self:Update_Position()
  else
    self._selected_EquipSlotNo = oldSelectEquipSlotNo
    local UIStaticBG = (UI.getChildControl)(Panel_Dye_ReNew, "Static_BG")
    local UIButtonBGOld = (UI.getChildControl)(UIStaticBG, "Static_SlotBG_CharacterType_" .. oldSelectedCharacterType)
    local UIButtonBGNew = (UI.getChildControl)(UIStaticBG, "Static_SlotBG_CharacterType_" .. idx)
    local UIRadioButtonOld = (UI.getChildControl)(UIButtonBGOld, "RadioButton_CharacterType_" .. oldSelectedCharacterType)
    local UIRadioButtonNew = (UI.getChildControl)(UIButtonBGNew, "RadioButton_CharacterType_" .. idx)
    UIRadioButtonNew:SetCheck(false)
    UIRadioButtonOld:SetCheck(true)
  end
end

HandleClicked_RUp_ClearEquipItemByEquipSlotNo = function(equipSlotNo, equipSlotIndex)
  -- function num : 0_4
  local self = FGlobal_DyeReNew_GetInstance()
  Panel_Tooltip_Item_hideTooltip()
  ToClient_RequestClearDyeingTargetSlot(equipSlotNo)
  local removeCount = 0
  for key,value in pairs(self._selectedDyePart) do
    if value == equipSlotNo then
      removeCount = removeCount + 1
    end
  end
  for ii = 0, removeCount - 1 do
    (table.remove)(self._selectedDyePart, (self._selectedDyePart)[equipSlotNo])
  end
  ;
  (((self._arrEquipSlotItem)[equipSlotIndex]).icon):SetColor(4286019447)
  if equipSlotNo == self._selected_EquipSlotNo then
    self._selected_EquipSlotNo = -1
    self:Reset_Part(true)
  end
end

HandleClicked_OnOut_ShowEquipItemToolTip = function(isShow, equipSlotNo, slotIdx)
  -- function num : 0_5
  local self = FGlobal_DyeReNew_GetInstance()
  if isShow == true then
    local itemWrapper = ToClient_RequestGetDyeingTargetItemWrapper(equipSlotNo)
    local SlotIcon = ((self._arrEquipSlotItem)[slotIdx]).icon
    Panel_Tooltip_Item_Show(itemWrapper, SlotIcon, false, true)
  else
    do
      Panel_Tooltip_Item_hideTooltip()
    end
  end
end

HandleClicked_LUp_SelectEquipItem = function(equipSlotNo, equipSlotIndex)
  -- function num : 0_6 , upvalues : enValue
  local self = FGlobal_DyeReNew_GetInstance()
  for ii = 0, enValue.MaxEquipSlotCount - 1 do
    if ii == equipSlotIndex then
      (((self._arrEquipSlotItem)[ii]).icon):SetColor(4294967295)
    else
      ;
      (((self._arrEquipSlotItem)[ii]).icon):SetColor(4286019447)
    end
  end
  self._selected_EquipSlotNo = equipSlotNo
  ToClient_RequestSelectedEquipItem(equipSlotNo)
  self._nowClickPartId = -1
  self._nowClickPartSlotId = -1
  self:Reset_Part(true)
  self:Change_EquipIcon()
  self:Update_Part()
end

HandleClicked_LUp_EquipPartReset = function(equipSlotNo, partId, slotId, uiIdx)
  -- function num : 0_7
  local self = FGlobal_DyeReNew_GetInstance()
  local resetBtn = (self._arrEquipPartReset)[uiIdx]
  ToClient_RequestClearUsedDyeingPalette(equipSlotNo, partId, slotId)
  ;
  (table.remove)(self._selectedDyePart, (self._selectedDyePart)[equipSlotNo])
  self:Update_Part()
  self:Update_AmpuleList()
end

HandleClicked_LUp_SelectEquipPart = function(partID, slotID, UIidx)
  -- function num : 0_8
  local self = FGlobal_DyeReNew_GetInstance()
  ToClient_RequestSelectedDyeingPartSlot(self._selected_EquipSlotNo, partID, slotID)
  self._nowClickPartId = partID
  self._nowClickPartSlotId = slotID
end

HandleOnOut_DeyReNew_Ampule_Color = function(isShow, itemEnchantKey, UIIndex)
  -- function num : 0_9
  local self = FGlobal_DyeReNew_GetInstance()
  local uiControl = (self._arrAmpuleSlotBG)[UIIndex]
  local itemEnchantSSW = getItemEnchantStaticStatus(ItemEnchantKey(itemEnchantKey))
  local itemEnchantSS = itemEnchantSSW:get()
  local itemName = (getItemName(itemEnchantSS))
  local desc = nil
  registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
  if isShow == true then
    TooltipSimple_Show(uiControl, itemName, desc)
  else
    TooltipSimple_Hide()
  end
end

HandleScroll_DyeReNew_Ampule_ScrollUpdate = function(isScrollUp)
  -- function num : 0_10
  local self = FGlobal_DyeReNew_GetInstance()
  local movingValue = 2
  self._scrollStartIndex = (UIScroll.ScrollEvent)(self._AmpuleScroll, isScrollUp, movingValue, self._scrollMaxRow, self._scrollStartIndex, 1)
  self:Update_AmpuleList()
end

HandleClicked_DyeReNew_PressAmpuleScroll = function()
  -- function num : 0_11
  local self = FGlobal_DyeReNew_GetInstance()
  self._scrollStartIndex = (math.ceil)((self._scrollMaxRow - 2) * (self._AmpuleScroll):GetControlPos())
  self:Update_AmpuleList()
end

HandleClicked_LUp_Ampule_SelectCategory = function(categoryIdx)
  -- function num : 0_12
  local self = FGlobal_DyeReNew_GetInstance()
  self._nowPaletteCategoryIndex = categoryIdx
  self._scrollStartIndex = 0
  ;
  ((UI.getChildControl)(self._AmpuleScroll, "Scroll_CtrlButton")):SetPosY(self._scrollStartIndex)
  self:Update_AmpuleList()
end

HandleOnOut_DyeReNew_Palette_Category_Tooltip = function(isOn, ButtonIndex)
  -- function num : 0_13
  local name = ""
  local desc = nil
  local Static_BG = (UI.getChildControl)(Panel_Dye_ReNew, "Static_BG")
  local UIAmpuleTargetBG = (UI.getChildControl)(Static_BG, "Static_AmpuleTartget_BG")
  if isOn == true then
    if ButtonIndex > 7 then
      local UICategory = nil
      if ButtonIndex == 8 then
        UICategory = (UI.getChildControl)(UIAmpuleTargetBG, "RadioButton_Tab_ALL")
        name = PAGetString(Defines.StringSheet_GAME, "LUA_PALETTE_TAB_ALL")
      else
        if ButtonIndex == 9 then
          UICategory = (UI.getChildControl)(UIAmpuleTargetBG, "RadioButton_Tab_My")
          name = PAGetString(Defines.StringSheet_GAME, "LUA_PALETTE_TAB_MY")
        else
          if ButtonIndex == 10 then
            UICategory = (UI.getChildControl)(UIAmpuleTargetBG, "RadioButton_Tab_Pearl")
            name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAUGE_DYEINGPACKEAGE_TITLE")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_PALETTE_TAB_MATERIAL_DESC_8")
          end
        end
      end
      registTooltipControl(UICategory, Panel_Tooltip_SimpleText)
      TooltipSimple_Show(UICategory, name, desc)
    else
      do
        do
          local UIMaterial = (UI.getChildControl)(UIAmpuleTargetBG, "RadioButton_Material_" .. ButtonIndex)
          name = PAGetString(Defines.StringSheet_GAME, "LUA_PALETTE_TAB_MATERIAL_" .. ButtonIndex)
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_PALETTE_TAB_MATERIAL_DESC_" .. ButtonIndex)
          registTooltipControl(UIMaterial, Panel_Tooltip_SimpleText)
          TooltipSimple_Show(UIMaterial, name, desc)
          TooltipSimple_Hide()
        end
      end
    end
  end
end

HandleClicked_LUp_Ampule_SelectedType = function(isShowAll, isPearl)
  -- function num : 0_14 , upvalues : UI_BUFFTYPE
  local self = FGlobal_DyeReNew_GetInstance()
  local selfPlayer = getSelfPlayer()
  do
    if isShowAll and isPearl then
      local dyeingPackageTime = (selfPlayer:get()):isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_DyeingPackage)
      if not dyeingPackageTime then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_MUST_ACTIVE_PEARLCOLOR"))
        return 
      end
    end
    if isPearl ~= self._isPearlPalette then
      ToClient_RequestClearDyeingSlot(self._selected_EquipSlotNo)
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DYE_NEW_PALETTE_PREVIEW_ACK"))
    end
    self._paletteShowAll = isShowAll
    self._scrollStartIndex = 0
    self._selectedCategoryIdx = 0
    self._isPearlPalette = isPearl
    ;
    ((UI.getChildControl)(self._AmpuleScroll, "Scroll_CtrlButton")):SetPosY(self._scrollStartIndex)
    self:Update_AmpuleList()
  end
end

HandleClicked_DeyReNew_Palette_SelectColor = function(dataIdx)
  -- function num : 0_15
  local self = FGlobal_DyeReNew_GetInstance()
  self._nowPaletteDataIndex = dataIdx
  if self._selected_EquipSlotNo == -1 or self._nowClickPartId == -1 then
    return 
  end
  local DyeingPaletteCategoryInfo = ToClient_requestGetPaletteCategoryInfo(self._nowPaletteCategoryIndex, self._paletteShowAll)
  local isDyeUI = true
  local ampuleCount = DyeingPaletteCategoryInfo:getCount(self._nowPaletteDataIndex, isDyeUI)
  local convertCount = tostring(ampuleCount)
  convertCount = tonumber(convertCount)
  if convertCount >= 1 then
    self._ampuleCountCheck = false
  else
    self._ampuleCountCheck = true
    if self._isPearlPalette == true then
      self._ampuleCountCheck = false
    end
  end
  ToClient_RequestSelectedDyeingPalette(self._selected_EquipSlotNo, self._nowClickPartId, self._nowClickPartSlotId, self._nowPaletteCategoryIndex, self._nowPaletteDataIndex, self._paletteShowAll)
  if ToClient_RequestGetPartDyeingSlotCount(self._selected_EquipSlotNo, 0) > 0 then
    (table.insert)(self._selectedDyePart, self._selected_EquipSlotNo)
  end
  Panel_Tooltip_Item_hideTooltip()
  self:Update_Part()
  self:Update_AmpuleList()
end

HandleOpen_RadioButton_AmpuleReset = function()
  -- function num : 0_16
  local Static_BG = (UI.getChildControl)(Panel_Dye_ReNew, "Static_BG")
  local UIAmpuleTargetBG = (UI.getChildControl)(Static_BG, "Static_AmpuleTartget_BG")
  local RadioButton_Tab_ALL = (UI.getChildControl)(UIAmpuleTargetBG, "RadioButton_Tab_ALL")
  local RadioButton_Tab_My = (UI.getChildControl)(UIAmpuleTargetBG, "RadioButton_Tab_My")
  local RadioButton_Tab_Pearl = (UI.getChildControl)(UIAmpuleTargetBG, "RadioButton_Tab_Pearl")
  RadioButton_Tab_ALL:SetCheck(false)
  RadioButton_Tab_My:SetCheck(true)
  RadioButton_Tab_Pearl:SetCheck(false)
end

HandleClicked_DyeReNew_SetEndurance = function()
  -- function num : 0_17
  local index = ((UI.getChildControl)(Panel_Dye_ReNew, "Slider_Endurance")):GetSelectIndex()
  ToClient_RequestChangeEndurance(index)
end

HandleClicked_DyeReNew_SetShowUnderwear = function()
  -- function num : 0_18
  local self = FGlobal_DyeReNew_GetInstance()
  self._bShowUnderwear = not self._bShowUnderwear
  ToClient_RequestToggleShowUnderwear()
end

HandleClicked_DyeReNew_SetHideAvartar = function()
  -- function num : 0_19
  local self = FGlobal_DyeReNew_GetInstance()
  self._bShowAvater = not self._bShowAvater
  ToClient_RequestToggleHideAvatar()
  self._selected_EquipSlotNo = -1
  self:Change_EquipIcon()
  self:Update_Part()
  self:Update_AmpuleList()
end

HandleClicked_DyeReNew_ToggleWarStance = function()
  -- function num : 0_20
  local self = FGlobal_DyeReNew_GetInstance()
  self._bWarStance = not self._bWarStance
  ToClient_RequestSetBattleView(self._bWarStance)
end

HandleClicked_DyeReNew_SetFaceViewHair = function()
  -- function num : 0_21
  local self = FGlobal_DyeReNew_GetInstance()
  self._bFaceVeiwHair = not self._bFaceVeiwHair
  ToClient_setFaceViewHair(self._bFaceVeiwHair)
end

HandleClicked_DyeReNew_SetHideHelmet = function()
  -- function num : 0_22
  local self = FGlobal_DyeReNew_GetInstance()
  self._bHideHelmet = not self._bHideHelmet
  ToClient_RequestHideHelmet(self._bHideHelmet)
end

HandleClicked_DyeReNew_SetFaceGuard = function()
  -- function num : 0_23
  local self = FGlobal_DyeReNew_GetInstance()
  self._bOpenFaceGuard = not self._bOpenFaceGuard
  ToClient_RequestHideBattleHelmet(self._bOpenFaceGuard)
end

HandleClicked_DyeReNew_SetAwakenWeapon = function()
  -- function num : 0_24
  local self = FGlobal_DyeReNew_GetInstance()
  self._bShowAwakenWeapon = not self._bShowAwakenWeapon
  ToClient_SetAwakenWeaponShow(self._bShowAwakenWeapon)
end

HandleOver_DyeReNew_SimpleTooltipCheckbutton = function(isShow, tipType)
  -- function num : 0_25 , upvalues : enToggleIndex
  local name, desc, control = nil, nil, nil
  if enToggleIndex.Underwear == tipType then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_SHOWUNDERWEAR")
    control = (UI.getChildControl)(Panel_Dye_ReNew, "CheckButton_ShowUnderWear")
  else
    if enToggleIndex.Avater == tipType then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_HIDEAVATAR")
      control = (UI.getChildControl)(Panel_Dye_ReNew, "CheckButton_HideAvatar")
    else
      if enToggleIndex.Helmet == tipType then
        name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_HIDEHELM")
        control = (UI.getChildControl)(Panel_Dye_ReNew, "CheckButton_HideHelmet")
      else
        if enToggleIndex.AwakenWeapon == tipType then
          name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_AWAKENWEAPON")
          control = (UI.getChildControl)(Panel_Dye_ReNew, "CheckButton_AwakenWeapon")
        else
          if enToggleIndex.FaceViewHair == tipType then
            name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_HIDHAIR")
            control = (UI.getChildControl)(Panel_Dye_ReNew, "CheckButton_HideHair")
          else
            if enToggleIndex.FaceGuard == tipType then
              name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_OPENHELM")
              control = (UI.getChildControl)(Panel_Dye_ReNew, "CheckButton_OpenFaceGuard")
            else
              if enToggleIndex.WarStance == tipType then
                name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_TOOLTIP_WARSTANCE")
                control = (UI.getChildControl)(Panel_Dye_ReNew, "CheckButton_WarStance")
              end
            end
          end
        end
      end
    end
  end
  registTooltipControl(control, Panel_Tooltip_SimpleText)
  if isShow == true then
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

HandleClicked_DeyReNew_DoDye = function()
  -- function num : 0_26 , upvalues : dyePartString
  local self = FGlobal_DyeReNew_GetInstance()
  local _dyePartString = ""
  local equipSlotNo = self._selected_EquipSlotNo
  if self._nowPaletteDataIndex == -1 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DYE_NEW_FIRSTSELECTDYENOGETITEM"))
    return 
  end
  if self._ampuleCountCheck == true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DYE_AMPULEALERT"))
    return 
  end
  local noAction = function()
    -- function num : 0_26_0
    return 
  end

  local doDye = function()
    -- function num : 0_26_1 , upvalues : self
    ToClient_RequestDye(self._isPearlPalette)
    FGlobal_Panel_DyeReNew_Hide()
  end

  local askDoDye = function()
    -- function num : 0_26_2 , upvalues : _dyePartString, doDye, noAction
    local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE")
    local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "PANEL_DYENEW_SURE_DYE_THIS_PART", "partString", _dyePartString)
    local messageBoxData = {title = messageBoxTitle, content = messageBoxMemo, functionYes = doDye, functionNo = noAction, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
    return 
  end

  local alreadyPearlDye = function()
    -- function num : 0_26_3 , upvalues : askDoDye, noAction
    local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE")
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_ALREADY_PEARLCOLOR")
    local messageBoxData = {title = messageBoxTitle, content = messageBoxMemo, functionYes = askDoDye, functionNo = noAction, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
    return 
  end

  ;
  (table.sort)(self._selectedDyePart)
  for index,value in pairs(self._selectedDyePart) do
    if _dyePartString == "" then
      _dyePartString = "<" .. (dyePartString[self._selected_CharacterTarget])[(self._selectedDyePart)[index]] .. ">"
    else
      if (self._selectedDyePart)[index] ~= (self._selectedDyePart)[index - 1] then
        _dyePartString = _dyePartString .. ", <" .. (dyePartString[self._selected_CharacterTarget])[(self._selectedDyePart)[index]] .. ">"
      end
    end
  end
  if self._isPearlPalette then
    local isAlreadyDye = ToClient_isAllreadyDyeing(equipSlotNo)
    if isAlreadyDye == true then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_ALREADY_NORMALCOLOR"))
      return 
    else
      if _dyePartString == "" then
        doDye()
      else
        askDoDye()
      end
    end
  else
    do
      local isAlreadyPearlDye = ToClient_isExpirationDyeing(equipSlotNo)
      if isAlreadyPearlDye == true then
        alreadyPearlDye()
      else
        if _dyePartString == "" then
          doDye()
        else
          askDoDye()
        end
      end
    end
  end
end

HandleClicked_DyeReNew_SetShowUI = function()
  -- function num : 0_27
  if Panel_Dye_ReNew:GetShow() then
    Panel_Dye_ReNew:SetShow(false)
    Panel_Window_Inventory:SetShow(false)
  else
    Panel_Dye_ReNew:SetShow(true)
    Panel_Window_Inventory:SetShow(true)
  end
end


