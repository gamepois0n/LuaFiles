-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\inventory\panel_window_inventory.luac 

-- params : ...
-- function num : 0
Panel_Window_Inventory:SetShow(false, false)
Panel_Window_Inventory:ActiveMouseEventEffect(true)
Panel_Window_Inventory:setMaskingChild(true)
Panel_Window_Inventory:setGlassBackground(true)
Panel_Window_Inventory:RegisterShowEventFunc(true, "InventoryShowAni()")
Panel_Window_Inventory:RegisterShowEventFunc(false, "InventoryHideAni()")
Panel_Invertory_Manufacture_BG:SetShow(false)
Panel_Invertory_ExchangeButton:SetShow(false)
Panel_Window_Inventory:RegisterUpdateFunc("Inventory_UpdatePerFrame")
Panel_Inventory_CoolTime_Effect_Item_Slot:RegisterShowEventFunc(true, "Inventory_ItemCoolTimeEffect_ShowAni()")
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local IM = CppEnums.EProcessorInputMode
local UI_color = Defines.Color
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_TISNU = CppEnums.TInventorySlotNoUndefined
local UI_TM = CppEnums.TextMode
local UCT_STATICTEXT = (CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT
local isFirstTab = true
local openUiType = nil
local openWhereIs = false
local over_SlotEffect = nil
Panel_Inventory_isBlackStone_16001 = false
Panel_Inventory_isBlackStone_16002 = false
Panel_Inventory_isSocketItem = false
local radioButtonManu = (UI.getChildControl)(Panel_Invertory_Manufacture_BG, "Button_Manufacture")
local radioButtonNote = (UI.getChildControl)(Panel_Invertory_Manufacture_BG, "Button_Note")
local _btn_WayPoint = (UI.getChildControl)(Panel_Invertory_ExchangeButton, "Button_WayPoint")
local _btn_Widget = (UI.getChildControl)(Panel_Invertory_ExchangeButton, "Button_Widget")
local btn_AlchemyStone = (UI.getChildControl)(Panel_Window_Inventory, "Button_AlchemyStone")
local btn_AlchemyFigureHead = (UI.getChildControl)(Panel_Window_Inventory, "Button_AlchemyFigureHead")
local btn_DyePalette = (UI.getChildControl)(Panel_Window_Inventory, "Button_Palette")
local icon_TrashOn = (UI.getChildControl)(Panel_Window_Inventory, "Button_TrashOn")
local icon_TrashSequence = (UI.getChildControl)(Panel_Window_Inventory, "Button_TrashAlert")
local isAlchemyStoneEnble = ToClient_IsContentsGroupOpen("35")
if isAlchemyStoneEnble then
  btn_AlchemyStone:SetShow(true)
else
  btn_AlchemyStone:SetShow(false)
end
local isAlchemyFigureHeadEnble = ToClient_IsContentsGroupOpen("44")
if isAlchemyFigureHeadEnble then
  btn_AlchemyFigureHead:SetShow(true)
else
  btn_AlchemyFigureHead:SetShow(false)
end
local isItemLock = ToClient_IsContentsGroupOpen("219")
local burnItemTime = -1
local effectScene = {
newItem = {}
}
local inven = {
slotConfig = {createIcon = true, createBorder = true, createCount = true, createEnchant = true, createCooltime = true, createExpiration = true, createExpirationBG = true, createExpiration2h = true, createClassEquipBG = true, createEnduranceIcon = true, createCooltimeText = true, createCash = true, createItemLock = true, createBagIcon = true, createSoulComplete = true}
, 
config = {slotCount = 64, slotCols = 8, slotRows = 0, slotStartX = 19, slotStartY = 93, slotGapX = 48, slotGapY = 47, slotEnchantX = 13, slotEnchantY = 76}
, startSlotIndex = 0, _slotsBackground = (Array.new)(), slots = (Array.new)(), 
slotEtcData = {}
, staticTitle = (UI.getChildControl)(Panel_Window_Inventory, "Static_Text_Title"), staticCapacity = (UI.getChildControl)(Panel_Window_Inventory, "Static_Text_Capacity"), buttonClose = (UI.getChildControl)(Panel_Window_Inventory, "Button_Win_Close"), staticMoney = (UI.getChildControl)(Panel_Window_Inventory, "Static_Text_Money"), buttonMoney = (UI.getChildControl)(Panel_Window_Inventory, "Button_Money"), buttonPearl = (UI.getChildControl)(Panel_Window_Inventory, "Static_PearlIcon"), valuePearl = (UI.getChildControl)(Panel_Window_Inventory, "StaticText_PearlValue"), buttonMileage = (UI.getChildControl)(Panel_Window_Inventory, "Static_MileageIcon"), valueMileage = (UI.getChildControl)(Panel_Window_Inventory, "StaticText_MileageValue"), checkButton_Sort = (UI.getChildControl)(Panel_Window_Inventory, "CheckButton_ItemSort"), staticTxtWeight = (UI.getChildControl)(Panel_Window_Inventory, "StaticText_Weight"), staticWeight = (UI.getChildControl)(Panel_Window_Inventory, "Static_Text_Weight"), weightGaugeBG = (UI.getChildControl)(Panel_Window_Inventory, "Static_Texture_Weight_Background"), weightItem = (UI.getChildControl)(Panel_Window_Inventory, "Progress2_Weight"), weightEquipment = (UI.getChildControl)(Panel_Window_Inventory, "Progress2_Equipment"), weightMoney = (UI.getChildControl)(Panel_Window_Inventory, "Progress2_Money"), weightIcon = (UI.getChildControl)(Panel_Window_Inventory, "Static_WeightIcon"), enchantNumber = (UI.getChildControl)(Panel_Window_Inventory, "Static_Text_Slot_Enchant_value"), slotBackground = (UI.getChildControl)(Panel_Window_Inventory, "Static_Slot_BG"), button_Puzzle = (UI.getChildControl)(Panel_Window_Inventory, "Button_Puzzle"), radioButtonNormaiInven = (UI.getChildControl)(Panel_Window_Inventory, "RadioButton_NormalInventory"), radioButtonCashInven = (UI.getChildControl)(Panel_Window_Inventory, "RadioButton_CashInventory"), radioButtonStd = (UI.getChildControl)(Panel_Window_Inventory, "RadioButton_Std"), radioButtonTransport = (UI.getChildControl)(Panel_Window_Inventory, "RadioButton_Transport"), radioButtonHousing = (UI.getChildControl)(Panel_Window_Inventory, "RadioButton_Housing"), _baseSlot = (UI.getChildControl)(Panel_Window_Inventory, "Static_Slot"), _baseLockSlot = (UI.getChildControl)(Panel_Window_Inventory, "Static_LockedSlot"), _expire2h = (UI.getChildControl)(Panel_Window_Inventory, "Static_Expire_2h"), _scroll = (UI.getChildControl)(Panel_Window_Inventory, "Scroll_CashInven"), cashScrollArea = (UI.getChildControl)(Panel_Window_Inventory, "Scroll_Area"), trashArea = (UI.getChildControl)(Panel_Window_Inventory, "Button_Trash"), filterFunc = nil, rClickFunc = nil, otherWindowOpenFunc = nil, isHiding = false, effect = nil, _tooltipWhereType = nil, _tooltipSlotNo = nil, orgPosX = Panel_Window_Inventory:GetPosX(), orgPosY = Panel_Window_Inventory:GetPosY()}
FGlobal_Inventory_GetInven = function()
  -- function num : 0_0 , upvalues : inven
  return inven
end

local whereUseItemSlotNo, whereUseItemSSW = nil, nil
local btn_Manufacture = (UI.getChildControl)(Panel_Window_Inventory, "Button_Manufacture")
local _buttonQuestion = (UI.getChildControl)(Panel_Window_Inventory, "Button_Question")
_buttonQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelWindowInventory\" )")
_buttonQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelWindowInventory\", \"true\")")
_buttonQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelWindiowInventory\", \"false\")")
local checkPopUp = (UI.getChildControl)(Panel_Window_Inventory, "CheckButton_PopUp")
checkPopUp:addInputEvent("Mouse_LUp", "InventoryWindow_CheckPopUpUI()")
checkPopUp:addInputEvent("Mouse_On", "Inventory_PopUp_ShowIconToolTip(true)")
checkPopUp:addInputEvent("Mouse_Out", "Inventory_PopUp_ShowIconToolTip(false)")
local isPopUpContentsEnable = ToClient_IsContentsGroupOpen("240")
checkPopUp:SetShow(isPopUpContentsEnable)
local helpWidgetBase = (UI.getChildControl)(Panel_CheckedQuest, "StaticText_Notice_1")
local FilterRadioTooltip = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_Window_Inventory, "HelpWindow_For_InvenFilterRadio")
CopyBaseProperty(helpWidgetBase, FilterRadioTooltip)
FilterRadioTooltip:SetColor(UI_color.C_FFFFFFFF)
FilterRadioTooltip:SetAlpha(1)
FilterRadioTooltip:SetFontColor(UI_color.C_FFC4BEBE)
FilterRadioTooltip:SetAutoResize(true)
FilterRadioTooltip:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
FilterRadioTooltip:SetShow(false)
PaGlobal_Inventory = {_itemKeyForTutorial = nil, _isItemSlotRClickedForTutorial = false}
-- DECOMPILER ERROR at PC482: Confused about usage of register: R36 in 'UnsetPending'

PaGlobal_Inventory.addSlotEffectForTutorial = function(self, slot, effectString, isLoop, posX, posY)
  -- function num : 0_1
  (slot.icon):AddEffect(effectString, isLoop, posX, posY)
  ;
  (PaGlobal_TutorialUiManager:getUiMasking()):showInventoryMasking((slot.icon):GetPosX(), (slot.icon):GetPosY())
end

-- DECOMPILER ERROR at PC485: Confused about usage of register: R36 in 'UnsetPending'

PaGlobal_Inventory.setItemKeyForTutorial = function(self, itemKey)
  -- function num : 0_2
  self._itemKeyForTutorial = itemKey
end

-- DECOMPILER ERROR at PC488: Confused about usage of register: R36 in 'UnsetPending'

PaGlobal_Inventory.clearItemKeyForTutorial = function(self, itemKey)
  -- function num : 0_3
  self._itemKeyForTutorial = nil
end

-- DECOMPILER ERROR at PC491: Confused about usage of register: R36 in 'UnsetPending'

PaGlobal_Inventory.isItemSlotRClickedForTutorial = function(self)
  -- function num : 0_4
  return self._isItemSlotRClickedForTutorial
end

-- DECOMPILER ERROR at PC494: Confused about usage of register: R36 in 'UnsetPending'

PaGlobal_Inventory.setIsitemSlotRClickedForTutorial = function(self, bool)
  -- function num : 0_5
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R2 in 'UnsetPending'

  PaGlobal_Inventory._isItemSlotRClickedForTutorial = bool
end

-- DECOMPILER ERROR at PC497: Confused about usage of register: R36 in 'UnsetPending'

PaGlobal_Inventory.findItemWrapper = function(self, itemWhereType, targetItemKey, targetEnchantLevel)
  -- function num : 0_6
  local inventory = ((getSelfPlayer()):get()):getInventoryByType(itemWhereType)
  if inventory == nil then
    return false
  end
  local invenMaxSize = inventory:sizeXXX()
  for ii = 0, invenMaxSize - 1 do
    local itemWrapper = getInventoryItem(ii)
    if itemWrapper ~= nil then
      local itemKey = ((itemWrapper:get()):getKey()):getItemKey()
      local enchantLevel = ((itemWrapper:get()):getKey()):getEnchantLevel()
      if itemKey == targetItemKey then
        if targetEnchantLevel == nil then
          return itemWrapper
        else
          if targetEnchantLevel ~= nil and enchantLevel == targetEnchantLevel then
            return itemWrapper
          end
        end
      end
    end
  end
  return nil
end

;
(inven.staticTxtWeight):addInputEvent("Mouse_On", "Panel_Inventory_WeightHelpFunc( true )")
;
(inven.staticTxtWeight):addInputEvent("Mouse_Out", "Panel_Inventory_WeightHelpFunc( false )")
;
(inven.staticWeight):addInputEvent("Mouse_On", "Panel_Inventory_WeightHelpFunc( true )")
;
(inven.staticWeight):addInputEvent("Mouse_Out", "Panel_Inventory_WeightHelpFunc( false )")
;
(inven.weightGaugeBG):addInputEvent("Mouse_On", "Panel_Inventory_WeightHelpFunc( true )")
;
(inven.weightGaugeBG):addInputEvent("Mouse_Out", "Panel_Inventory_WeightHelpFunc( false )")
;
(inven.weightIcon):addInputEvent("Mouse_On", "Panel_Inventory_WeightHelp( true )")
;
(inven.weightIcon):addInputEvent("Mouse_Out", "Panel_Inventory_WeightHelp( false )")
local weightHelp = {_weightHelp_BG = (UI.getChildControl)(Panel_Window_Inventory, "Static_WeightHelp_BG"), _weightHelp = (UI.getChildControl)(Panel_Window_Inventory, "StaticText_Weight_Help"), _equipHelp = (UI.getChildControl)(Panel_Window_Inventory, "StaticText_Equip_Help"), _moneyHelp = (UI.getChildControl)(Panel_Window_Inventory, "StaticText_MoneyHelp")}
Panel_Inventory_WeightHelpFunc = function(isOn)
  -- function num : 0_7 , upvalues : weightHelp
  local selfPlayerWrapper = getSelfPlayer()
  local selfPlayer = selfPlayerWrapper:get()
  local s64_moneyWeight = (selfPlayer:getInventory()):getMoneyWeight_s64()
  local s64_equipmentWeight = (selfPlayer:getEquipment()):getWeight_s64()
  local s64_allWeight = selfPlayer:getCurrentWeight_s64()
  local s64_maxWeight = selfPlayer:getPossessableWeight_s64()
  local moneyWeight = Int64toInt32(s64_moneyWeight) / 10000
  local equipmentWeight = Int64toInt32(s64_equipmentWeight) / 10000
  local allWeight = Int64toInt32(s64_allWeight) / 10000
  local maxWeight = Int64toInt32(s64_maxWeight) / 10000
  local invenWeight = allWeight - equipmentWeight - moneyWeight
  if isOn == true then
    (weightHelp._weightHelp):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_WEIGHTHELP_1") .. (string.format)("%.1f", invenWeight) .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT") .. "(" .. (string.format)("%.1f", invenWeight / maxWeight * 100) .. "%)")
    ;
    (weightHelp._equipHelp):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_EQUIPHELP_1") .. (string.format)("%.1f", equipmentWeight) .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT") .. "(" .. (string.format)("%.1f", equipmentWeight / maxWeight * 100) .. "%)")
    ;
    (weightHelp._moneyHelp):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_MONEYHELP_1") .. (string.format)("%.1f", moneyWeight) .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT") .. "(" .. (string.format)("%.1f", moneyWeight / maxWeight * 100) .. "%)")
    Panel_Window_Inventory:SetChildIndex(weightHelp._weightHelp_BG, 9000)
    Panel_Window_Inventory:SetChildIndex(weightHelp._weightHelp, 9999)
    Panel_Window_Inventory:SetChildIndex(weightHelp._equipHelp, 9999)
    Panel_Window_Inventory:SetChildIndex(weightHelp._moneyHelp, 9999)
    for _,value in pairs(weightHelp) do
      value:SetShow(true)
    end
  else
    do
      for _,value in pairs(weightHelp) do
        value:SetShow(false)
      end
    end
  end
end

Panel_Inventory_WeightHelp = function(bool)
  -- function num : 0_8 , upvalues : weightHelp
  local _const = Defines.s64_const
  local selfPlayer = (getSelfPlayer()):get()
  local s64_allWeight = selfPlayer:getCurrentWeight_s64()
  local s64_maxWeight = selfPlayer:getPossessableWeight_s64()
  local s64_maxWeight_div = s64_maxWeight / _const.s64_100
  local weightPercent = Int64toInt32(s64_allWeight / s64_maxWeight_div)
  ;
  (weightHelp._weightHelp):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INVENTORY_TEXT_WEIGHTHELP", "weightPercent", weightPercent))
  ;
  (weightHelp._equipHelp):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_WEIGHTHELP_3"))
  ;
  (weightHelp._moneyHelp):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_WEIGHTHELP_4"))
  if bool == true then
    for _,value in pairs(weightHelp) do
      value:SetShow(true)
    end
  else
    do
      for _,value in pairs(weightHelp) do
        value:SetShow(false)
      end
    end
  end
end

local _puzzleMessage = nil
local _puzzleNotice = (UI.getChildControl)(Panel_Window_Inventory, "Static_Notice")
local _puzzleNoticeStyle = (UI.getChildControl)(Panel_Window_Inventory, "StaticText_Notice")
local _puzzleNoticeText = (UI.createControl)(UCT_STATICTEXT, _puzzleNotice, "puzzleNoticeText")
CopyBaseProperty(_puzzleNoticeStyle, _puzzleNoticeText)
;
(UI.deleteControl)(_puzzleNoticeStyle)
_puzzleNoticeStyle = nil
_puzzleNoticeText:SetSpanSize(20, 0)
InventoryShowAni = function()
  -- function num : 0_9 , upvalues : inven, isFirstTab, UI_ANI_ADV
  local self = inven
  ;
  (UIAni.fadeInSCR_Left)(Panel_Window_Inventory)
  isFirstTab = false
  local aniInfo1 = Panel_Window_Inventory:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.05)
  aniInfo1.AxisX = Panel_Window_Inventory:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Window_Inventory:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_Window_Inventory:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.05)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Window_Inventory:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Window_Inventory:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

