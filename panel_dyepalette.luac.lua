-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\dye\panel_dyepalette.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_color = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
Panel_DyePalette:SetShow(false)
Panel_DyePalette:ActiveMouseEventEffect(true)
Panel_DyePalette:setGlassBackground(true)
Panel_DyePalette:RegisterShowEventFunc(true, "DyePalette_ShowAni()")
Panel_DyePalette:RegisterShowEventFunc(false, "DyePalette_HideAni()")
local DyePalette = {
ui = {_btn_Close = (UI.getChildControl)(Panel_DyePalette, "Button_Win_Close"), _btn_Help = (UI.getChildControl)(Panel_DyePalette, "Button_Help"), _btn_Confirm = (UI.getChildControl)(Panel_DyePalette, "Button_Confirm"), _btn_TabAll = (UI.getChildControl)(Panel_DyePalette, "RadioButton_Tab_ALL"), _btn_TabMy = (UI.getChildControl)(Panel_DyePalette, "RadioButton_Tab_My"), _scroll = (UI.getChildControl)(Panel_DyePalette, "Scroll_Ampule"), _panelBG = (UI.getChildControl)(Panel_DyePalette, "Static_BG"), 
_btn_Material = {[0] = (UI.getChildControl)(Panel_DyePalette, "RadioButton_Material_0"), [1] = (UI.getChildControl)(Panel_DyePalette, "RadioButton_Material_1"), [2] = (UI.getChildControl)(Panel_DyePalette, "RadioButton_Material_2"), [3] = (UI.getChildControl)(Panel_DyePalette, "RadioButton_Material_3"), [4] = (UI.getChildControl)(Panel_DyePalette, "RadioButton_Material_4"), [5] = (UI.getChildControl)(Panel_DyePalette, "RadioButton_Material_5"), [6] = (UI.getChildControl)(Panel_DyePalette, "RadioButton_Material_6"), [7] = (UI.getChildControl)(Panel_DyePalette, "RadioButton_Material_7")}
, _selectMaterialName = (UI.getChildControl)(Panel_DyePalette, "StaticText_SelectedMaterialName"), _selectAmpueColor = (UI.getChildControl)(Panel_DyePalette, "Static_SelectAmplueColorPart"), _selectAmpueName = (UI.getChildControl)(Panel_DyePalette, "StaticText_SelectAmpuleName"), _selectAmpueCount = (UI.getChildControl)(Panel_DyePalette, "Edit_SelectAmpuleCount")}
, 
slot = {}
, 
config = {maxSlotColsCount = 10, maxSlotRowsCount = 7, startPosX = 5, startPosY = 5, cellSpan = 2, selectedCategoryIdx = 0, isShowAll = true, selectedColorIdx = 0, selectedAmplurCount_s64 = 0, scrollStartIdx = 0, colorTotalRows = 0}
}
-- DECOMPILER ERROR at PC169: Confused about usage of register: R4 in 'UnsetPending'

