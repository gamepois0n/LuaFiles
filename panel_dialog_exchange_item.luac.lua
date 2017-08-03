-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\dialogue\panel_dialog_exchange_item.luac 

-- params : ...
-- function num : 0
Panel_Exchange_Item:SetShow(false, false)
Panel_Exchange_Item:RegisterShowEventFunc(true, "ExchangeItemShowAni()")
Panel_Exchange_Item:RegisterShowEventFunc(false, "ExchangeItemHideAni()")
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local ExchangeItem = {_slotMaxCount = 5, _startIndex = 0, _listCount = 0, startPosY = 4, panelSizeY = 260, 
_slots = {}
, _uiBG = (UI.getChildControl)(Panel_Exchange_Item, "Static_Item_ExchangeBG"), _uiTitle = (UI.getChildControl)(Panel_Exchange_Item, "StaticText_Exchange_Item"), _scroll = (UI.getChildControl)(Panel_Exchange_Item, "VerticalScroll"), _btnClose = (UI.getChildControl)(Panel_Exchange_Item, "Button_Win_Close")}
ExchangeItem._scrollCtrlBtn = (UI.getChildControl)(ExchangeItem._scroll, "VerticalScroll_CtrlButton")
ExchangeItemShowAni = function()
  -- function num : 0_0
end

ExchangeItemHideAni = function()
  -- function num : 0_1
end

ExchangeItem.Init = function(self)
  -- function num : 0_2 , upvalues : UI_TM
  for ii = 0, self._slotMaxCount - 1 do
    local slot = {}
    slot.slotNo = ii
    slot._uiListBG = (UI.createAndCopyBasePropertyControl)(Panel_Exchange_Item, "Static_ItemListBG", self._uiBG, "itemListBG" .. ii)
    slot._sourceIcon = (UI.createAndCopyBasePropertyControl)(Panel_Exchange_Item, "Static_Source_ItemIcon", slot._uiListBG, "sourceIcon" .. ii)
    slot._sourceItemName = (UI.createAndCopyBasePropertyControl)(Panel_Exchange_Item, "StaticText_Source_ItemName", slot._uiListBG, "sourceItemName" .. ii)
    slot._resultIcon = (UI.createAndCopyBasePropertyControl)(Panel_Exchange_Item, "Static_Result_ItemIcon", slot._uiListBG, "resultIcon" .. ii)
    slot._resultItemName = (UI.createAndCopyBasePropertyControl)(Panel_Exchange_Item, "StaticText_Result_ItemName", slot._uiListBG, "resultItemName" .. ii)
    slot._progressArrow = (UI.createAndCopyBasePropertyControl)(Panel_Exchange_Item, "Static_Progress_Arrow", slot._uiListBG, "progressArrow" .. ii)
    ;
    (slot._uiListBG):SetPosX(4)
    ;
    (slot._uiListBG):SetPosY(self.startPosY + ((slot._uiListBG):GetSizeY() + 3) * ii)
    ;
    (slot._sourceIcon):SetPosX(3)
    ;
    (slot._sourceIcon):SetPosY(4)
    ;
    (slot._sourceItemName):SetPosX(34)
    ;
    (slot._sourceItemName):SetPosY(1)
    ;
    (slot._resultIcon):SetPosX(215)
    ;
    (slot._resultIcon):SetPosY(4)
    ;
    (slot._resultItemName):SetPosX(246)
    ;
    (slot._resultItemName):SetPosY(1)
    ;
    (slot._progressArrow):SetPosX(180)
    ;
    (slot._progressArrow):SetPosY((slot._sourceIcon):GetPosY() - 2)
    ;
    (slot._resultItemName):SetTextMode(UI_TM.eTextMode_AutoWrap)
    ;
    (slot._sourceItemName):SetTextMode(UI_TM.eTextMode_AutoWrap)
    ;
    (slot._uiListBG):addInputEvent("Mouse_UpScroll", "ExchangeItem_Scroll( true )")
    ;
    (slot._uiListBG):addInputEvent("Mouse_DownScroll", "ExchangeItem_Scroll( false )")
    ;
    (slot._sourceIcon):addInputEvent("Mouse_UpScroll", "ExchangeItem_Scroll( true )")
    ;
    (slot._sourceIcon):addInputEvent("Mouse_DownScroll", "ExchangeItem_Scroll( false )")
    ;
    (slot._resultIcon):addInputEvent("Mouse_UpScroll", "ExchangeItem_Scroll( true )")
    ;
    (slot._resultIcon):addInputEvent("Mouse_DownScroll", "ExchangeItem_Scroll( false )")
    ;
    (slot._sourceItemName):addInputEvent("Mouse_UpScroll", "ExchangeItem_Scroll( true )")
    ;
    (slot._sourceItemName):addInputEvent("Mouse_DownScroll", "ExchangeItem_Scroll( false )")
    ;
    (slot._resultItemName):addInputEvent("Mouse_UpScroll", "ExchangeItem_Scroll( true )")
    ;
    (slot._resultItemName):addInputEvent("Mouse_DownScroll", "ExchangeItem_Scroll( false )")
    ;
    (slot._progressArrow):addInputEvent("Mouse_UpScroll", "ExchangeItem_Scroll( true )")
    ;
    (slot._progressArrow):addInputEvent("Mouse_DownScroll", "ExchangeItem_Scroll( false )")
    -- DECOMPILER ERROR at PC195: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._slots)[ii] = slot
  end
  ;
  (UIScroll.InputEvent)(self._scroll, "ExchangeItem_Scroll")
  ;
  (self._btnClose):addInputEvent("Mouse_LUp", "Panel_Exchange_Item_Hide()")