InventoryHideAni = function()
  -- function num : 0_10 , upvalues : UI_ANI_ADV, UI_color, _puzzleNotice
  Panel_Window_Inventory:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_Window_Inventory:addColorAnimation(0, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
  _puzzleNotice:SetShow(false)
end

Inventory_ItemCoolTimeEffect_ShowAni = function()
  -- function num : 0_11
  local coolTime_Hide = (UIAni.AlphaAnimation)(0, Panel_Inventory_CoolTime_Effect_Item_Slot, 0, 0.7)
  coolTime_Hide:SetHideAtEnd(true)
end

inven.init = function(self)
  -- function num : 0_12 , upvalues : btn_AlchemyStone, btn_AlchemyFigureHead, btn_DyePalette, btn_Manufacture
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  (self.config).slotRows = (self.config).slotCount / (self.config).slotCols
  ;
  (self.enchantNumber):SetShow(false)
  ;
  (self.radioButtonNormaiInven):addInputEvent("Mouse_LUp", "Inventory_Tab()")
  ;
  (self.radioButtonCashInven):addInputEvent("Mouse_LUp", "Inventory_Tab()")
  ;
  (self.radioButtonStd):addInputEvent("Mouse_LUp", "Inventory_TabSound()")
  ;
  (self.radioButtonTransport):addInputEvent("Mouse_LUp", "Inventory_TabSound()")
  ;
  (self.radioButtonHousing):addInputEvent("Mouse_LUp", "Inventory_TabSound()")
  ;
  (self.radioButtonStd):addInputEvent("Mouse_On", "Inventory_FilterRadioTooltip_Show( true, " .. 0 .. ")")
  ;
  (self.radioButtonTransport):addInputEvent("Mouse_On", "Inventory_FilterRadioTooltip_Show( true, " .. 1 .. ")")
  ;
  (self.radioButtonHousing):addInputEvent("Mouse_On", "Inventory_FilterRadioTooltip_Show( true, " .. 2 .. ")")
  ;
  (self.radioButtonStd):addInputEvent("Mouse_Out", "Inventory_FilterRadioTooltip_Show( false )")
  ;
  (self.radioButtonTransport):addInputEvent("Mouse_Out", "Inventory_FilterRadioTooltip_Show( false )")
  ;
  (self.radioButtonHousing):addInputEvent("Mouse_Out", "Inventory_FilterRadioTooltip_Show( false )")
  btn_AlchemyStone:addInputEvent("Mouse_LUp", "HandleClicked_Inventory_Function( " .. 0 .. " )")
  btn_AlchemyFigureHead:addInputEvent("Mouse_LUp", "HandleClicked_Inventory_Function( " .. 1 .. " )")
  btn_DyePalette:addInputEvent("Mouse_LUp", "HandleClicked_Inventory_Function( " .. 2 .. " )")
  btn_Manufacture:addInputEvent("Mouse_LUp", "HandleClicked_Inventory_Function( " .. 3 .. " )")
  ;
  (self.trashArea):addInputEvent("Mouse_LUp", "HandleClicked_Inventory_ItemDelete()")
  ;
  (self.trashArea):addInputEvent("Mouse_On", "Inventory_TrashToolTip( true )")
  ;
  (self.trashArea):addInputEvent("Mouse_Out", "Inventory_TrashToolTip( false )")
  ;
  (UIScroll.InputEvent)(self._scroll, "Inventory_CashTabScroll")
  ;
  (UIScroll.InputEventByControl)(self.cashScrollArea, "Inventory_CashTabScroll")
  if isGameTypeJapan() or isGameTypeRussia() then
    (self.radioButtonCashInven):SetTextSpan(40, 7)
    ;
    (self.radioButtonNormaiInven):SetTextSpan(50, 7)
  else
    if getGameServiceType() == 0 or getGameServiceType() == 1 or getGameServiceType() == 2 or getGameServiceType() == 3 or getGameServiceType() == 4 then
      (self.radioButtonCashInven):SetTextSpan(50, 7)
      ;
      (self.radioButtonNormaiInven):SetTextSpan(60, 7)
    end
  end
  local sortBtn_sizeX = (self.checkButton_Sort):GetSizeX()
  local sortBtn_TextSizeX = (self.checkButton_Sort):GetTextSizeX()
  ;
  (self.checkButton_Sort):SetEnableArea(0, 0, 100, (self.checkButton_Sort):GetSizeY())
  local btnNormalSizeX = (self.radioButtonNormaiInven):GetSizeX() + 23
  local btnNormalTextPosX = btnNormalSizeX - btnNormalSizeX / 2 - (self.radioButtonNormaiInven):GetTextSizeX() / 2
  local btnCashSizeX = (self.radioButtonCashInven):GetSizeX() + 23
  local btnCashTextPosX = btnCashSizeX - btnCashSizeX / 2 - (self.radioButtonCashInven):GetTextSizeX() / 2
  local btnManufactureSizeX = btn_Manufacture:GetSizeX() + 23
  local btnManufactureTextPosX = btnManufactureSizeX - btnManufactureSizeX / 2 - btn_Manufacture:GetTextSizeX() / 2
  local btnAlchemyStoneSizeX = btn_AlchemyStone:GetSizeX() + 23
  local btnAlchemyStoneTextPosX = btnAlchemyStoneSizeX - btnAlchemyStoneSizeX / 2 - btn_AlchemyStone:GetTextSizeX() / 2
  local btnAlchemyFigureSizeX = btn_AlchemyFigureHead:GetSizeX() + 23
  local btnAlchemyFigureTextPosX = btnAlchemyFigureSizeX - btnAlchemyFigureSizeX / 2 - btn_AlchemyFigureHead:GetTextSizeX() / 2
  local btnDyePaletteSizeX = btn_DyePalette:GetSizeX() + 23
  local btnDyePaletteTextPosX = btnDyePaletteSizeX - btnDyePaletteSizeX / 2 - btn_DyePalette:GetTextSizeX() / 2
  ;
  (self.radioButtonNormaiInven):SetTextSpan(btnNormalTextPosX, 5)
  ;
  (self.radioButtonCashInven):SetTextSpan(btnCashTextPosX, 5)
  btn_Manufacture:SetTextSpan(btnManufactureTextPosX, 5)
  btn_AlchemyStone:SetTextSpan(btnAlchemyStoneTextPosX, 5)
  btn_AlchemyFigureHead:SetTextSpan(btnAlchemyFigureTextPosX, 5)
  btn_DyePalette:SetTextSpan(btnDyePaletteTextPosX, 5)
end

Inventory_Tab = function()
  -- function num : 0_13 , upvalues : inven
  PaGlobal_FixEquip:StreamRecoveryStop()
  local self = inven
  self.startSlotIndex = 0
  if DragManager:isDragging() then
    DragManager:clearInfo()
  end
  Inventory_TabSound()
  Inventory_DropEscape()
  if Panel_Window_ClothInventory:GetShow() then
    ClothInventory_Close()
  end
end

HandleClicked_Inventory_Function = function(functionType)
  -- function num : 0_14
  if DragManager:isDragging() then
    DragManager:clearInfo()
  end
  if functionType == 0 then
    FGlobal_AlchemyStone_Open()
  else
    if functionType == 1 then
      FGlobal_AlchemyFigureHead_Open()
    else
      if functionType == 2 then
        HandleClicked_Inventory_Palette_Open()
      else
        if functionType == 3 then
          Inventory_ManufactureBTN()
        end
      end
    end
  end
end

Inventory_TabSound = function()
  -- function num : 0_15 , upvalues : isFirstTab
  if DragManager:isDragging() then
    DragManager:clearInfo()
  end
  if isFirstTab == true then
    isFirstTab = false
  else
    audioPostEvent_SystemUi(0, 0)
  end
  Inventory_updateSlotData()
  Inventory_CashTabScroll(true)
end

ConsoleGroupCreate_Panel_Window_Inventory = function()
  -- function num : 0_16 , upvalues : inven, btn_AlchemyFigureHead, btn_AlchemyStone, btn_Manufacture, btn_DyePalette, radioButtonManu, radioButtonNote, _btn_WayPoint, _btn_Widget
  local group_0 = Panel_Window_Inventory:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_INVENTORY)
  group_0:addControl(0, 0, 5, 1, inven.radioButtonNormaiInven)
  group_0:addControl(1, 0, 5, 1, inven.radioButtonCashInven)
  group_0:addControl(2, 0, 5, 1, inven.radioButtonStd)
  group_0:addControl(3, 0, 5, 1, inven.radioButtonTransport)
  group_0:addControl(4, 0, 5, 1, inven.radioButtonHousing)
  local group_2 = Panel_Window_Inventory:addConsoleUIGroup(2, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_INVENTORY)
  group_2:addControl(0, 0, 4, 1, btn_AlchemyFigureHead)
  group_2:addControl(1, 0, 4, 1, btn_AlchemyStone)
  group_2:addControl(2, 0, 4, 1, btn_Manufacture)
  group_2:addControl(3, 0, 4, 1, btn_DyePalette)
  local group_3 = Panel_Window_Inventory:addConsoleUIGroup(3, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_INVENTORY)
  group_3:addControl(0, 0, 3, 1, inven.staticWeight)
  group_3:addControl(1, 0, 3, 1, inven.buttonMoney)
  group_3:addControl(2, 0, 3, 1, inven.trashArea)
  local manuGroup = Panel_Invertory_Manufacture_BG:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_INVENTORY)
  manuGroup:addControl(0, 0, 2, 1, radioButtonManu)
  manuGroup:addControl(1, 0, 2, 1, radioButtonNote)
  local exchangeGroup = Panel_Invertory_ExchangeButton:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_INVENTORY)
  exchangeGroup:addControl(0, 0, 2, 1, _btn_WayPoint)
  exchangeGroup:addControl(1, 0, 2, 1, _btn_Widget)
end

Inventory_ScrollUpEvent = function()
  -- function num : 0_17
  Inventory_CashTabScroll(true)
end

Inventory_ScrollDownEvent = function()
  -- function num : 0_18
  Inventory_CashTabScroll(false)
end

inven.createSlot = function(self)
  -- function num : 0_19 , upvalues : UI_PUCT, inven, _puzzleNotice
  ConsoleGroupCreate_Panel_Window_Inventory()
  local group_1 = Panel_Window_Inventory:addConsoleUIGroup(1, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_INVENTORY)
  group_1:setConsoleKeyEventForLUA("Inventory_ScrollUpEvent", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_UP)
  group_1:setConsoleKeyEventForLUA("Inventory_ScrollDownEvent", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_DOWN)
  for ii = 0, (self.config).slotCount - 1 do
    local slot = {}
    slot.empty = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Window_Inventory, "Inventory_Slot_Base_" .. ii)
    slot.lock = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Window_Inventory, "Inventory_Slot_Lock_" .. ii)
    group_1:addControl(ii % 8, ii / 8, 8, 8, slot.empty)
    CopyBaseProperty(self._baseSlot, slot.empty)
    CopyBaseProperty(self._baseLockSlot, slot.lock)
    ;
    (UIScroll.InputEventByControl)(slot.empty, "Inventory_CashTabScroll")
    local row = (math.floor)(ii / (self.config).slotCols)
    local col = ii % (self.config).slotCols
    ;
    (slot.empty):SetPosX((self.config).slotStartX + (self.config).slotGapX * col)
    ;
    (slot.empty):SetPosY((self.config).slotStartY + (self.config).slotGapY * row)
    ;
    (slot.lock):SetPosX((self.config).slotStartX + (self.config).slotGapX * col)
    ;
    (slot.lock):SetPosY((self.config).slotStartY + (self.config).slotGapY * row)
    ;
    (slot.empty):SetShow(false)
    ;
    (slot.lock):SetShow(false)
    -- DECOMPILER ERROR at PC124: Confused about usage of register: R9 in 'UnsetPending'

    ;
    (self._slotsBackground)[ii] = slot
  end
  local useStartSlot = inventorySlotNoUserStart()
  for ii = 0, (self.config).slotCount - 1 do
    local slotNo = ii + useStartSlot
    local slot = {}
    ;
    (SlotItem.new)(slot, "ItemIcon_" .. ii, ii, Panel_Window_Inventory, self.slotConfig)
    slot:createChild()
    CopyBaseProperty(self.enchantNumber, slot.enchantText)
    ;
    (slot.enchantText):SetSize((slot.icon):GetSizeX(), (slot.icon):GetSizeY())
    ;
    (slot.enchantText):SetPosX(0)
    ;
    (slot.enchantText):SetPosY(0)
    ;
    (slot.enchantText):SetTextHorizonCenter()
    ;
    (slot.enchantText):SetTextVerticalCenter()
    ;
    (slot.icon):addInputEvent("Mouse_RUp", "Inventory_SlotRClick(" .. ii .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_LDown", "Inventory_SlotLClick(" .. ii .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_LUp", "Inventory_DropHandler(" .. ii .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_PressMove", "Inventory_SlotDrag(" .. ii .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_On", "Inventory_IconOver(" .. ii .. ")")
    ;
    (slot.icon):addInputEvent("Mouse_Out", "Inventory_IconOut(" .. ii .. ")")
    ;
    (UIScroll.InputEventByControl)(slot.icon, "Inventory_CashTabScroll")
    ;
    (slot.icon):SetAutoDisableTime(0.5)
    local row = (math.floor)(ii / (self.config).slotCols)
    local col = ii % (self.config).slotCols
    ;
    (slot.icon):SetPosX((self.config).slotStartX + (self.config).slotGapX * col)
    ;
    (slot.icon):SetPosY((self.config).slotStartY + (self.config).slotGapY * row)
    ;
    (slot.icon):SetEnableDragAndDrop(true)
    slot.isEmpty = true
    Panel_Tooltip_Item_SetPosition(ii, slot, "inventory")
    slot.background = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_Window_Inventory, "Inventory_Slot_BG_" .. ii)
    CopyBaseProperty(self.slotBackground, slot.background)
    ;
    (slot.background):SetSize((slot.icon):GetSizeX(), (slot.icon):GetSizeY())
    ;
    (slot.background):SetPosX((slot.icon):GetPosX())
    ;
    (slot.background):SetPosY((slot.icon):GetPosY())
    ;
    (slot.background):SetShow(false)
    -- DECOMPILER ERROR at PC309: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (self.slots)[ii] = slot
    local effectSlot = {}
    local puzzle = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, slot.icon, "Puzzle_Control_" .. ii)
    CopyBaseProperty(inven.button_Puzzle, puzzle)
    puzzle:SetShow(false)
    puzzle:addInputEvent("Mouse_LUp", "MakePuzzle(" .. ii .. ")")
    puzzle:addInputEvent("Mouse_On", "PuzzleButton_Over(" .. ii .. ")")
    puzzle:addInputEvent("Mouse_Out", "PuzzleButton_Out(" .. ii .. ")")
    Panel_Window_Inventory:SetChildIndex(_puzzleNotice, 9999)
    Panel_Window_Inventory:SetChildIndex(((self.slots)[ii]).icon, 9998)
    effectSlot.isFirstItem = false
    effectSlot.puzzleControl = puzzle
    -- DECOMPILER ERROR at PC364: Confused about usage of register: R13 in 'UnsetPending'

    ;
    (self.slotEtcData)[ii] = effectSlot
  end
  if FGlobal_IsCommercialService() then
    (inven.buttonPearl):SetShow(true)
    ;
    (inven.valuePearl):SetShow(true)
    ;
    (inven.buttonMileage):SetShow(true)
    ;
    (inven.valueMileage):SetShow(true)
  else
    if isGameTypeEnglish() then
      (inven.buttonPearl):SetShow(true)
      ;
      (inven.valuePearl):SetShow(true)
      ;
      (inven.buttonMileage):SetShow(true)
      ;
      (inven.valueMileage):SetShow(true)
    else
      ;
      (inven.buttonPearl):SetShow(false)
      ;
      (inven.valuePearl):SetShow(false)
      ;
      (inven.buttonMileage):SetShow(false)
      ;
      (inven.valueMileage):SetShow(false)
    end
  end
end

InventoryWindow_CheckPopUpUI = function()
  -- function num : 0_20 , upvalues : checkPopUp
  if checkPopUp:IsCheck() then
    Panel_Window_Inventory:OpenUISubApp()
  else
    Panel_Window_Inventory:CloseUISubApp()
  end
  TooltipSimple_Hide()
end

HandleClicked_InventoryWindow_Close = function()
  -- function num : 0_21 , upvalues : checkPopUp
  Panel_Window_Inventory:CloseUISubApp()
  checkPopUp:SetCheck(false)
  InventoryWindow_Close()
end

InventoryWindow_Close = function()
  -- function num : 0_22 , upvalues : inven, icon_TrashOn, icon_TrashSequence, openUiType
  if Panel_Window_Inventory:IsUISubApp() then
    Inventory_SetFunctor(nil, nil, nil, nil)
    return 
  end
  if Panel_Equipment:IsUISubApp() then
    HandleClicked_EquipmentWindow_Close()
  end
  local self = inven
  do
    if self.otherWindowOpenFunc ~= nil then
      local callFunc = self.otherWindowOpenFunc
      self.otherWindowOpenFunc = nil
      callFunc()
    end
    self.filterFunc = nil
    self.rClickFunc = nil
    self.effect = nil
    if ToClient_IsSavedUi() then
      ToClient_SaveUiInfo(false)
      ToClient_SetSavedUi(false)
    end
    if Panel_Window_Exchange_Number:IsShow() then
      Panel_NumberPad_Show(false, (Defines.s64_const).s64_0, 0, nil)
    end
    Panel_Window_Inventory:SetShow(false, false)
    PaGlobal_TutorialManager:handleClosedInventory()
    Panel_Tooltip_Item_hideTooltip()
    UIMain_ItemUpdateRemove()
    if Panel_AlchemyStone:GetShow() then
      FGlobal_AlchemyStone_Close()
    end
    if Panel_AlchemyFigureHead:GetShow() then
      FGlobal_AlchemyFigureHead_Close()
    end
    if Panel_DyePalette:GetShow() then
      FGlobal_DyePalette_Close()
    end
    icon_TrashOn:SetShow(false)
    icon_TrashSequence:SetShow(false)
    for _,value in pairs(self.slotEtcData) do
      value.isFirstItem = false
    end
    for _,slot in pairs(self.slots) do
      (slot.icon):EraseAllEffect()
      ;
      (slot.icon):SetEnable(true)
      ;
      (slot.icon):SetMonoTone(false)
      ;
      (slot.icon):SetIgnore(false)
    end
    if Panel_Window_ClothInventory:GetShow() then
      ClothInventory_Close()
    end
    if openUiType == true then
      FGlobal_Equipment_SetHide(false)
    else
      if openUiType == false then
        FGlobal_Equipment_SetHide(true)
      end
    end
    HelpMessageQuestion_Out()
    Panel_Invertory_Manufacture_BG:SetShow(false)
    Panel_Invertory_ExchangeButton:SetShow(false)
    Panel_Window_Inventory:SetPosX(inven.orgPosX)
    Panel_Window_Inventory:SetPosY(inven.orgPosY)
  end