;
(DyePalette.ui)._scrollBtn = (UI.getChildControl)((DyePalette.ui)._scroll, "Scroll_CtrlButton")
DyePalette.Initialize = function(self)
  -- function num : 0_0
  for slotRowsIdx = 0, (self.config).maxSlotRowsCount - 1 do
    -- DECOMPILER ERROR at PC8: Confused about usage of register: R5 in 'UnsetPending'

    (self.slot)[slotRowsIdx] = {}
    for slotColsIdx = 0, (self.config).maxSlotColsCount - 1 do
      -- DECOMPILER ERROR at PC18: Confused about usage of register: R9 in 'UnsetPending'

      ((self.slot)[slotRowsIdx])[slotColsIdx] = {}
      local slot = ((self.slot)[slotRowsIdx])[slotColsIdx]
      slot.bg = (UI.createAndCopyBasePropertyControl)(Panel_DyePalette, "Static_SlotBG", (self.ui)._panelBG, "DyePaletteSlotBG_" .. slotColsIdx .. "_" .. slotRowsIdx)
      slot.color = (UI.createAndCopyBasePropertyControl)(Panel_DyePalette, "Static_ColorPart", slot.bg, "DyePaletteSlot_" .. slotColsIdx .. "_" .. slotRowsIdx)
      slot.count = (UI.createAndCopyBasePropertyControl)(Panel_DyePalette, "StaticText_Count", slot.bg, "DyePaletteSlot_Count_" .. slotColsIdx .. "_" .. slotRowsIdx)
      slot.btn = (UI.createAndCopyBasePropertyControl)(Panel_DyePalette, "RadioButton_Slot", slot.bg, "DyePaletteSlot_ColorBtn_" .. slotColsIdx .. "_" .. slotRowsIdx)
      local slotPosX = ((slot.bg):GetSizeX() + (self.config).cellSpan) * slotColsIdx + (self.config).startPosX
      local slotPosY = ((slot.bg):GetSizeY() + (self.config).cellSpan) * slotRowsIdx + (self.config).startPosY
      ;
      (slot.color):SetAlphaIgnore(true)
      ;
      (slot.bg):SetPosX(slotPosX)
      ;
      (slot.bg):SetPosY(slotPosY)
      ;
      (slot.color):SetPosX(0)
      ;
      (slot.color):SetPosY(0)
      ;
      (slot.count):SetPosX(0)
      ;
      (slot.count):SetPosY(25)
      ;
      (slot.btn):SetPosX(0)
      ;
      (slot.btn):SetPosY(0)
      ;
      (slot.btn):addInputEvent("Mouse_UpScroll", "Scroll_DyePalette( true )")
      ;
      (slot.btn):addInputEvent("Mouse_DownScroll", "Scroll_DyePalette( false )")
    end
  end
  ;
  ((self.ui)._selectAmpueColor):SetAlphaIgnore(true)
  ;
  ((self.ui)._btn_TabAll):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PALETTE_TAB_ALL"))
  ;
  ((self.ui)._btn_TabMy):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PALETTE_TAB_MY"))
end

