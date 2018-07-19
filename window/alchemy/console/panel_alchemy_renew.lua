local alchemy = {
  _init = false,
  _panel = Panel_Window_Alchemy,
  _ui = {
    typeControl,
    titleControl,
    iconControl,
    descControl,
    tipControl,
    knowledgeTypeTitleControl,
    knowledgeTitleControl,
    knowledgeDescControl,
    filterCheckControl,
    cookingPotFrontControl,
    cookingPotBackControl,
    alchemyPotFrontControl,
    alchemyPotBackControl,
    list2
  },
  _invenFilterItemTypes = {
    [CppEnums.ItemType.Equip] = 1
  },
  _materialCount = 5,
  _materialSlotItemTable = {},
  _cookingMaterialEffectSlotItem = {},
  _alchemyMaterialEffectSlotItem = {},
  _knownKnowledgeOnlyFlag = false,
  _isCook = false,
  _selectedKnowledgeIndex = -1,
  _knowledgeFilterKeyword = ""
}
function alchemy:initialize()
  if self._init then
    return
  end
  self._init = true
  local titleBarControl = UI.getChildControl(self._panel, "Static_TitleBG")
  self._ui.typeControl = UI.getChildControl(titleBarControl, "StaticText_Title")
  self._ui.titleControl = UI.getChildControl(self._panel, "StaticText_Type_Name")
  self._ui.iconControl = UI.getChildControl(self._panel, "Static_Type_Icon")
  self._ui.descControl = UI.getChildControl(self._panel, "StaticText_Type_Desc")
  for i = 1, self._materialCount do
    local slotBgControl = UI.getChildControl(self._panel, "Static_Item_Slot" .. i)
    local slot = {}
    SlotItem.new(slot, "Slot" .. i, i, slotBgControl, {
      createIcon = true,
      createBorder = true,
      createCount = true,
      createCash = true
    })
    slot:createChild()
    table.insert(self._materialSlotItemTable, slot)
    slot.icon:addInputEvent("Mouse_LUp", "PaGlobalFunc_AlchemySelectMultipleMaterials()")
    slotBgControl:registerPadEvent(__eConsoleUIPadEvent_DpadUp, "PaGlobalFunc_AlchemyChangeMaterialCount(" .. i .. ", 1)")
    slotBgControl:registerPadEvent(__eConsoleUIPadEvent_DpadDown, "PaGlobalFunc_AlchemyChangeMaterialCount(" .. i .. ", -1)")
  end
  local tipBgControl = UI.getChildControl(self._panel, "Static_Tip")
  self._ui.tipControl = UI.getChildControl(tipBgControl, "StaticText_Tip1")
  self._ui.tipControl:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  local knowledgeControl = UI.getChildControl(self._panel, "Static_List_BG")
  self._ui.knowledgeTypeTitleControl = UI.getChildControl(knowledgeControl, "StaticText_Title")
  self._ui.knowledgeTitleControl = UI.getChildControl(knowledgeControl, "StaticText_Item_Name")
  self._ui.knowledgeDescControl = UI.getChildControl(knowledgeControl, "StaticText_Item_Desc")
  self._ui.knowledgeDescControl:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
  self._ui.filterCheckControl = UI.getChildControl(knowledgeControl, "StaticText_Filter")
  self._ui.filterCheckControl:addInputEvent("Mouse_LUp", "PaGlobalFunc_AlchemyToggleKnownKnowledgeOnly()")
  self._ui.list2 = UI.getChildControl(knowledgeControl, "List2_Alchemy")
  self._ui.list2:registEvent(CppEnums.PAUIList2EventType.luaChangeContent, "PaGlobalFunc_AlchemyUpdateListItem")
  self._ui.list2:createChildContent(CppEnums.PAUIList2ElementManagerType.list)
  UI.getChildControl(self._panel, "StaticText_Do_ConsoleUI"):addInputEvent("Mouse_LUp", "PaGlobalFunc_AlchemyAlchemy()")
  UI.getChildControl(self._panel, "StaticText_Continue_ConsoleUI"):addInputEvent("Mouse_LUp", "PaGlobalFunc_AlchemyAlchemyRepeat()")
  self._ui.cookingPotFrontControl = UI.getChildControl(self._panel, "Static_Cook_Pot_Front")
  self._ui.cookingPotBackControl = UI.getChildControl(self._panel, "Static_Cook_Pot_Back")
  self._ui.cookingPotBackControl:AddEffect("fUI_AlchemyCook01", true, 0, 0)
  self._ui.alchemyPotFrontControl = UI.getChildControl(self._panel, "Static_Alchemy_Pot_Front")
  self._ui.alchemyPotBackControl = UI.getChildControl(self._panel, "Static_Alchemy_Pot_Back")
  self._ui.alchemyPotBackControl:AddEffect("fUI_AlchemyCook01", true, 0, 0)
  SlotItem.new(self._cookingMaterialEffectSlotItem, "AnimPushItemCook", 0, self._ui.cookingPotBackControl, {
    createIcon = true,
    createBorder = false,
    createCash = true
  })
  self._cookingMaterialEffectSlotItem:createChild()
  self._cookingMaterialEffectSlotItem.icon:SetShow(false)
  SlotItem.new(self._alchemyMaterialEffectSlotItem, "AnimPushItemCook", 0, self._ui.alchemyPotBackControl, {
    createIcon = true,
    createBorder = false,
    createCash = true
  })
  self._alchemyMaterialEffectSlotItem:createChild()
  self._alchemyMaterialEffectSlotItem.icon:SetShow(false)
  self._panel:registerPadEvent(__eConsoleUIPadEvent_Up_X, "PaGlobalFunc_AlchemyAlchemy()")
  self._panel:registerPadEvent(__eConsoleUIPadEvent_Up_Y, "PaGlobalFunc_AlchemyAlchemyRepeat()")
  registerEvent("ResponseShowAlchemy", "PaGlobalFunc_AlchemyOpen")
  registerEvent("FromClient_AlchemyFailAck", "PaGlobalFunc_AlchemyResponse")
