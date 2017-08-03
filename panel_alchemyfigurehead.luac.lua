-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\alchemy\panel_alchemyfigurehead.luac 

-- params : ...
-- function num : 0
Panel_AlchemyFigureHead:SetShow(false)
local AlchemyFigureHead = {
control = {contentBG = (UI.getChildControl)(Panel_AlchemyFigureHead, "Static_ContentTypeBG"), contentEffect = (UI.getChildControl)(Panel_AlchemyFigureHead, "Static_ContentTypeEffect"), guideString = (UI.getChildControl)(Panel_AlchemyFigureHead, "Static_GuideText"), descBg = (UI.getChildControl)(Panel_AlchemyFigureHead, "Static_DescBg"), desc = (UI.getChildControl)(Panel_AlchemyFigureHead, "StaticText_Desc"), btn_Close = (UI.getChildControl)(Panel_AlchemyFigureHead, "Button_Win_Close"), btn_Doit = (UI.getChildControl)(Panel_AlchemyFigureHead, "Button_Doit"), Slot_1 = (UI.getChildControl)(Panel_AlchemyFigureHead, "Static_Slot_1"), Slot_2 = (UI.getChildControl)(Panel_AlchemyFigureHead, "Static_Slot_2")}
, 
slotConfig = {createIcon = true, createBorder = true, createCount = true, createCash = true}
, 
Stuff_slot = {}
, 
FigureHead_slot = {}
, selectedTabIdx = 2, selectedFigureHeadType = 0, selectedFigureHeadItemKey = nil, fromWhereType = -1, fromSlotNo = -1, fromCount = -1, toWhereType = -1, toSlotNo = -1, isPushDoit = false, startEffectPlay = false, contentEffectPlay = false, slotEffectPlay = false, effectEnd = false, 
resultMsg = {}
}
AlchemyFigureHead.PanelResize_ByFontSize = function(self)
  -- function num : 0_0 , upvalues : AlchemyFigureHead
  local totemDesc = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYFISHPRINT_DESC")
  ;
  ((AlchemyFigureHead.control).guideString):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((AlchemyFigureHead.control).guideString):SetText(((AlchemyFigureHead.control).guideString):GetText())
  if ((AlchemyFigureHead.control).guideString):GetTextSizeY() > 30 then
    ((AlchemyFigureHead.control).guideString):SetSize(((AlchemyFigureHead.control).guideString):GetSizeX(), ((AlchemyFigureHead.control).guideString):GetTextSizeY() + 10)
  else
    ;
    ((AlchemyFigureHead.control).guideString):SetSize(((AlchemyFigureHead.control).guideString):GetSizeX(), 30)
  end
  ;
  ((AlchemyFigureHead.control).desc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((AlchemyFigureHead.control).desc):SetText(totemDesc)
end

AlchemyFigureHead:PanelResize_ByFontSize()
local panelSizeY = Panel_AlchemyFigureHead:GetSizeY()
local bgSizeY = ((AlchemyFigureHead.control).descBg):GetSizeY()
local textSizeY = ((AlchemyFigureHead.control).desc):GetTextSizeY()
if textSizeY > 70 then
  Panel_AlchemyFigureHead:SetSize(Panel_AlchemyFigureHead:GetSizeX(), panelSizeY + textSizeY - 68)
  ;
  ((AlchemyFigureHead.control).descBg):SetSize(((AlchemyFigureHead.control).descBg):GetSizeX(), bgSizeY + textSizeY - 68)
else
  Panel_AlchemyFigureHead:SetSize(Panel_AlchemyFigureHead:GetSizeX(), panelSizeY)
  ;
  ((AlchemyFigureHead.control).descBg):SetSize(((AlchemyFigureHead.control).descBg):GetSizeX(), bgSizeY)
end
;
((AlchemyFigureHead.control).btn_Doit):ComputePos()
local btn_Question = (UI.getChildControl)(Panel_AlchemyFigureHead, "Button_Question")
btn_Question:SetShow(false)
local AlchemyFigureHeadTab = {Upgrade = 2}
local AlchemyFigureHeadTabTexture = {
[AlchemyFigureHeadTab.Upgrade] = {bg = "New_UI_Common_forLua/Window/AlchemyFigureHead/AlchemyFigureHead_BG.dds", effect = "New_UI_Common_forLua/Window/AlchemyStone/AlchemyStone_Upgrade_Effect.dds"}
}
AlchemyFigureHead.Init = function(self)
  -- function num : 0_1 , upvalues : AlchemyFigureHeadTabTexture
  (SlotItem.new)(self.Stuff_slot, "AlchemyFigureHead_Stuff", 0, (self.control).Slot_1, self.slotConfig)
  ;
  (self.Stuff_slot):createChild()
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.Stuff_slot).Empty = true
  ;
  ((self.Stuff_slot).icon):addInputEvent("Mouse_RUp", "HandleClicked_AlchemyFigureHead_UnSetSlot(" .. 1 .. ")")
  ;
  (SlotItem.new)(self.FigureHead_slot, "AlchemyFigureHead_FigureHead", 0, (self.control).Slot_2, self.slotConfig)
  ;
  (self.FigureHead_slot):createChild()
  -- DECOMPILER ERROR at PC36: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.FigureHead_slot).Empty = true
  ;
  ((self.FigureHead_slot).icon):addInputEvent("Mouse_RUp", "HandleClicked_AlchemyFigureHead_UnSetSlot(" .. 0 .. ")")
  ;
  ((self.control).contentBG):ChangeTextureInfoName((AlchemyFigureHeadTabTexture[2]).bg)
  ;
  ((self.control).contentEffect):SetShow(false)