DyePalette.ChangeTexture = function(self, isFill, rowsIdx, colsIdx)
  -- function num : 0_1
  local slot = (((self.slot)[rowsIdx])[colsIdx]).color
  local x1, y1, x2, y2 = nil, nil, nil, nil
  if isFill == true then
    x1 = 55
  else
    -- DECOMPILER ERROR at PC18: Overwrote pending register: R8 in 'AssignReg'

    -- DECOMPILER ERROR at PC19: Overwrote pending register: R7 in 'AssignReg'

    -- DECOMPILER ERROR at PC20: Overwrote pending register: R6 in 'AssignReg'

    x1 = 55
  end
  slot:ChangeTextureInfoName("new_ui_common_forlua/default/Default_Buttons_02.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(slot, x1, y1, x2, y2)
  ;
  (slot:getBaseTexture()):setUV(x1, y1, x2, y2)
  slot:setRenderTexture(slot:getBaseTexture())
end

DyePalette.Update = function(self)
  -- function num : 0_2
  local category = (self.config).selectedCategoryIdx
  local isShowAll = (self.config).isShowAll
  ;
  ((self.ui)._btn_TabAll):SetCheck(isShowAll)
  ;
  ((self.ui)._btn_TabMy):SetCheck(not isShowAll)
  for idx = 0, 7 do
    if idx == category then
      (((self.ui)._btn_Material)[idx]):SetCheck(true)
    else
      ;
      (((self.ui)._btn_Material)[idx]):SetCheck(false)
    end
  end
  for slotRowsIdx = 0, (self.config).maxSlotRowsCount - 1 do
    for slotColsIdx = 0, (self.config).maxSlotColsCount - 1 do
      local slot = ((self.slot)[slotRowsIdx])[slotColsIdx]
      local clearColor = 16777215
      self:ChangeTexture(false, slotRowsIdx, slotColsIdx)
      ;
      (slot.color):SetColor(clearColor)
      ;
      (slot.count):SetText("0")
      ;
      (slot.count):SetShow(false)
      ;
      (slot.btn):SetCheck(false)
      ;
      (slot.btn):addInputEvent("Mouse_LUp", "")
      ;
      (slot.btn):addInputEvent("Mouse_On", "")
      ;
      (slot.btn):addInputEvent("Mouse_Out", "")
      ;
      (slot.btn):setTooltipEventRegistFunc("")
    end
  end
  local DyeingPaletteCategoryInfo = ToClient_requestGetPaletteCategoryInfo(category, isShowAll)
  if DyeingPaletteCategoryInfo ~= nil then
    local colorCount = DyeingPaletteCategoryInfo:getListSize()
    -- DECOMPILER ERROR at PC107: Confused about usage of register: R5 in 'UnsetPending'

    ;
    (self.config).colorTotalRows = (math.ceil)(colorCount / (self.config).maxSlotColsCount)
    local uiIndex = 0
    for slotRowsIdx = 0, (self.config).maxSlotRowsCount - 1 do
      for slotColsIdx = 0, (self.config).maxSlotColsCount - 1 do
        local slot = ((self.slot)[slotRowsIdx])[slotColsIdx]
        local dataIdx = uiIndex + (self.config).scrollStartIdx * (self.config).maxSlotColsCount
        if dataIdx < colorCount then
          local colorValue = DyeingPaletteCategoryInfo:getColor(dataIdx)
          local itemEnchantKey = DyeingPaletteCategoryInfo:getItemEnchantKey(dataIdx)
          local isDyeUI = false
          local ampuleCount = DyeingPaletteCategoryInfo:getCount(dataIdx, isDyeUI)
          ;
          (slot.count):SetText(tostring(ampuleCount))
          self:ChangeTexture(true, slotRowsIdx, slotColsIdx)
          ;
          (slot.color):SetColor(colorValue)
          ;
          (slot.count):SetShow(true)
          if dataIdx == (self.config).selectedColorIdx then
            (slot.btn):SetCheck(true)
          end
          ;
          (slot.btn):addInputEvent("Mouse_LUp", "HandleClicked_DyePalette_SelectColor( " .. dataIdx .. " )")
          ;
          (slot.btn):addInputEvent("Mouse_On", "HandleOnOut_DyePalette_Color( true, " .. itemEnchantKey .. ", " .. slotRowsIdx .. ", " .. slotColsIdx .. " )")
          ;
          (slot.btn):addInputEvent("Mouse_Out", "HandleOnOut_DyePalette_Color( false, " .. itemEnchantKey .. ", " .. slotRowsIdx .. ", " .. slotColsIdx .. " )")
          ;
          (slot.btn):setTooltipEventRegistFunc("HandleOnOut_DyePalette_Color( true, " .. itemEnchantKey .. ", " .. slotRowsIdx .. ", " .. slotColsIdx .. " )")
          uiIndex = uiIndex + 1
        end
      end
    end
    local setSelectColor_nil = function()
    -- function num : 0_2_0 , upvalues : self
    ((self.ui)._selectAmpueColor):SetColor(16777215)
    ;
    ((self.ui)._selectAmpueName):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PALETTE_PLZ_SELECT_COLOR"))
    ;
    ((self.ui)._selectAmpueCount):SetEditText("0")
  end

    local selectedColorIdx = (self.config).selectedColorIdx
    if selectedColorIdx ~= nil then
      local isDyeUI = false
      -- DECOMPILER ERROR at PC228: Confused about usage of register: R9 in 'UnsetPending'

      ;
      (self.config).selectedAmplurCount_s64 = DyeingPaletteCategoryInfo:getCount(selectedColorIdx, isDyeUI)
      local colorValue = DyeingPaletteCategoryInfo:getColor(selectedColorIdx)
      local itemEnchantKey = DyeingPaletteCategoryInfo:getItemEnchantKey(selectedColorIdx)
      local itemEnchantSSW = getItemEnchantStaticStatus(ItemEnchantKey(itemEnchantKey))
      if itemEnchantSSW ~= nil then
        local itemEnchantSS = itemEnchantSSW:get()
        local itemName = getItemName(itemEnchantSS)
        ;
        ((self.ui)._selectAmpueColor):SetColor(colorValue)
        ;
        ((self.ui)._selectAmpueName):SetText(itemName)
        ;
        ((self.ui)._selectAmpueCount):SetEditText(tostring((self.config).selectedAmplurCount_s64))
      else
        do
          do
            setSelectColor_nil()
            setSelectColor_nil()
            ;
            (UIScroll.SetButtonSize)((self.ui)._scroll, (self.config).maxSlotRowsCount, (self.config).colorTotalRows)
          end
        end
      end
    end
  end
end

DyePalette.Open = function(self)
  -- function num : 0_3
  Inventory_SetFunctor(DyePalette_SetInvenFilter, DyePalette_SetInvenRclick, nil, nil)
  Panel_DyePalette:SetShow(true, true)
  Panel_DyePalette:SetPosX(Panel_Window_Inventory:GetPosX() - Panel_DyePalette:GetSizeX())
  Panel_DyePalette:SetPosY(Panel_Window_Inventory:GetPosY())
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.config).isShowAll = true
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.config).selectedCategoryIdx = 0
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.config).selectedColorIdx = 0
  self:Update()
  ;
  ((self.ui)._scroll):SetControlPos(0)
  if Panel_Window_Inventory:IsUISubApp() then
    Panel_DyePalette:OpenUISubApp()
  end
  HandleClicked_DyePalette_SelectedCategory(0)