end
function alchemy:completeMultipleSelection()
  if PaGlobalFunc_InventoryInfo_GetShow() then
    InventoryWindow_Close()
    return true
  end
end
function PaGlobalFunc_AlchemyCompleteMultipleSelection()
  return alchemy:completeMultipleSelection()
end
function alchemy:selectMultipleMaterials()
  PaGlobalFunc_InventoryInfo_Open()
  PaGlobalFunc_InventoryInfo_InitMultipleSelect()
  for i = 1, self._materialCount do
    local slotNo = ToClient_AlchemyGetMaterialSlotNoByIndex(i - 1)
    if CppEnums.TInventorySlotNoUndefined ~= slotNo then
      PaGlobalFunc_InventoryInfo_ToggleMultipleSelect(slotNo - 1, CppEnums.ItemWhereType.eInventory)
    end
  end
  Inventory_SetFunctor(PaGlobalFunc_AlchemyFilter, PaGlobalFunc_AlchemyHandleInventoryRightClick, nil, nil, {multipleSelectEndFunc = PaGlobalFunc_AlchemyCompleteMultipleSelection, button = __eConsoleUIPadEvent_X})
  Inventory_updateSlotData()
end
function PaGlobalFunc_AlchemySelectMultipleMaterials()
  return alchemy:selectMultipleMaterials()
end
function alchemy:changeMaterialCount(materialIndex, diffCount)
  local slotNo = ToClient_AlchemyGetMaterialSlotNoByIndex(materialIndex - 1)
  ToClient_AlchemyPushItemFromInventory(slotNo, diffCount)
  return true
end
function PaGlobalFunc_AlchemyChangeMaterialCount(materialIndex, diffCount)
  if alchemy:changeMaterialCount(materialIndex, diffCount) then
    return alchemy:update()
  end
end
function alchemy:selectKnowledge(knowledgeIndex)
  local prevIndex = self._selectedKnowledgeIndex
  if prevIndex == knowledgeIndex then
    return false
  end
  self._selectedKnowledgeIndex = knowledgeIndex
  self._ui.list2:requestUpdateByKey(toInt64(0, prevIndex))
  self._ui.list2:requestUpdateByKey(toInt64(0, knowledgeIndex))
  return true
end
function PaGlobalFunc_AlchemySelectKnowledge(knowledgeIndex)
  if alchemy:selectKnowledge(knowledgeIndex) then
    return alchemy:updateKnowledge()
  end
