local _panel = Panel_Window_DyeingTake_Renew
local PALETTE_TYPE = {ALL = 1, MINE = 2}
local PALETTE_CATEGORY = {
  NORMAL = 1,
  OLVIA = 2,
  VELIA = 3,
  HEIDEL = 4,
  KEPLAN = 5,
  CALPHEON = 6,
  MEDIAH = 7,
  VALENCIA = 8
}
local DyeingTake = {
  _ui = {
    stc_titleBG = UI.getChildControl(_panel, "Static_TitleBg"),
    txt_title = nil,
    stc_tabMenuBG = UI.getChildControl(_panel, "Static_TabMenuBG"),
    stc_keyGuideLB = nil,
    stc_keyGuideRB = nil,
    rdo_paletteTypes = {},
    stc_bodyBG = UI.getChildControl(_panel, "Static_SubFrameBG"),
    stc_paletteCategoryBG = nil,
    stc_keyGuideLT = nil,
    stc_keyGuideRT = nil,
    rdo_categoryTypes = {},
    stc_ampuleListBG = nil,
    stc_ampuleSlotBG = {},
    stc_garment = {},
    txt_ampuleCount = {},
    stc_itemFocus = nil,
    scroll_ampuleList = nil,
    stc_bottomBG = UI.getChildControl(_panel, "Static_BottomBg"),
    txt_keyGuideB = nil,
    txt_keyGuideA = nil,
    txt_keyGuideY = nil
  },
  _defaultXGap = 75,
  _defaultYGap = 75,
  _ampuleListColCount = 7,
  _ampuleListRowCount = 10,
  _ampuleListStartX = 0,
  _ampuleListStartY = 0,
  _nowPaletteCategoryIndex = 1,
  _nowPaletteIndex = 1,
  _nowPaletteDataIndex = -1,
  _currentScrollAmount = 0,
  _paletteShowAll = true
}
function FromClient_luaLoadComplete_DyeingTake_Init()
  DyeingTake:initialize()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_DyeingTake_Init")
function DyeingTake:initialize()
  self._ui.txt_title = UI.getChildControl(self._ui.stc_titleBG, "StaticText_Title_Top")
  self._ui.stc_keyGuideLB = UI.getChildControl(self._ui.stc_tabMenuBG, "Static_LB")
  self._ui.stc_keyGuideRB = UI.getChildControl(self._ui.stc_tabMenuBG, "Static_RB")
  self._ui.rdo_paletteTypes = {
    [PALETTE_TYPE.ALL] = UI.getChildControl(self._ui.stc_tabMenuBG, "RadioButton_AllPalette"),
    [PALETTE_TYPE.MINE] = UI.getChildControl(self._ui.stc_tabMenuBG, "RadioButton_MyPallete")
  }
  self._ui.stc_paletteCategoryBG = UI.getChildControl(self._ui.stc_bodyBG, "Static_SubTabMenuBG")
  self._ui.stc_keyGuideLT = UI.getChildControl(self._ui.stc_paletteCategoryBG, "Static_LT")
  self._ui.stc_keyGuideRT = UI.getChildControl(self._ui.stc_paletteCategoryBG, "Static_RT")
  self._ui.rdo_categoryTypes = {
    [PALETTE_CATEGORY.NORMAL] = UI.getChildControl(self._ui.stc_paletteCategoryBG, "RadioButton_Normal"),
    [PALETTE_CATEGORY.OLVIA] = UI.getChildControl(self._ui.stc_paletteCategoryBG, "RadioButton_Olvia"),
    [PALETTE_CATEGORY.VELIA] = UI.getChildControl(self._ui.stc_paletteCategoryBG, "RadioButton_Velia"),
    [PALETTE_CATEGORY.HEIDEL] = UI.getChildControl(self._ui.stc_paletteCategoryBG, "RadioButton_Heidel"),
    [PALETTE_CATEGORY.KEPLAN] = UI.getChildControl(self._ui.stc_paletteCategoryBG, "RadioButton_Keplan"),
    [PALETTE_CATEGORY.CALPHEON] = UI.getChildControl(self._ui.stc_paletteCategoryBG, "RadioButton_Calpheon"),
    [PALETTE_CATEGORY.MEDIAH] = UI.getChildControl(self._ui.stc_paletteCategoryBG, "RadioButton_Mediah"),
    [PALETTE_CATEGORY.VALENCIA] = UI.getChildControl(self._ui.stc_paletteCategoryBG, "RadioButton_ValenCia")
  }
  self._ui.stc_ampuleListBG = UI.getChildControl(self._ui.stc_bodyBG, "Static_PaletteListBG")
  self._ui.scroll_ampuleList = UI.getChildControl(self._ui.stc_ampuleListBG, "Scroll_PaletteItemList")
  self._ui.stc_itemFocus = UI.getChildControl(self._ui.stc_ampuleListBG, "Static_Item_Focus")
  self._ui.stc_itemFocus:SetShow(false)
  self:initAmpuleList()
  self:registEventHandler()
  self:registMessageHandler()
