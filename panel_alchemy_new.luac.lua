-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\alchemy\panel_alchemy_new.luac 

-- params : ...
-- function num : 0
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_AH = CppEnums.PA_UI_ALIGNHORIZON
local IM = CppEnums.EProcessorInputMode
local UI_TM = CppEnums.TextMode
PaGlobal_Alchemy = {_isCook = true, _maxMaterialCount = 5, _filterText = nil, 
_materialItemKeys = {}
, _selectedKnowledge = -1, 
_invenFilterItemTypes = {[(CppEnums.ItemType).Equip] = 1}
, 
_ui = {_staticTextTitle = (UI.getChildControl)(Panel_Alchemy, "StaticText_Title"), _buttonQuestion = (UI.getChildControl)(Panel_Alchemy, "Button_Question"), _buttonClose = (UI.getChildControl)(Panel_Alchemy, "Button_Close"), _buttonStartAlchemy = (UI.getChildControl)(Panel_Alchemy, "Button_StartAlchemy"), _buttonMassProduction = (UI.getChildControl)(Panel_Alchemy, "Button_MassProduction"), 
_staticMaterialSlots = {}
, _staticAlchemyIcon = (UI.getChildControl)(Panel_Alchemy, "Static_AlchemyIcon"), _frameContentAlchemyDesc = nil, _scrollAlchemyDesc = nil, _staticTextAlchemyDesc = nil, _checkButtonLearntOnly = (UI.getChildControl)(Panel_Alchemy, "CheckButton_ShowOnlyKnownRecipe"), _staticTextEmptyKnowledge = nil, _editBoxSearch = (UI.getChildControl)(Panel_Alchemy, "EditBox_Search"), _buttonSearch = (UI.getChildControl)(Panel_Alchemy, "PushButton_Search"), _staticTextSearchFailed = nil, _listKnowledge = (UI.getChildControl)(Panel_Alchemy, "List2_AlchemyRecipe")}
}
local InventoryFilterFunction = function(slotNo, itemWrapper, whereType)
  -- function num : 0_0
  if (CppEnums.ItemWhereType).eInventory ~= whereType then
    return true
  end
  local isTradable = (itemWrapper:getStaticStatus()):isPersonalTrade()
  local isVested = (itemWrapper:get()):isVested()
  if isTradable and isVested then
    return true
  end
  if (itemWrapper:get()):isSeized() == true then
    return true
  end
  local itemType = (itemWrapper:getStaticStatus()):getItemType()
  if (PaGlobal_Alchemy._invenFilterItemTypes)[itemType] ~= nil then
    return true
  end
  local isCash = ((itemWrapper:getStaticStatus()):get()):isCash()
  if isCash then
    return true
  end
  return false
end

Panel_Alchemy_CreateKnowledgeListContent = function(content, key)
  -- function num : 0_1 , upvalues : UI_color
  local knowledgeIndex = Int64toInt32(key)
  local recipe = (UI.getChildControl)(content, "StaticText_List2_AlchemyRecipe")
  local selectList = (UI.getChildControl)(content, "Static_List2_SelectList")
  local mentalCardStaticWrapper = ToClient_AlchemyGetKnowledge(knowledgeIndex)
  recipe:SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
  if PaGlobal_Alchemy._selectedKnowledge == knowledgeIndex then
    selectList:SetShow(true)
  else
    selectList:SetShow(false)
  end
  Alchemy_UnknownRecipe_TooltipShow = function(index)
    -- function num : 0_1_0 , upvalues : recipe
    local mentalCardSSW = ToClient_AlchemyGetKnowledge(index)
    if mentalCardSSW ~= nil then
      TooltipSimple_Show(recipe, mentalCardSSW:getKeyword())
    end
  end

  Alchemy_KnownRecipe_TooltipShow = function(index)
    -- function num : 0_1_1 , upvalues : recipe
    local mentalCardSSW = ToClient_AlchemyGetKnowledge(index)
    if mentalCardSSW ~= nil then
      TooltipSimple_Show(recipe, mentalCardSSW:getName(), mentalCardSSW:getKeyword())
    end
  end

  if mentalCardStaticWrapper ~= nil then
    local isLearn = ToClient_AlchemyIsLearntMentalCard(mentalCardStaticWrapper:getKey())
    if isLearn == true then
      recipe:SetFontColor(UI_color.C_FF84FFF5)
      recipe:SetText(mentalCardStaticWrapper:getName())
      recipe:addInputEvent("Mouse_On", "Alchemy_KnownRecipe_TooltipShow(" .. knowledgeIndex .. ")")
    else
      recipe:SetFontColor(UI_color.C_FF888888)
      recipe:SetText("??? ( " .. mentalCardStaticWrapper:getKeyword() .. " )")
      recipe:addInputEvent("Mouse_On", "Alchemy_UnknownRecipe_TooltipShow(" .. knowledgeIndex .. ")")
    end
    recipe:addInputEvent("Mouse_Out", "TooltipSimple_Hide()")
    recipe:SetShow(true)
    recipe:SetPosY(6)
    recipe:addInputEvent("Mouse_LUp", "PaGlobal_Alchemy:selectKnowledge( " .. knowledgeIndex .. " )")
  else
    do
      recipe:SetShow(false)
    end
  end