end
function alchemy:updateListItem(content, key)
  local knowledgeIndex = Int64toInt32(key)
  local knowledge = ToClient_AlchemyGetKnowledge(knowledgeIndex)
  if not knowledge then
    return
  end
  local buttonControl = UI.getChildControl(content, "RadioButton_Item")
  buttonControl:SetTextMode(CppEnums.TextMode.eTextMode_LimitText)
  buttonControl:addInputEvent("Mouse_On", "PaGlobalFunc_AlchemySelectKnowledge(" .. knowledgeIndex .. ")")
  local selectFlag = self._selectedKnowledgeIndex == knowledgeIndex
  buttonControl:SetCheck(selectFlag)
  local learnFlag = isLearnMentalCardForAlchemy(knowledge:getKey())
  if learnFlag then
    buttonControl:SetFontColor(Defines.Color.C_FF84FFF5)
    buttonControl:SetText(knowledge:getName())
  else
    buttonControl:SetFontColor(Defines.Color.C_FF888888)
    buttonControl:SetText("??? ( " .. knowledge:getKeyword() .. " )")
  end
  content:SetShow(true)
  return true
end
function PaGlobalFunc_AlchemyUpdateListItem(content, key)
  if alchemy:updateListItem(content, key) then
  end
end
function alchemy:checkToAlchemy()
  if ToClient_AlchemyGetCountSlotWithMaterial() <= 0 then
    return false
  end
  if ToClient_AlchemyGetMaxMassProductionCount() < Defines.s64_const.s64_1 then
    return false
  end
  return true
end
function alchemy:alchemyXXXXX()
  if not checkAlchemyAction() then
    return false
  end
  ToClient_AlchemyDo()
  return false
end
function PaGlobalFunc_AlchemyAlchemyXXXXX()
  if alchemy:alchemyXXXXX() then
    return alchemy:update()
  end
end
function alchemy:resume()
  self:alchemyXXX(ToClient_AlchemyGetDoingAlchemyCount())
  return true
end
function PaGlobalFunc_AlchemyResume()
  if alchemy:resume() then
    return alchemy:update()
  end
end
function alchemy:alchemyXXX(count)
  if not self:checkToAlchemy() then
    return false
  end
  if not ToClient_AlchemySetupMaterialsForMassProduction(count) then
    _PA_ASSERT(false, "setupMaterialsForMassProduction\236\157\180 \236\139\164\237\140\168\237\150\136\236\138\181\235\139\136\235\139\164. countProduction\236\157\180 ToClient_AlchemyGetMaxMassProductionCount()\235\179\180\235\139\164 \237\129\176 \234\178\131\236\157\128 \236\149\132\235\139\140\236\167\128 \237\153\149\236\157\184\237\149\180\235\179\180\236\139\156\234\184\176 \235\176\148\235\158\141\235\139\136\235\139\164.")
  end
  ToClient_AlchemyStart(self._isCook, count)
  local progressBarTimeSec = ToClient_AlchemyGetAlchemyTime(self._isCook) / 1000
  if 0 == progressBarTimeSec then
    return false
  end
  EventProgressBarShow(true, progressBarTimeSec, true == self._isCook and 7 or 9)
  audioPostEvent_SystemUi(1, 0)
  self:close()
  return false
end
function PaGlobalFunc_AlchemyAlchemyXXX(count)
  if alchemy:alchemyXXX(count) then
    return alchemy:update()
  end
end
function alchemy:alchemy()
  return self:alchemyXXX(Defines.s64_const.s64_1)
end
function PaGlobalFunc_AlchemyAlchemy()
  if alchemy:alchemy() then
    return alchemy:update()
  end
end
function alchemy:alchemyRepeatStep2()
  if not self:checkToAlchemy() then
    return false
  end
  Panel_NumberPad_Show(true, ToClient_AlchemyGetMaxMassProductionCount(), nil, PaGlobalFunc_AlchemyAlchemyXXX)
  return false
end
function PaGlobalFunc_AlchemyRepeatStep2()
  if alchemy:alchemyRepeatStep2() then
    return alchemy:update()
  end
end
function alchemy:alchemyRepeat()
  if not self:checkToAlchemy() then
    return false
  end
  local msgBoxData = {
    title = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE"),
    content = PAGetString(Defines.StringSheet_GAME, self._isCook and "LUA_ALCHEMY_MSGBOX_COOK_SEQUENCE_MSG" or "LUA_ALCHEMY_MSGBOX_ALCHEMY_SEQUENCE_MSG"),
    functionYes = PaGlobalFunc_AlchemyRepeatStep2,
    functionNo = MessageBox_Empty_function,
    priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
  }
  MessageBox.showMessageBox(msgBoxData, "middle")
  return false