end

AlchemyFigureHead.registEventHandler = function(self)
  -- function num : 0_2
  ((self.control).btn_Doit):addInputEvent("Mouse_LUp", "HandleClicked_AlchemyFigureHead_Doit()")
  ;
  ((self.control).btn_Close):addInputEvent("Mouse_LUp", "HandleClicked_AlchemyFigureHead_Close()")
end

AlchemyFigureHead.registMessageHandler = function(self)
  -- function num : 0_3
  registerEvent("onScreenResize", "AlchemyFigureHead_onScreenResize")
  registerEvent("FromClient_ItemUpgrade", "FromClient_FigureHeadUpgrade")
  registerEvent("FromClient_StoneChange", "FromClient_FigureHeadChange")
  registerEvent("FromClient_StoneChangeFailedByDown", "FromClient_FigureHeadChangeFailedByDown")
  registerEvent("FromClient_AlchemyEvolve", "FromClient_FigureHeadEvolve")
  Panel_AlchemyFigureHead:RegisterUpdateFunc("Panel_AlchemyFigureHead_updateTime")
end

AlchemyFigureHead.ClearData = function(self, isOpenStep)
  -- function num : 0_4 , upvalues : AlchemyFigureHead
  if isOpenStep == true then
    self.resultMsg = {}
  end
  self.toWhereType = -1
  self.toSlotNo = -1
  self.fromWhereType = -1
  self.fromSlotNo = -1
  self.fromCount = -1
  self.selectedFigureHeadType = -1
  self.selectedFigureHeadItemKey = nil
  self.isPushDoit = false
  self.startEffectPlay = false
  self.contentEffectPlay = false
  self.slotEffectPlay = false
  self.effectEnd = false
  ;
  ((self.control).btn_Doit):SetMonoTone(not self.isPushDoit)
  ;
  ((self.control).btn_Doit):SetEnable(self.isPushDoit)
  ;
  (self.Stuff_slot):clearItem()
  ;
  (self.FigureHead_slot):clearItem()
  -- DECOMPILER ERROR at PC34: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self.Stuff_slot).Empty = true
  -- DECOMPILER ERROR at PC36: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self.FigureHead_slot).Empty = true
  ;
  ((AlchemyFigureHead.FigureHead_slot).icon):addInputEvent("Mouse_On", "")
  ;
  ((AlchemyFigureHead.Stuff_slot).icon):addInputEvent("Mouse_On", "")
  ;
  ((self.control).contentEffect):SetShow(false)
  local guideKeyword = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_UPGRADE")
  local guideText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ALCHEMYFISHPRINT_SELECT", "guideKeyword", guideKeyword)
  ;
  ((self.control).guideString):SetText(guideText)
  ;
  ((self.control).btn_Doit):SetText(guideKeyword)