end

Dialog_ExchangeItem_Update = function()
  -- function num : 0_3 , upvalues : ExchangeItem
  local self = ExchangeItem
  local npcDialogData = ToClient_GetCurrentDialogData()
  if npcDialogData == nil then
    return 
  end
  local displayExchangeWrapper = npcDialogData:getCurrentDisplayExchangeWrapper()
  self._listCount = displayExchangeWrapper:getItemExchangeByNpcListSize()
  if displayExchangeWrapper == nil then
    Panel_Exchange_Item_Hide()
    return 
  end
  for ii = 0, self._slotMaxCount - 1 do
    local slot = (self._slots)[ii]
    ;
    (slot._uiListBG):SetShow(false)
  end
  local uiIndex = 0
  for npcIndex = self._startIndex, self._listCount - 1 do
    if self._slotMaxCount - 1 < uiIndex then
      break
    end
    local slot = (self._slots)[uiIndex]
    local itemWrapperLua = displayExchangeWrapper:getItemExchangeByNpcStaticStatusWrapperAtIndex(npcIndex)
    if itemWrapperLua ~= nil then
      local needItemWrapperLua = itemWrapperLua:getNeedItemStaticStatusWrapper()
      local resultItemWrapperLua = itemWrapperLua:getToItemStaticStatusWrapper()
      if needItemWrapperLua ~= nil and resultItemWrapperLua ~= nil then
        local needItemCount = itemWrapperLua:getNeedItemCount_s64()
        local needItemColorGrade = needItemWrapperLua:getGradeType()
        local needItemName = needItemWrapperLua:getName()
        local needItemIcon = needItemWrapperLua:getIconPath()
        local resultItemCount = itemWrapperLua:getToItemCount_s64()
        local resultItemColorGrade = resultItemWrapperLua:getGradeType()
        local resultItemName = resultItemWrapperLua:getName()
        local resultItemIcon = resultItemWrapperLua:getIconPath()
        ;
        (slot._sourceIcon):ChangeTextureInfoName("Icon/" .. needItemIcon)
        ;
        (slot._sourceIcon):addInputEvent("Mouse_On", "ExchangeItem_ShowToolTip( " .. uiIndex .. "," .. 0 .. ")")
        ;
        (slot._sourceIcon):addInputEvent("Mouse_Out", "ExchangeItem_HideToolTip()")
        ;
        (slot._sourceItemName):SetText(ExchangeItem_getGradeToColorString(needItemColorGrade) .. needItemName .. "<PAOldColor> x" .. tostring(needItemCount))
        ;
        (slot._sourceItemName):addInputEvent("Mouse_On", "ExchangeItem_ShowToolTip( " .. uiIndex .. "," .. 0 .. ")")
        ;
        (slot._sourceItemName):addInputEvent("Mouse_Out", "ExchangeItem_HideToolTip()")
        ;
        (slot._resultIcon):ChangeTextureInfoName("Icon/" .. resultItemIcon)
        ;
        (slot._resultIcon):addInputEvent("Mouse_On", "ExchangeItem_ShowToolTip( " .. uiIndex .. "," .. 1 .. ")")
        ;
        (slot._resultIcon):addInputEvent("Mouse_Out", "ExchangeItem_HideToolTip()")
        ;
        (slot._resultItemName):SetText(ExchangeItem_getGradeToColorString(resultItemColorGrade) .. resultItemName .. "<PAOldColor> x" .. tostring(resultItemCount))
        ;
        (slot._resultItemName):addInputEvent("Mouse_On", "ExchangeItem_ShowToolTip( " .. uiIndex .. "," .. 1 .. ")")
        ;
        (slot._resultItemName):addInputEvent("Mouse_Out", "ExchangeItem_HideToolTip()")
        ;
        (slot._uiListBG):SetShow(true)
        ;
        (slot._sourceIcon):SetShow(true)
        ;
        (slot._sourceItemName):SetShow(true)
        ;
        (slot._resultIcon):SetShow(true)
        ;
        (slot._resultItemName):SetShow(true)
        ;
        (slot._progressArrow):SetShow(true)
        uiIndex = uiIndex + 1
      end
    end
  end
  do
    local realCount = 0
    for index = 0, self._listCount - 1 do
      local itemWrapperLua = displayExchangeWrapper:getItemExchangeByNpcStaticStatusWrapperAtIndex(index)
      if itemWrapperLua ~= nil then
        realCount = realCount + 1
      end
    end
    self._listCount = realCount
    ;
    (UIScroll.SetButtonSize)(self._scroll, self._slotMaxCount, self._listCount)
    if uiIndex < self._listCount then
      (self._scroll):SetShow(true)
    else
      ;
      (self._scroll):SetShow(false)
    end
    if self._listCount < self._slotMaxCount then
      local gapCount = self._slotMaxCount - self._listCount
      Panel_Exchange_Item:SetSize(Panel_Exchange_Item:GetSizeX(), self.panelSizeY - 37 * gapCount)
      Panel_Exchange_Item:SetPosY(getScreenSizeY() - (Panel_Npc_Dialog:GetSizeY() + Panel_Exchange_Item:GetSizeY() + 10))
      ;
      (self._uiBG):SetSize((self._uiBG):GetSizeX(), Panel_Exchange_Item:GetSizeY() - 70)
    else
      do
        Panel_Exchange_Item:SetSize(Panel_Exchange_Item:GetSizeX(), self.panelSizeY)
        Panel_Exchange_Item:SetPosY(getScreenSizeY() - (Panel_Npc_Dialog:GetSizeY() + Panel_Exchange_Item:GetSizeY() + 10))
        ;
        (self._uiBG):SetSize((self._uiBG):GetSizeX(), Panel_Exchange_Item:GetSizeY() - 70)
        if self._listCount == 0 then
          Panel_Exchange_Item_Hide()
        end
      end
    end
  end