end

-- DECOMPILER ERROR at PC102: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_Alchemy.initialize = function(self)
  -- function num : 0_2 , upvalues : UI_TM
  local ui = self._ui
  ui._staticCookingPotBack = (UI.getChildControl)(Panel_Alchemy, "Static_Cook_Pot_Back")
  ui._staticCookingPotFront = (UI.getChildControl)(Panel_Alchemy, "Static_Cook_Pot_Front")
  ui._staticAlchemyPotBack = (UI.getChildControl)(Panel_Alchemy, "Static_Alchemy_Pot_Back")
  ui._staticAlchemyPotFront = (UI.getChildControl)(Panel_Alchemy, "Static_Alchemy_Pot_Front")
  ui._animPushItemCook = {}
  ui._animPushItemAlchemy = {}
  ui._frameAlchemyTips = (UI.getChildControl)(Panel_Alchemy, "Frame_AlchemyTips")
  ui._frameContentAlchemyTips = (UI.getChildControl)(ui._frameAlchemyTips, "Frame_1_Content")
  ui._staticTextAlchemyTips = (UI.getChildControl)(ui._frameContentAlchemyTips, "StaticText_AlchemyTips")
  ui._frameAlchemyDesc = (UI.getChildControl)(Panel_Alchemy, "Frame_Alchemy")
  ui._scrollAlchemyDesc = (UI.getChildControl)(ui._frameAlchemyDesc, "VerticalScroll")
  ui._frameContentAlchemyDesc = (UI.getChildControl)(ui._frameAlchemyDesc, "Frame_1_Content")
  ui._staticTextAlchemyDesc = (UI.getChildControl)(ui._frameContentAlchemyDesc, "StaticText_AlchemyDesc")
  ui._staticTextEmptyKnowledge = (UI.getChildControl)(ui._listKnowledge, "StaticText_EmptyKnowldege")
  ui._staticTextSearchFailed = (UI.getChildControl)(ui._listKnowledge, "StaticText_SearchFail")
  ;
  (ui._staticTextAlchemyTips):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (ui._staticTextAlchemyDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (ui._staticTextAlchemyTips):SetText((ui._staticTextAlchemyTips):GetText())
  ;
  (ui._frameContentAlchemyTips):SetSize((ui._frameContentAlchemyTips):GetSizeX(), (ui._staticTextAlchemyTips):GetSizeY())
  ;
  (ui._frameAlchemyTips):UpdateContentScroll()
  ;
  (ui._staticTextEmptyKnowledge):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_EMPTY_LEARNT_KNOWLEDGE"))
  ;
  (ui._staticTextSearchFailed):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_NO_SEARCH_RESULT"))
  ;
  (ui._editBoxSearch):RegistReturnKeyEvent("PaGlobal_Alchemy:handleMouseLUp_SearchButton()")
  ;
  (ui._editBoxSearch):addInputEvent("Mouse_LUp", "PaGlobal_Alchemy:clearEditBoxSearchText()")
  ;
  (ui._checkButtonLearntOnly):addInputEvent("Mouse_LUp", "PaGlobal_Alchemy:handleMouseLUp_CheckButtonLearntOnly()")
  ;
  (ui._buttonClose):addInputEvent("Mouse_LUp", "PaGlobal_Alchemy:closePanel()")
  ;
  (ui._buttonStartAlchemy):addInputEvent("Mouse_LUp", "PaGlobal_Alchemy:startAlchemy(Defines.s64_const.s64_1)")
  ;
  (ui._buttonMassProduction):addInputEvent("Mouse_LUp", "PaGlobal_Alchemy:showMassProductionMessageBox()")
  ;
  (ui._buttonSearch):addInputEvent("Mouse_LUp", "PaGlobal_Alchemy:handleMouseLUp_SearchButton()")
  ;
  (ui._listKnowledge):changeAnimationSpeed(10)
  ;
  (ui._listKnowledge):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "Panel_Alchemy_CreateKnowledgeListContent")
  ;
  (ui._listKnowledge):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (ui._staticCookingPotBack):AddEffect("fUI_AlchemyCook01", true, 0, 0)
  ;
  (ui._staticAlchemyPotBack):AddEffect("fUI_AlchemyCook01", true, 0, 0)
  ;
  (SlotItem.new)(ui._animPushItemCook, "AnimPushItemCook", 0, ui._staticCookingPotBack, {createIcon = true, createBorder = false, createCount = true, createCash = true})
  ;
  (ui._animPushItemCook):createChild()
  ;
  ((ui._animPushItemCook).icon):SetShow(false)
  ;
  (SlotItem.new)(ui._animPushItemAlchemy, "AnimPushItemAlchemy", 0, ui._staticAlchemyPotBack, {createIcon = true, createBorder = false, createCount = true, createCash = true})
  ;
  (ui._animPushItemAlchemy):createChild()
  ;
  ((ui._animPushItemAlchemy).icon):SetShow(false)
  ui._staticMaterialSlots = {}
  for i = 1, self._maxMaterialCount do
    local materialSlot = (UI.getChildControl)(Panel_Alchemy, "Static_IconSlot" .. i)
    local slotIcon = {}
    slotIcon = (SlotItem.new)(slotIcon, "MaterialIcon" .. i, 0, materialSlot, {createIcon = true, createBorder = true, createCount = true, createCash = true})
    slotIcon:createChild()
    ;
    (slotIcon.icon):SetIgnore(false)
    ;
    (slotIcon.icon):addInputEvent("Mouse_On", "PaGlobal_Alchemy:handleMouseOn_ShowMaterialTooltip(" .. i .. ")")
    ;
    (slotIcon.icon):addInputEvent("Mouse_Out", "PaGlobal_Alchemy:handleMouseOut_HideMaterialTooltip()")
    ;
    (slotIcon.icon):addInputEvent("Mouse_RUp", "PaGlobal_Alchemy:popMaterial(" .. i .. ")")
    ;
    (slotIcon.icon):SetSize(materialSlot:GetSizeX(), materialSlot:GetSizeY())
    -- DECOMPILER ERROR at PC296: Confused about usage of register: R8 in 'UnsetPending'

    ;
    (ui._staticMaterialSlots)[i] = slotIcon
  end