end

HandleClicked_AlchemyFigureHeadTab = function(tabIdx)
  -- function num : 0_5 , upvalues : AlchemyFigureHead, AlchemyFigureHeadTabTexture
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  AlchemyFigureHead.toWhereType = -1
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R1 in 'UnsetPending'

  AlchemyFigureHead.toSlotNo = -1
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  AlchemyFigureHead.fromWhereType = -1
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  AlchemyFigureHead.fromSlotNo = -1
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

  AlchemyFigureHead.fromCount = -1
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

  AlchemyFigureHead.selectedFigureHeadType = -1
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  AlchemyFigureHead.selectedFigureHeadItemKey = nil
  ;
  (AlchemyFigureHead.FigureHead_slot):clearItem()
  ;
  (AlchemyFigureHead.Stuff_slot):clearItem()
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (AlchemyFigureHead.FigureHead_slot).Empty = true
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (AlchemyFigureHead.Stuff_slot).Empty = true
  ;
  ((AlchemyFigureHead.FigureHead_slot).icon):addInputEvent("Mouse_On", "")
  ;
  ((AlchemyFigureHead.FigureHead_slot).icon):addInputEvent("Mouse_Out", "")
  ;
  ((AlchemyFigureHead.Stuff_slot).icon):addInputEvent("Mouse_On", "")
  ;
  ((AlchemyFigureHead.Stuff_slot).icon):addInputEvent("Mouse_Out", "")
  ;
  ((AlchemyFigureHead.control).contentBG):ChangeTextureInfoName((AlchemyFigureHeadTabTexture[tabIdx]).bg)
  -- DECOMPILER ERROR at PC65: Confused about usage of register: R1 in 'UnsetPending'

  AlchemyFigureHead.selectedTabIdx = tabIdx
  -- DECOMPILER ERROR at PC67: Confused about usage of register: R1 in 'UnsetPending'

  AlchemyFigureHead.isPushDoit = false
  ;
  ((AlchemyFigureHead.Stuff_slot).icon):EraseAllEffect()
  ;
  ((AlchemyFigureHead.control).contentEffect):EraseAllEffect()
  ;
  ((AlchemyFigureHead.FigureHead_slot).icon):EraseAllEffect()
  Inventory_SetFunctor(AlchemyFigureHead_FigureHeadFilter, AlchemyFigureHead_FigureHeadRfunction, nil, nil)
  local guideKeyword = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_UPGRADE")
  local guideText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ALCHEMYFISHPRINT_SELECT", "guideKeyword", guideKeyword)
  ;
  ((AlchemyFigureHead.control).guideString):SetText(guideText)
  ;
  ((AlchemyFigureHead.control).btn_Doit):SetText(guideKeyword)
end