end
function PaGlobalFunc_AlchemyAlchemyRepeat()
  if alchemy:alchemyRepeat() then
    return alchemy:update()
  end
end
function alchemy:toggleKnownKnowledgeOnly()
  self._knownKnowledgeOnlyFlag = not self._knownKnowledgeOnlyFlag
  return self:initKnowledge()
end
function PaGlobalFunc_AlchemyToggleKnownKnowledgeOnly()
  if alchemy:toggleKnownKnowledgeOnly() then
    return alchemy:updateKnowledge()
  end
end
function alchemy:cancel()
  ToClient_AlchemyCancel()
  return true
end
function PaGlobalFunc_AlchemyCancel()
  if alchemy:cancel() then
    return alchemy:update()
  end
end
function alchemy:response(isSuccess, hint, alchemyType, str, bDoingMassProduction)
  if isSuccess then
    return alchemy:responseSuccess(str)
  else
    return alchemy:responseFail(hint, alchemyType, strErr, bDoingMassProduction)
  end
end
function PaGlobalFunc_AlchemyResponse(isSuccess, hint, alchemyType, str, bDoingMassProduction)
  if alchemy:response(isSuccess, hint, alchemyType, str, bDoingMassProduction) then
    return alchemy:update()
  end
end
function alchemy:responseSuccess(str)
  return true
end
function alchemy:responseFail(hint, alchemyType, strErr, bDoingMassProduction)
  if 1 == hint or 2 == hint or 3 == hint then
    local msg = {
      main = PAGetString(Defines.StringSheet_GAME, "ALCHEMYFAIL_REASON_" .. hint),
      sub = ""
    }
    local msgType = self._isCook and 27 or 26
    Proc_ShowMessage_Ack_For_RewardSelect(msg, 2.5, msgType)
    if true == bDoingMassProduction then
      local failMsg = PAGetString(Defines.StringSheet_GAME, self._isCook and "LUA_ALCHEMY_COOKING" or "LUA_ALCHEMY_ALCHEMY")
      local messageBoxData = {
        title = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ALCHEMY_MSGBOX_FAIL_TITLE", "failMsg", failMsg),
        content = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ALCHEMY_MSGBOX_FAIL_MEMO", "failMsg", failMsg),
        functionYes = PaGlobalFunc_AlchemyResume,
        functionNo = PaGlobalFunc_AlchemyCancel,
        priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
      }
      MessageBox.showMessageBox(messageBoxData)
    end
  else
    Proc_ShowMessage_Ack(strErr)
    self:cancel()
  end
  return true
end
function alchemy:filter(slotNo, itemWrapper, whereType)
  if CppEnums.ItemWhereType.eInventory ~= whereType then
    return true
  end
  local isTradable = itemWrapper:getStaticStatus():isPersonalTrade()
  local isVested = itemWrapper:get():isVested()
  if isTradable and isVested then
    return true
  end
  if itemWrapper:get():isSeized() then
    return true
  end
  local itemType = itemWrapper:getStaticStatus():getItemType()
  if self._invenFilterItemTypes[itemType] then
    return true
  end
  local isCash = itemWrapper:getStaticStatus():get():isCash()
  if isCash then
    return true
  end
  if self._materialCount <= ToClient_AlchemyGetCountSlotWithMaterial() and not ToClient_AlchemyIsInvenSlotPushedInMaterialSlot(slotNo) then
    return true
  end
  return false
end
function PaGlobalFunc_AlchemyFilter(slotNo, itemWrapper, whereType)
  return alchemy:filter(slotNo, itemWrapper, whereType)
