local _panel = Panel_Window_DyeingRegister_Renew
_panel:ignorePadSnapMoveToOtherPanel()
local DyeingRegister = {
  _ui = {
    stc_titleBG = UI.getChildControl(_panel, "Static_TitleBg"),
    txt_titleTop = nil,
    stc_paletteBG = UI.getChildControl(_panel, "Static_PaletteBg"),
    stc_paletteGroup = nil,
    stc_slotBG = nil,
    stc_itemFocus = nil,
    scroll_itemList = nil,
    stc_bottomBG = UI.getChildControl(_panel, "Static_BottomBg"),
    txt_keyGuideB = nil,
    txt_keyGuideA = nil
  },
  _defaultGab = 55,
  _startX = 15,
  _startY = 15,
  _scrollAmount = 0,
  _colMax = 8,
  _rowMax = 8,
  _waitForMessage = false
}
function FromClient_luaLoadComplete_DyeingRegister_Init()
  DyeingRegister:initialize()
end
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_DyeingRegister_Init")
function DyeingRegister:initialize()
  self._ui.txt_titleTop = UI.getChildControl(self._ui.stc_titleBG, "StaticText_Title_Top")
  self._ui.stc_paletteGroup = UI.getChildControl(self._ui.stc_paletteBG, "Static_PaletteList")
  self._ui.scroll_itemList = UI.getChildControl(self._ui.stc_paletteGroup, "Scroll_PaletteItemList")
  self._ui.stc_slotBG = {}
  self._ui.slot_dyes = {}
  local slotConfig = {
    createIcon = true,
    createCount = false,
    createEnchant = true,
    createItemLock = true
  }
  local slotCount = self._colMax * self._rowMax
  for ii = 1, slotCount do
    self._ui.stc_slotBG[ii] = UI.createAndCopyBasePropertyControl(self._ui.stc_paletteGroup, "Static_SlotBGTemplate", self._ui.stc_paletteGroup, "Static_SlotBG_" .. ii)
    self._ui.stc_slotBG[ii]:SetPosX((ii - 1) % self._colMax * self._defaultGab + self._startX)
    self._ui.stc_slotBG[ii]:SetPosY(math.floor((ii - 1) / self._colMax) * self._defaultGab + self._startY)
    self._ui.slot_dyes[ii] = {}
    local slot = self._ui.slot_dyes[ii]
    SlotItem.new(slot, "CampEquip_" .. ii, ii, self._ui.stc_slotBG[ii], slotConfig)
    slot:createChild()
    if ii <= self._colMax then
      self._ui.stc_slotBG[ii]:registerPadEvent(__eConsoleUIPadEvent_DpadUp, "InputScroll_DyeingRegister_Inventory(true)")
    elseif ii > self._colMax * (self._rowMax - 1) then
      self._ui.stc_slotBG[ii]:registerPadEvent(__eConsoleUIPadEvent_DpadDown, "InputScroll_DyeingRegister_Inventory(false)")
    end
  end
  self._ui.txt_keyGuideB = UI.getChildControl(self._ui.stc_bottomBG, "StaticText_B_ConsoleUI")
  self._ui.txt_keyGuideA = UI.getChildControl(self._ui.stc_bottomBG, "StaticText_A_ConsoleUI")
  self:registEventHandler()
end
function DyeingRegister:registEventHandler()
  registerEvent("FromClient_UpdateDyeingPalette", "FromClient_DyeingRegister_Update")
end
function PaGlobalFunc_DyeingRegister_GetShow()
  return _panel:GetShow()
end
function PaGlobalFunc_DyeingRegister_Open()
  DyeingRegister:open()
end
function PaGlobalFunc_DyeingRegister_Close()
  DyeingRegister:close()
end
function DyeingRegister:open()
  _panel:SetShow(true)
  self:updateList()
end
function DyeingRegister:close()
  _panel:SetShow(false)
end
function FromClient_DyeingRegister_Update()
  local self = DyeingRegister
  if true == _panel:GetShow() then
    self:updateList()
  end
  self._waitForMessage = false
  self._ui.txt_keyGuideA:SetMonoTone(false)
end
function DyeingRegister:updateList()
  local playerLevel = getSelfPlayer():get():getLevel()
  local selfPlayer = getSelfPlayer()
  local pearlInvenUseSize = selfPlayer:get():getInventorySlotCount(true)
  local occupiedSlotCount = 0
  for ii = 1, #self._ui.slot_dyes do
    self._ui.slot_dyes[ii]:clearItem()
  end
  for ii = __eTInventorySlotNoUseStart, pearlInvenUseSize do
    local itemWrapper = getInventoryItemByType(CppEnums.ItemWhereType.eCashInventory, ii + self._scrollAmount)
    if nil ~= itemWrapper then
      local isDyeAble = itemWrapper:getStaticStatus():get():isDyeingStaticStatus()
      if isDyeAble then
        if occupiedSlotCount < #self._ui.slot_dyes then
          self._ui.slot_dyes[occupiedSlotCount + 1]:setItem(itemWrapper, ii + self._scrollAmount)
          self._ui.slot_dyes[occupiedSlotCount + 1].icon:addInputEvent("Mouse_LUp", "PaGlobalFunc_DyeingRegister_Regist(" .. ii + self._scrollAmount .. ")")
        end
        occupiedSlotCount = occupiedSlotCount + 1
      end
    end
  end
  if occupiedSlotCount > #self._ui.slot_dyes then
    self._ui.scroll_itemList:SetShow(true)
    UIScroll.SetButtonSize(self._ui.scroll_itemList, #self._ui.slot_dyes, occupiedSlotCount)
  else
    self._ui.scroll_itemList:SetShow(false)
  end
end
function PaGlobalFunc_DyeingRegister_Regist(slotNo)
  local self = DyeingRegister
  if self._waitForMessage then
    return
  end
  local itemWrapper = getInventoryItemByType(CppEnums.ItemWhereType.eCashInventory, slotNo)
  if nil == itemWrapper then
    UI.ASSERT(nil ~= itemWrapper, "dye itemWrapper \235\138\148 nil\236\157\180\236\150\180\236\132\160 \236\149\136\235\144\169\235\139\136\235\141\148")
    return
  end
  local count_s64 = itemWrapper:get():getCount_s64()
  local function doInsertPalette()
    ToClient_requestCreateDyeingPaletteFromItem(CppEnums.ItemWhereType.eCashInventory, slotNo, count_s64)
    self._waitForMessage = true
    self._ui.txt_keyGuideA:SetMonoTone(true)
  end
  local ampuleName = itemWrapper:getStaticStatus():getName()
  local messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE")
  local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PALETTE_SURE_THIS_AMPLUE", "itemName", ampuleName)
  local messageBoxData = {
    title = messageTitle,
    content = messageBoxMemo,
    functionYes = doInsertPalette,
    functionNo = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(messageBoxData)
end
function InputScroll_DyeingRegister_Inventory(isUp)
  local self = DyeingRegister
  self._scrollAmount = UIScroll.ScrollEvent(self._ui.scroll_itemList, isUp, self._rowMax, 192, self._scrollAmount, self._colMax)
  self:updateList()
end