HandleClicked_AlchemyFigureHead_Doit = function()
  -- function num : 0_6 , upvalues : AlchemyFigureHead, AlchemyFigureHeadTab
  local doUpgrade = function()
    -- function num : 0_6_0 , upvalues : AlchemyFigureHead
    -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

    AlchemyFigureHead.isPushDoit = true
  end

  local itemWrapper = getInventoryItemByType(AlchemyFigureHead.toWhereType, AlchemyFigureHead.toSlotNo)
  local itemSSW = itemWrapper:getStaticStatus()
  local itemGrade = itemSSW:getGradeType()
  local itemContentsParam2 = (itemSSW:get())._contentsEventParam2
  local msgTitle = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE")
  local msgContent = ""
  if AlchemyFigureHead.selectedTabIdx == AlchemyFigureHeadTab.Upgrade then
    if itemContentsParam2 == 2 or itemContentsParam2 == 3 then
      msgContent = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYFISHPRINT_MSGBOX_CONTENT1")
    else
      if itemContentsParam2 == 4 then
        msgContent = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYFISHPRINT_MSGBOX_CONTENT2")
      else
        -- DECOMPILER ERROR at PC48: Confused about usage of register: R7 in 'UnsetPending'

        AlchemyFigureHead.isPushDoit = true
      end
    end
    if msgContent ~= "" then
      local messageBoxData = {title = msgTitle, content = msgContent, functionYes = doUpgrade, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData, "middle")
    end
  else
    do
      -- DECOMPILER ERROR at PC68: Confused about usage of register: R7 in 'UnsetPending'

      AlchemyFigureHead.isPushDoit = true
      ;
      ((AlchemyFigureHead.control).contentEffect):SetShow(true)
      ;
      ((AlchemyFigureHead.control).btn_Doit):SetMonoTone(AlchemyFigureHead.isPushDoit)
      ;
      ((AlchemyFigureHead.control).btn_Doit):SetEnable(not AlchemyFigureHead.isPushDoit)
      audioPostEvent_SystemUi(1, 43)
    end
  end
end

HandleClicked_AlchemyFigureHead_Close = function()
  -- function num : 0_7 , upvalues : AlchemyFigureHead
  Panel_AlchemyFigureHead:CloseUISubApp()
  Panel_AlchemyFigureHead:SetShow(false)
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R0 in 'UnsetPending'

  AlchemyFigureHead.toWhereType = -1
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R0 in 'UnsetPending'

  AlchemyFigureHead.toSlotNo = -1
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R0 in 'UnsetPending'

  AlchemyFigureHead.fromWhereType = -1
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

  AlchemyFigureHead.fromSlotNo = -1
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R0 in 'UnsetPending'

  AlchemyFigureHead.fromCount = -1
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R0 in 'UnsetPending'

  AlchemyFigureHead.selectedFigureHeadType = -1
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R0 in 'UnsetPending'

  AlchemyFigureHead.selectedFigureHeadItemKey = nil
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R0 in 'UnsetPending'

  AlchemyFigureHead.isPushDoit = false
  if Panel_Window_Inventory:GetShow() then
    Inventory_SetFunctor(nil, nil, nil, nil)
    Equipment_SetShow(true)
  end
end

HandleClicked_AlchemyFigureHead_UnSetSlot = function(slotType)
  -- function num : 0_8 , upvalues : AlchemyFigureHead
  -- DECOMPILER ERROR at PC10: Unhandled construct in 'MakeBoolean' P1

  if slotType == 0 and (AlchemyFigureHead.FigureHead_slot).Empty == false then
    (AlchemyFigureHead.FigureHead_slot):clearItem()
    -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (AlchemyFigureHead.FigureHead_slot).Empty = true
    ;
    (AlchemyFigureHead.Stuff_slot):clearItem()
    -- DECOMPILER ERROR at PC20: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (AlchemyFigureHead.Stuff_slot).Empty = true
    ;
    ((AlchemyFigureHead.FigureHead_slot).icon):addInputEvent("Mouse_On", "")
    ;
    ((AlchemyFigureHead.FigureHead_slot).icon):addInputEvent("Mouse_Out", "")
    ;
    ((AlchemyFigureHead.Stuff_slot).icon):addInputEvent("Mouse_On", "")
    ;
    ((AlchemyFigureHead.Stuff_slot).icon):addInputEvent("Mouse_Out", "")
    ;
    ((AlchemyFigureHead.control).btn_Doit):SetMonoTone(true)
    ;
    ((AlchemyFigureHead.control).btn_Doit):SetEnable(false)
    Inventory_SetFunctor(AlchemyFigureHead_FigureHeadFilter, AlchemyFigureHead_FigureHeadRfunction, nil, nil)
  end
  if (AlchemyFigureHead.Stuff_slot).Empty == false then
    (AlchemyFigureHead.Stuff_slot):clearItem()
    -- DECOMPILER ERROR at PC78: Confused about usage of register: R1 in 'UnsetPending'

    ;
    (AlchemyFigureHead.Stuff_slot).Empty = true
    ;
    ((AlchemyFigureHead.Stuff_slot).icon):addInputEvent("Mouse_On", "")
    ;
    ((AlchemyFigureHead.Stuff_slot).icon):addInputEvent("Mouse_Out", "")
    ;
    ((AlchemyFigureHead.control).btn_Doit):SetMonoTone(true)
    ;
    ((AlchemyFigureHead.control).btn_Doit):SetEnable(false)
    Inventory_SetFunctor(AlchemyFigureHead_StuffFilter, AlchemyFigureHead_StuffRfunction, nil, nil)
  end