end

InventoryWindow_Show = function(uiType, isCashInven, isMarket)
  -- function num : 0_23 , upvalues : inven, openUiType, openWhereIs, icon_TrashOn, icon_TrashSequence, IM, btn_DyePalette, btn_Manufacture, btn_AlchemyStone, btn_AlchemyFigureHead
  local self = inven
  self.effect = nil
  self.startSlotIndex = 0
  openUiType = uiType
  openWhereIs = isMarket
  local isSorted = ToClient_IsSortedInventory()
  ;
  (self.checkButton_Sort):SetCheck(isSorted)
  icon_TrashOn:SetShow(false)
  icon_TrashSequence:SetShow(false)
  if isCashInven == nil then
    if Panel_ColorBalance:GetShow() then
      (self.radioButtonNormaiInven):SetCheck(false)
      ;
      (self.radioButtonCashInven):SetCheck(true)
    else
      ;
      (self.radioButtonNormaiInven):SetCheck(true)
      ;
      (self.radioButtonCashInven):SetCheck(false)
    end
    if Panel_Manufacture:GetShow() then
      (self.radioButtonCashInven):SetEnable(false)
      ;
      (self.radioButtonCashInven):SetIgnore(true)
      ;
      (self.radioButtonCashInven):SetMonoTone(true)
    else
      ;
      (self.radioButtonCashInven):SetEnable(true)
      ;
      (self.radioButtonCashInven):SetIgnore(false)
      ;
      (self.radioButtonCashInven):SetMonoTone(false)
    end
  else
    if isCashInven then
      (self.radioButtonNormaiInven):SetCheck(false)
      ;
      (self.radioButtonCashInven):SetCheck(true)
    else
      ;
      (self.radioButtonNormaiInven):SetCheck(true)
      ;
      (self.radioButtonCashInven):SetCheck(false)
    end
  end
  ;
  (self.radioButtonStd):SetCheck(true)
  ;
  (self.radioButtonTransport):SetCheck(false)
  ;
  (self.radioButtonHousing):SetCheck(false)
  Inventory_updateSlotData()
  ;
  (self._scroll):SetControlTop()
  Panel_Window_Inventory:SetShow(true, true)
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  PaGlobal_TutorialManager:handleOpenedInventory()
  if not Panel_Window_Warehouse:GetShow() and not Panel_Window_ServantInventory:GetShow() then
    (inven.buttonMoney):SetEnable(false)
  else
    ;
    (inven.buttonMoney):SetEnable(true)
  end
  if isGameTypeRussia() and (getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_CBT or getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_OBT) then
    btn_DyePalette:SetMonoTone(true)
    btn_DyePalette:SetIgnore(true)
    btn_DyePalette:SetEnable(false)
  else
    btn_DyePalette:SetMonoTone(false)
    btn_DyePalette:SetIgnore(false)
    btn_DyePalette:SetEnable(true)
  end
  if isFlushedUI() then
    btn_Manufacture:SetEnable(false)
    btn_Manufacture:SetMonoTone(true)
    btn_AlchemyStone:SetEnable(false)
    btn_AlchemyStone:SetMonoTone(true)
    btn_AlchemyFigureHead:SetEnable(false)
    btn_AlchemyFigureHead:SetMonoTone(true)
    btn_DyePalette:SetEnable(false)
    btn_DyePalette:SetMonoTone(true)
  else
    btn_Manufacture:SetEnable(true)
    btn_Manufacture:SetMonoTone(false)
    btn_AlchemyStone:SetEnable(true)
    btn_AlchemyStone:SetMonoTone(false)
    btn_AlchemyFigureHead:SetEnable(true)
    btn_AlchemyFigureHead:SetMonoTone(false)
    if isGameTypeRussia() and (getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_CBT or getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_OBT) then
      btn_DyePalette:SetEnable(false)
      btn_DyePalette:SetMonoTone(true)
    else
      btn_DyePalette:SetEnable(true)
      btn_DyePalette:SetMonoTone(false)
    end
  end
end

Inventory_SlotLClick = function(index)
  -- function num : 0_24 , upvalues : inven
  local self = inven
  local slotNo = ((self.slots)[index])._slotNo
  local inventoryType = Inventory_GetCurrentInventoryType()
  if Panel_Chatting_Input:IsShow() and isKeyPressed((CppEnums.VirtualKeyCode).KeyCode_SHIFT) then
    local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
    if itemWrapper == nil then
      return 
    end
    local focusEdit = GetFocusEdit()
    if ChatInput_CheckCurrentUiEdit(focusEdit) then
      FGlobal_ChattingInput_LinkedItemByInventory(slotNo, inventoryType)
    end
  else
    do
      if isKeyPressed((CppEnums.VirtualKeyCode).KeyCode_SHIFT) then
        if (isGameTypeJapan() or isGameTypeRussia()) and getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_CBT then
          return 
        end
        local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
        if itemWrapper ~= nil then
          Note_On(((itemWrapper:get()):getKey()):getItemKey())
        end
      end
    end
  end
end