end

DyePalette.Close = function(self)
  -- function num : 0_4
  Inventory_SetFunctor(nil, nil, nil, nil)
  Panel_DyePalette:SetShow(false, false)
  Panel_DyePalette:CloseUISubApp()
  if Panel_Window_Inventory:GetShow() and not Panel_Equipment:GetShow() then
    Panel_Equipment:SetShow(true)
  end
end

DyePalette_ShowAni = function()
  -- function num : 0_5 , upvalues : UI_ANI_ADV
  local aniInfo1 = Panel_DyePalette:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.12)
  aniInfo1.AxisX = Panel_DyePalette:GetSizeX() / 2
  aniInfo1.AxisY = Panel_DyePalette:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_DyePalette:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.12)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_DyePalette:GetSizeX() / 2
  aniInfo2.AxisY = Panel_DyePalette:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

DyePalette_HideAni = function()
  -- function num : 0_6 , upvalues : UI_ANI_ADV, UI_color
  local aniInfo1 = Panel_DyePalette:addColorAnimation(0, 0.1, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

DyePalette_SetInvenFilter = function(slotNo, itemWrapper, count_s64, inventoryType)
  -- function num : 0_7
  if itemWrapper ~= nil then
    local isDyeAble = ((itemWrapper:getStaticStatus()):get()):isDyeingStaticStatus()
    return not isDyeAble
  else
    do
      do return true end
    end
  end
end

DyePalette_SetInvenRclick = function(slotNo, itemWrapper, count_s64, inventoryType)
  -- function num : 0_8
  local doInsertPalette = function()
    -- function num : 0_8_0 , upvalues : inventoryType, slotNo, count_s64
    ToClient_requestCreateDyeingPaletteFromItem(inventoryType, slotNo, count_s64)
  end

  local ampuleName = (itemWrapper:getStaticStatus()):getName()
  local messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE")
  local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PALETTE_SURE_THIS_AMPLUE", "itemName", ampuleName)
  local messageBoxData = {title = messageTitle, content = messageBoxMemo, functionYes = doInsertPalette, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

Scroll_DyePalette = function(isScrollUp)
  -- function num : 0_9 , upvalues : DyePalette
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

  (DyePalette.config).scrollStartIdx = (UIScroll.ScrollEvent)((DyePalette.ui)._scroll, isScrollUp, (DyePalette.config).maxSlotRowsCount, (DyePalette.config).colorTotalRows, (DyePalette.config).scrollStartIdx, 1)
  DyePalette:Update()
end

HandleClicked_DyePalette_SelectedCategory = function(categoryIdx)
  -- function num : 0_10 , upvalues : DyePalette
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  (DyePalette.config).selectedCategoryIdx = categoryIdx
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (DyePalette.config).selectedColorIdx = 0
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (DyePalette.config).scrollStartIdx = 0
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (DyePalette.config).selectedColorIdx = nil
  ;
  ((DyePalette.ui)._scroll):SetControlPos(0)
  DyePalette_SetMaterialName(categoryIdx)
  DyePalette:Update()
end

DyePalette_SetMaterialName = function(index)
  -- function num : 0_11 , upvalues : DyePalette
  local materialString = PAGetString(Defines.StringSheet_GAME, "LUA_PALETTE_TAB_MATERIAL_" .. index)
  local materialName = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PALETTE_MATERIALNAME", "name", materialString)
  ;
  ((DyePalette.ui)._selectMaterialName):SetText(materialName)
end

HandleClicked_DyePalette_SelectedType = function(isShowAll)
  -- function num : 0_12 , upvalues : DyePalette
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  (DyePalette.config).isShowAll = isShowAll
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (DyePalette.config).selectedCategoryIdx = 0
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (DyePalette.config).selectedColorIdx = 0
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (DyePalette.config).scrollStartIdx = 0
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (DyePalette.config).selectedColorIdx = nil
  ;
  ((DyePalette.ui)._scroll):SetControlPos(0)
  DyePalette_SetMaterialName(0)
  DyePalette:Update()
end

HandleClicked_DyePalette_SelectColor = function(dataIdx)
  -- function num : 0_13 , upvalues : DyePalette
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  (DyePalette.config).selectedColorIdx = dataIdx
  toInt64(0, 1)
  local category = (DyePalette.config).selectedCategoryIdx
  local showType = (DyePalette.config).isShowAll
  local colorIdx = (DyePalette.config).selectedColorIdx
  local DyeingPaletteCategoryInfo = ToClient_requestGetPaletteCategoryInfo(category, showType)
  if DyeingPaletteCategoryInfo ~= nil then
    local isDyeUI = false
    -- DECOMPILER ERROR at PC29: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (DyePalette.config).selectedAmplurCount_s64 = DyeingPaletteCategoryInfo:getCount(colorIdx, isDyeUI)
    local colorValue = DyeingPaletteCategoryInfo:getColor(colorIdx)
    local itemEnchantKey = DyeingPaletteCategoryInfo:getItemEnchantKey(colorIdx)
    local itemEnchantSSW = getItemEnchantStaticStatus(ItemEnchantKey(itemEnchantKey))
    local itemEnchantSS = itemEnchantSSW:get()
    local itemName = getItemName(itemEnchantSS)
    ;
    ((DyePalette.ui)._selectAmpueColor):SetColor(colorValue)
    ;
    ((DyePalette.ui)._selectAmpueName):SetText(itemName)
    ;
    ((DyePalette.ui)._selectAmpueCount):SetEditText(tostring((DyePalette.config).selectedAmplurCount_s64))
  end
end

HandleOnOut_DyePalette_Color = function(isShow, itemEnchantKey, rowsIdx, colsIdx)
  -- function num : 0_14 , upvalues : DyePalette
  if isShow == true then
    local uiControl = (((DyePalette.slot)[rowsIdx])[colsIdx]).btn
    local itemEnchantSSW = getItemEnchantStaticStatus(ItemEnchantKey(itemEnchantKey))
    local itemEnchantSS = itemEnchantSSW:get()
    local itemName = (getItemName(itemEnchantSS))
    local desc = nil
    registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(uiControl, itemName, desc)
  else
    do
      TooltipSimple_Hide()
    end
  end
end

HandleClicked_DyePalette_SelectAmplueCount = function()
  -- function num : 0_15 , upvalues : DyePalette
  local category = (DyePalette.config).selectedCategoryIdx
  local isShowAll = (DyePalette.config).isShowAll
  local colorIdx = (DyePalette.config).selectedColorIdx
  local DyeingPaletteCategoryInfo = ToClient_requestGetPaletteCategoryInfo(category, isShowAll)
  if DyeingPaletteCategoryInfo ~= nil then
    local isDyeUI = false
    local ampuleCount = DyeingPaletteCategoryInfo:getCount(colorIdx, isDyeUI)
    Panel_NumberPad_Show(true, ampuleCount, ampuleCount, DyePalette_SetSelectAmplueCount)
  else
    do
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PALETTE_WRONG_COLORINFO"))
      do return  end
    end
  end
end

DyePalette_SetSelectAmplueCount = function(count_s64)
  -- function num : 0_16 , upvalues : DyePalette
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  (DyePalette.config).selectedAmplurCount_s64 = count_s64
  ;
  ((DyePalette.ui)._selectAmpueCount):SetEditText(tostring((DyePalette.config).selectedAmplurCount_s64))
end

HandleClicked_DyePalette_Scroll = function()
  -- function num : 0_17 , upvalues : DyePalette
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R0 in 'UnsetPending'

  (DyePalette.config).scrollStartIdx = (math.ceil)(((DyePalette.config).colorTotalRows - (DyePalette.config).maxSlotRowsCount) * ((DyePalette.ui)._scroll):GetControlPos())
  DyePalette:Update()
end

HandleOnOut_DyePalette_Palette_BtnTooltip = function(isOn, btnType)
  -- function num : 0_18 , upvalues : DyePalette
  local control = nil
  local name = ""
  local desc = nil
  if isOn == true then
    if btnType == 0 then
      control = (DyePalette.ui)._btn_TabAll
      name = PAGetString(Defines.StringSheet_GAME, "LUA_PALETTE_TAB_ALL")
    else
      if btnType == 1 then
        control = (DyePalette.ui)._btn_TabMy
        name = PAGetString(Defines.StringSheet_GAME, "LUA_PALETTE_TAB_MY")
      else
        if btnType == 2 then
          control = ((DyePalette.ui)._btn_Material)[0]
          name = PAGetString(Defines.StringSheet_GAME, "LUA_PALETTE_TAB_MATERIAL_0")
        else
          if btnType == 3 then
            control = ((DyePalette.ui)._btn_Material)[1]
            name = PAGetString(Defines.StringSheet_GAME, "LUA_PALETTE_TAB_MATERIAL_1")
          else
            if btnType == 4 then
              control = ((DyePalette.ui)._btn_Material)[2]
              name = PAGetString(Defines.StringSheet_GAME, "LUA_PALETTE_TAB_MATERIAL_2")
            else
              if btnType == 5 then
                control = ((DyePalette.ui)._btn_Material)[3]
                name = PAGetString(Defines.StringSheet_GAME, "LUA_PALETTE_TAB_MATERIAL_3")
              else
                if btnType == 6 then
                  control = ((DyePalette.ui)._btn_Material)[4]
                  name = PAGetString(Defines.StringSheet_GAME, "LUA_PALETTE_TAB_MATERIAL_4")
                else
                  if btnType == 7 then
                    control = ((DyePalette.ui)._btn_Material)[5]
                    name = PAGetString(Defines.StringSheet_GAME, "LUA_PALETTE_TAB_MATERIAL_5")
                  else
                    if btnType == 8 then
                      control = ((DyePalette.ui)._btn_Material)[6]
                      name = PAGetString(Defines.StringSheet_GAME, "LUA_PALETTE_TAB_MATERIAL_6")
                    else
                      if btnType == 9 then
                        control = ((DyePalette.ui)._btn_Material)[7]
                        name = PAGetString(Defines.StringSheet_GAME, "LUA_PALETTE_TAB_MATERIAL_7")
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
    registTooltipControl(control, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

HandleClicked_DyePalette_Close = function()
  -- function num : 0_19 , upvalues : DyePalette
  DyePalette:Close()
end

HandleClicked_DyePalette_Help = function()
  -- function num : 0_20
end

HandleClicked_DyePalette_Confirm = function()
  -- function num : 0_21 , upvalues : DyePalette
  local isShowAll = (DyePalette.config).isShowAll
  local categoryIndex = (DyePalette.config).selectedCategoryIdx
  local dataIndex = (DyePalette.config).selectedColorIdx
  local itemCount = (DyePalette.config).selectedAmplurCount_s64
  if dataIndex == nil then
    return 
  end
  local DyeingPaletteCategoryInfo = ToClient_requestGetPaletteCategoryInfo(categoryIndex, isShowAll)
  local itemEnchantKey = DyeingPaletteCategoryInfo:getItemEnchantKey(dataIndex)
  local itemEnchantSSW = getItemEnchantStaticStatus(ItemEnchantKey(itemEnchantKey))
  local itemEnchantSS = itemEnchantSSW:get()
  local itemName = getItemName(itemEnchantSS)
  local doExportPalette = function()
    -- function num : 0_21_0 , upvalues : categoryIndex, dataIndex, itemCount, isShowAll
    ToClient_requestChangeDyeingPaletteToItem(categoryIndex, dataIndex, itemCount, isShowAll)
  end

  local messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE")
  local messageBoxMemo = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_PALETTE_SURE_GET_THIS_AMPLUE", "itemName", itemName, "itemCount", tostring(itemCount))
  local messageBoxData = {title = messageTitle, content = messageBoxMemo, functionYes = doExportPalette, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

FGlobal_DyePalette_Open = function()
  -- function num : 0_22 , upvalues : DyePalette
  if Panel_AlchemyFigureHead:GetShow() then
    FGlobal_AlchemyFigureHead_Close()
  end
  if Panel_AlchemyStone:GetShow() then
    FGlobal_AlchemyStone_Close()
  end
  if Panel_Manufacture:GetShow() then
    Manufacture_Close()
  end
  if Panel_Equipment:GetShow() then
    EquipmentWindow_Close()
  end
  DyePalette:Open()
end

FGlobal_DyePalette_Close = function()
  -- function num : 0_23 , upvalues : DyePalette
  DyePalette:Close()
end

FromClient_UpdateDyeingPalette = function()
  -- function num : 0_24 , upvalues : DyePalette
  if Panel_Dye_New:GetShow() then
    DyePalette:Update()
  end
end

DyePalette.registEventHandler = function(self)
  -- function num : 0_25
  local control = self.ui
  ;
  (control._btn_Close):addInputEvent("Mouse_LUp", "HandleClicked_DyePalette_Close()")
  ;
  (control._btn_Help):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"Dye\" )")
  ;
  (control._btn_Help):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"Dye\", \"true\")")
  ;
  (control._btn_Help):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"Dye\", \"false\")")
  ;
  (control._btn_Confirm):addInputEvent("Mouse_LUp", "HandleClicked_DyePalette_Confirm()")
  ;
  (control._btn_TabAll):addInputEvent("Mouse_LUp", "HandleClicked_DyePalette_SelectedType( true )")
  ;
  (control._btn_TabMy):addInputEvent("Mouse_LUp", "HandleClicked_DyePalette_SelectedType( false )")
  ;
  ((control._btn_Material)[0]):addInputEvent("Mouse_LUp", "HandleClicked_DyePalette_SelectedCategory( " .. 0 .. " )")
  ;
  ((control._btn_Material)[1]):addInputEvent("Mouse_LUp", "HandleClicked_DyePalette_SelectedCategory( " .. 1 .. " )")
  ;
  ((control._btn_Material)[2]):addInputEvent("Mouse_LUp", "HandleClicked_DyePalette_SelectedCategory( " .. 2 .. " )")
  ;
  ((control._btn_Material)[3]):addInputEvent("Mouse_LUp", "HandleClicked_DyePalette_SelectedCategory( " .. 3 .. " )")
  ;
  ((control._btn_Material)[4]):addInputEvent("Mouse_LUp", "HandleClicked_DyePalette_SelectedCategory( " .. 4 .. " )")
  ;
  ((control._btn_Material)[5]):addInputEvent("Mouse_LUp", "HandleClicked_DyePalette_SelectedCategory( " .. 5 .. " )")
  ;
  ((control._btn_Material)[6]):addInputEvent("Mouse_LUp", "HandleClicked_DyePalette_SelectedCategory( " .. 6 .. " )")
  ;
  ((control._btn_Material)[7]):addInputEvent("Mouse_LUp", "HandleClicked_DyePalette_SelectedCategory( " .. 7 .. " )")
  ;
  ((control._btn_Material)[0]):addInputEvent("Mouse_On", "HandleOnOut_DyePalette_Palette_BtnTooltip( true, " .. 2 .. " )")
  ;
  ((control._btn_Material)[0]):addInputEvent("Mouse_Out", "HandleOnOut_DyePalette_Palette_BtnTooltip( false, " .. 2 .. " )")
  ;
  ((control._btn_Material)[0]):setTooltipEventRegistFunc("HandleOnOut_DyePalette_Palette_BtnTooltip( true, " .. 2 .. " )")
  ;
  ((control._btn_Material)[1]):addInputEvent("Mouse_On", "HandleOnOut_DyePalette_Palette_BtnTooltip( true, " .. 3 .. " )")
  ;
  ((control._btn_Material)[1]):addInputEvent("Mouse_Out", "HandleOnOut_DyePalette_Palette_BtnTooltip( false, " .. 3 .. " )")
  ;
  ((control._btn_Material)[1]):setTooltipEventRegistFunc("HandleOnOut_DyePalette_Palette_BtnTooltip( true, " .. 3 .. " )")
  ;
  ((control._btn_Material)[2]):addInputEvent("Mouse_On", "HandleOnOut_DyePalette_Palette_BtnTooltip( true, " .. 4 .. " )")
  ;
  ((control._btn_Material)[2]):addInputEvent("Mouse_Out", "HandleOnOut_DyePalette_Palette_BtnTooltip( false, " .. 4 .. " )")
  ;
  ((control._btn_Material)[2]):setTooltipEventRegistFunc("HandleOnOut_DyePalette_Palette_BtnTooltip( true, " .. 4 .. " )")
  ;
  ((control._btn_Material)[3]):addInputEvent("Mouse_On", "HandleOnOut_DyePalette_Palette_BtnTooltip( true, " .. 5 .. " )")
  ;
  ((control._btn_Material)[3]):addInputEvent("Mouse_Out", "HandleOnOut_DyePalette_Palette_BtnTooltip( false, " .. 5 .. " )")
  ;
  ((control._btn_Material)[3]):setTooltipEventRegistFunc("HandleOnOut_DyePalette_Palette_BtnTooltip( true, " .. 5 .. " )")
  ;
  ((control._btn_Material)[4]):addInputEvent("Mouse_On", "HandleOnOut_DyePalette_Palette_BtnTooltip( true, " .. 6 .. " )")
  ;
  ((control._btn_Material)[4]):addInputEvent("Mouse_Out", "HandleOnOut_DyePalette_Palette_BtnTooltip( false, " .. 6 .. " )")
  ;
  ((control._btn_Material)[4]):setTooltipEventRegistFunc("HandleOnOut_DyePalette_Palette_BtnTooltip( true, " .. 6 .. " )")
  ;
  ((control._btn_Material)[5]):addInputEvent("Mouse_On", "HandleOnOut_DyePalette_Palette_BtnTooltip( true, " .. 7 .. " )")
  ;
  ((control._btn_Material)[5]):addInputEvent("Mouse_Out", "HandleOnOut_DyePalette_Palette_BtnTooltip( false, " .. 7 .. " )")
  ;
  ((control._btn_Material)[5]):setTooltipEventRegistFunc("HandleOnOut_DyePalette_Palette_BtnTooltip( true, " .. 7 .. " )")
  ;
  ((control._btn_Material)[6]):addInputEvent("Mouse_On", "HandleOnOut_DyePalette_Palette_BtnTooltip( true, " .. 8 .. " )")
  ;
  ((control._btn_Material)[6]):addInputEvent("Mouse_Out", "HandleOnOut_DyePalette_Palette_BtnTooltip( false, " .. 8 .. " )")
  ;
  ((control._btn_Material)[6]):setTooltipEventRegistFunc("HandleOnOut_DyePalette_Palette_BtnTooltip( true, " .. 8 .. " )")
  ;
  ((control._btn_Material)[7]):addInputEvent("Mouse_On", "HandleOnOut_DyePalette_Palette_BtnTooltip( true, " .. 9 .. " )")
  ;
  ((control._btn_Material)[7]):addInputEvent("Mouse_Out", "HandleOnOut_DyePalette_Palette_BtnTooltip( false, " .. 9 .. " )")
  ;
  ((control._btn_Material)[7]):setTooltipEventRegistFunc("HandleOnOut_DyePalette_Palette_BtnTooltip( true, " .. 9 .. " )")
  ;
  (control._selectAmpueCount):addInputEvent("Mouse_LUp", "HandleClicked_DyePalette_SelectAmplueCount()")
  ;
  (control._scroll):addInputEvent("Mouse_LUp", "HandleClicked_DyePalette_Scroll()")
  ;
  (control._scrollBtn):addInputEvent("Mouse_LPress", "HandleClicked_DyePalette_Scroll()")
  ;
  (control._panelBG):addInputEvent("Mouse_UpScroll", "Scroll_DyePalette( true )")
  ;
  (control._panelBG):addInputEvent("Mouse_DownScroll", "Scroll_DyePalette( false )")
end

DyePalette.registMessageHandler = function(self)
  -- function num : 0_26
  registerEvent("FromClient_UpdateDyeingPalette", "FromClient_UpdateDyeingPalette")
end

DyePalette:Initialize()
DyePalette_SetMaterialName(0)
DyePalette:registEventHandler()
DyePalette:registMessageHandler()