end

AlchemyFigureHead_ItemToolTip = function(isShow, slotType)
  -- function num : 0_9 , upvalues : AlchemyFigureHead
  if isShow == true then
    local control, itemWrapper = nil, nil
    if slotType == 0 then
      control = (AlchemyFigureHead.FigureHead_slot).icon
      if AlchemyFigureHead.toWhereType ~= -1 then
        itemWrapper = getInventoryItemByType(AlchemyFigureHead.toWhereType, AlchemyFigureHead.toSlotNo)
        Panel_Tooltip_Item_Show(itemWrapper, control, false, true, nil, nil, nil)
      else
        return 
      end
    else
      control = (AlchemyFigureHead.Stuff_slot).icon
      if AlchemyFigureHead.fromWhereType ~= -1 then
        itemWrapper = getInventoryItemByType(AlchemyFigureHead.fromWhereType, AlchemyFigureHead.fromSlotNo)
        Panel_Tooltip_Item_Show(itemWrapper, control, false, true, nil, nil, nil)
      else
        return 
      end
    end
  else
    do
      Panel_Tooltip_Item_hideTooltip()
    end
  end
end

AlchemyFigureHead_FigureHeadFilter = function(slotNo, itemWrapper, count, inventoryType)
  -- function num : 0_10
  local returnValue = true
  if itemWrapper:getStaticStatus() == nil then
    return returnValue
  end
  if ((itemWrapper:getStaticStatus()):get()):getContentsEventType() == 37 then
    returnValue = false
  end
  return returnValue
end

AlchemyFigureHead_FigureHeadRfunction = function(slotNo, itemWrapper, count, inventoryType)
  -- function num : 0_11 , upvalues : AlchemyFigureHead
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R4 in 'UnsetPending'

  AlchemyFigureHead.toWhereType = inventoryType
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R4 in 'UnsetPending'

  AlchemyFigureHead.toSlotNo = slotNo
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R4 in 'UnsetPending'

  AlchemyFigureHead.selectedFigureHeadType = ((itemWrapper:getStaticStatus()):get())._contentsEventParam1
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R4 in 'UnsetPending'

  AlchemyFigureHead.selectedFigureHeadItemKey = (itemWrapper:get()):getKey()
  ;
  (AlchemyFigureHead.FigureHead_slot):setItem(itemWrapper)
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (AlchemyFigureHead.FigureHead_slot).Empty = false
  ;
  ((AlchemyFigureHead.FigureHead_slot).icon):addInputEvent("Mouse_On", "AlchemyFigureHead_ItemToolTip( true, " .. 0 .. " )")
  ;
  ((AlchemyFigureHead.FigureHead_slot).icon):addInputEvent("Mouse_Out", "AlchemyFigureHead_ItemToolTip( false )")
  Inventory_SetFunctor(AlchemyFigureHead_StuffFilter, AlchemyFigureHead_StuffRfunction, nil, nil)
  local guideText = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_SELECT_UPGRADE")
  ;
  ((AlchemyFigureHead.control).guideString):SetText(guideText)