Inventory_SlotRClick = function(index, equipSlotNo)
  -- function num : 0_25 , upvalues : openWhereIs, inven, isItemLock
  if Panel_Win_System:GetShow() then
    return 
  end
  if openWhereIs == true then
    return 
  end
  local self = inven
  local slotNo = ((self.slots)[index])._slotNo
  local whereType = Inventory_GetCurrentInventoryType()
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if itemWrapper == nil then
    return 
  end
  local itemName = (itemWrapper:getStaticStatus()):getName()
  local isCash = itemWrapper:isCash()
  if isKeyPressed((CppEnums.VirtualKeyCode).KeyCode_SHIFT) then
    if isCash then
      return 
    end
    if not isItemLock then
      return 
    end
    if Panel_Npc_Dialog:IsShow() or Panel_Window_ItemMarket_Function:GetShow() or Panel_Window_ItemMarket_RegistItem:GetShow() or Panel_Window_Repair:GetShow() then
      return 
    end
    if (itemWrapper:getStaticStatus()):isStackable() == false and itemWrapper:isSoulCollector() == false then
      if ToClient_Inventory_CheckItemLock(slotNo, whereType) then
        ToClient_Inventory_RemoveItemLock(slotNo)
        Proc_ShowMessage_Ack("[" .. itemName .. "] " .. PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_ITEMUNLOCK"))
      else
        ToClient_Inventory_InsertItemLock(slotNo)
        Proc_ShowMessage_Ack("[" .. itemName .. "] " .. PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_ITEMLOCK"))
      end
    else
      if ToClient_Inventory_CheckItemLock(slotNo, whereType) then
        ToClient_Inventory_RemoveItemLock(slotNo)
        Proc_ShowMessage_Ack("[" .. itemName .. "] " .. PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_ITEMUNLOCK"))
      else
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_CANNOT_ITEMLOCK"))
      end
    end
    Inventory_updateSlotData()
  else
    Inventory_SlotRClickXXX(slotNo, equipSlotNo, index)
  end
end

Inventory_SlotRClickXXX = function(slotNo, equipSlotNo, index)
  -- function num : 0_26 , upvalues : inven, radioButtonManu, radioButtonNote, _btn_WayPoint, _btn_Widget
  local self = inven
  local selfProxy = (getSelfPlayer()):get()
  local inventoryType = Inventory_GetCurrentInventoryType()
  local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  if itemWrapper ~= nil then
    local itemEnchantWrapper = itemWrapper:getStaticStatus()
    local itemStatic = (itemWrapper:getStaticStatus()):get()
    Inventory_DropEscape()
    if selfProxy:doRideMyVehicle() and itemStatic:isUseToVehicle() then
      inventoryUseItem(inventoryType, slotNo, equipSlotNo, false)
      return 
    end
    do
      if Panel_Window_StableStallion:GetShow() then
        local itemMaxCount = FGlobal_MaxItemCount(slotNo)
        if itemMaxCount ~= nil then
          if itemMaxCount < Int64toInt32((itemWrapper:get()):getCount_s64()) then
            Panel_NumberPad_Show(true, tonumber64(itemMaxCount), slotNo, Set_StallionItemSlot, nil, itemWrapper)
          else
            Panel_NumberPad_Show(true, (itemWrapper:get()):getCount_s64(), slotNo, Set_StallionItemSlot, nil, itemWrapper)
          end
        end
        return 
      end
      if self.rClickFunc ~= nil then
        (self.rClickFunc)(slotNo, itemWrapper, (itemWrapper:get()):getCount_s64(), inventoryType)
        return 
      end
      PaGlobal_TutorialManager:handleInventorySlotRClick(((itemWrapper:get()):getKey()):getItemKey())
      PaGlobal_TutorialManager:handleInventorySlotRClickgetSlotNo(slotNo)
      if DragManager:isDragging() then
        DragManager:clearInfo()
      end
      if Panel_Auction_Regist_Popup ~= nil and Panel_Auction_Regist_Popup:GetShow() then
        if (itemWrapper:getStaticStatus()):isStackable() then
          Panel_NumberPad_Show(true, (itemWrapper:get()):getCount_s64(), slotNo, Auction_RegisterItemFromInventory)
        else
          Auction_RegisterItemFromInventory(1, slotNo)
        end
        return 
      else
        if Panel_Housing_SettingVendingMachine ~= nil and Panel_Housing_SettingVendingMachine:GetShow() then
          VendingMachine_RegisterItemFromInventory(slotNo, 1)
          return 
        else
          if Panel_Housing_VendingMachineList ~= nil and Panel_Housing_VendingMachineList:GetShow() then
            FGlobal_VendingMachineRegisterItemFromInventory(slotNo)
          else
            if Panel_Housing_ConsignmentSale ~= nil and Panel_Housing_ConsignmentSale:GetShow() then
              FGlobal_ConsignmentRegisterItemFromInventory((itemWrapper:get()):getCount_s64(), slotNo)
            else
              if getAuctionState() then
                return 
              else
                if ((itemEnchantWrapper:get())._vestedType):getItemKey() == 2 and (itemWrapper:get()):isVested() == false then
                  local bindingItemUse = function()
    -- function num : 0_26_0 , upvalues : inventoryType, slotNo, equipSlotNo
    Inventory_UseItemTargetSelf(inventoryType, slotNo, equipSlotNo)
  end

                  local messageContent = nil
                  if itemEnchantWrapper:isUserVested() then
                    messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_BINDING_ALERT_CONTENT_USERVESTED")
                  else
                    messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_BINDING_ALERT_CONTENT")
                  end
                  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_BINDING_ALERT_TITLE"), content = messageContent, functionYes = bindingItemUse, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                  ;
                  (MessageBox.showMessageBox)(messageboxData)
                else
                  do
                    if eConnectUiType.eConnectUi_Undefined ~= (itemWrapper:getStaticStatus()):getConnectUi() then
                      ConnectUI((itemWrapper:getStaticStatus()):getConnectUi())
                    else
                      if (itemWrapper:getStaticStatus()):getItemType() == 8 then
                        local itemKey = ((itemWrapper:get()):getKey()):getItemKey()
                        audioPostEvent_SystemUi(0, 14)
                        Panel_Invertory_Manufacture_BG:SetShow(true)
                        Panel_Tooltip_Item_Show_GeneralNormal(slotNo, "inventory", false, false)
                        local row = (math.floor)((slotNo - 1) / (inven.config).slotCols)
                        local col = (slotNo - 1) % (inven.config).slotCols
                        Panel_Invertory_Manufacture_BG:SetPosX((((self.slots)[index]).icon):GetParentPosX() - 42)
                        Panel_Invertory_Manufacture_BG:SetPosY((((self.slots)[index]).icon):GetParentPosY() + 42)
                        local _btn_MenuSizeX = radioButtonManu:GetSizeX() + 23
                        local _btn_MenuTextSizeX = _btn_MenuSizeX - _btn_MenuSizeX / 2 - radioButtonManu:GetTextSizeX() / 2
                        local _btn_NoteSizeX = radioButtonNote:GetSizeX() + 23
                        local _btn_NoteTextSizeX = _btn_NoteSizeX - _btn_NoteSizeX / 2 - radioButtonNote:GetTextSizeX() / 2
                        radioButtonManu:SetTextSpan(_btn_MenuTextSizeX, 5)
                        radioButtonNote:SetTextSpan(_btn_NoteTextSizeX, 5)
                        radioButtonManu:SetPosX(4)
                        radioButtonManu:SetPosY(4)
                        radioButtonNote:SetPosX(4)
                        radioButtonNote:SetPosY(38)
                        if MiniGame_Manual_Value_FishingStart == true then
                          radioButtonManu:SetEnable(false)
                          radioButtonManu:SetMonoTone(true)
                          radioButtonManu:SetAlpha(0.8)
                        else
                          radioButtonManu:SetEnable(true)
                          radioButtonManu:SetMonoTone(false)
                          radioButtonManu:SetAlpha(1)
                        end
                        radioButtonManu:addInputEvent("Mouse_LUp", "Manufacture_On(" .. slotNo .. ")")
                        radioButtonNote:addInputEvent("Mouse_LUp", "Note_On(" .. ((itemWrapper:get()):getKey()):getItemKey() .. ")")
                        radioButtonManu:addInputEvent("Mouse_RUp", "Manufacture_Off()")
                        radioButtonNote:addInputEvent("Mouse_RUp", "Manufacture_Off()")
                        radioButtonNote:addInputEvent("Mouse_Out", "Manufacture_Off()")
                        radioButtonManu:addInputEvent("Mouse_Out", "Manufacture_Off()")
                        Panel_Invertory_Manufacture_BG:addInputEvent("Mouse_Out", "Manufacture_Off()")
                        return 
                      else
                        do
                          if itemEnchantWrapper:isPopupItem() then
                            Panel_UserItem_PopupItem(itemEnchantWrapper, inventoryType, slotNo, equipSlotNo)
                          else
                            if itemEnchantWrapper:isExchangeItemNPC() then
                              Panel_Invertory_ExchangeButton:SetShow(true)
                              Panel_Tooltip_Item_Show_GeneralNormal(slotNo, "inventory", false, false)
                              local row = (math.floor)((slotNo - 1) / (inven.config).slotCols)
                              local col = (slotNo - 1) % (inven.config).slotCols
                              Panel_Invertory_ExchangeButton:SetPosX((((self.slots)[index]).icon):GetParentPosX() - 42)
                              Panel_Invertory_ExchangeButton:SetPosY((((self.slots)[index]).icon):GetParentPosY() + 42)
                              local _btn_WayPointSizeX = _btn_WayPoint:GetSizeX() + 23
                              local _btn_WayPointTextSizeX = _btn_WayPointSizeX - _btn_WayPointSizeX / 2 - _btn_WayPoint:GetTextSizeX() / 2
                              local _btn_WidgetSizeX = _btn_Widget:GetSizeX() + 23
                              local _btn_WidgetTextSizeX = _btn_WidgetSizeX - _btn_WidgetSizeX / 2 - _btn_Widget:GetTextSizeX() / 2
                              _btn_WayPoint:SetTextSpan(_btn_WayPointTextSizeX, 5)
                              _btn_Widget:SetTextSpan(_btn_WidgetTextSizeX, 5)
                              _btn_WayPoint:SetPosX(4)
                              _btn_WayPoint:SetPosY(4)
                              _btn_Widget:SetPosX(4)
                              _btn_Widget:SetPosY(38)
                              _btn_WayPoint:addInputEvent("Mouse_LUp", "HandleClickedWayPoint( " .. slotNo .. " )")
                              _btn_WayPoint:addInputEvent("Mouse_Out", "ExchangeButton_Off()")
                              _btn_Widget:addInputEvent("Mouse_Out", "ExchangeButton_Off()")
                              _btn_Widget:addInputEvent("Mouse_LUp", "HandleClickedWidget( " .. slotNo .. " )")
                              Panel_Invertory_ExchangeButton:addInputEvent("Mouse_Out", "ExchangeButton_Off()")
                            else
                              do
                                if not itemStatic:isUseToVehicle() then
                                  local useTradeItem = function()
    -- function num : 0_26_1 , upvalues : inventoryType, slotNo, equipSlotNo
    Inventory_UseItemTargetSelf(inventoryType, slotNo, equipSlotNo)
  end

                                  local itemSSW = itemWrapper:getStaticStatus()
                                  local item_type = itemSSW:getItemType()
                                  if item_type == 2 and (itemSSW:get()):isForJustTrade() == true then
                                    local messageContent = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TRADEITEMUSE_CONTENT")
                                    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TRADEITEMUSE_TITLE"), content = messageContent, functionYes = useTradeItem, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
                                    ;
                                    (MessageBox.showMessageBox)(messageboxData)
                                  else
                                    do
                                      local equipType = (itemWrapper:getStaticStatus()):getEquipType()
                                      if equipType == 16 or equipType == 17 then
                                        local accSlotNo = FGlobal_AccSlotNo(itemWrapper, true)
                                        Inventory_UseItemTargetSelf(inventoryType, slotNo, accSlotNo)
                                      else
                                        do
                                          do
                                            Inventory_UseItemTargetSelf(inventoryType, slotNo, equipSlotNo)
                                            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_CANT_USEITEM"))
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
            end
          end
        end
      end
    end
  end
end

FGlobal_WhereUseItemExecute = function()
  -- function num : 0_27 , upvalues : whereUseItemSSW, whereUseItemSlotNo
  WhereUseItemDirectionUpdate(whereUseItemSSW, whereUseItemSlotNo)
end

FindExchangeItemNPC = function(itemSSW)
  -- function num : 0_28
  local selfProxy = (getSelfPlayer()):get()
  if selfProxy == nil then
    return 
  end
  local selfPosition = float3(selfProxy:getPositionX(), selfProxy:getPositionY(), selfProxy:getPositionZ())
  local itemKey = ((itemSSW:get())._key):get()
  local npcPosition = {}
  local minIndex = 0
  local minDistance = 0
  ToClient_DeleteNaviGuideByGroup(0)
  local count = itemSSW:getExchangeItemNPCInfoListCount()
  for index = 0, count - 1 do
    local spawnData = npcByCharacterKey_getNpcInfo(itemSSW:getCharacterKeyByIdx(index), itemSSW:getDialogIndexByIdx(index))
    if spawnData ~= nil then
      local npcPos = spawnData:getPosition()
      npcPosition[index] = npcPos
      local distance = ((Util.Math).calculateDistance)(selfPosition, npcPos)
      if index == 0 then
        minDistance = distance
      else
        if distance < minDistance then
          minIndex = index
          minDistance = distance
        end
      end
    end
  end
  for ii = 0, count - 1 do
    if ii ~= minIndex and npcPosition[ii] ~= nil then
      worldmapNavigatorStart(float3((npcPosition[ii]).x, (npcPosition[ii]).y, (npcPosition[ii]).z), NavigationGuideParam(), false, false, true)
    end
  end
  if npcPosition[minIndex] ~= nil then
    worldmapNavigatorStart(float3((npcPosition[minIndex]).x, (npcPosition[minIndex]).y, (npcPosition[minIndex]).z), NavigationGuideParam(), false, false, true)
  end
  audioPostEvent_SystemUi(0, 14)
  selfProxy:setCurrentFindExchangeItemEnchantKey(itemKey)
end

Inventory_FindExchangeItemNPC = function(slotNo)
  -- function num : 0_29
  local selfProxy = (getSelfPlayer()):get()
  if selfProxy == nil then
    return 
  end
  local inventory = selfProxy:getInventory()
  if not inventory:empty(slotNo) then
    local itemWrapper = getInventoryItem(slotNo)
    if itemWrapper == nil then
      return 
    end
    local itemSSW = itemWrapper:getStaticStatus()
    if itemSSW == nil then
      return 
    end
    FindExchangeItemNPC(itemSSW)
  end
end

FromClient_FindExchangeItemNPC = function()
  -- function num : 0_30
  local itemEnchantKey = ((getSelfPlayer()):get()):getCurrentFindExchangeItemEnchantKey()
  local itemSSW = getItemEnchantStaticStatus(ItemEnchantKey(itemEnchantKey))
  if itemSSW == nil then
    return 
  end
  FindExchangeItemNPC(itemSSW)
end

Manufacture_On = function(slotNo)
  -- function num : 0_31
  if Panel_Manufacture:GetShow() then
    return 
  end
  if not IsSelfPlayerWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_MANUFACTURE"))
    return 
  end
  if ToClient_GetMyTeamNoLocalWar() ~= 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_LOCALWAR_ALERT"))
    return 
  end
  Panel_Invertory_Manufacture_BG:SetShow(false)
  Manufacture_Show(nil, (CppEnums.ItemWhereType).eInventory, true)
  Manufacture_Off()
end

Note_On = function(itemKey)
  -- function num : 0_32
  ProductNote_Item_ShowToggle(itemKey)
  Panel_Invertory_Manufacture_BG:SetShow(false)
  Manufacture_Off()
end

Manufacture_Off = function()
  -- function num : 0_33
  local panelPosX = Panel_Invertory_Manufacture_BG:GetPosX()
  local panelPosY = Panel_Invertory_Manufacture_BG:GetPosY()
  local panelSizeX = Panel_Invertory_Manufacture_BG:GetSizeX()
  local panelSizeY = Panel_Invertory_Manufacture_BG:GetSizeY()
  local mousePosX = getMousePosX()
  local mousePosY = getMousePosY()
  if panelPosX <= mousePosX and mousePosX <= panelPosX + panelSizeX and panelPosY <= mousePosY and mousePosY <= panelPosY + panelSizeY then
    return 
  end
  Panel_Invertory_Manufacture_BG:SetShow(false)
end

HandleClickedWayPoint = function(slotNo)
  -- function num : 0_34
  Inventory_FindExchangeItemNPC(slotNo)
  Panel_Invertory_ExchangeButton:SetShow(false)
end

HandleClickedWidget = function(slotNo)
  -- function num : 0_35 , upvalues : whereUseItemSlotNo, whereUseItemSSW
  local inventoryType = Inventory_GetCurrentInventoryType()
  local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  local itemSSW = itemWrapper:getStaticStatus()
  whereUseItemSlotNo = slotNo
  whereUseItemSSW = itemSSW
  FGlobal_WhereUseITemDirectionOpen(itemSSW, slotNo)
  Panel_Invertory_ExchangeButton:SetShow(false)
end

HandleClicked_Inventory_Palette_Open = function()
  -- function num : 0_36 , upvalues : inven
  if not (inven.radioButtonCashInven):IsCheck() then
    (inven.radioButtonNormaiInven):SetCheck(false)
    ;
    (inven.radioButtonCashInven):SetCheck(true)
    Inventory_Tab()
  end
  FGlobal_DyePalette_Open()
end

FGlobal_CashInventoryOpen_ByEnchant = function()
  -- function num : 0_37 , upvalues : inven
  if not (inven.radioButtonCashInven):IsCheck() then
    (inven.radioButtonNormaiInven):SetCheck(false)
    ;
    (inven.radioButtonCashInven):SetCheck(true)
    Inventory_Tab()
  end
end

HandleClicked_Inventory_ItemDelete = function()
  -- function num : 0_38
  if DragManager:isDragging() and Panel_Window_Inventory == DragManager.dragStartPanel then
    local slotNo = DragManager.dragSlotInfo
    local whereType = Inventory_GetCurrentInventoryType()
    local itemWrapper = getInventoryItemByType(whereType, slotNo)
    if itemWrapper == nil then
      return 
    end
    local itemCount = (itemWrapper:get()):getCount_s64()
    if (Defines.s64_const).s64_1 == itemCount then
      Inventory_ItemDelete_Check((Defines.s64_const).s64_1, slotNo, whereType)
    else
      Panel_NumberPad_Show(true, itemCount, slotNo, Inventory_ItemDelete_Check, nil, whereType)
    end
  end
end

ExchangeButton_Off = function()
  -- function num : 0_39
  local panelPosX = Panel_Invertory_ExchangeButton:GetPosX()
  local panelPosY = Panel_Invertory_ExchangeButton:GetPosY()
  local panelSizeX = Panel_Invertory_ExchangeButton:GetSizeX()
  local panelSizeY = Panel_Invertory_ExchangeButton:GetSizeY()
  local mousePosX = getMousePosX()
  local mousePosY = getMousePosY()
  if panelPosX <= mousePosX and mousePosX <= panelPosX + panelSizeX and panelPosY <= mousePosY and mousePosY <= panelPosY + panelSizeY then
    return 
  end
  Panel_Invertory_ExchangeButton:SetShow(false)
end

local deleteWhereType, deleteSlotNo, itemCount, itemName = nil, nil, nil, nil
Inventory_GroundClick = function(whereType, slotNo)
  -- function num : 0_40 , upvalues : itemCount, itemName
  if Panel_Window_Inventory:GetShow() == false or Panel_Win_System:GetShow() then
    return 
  end
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if itemWrapper == nil then
    return 
  end
  itemCount = (itemWrapper:get()):getCount_s64()
  itemName = (itemWrapper:getStaticStatus()):getName()
  if (Defines.s64_const).s64_1 == itemCount then
    Inventory_GroundClick_Message((Defines.s64_const).s64_1, slotNo, whereType)
  else
    if isUseNewQuickSlot() then
      Inventory_GroundClick_Message((Defines.s64_const).s64_1, slotNo, whereType)
    else
      Panel_NumberPad_Show(true, itemCount, slotNo, Inventory_GroundClick_Message, nil, whereType)
    end
  end
end

Inventory_GetToopTipItem = function()
  -- function num : 0_41 , upvalues : inven
  local self = inven
  if self._tooltipWhereType == nil then
    return nil
  end
  if self._tooltipSlotNo == nil then
    return nil
  end
  return getInventoryItemByType(self._tooltipWhereType, self._tooltipSlotNo)
end

Inventory_GetToolTipItemSlotNo = function()
  -- function num : 0_42 , upvalues : inven
  local self = inven
  if self._tooltipWhereType == nil then
    return nil
  end
  if self._tooltipSlotNo == nil then
    return nil
  end
  return self._tooltipSlotNo
end

Inventory_IconOver = function(index)
  -- function num : 0_43 , upvalues : inven, effectScene, over_SlotEffect
  local self = inven
  local slotNo = ((self.slots)[index])._slotNo
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R3 in 'UnsetPending'

  ;
  ((self.slotEtcData)[index]).isFirstItem = false
  if (effectScene.newItem)[index] ~= nil then
    (((self.slots)[index]).icon):EraseEffect((effectScene.newItem)[index])
  end
  if over_SlotEffect ~= nil then
    (((self.slots)[index]).icon):EraseEffect(over_SlotEffect)
  end
  over_SlotEffect = (((self.slots)[index]).icon):AddEffect("UI_Inventory_EmptySlot", false, 0, 0)
  self._tooltipWhereType = Inventory_GetCurrentInventoryType()
  self._tooltipSlotNo = slotNo
  Panel_Tooltip_Item_Show_GeneralNormal(index, "inventory", true, false)
end

Inventory_IconOut = function(index)
  -- function num : 0_44 , upvalues : inven, over_SlotEffect
  local self = inven
  if over_SlotEffect ~= nil then
    (((inven.slots)[index]).icon):EraseEffect(over_SlotEffect)
  end
  self._tooltipWhereType = nil
  self._tooltipSlotNo = nil
  Panel_Tooltip_Item_Show_GeneralNormal(index, "inventory", false, false)
end

Inventory_GetFirstItemCount = function()
  -- function num : 0_45 , upvalues : inven
  local aCount = 0
  local returnValue = 0
  for _,value in pairs(inven.slotEtcData) do
    if value.isFirstItem then
      aCount = aCount + 1
    end
  end
  return aCount
end

Inventory_GroundClick_Message = function(s64_itemCount, slotNo, whereType)
  -- function num : 0_46 , upvalues : deleteWhereType, deleteSlotNo, itemCount, itemName
  if restrictedActionForUseItem() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TEXT_CANT_REMOVEITEM"))
    return false
  end
  deleteWhereType = whereType
  deleteSlotNo = slotNo
  itemCount = s64_itemCount
  if isNearFusionCore() == true then
    local luaPushItemToCampfireMsg = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_INVENTORY_TEXT_PUSHITEMTOCAMPFIRE_MSG", "itemName", itemName, "itemCount", tostring(itemCount))
    local luaBurn = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TEXT_BURN")
    local messageContent = luaPushItemToCampfireMsg
    local messageboxData = {title = luaBurn, content = messageContent, functionYes = Inventory_BurnItemToActor_Yes, functionNo = Inventory_Delete_No, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  else
    do
      if isUseNewQuickSlot() then
        FGlobal_SetNewQuickSlot_ByGroundClick(s64_itemCount, slotNo, whereType)
      else
        local luaDeleteItemMsg = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_ONLYTRASH_INVENTORY")
        local luaDelete = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TEXT_DELETE")
        local messageContent = luaDeleteItemMsg
        local messageboxData = {title = luaDelete, content = messageContent, functionYes = Inventory_Delete_No, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
        ;
        (MessageBox.showMessageBox)(messageboxData)
      end
    end
  end
end

Inventory_ItemDelete_Check = function(count, slotNo, whereType)
  -- function num : 0_47 , upvalues : deleteWhereType, deleteSlotNo, itemCount
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  local itemName = (itemWrapper:getStaticStatus()):getName()
  deleteWhereType = whereType
  deleteSlotNo = slotNo
  itemCount = count
  DragManager:clearInfo()
  local luaDeleteItemMsg = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_INVENTORY_TEXT_DELETEITEM_MSG", "itemName", itemName, "itemCount", tostring(count))
  local luaDelete = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TEXT_DELETE")
  local messageContent = luaDeleteItemMsg
  local messageboxData = {title = luaDelete, content = messageContent, functionYes = Inventory_Delete_Yes, functionNo = Inventory_Delete_No, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

Inventory_Delete_Yes = function()
  -- function num : 0_48 , upvalues : deleteSlotNo, deleteWhereType
  if deleteSlotNo == nil then
    return 
  end
  local itemWrapper = getInventoryItemByType(deleteWhereType, deleteSlotNo)
  if itemWrapper == nil then
    return 
  end
  if (CppEnums.ContentsEventType).ContentsType_InventoryBag == ((itemWrapper:getStaticStatus()):get()):getContentsEventType() then
    local bagSize = (itemWrapper:getStaticStatus()):getContentsEventParam2()
    local isEmptyBag = false
    for index = 0, bagSize - 1 do
      local bagItemWrapper = getInventoryBagItemByType(deleteWhereType, deleteSlotNo, index)
      if bagItemWrapper ~= nil then
        if (CppEnums.ItemWhereType).eInventory == deleteWhereType then
          Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_DELETEITEM_ALERT2"))
        else
          if (CppEnums.ItemWhereType).eCashInventory == deleteWhereType then
            Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_DELETEITEM_ALERT"))
          end
        end
        DragManager:clearInfo()
        Inventory_DropEscape()
        return 
      end
    end
  end
  do
    if itemWrapper:isCash() then
      PaymentPassword(Inventory_Delete_YesXXX)
      return 
    end
    Inventory_Delete_YesXXX()
    PaGlobal_TutorialManager:handleInventoryDelete(itemWrapper, deleteWhereType, deleteSlotNo)
  end
end

Inventory_Delete_YesXXX = function()
  -- function num : 0_49 , upvalues : deleteSlotNo, deleteWhereType, itemCount
  if deleteSlotNo == nil then
    return 
  end
  deleteItem((getSelfPlayer()):getActorKey(), deleteWhereType, deleteSlotNo, itemCount)
  Inventory_DropEscape()
  DragManager:clearInfo()
end

Inventory_BurnItemToActor_Yes = function()
  -- function num : 0_50 , upvalues : deleteSlotNo, deleteWhereType, itemCount
  if deleteSlotNo ~= nil then
    burnItemToActor(deleteWhereType, deleteSlotNo, itemCount)
  end
end

Inventory_Delete_No = function()
  -- function num : 0_51 , upvalues : deleteWhereType, deleteSlotNo
  deleteWhereType = nil
  deleteSlotNo = nil
  Inventory_DropEscapeAlert()
  DragManager:clearInfo()
end

local inventoryDragNoUseList = nil
FGlobal_SetInventoryDragNoUse = function(pPanel)
  -- function num : 0_52 , upvalues : inventoryDragNoUseList
  inventoryDragNoUseList = pPanel
end

Inventory_SlotDrag = function(index)
  -- function num : 0_53 , upvalues : inven, inventoryDragNoUseList, openWhereIs, icon_TrashOn, icon_TrashSequence
  local self = inven
  local slotNo = ((self.slots)[index])._slotNo
  if inventoryDragNoUseList ~= nil and inventoryDragNoUseList:IsShow() then
    return 
  end
  if openWhereIs == true then
    return 
  end
  if Panel_Win_System:GetShow() then
    return 
  end
  icon_TrashOn:SetShow(true)
  local whereType = Inventory_GetCurrentInventoryType()
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if itemWrapper == nil then
    icon_TrashOn:SetShow(false)
    icon_TrashSequence:SetShow(false)
    return 
  end
  if itemWrapper ~= nil then
    local itemSSW = itemWrapper:getStaticStatus()
    local itemType = itemSSW:getItemType()
    local isTradeItem = itemSSW:isTradeAble()
    DragManager:setDragInfo(Panel_Window_Inventory, whereType, slotNo, "Icon/" .. (itemWrapper:getStaticStatus()):getIconPath(), Inventory_GroundClick, (getSelfPlayer()):getActorKey())
    if ((itemWrapper:getStaticStatus()):get()):isItemSkill() or ((itemWrapper:getStaticStatus()):get()):isUseToVehicle() then
      QuickSlot_ShowBackGround()
    end
    Item_Move_Sound(itemWrapper)
  end
end

Inventory_ShowToggle = function()
  -- function num : 0_54
  Inventory_SetShow(not Panel_Window_Inventory:GetShow())
end

inven.registEventHandler = function(self)
  -- function num : 0_55
  (self.buttonClose):addInputEvent("Mouse_LUp", "HandleClicked_InventoryWindow_Close()")
  ;
  (self.buttonMoney):addInputEvent("Mouse_LUp", "InventoryWindow_PopMoney()")
  ;
  (self.checkButton_Sort):addInputEvent("Mouse_LUp", "Inventory_SetSorted()")
end

Inventory_SetCheckRadioButtonNormalInventory = function(bCheck)
  -- function num : 0_56 , upvalues : inven
  local self = inven
  ;
  (self.radioButtonNormaiInven):SetCheck(bCheck)
end

Inventory_SetSorted = function()
  -- function num : 0_57 , upvalues : inven
  local self = inven
  local bSorted = (self.checkButton_Sort):IsCheck()
  ToClient_SetSortedInventory(bSorted)
  Inventory_updateSlotData()
end

InventoryWindow_PopMoney = function()
  -- function num : 0_58 , upvalues : inven
  if not Panel_Window_Warehouse:GetShow() and not Panel_Window_ServantInventory:GetShow() then
    (inven.buttonMoney):SetEnable(false)
    return 
  end
  local self = inven
  local whereType = (CppEnums.ItemWhereType).eInventory
  local slotNo = getMoneySlotNo()
  FGlobal_PopupMoveItem_Init(whereType, slotNo, (CppEnums.MoveItemToType).Type_Player, (getSelfPlayer()):getActorKey(), true)
end

Inventory_UpdatePerFrame = function(fDeltaTime)
  -- function num : 0_59 , upvalues : inven, UI_TISNU
  if fDeltaTime <= 0 then
    return 
  end
  local selfPlayerWrapper = getSelfPlayer()
  if selfPlayerWrapper == nil then
    return 
  end
  local self = inven
  local useStartSlot = inventorySlotNoUserStart()
  local currentWhereType = Inventory_GetCurrentInventoryType()
  for ii = 0, (self.config).slotCount - 1 do
    local slot = (self.slots)[ii]
    local slotNo = slot._slotNo
    local remainTime = 0
    local itemReuseTime = 0
    local realRemainTime = 0
    local intRemainTime = 0
    if UI_TISNU ~= slotNo then
      remainTime = getItemCooltime(currentWhereType, slotNo)
      itemReuseTime = getItemReuseCycle(currentWhereType, slotNo) / 1000
      realRemainTime = remainTime * (itemReuseTime)
      intRemainTime = realRemainTime - realRemainTime % 1 + 1
    end
    if remainTime > 0 then
      (slot.cooltime):UpdateCoolTime(remainTime)
      ;
      (slot.cooltime):SetShow(true)
      ;
      (slot.cooltimeText):SetText(Time_Formatting_ShowTop(intRemainTime))
      if intRemainTime <= itemReuseTime then
        (slot.cooltimeText):SetShow(true)
      else
        ;
        (slot.cooltimeText):SetShow(false)
      end
    else
      if (slot.cooltime):GetShow() then
        (slot.cooltime):SetShow(false)
        ;
        (slot.cooltimeText):SetShow(false)
        local skillSlotItemPosX = (slot.cooltime):GetParentPosX()
        local skillSlotItemPosY = (slot.cooltime):GetParentPosY()
        audioPostEvent_SystemUi(2, 1)
        Panel_Inventory_CoolTime_Effect_Item_Slot:SetShow(true, true)
        Panel_Inventory_CoolTime_Effect_Item_Slot:AddEffect("UI_Button_Hide", false, 2.5, 7)
        Panel_Inventory_CoolTime_Effect_Item_Slot:AddEffect("fUI_Button_Hide", false, 2.5, 7)
        Panel_Inventory_CoolTime_Effect_Item_Slot:SetPosX(skillSlotItemPosX - 7)
        Panel_Inventory_CoolTime_Effect_Item_Slot:SetPosY(skillSlotItemPosY - 10)
      end
    end
  end
end

Inventory_ItemComparer = function(ii, jj)
  -- function num : 0_60
  return Global_ItemComparer(ii, jj, getInventoryItemByType, Inventory_GetCurrentInventoryType())
end

local _filter_for_NormalTab = function(slotNo, itemWrapper)
  -- function num : 0_61
  return false
end

local _filter_for_TradeTab = function(slotNo, itemWrapper)
  -- function num : 0_62
  if itemWrapper ~= nil then
    return not ((itemWrapper:getStaticStatus()):get()):isForJustTrade()
  else
    return true
  end
end

local _filter_for_HousingTab = function(slotNo, itemWrapper)
  -- function num : 0_63
  if itemWrapper ~= nil then
    return not ((itemWrapper:getStaticStatus()):get()):isItemInstallation()
  else
    return true
  end
end

local _filter_for_HousingConsignmentSaleManager = function(slotNo, itemWrapper)
  -- function num : 0_64
  if itemWrapper ~= nil then
    return not isRegistrableItem(slotNo, itemWrapper)
  else
    return true
  end
end

isRegistrableItem = function(slotNo, itemWrapper)
  -- function num : 0_65
  if (itemWrapper:get()):isVested() or (itemWrapper:getExpirationDate()):isIndefinite() == false then
    return false
  end
  return ToClient_IsRegistrableItem(slotNo)
end

FGlobal_UpdateInventorySlotData = function()
  -- function num : 0_66
  Inventory_updateSlotData()
end

local _lookAtMe = (UI.getChildControl)(Panel_fieldQuest, "Static_LookAtMe")
local _exchangeSlotNo = {}
local _exchangeIndex = -1
Inventory_AddEffect_While_Exchange = function(invenSlotNo)
  -- function num : 0_67 , upvalues : _exchangeIndex, _exchangeSlotNo
  if tradePC_GetMyLock() then
    return 
  end
  if _exchangeIndex < 0 then
    _exchangeIndex = _exchangeIndex + 1
  end
  for i = 0, _exchangeIndex do
    -- DECOMPILER ERROR at PC20: Confused about usage of register: R5 in 'UnsetPending'

    if _exchangeSlotNo[i] == nil then
      _exchangeSlotNo[i] = invenSlotNo
      Inventory_updateSlotData()
      return 
    end
  end
  _exchangeIndex = _exchangeIndex + 1
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

  _exchangeSlotNo[_exchangeIndex] = invenSlotNo
  Inventory_updateSlotData()
end

Inventory_EraseEffect_While_Exchange = function(exchangeIndex)
  -- function num : 0_68 , upvalues : _exchangeSlotNo
  if tradePC_GetMyLock() then
    return 
  end
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  _exchangeSlotNo[exchangeIndex] = nil
  Inventory_updateSlotData()
end

Inventory_Filter_Init = function()
  -- function num : 0_69 , upvalues : _exchangeIndex, _exchangeSlotNo
  for i = _exchangeIndex, -1, -1 do
    -- DECOMPILER ERROR at PC5: Confused about usage of register: R4 in 'UnsetPending'

    _exchangeSlotNo[i] = nil
  end
  _exchangeIndex = -1
end

Inventory_IsCurrentNormalInventoryType = function()
  -- function num : 0_70 , upvalues : inven
  local self = inven
  return (self.radioButtonNormaiInven):IsChecked()
end

Inventory_GetCurrentInventoryType = function()
  -- function num : 0_71 , upvalues : inven
  local self = inven
  if Inventory_IsCurrentNormalInventoryType() then
    return (CppEnums.ItemWhereType).eInventory
  else
    return (CppEnums.ItemWhereType).eCashInventory
  end
  return (CppEnums.ItemWhereType).eInventory
end

Inventory_GetCurrentInventory = function()
  -- function num : 0_72
  local selfPlayerWrapper = getSelfPlayer()
  if selfPlayerWrapper == nil then
    return nil
  end
  local selfPlayer = selfPlayerWrapper:get()
  local inventory = selfPlayer:getInventoryByType(Inventory_GetCurrentInventoryType())
  return inventory
end

local isFirstSummonItemUse = false
local isNormalInven = true
Inventory_updateSlotData = function()
  -- function num : 0_73 , upvalues : inven, isFirstSummonItemUse, isNormalInven, _filter_for_HousingConsignmentSaleManager, effectScene, UI_color, _exchangeIndex, _exchangeSlotNo
  local stdBackGround = (UI.getChildControl)(Panel_Window_Inventory, "Static_Texture_Slot_Background")
  local self = inven
  local selfPlayerWrapper = getSelfPlayer()
  local classType = selfPlayerWrapper:getClassType()
  if selfPlayerWrapper == nil then
    return 
  end
  local selfPlayer = selfPlayerWrapper:get()
  isFirstSummonItemUse = false
  local money = (Defines.s64_const).s64_0
  local pearl = (Defines.s64_const).s64_0
  local mileage = (Defines.s64_const).s64_0
  local moneyItemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eInventory, getMoneySlotNo())
  if moneyItemWrapper ~= nil then
    money = (moneyItemWrapper:get()):getCount_s64()
  end
  local pearlItemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eCashInventory, getPearlSlotNo())
  if pearlItemWrapper ~= nil then
    pearl = (pearlItemWrapper:get()):getCount_s64()
  end
  local mileagelItemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eCashInventory, getMileageSlotNo())
  if mileagelItemWrapper ~= nil then
    mileage = (mileagelItemWrapper:get()):getCount_s64()
  end
  ;
  (self.staticMoney):SetText(makeDotMoney(money))
  ;
  (self.valuePearl):SetText(makeDotMoney(pearl))
  ;
  (self.valueMileage):SetText(makeDotMoney(mileage))
  _Inventory_updateSlotData_ChangeSilverIcon(money)
  local _const = Defines.s64_const
  FGlobal_UpdateInventoryWeight()
  local playerLevel = ((getSelfPlayer()):get()):getLevel()
  local isNormalInventory = (self.radioButtonNormaiInven):IsChecked()
  isNormalInven = isNormalInventory
  local useStartSlot = inventorySlotNoUserStart()
  local invenUseSize = selfPlayer:getInventorySlotCount(not isNormalInventory)
  local inventory = Inventory_GetCurrentInventory()
  local invenMaxSize = inventory:sizeXXX()
  local currentWhereType = Inventory_GetCurrentInventoryType()
  ;
  (UIScroll.SetButtonSize)(self._scroll, (self.config).slotCount, invenMaxSize - useStartSlot)
  ;
  (self._scroll):SetShow(true)
  local freeCount = inventory:getFreeCount()
  ;
  (self.staticCapacity):SetText(tostring(invenUseSize - freeCount - useStartSlot) .. "/" .. tostring(invenUseSize - useStartSlot))
  local slotNoList = (Array.new)()
  slotNoList:fill(useStartSlot, invenMaxSize - 1)
  if (self.checkButton_Sort):IsCheck() then
    local sortList = (Array.new)()
    sortList:fill(useStartSlot, invenUseSize - 1)
    sortList:quicksort(Inventory_ItemComparer)
    for ii = 1, invenUseSize - 2 do
      slotNoList[ii] = sortList[ii]
    end
  end
  do
    for ii = 0, (self.config).slotCount - 1 do
      local slot = (self._slotsBackground)[ii]
      ;
      (slot.empty):SetShow(false)
      ;
      (slot.lock):SetShow(false)
      if ii < invenUseSize - useStartSlot - self.startSlotIndex then
        (slot.empty):SetShow(true)
      else
        ;
        (slot.lock):SetShow(true)
      end
    end
    local isFiltered = false
    local _mapaeBling = {}
    Panel_Inventory_isBlackStone_16001 = false
    Panel_Inventory_isBlackStone_16002 = false
    Panel_Inventory_isSocketItem = false
    Panel_NewEquip_EffectClear()
    for ii = 0, (self.config).slotCount - 1 do
      local slot = (self.slots)[ii]
      slot:clearItem()
      ;
      (slot.icon):SetEnable(true)
      ;
      (slot.icon):SetMonoTone(true)
      slot.isEmpty = true
    end
    local fixEquipCheck = false
    for ii = 0, (self.config).slotCount - 1 do
      local slot = (self.slots)[ii]
      local slotNo = slotNoList[ii + 1 + self.startSlotIndex]
      slot._slotNo = slotNo
      ;
      (slot.icon):EraseAllEffect()
      local row = (math.floor)(ii / (self.config).slotCols)
      local col = ii % (self.config).slotCols
      ;
      (slot.icon):SetPosX((self.config).slotStartX + (self.config).slotGapX * col)
      ;
      (slot.icon):SetPosY((self.config).slotStartY + (self.config).slotGapY * row)
      ;
      (slot.bagIcon):SetShow(false)
      local itemExist = false
      local itemWrapper = getInventoryItemByType(currentWhereType, slotNo)
      if itemWrapper ~= nil then
        slot:setItem(itemWrapper, slotNo)
        slot.isEmpty = false
        if self.filterFunc ~= nil then
          isFiltered = (self.filterFunc)(slotNo, itemWrapper, currentWhereType)
        else
          isFiltered = _Inventory_updateSlotData_ChangeFilterBtnTexture(isFiltered, slotNo, stdBackGround)
          if Panel_Housing_ConsignmentSale ~= nil and Panel_Housing_ConsignmentSale:GetShow() and isFiltered == false then
            isFiltered = _filter_for_HousingConsignmentSaleManager(slotNo, itemWrapper)
          end
        end
        ;
        (slot.icon):SetEnable(not isFiltered)
        ;
        (slot.icon):SetMonoTone(isFiltered)
        ;
        (slot.icon):SetIgnore(isFiltered)
        if isFiltered then
          (slot.icon):SetAlpha(0.5)
          ;
          (slot.icon):EraseAllEffect()
        else
          if self.filterFunc ~= nil then
            (slot.icon):AddEffect("UI_Inventory_Filtering", true, 0, 0)
          end
          _Inventory_updateSlotData_AddEffectMapea(ii, slotNo)
        end
        itemExist = true
        Panel_Inventory_isBlackStone_16002 = _Inventory_updateSlotData_AddEffectBlackStone(ii, isFiltered, slotNo)
        local itemKey = ((itemWrapper:get()):getKey()):getItemKey()
        _Inventory_updateSlotData_AutoSetPotion(playerLevel, itemKey, currentWhereType, slotNo)
        PaGlobal_TutorialManager:handleUpdateInventorySlotData(slot, itemKey)
        if (itemKey == 42000 or itemKey == 42001 or itemKey == 41607) and PaGlobal_SummonBossTutorial_Manager:isDoingSummonBossTutorial() == true and not FGlobal_FirstSummonItemUse() then
          (slot.icon):AddEffect("fUI_Tuto_ItemHp_01A", true, 0, 0)
        end
        local itemSSW = itemWrapper:getStaticStatus()
        local item_type = itemSSW:getItemType()
        if item_type == 5 then
          Panel_Inventory_isSocketItem = true
        end
        local offencePoint = 0
        local defencePoint = 0
        local equipOffencePoint = 0
        local equipDefencePoint = 0
        local isEquip = ((itemWrapper:getStaticStatus()):get()):isEquipable()
        local matchEquip = false
        local isAccessory = false
        offencePoint = _inventory_updateSlot_compareSpec(currentWhereType, slotNo, isAccessory)
        local currentEndurance = (itemWrapper:get()):getEndurance()
        local isUsableServant = (itemWrapper:getStaticStatus()):isUsableServant()
        if not isUsableServant and not Panel_Window_Exchange:GetShow() then
          if isEquip and defencePoint ~= nil and offencePoint ~= nil and currentEndurance > 0 and matchEquip == true and isAccessory == false and equipDefencePoint + equipOffencePoint < defencePoint + offencePoint then
            (slot.icon):AddEffect("fUI_BetterItemAura01", true, 0, 0)
            local equipPos = (itemWrapper:getStaticStatus()):getEquipSlotNo()
            Panel_NewEquip_Update(equipPos)
            PaGlobal_TutorialManager:handleNewEquipInInventory(slot)
          end
          do
            if currentEndurance > 0 and matchEquip == true and isAccessory == true and equipOffencePoint + equipDefencePoint < offencePoint + defencePoint then
              (slot.icon):AddEffect("fUI_BetterItemAura01", true, 0, 0)
              local equipPos = (itemWrapper:getStaticStatus()):getEquipSlotNo()
              Panel_NewEquip_Update(equipPos)
            end
            do
              do
                if ((self.slotEtcData)[ii]).isFirstItem == true and ((inven.slotEtcData)[ii]).itemKey == ((itemWrapper:get()):getKey()):getItemKey() then
                  local newItemEffectSceneId = (slot.icon):AddEffect("fUI_NewItem01", true, 0, 0)
                  -- DECOMPILER ERROR at PC532: Confused about usage of register: R47 in 'UnsetPending'

                  ;
                  (effectScene.newItem)[slotNo] = newItemEffectSceneId
                  UIMain_ItemUpdate()
                end
                local isUsableClass = nil
                if itemSSW ~= nil then
                  if (itemSSW:get()):isWeapon() or (itemSSW:get()):isSubWeapon() or (itemSSW:get()):isAwakenWeapon() then
                    isUsableClass = ((itemSSW:get())._usableClassType):isOn(classType)
                  else
                    isUsableClass = true
                  end
                else
                  isUsableClass = false
                end
                if isEquip == false then
                  (slot.icon):SetColor(UI_color.C_FFFFFFFF)
                else
                  if isUsableClass == true then
                    (slot.icon):SetColor(UI_color.C_FFFFFFFF)
                  else
                    ;
                    (slot.icon):SetColor(UI_color.C_FFD20000)
                  end
                end
                for iii = 0, _exchangeIndex do
                  if Panel_Window_Exchange:GetShow() and slotNo == _exchangeSlotNo[iii] then
                    (slot.icon):SetColor(UI_color.C_FFD20000)
                  else
                    if slotNo == _exchangeSlotNo[iii] and _exchangeSlotNo[iii] == nil then
                      (slot.icon):SetColor(UI_color.C_FFFFFFFF)
                    end
                  end
                end
                do
                  do
                    local itemBindType = ((itemSSW:get())._vestedType):getItemKey()
                    if Panel_Window_Exchange:GetShow() and itemBindType > 0 then
                      (slot.icon):SetColor(UI_color.C_FFD20000)
                    end
                    equipDefencePoint = 0
                    equipOffencePoint = 0
                    defencePoint = 0
                    offencePoint = 0
                    if not itemExist then
                      slot:clearItem()
                      ;
                      (slot.icon):SetEnable(true)
                      ;
                      (slot.icon):SetMonoTone(true)
                      ;
                      (slot.icon):SetIgnore(false)
                      slot.isEmpty = true
                    end
                    -- DECOMPILER ERROR at PC663: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC663: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC663: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC663: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC663: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC663: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC663: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC663: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
            end
          end
        end
      end
    end
    for i = 0, invenUseSize - 1 do
      local slotNo = i + useStartSlot
      local itemWrapper = getInventoryItemByType(currentWhereType, slotNo)
      if itemWrapper ~= nil then
        local itemKey = ((itemWrapper:get()):getKey()):getItemKey()
        if Panel_FixEquip:GetShow() then
          PaGlobal_FixEquip:useCashBtnEffectDelete()
          if PaGlobal_FixEquip:isRepeatRepair() and not FixEquip_InvenFiler_SubItem(slotNo, itemWrapper, currentWhereType) and PaGlobal_FixEquip:isFixEquip_SubSlotItemKey() == itemKey and not fixEquipCheck then
            fixEquipCheck = true
            PaGlobal_FixEquip:fixEquipContinue(slotNo)
          end
        end
      end
    end
    PaGlobal_FixEquip:fGlobal_closeFix()
    if Panel_Tooltip_Item_GetCurrentSlotType() == "QuickSlot" then
      Panel_Tooltip_Item_Refresh()
    end
    Inven_FindPuzzle()
    Panel_NewEquip_EffectLastUpdate()
    if Panel_Window_Inventory:GetShow() == true then
      Panel_Tooltip_Item_Refresh()
    end
    FGlobal_Inventory_WeightCheck()
    if Panel_Window_Servant:GetShow() then
      Panel_Window_Servant_Update()
    end
    FGlobal_WhereUseItemExecute()
    PaGlobal_FixEquip:fixEquipMoneyUpdate()
    PaGlobal_Repair:repairMoneyUpdate()
    FGlobal_ItemRandom_Money_Update()
  end
end

_inventory_updateSlot_compareSpec = function(whereType, slotNo, isAccessory)
  -- function num : 0_74
  local selfPlayerWrapper = getSelfPlayer()
  local classType = selfPlayerWrapper:getClassType()
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  local equipItemWrapper = getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())
  local offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(0) + (itemWrapper:getStaticStatus()):getMaxDamage(0)) / 2
  local defencePoint = (itemWrapper:getStaticStatus()):getDefence(0)
  local equipOffencePoint = 0
  local equipDefencePoint = 0
  local matchEquip = false
  local isEquip = (((itemWrapper:getStaticStatus()):get())._usableClassType):isOn(classType)
  local isAwakenWeaponContentsOpen = (PaGlobal_AwakenSkill.awakenWeapon)[classType]
  if isEquip and not Panel_Window_Exchange:GetShow() then
    local equipType = (itemWrapper:getStaticStatus()):getEquipType()
    local enum_class = CppEnums.ClassType
    local firstRingOffence = 0
    local firstRingDeffence = 0
    local secondRingOffence = 0
    local secondRingDeffence = 0
    local matchEquip = true
    if equipType == 16 or equipType == 17 then
      local accSlotNo = FGlobal_AccSlotNo(itemWrapper, false)
      local equipItemWrapper = getEquipmentItem(accSlotNo)
      if equipItemWrapper ~= nil then
        equipOffencePoint = ((equipItemWrapper:getStaticStatus()):getMinDamage(0) + (equipItemWrapper:getStaticStatus()):getMaxDamage(0)) / 2
        equipDefencePoint = (equipItemWrapper:getStaticStatus()):getDefence()
        return offencePoint, defencePoint, equipOffencePoint, equipDefencePoint, matchEquip, true
      else
        return offencePoint, defencePoint, equipOffencePoint, equipDefencePoint, matchEquip, true
      end
    else
      do
        if equipType == 15 or equipType == 18 then
          equipItemWrapper = getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())
          if equipItemWrapper ~= nil then
            equipOffencePoint = (((getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMinDamage(0) + ((getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMaxDamage(0)) / 2
            equipDefencePoint = ((getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getDefence()
            matchEquip = true
          else
            equipOffencePoint = 0
            equipDefencePoint = 0
            matchEquip = true
          end
          return offencePoint, defencePoint, equipOffencePoint, equipDefencePoint, matchEquip, true
        end
        equipItemWrapper = getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())
        if equipItemWrapper ~= nil then
          equipDefencePoint = ((getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getDefence(0)
          -- DECOMPILER ERROR at PC223: Unhandled construct in 'MakeBoolean' P3

          -- DECOMPILER ERROR at PC223: Unhandled construct in 'MakeBoolean' P3

          -- DECOMPILER ERROR at PC223: Unhandled construct in 'MakeBoolean' P3

          -- DECOMPILER ERROR at PC223: Unhandled construct in 'MakeBoolean' P3

          -- DECOMPILER ERROR at PC223: Unhandled construct in 'MakeBoolean' P3

          if ((enum_class.ClassType_Warrior == classType or enum_class.ClassType_Valkyrie == classType) and equipType == 1) or not isAwakenWeaponContentsOpen or equipType == 12 then
            offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(0) + (itemWrapper:getStaticStatus()):getMaxDamage(0)) / 2
            equipOffencePoint = (((getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMinDamage(0) + ((getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMaxDamage(0)) / 2
            defencePoint = (itemWrapper:getStaticStatus()):getDefence(0)
            matchEquip = true
          else
            -- DECOMPILER ERROR at PC286: Unhandled construct in 'MakeBoolean' P3

            -- DECOMPILER ERROR at PC286: Unhandled construct in 'MakeBoolean' P3

            -- DECOMPILER ERROR at PC286: Unhandled construct in 'MakeBoolean' P3

            -- DECOMPILER ERROR at PC286: Unhandled construct in 'MakeBoolean' P3

            -- DECOMPILER ERROR at PC286: Unhandled construct in 'MakeBoolean' P3

            if (enum_class.ClassType_Giant == classType and equipType == 29) or not isAwakenWeaponContentsOpen or equipType == 12 then
              offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(0) + (itemWrapper:getStaticStatus()):getMaxDamage(0)) / 2
              equipOffencePoint = (((getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMinDamage(0) + ((getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMaxDamage(0)) / 2
              matchEquip = true
            else
              -- DECOMPILER ERROR at PC343: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC343: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC343: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC343: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC343: Unhandled construct in 'MakeBoolean' P3

              if (enum_class.ClassType_Ranger == classType and equipType == 31) or not isAwakenWeaponContentsOpen or equipType == 12 then
                offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(1) + (itemWrapper:getStaticStatus()):getMaxDamage(1)) / 2
                equipOffencePoint = (((getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMinDamage(1) + ((getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMaxDamage(1)) / 2
                matchEquip = true
              else
                -- DECOMPILER ERROR at PC400: Unhandled construct in 'MakeBoolean' P3

                -- DECOMPILER ERROR at PC400: Unhandled construct in 'MakeBoolean' P3

                -- DECOMPILER ERROR at PC400: Unhandled construct in 'MakeBoolean' P3

                -- DECOMPILER ERROR at PC400: Unhandled construct in 'MakeBoolean' P3

                -- DECOMPILER ERROR at PC400: Unhandled construct in 'MakeBoolean' P3

                if (enum_class.ClassType_Sorcerer == classType and equipType == 28) or not isAwakenWeaponContentsOpen or equipType == 12 then
                  offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(2) + (itemWrapper:getStaticStatus()):getMaxDamage(2)) / 2
                  equipOffencePoint = (((getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMinDamage(2) + ((getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMaxDamage(2)) / 2
                  matchEquip = true
                else
                  -- DECOMPILER ERROR at PC457: Unhandled construct in 'MakeBoolean' P3

                  -- DECOMPILER ERROR at PC457: Unhandled construct in 'MakeBoolean' P3

                  -- DECOMPILER ERROR at PC457: Unhandled construct in 'MakeBoolean' P3

                  -- DECOMPILER ERROR at PC457: Unhandled construct in 'MakeBoolean' P3

                  -- DECOMPILER ERROR at PC457: Unhandled construct in 'MakeBoolean' P3

                  if (enum_class.ClassType_Tamer == classType and equipType == 2) or not isAwakenWeaponContentsOpen or equipType == 12 then
                    offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(2) + (itemWrapper:getStaticStatus()):getMaxDamage(2)) / 2
                    equipOffencePoint = (((getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMinDamage(2) + ((getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMaxDamage(2)) / 2
                    matchEquip = true
                  else
                    -- DECOMPILER ERROR at PC519: Unhandled construct in 'MakeBoolean' P3

                    -- DECOMPILER ERROR at PC519: Unhandled construct in 'MakeBoolean' P3

                    -- DECOMPILER ERROR at PC519: Unhandled construct in 'MakeBoolean' P3

                    -- DECOMPILER ERROR at PC519: Unhandled construct in 'MakeBoolean' P3

                    -- DECOMPILER ERROR at PC519: Unhandled construct in 'MakeBoolean' P3

                    -- DECOMPILER ERROR at PC519: Unhandled construct in 'MakeBoolean' P3

                    if ((enum_class.ClassType_NinjaWomen == classType or enum_class.ClassType_NinjaMan == classType) and equipType == 2) or not isAwakenWeaponContentsOpen or equipType == 12 then
                      offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(0) + (itemWrapper:getStaticStatus()):getMaxDamage(0)) / 2
                      equipOffencePoint = (((getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMinDamage(0) + ((getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMaxDamage(0)) / 2
                      matchEquip = true
                    else
                      -- DECOMPILER ERROR at PC579: Unhandled construct in 'MakeBoolean' P3

                      -- DECOMPILER ERROR at PC579: Unhandled construct in 'MakeBoolean' P3

                      -- DECOMPILER ERROR at PC579: Unhandled construct in 'MakeBoolean' P3

                      -- DECOMPILER ERROR at PC579: Unhandled construct in 'MakeBoolean' P3

                      -- DECOMPILER ERROR at PC579: Unhandled construct in 'MakeBoolean' P3

                      if ((enum_class.ClassType_BladeMaster == classType or enum_class.ClassType_BladeMasterWomen == classType) and equipType == 3) or not isAwakenWeaponContentsOpen or equipType == 12 then
                        offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(0) + (itemWrapper:getStaticStatus()):getMaxDamage(0)) / 2
                        equipOffencePoint = (((getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMinDamage(0) + ((getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMaxDamage(0)) / 2
                        matchEquip = true
                      else
                        -- DECOMPILER ERROR at PC639: Unhandled construct in 'MakeBoolean' P3

                        -- DECOMPILER ERROR at PC639: Unhandled construct in 'MakeBoolean' P3

                        -- DECOMPILER ERROR at PC639: Unhandled construct in 'MakeBoolean' P3

                        -- DECOMPILER ERROR at PC639: Unhandled construct in 'MakeBoolean' P3

                        -- DECOMPILER ERROR at PC639: Unhandled construct in 'MakeBoolean' P3

                        if ((enum_class.ClassType_Wizard == classType or enum_class.ClassType_WizardWomen == classType) and equipType == 6) or not isAwakenWeaponContentsOpen or equipType == 12 then
                          offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(2) + (itemWrapper:getStaticStatus()):getMaxDamage(2)) / 2
                          equipOffencePoint = (((getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMinDamage(2) + ((getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMaxDamage(2)) / 2
                          matchEquip = true
                        else
                          -- DECOMPILER ERROR at PC696: Unhandled construct in 'MakeBoolean' P3

                          -- DECOMPILER ERROR at PC696: Unhandled construct in 'MakeBoolean' P3

                          -- DECOMPILER ERROR at PC696: Unhandled construct in 'MakeBoolean' P3

                          -- DECOMPILER ERROR at PC696: Unhandled construct in 'MakeBoolean' P3

                          -- DECOMPILER ERROR at PC696: Unhandled construct in 'MakeBoolean' P3

                          if (enum_class.ClassType_DarkElf == classType and equipType == 63) or not isAwakenWeaponContentsOpen or equipType == 12 then
                            offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(2) + (itemWrapper:getStaticStatus()):getMaxDamage(2)) / 2
                            equipOffencePoint = (((getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMinDamage(2) + ((getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMaxDamage(2)) / 2
                            matchEquip = true
                          else
                            -- DECOMPILER ERROR at PC756: Unhandled construct in 'MakeBoolean' P3

                            -- DECOMPILER ERROR at PC756: Unhandled construct in 'MakeBoolean' P3

                            -- DECOMPILER ERROR at PC756: Unhandled construct in 'MakeBoolean' P3

                            -- DECOMPILER ERROR at PC756: Unhandled construct in 'MakeBoolean' P3

                            -- DECOMPILER ERROR at PC756: Unhandled construct in 'MakeBoolean' P3

                            if enum_class.ClassType_Combattant == classType or ((enum_class.ClassType_CombattantWomen == classType and equipType == 65) or not isAwakenWeaponContentsOpen or equipType == 12) then
                              offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(0) + (itemWrapper:getStaticStatus()):getMaxDamage(0)) / 2
                              equipOffencePoint = (((getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMinDamage(0) + ((getEquipmentItem((itemWrapper:getStaticStatus()):getEquipSlotNo())):getStaticStatus()):getMaxDamage(0)) / 2
                              matchEquip = true
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
        else
          -- DECOMPILER ERROR at PC816: Unhandled construct in 'MakeBoolean' P3

          -- DECOMPILER ERROR at PC816: Unhandled construct in 'MakeBoolean' P3

          -- DECOMPILER ERROR at PC816: Unhandled construct in 'MakeBoolean' P3

          -- DECOMPILER ERROR at PC816: Unhandled construct in 'MakeBoolean' P3

          -- DECOMPILER ERROR at PC816: Unhandled construct in 'MakeBoolean' P3

          if ((enum_class.ClassType_Warrior == classType or enum_class.ClassType_Valkyrie == classType) and equipType == 1) or not isAwakenWeaponContentsOpen or equipType == 12 then
            offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(0) + (itemWrapper:getStaticStatus()):getMaxDamage(0)) / 2
            defencePoint = (itemWrapper:getStaticStatus()):getDefence(0)
            matchEquip = true
          else
            -- DECOMPILER ERROR at PC855: Unhandled construct in 'MakeBoolean' P3

            -- DECOMPILER ERROR at PC855: Unhandled construct in 'MakeBoolean' P3

            -- DECOMPILER ERROR at PC855: Unhandled construct in 'MakeBoolean' P3

            -- DECOMPILER ERROR at PC855: Unhandled construct in 'MakeBoolean' P3

            -- DECOMPILER ERROR at PC855: Unhandled construct in 'MakeBoolean' P3

            if (enum_class.ClassType_Giant == classType and equipType == 29) or not isAwakenWeaponContentsOpen or equipType == 12 then
              offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(0) + (itemWrapper:getStaticStatus()):getMaxDamage(0)) / 2
              defencePoint = (itemWrapper:getStaticStatus()):getDefence(0)
              matchEquip = true
            else
              -- DECOMPILER ERROR at PC894: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC894: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC894: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC894: Unhandled construct in 'MakeBoolean' P3

              -- DECOMPILER ERROR at PC894: Unhandled construct in 'MakeBoolean' P3

              if (enum_class.ClassType_Ranger == classType and equipType == 31) or not isAwakenWeaponContentsOpen or equipType == 12 then
                offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(1) + (itemWrapper:getStaticStatus()):getMaxDamage(1)) / 2
                defencePoint = (itemWrapper:getStaticStatus()):getDefence(0)
                matchEquip = true
              else
                -- DECOMPILER ERROR at PC933: Unhandled construct in 'MakeBoolean' P3

                -- DECOMPILER ERROR at PC933: Unhandled construct in 'MakeBoolean' P3

                -- DECOMPILER ERROR at PC933: Unhandled construct in 'MakeBoolean' P3

                -- DECOMPILER ERROR at PC933: Unhandled construct in 'MakeBoolean' P3

                -- DECOMPILER ERROR at PC933: Unhandled construct in 'MakeBoolean' P3

                if (enum_class.ClassType_Sorcerer == classType and equipType == 28) or not isAwakenWeaponContentsOpen or equipType == 12 then
                  offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(2) + (itemWrapper:getStaticStatus()):getMaxDamage(2)) / 2
                  defencePoint = (itemWrapper:getStaticStatus()):getDefence(0)
                  matchEquip = true
                else
                  -- DECOMPILER ERROR at PC972: Unhandled construct in 'MakeBoolean' P3

                  -- DECOMPILER ERROR at PC972: Unhandled construct in 'MakeBoolean' P3

                  -- DECOMPILER ERROR at PC972: Unhandled construct in 'MakeBoolean' P3

                  -- DECOMPILER ERROR at PC972: Unhandled construct in 'MakeBoolean' P3

                  -- DECOMPILER ERROR at PC972: Unhandled construct in 'MakeBoolean' P3

                  if (enum_class.ClassType_Tamer == classType and equipType == 2) or not isAwakenWeaponContentsOpen or equipType == 12 then
                    offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(2) + (itemWrapper:getStaticStatus()):getMaxDamage(2)) / 2
                    defencePoint = (itemWrapper:getStaticStatus()):getDefence(0)
                    matchEquip = true
                  else
                    -- DECOMPILER ERROR at PC1016: Unhandled construct in 'MakeBoolean' P3

                    -- DECOMPILER ERROR at PC1016: Unhandled construct in 'MakeBoolean' P3

                    -- DECOMPILER ERROR at PC1016: Unhandled construct in 'MakeBoolean' P3

                    -- DECOMPILER ERROR at PC1016: Unhandled construct in 'MakeBoolean' P3

                    -- DECOMPILER ERROR at PC1016: Unhandled construct in 'MakeBoolean' P3

                    -- DECOMPILER ERROR at PC1016: Unhandled construct in 'MakeBoolean' P3

                    if ((enum_class.ClassType_NinjaWomen == classType or enum_class.ClassType_NinjaMan == classType) and equipType == 2) or not isAwakenWeaponContentsOpen or equipType == 12 then
                      offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(0) + (itemWrapper:getStaticStatus()):getMaxDamage(0)) / 2
                      defencePoint = (itemWrapper:getStaticStatus()):getDefence(0)
                      matchEquip = true
                    else
                      -- DECOMPILER ERROR at PC1058: Unhandled construct in 'MakeBoolean' P3

                      -- DECOMPILER ERROR at PC1058: Unhandled construct in 'MakeBoolean' P3

                      -- DECOMPILER ERROR at PC1058: Unhandled construct in 'MakeBoolean' P3

                      -- DECOMPILER ERROR at PC1058: Unhandled construct in 'MakeBoolean' P3

                      -- DECOMPILER ERROR at PC1058: Unhandled construct in 'MakeBoolean' P3

                      if ((enum_class.ClassType_BladeMaster == classType or enum_class.ClassType_BladeMasterWomen == classType) and equipType == 3) or not isAwakenWeaponContentsOpen or equipType == 12 then
                        offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(0) + (itemWrapper:getStaticStatus()):getMaxDamage(0)) / 2
                        defencePoint = (itemWrapper:getStaticStatus()):getDefence(0)
                        matchEquip = true
                      else
                        -- DECOMPILER ERROR at PC1100: Unhandled construct in 'MakeBoolean' P3

                        -- DECOMPILER ERROR at PC1100: Unhandled construct in 'MakeBoolean' P3

                        -- DECOMPILER ERROR at PC1100: Unhandled construct in 'MakeBoolean' P3

                        -- DECOMPILER ERROR at PC1100: Unhandled construct in 'MakeBoolean' P3

                        -- DECOMPILER ERROR at PC1100: Unhandled construct in 'MakeBoolean' P3

                        if ((enum_class.ClassType_Wizard == classType or enum_class.ClassType_WizardWomen == classType) and equipType == 6) or not isAwakenWeaponContentsOpen or equipType == 12 then
                          offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(2) + (itemWrapper:getStaticStatus()):getMaxDamage(2)) / 2
                          defencePoint = (itemWrapper:getStaticStatus()):getDefence(0)
                          matchEquip = true
                        else
                          -- DECOMPILER ERROR at PC1139: Unhandled construct in 'MakeBoolean' P3

                          -- DECOMPILER ERROR at PC1139: Unhandled construct in 'MakeBoolean' P3

                          -- DECOMPILER ERROR at PC1139: Unhandled construct in 'MakeBoolean' P3

                          -- DECOMPILER ERROR at PC1139: Unhandled construct in 'MakeBoolean' P3

                          -- DECOMPILER ERROR at PC1139: Unhandled construct in 'MakeBoolean' P3

                          if (enum_class.ClassType_DarkElf == classType and equipType == 63) or not isAwakenWeaponContentsOpen or equipType == 12 then
                            offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(2) + (itemWrapper:getStaticStatus()):getMaxDamage(2)) / 2
                            defencePoint = (itemWrapper:getStaticStatus()):getDefence(0)
                            matchEquip = true
                          else
                            -- DECOMPILER ERROR at PC1181: Unhandled construct in 'MakeBoolean' P3

                            -- DECOMPILER ERROR at PC1181: Unhandled construct in 'MakeBoolean' P3

                            -- DECOMPILER ERROR at PC1181: Unhandled construct in 'MakeBoolean' P3

                            -- DECOMPILER ERROR at PC1181: Unhandled construct in 'MakeBoolean' P3

                            -- DECOMPILER ERROR at PC1181: Unhandled construct in 'MakeBoolean' P3

                            if enum_class.ClassType_Combattant == classType or ((enum_class.ClassType_CombattantWomen == classType and equipType == 65) or not isAwakenWeaponContentsOpen or equipType == 12) then
                              offencePoint = ((itemWrapper:getStaticStatus()):getMinDamage(0) + (itemWrapper:getStaticStatus()):getMaxDamage(0)) / 2
                              defencePoint = (itemWrapper:getStaticStatus()):getDefence(0)
                              matchEquip = true
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
        isAccessory = false
        do return offencePoint, defencePoint, equipOffencePoint, equipDefencePoint, matchEquip, isAccessory end
      end
    end
  end
end

isNormalInvenCheck = function()
  -- function num : 0_75 , upvalues : isNormalInven
  return isNormalInven
end

_Inventory_updateSlotData_ChangeSilverIcon = function(money)
  -- function num : 0_76 , upvalues : inven
  local self = inven
  if Int64toInt32(money) >= 100000 then
    (self.buttonMoney):ChangeTextureInfoName("new_ui_common_forlua/window/inventory/Silver4.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(self.buttonMoney, 0, 0, 30, 30)
    ;
    ((self.buttonMoney):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    (self.buttonMoney):setRenderTexture((self.buttonMoney):getBaseTexture())
    ;
    (self.buttonMoney):ChangeOnTextureInfoName("new_ui_common_forlua/window/inventory/Silver4_Over.dds")
    ;
    (self.buttonMoney):ChangeClickTextureInfoName("new_ui_common_forlua/window/inventory/Silver4_Over.dds")
  else
    do
      if Int64toInt32(money) >= 20000 then
        (self.buttonMoney):ChangeTextureInfoName("new_ui_common_forlua/window/inventory/Silver3.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(self.buttonMoney, 0, 0, 30, 30)
        ;
        ((self.buttonMoney):getBaseTexture()):setUV(x1, y1, x2, y2)
        ;
        (self.buttonMoney):setRenderTexture((self.buttonMoney):getBaseTexture())
        ;
        (self.buttonMoney):ChangeOnTextureInfoName("new_ui_common_forlua/window/inventory/Silver3_Over.dds")
        ;
        (self.buttonMoney):ChangeClickTextureInfoName("new_ui_common_forlua/window/inventory/Silver3_Over.dds")
      else
        do
          if Int64toInt32(money) >= 5000 then
            (self.buttonMoney):ChangeTextureInfoName("new_ui_common_forlua/window/inventory/Silver2.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(self.buttonMoney, 0, 0, 30, 30)
            ;
            ((self.buttonMoney):getBaseTexture()):setUV(x1, y1, x2, y2)
            ;
            (self.buttonMoney):setRenderTexture((self.buttonMoney):getBaseTexture())
            ;
            (self.buttonMoney):ChangeOnTextureInfoName("new_ui_common_forlua/window/inventory/Silver2_Over.dds")
            ;
            (self.buttonMoney):ChangeClickTextureInfoName("new_ui_common_forlua/window/inventory/Silver2_Over.dds")
          else
            do
              ;
              (self.buttonMoney):ChangeTextureInfoName("new_ui_common_forlua/window/inventory/Silver1.dds")
              local x1, y1, x2, y2 = setTextureUV_Func(self.buttonMoney, 0, 0, 30, 30)
              ;
              ((self.buttonMoney):getBaseTexture()):setUV(x1, y1, x2, y2)
              ;
              (self.buttonMoney):setRenderTexture((self.buttonMoney):getBaseTexture())
              ;
              (self.buttonMoney):ChangeOnTextureInfoName("new_ui_common_forlua/window/inventory/Silver1_Over.dds")
              ;
              (self.buttonMoney):ChangeClickTextureInfoName("new_ui_common_forlua/window/inventory/Silver1_Over.dds")
            end
          end
        end
      end
    end
  end
end

_Inventory_updateSlotData_ChangeWeightIcon = function(s64_allWeight, s64_maxWeight_div)
  -- function num : 0_77 , upvalues : inven
  local self = inven
  if Int64toInt32(s64_allWeight / s64_maxWeight_div) >= 80 then
    (self.weightIcon):ChangeTextureInfoName("new_ui_common_forlua/window/inventory/WeightOver.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(self.weightIcon, 0, 0, 30, 30)
    ;
    ((self.weightIcon):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    (self.weightIcon):setRenderTexture((self.weightIcon):getBaseTexture())
  else
    do
      ;
      (self.weightIcon):ChangeTextureInfoName("new_ui_common_forlua/window/inventory/weight.dds")
      local x1, y1, x2, y2 = setTextureUV_Func(self.weightIcon, 0, 0, 30, 30)
      ;
      ((self.weightIcon):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (self.weightIcon):setRenderTexture((self.weightIcon):getBaseTexture())
    end
  end
end

_Inventory_updateSlotData_ChangeFilterBtnTexture = function(isFiltered, slotNo, stdBackGround)
  -- function num : 0_78 , upvalues : inven, _filter_for_NormalTab, _filter_for_TradeTab, _filter_for_HousingTab
  local self = inven
  local itemWrapper = getInventoryItemByType(Inventory_GetCurrentInventoryType(), slotNo)
  if (self.radioButtonStd):IsChecked() then
    isFiltered = _filter_for_NormalTab(slotNo, itemWrapper)
    stdBackGround:ChangeTextureInfoName("New_UI_Common_forLua/Window/Inventory/Inventory_00.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(stdBackGround, 0, 1, 256, 129)
    ;
    (stdBackGround:getBaseTexture()):setUV(x1, y1, x2, y2)
    stdBackGround:setRenderTexture(stdBackGround:getBaseTexture())
  else
    do
      if (self.radioButtonTransport):IsChecked() then
        isFiltered = _filter_for_TradeTab(slotNo, itemWrapper)
        stdBackGround:ChangeTextureInfoName("New_UI_Common_forLua/Window/Inventory/Inventory_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(stdBackGround, 256, 1, 512, 129)
        ;
        (stdBackGround:getBaseTexture()):setUV(x1, y1, x2, y2)
        stdBackGround:setRenderTexture(stdBackGround:getBaseTexture())
      else
        do
          if (self.radioButtonHousing):IsChecked() then
            isFiltered = _filter_for_HousingTab(slotNo, itemWrapper)
            stdBackGround:ChangeTextureInfoName("New_UI_Common_forLua/Window/Inventory/Inventory_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(stdBackGround, 0, 130, 256, 258)
            ;
            (stdBackGround:getBaseTexture()):setUV(x1, y1, x2, y2)
            stdBackGround:setRenderTexture(stdBackGround:getBaseTexture())
          end
          do
            return isFiltered
          end
        end
      end
    end
  end
end

_Inventory_updateSlotData_AutoSetPotion = function(playerLevel, itemKey, currentWhereType, slotNo)
  -- function num : 0_79
  if playerLevel <= 10 then
    if itemKey == 502 or itemKey == 513 or itemKey == 514 or itemKey == 517 or itemKey == 518 or itemKey == 519 or itemKey == 524 or itemKey == 525 or itemKey == 528 or itemKey == 529 or itemKey == 530 or itemKey == 538 or itemKey == 551 or itemKey == 552 or itemKey == 553 or itemKey == 554 or itemKey == 555 or itemKey == 17568 or itemKey == 17569 or itemKey == 19932 or itemKey == 19933 or itemKey == 19934 or itemKey == 19935 then
      FGlobal_Potion_InvenToQuickSlot(currentWhereType, slotNo, 0)
    else
      if itemKey == 503 or itemKey == 515 or itemKey == 516 or itemKey == 520 or itemKey == 521 or itemKey == 522 or itemKey == 526 or itemKey == 527 or itemKey == 531 or itemKey == 532 or itemKey == 533 or itemKey == 540 or itemKey == 561 or itemKey == 562 or itemKey == 563 or itemKey == 564 or itemKey == 565 or itemKey == 17570 or itemKey == 17571 or itemKey == 19936 or itemKey == 19937 or itemKey == 19938 then
        FGlobal_Potion_InvenToQuickSlot(currentWhereType, slotNo, 1)
      end
    end
  end
end

_Inventory_updateSlotData_AddEffectBlackStone = function(ii, isFiltered, slotNo)
  -- function num : 0_80 , upvalues : inven
  local self = inven
  local slot = (self.slots)[ii]
  local itemWrapper = getInventoryItemByType(Inventory_GetCurrentInventoryType(), slotNo)
  local Panel_Inventory_isBlackStone_16002 = false
  local itemKey = ((itemWrapper:get()):getKey()):getItemKey()
  if itemKey == 16001 then
    if not isFiltered then
      (slot.icon):AddEffect("fUI_DarkstoneAura01", false, 0, 0)
    end
    Panel_Inventory_isBlackStone_16001 = true
  else
    if itemKey == 16002 then
      if not isFiltered then
        (slot.icon):AddEffect("fUI_DarkstoneAura02", false, 0, 0)
      end
      Panel_Inventory_isBlackStone_16002 = true
    end
  end
  return Panel_Inventory_isBlackStone_16002
end

_Inventory_updateSlotData_AddEffectMapea = function(ii, slotNo)
  -- function num : 0_81 , upvalues : inven
  local self = inven
  local slot = (self.slots)[ii]
  local itemWrapper = getInventoryItemByType(Inventory_GetCurrentInventoryType(), slotNo)
  if GetUIMode() == (Defines.UIMode).eUIMode_Stable and not EffectFilter_Mapae(slotNo, itemWrapper) then
    (slot.icon):AddEffect("fUI_HorseNameCard01", true, 0, 0)
  end
end

Inventory_AddItem = function(itemKey, slotNo, itemCount)
  -- function num : 0_82 , upvalues : inven
  local self = inven
  for ii = 0, (self.config).slotCount - 1 do
    local slot = (self.slots)[ii]
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R9 in 'UnsetPending'

    if slotNo == slot._slotNo then
      ((inven.slotEtcData)[ii]).isFirstItem = true
      -- DECOMPILER ERROR at PC19: Confused about usage of register: R9 in 'UnsetPending'

      ;
      ((inven.slotEtcData)[ii]).itemKey = itemKey
    end
  end
  if itemKey == 1 then
    audioPostEvent_SystemUi(3, 12)
  else
    if itemKey == 2 then
      audioPostEvent_SystemUi(3, 12)
    end
  end
end

Inventory_SetShowWithFilter = function(actorType)
  -- function num : 0_83
  Inventory_SetShow(true)
  if (CppEnums.ActorType).ActorType_Player == actorType or (CppEnums.ActorType).ActorType_Deadbody == actorType then
    Inventory_SetFunctor(InvenFiler_InterActionDead, Inventory_UseItemTarget, InventoryWindow_Close, nil)
  else
    if (CppEnums.ActorType).ActorType_Vehicle == actorType then
      Inventory_SetFunctor(InvenFiler_InterActionFodder, Inventory_UseItemTarget, InventoryWindow_Close, nil)
    else
      if (CppEnums.ActorType).ActorType_Npc == actorType then
        Inventory_SetFunctor(InvenFiler_InterActionFuel, Inventory_UseFuelItem, InventoryWindow_Close, nil)
      end
    end
  end
end

Inventory_UseItemTargetSelf = function(whereType, slotNo, equipSlotNo)
  -- function num : 0_84 , upvalues : isFirstSummonItemUse
  if restrictedActionForUseItem() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TEXT_CANT_USEITEM"))
    return 
  end
  local isTargetSelfPlayer = true
  local currentWhereType = Inventory_GetCurrentInventoryType()
  local itemWrapper = getInventoryItemByType(currentWhereType, slotNo)
  if itemWrapper == nil then
    return 
  end
  local itemKey = ((itemWrapper:get()):getKey()):getItemKey()
  -- DECOMPILER ERROR at PC47: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC47: Unhandled construct in 'MakeBoolean' P3

  -- DECOMPILER ERROR at PC47: Unhandled construct in 'MakeBoolean' P3

  if (itemKey >= 41548 and itemKey <= 41570) or itemKey < 42000 or itemKey < 42034 or itemKey == 42054 then
    audioPostEvent_SystemUi(0, 14)
  end
  inventoryUseItem(whereType, slotNo, equipSlotNo, isTargetSelfPlayer)
  if (itemKey == 42000 or itemKey == 42001) and PaGlobal_SummonBossTutorial_Manager:isDoingSummonBossTutorial() then
    isFirstSummonItemUse = true
  end
end

FGlobal_FirstSummonItemUse = function()
  -- function num : 0_85 , upvalues : isFirstSummonItemUse
  return isFirstSummonItemUse
end

Inventory_UseItemTarget = function(slotNo, itemWrapper, count_s64, inventoryType)
  -- function num : 0_86
  if restrictedActionForUseItem() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TEXT_CANT_USEITEM"))
    return 
  end
  local isTargetSelfPlayer = false
  inventoryUseItem(inventoryType, slotNo, isTargetSelfPlayer)
end

InvenFiler_InterActionDead = function(slotNo, itemWrapper)
  -- function num : 0_87
  if itemWrapper == nil then
    return true
  end
  if not ((itemWrapper:getStaticStatus()):get()):isItemTargetAlive() then
    return not itemWrapper:checkConditions()
  end
end

InvenFiler_InterActionSkill = function(slotNo, itemWrapper)
  -- function num : 0_88
  if itemWrapper == nil then
    return true
  end
  do return ((itemWrapper:getStaticStatus()):get()):isItemSkill() and not itemWrapper:checkConditions() end
  -- DECOMPILER ERROR: 2 unprocessed JMP targets
end

InvenFiler_InterActionFodder = function(slotNo, itemWrapper)
  -- function num : 0_89
  if itemWrapper == nil then
    return true
  end
  do return ((itemWrapper:getStaticStatus()):get()):isUseToVehicle() and not itemWrapper:checkConditions() end
  -- DECOMPILER ERROR: 2 unprocessed JMP targets
end

InvenFiler_InterActionFuel = function(slotNo, itemWrapper)
  -- function num : 0_90
  if itemWrapper == nil then
    return true
  end
  return not isFusionItem(Inventory_GetCurrentInventoryType(), slotNo)
end

Inventory_UseFuelItem = function(slotNo, itemWrapper, count_s64, inventoryType)
  -- function num : 0_91
  burnItemToActor(inventoryType, slotNo, 1, false)
end

restrictedActionForUseItem = function()
  -- function num : 0_92
  if not checkManufactureAction() then
    local isRestricted = checkAlchemyAction()
  end
  return isRestricted
end

Inventory_SetShow = function(isInvenShow)
  -- function num : 0_93 , upvalues : inven, isFirstTab
  local self = inven
  isFirstTab = true
  if not isInvenShow then
    InventoryWindow_Close()
    Panel_Tooltip_Item_hideTooltip()
    ;
    (PaGlobal_TutorialUiManager:getUiMasking()):hideQuestMasking()
  else
    if Panel_Manufacture:GetShow() then
      (self.radioButtonCashInven):SetIgnore(true)
      ;
      (self.radioButtonCashInven):SetMonoTone(true)
    else
      ;
      (self.radioButtonCashInven):SetIgnore(false)
      ;
      (self.radioButtonCashInven):SetMonoTone(false)
    end
    InventoryWindow_Show()
  end
end

inven.registMessageHandler = function(self)
  -- function num : 0_94
  registerEvent("FromClient_WeightChanged", "Inventory_updateSlotData")
  registerEvent("FromClient_InventoryUpdate", "Inventory_updateSlotData")
  registerEvent("EventInventorySetShow", "Inventory_SetShow")
  registerEvent("EventInventorySetShowWithFilter", "Inventory_SetShowWithFilter")
  registerEvent("EventAddItemToInventory", "Inventory_AddItem")
  registerEvent("EventUnEquipItemToInventory", "Inventory_UnequipItem")
  registerEvent("FromClient_UseItemAskFromOtherPlayer", "UseItemAskFromOtherPlayer")
  registerEvent("onScreenResize", "Inventory_RePosition")
  registerEvent("FromClient_FindExchangeItemNPC", "FromClient_FindExchangeItemNPC")
end

Inventory_RePosition = function()
  -- function num : 0_95 , upvalues : inven
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local invenSizeX = Panel_Window_Inventory:GetSizeX()
  local invenSizeY = Panel_Window_Inventory:GetSizeY()
  Panel_Window_Inventory:SetPosX(scrSizeX - invenSizeX)
  Panel_Window_Inventory:SetPosY((scrSizeY - invenSizeY) / 2)
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R4 in 'UnsetPending'

  inven.orgPosX = Panel_Window_Inventory:GetPosX()
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R4 in 'UnsetPending'

  inven.orgPosY = Panel_Window_Inventory:GetPosY()
end

Inventory_GetStartIndex = function()
  -- function num : 0_96 , upvalues : inven
  local self = inven
  return self.startSlotIndex
end

Inventory_CashTabScroll = function(isUp)
  -- function num : 0_97 , upvalues : inven
  local self = inven
  local useStartSlot = inventorySlotNoUserStart()
  local inventory = Inventory_GetCurrentInventory()
  local maxSize = inventory:sizeXXX() - useStartSlot
  self.startSlotIndex = (UIScroll.ScrollEvent)(self._scroll, isUp, (self.config).slotRows, maxSize, self.startSlotIndex, (self.config).slotCols)
  Inventory_updateSlotData()
end

Inventory_SetFunctor = function(filterFunction, rClickFunction, otherWindowOpenFunction, effect)
  -- function num : 0_98 , upvalues : inven
  local self = inven
  if otherWindowOpenFunction == self.otherWindowOpenFunc then
    do
      do
        local otherWindowOpenFuncDiff = self.otherWindowOpenFunc == nil or otherWindowOpenFunction == nil
        if otherWindowOpenFuncDiff and (filterFunction ~= nil or rClickFunction ~= nil or otherWindowOpenFunction ~= nil) then
          (self.otherWindowOpenFunc)()
        end
        if filterFunction ~= nil and type(filterFunction) ~= "function" then
          filterFunction = nil
          ;
          (UI.ASSERT)(false, "Param 1 must be Function type")
        end
        if rClickFunction ~= nil and type(rClickFunction) ~= "function" then
          rClickFunction = nil
          ;
          (UI.ASSERT)(false, "Param 1 must be Function type")
        end
        if effect ~= nil and type(effect) ~= "function" then
          effect = nil
          ;
          (UI.ASSERT)(false, "Param 1 must be Function type")
        end
        self.otherWindowOpenFunc = otherWindowOpenFunction
        self.rClickFunc = rClickFunction
        self.filterFunc = filterFunction
        self.effect = effect
        if Panel_Window_Inventory:GetShow() then
          Inventory_updateSlotData()
        end
        -- DECOMPILER ERROR: 7 unprocessed JMP targets
      end
    end
  end
end

Inventory_DropHandler = function(index)
  -- function num : 0_99 , upvalues : inven
  local self = inven
  local slotNo = ((self.slots)[index])._slotNo
  if DragManager.dragStartPanel == nil then
    return false
  end
  if restrictedActionForUseItem() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TEXT_CANT_REPOSITIONITEM"))
    return false
  end
  if Panel_Window_Exchange:IsShow() or Panel_Manufacture:IsShow() or Panel_Alchemy:IsShow() or Panel_Win_System:IsShow() then
    DragManager:clearInfo()
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TEXT_CANT_REPOSITIONITEM_WHILE_UI"))
    return false
  end
  local fromSlotNo = DragManager.dragSlotInfo
  if Panel_Window_Inventory == DragManager.dragStartPanel then
    if DragManager.dragWhereTypeInfo == Inventory_GetCurrentInventoryType() then
      inventory_swapItem(Inventory_GetCurrentInventoryType(), DragManager.dragSlotInfo, slotNo)
    end
    Inventory_DropEscape()
    DragManager:clearInfo()
  else
    return DragManager:itemDragMove((CppEnums.MoveItemToType).Type_Player, (getSelfPlayer()):getActorKey())
  end
  return true
end

Inventory_DropEscape = function()
  -- function num : 0_100 , upvalues : icon_TrashOn, icon_TrashSequence
  icon_TrashOn:SetShow(false)
  icon_TrashSequence:SetShow(false)
end

Inventory_DropEscapeAlert = function()
  -- function num : 0_101 , upvalues : icon_TrashOn, icon_TrashSequence
  icon_TrashOn:SetShow(false)
  icon_TrashSequence:SetShow(true)
end

Inventory_DropOnTrashButton = function(isShow)
  -- function num : 0_102 , upvalues : icon_TrashOn, icon_TrashSequence
  if not isShow then
    icon_TrashOn:SetShow(true)
    icon_TrashSequence:SetShow(false)
  end
  icon_TrashOn:SetShow(false)
  icon_TrashSequence:SetShow(true)
end

Inventory_UnequipItem = function(whereType, slotNo)
  -- function num : 0_103 , upvalues : inven
  local self = inven
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if itemWrapper == nil then
    return 
  end
  local itemStatic = (itemWrapper:getStaticStatus()):get()
  if itemStatic == nil then
    return 
  end
  for ii = 0, (self.config).slotCount - 1 do
    local slot = (self.slots)[ii]
    if slotNo == slot._slotNo then
      (slot.background):AddEffect("fUI_Item_Clear", false, 0, 0)
    end
  end
  audioPostEvent_SystemUi(2, 0)
end

inven:init()
inven:createSlot()
inven:registEventHandler()
inven:registMessageHandler()
Inven_FindPuzzle = function()
  -- function num : 0_104 , upvalues : inven
  local self = inven
  for _,value in pairs(inven.slotEtcData) do
    (value.puzzleControl):SetShow(false)
  end
  if (self.checkButton_Sort):IsCheck() then
    return 
  end
  local whereType = Inventory_GetCurrentInventoryType()
  local isFind = findPuzzleAndReadyMake(whereType)
  local useSlotNo = inventorySlotNoUserStart()
  if not isFind then
    return 
  end
  local count = getPuzzleSlotCount()
  for ii = 0, count - 1 do
    local slotNo = getPuzzleSlotAt(ii)
    for jj = 0, (self.config).slotCount - 1 do
      local slot = (self.slots)[jj]
      if slotNo == slot._slotNo then
        (slot.icon):AddEffect("UI_Item_MineCraft", true, 0, 0)
      end
    end
  end
  local slotNumber = getPuzzleSlotAt(0)
  for ii = 0, (self.config).slotCount - 1 do
    local slot = (self.slots)[ii]
    if slotNumber == slot._slotNo then
      (((self.slotEtcData)[ii]).puzzleControl):SetShow(true)
    end
  end
end

PuzzleButton_Over = function(slotIndex)
  -- function num : 0_105 , upvalues : inven, _puzzleNoticeText, UI_TM, _puzzleMessage, _puzzleNotice
  local self = inven
  local slot = (self.slots)[slotIndex]
  Panel_Tooltip_Item_hideTooltip()
  _puzzleNoticeText:SetTextMode(UI_TM.eTextMode_AutoWrap)
  _puzzleNoticeText:SetAutoResize(true)
  _puzzleMessage = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TEXT_DOPUZZLE")
  _puzzleNoticeText:SetText(_puzzleMessage)
  _puzzleNotice:SetPosX((slot.icon):GetPosX() - _puzzleNotice:GetSizeX())
  _puzzleNotice:SetPosY((slot.icon):GetPosY() - 20)
  _puzzleNotice:SetSize(_puzzleNotice:GetSizeX(), _puzzleNoticeText:GetSizeY() + 10)
  _puzzleNotice:SetColor((Defines.Color).C_FF000000)
  _puzzleNotice:ComputePos()
  _puzzleNotice:SetShow(true)
end

PuzzleButton_Out = function(slotIndex)
  -- function num : 0_106 , upvalues : _puzzleNotice
  _puzzleNotice:SetShow(false)
end

MakePuzzle = function(index)
  -- function num : 0_107 , upvalues : inven, _puzzleNotice
  local self = inven
  ;
  (((self.slotEtcData)[index]).puzzleControl):SetShow(false)
  _puzzleNotice:SetShow(false)
  requestMakePuzzle()
end

UseItemAskFromOtherPlayer = function(fromName)
  -- function num : 0_108
  local messageboxMemo = "[<PAColor0xFFE49800>" .. fromName .. "<PAOldColor>" .. PAGetString(Defines.StringSheet_GAME, "LUA_USEITEM_MESSAGEBOX_REQUEST")
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_USEITEM_MESSAGEBOX_TITLE"), content = messageboxMemo, functionYes = UseItemFromOtherPlayer_Yes, functionCancel = UseItemFromOtherPlayer_No, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

UseItemFromOtherPlayer_Yes = function()
  -- function num : 0_109
  useItemFromOtherPlayer(true)
end

UseItemFromOtherPlayer_No = function()
  -- function num : 0_110
  useItemFromOtherPlayer(false)
end

Inventory_FilterRadioTooltip_Show = function(isShow, target)
  -- function num : 0_111 , upvalues : inven, FilterRadioTooltip
  local self = inven
  if isShow == true then
    if FilterRadioTooltip:GetShow() then
      FilterRadioTooltip:SetShow(false)
    end
    local control = nil
    if target == 0 then
      control = self.radioButtonStd
      FilterRadioTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TEXT_FILTERTOOLTIP_ALL"))
    else
      if target == 1 then
        control = self.radioButtonTransport
        FilterRadioTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TEXT_FILTERTOOLTIP_TRADE"))
      else
        if target == 2 then
          control = self.radioButtonHousing
          FilterRadioTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TEXT_FILTERTOOLTIP_HOUSING"))
        end
      end
    end
    FilterRadioTooltip:SetPosX(control:GetPosX() - FilterRadioTooltip:GetSizeX())
    FilterRadioTooltip:SetPosY(control:GetPosY() - FilterRadioTooltip:GetTextSizeY())
    FilterRadioTooltip:SetShow(true)
  else
    do
      FilterRadioTooltip:SetShow(false)
    end
  end
end

Inventory_TrashToolTip = function(isShow)
  -- function num : 0_112 , upvalues : icon_TrashOn, icon_TrashSequence, inven
  if not isShow then
    TooltipSimple_Hide()
    if DragManager:isDragging() then
      icon_TrashOn:SetShow(true)
    else
      icon_TrashOn:SetShow(false)
    end
    icon_TrashSequence:SetShow(false)
    return 
  end
  local name, desc, control = nil, nil, nil
  local self = inven
  name = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TRASH_TOOLTIP_TITLE")
  desc = PAGetString(Defines.StringSheet_GAME, "LUA_INVENTORY_TRASH_TOOLTIP_DESC")
  if DragManager:isDragging() then
    icon_TrashOn:SetShow(false)
    icon_TrashSequence:SetShow(true)
  end
  control = self.trashArea
  TooltipSimple_Show(control, name, desc)
end

local panel_tmpPosX = 0
local panel_tmpPosY = 0
Inventory_PosSaveMemory = function()
  -- function num : 0_113 , upvalues : panel_tmpPosX, panel_tmpPosY
  panel_tmpPosX = Panel_Window_Inventory:GetPosX()
  panel_tmpPosY = Panel_Window_Inventory:GetPosY()
end

Inventory_PosLoadMemory = function()
  -- function num : 0_114 , upvalues : panel_tmpPosX, panel_tmpPosY
  Panel_Window_Inventory:SetPosX(panel_tmpPosX)
  Panel_Window_Inventory:SetPosY(panel_tmpPosY)
end

Inventory_RePosition()
Inventory_SetIgnoreMoneyButton = function(setIgnore)
  -- function num : 0_115 , upvalues : inven
  local self = inven
  if setIgnore == true and not Panel_Window_Warehouse:GetShow() then
    (self.buttonMoney):SetIgnore(true)
  else
    ;
    (self.buttonMoney):SetIgnore(false)
  end
end

Inventory_ManufactureBTN = function()
  -- function num : 0_116
  if MiniGame_Manual_Value_FishingStart == true then
    return 
  else
    if not IsSelfPlayerWaitAction() then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_MANUFACTURE"))
      return 
    end
    if Panel_Manufacture ~= nil and Panel_Window_Inventory ~= nil and Panel_Equipment ~= nil then
      local isInvenOpen = Panel_Window_Inventory:GetShow()
      local isManufactureOpen = Panel_Manufacture:GetShow()
      if isManufactureOpen == false or isInvenOpen == false then
        audioPostEvent_SystemUi(1, 26)
        Manufacture_Show(nil, (CppEnums.ItemWhereType).eInventory, true, true)
        if Panel_Manufacture:GetShow() then
          Panel_Equipment:SetShow(false)
        end
      end
    end
    do
      do return  end
    end
  end
end

FGlobal_RecentCookItemCheck = function(itemKey, itemCount)
  -- function num : 0_117 , upvalues : inven, isNormalInven
  local self = inven
  local selfPlayerWrapper = getSelfPlayer()
  if selfPlayerWrapper == nil then
    return 
  end
  local saveInfo = {}
  local useStartSlot = (inventorySlotNoUserStart())
  local returnSlotNo = nil
  local selfPlayer = selfPlayerWrapper:get()
  local invenUseSize = selfPlayer:getInventorySlotCount(not isNormalInven)
  for i = 0, invenUseSize - 1 do
    local slotNo = i + useStartSlot
    local itemWrapper = getInventoryItemByType((CppEnums.ItemWhereType).eInventory, slotNo)
    if itemWrapper ~= nil then
      local itemSSW = itemWrapper:getStaticStatus()
      local invenItemKey = ((itemSSW:get())._key):getItemKey()
      if itemKey == invenItemKey then
        saveInfo.slotNo = slotNo
        returnSlotNo = slotNo
      end
    end
  end
  return returnSlotNo
end

inventory_FlushRestoreFunc = function()
  -- function num : 0_118 , upvalues : btn_Manufacture, btn_AlchemyStone, btn_AlchemyFigureHead, btn_DyePalette
  btn_Manufacture:SetEnable(true)
  btn_Manufacture:SetMonoTone(false)
  btn_AlchemyStone:SetEnable(true)
  btn_AlchemyStone:SetMonoTone(false)
  btn_AlchemyFigureHead:SetEnable(true)
  btn_AlchemyFigureHead:SetMonoTone(false)
  btn_DyePalette:SetEnable(true)
  btn_DyePalette:SetMonoTone(false)
end

renderModeChange_inventory_FlushRestoreFunc = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_119 , upvalues : btn_Manufacture, btn_AlchemyStone, btn_AlchemyFigureHead, btn_DyePalette
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    if isFlushedUI() then
      btn_Manufacture:SetEnable(false)
      btn_Manufacture:SetMonoTone(true)
      btn_AlchemyStone:SetEnable(false)
      btn_AlchemyStone:SetMonoTone(true)
      btn_AlchemyFigureHead:SetEnable(false)
      btn_AlchemyFigureHead:SetMonoTone(true)
      btn_DyePalette:SetEnable(false)
      btn_DyePalette:SetMonoTone(true)
    end
    return 
  end
  inventory_FlushRestoreFunc()
end

Global_GetInventorySlotNoByNotSorted = function(fromSlotNo)
  -- function num : 0_120 , upvalues : inven
  if fromSlotNo == nil then
    return 
  end
  local self = inven
  local toSlotNo = ((self.slots)[fromSlotNo])._slotNo
  return toSlotNo
end

FGlobal_UpdateInventoryWeight = function()
  -- function num : 0_121 , upvalues : inven
  local self = inven
  local selfPlayerWrapper = getSelfPlayer()
  local selfPlayer = selfPlayerWrapper:get()
  local _const = Defines.s64_const
  local normalInventory = selfPlayer:getInventoryByType((CppEnums.ItemWhereType).eInventory)
  local s64_moneyWeight = normalInventory:getMoneyWeight_s64()
  local s64_equipmentWeight = (selfPlayer:getEquipment()):getWeight_s64()
  local s64_allWeight = selfPlayer:getCurrentWeight_s64()
  local s64_maxWeight = selfPlayer:getPossessableWeight_s64()
  local s64_allWeight_div = s64_allWeight / _const.s64_100
  local s64_maxWeight_div = s64_maxWeight / _const.s64_100
  local str_AllWeight = (string.format)("%.1f", Int64toInt32(s64_allWeight_div) / 100)
  local str_MaxWeight = (string.format)("%.0f", Int64toInt32(s64_maxWeight_div) / 100)
  if Int64toInt32(s64_allWeight) <= Int64toInt32(s64_maxWeight) then
    (self.weightMoney):SetProgressRate(Int64toInt32(s64_moneyWeight / s64_maxWeight_div))
    ;
    (self.weightEquipment):SetProgressRate(Int64toInt32((s64_moneyWeight + s64_equipmentWeight) / s64_maxWeight_div))
    ;
    (self.weightItem):SetProgressRate(Int64toInt32(s64_allWeight / s64_maxWeight_div))
  else
    ;
    (self.weightMoney):SetProgressRate(Int64toInt32(s64_moneyWeight / s64_allWeight_div))
    ;
    (self.weightEquipment):SetProgressRate(Int64toInt32((s64_moneyWeight + s64_equipmentWeight) / s64_allWeight_div))
    ;
    (self.weightItem):SetProgressRate(Int64toInt32(s64_allWeight / s64_allWeight_div))
  end
  ;
  (self.staticWeight):SetText(str_AllWeight .. " / " .. str_MaxWeight .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_WEIGHT"))
  _Inventory_updateSlotData_ChangeWeightIcon(s64_allWeight, s64_maxWeight_div)
end

Inventory_PopUp_ShowIconToolTip = function(isShow)
  -- function num : 0_122 , upvalues : checkPopUp
  if isShow then
    local name = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_TOOLTIP_NAME")
    local desc = ""
    if checkPopUp:IsCheck() then
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_CHECK_TOOLTIP")
    else
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_NOCHECK_TOOLTIP")
    end
    TooltipSimple_Show(checkPopUp, name, desc)
  else
    do
      TooltipSimple_Hide()
    end
  end
end

FromClient_cursorOnOffSignal = function()
  -- function num : 0_123 , upvalues : icon_TrashOn, icon_TrashSequence
  icon_TrashOn:SetShow(false)
  icon_TrashSequence:SetShow(false)
end

registerEvent("FromClient_RenderModeChangeState", "renderModeChange_inventory_FlushRestoreFunc")
registerEvent("FromClient_cursorOnOffSignal", "FromClient_cursorOnOffSignal")