end
function alchemy:showEffect(slotNo)
  local materialIndex = ToClient_AlchemyGetMaterialIndexBySlotNo(slotNo)
  if materialIndex < 0 then
    return
  end
  local item = ToClient_AlchemyGetItemStaticAtMaterialSlot(materialIndex)
  if not item then
    return
  end
  local effect = self._isCook and self._cookingMaterialEffectSlotItem or self._alchemyMaterialEffectSlotItem
  effect:setItemByStaticStatus(item)
  effect.icon:SetShow(true)
  local posX = 100
  local posY = -125
  local timeRate = 1
  local aniInfo = effect.icon:addMoveAnimation(0 * timeRate, 1.5 * timeRate, CppEnums.PAUI_ANIM_ADVANCE_TYPE.PAUI_ANIM_ADVANCE_LINEAR)
  aniInfo.StartHorizonType = CppEnums.PA_UI_ALIGNHORIZON.PA_UI_HORIZON_LEFT
  aniInfo.EndHorizonType = CppEnums.PA_UI_ALIGNHORIZON.PA_UI_HORIZON_LEFT
  aniInfo:SetStartPosition(posX, posY)
  aniInfo:SetEndPosition(posX, posY + 225)
  local aniInfo2 = effect.icon:addRotateAnimation(0 * timeRate, 1.5 * timeRate, CppEnums.PAUI_ANIM_ADVANCE_TYPE.PAUI_ANIM_ADVANCE_LINEAR)
  aniInfo2:SetStartRotate(0)
  aniInfo2:SetEndRotate(1)
  aniInfo2:SetRotateCount(1)
end
function alchemy:hideEffect()
  local effect = self._isCook and self._cookingMaterialEffectSlotItem or self._alchemyMaterialEffectSlotItem
  effect.icon:SetShow(false)
end
function alchemy:insertMaterial(slotNo)
  if checkAlchemyAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_NOT_CHANGE"))
    return false
  end
  ToClient_AlchemyPushItemFromInventory(slotNo, 1)
  self:showEffect(slotNo)
  return true
end
function alchemy:handleInventoryRightClick(slotNo, itemWrapper, count)
  PaGlobalFunc_InventoryInfo_ToggleMultipleSelect(slotNo - 1, CppEnums.ItemWhereType.eInventory)
  if ToClient_AlchemyIsInvenSlotPushedInMaterialSlot(slotNo) then
    return self:removeMaterial(slotNo)
  else
    return self:insertMaterial(slotNo)
  end
  return false
end
function PaGlobalFunc_AlchemyHandleInventoryRightClick(slotNo, itemWrapper, count)
  if alchemy:handleInventoryRightClick(slotNo, itemWrapper, count) then
    return alchemy:update()
  end
end
function alchemy:initKnowledge()
  self._selectedKnowledgeIndex = -1
  self._ui.list2:getElementManager():clearKey()
  if self._isCook then
    ToClient_AlchemyReconstructAlchemyKnowledge(30010)
  else
    ToClient_AlchemyReconstructAlchemyKnowledge(31000)
  end
  ToClient_AlchemySetKnowledgeFilter(self._knownKnowledgeOnlyFlag, self._knowledgeFilterKeyword)
  for i = 0, ToClient_AlchemyGetCountFilteredKnowledge() - 1 do
    self._ui.list2:getElementManager():pushKey(ToClient_AlchemyGetFilteredKnowledgeIndex(i))
  end
  return true
end
function alchemy:getSelectedKnowledge()
  if 0 <= self._selectedKnowledgeIndex and self._selectedKnowledgeIndex < ToClient_AlchemyGetCountFilteredKnowledge() then
    return ToClient_AlchemyGetKnowledge(self._selectedKnowledgeIndex)
  end
end
function alchemy:updateKnowledge()
  local typeString = PAGetString(Defines.StringSheet_GAME, self._isCook and "LUA_ALCHEMY_COOKING" or "LUA_ALCHEMY_ALCHEMY")
  self._ui.knowledgeTypeTitleControl:SetText(typeString)
  local knowledge = self:getSelectedKnowledge()
  if knowledge then
    self._ui.knowledgeTitleControl:SetText(knowledge:getName())
    self._ui.knowledgeTitleControl:SetShow(true)
    local learnFlag = isLearnMentalCardForAlchemy(knowledge:getKey())
    self._ui.knowledgeDescControl:SetText(learnFlag and knowledge:getDesc() or "???")
  else
    self._ui.knowledgeTitleControl:SetShow(false)
    local descString = PAGetString(Defines.StringSheet_GAME, self._isCook and "LUA_ALCHEMY_WANTMORE_SELECT_COOKKNOWLEDGE" or "LUA_ALCHEMY_WANTMORE_SELECT_ALCHEMYKNOWLEDGE")
    self._ui.knowledgeDescControl:SetText(descString)
  end