end

AlchemyFigureHead_StuffFilter = function(slotNo, itemWrapper, count, inventoryType)
  -- function num : 0_12 , upvalues : AlchemyFigureHead, AlchemyFigureHeadTab
  local returnValue = true
  local staticStatus = itemWrapper:getStaticStatus()
  if staticStatus == nil or AlchemyFigureHead.selectedFigureHeadType == -1 then
    return returnValue
  end
  do
    if AlchemyFigureHeadTab.Upgrade == AlchemyFigureHead.selectedTabIdx then
      local itemKey = (itemWrapper:get()):getKey()
      if staticStatus:isAlchemyUpgradeMaterial(AlchemyFigureHead.selectedFigureHeadItemKey) then
        returnValue = false
      end
    end
    return returnValue
  end
end

AlchemyFigureHead_StuffRfunction = function(slotNo, itemWrapper, count, inventoryType)
  -- function num : 0_13 , upvalues : AlchemyFigureHead
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R4 in 'UnsetPending'

  AlchemyFigureHead.fromWhereType = inventoryType
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R4 in 'UnsetPending'

  AlchemyFigureHead.fromSlotNo = slotNo
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R4 in 'UnsetPending'

  AlchemyFigureHead.fromCount = count
  local setStuffFunc = function(itemCount)
    -- function num : 0_13_0 , upvalues : AlchemyFigureHead, inventoryType, slotNo
    -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

    AlchemyFigureHead.fromCount = itemCount
    local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
    local itemSSW = itemWrapper:getStaticStatus()
    ;
    (AlchemyFigureHead.Stuff_slot):setItemByStaticStatus(itemSSW, AlchemyFigureHead.fromCount, nil, nil, nil)
    -- DECOMPILER ERROR at PC18: Confused about usage of register: R3 in 'UnsetPending'

    ;
    (AlchemyFigureHead.Stuff_slot).Empty = false
    ;
    ((AlchemyFigureHead.Stuff_slot).icon):addInputEvent("Mouse_On", "AlchemyFigureHead_ItemToolTip( true, " .. 1 .. " )")
    ;
    ((AlchemyFigureHead.Stuff_slot).icon):addInputEvent("Mouse_Out", "AlchemyFigureHead_ItemToolTip( false )")
    ;
    ((AlchemyFigureHead.control).btn_Doit):SetMonoTone(AlchemyFigureHead.isPushDoit)
    ;
    ((AlchemyFigureHead.control).btn_Doit):SetEnable(not AlchemyFigureHead.isPushDoit)
    guideText = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_DOIT_UPGRADE")
    ;
    ((AlchemyFigureHead.control).guideString):SetText(guideText)
  end

  if toInt64(0, 1) < count then
    Panel_NumberPad_Show(true, count, nil, setStuffFunc, false, nil, nil)
  else
    setStuffFunc(toInt64(0, 1))
  end
end

FGlobal_AlchemyFigureHead_Open = function()
  -- function num : 0_14 , upvalues : AlchemyFigureHead
  local isAlchemyFigureHeadEnble = ToClient_IsContentsGroupOpen("44")
  if not isAlchemyFigureHeadEnble then
    return 
  end
  if Panel_AlchemyStone:GetShow() then
    FGlobal_AlchemyStone_Close()
  end
  if Panel_Manufacture:GetShow() then
    Manufacture_Close()
  end
  if Panel_DyePalette:GetShow() then
    FGlobal_DyePalette_Close()
  end
  FGlobal_SetInventoryDragNoUse(Panel_AlchemyFigureHead)
  Panel_AlchemyFigureHead:SetShow(true)
  AlchemyFigureHead:ClearData(true)
  HandleClicked_AlchemyFigureHeadTab(2)
  if Panel_Window_Inventory:IsUISubApp() then
    Panel_AlchemyFigureHead:OpenUISubApp()
  end
  if Panel_Equipment:GetShow() then
    EquipmentWindow_Close()
  end
  InventoryWindow_Show()
  Inventory_SetFunctor(AlchemyFigureHead_FigureHeadFilter, AlchemyFigureHead_FigureHeadRfunction, nil, nil)
