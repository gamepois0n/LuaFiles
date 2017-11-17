-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\characterinfo\ui_characterinfo_title_control.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
local self = PaGlobal_CharacterInfoTitle
FromClient_UI_CharacterInfo_Title_Update = function()
  -- function num : 0_0 , upvalues : self
  if Panel_Window_CharInfo_Status:IsShow() == false then
    return 
  end
  self:update()
end

FromClient_UI_CharacterInfo_Title_CreateList = function(content, key)
  -- function num : 0_1 , upvalues : self
  local titleIndex = Int64toInt32(key)
  local titleWrapper = ToClient_GetTitleStaticStatusWrapper(titleIndex)
  if titleWrapper == nil then
    return 
  end
  local titleBG = (UI.getChildControl)(content, "List2_Static_TitleList_TitleBG")
  titleBG:setNotImpactScrollEvent(true)
  local titleName = (UI.getChildControl)(content, "List2_StaticText_TitleList_Title")
  local titleSet = (UI.getChildControl)(content, "List2_Button_SetTitle")
  if titleWrapper:isAcquired() == true then
    titleName:SetText(titleWrapper:getName())
    titleSet:addInputEvent("Mouse_LUp", "PaGlobal_CharacterInfoTitle:handleClicked_Title(" .. self._currentCategoryIdx .. ", " .. titleIndex .. ")")
    if ToClient_IsAppliedTitle(titleWrapper:getKey()) then
      titleSet:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TITLE_RELEASE"))
    else
      titleSet:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TITLE_APPLICATION"))
    end
    titleSet:SetShow(true)
  else
    titleName:SetText("<PAColor0xFF444444>" .. titleWrapper:getName() .. "<PAOldColor>")
    titleSet:SetShow(false)
  end
  titleBG:addInputEvent("Mouse_LUp", "PaGlobal_CharacterInfoTitle:handleClicked_Description(" .. self._currentCategoryIdx .. "," .. titleIndex .. ")")
end

-- DECOMPILER ERROR at PC11: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_CharacterInfoTitle.handleClicked_SearchButton = function(self)
  -- function num : 0_2
  self._filterText = ((self._ui)._editSearch):GetEditText()
  ClearFocusEdit()
  self:updateList()
end

-- DECOMPILER ERROR at PC15: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_CharacterInfoTitle.handleClicked_SearchText = function(self)
  -- function num : 0_3 , upvalues : IM
  self:clearSearchText()
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  SetFocusEdit((self._ui)._editSearch)
end

-- DECOMPILER ERROR at PC18: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_CharacterInfoTitle.handleClicked_Category = function(self, categoryIdx)
  -- function num : 0_4
  for key,index in pairs(self._category) do
    (((self._ui)._radioButtonCategory)[index]):SetCheck(false)
    ;
    (((self._ui)._radioButtonSubCategory)[index]):SetCheck(false)
    ;
    (((self._ui)._radioButtonSubCategory)[index]):SetFontColor(4291083966)
  end
  ToClient_SetCurrentTitleCategory(categoryIdx)
  self._currentCategoryCount = ToClient_GetCategoryTitleCount(categoryIdx)
  self._currentCategoryIdx = categoryIdx
  ;
  (((self._ui)._radioButtonCategory)[categoryIdx]):SetCheck(true)
  ;
  (((self._ui)._radioButtonSubCategory)[categoryIdx]):SetCheck(true)
  local color = {[(self._category)._world] = 4294959762, [(self._category)._battle] = 4294940310, [(self._category)._life] = 4292935574, [(self._category)._fish] = 4288076287}
  ;
  (((self._ui)._radioButtonSubCategory)[categoryIdx]):SetFontColor(color[categoryIdx])
  self:clearSearchText()
  self:updateList()
end

-- DECOMPILER ERROR at PC21: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_CharacterInfoTitle.handleClicked_ComboBox = function(self)
  -- function num : 0_5
  ((self._ui)._comboBoxSort):ToggleListbox()
end

-- DECOMPILER ERROR at PC24: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_CharacterInfoTitle.handleClicked_ComboBoxText = function(self)
  -- function num : 0_6
  ((self._ui)._comboBoxSort):SetSelectItemIndex(((self._ui)._comboBoxSort):GetSelectIndex())
  ;
  ((self._ui)._comboBoxSort):ToggleListbox()
  self:clearSearchText()
  self:updateList()
end

-- DECOMPILER ERROR at PC27: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_CharacterInfoTitle.handleClicked_Description = function(self, categoryIdx, titleIdx)
  -- function num : 0_7
  ToClient_SetCurrentTitleCategory(categoryIdx)
  local titleWrapper = ToClient_GetTitleStaticStatusWrapper(titleIdx)
  ;
  ((self._ui)._staticText_PartDesc):SetText(titleWrapper:getDescription())
end

-- DECOMPILER ERROR at PC30: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_CharacterInfoTitle.handleClicked_Title = function(self, categoryIdx, titleIdx)
  -- function num : 0_8
  self:handleClicked_Description(categoryIdx, titleIdx)
  ToClient_TitleSetRequest(categoryIdx, titleIdx)
end

-- DECOMPILER ERROR at PC33: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_CharacterInfoTitle.handleMouseOver_Category = function(self, isShow, tipType)
  -- function num : 0_9
  if isShow == false then
    TooltipSimple_Hide()
    return 
  end
  local string = {[(self._category)._world] = "UI_WINDOW_CHARACTERINFO_TITLE_TOOLTIP_ALLROUND", [(self._category)._battle] = "UI_WINDOW_CHARACTERINFO_TITLE_TOOLTIP_COMBAT", [(self._category)._life] = "UI_WINDOW_CHARACTERINFO_TITLE_TOOLTIP_LIFE", [(self._category)._fish] = "UI_WINDOW_CHARACTERINFO_TITLE_TOOLTIP_FISH"}
  local uiControl, name, desc = nil, nil, nil
  uiControl = ((self._ui)._radioButtonCategory)[tipType]
  name = PAGetString(Defines.StringSheet_RESOURCE, string[tipType])
  registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
  TooltipSimple_Show(uiControl, name, desc)
end

-- DECOMPILER ERROR at PC36: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_CharacterInfoTitle.showWindow = function(self)
  -- function num : 0_10
  self:handleClicked_Category((self._category)._world)
  ;
  ((self._ui)._comboBoxSort):SetSelectItemIndex((self._comboBoxList)._all)
  self:clearSearchText()
  self:update()
end

-- DECOMPILER ERROR at PC39: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_CharacterInfoTitle.updateList = function(self)
  -- function num : 0_11
  ToClient_MakeTitleList(self._filterText, ((self._ui)._comboBoxSort):GetSelectIndex())
  local listCount = ToClient_GetFilteredTitleCount()
  ;
  (((self._ui)._list2Title):getElementManager()):clearKey()
  for index = 0, listCount - 1 do
    local titleIdx = ToClient_GetTitleIndexFromFilteredList(index)
    ;
    (((self._ui)._list2Title):getElementManager()):pushKey(toInt64(0, titleIdx))
  end
  if listCount == 0 then
    ((self._ui)._staticText_Nothing):SetShow(true)
  else
    ;
    ((self._ui)._staticText_Nothing):SetShow(false)
  end
end

-- DECOMPILER ERROR at PC42: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_CharacterInfoTitle.clearSearchText = function(self)
  -- function num : 0_12
  ((self._ui)._editSearch):SetEditText("", false)
  self._filterText = ""
  ClearFocusEdit()
end