end
function DyeingTake:initAmpuleList()
  local ampuleSlotCount = self._ampuleListColCount * self._ampuleListRowCount
  self._ui.stc_ampuleSlotBG = {}
  local template = UI.getChildControl(self._ui.stc_ampuleListBG, "Static_PaletteItem_Template")
  for ii = 1, ampuleSlotCount do
    self._ui.stc_ampuleSlotBG[ii] = UI.cloneControl(template, self._ui.stc_ampuleListBG, "Static_PaletteItem_" .. ii)
    self._ui.stc_garment[ii] = UI.getChildControl(self._ui.stc_ampuleSlotBG[ii], "Static_Garment")
    self._ui.txt_ampuleCount[ii] = UI.getChildControl(self._ui.stc_ampuleSlotBG[ii], "StaticText_Count")
    self._ui.stc_ampuleSlotBG[ii]:SetPosX(self._ampuleListStartX + (ii - 1) % self._ampuleListColCount * self._defaultXGap)
    self._ui.stc_ampuleSlotBG[ii]:SetPosY(self._ampuleListStartY + math.floor((ii - 1) / self._ampuleListColCount) * self._defaultYGap)
    self._ui.stc_ampuleSlotBG[ii]:SetShow(false)
    if ii <= self._ampuleListColCount then
      self._ui.stc_ampuleSlotBG[ii]:registerPadEvent(__eConsoleUIPadEvent_DpadUp, "InputScroll_DyeingTake_Scroll(true)")
    elseif ii > ampuleSlotCount - self._ampuleListColCount then
      self._ui.stc_ampuleSlotBG[ii]:registerPadEvent(__eConsoleUIPadEvent_DpadDown, "InputScroll_DyeingTake_Scroll(false)")
    end
  end
  template:SetShow(false)
end
function DyeingTake:registEventHandler()
  _panel:registerPadEvent(__eConsoleUIPadEvent_LB, "Input_DyeingTake_NextPalette(-1)")
  _panel:registerPadEvent(__eConsoleUIPadEvent_RB, "Input_DyeingTake_NextPalette(1)")
  _panel:registerPadEvent(__eConsoleUIPadEvent_LT, "Input_DyeingTake_NextCategory(-1)")
  _panel:registerPadEvent(__eConsoleUIPadEvent_RT, "Input_DyeingTake_NextCategory(1)")
end
function DyeingTake:registMessageHandler()
  registerEvent("FromClient_UpdateDyeingPalette", "FromClient_DyeingTake_Update")
end
function PaGlobalFunc_DyeingTake_GetShow()
  return _panel:GetShow()
end
function PaGlobalFunc_DyeingTake_Open()
  DyeingTake:open()
end
function DyeingTake:open()
  _panel:SetShow(true)
  self._nowPaletteIndex = PALETTE_TYPE.MINE
  self._paletteShowAll = PALETTE_TYPE.ALL == self._nowPaletteIndex
  self._ui.rdo_paletteTypes[self._nowPaletteIndex]:SetCheck(true)
  self._ui.rdo_categoryTypes[self._nowPaletteCategoryIndex]:SetCheck(true)
  self:updatePalette()
end
function PaGlobalFunc_DyeingTake_Close()
  DyeingTake:close()
end
function DyeingTake:close()
  _panel:SetShow(false)
end
function DyeingTake:updatePalette()
  if false == _panel:GetShow() then
    return
  end
  local DyeingPaletteCategoryInfo = ToClient_requestGetPaletteCategoryInfo(self._nowPaletteCategoryIndex - 1, self._paletteShowAll)
  local arrCount = 1
  if nil ~= DyeingPaletteCategoryInfo then
    arrCount = DyeingPaletteCategoryInfo:getListSize()
    self._paletteCount = arrCount
    for ii = 1, #self._ui.stc_ampuleSlotBG do
      local dataIdx = self._currentScrollAmount + ii
      if arrCount >= dataIdx then
        self._ui.stc_ampuleSlotBG[ii]:SetShow(true)
        self._ui.txt_ampuleCount[ii] = UI.getChildControl(self._ui.stc_ampuleSlotBG[ii], "StaticText_Count")
        self._ui.txt_ampuleCount[ii]:SetText(tostring(DyeingPaletteCategoryInfo:getCount(dataIdx - 1, true)))
        local itemEnchantKey = DyeingPaletteCategoryInfo:getItemEnchantKey(dataIdx - 1)
        local garment = self._ui.stc_garment[ii]
        garment:SetAlphaIgnore(true)
        garment:SetColor(DyeingPaletteCategoryInfo:getColor(dataIdx - 1))
        garment:addInputEvent("Mouse_LUp", "Input_DyeingTake_Ampule(" .. ii .. ")")
      else
        self._ui.stc_ampuleSlotBG[ii]:SetShow(false)
      end
    end
  else
    for ii = 1, #self._ui.stc_ampuleSlotBG do
      self._ui.stc_ampuleSlotBG[ii]:SetShow(false)
    end
  end
  UIScroll.SetButtonSize(self._ui.scroll_ampuleList, self._ampuleListColCount * self._ampuleListRowCount, arrCount)