end

FGlobal_AlchemyFigureHead_Close = function()
  -- function num : 0_15
  HandleClicked_AlchemyFigureHead_Close()
  Panel_AlchemyFigureHead:CloseUISubApp()
end

local elapsTime = 0
Panel_AlchemyFigureHead_updateTime = function(deltaTime)
  -- function num : 0_16 , upvalues : AlchemyFigureHead, elapsTime
  if AlchemyFigureHead.isPushDoit then
    elapsTime = elapsTime + deltaTime
    if elapsTime > 0 and AlchemyFigureHead.startEffectPlay == false then
      ((AlchemyFigureHead.Stuff_slot).icon):EraseAllEffect()
      ;
      ((AlchemyFigureHead.Stuff_slot).icon):AddEffect("fUI_Alchemy_UpgradeStart01", false)
      -- DECOMPILER ERROR at PC27: Confused about usage of register: R1 in 'UnsetPending'

      AlchemyFigureHead.startEffectPlay = true
      audioPostEvent_SystemUi(13, 17)
    end
    if elapsTime > 1 and AlchemyFigureHead.contentEffectPlay == false then
      (AlchemyFigureHead.Stuff_slot):clearItem()
      -- DECOMPILER ERROR at PC45: Confused about usage of register: R1 in 'UnsetPending'

      ;
      (AlchemyFigureHead.Stuff_slot).Empty = true
      ;
      ((AlchemyFigureHead.control).contentEffect):EraseAllEffect()
      ;
      ((AlchemyFigureHead.control).contentEffect):AddEffect("fUI_Alchemy_Stone_Upgrade01", false)
      -- DECOMPILER ERROR at PC59: Confused about usage of register: R1 in 'UnsetPending'

      AlchemyFigureHead.contentEffectPlay = true
    end
    if elapsTime > 2.5 and AlchemyFigureHead.slotEffectPlay == false then
      ((AlchemyFigureHead.FigureHead_slot).icon):EraseAllEffect()
      ;
      ((AlchemyFigureHead.FigureHead_slot).icon):AddEffect("fUI_Alchemy_Stone_Upgrade02", false)
      -- DECOMPILER ERROR at PC80: Confused about usage of register: R1 in 'UnsetPending'

      AlchemyFigureHead.slotEffectPlay = true
    end
    if elapsTime > 3 and AlchemyFigureHead.effectEnd == false then
      alchemyEvolve(AlchemyFigureHead.fromWhereType, AlchemyFigureHead.fromSlotNo, AlchemyFigureHead.toWhereType, AlchemyFigureHead.toSlotNo)
      -- DECOMPILER ERROR at PC99: Confused about usage of register: R1 in 'UnsetPending'

      AlchemyFigureHead.effectEnd = true
      elapsTime = 0
      AlchemyFigureHead:ClearData()
      Inventory_SetFunctor(AlchemyFigureHead_FigureHeadFilter, AlchemyFigureHead_FigureHeadRfunction, nil, nil)
    end
  else
    elapsTime = 0
  end
end

AlchemyFigureHead_onScreenResize = function()
  -- function num : 0_17
  Panel_AlchemyFigureHead:ComputePos()
end