end
function alchemy:open(isCook, installationType)
  if self:checkShow() then
    self:close()
    return false
  end
  self._ui.cookingPotFrontControl:SetShow(isCook)
  self._ui.cookingPotBackControl:SetShow(isCook)
  self._ui.alchemyPotFrontControl:SetShow(not isCook)
  self._ui.alchemyPotBackControl:SetShow(not isCook)
  self:hideEffect()
  self._isCook = isCook
  self:initKnowledge()
  self._knowledgeFilterKeyword = ""
  self._knownKnowledgeOnlyFlag = false
  ToClient_AlchemyClearMaterialSlot()
  Inventory_SetFunctor(PaGlobalFunc_AlchemyFilter, PaGlobalFunc_AlchemyHandleInventoryRightClick, PaGlobalFunc_AlchemyClose, nil)
  FGlobal_SetInventoryDragNoUse(self._panel)
  self._panel:SetShow(true)
  return true
end
function PaGlobalFunc_AlchemyOpen(isCook, installationType)
  if alchemy:open(isCook, installationType) then
    return alchemy:update()
  end
end
function alchemy:close()
  InventoryWindow_Close()
  self._panel:SetShow(false)
end
function PaGlobalFunc_AlchemyClose()
  return alchemy:close()
end
function alchemy:updateMaterial()
  PaGlobalFunc_InventoryInfo_InitMultipleSelect()
  for i = 1, table.getn(self._materialSlotItemTable) do
    local slotItem = self._materialSlotItemTable[i]
    local slotNo = ToClient_AlchemyGetMaterialSlotNoByIndex(i - 1)
    if CppEnums.TInventorySlotNoUndefined == slotNo then
      slotItem:clearItem()
    else
      PaGlobalFunc_InventoryInfo_ToggleMultipleSelect(slotNo - 1, CppEnums.ItemWhereType.eInventory)
      local item = ToClient_AlchemyGetItemStaticAtMaterialSlot(i - 1)
      local count = ToClient_AlchemyGetCountItemAtMaterialSlot_s64(i - 1)
      slotItem:setItemByStaticStatus(item, count)
    end
  end
end
function alchemy:update()
  local typeString = PAGetString(Defines.StringSheet_GAME, self._isCook and "LUA_ALCHEMY_COOKING" or "LUA_ALCHEMY_ALCHEMY")
  self._ui.typeControl:SetText(typeString)
  self._ui.titleControl:SetText(typeString)
  self._ui.descControl:SetText(self._isCook and "desc for cook" or "desc for alchemy")
  self:updateMaterial()
  local tip = PAGetString(Defines.StringSheet_RESOURCE, "ALCHEMY_COOK_TEXT_DESCRPITION")
  if self._isCook then
    tip = tip .. "\n" .. PAGetString(Defines.StringSheet_RESOURCE, "ALCHEMY_COOK_TEXT_DESCRPITION2")
  end
  self._ui.tipControl:SetText(tip)
  self:updateKnowledge()
  return true
end
function alchemy:removeMaterial(slotNo)
  local materialIndex = ToClient_AlchemyGetMaterialIndexBySlotNo(slotNo)
  if materialIndex >= 0 then
    ToClient_AlchemyPopMaterial(materialIndex)
    return true
  end
end
function alchemy:popMaterial()
  local materialCount = ToClient_AlchemyGetCountSlotWithMaterial()
  if materialCount > 0 then
    ToClient_AlchemyPopMaterial(materialCount - 1)
    return true
  end
end
function alchemy:back()
  if self:popMaterial() then
    return true
  end
  if PaGlobalFunc_InventoryInfo_GetShow() then
    return InventoryWindow_Close()
  end
  if not self:checkShow() then
    return false
  end
  alchemy:close()
end
function PaGlobalFunc_AlchemyBack()
  if alchemy:back() then
    return alchemy:update()
  end
end
function alchemy:checkShow()
  return self._panel:GetShow()
end
function PaGlobalFunc_AlchemyCheckShow()
  return alchemy:checkShow()
end
function PaGlobalFunc_AlchemyPerFrameUpdate()
  return alchemy:perFrameUpdate()
end
function alchemy:perFrameUpdate()
end
function alchemy:changePlatformSpecKey()
end
function PaGlobalFunc_AlchemyInit()
  alchemy:initialize()
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_AlchemyInit")
function PaGlobalFunc_AlchemyTest()
  return PaGlobalFunc_AlchemyOpen(false)
end