end

-- DECOMPILER ERROR at PC106: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_Alchemy.showPanel = function(self, isCook, installationType)
  -- function num : 0_3 , upvalues : InventoryFilterFunction
  if Panel_Alchemy:GetShow() == true then
    if isCook == self._isCook then
      return 
    end
    self:closePanel()
  end
  self._isCook = isCook
  local ui = self._ui
  ;
  (ui._staticCookingPotBack):SetShow(isCook == true)
  ;
  (ui._staticCookingPotFront):SetShow(isCook == true)
  ;
  (ui._staticAlchemyPotBack):SetShow(isCook == false)
  ;
  (ui._staticAlchemyPotFront):SetShow(isCook == false)
  if isCook == true then
    (ui._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelCook\" )")
    ;
    (ui._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelCook\", \"true\")")
    ;
    (ui._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelCook\", \"false\")")
    ;
    (ui._staticTextTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_COOKING"))
    ;
    (ui._checkButtonLearntOnly):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_SHOW_LEARNT_COOK"))
    ;
    (ui._buttonStartAlchemy):SetText(PAGetString(Defines.StringSheet_RESOURCE, "COOK_LETSCOOKING"))
  else
    (ui._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelAlchemy\" )")
    ;
    (ui._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelAlchemy\", \"true\")")
    ;
    (ui._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelAlchemy\", \"false\")")
    ;
    (ui._staticTextTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_ALCHEMY"))
    ;
    (ui._checkButtonLearntOnly):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_SHOW_LEARNT_ALCHEMY"))
    ;
    (ui._buttonStartAlchemy):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_REFINING"))
  end
  audioPostEvent_SystemUi(12, 11)
  ToClient_AlchemyClearMaterialSlot()
  self:updateMaterialSlot()
  if isCook then
    ToClient_AlchemyReconstructAlchemyKnowledge(30010)
  else
    ToClient_AlchemyReconstructAlchemyKnowledge(31000)
  end
  self:updateKnowledgeList()
  Panel_Alchemy:SetShow(true, true)
  Panel_Alchemy:SetPosX(getScreenSizeX() - getScreenSizeX() / 2 - Panel_Alchemy:GetSizeX() + Panel_Alchemy:GetSizeX() / 2)
  Panel_Alchemy:ComputePos()
  local funcRClicked = function(slotIdx, itemWrapper, count)
    -- function num : 0_3_0 , upvalues : self
    self:showInventoryNumpad(slotIdx, count)
  end

  do
    local funcOtherWindowOpen = function()
    -- function num : 0_3_1 , upvalues : self
    self:closePanel()
  end

    Inventory_SetFunctor(InventoryFilterFunction, funcRClicked, funcOtherWindowOpen, nil)
    FGlobal_SetInventoryDragNoUse(Panel_Alchemy)
    InventoryWindow_Show()
    -- DECOMPILER ERROR: 8 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC109: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_Alchemy.closePanel = function(self)
  -- function num : 0_4
  FGlobal_Alchemy_ClearEditFocus()
  if Panel_Alchemy:IsShow() == false then
    return 
  end
  self._filterText = nil
  ;
  (((self._ui)._animPushItemAlchemy).icon):SetShow(false)
  ;
  (((self._ui)._animPushItemCook).icon):SetShow(false)
  ;
  ((self._ui)._checkButtonLearntOnly):SetCheck(false)
  Panel_Alchemy:SetShow(false)
  PaGlobal_RecentCook:closePanel()
  InventoryWindow_Close()
  Panel_Alchemy:ComputePos()
end

-- DECOMPILER ERROR at PC114: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_Alchemy.playPushItemAnimation = function(self, invenSlotIndex, itemCount)
  -- function num : 0_5 , upvalues : UI_ANI_ADV, UI_AH
  local itemWrapper = getInventoryItem(invenSlotIndex)
  if not self._isCook or not (self._ui)._animPushItemCook then
    local staticAnimPushItem = (self._ui)._animPushItemAlchemy
  end
  staticAnimPushItem:setItemByStaticStatus(itemWrapper:getStaticStatus(), itemCount)
  local posX = 80
  local posY = -100
  local timeRate = 1
  audioPostEvent_SystemUi(12, 12)
  local aniCtrl = staticAnimPushItem.icon
  aniCtrl:SetShow(true)
  aniCtrl:AddEffect("fUI_AlchemySplash01", false, 0, 0)
  local aniInfo = aniCtrl:addMoveAnimation(0 * timeRate, 1.5 * timeRate, UI_ANI_ADV.PAUI_ANIM_ADVANCE_LINEAR)
  aniInfo.StartHorizonType = UI_AH.PA_UI_HORIZON_LEFT
  aniInfo.EndHorizonType = UI_AH.PA_UI_HORIZON_LEFT
  aniInfo:SetStartPosition(posX, posY)
  aniInfo:SetEndPosition(posX, posY + 180)
  local aniInfo2 = aniCtrl:addRotateAnimation(0 * timeRate, 1.5 * timeRate, UI_ANI_ADV.PAUI_ANIM_ADVANCE_LINEAR)
  aniInfo2:SetStartRotate(0)
  aniInfo2:SetEndRotate(1)
  aniInfo2:SetRotateCount(1)
end

-- DECOMPILER ERROR at PC117: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_Alchemy.updateMaterialSlot = function(self)
  -- function num : 0_6
  local countSlotPushed = ToClient_AlchemyGetCountSlotWithMaterial()
  for slotIndex = 1, self._maxMaterialCount do
    if slotIndex <= countSlotPushed then
      local itemStaticWrapper = ToClient_AlchemyGetItemStaticAtMaterialSlot(slotIndex - 1)
      if itemStaticWrapper ~= nil then
        local itemCount = ToClient_AlchemyGetCountItemAtMaterialSlot_s64(slotIndex - 1)
        ;
        (((self._ui)._staticMaterialSlots)[slotIndex]):setItemByStaticStatus(itemStaticWrapper, itemCount)
        ;
        ((((self._ui)._staticMaterialSlots)[slotIndex]).icon):SetShow(true)
      else
        do
          do
            do
              ;
              ((((self._ui)._staticMaterialSlots)[slotIndex]).icon):SetShow(false)
              ;
              ((((self._ui)._staticMaterialSlots)[slotIndex]).icon):SetShow(false)
              -- DECOMPILER ERROR at PC46: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC46: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC46: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC46: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC46: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC46: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC120: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_Alchemy.updateKnowledgeList = function(self)
  -- function num : 0_7
  local ui = self._ui
  self:clearKnowledgeList()
  ToClient_AlchemySetKnowledgeFilter((ui._checkButtonLearntOnly):IsCheck(), self._filterText)
  local countFilteredKnowledge = ToClient_AlchemyGetCountFilteredKnowledge()
  for i = 1, countFilteredKnowledge do
    ((ui._listKnowledge):getElementManager()):pushKey(ToClient_AlchemyGetFilteredKnowledgeIndex(i - 1))
  end
  if self._filterText == nil then
    do
      do
        local isSearchEnabled = Int64toInt32(((ui._listKnowledge):getElementManager()):getSize()) ~= 0
        ;
        (ui._staticTextSearchFailed):SetShow(isSearchEnabled == true)
        ;
        (ui._staticTextEmptyKnowledge):SetShow(isSearchEnabled == false)
        ;
        (ui._staticTextSearchFailed):SetShow(false)
        ;
        (ui._staticTextEmptyKnowledge):SetShow(false)
        -- DECOMPILER ERROR: 5 unprocessed JMP targets
      end
    end
  end
end

-- DECOMPILER ERROR at PC123: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_Alchemy.clearKnowledgeList = function(self)
  -- function num : 0_8
  self._selectedKnowledge = -1
  ;
  (((self._ui)._listKnowledge):getElementManager()):clearKey()
  if self._isCook then
    self:setAlchemyDescriptionText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_WANTMORE_SELECT_COOKKNOWLEDGE"))
  else
    self:setAlchemyDescriptionText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_WANTMORE_SELECT_ALCHEMYKNOWLEDGE"))
  end
end

-- DECOMPILER ERROR at PC127: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_Alchemy.setAlchemyDescriptionText = function(self, text)
  -- function num : 0_9 , upvalues : UI_TM
  local ui = self._ui
  ;
  (ui._staticTextAlchemyDesc):SetText(text)
  ;
  (ui._staticTextAlchemyDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (ui._frameContentAlchemyDesc):SetSize((ui._frameContentAlchemyDesc):GetSizeX(), (ui._staticTextAlchemyDesc):GetSizeY())
  ;
  (ui._scrollAlchemyDesc):SetControlPos(0)
  ;
  (ui._frameAlchemyDesc):UpdateContentScroll()
  ;
  (ui._frameAlchemyDesc):UpdateContentPos()
end

-- DECOMPILER ERROR at PC130: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_Alchemy.pushItemFromInventory = function(self, invenSlotIndex, itemCount)
  -- function num : 0_10
  do
    local countSlotPushed = ToClient_AlchemyGetCountSlotWithMaterial()
    _PA_ASSERT(countSlotPushed <= self._maxMaterialCount, "실제 사용 중인 슬롯 개수�\128 허용�\156 개수보다 많습니다.")
    if countSlotPushed == self._maxMaterialCount and ToClient_AlchemyIsInvenSlotPushedInMaterialSlot(invenSlotIndex) == false then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_CANT_ADD_ITEM"))
      return 
    end
    self:playPushItemAnimation(invenSlotIndex, itemCount)
    ToClient_AlchemyPushItemFromInventory(invenSlotIndex, itemCount)
    self:updateMaterialSlot()
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC133: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_Alchemy.clearMaterialSlot = function(self)
  -- function num : 0_11
  ToClient_AlchemyClearMaterialSlot()
  self:updateMaterialSlot()
end

-- DECOMPILER ERROR at PC136: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_Alchemy.showInventoryNumpad = function(self, slotIndex, itemCount)
  -- function num : 0_12
  if checkAlchemyAction() == true then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_NOT_CHANGE"))
    return 
  end
  local funcConfirmClicked = function(count, slotIdx)
    -- function num : 0_12_0 , upvalues : self
    self:pushItemFromInventory(slotIdx, count)
  end

  Panel_NumberPad_Show(true, itemCount, slotIndex, funcConfirmClicked)
end

-- DECOMPILER ERROR at PC139: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_Alchemy.selectKnowledge = function(self, knowledgeIndex)
  -- function num : 0_13
  local ui = self._ui
  local mentalCardStaticWrapper = ToClient_AlchemyGetKnowledge(knowledgeIndex)
  if mentalCardStaticWrapper ~= nil then
    PaGlobal_RecentCook:closePanel()
    local isLearn = ToClient_AlchemyIsLearntMentalCard(mentalCardStaticWrapper:getKey())
    if isLearn == true then
      Panel_Alchemy:SetPosX(getScreenSizeX() - (Panel_Alchemy:GetSizeX() + 430 + 310))
      PaGlobal_RecentCook:showPanel(knowledgeIndex, self._isCook, Panel_Alchemy:GetPosX() + Panel_Alchemy:GetSizeX() - 25, Panel_Alchemy:GetPosY() + 25)
      ;
      (ui._staticAlchemyIcon):ChangeTextureInfoName(mentalCardStaticWrapper:getImagePath())
      self:setAlchemyDescriptionText(mentalCardStaticWrapper:getDesc())
    else
      ;
      (ui._staticAlchemyIcon):ChangeTextureInfoName("UI_Artwork/Unkown_Intelligence.dds")
      self:setAlchemyDescriptionText(PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_THISKNOWLEDGE_NOT_YET"))
    end
  end
  do
    local prevKnowledge = self._selectedKnowledge
    self._selectedKnowledge = knowledgeIndex
    ;
    (ui._listKnowledge):requestUpdateByKey(toInt64(0, prevKnowledge))
    ;
    (ui._listKnowledge):requestUpdateByKey(toInt64(0, knowledgeIndex))
  end
end

-- DECOMPILER ERROR at PC142: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_Alchemy.startAlchemy = function(self, countProduction)
  -- function num : 0_14
  if ToClient_AlchemyGetCountSlotWithMaterial() <= 0 then
    return 
  end
  if (Defines.s64_const).s64_1 < countProduction and ToClient_AlchemySetupMaterialsForMassProduction(countProduction) == false then
    _PA_ASSERT(false, "setupMaterialsForMassProduction�\180 실패했습니다. countProduction�\180 ToClient_AlchemyGetMaxMassProductionCount()보다 �\176 것은 아닌�\128 확인해보시기 바랍니다.")
  end
  ToClient_AlchemyStart(self._isCook, countProduction)
  local progressBarTimeSec = ToClient_AlchemyGetAlchemyTime(self._isCook) / 1000
  if progressBarTimeSec == 0 then
    return 
  end
  EventProgressBarShow(true, progressBarTimeSec, self._isCook == true and 7 or 9)
  audioPostEvent_SystemUi(1, 0)
  self:closePanel()
end

-- DECOMPILER ERROR at PC145: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_Alchemy.cancelAlchemy = function(self)
  -- function num : 0_15
  ToClient_AlchemyCancel()
end

-- DECOMPILER ERROR at PC148: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_Alchemy.popMaterial = function(self, slotIndex)
  -- function num : 0_16
  ToClient_AlchemyPopMaterial(slotIndex - 1)
  self:updateMaterialSlot()
  Panel_Tooltip_Item_hideTooltip()
end

-- DECOMPILER ERROR at PC151: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_Alchemy.showMassProductionMessageBox = function(self)
  -- function num : 0_17
  local msgBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE")
  local msgBoxContentStrID = self._isCook and "LUA_ALCHEMY_MSGBOX_COOK_SEQUENCE_MSG" or "LUA_ALCHEMY_MSGBOX_ALCHEMY_SEQUENCE_MSG"
  local funcYesButtonClicked = function()
    -- function num : 0_17_0
    PaGlobal_Alchemy:askMassProductionQuantity()
  end

  local msgBoxData = {title = msgBoxTitle, content = PAGetString(Defines.StringSheet_GAME, msgBoxContentStrID), functionYes = funcYesButtonClicked, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(msgBoxData, "middle")
end

-- DECOMPILER ERROR at PC154: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_Alchemy.askMassProductionQuantity = function(self)
  -- function num : 0_18
  local countSlotPushed = ToClient_AlchemyGetCountSlotWithMaterial()
  if countSlotPushed <= 0 then
    return 
  end
  local maxCount = ToClient_AlchemyGetMaxMassProductionCount()
  if (Defines.s64_const).s64_1 <= maxCount then
    local funcConfirmClicked = function(inputNumber)
    -- function num : 0_18_0 , upvalues : self
    self:startAlchemy(inputNumber)
  end

    Panel_NumberPad_Show(true, maxCount, nil, funcConfirmClicked)
  end
end

-- DECOMPILER ERROR at PC157: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_Alchemy.resumeMassProduction = function(self)
  -- function num : 0_19
  local countDoingAlchemy = ToClient_AlchemyGetDoingAlchemyCount()
  self:startAlchemy(countDoingAlchemy)
end

-- DECOMPILER ERROR at PC160: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_Alchemy.clearEditBoxSearchText = function(self)
  -- function num : 0_20
  ((PaGlobal_Alchemy._ui)._editBoxSearch):SetEditText("", false)
end

-- DECOMPILER ERROR at PC163: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_Alchemy.clearFocusEdit = function(self)
  -- function num : 0_21
  if GetFocusEdit() == nil or (GetFocusEdit()):GetKey() ~= ((PaGlobal_Alchemy._ui)._editBoxSearch):GetKey() then
    return 
  end
  ClearFocusEdit()
end

-- DECOMPILER ERROR at PC166: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_Alchemy.handleMouseOn_ShowMaterialTooltip = function(self, slotIndex)
  -- function num : 0_22
  local itemStatic = ToClient_AlchemyGetItemStaticAtMaterialSlot(slotIndex - 1)
  if itemStatic == nil then
    return 
  end
  local uiBase = (((self._ui)._staticMaterialSlots)[slotIndex]).icon
  Panel_Tooltip_Item_Show(itemStatic, uiBase, true, false)
end

-- DECOMPILER ERROR at PC169: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_Alchemy.handleMouseOut_HideMaterialTooltip = function(self)
  -- function num : 0_23
  Panel_Tooltip_Item_hideTooltip()
end

-- DECOMPILER ERROR at PC172: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_Alchemy.handleMouseLUp_SearchButton = function(self)
  -- function num : 0_24
  self:clearFocusEdit()
  local filterText = ((self._ui)._editBoxSearch):GetEditText()
  if filterText == self._filterText then
    return 
  end
  self._filterText = filterText
  if self._filterText ~= nil and (string.len)(self._filterText) == 0 then
    self._filterText = nil
  end
  ToClient_AlchemySetKnowledgeFilter(true, self._filterText)
  self:updateKnowledgeList()
end

-- DECOMPILER ERROR at PC175: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_Alchemy.handleMouseLUp_CheckButtonLearntOnly = function(self)
  -- function num : 0_25
  self:updateKnowledgeList()
end

-- DECOMPILER ERROR at PC178: Confused about usage of register: R7 in 'UnsetPending'

PaGlobal_Alchemy.handleMouseRUp_MaterialSlotIcon = function(self, slotIndex)
  -- function num : 0_26
  self:popMaterial(slotIndex)
end

FGlobal_Alchemy_Close = function()
  -- function num : 0_27
  PaGlobal_Alchemy:closePanel()
end

FGlobal_Alchemy_DoAlchemy = function()
  -- function num : 0_28
  if checkAlchemyAction() == false then
    return 
  end
  ToClient_AlchemyDo()
end

FGlobal_Alchemy_CheckEditBox = function(targetUI)
  -- function num : 0_29
  do return targetUI ~= nil and targetUI:GetKey() == ((PaGlobal_Alchemy._ui)._editBoxSearch):GetKey() end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

FGlobal_Alchemy_ClearEditFocus = function()
  -- function num : 0_30
  PaGlobal_Alchemy:clearFocusEdit()
  PaGlobal_Alchemy:clearEditBoxSearchText()
end

FromClient_ShowAlchemyPanel_PaGlobal_Alchemy = function(isCook, installationType)
  -- function num : 0_31
  PaGlobal_Alchemy:showPanel(isCook, installationType)
end

FromClient_luaLoadComplete_PaGlobal_Alchemy = function()
  -- function num : 0_32
  PaGlobal_Alchemy:initialize()
end

FromClient_AlchemyFail_PaGlobal_Alchemy = function(isSuccess, hint, alchemyType, strErr, bDoingMassProduction)
  -- function num : 0_33
  do
    local isCook = alchemyType == 1
    if isSuccess == true then
      Proc_ShowMessage_Ack(strErr)
    elseif hint == 1 or hint == 2 or hint == 3 then
      local msg = {main = PAGetString(Defines.StringSheet_GAME, "ALCHEMYFAIL_REASON_" .. hint), sub = ""}
      local msgType = isCook and 27 or 26
      Proc_ShowMessage_Ack_For_RewardSelect(msg, 2.5, msgType)
      if bDoingMassProduction == true then
        local failMsg = ""
        if isCook then
          failMsg = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_COOKING")
        else
          failMsg = PAGetString(Defines.StringSheet_GAME, "LUA_ALCHEMY_ALCHEMY")
        end
        local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ALCHEMY_MSGBOX_FAIL_MEMO", "failMsg", failMsg)
        local funcYesButtonClicked = function()
    -- function num : 0_33_0
    PaGlobal_Alchemy:resumeMassProduction()
  end

        local funcNoButtonClicked = function()
    -- function num : 0_33_1
    PaGlobal_Alchemy:cancelAlchemy()
  end

        local messageBoxData = {title = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ALCHEMY_MSGBOX_FAIL_TITLE", "failMsg", failMsg), content = messageBoxMemo, functionYes = funcYesButtonClicked, functionNo = funcNoButtonClicked, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
        ;
        (MessageBox.showMessageBox)(messageBoxData)
      end
    else
      Proc_ShowMessage_Ack(strErr)
      PaGlobal_Alchemy:cancelAlchemy()
    end
    -- DECOMPILER ERROR: 9 unprocessed JMP targets
  end
end

ShowEvent_PaGlobal_Alchemy_ShowAni = function()
  -- function num : 0_34
  (UIAni.showAniScaleElastic)(Panel_Alchemy, {})
end

ShowEvent_PaGlobal_Alchemy_CloseAni = function()
  -- function num : 0_35
  (UIAni.closeAni)(Panel_Alchemy)
end

Panel_Alchemy:RegisterShowEventFunc(true, "ShowEvent_PaGlobal_Alchemy_ShowAni()")
Panel_Alchemy:RegisterShowEventFunc(false, "ShowEvent_PaGlobal_Alchemy_CloseAni()")
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_PaGlobal_Alchemy")
registerEvent("ResponseShowAlchemy", "FromClient_ShowAlchemyPanel_PaGlobal_Alchemy")
registerEvent("FromClient_AlchemyFailAck", "FromClient_AlchemyFail_PaGlobal_Alchemy")