end
function Input_DyeingTake_NextPalette(nextPaletteIndex)
  local self = DyeingTake
  self._ui.rdo_paletteTypes[self._nowPaletteIndex]:SetCheck(false)
  local targetPalette = self._nowPaletteIndex + nextPaletteIndex
  if targetPalette < 1 then
    targetPalette = #self._ui.rdo_paletteTypes
  elseif targetPalette > #self._ui.rdo_paletteTypes then
    targetPalette = 1
  end
  if PALETTE_TYPE.MERV == targetPalette and not self:isPlayerHaveActivedMerv() then
    targetPalette = self._nowPaletteIndex
  end
  self._nowPaletteIndex = targetPalette
  self._isPearlPalette = PALETTE_TYPE.MERV == self._nowPaletteIndex
  self._paletteShowAll = PALETTE_TYPE.ALL == self._nowPaletteIndex
  self._ui.rdo_paletteTypes[self._nowPaletteIndex]:SetCheck(true)
  self:updatePalette()
end
function DyeingTake:isPlayerHaveActivedMerv()
  local selfPlayer = getSelfPlayer()
  if nil == selfPlayer then
    return false
  end
  return selfPlayer:get():isApplyChargeSkill(CppEnums.UserChargeType.eUserChargeType_DyeingPackage)
end
function Input_DyeingTake_NextCategory(nextCategoryIndex)
  local self = DyeingTake
  self._ui.rdo_categoryTypes[self._nowPaletteCategoryIndex]:SetCheck(false)
  local targetCategory = self._nowPaletteCategoryIndex + nextCategoryIndex
  if targetCategory < 1 then
    targetCategory = #self._ui.rdo_categoryTypes
  elseif targetCategory > #self._ui.rdo_categoryTypes then
    targetCategory = 1
  end
  self._nowPaletteCategoryIndex = targetCategory
  self._ui.rdo_categoryTypes[self._nowPaletteCategoryIndex]:SetCheck(true)
  self:updatePalette()
end
function Input_DyeingTake_Ampule(ii)
  local self = DyeingTake
  local isShowAll = self._paletteShowAll
  local categoryIndex = self._nowPaletteCategoryIndex
  local dataIndex = self._currentScrollAmount + ii
  local itemCount = tonumber(self._ui.txt_ampuleCount[ii]:GetText())
  if "number" ~= type(itemCount) or nil == dataIndex or nil == isShowAll or nil == categoryIndex then
    return
  end
  local DyeingPaletteCategoryInfo = ToClient_requestGetPaletteCategoryInfo(categoryIndex - 1, isShowAll)
  if nil == DyeingPaletteCategoryInfo then
    return
  end
  local itemEnchantKey = DyeingPaletteCategoryInfo:getItemEnchantKey(dataIndex - 1)
  local itemEnchantSSW = getItemEnchantStaticStatus(ItemEnchantKey(itemEnchantKey))
  local itemEnchantSS = itemEnchantSSW:get()
  local itemName = getItemName(itemEnchantSS)
  local function doExportPalette()
    ToClient_requestChangeDyeingPaletteToItem(categoryIndex - 1, dataIndex - 1, itemCount, isShowAll)
  end
  local messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE")
  local messageBoxMemo = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_PALETTE_SURE_GET_THIS_AMPLUE", "itemName", itemName, "itemCount", tostring(itemCount))
  local messageBoxData = {
    title = messageTitle,
    content = messageBoxMemo,
    functionYes = doExportPalette,
    functionNo = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData)
end
function InputScroll_DyeingTake_Scroll(isUp)
  local self = DyeingTake
  if nil ~= self._paletteCount then
    self._currentScrollAmount = UIScroll.ScrollEvent(self._ui.scroll_ampuleList, isUp, self._ampuleListRowCount, self._paletteCount, self._currentScrollAmount, self._ampuleListColCount)
  end
  if ToClient_isXBox() or ToClient_IsDevelopment() then
    ToClient_padSnapIgnoreGroupMove()
  end
  self:updatePalette()
end
function FromClient_DyeingTake_Update()
  DyeingTake:updatePalette()
end