end

Panel_Exchange_Item_Show = function()
  -- function num : 0_4 , upvalues : ExchangeItem
  local self = ExchangeItem
  Panel_Exchange_Item:SetShow(true, true)
  ;
  (self._scroll):SetControlPos(0)
end

Panel_Exchange_Item_Hide = function()
  -- function num : 0_5 , upvalues : ExchangeItem
  local self = ExchangeItem
  if not Panel_Exchange_Item:IsShow() then
    return 
  end
  Panel_Exchange_Item:SetShow(false, false)
  self._startIndex = 0
  ;
  (self._scrollCtrlBtn):SetPosY(0)
end

ExchangeItem_ShowToolTip = function(uiIndex, itemtype)
  -- function num : 0_6 , upvalues : ExchangeItem
  local self = ExchangeItem
  local startIdx = self._startIndex
  local npcIdx = uiIndex + startIdx
  local npcDialogData = ToClient_GetCurrentDialogData()
  local itemInfo = ((npcDialogData:getCurrentDisplayExchangeWrapper()):getItemExchangeByNpcStaticStatusWrapperAtIndex(npcIdx))
  local itemWrapper, UiBase = nil, nil
  if itemtype == 0 then
    itemWrapper = itemInfo:getNeedItemStaticStatusWrapper()
    UiBase = ((self._slots)[uiIndex])._sourceIcon
    Panel_Tooltip_Item_Show(itemWrapper, UiBase, true, false, nil)
  else
    if itemtype == 1 then
      itemWrapper = itemInfo:getToItemStaticStatusWrapper()
      UiBase = ((self._slots)[uiIndex])._resultIcon
      Panel_Tooltip_Item_Show(itemWrapper, UiBase, true, false, nil)
    end
  end
end

ExchangeItem_HideToolTip = function()
  -- function num : 0_7
  Panel_Tooltip_Item_hideTooltip()
end

ExchangeItem_Scroll = function(isUp)
  -- function num : 0_8 , upvalues : ExchangeItem
  local self = ExchangeItem
  self._startIndex = (UIScroll.ScrollEvent)(self._scroll, isUp, self._slotMaxCount, self._listCount, self._startIndex, 1)
  Dialog_ExchangeItem_Update()
end

ExchangeItem_onScreenResize = function()
  -- function num : 0_9
  local scrX = getScreenSizeX()
  local scrY = getScreenSizeY()
  Panel_Exchange_Item:SetPosX(scrX - (Panel_Exchange_Item:GetSizeX() + 20))
  Panel_Exchange_Item:SetPosY(scrY - (Panel_Npc_Dialog:GetSizeY() + Panel_Exchange_Item:GetSizeY() + 10))
end

FGlobal_Exchange_Item = function()
  -- function num : 0_10 , upvalues : ExchangeItem
  local self = ExchangeItem
  ExchangeItem_onScreenResize()
  Panel_Exchange_Item_Show()
  Dialog_ExchangeItem_Update()
end

ExchangeItem_getGradeToColorString = function(grade)
  -- function num : 0_11
  if grade == 0 then
    return "<PAColor0xffc4bebe>"
  else
    if grade == 1 then
      return "<PAColor0xFF5DFF70>"
    else
      if grade == 2 then
        return "<PAColor0xFF4B97FF>"
      else
        if grade == 3 then
          return "<PAColor0xFFFFC832>"
        else
          if grade == 4 then
            return "<PAColor0xFFFF6C00>"
          else
            return "<PAColor0xffc4bebe>"
          end
        end
      end
    end
  end
end

ExchangeItem:Init()
ExchangeItem_onScreenResize()