FromClient_FigureHeadUpgrade = function(itemwhereType, slotNo, exp)
  -- function num : 0_18 , upvalues : AlchemyFigureHead
  if not Panel_AlchemyFigureHead:GetShow() then
    return 
  end
  local itemWrapper = getInventoryItemByType(itemwhereType, slotNo)
  if itemWrapper == nil then
    return 
  end
  local itemName = (itemWrapper:getStaticStatus()):getName()
  local mainMsg = itemName .. PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_DONE_UPGRADE")
  -- DECOMPILER ERROR at PC49: Confused about usage of register: R6 in 'UnsetPending'

  AlchemyFigureHead.resultMsg = {main = mainMsg, sub = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_MSG_EXP") .. (string.format)("%.2f", itemWrapper:getExperience() / 10000) .. "%", addMsg = "Icon/" .. (itemWrapper:getStaticStatus()):getIconPath()}
  Proc_ShowMessage_Ack_For_RewardSelect(AlchemyFigureHead.resultMsg, 2.5, 33)
  -- DECOMPILER ERROR at PC58: Confused about usage of register: R6 in 'UnsetPending'

  AlchemyFigureHead.resultMsg = {}
  AlchemyFigureHead:ClearData()
  Inventory_SetFunctor(AlchemyFigureHead_FigureHeadFilter, AlchemyFigureHead_FigureHeadRfunction, nil, nil)
end

FromClient_FigureHeadChange = function(whereType, slotNo)
  -- function num : 0_19 , upvalues : AlchemyFigureHead
  if not Panel_AlchemyFigureHead:GetShow() then
    return 
  end
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if itemWrapper == nil then
    return 
  end
  local itemName = (itemWrapper:getStaticStatus()):getName()
  msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_MSG_DONE"), sub = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_MSG_DONE2", "itemName", itemName), addMsg = "Icon/" .. (itemWrapper:getStaticStatus()):getIconPath()}
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 2.5, 33)
  AlchemyFigureHead:ClearData()
  Inventory_SetFunctor(AlchemyFigureHead_FigureHeadFilter, AlchemyFigureHead_FigureHeadRfunction, nil, nil)
end

FromClient_FigureHeadChangeFailedByDown = function(whereType, slotNo)
  -- function num : 0_20 , upvalues : AlchemyFigureHead
  if not Panel_AlchemyFigureHead:GetShow() then
    return 
  end
  local itemWrapper = getInventoryItemByType(whereType, slotNo)
  if itemWrapper == nil then
    return 
  end
  local itemName = (itemWrapper:getStaticStatus()):getName()
  msg = {main = itemName .. PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_DONE_UPGRADE"), sub = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_MSG_FAIL2", "itemName", itemName), addMsg = "Icon/" .. (itemWrapper:getStaticStatus()):getIconPath()}
  Proc_ShowMessage_Ack_For_RewardSelect(msg, 2.5, 33)
  AlchemyFigureHead:ClearData()
  Inventory_SetFunctor(AlchemyFigureHead_FigureHeadFilter, AlchemyFigureHead_FigureHeadRfunction, nil, nil)
end

FromClient_FigureHeadEvolve = function(evolveType)
  -- function num : 0_21 , upvalues : AlchemyFigureHead
  if not Panel_AlchemyFigureHead:GetShow() then
    return 
  end
  if evolveType == 1 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMYSTONE_MSG_LOST"))
  end
  AlchemyFigureHead:ClearData()
  Inventory_SetFunctor(AlchemyFigureHead_FigureHeadFilter, AlchemyFigureHead_FigureHeadRfunction, nil, nil)
end

AlchemyFigureHead:Init()
AlchemyFigureHead:registEventHandler()
AlchemyFigureHead:registMessageHandler()
ConsoleGroupCreate_Panel_AlchemyFigureHead = function()
  -- function num : 0_22 , upvalues : AlchemyFigureHead
  local group_0 = Panel_AlchemyFigureHead:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  group_0:addControl(0, 0, 3, 1, (AlchemyFigureHead.Stuff_slot).icon)
  group_0:addControl(1, 0, 3, 1, (AlchemyFigureHead.FigureHead_slot).icon)
  group_0:addControl(2, 0, 3, 1, (AlchemyFigureHead.control).btn_Doit)
end

ConsoleGroupCreate_Panel_AlchemyFigureHead()

