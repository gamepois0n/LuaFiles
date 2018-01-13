-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\option\panel_option_main.luac 

-- params : ...
-- function num : 0
Panel_Window_cOption:SetShow(false)
-- DECOMPILER ERROR at PC6: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.isOpen = function(self)
  -- function num : 0_0
  return Panel_Window_cOption:GetShow()
end

-- DECOMPILER ERROR at PC9: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.InitUi = function(self)
  -- function num : 0_1
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui)._staticMainTopBg = (UI.getChildControl)(Panel_Window_cOption, "Static_MainTopBg")
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticMainBottomBg = (UI.getChildControl)(Panel_Window_cOption, "Static_MainBottomBg")
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticMainBg = (UI.getChildControl)(Panel_Window_cOption, "Static_MainBg")
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticSubTopBg = (UI.getChildControl)(Panel_Window_cOption, "Static_SubTopBg")
  -- DECOMPILER ERROR at PC34: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticSubBottomBg = (UI.getChildControl)(Panel_Window_cOption, "Static_SubBottomBg")
  -- DECOMPILER ERROR at PC42: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticSpecBG = (UI.getChildControl)((self._ui)._staticMainBg, "Static_SpecBg")
  -- DECOMPILER ERROR at PC50: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._staticCategoryBG = (UI.getChildControl)((self._ui)._staticMainBg, "Static_CategoryBg")
  -- DECOMPILER ERROR at PC58: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._radiobuttonCategory = (UI.getChildControl)((self._ui)._staticMainBg, "RadioButton_Spec")
  -- DECOMPILER ERROR at PC66: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._radiobuttonSpec = (UI.getChildControl)((self._ui)._staticMainBg, "RadioButton_Category")
  -- DECOMPILER ERROR at PC73: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._list2 = (UI.getChildControl)(Panel_Window_cOption, "List2_LeftMenu")
  ;
  ((self._ui)._radiobuttonCategory):addInputEvent("Mouse_LUp", "PaGlobal_Option:MoveUi(1)")
  ;
  ((self._ui)._radiobuttonSpec):addInputEvent("Mouse_LUp", "PaGlobal_Option:MoveUi(2)")
  -- DECOMPILER ERROR at PC93: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._applyButton = (UI.getChildControl)((self._ui)._staticSubBottomBg, "Button_Apply")
  ;
  ((self._ui)._applyButton):addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedApplyOption()")
  ;
  ((UI.getChildControl)(Panel_Window_cOption, "Button_Win_Close")):addInputEvent("Mouse_LUp", "PaGlobal_Option:Close()")
  ;
  ((UI.getChildControl)((self._ui)._staticMainTopBg, "Button_SaveSetting")):addInputEvent("Mouse_LUp", "PaGlobal_Panel_SaveSetting_Show()")
  ;
  ((UI.getChildControl)((self._ui)._staticMainTopBg, "Button_ResetAll")):addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedResetAllOption()")
  ;
  ((UI.getChildControl)((self._ui)._staticSubBottomBg, "Button_SaveSetting")):addInputEvent("Mouse_LUp", "PaGlobal_Panel_SaveSetting_Show()")
  ;
  ((UI.getChildControl)((self._ui)._staticSubBottomBg, "Button_ResetAll")):addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedResetAllOption()")
  ;
  ((UI.getChildControl)((self._ui)._staticSubBottomBg, "Button_Admin")):addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedConfirmOption()")
  ;
  ((UI.getChildControl)((self._ui)._staticSubBottomBg, "Button_Cancel")):addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedCancelOption()")
  ;
  ((UI.getChildControl)((self._ui)._staticSpecBG, "Button_LowNormal")):addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedSpecSetting(1)")
  ;
  ((UI.getChildControl)((self._ui)._staticSpecBG, "Button_MidNormal")):addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedSpecSetting(2)")
  ;
  ((UI.getChildControl)((self._ui)._staticSpecBG, "Button_HighNormal")):addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedSpecSetting(3)")
  ;
  ((UI.getChildControl)((self._ui)._staticSpecBG, "Button_HighestNormal")):addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedSpecSetting(4)")
  ;
  ((UI.getChildControl)((self._ui)._staticSpecBG, "Button_LowSiege")):addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedSpecSetting(5)")
  ;
  ((UI.getChildControl)((self._ui)._staticSpecBG, "Button_MidSiege")):addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedSpecSetting(6)")
  ;
  ((UI.getChildControl)((self._ui)._staticSpecBG, "Button_HighSiege")):addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedSpecSetting(7)")
  ;
  ((UI.getChildControl)((self._ui)._staticSpecBG, "Button_HighestSiege")):addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedSpecSetting(8)")
  ;
  ((UI.getChildControl)((self._ui)._staticCategoryBG, "Button_Optimize")):addInputEvent("Mouse_LUp", "PaGlobal_Option:GoCategory( " .. "\"" .. "Performance" .. "\"" .. ")")
  ;
  ((UI.getChildControl)((self._ui)._staticCategoryBG, "Button_Graphic")):addInputEvent("Mouse_LUp", "PaGlobal_Option:GoCategory( " .. "\"" .. "Graphic" .. "\"" .. ")")
  ;
  ((UI.getChildControl)((self._ui)._staticCategoryBG, "Button_Sound")):addInputEvent("Mouse_LUp", "PaGlobal_Option:GoCategory( " .. "\"" .. "Sound" .. "\"" .. ")")
  ;
  ((UI.getChildControl)((self._ui)._staticCategoryBG, "Button_Function")):addInputEvent("Mouse_LUp", "PaGlobal_Option:GoCategory( " .. "\"" .. "Function" .. "\"" .. ")")
  ;
  ((UI.getChildControl)((self._ui)._staticCategoryBG, "Button_Interface")):addInputEvent("Mouse_LUp", "PaGlobal_Option:GoCategory( " .. "\"" .. "Interface" .. "\"" .. ")")
  -- DECOMPILER ERROR at PC331: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui)._editSearch = (UI.getChildControl)((self._ui)._staticMainTopBg, "Edit_ItemName")
  ;
  ((UI.getChildControl)((self._ui)._staticMainTopBg, "Button_SearchIcon")):addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedSeachOption()")
  ;
  ((self._ui)._listSearchBg):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "FGlobal_Option_List2SearchElementCreate")
  ;
  ((self._ui)._listSearchBg):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  self:MoveUi((self.UIMODE).Main)
end

-- DECOMPILER ERROR at PC12: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.MoveUi = function(self, value)
  -- function num : 0_2
  if (self.UIMODE).Category == value then
    ((self._ui)._staticCategoryBG):SetShow(false)
    ;
    ((self._ui)._staticSpecBG):SetShow(false)
    ;
    ((self._ui)._list2):SetShow(true)
    ;
    ((self._ui)._staticSubBottomBg):SetShow(true)
    ;
    ((self._ui)._staticMainBottomBg):SetShow(false)
    ;
    ((self._ui)._radiobuttonCategory):SetShow(true)
    ;
    ((self._ui)._radiobuttonSpec):SetShow(false)
    ;
    ((self._ui)._listSearchBg):SetShow(false)
    if (self._list2)._curCategory ~= nil and (self._list2)._curFrame ~= nil then
      ((((self._frames)[(self._list2)._curCategory])[(self._list2)._curFrame])._uiFrame):SetShow(true)
    end
  else
    if (self.UIMODE).Main == value then
      ((self._ui)._staticMainBg):SetShow(true)
      ;
      ((self._ui)._staticCategoryBG):SetShow(true)
      ;
      ((self._ui)._staticSpecBG):SetShow(false)
      ;
      ((self._ui)._list2):SetShow(false)
      ;
      ((self._ui)._staticSubBottomBg):SetShow(false)
      ;
      ((self._ui)._staticMainBottomBg):SetShow(true)
      ;
      ((self._ui)._radiobuttonCategory):SetShow(true)
      ;
      ((self._ui)._radiobuttonSpec):SetShow(true)
      ;
      ((self._ui)._listSearchBg):SetShow(false)
      if (self._list2)._curCategory ~= nil and (self._list2)._curFrame ~= nil then
        ((((self._frames)[(self._list2)._curCategory])[(self._list2)._curFrame])._uiFrame):SetShow(false)
      end
    else
      if (self.UIMODE).Spec == value then
        ((self._ui)._staticMainBg):SetShow(true)
        ;
        ((self._ui)._staticCategoryBG):SetShow(false)
        ;
        ((self._ui)._staticSpecBG):SetShow(true)
        ;
        ((self._ui)._list2):SetShow(false)
        ;
        ((self._ui)._staticSubBottomBg):SetShow(false)
        ;
        ((self._ui)._staticMainBottomBg):SetShow(true)
        ;
        ((self._ui)._radiobuttonCategory):SetShow(true)
        ;
        ((self._ui)._radiobuttonSpec):SetShow(true)
        ;
        ((self._ui)._listSearchBg):SetShow(false)
        if (self._list2)._curCategory ~= nil and (self._list2)._curFrame ~= nil then
          ((((self._frames)[(self._list2)._curCategory])[(self._list2)._curFrame])._uiFrame):SetShow(false)
        end
      else
        if (self.UIMODE).Search == value then
          ((self._ui)._staticCategoryBG):SetShow(false)
          ;
          ((self._ui)._staticSpecBG):SetShow(false)
          ;
          ((self._ui)._list2):SetShow(true)
          ;
          ((self._ui)._staticSubBottomBg):SetShow(true)
          ;
          ((self._ui)._staticMainBottomBg):SetShow(false)
          ;
          ((self._ui)._radiobuttonCategory):SetShow(false)
          ;
          ((self._ui)._radiobuttonSpec):SetShow(true)
          ;
          ((self._ui)._listSearchBg):SetShow(true)
          if (self._list2)._curCategory ~= nil and (self._list2)._curFrame ~= nil then
            ((((self._frames)[(self._list2)._curCategory])[(self._list2)._curFrame])._uiFrame):SetShow(false)
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ApplyButtonEnable = function(self, enable)
  -- function num : 0_3
  ((self._ui)._applyButton):SetEnable(enable)
end

-- DECOMPILER ERROR at PC18: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.Open = function(self)
  -- function num : 0_4
  local tree2 = (self._ui)._list2
  for key,value in pairs((self._list2)._tree2IndexMap) do
    if value._isMain then
      local keyElement = (tree2:getElementManager()):getByKey(toInt64(0, key), false)
      keyElement:setIsOpen(false)
    end
  end
  ;
  (tree2:getElementManager()):refillKeyList()
  tree2:moveTopIndex()
  self:ApplyButtonEnable(false)
  Panel_Window_cOption:SetShow(true)
end

-- DECOMPILER ERROR at PC21: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.Close = function(self)
  -- function num : 0_5
  self:MoveUi((self.UIMODE).Main)
  for _,option in pairs(self._elements) do
    option._curValue = nil
    option._applyValue = nil
  end
  Panel_Window_cOption:SetShow(false)
end

-- DECOMPILER ERROR at PC24: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ClickedCancelOption = function(self)
  -- function num : 0_6
  for elementName,option in pairs(self._elements) do
    local check = false
    if option._curValue ~= nil and option._settingRightNow == true then
      check = true
    end
    if option._applyValue ~= nil then
      check = true
    end
    if check == true then
      self:SetXXX(elementName, option._initValue)
    end
  end
  self:MoveUi((self.UIMODE).Main)
  audioPostEvent_SystemUi(1, 0)
  setAudioOptionByConfig()
  keyCustom_RollBack()
  self:CompleteKeyCustomMode()
  self:ApplyButtonEnable(false)
end

-- DECOMPILER ERROR at PC27: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ClickedApplyOption = function(self)
  -- function num : 0_7
  local displayChange = false
  for elementName,option in pairs(self._elements) do
    if option._curValue ~= nil then
      self:SetXXX(elementName, option._curValue)
      if option._isChangeDisplay == true then
        displayChange = true
      end
    end
  end
  if displayChange == true then
    self:DisplayChanged()
    self:Close()
  end
  keyCustom_applyChange()
  keyCustom_StartEdit()
  saveGameOption(false)
  self:ApplyButtonEnable(false)
end

-- DECOMPILER ERROR at PC30: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ClickedConfirmOption = function(self)
  -- function num : 0_8
  if isNeedGameOptionFromServer() == true then
    FGlobal_QuestWindowRateSetting()
    Panel_UIControl_SetShow(false)
  end
  audioPostEvent_SystemUi(1, 0)
  self:ClickedApplyOption()
  self:Close()
end

-- DECOMPILER ERROR at PC33: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ClickedResetAllOption = function(self)
  -- function num : 0_9
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_GAMEOPTION_ALLRESETCONFIRMMESSAGE")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = FGlobal_Option_ResetAllOption, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

FGlobal_Option_ResetAllOption = function()
  -- function num : 0_10
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  PaGlobal_Option._resetCheck = true
  resetAllOption()
  keyCustom_SetDefaultAction()
  keyCustom_SetDefaultUI()
  PaGlobal_Option:ResetKeyCustomString()
end

-- DECOMPILER ERROR at PC38: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ClickedSpecSetting = function(self, value)
  -- function num : 0_11
  self:SetSpecSetting(value)
end

-- DECOMPILER ERROR at PC41: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ClickedSeachOption = function(self)
  -- function num : 0_12
  local edit = GetFocusEdit()
  local list = (self._ui)._listSearchBg
  local findString = nil
  if edit == nil then
    findString = ((self._ui)._editSearch):GetEditText()
  else
    findString = edit:GetEditText()
    edit:SetText(findString)
  end
  ;
  ((self._ui)._editSearch):SetEditText("")
  ClearFocusEdit()
  self._findStrings = self:SearchOption(findString)
  if self._findStrings == nil then
    (list:getElementManager()):clearKey()
    return 
  end
  local count = #self._findStrings
  if count == 0 then
    (list:getElementManager()):clearKey()
    return 
  end
  self:MoveUi((self.UIMODE).Search)
  ;
  (list:getElementManager()):clearKey()
  for index = 1, count do
    (list:getElementManager()):pushKey(toInt64(0, index))
    list:requestUpdateByKey(toInt64(0, index))
  end
end

FGlobal_Option_List2SearchElementCreate = function(list_content, key)
  -- function num : 0_13
  local id = Int64toInt32(key)
  local content = (UI.getChildControl)(list_content, "StaticText_SearchElement")
  local findString = (PaGlobal_Option._findStrings)[id]
  content:SetShow(true)
  content:SetText(findString._category .. " > " .. findString._detail .. " > " .. findString._elementString)
  content:addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedFindElement(" .. "\"" .. findString._category .. "\"" .. ", " .. "\"" .. findString._detail .. "\"" .. ")")
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ClickedFindElement = function(self, category, detail)
  -- function num : 0_14
  self:SelectOptionFrame(category, detail)
  self:MoveUi((self.UIMODE).Category)
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.DisplayChanged = function(self)
  -- function num : 0_15
  local messageboxData = {title = "changeDisplay", content = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_DISPLAYCOMMIT_COMMENT"), functionApply = FGlobal_Option_ChangeDisplayApply, functionCancel = FGlobal_Option_ChangeDisplayCancel, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW, isTimeCount = true, countTime = 10, timeString = PAGetString(Defines.StringSheet_GAME, "LUA_OPTION_DISPLAYCOMMIT_TIMELEFT"), isStartTimer = true, afterFunction = GameOption_ChangeDisplayTimeOut}
  allClearMessageData()
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

FGlobal_Option_ChangeDisplayApply = function()
  -- function num : 0_16
  if isNeedGameOptionFromServer() == true then
    FGlobal_QuestWindowRateSetting()
  end
  saveGameOption(true)
  reloadGameUI()
end

FGlobal_Option_ChangeDisplayCancel = function()
  -- function num : 0_17
  PaGlobal_Option:SetXXX("ScreenResolution", ((PaGlobal_Option._elements).ScreenResolution)._initValue)
  PaGlobal_Option:SetXXX("UIScale", ((PaGlobal_Option._elements).UIScale)._initValue)
  PaGlobal_Option:SetXXX("ScreenMode", ((PaGlobal_Option._elements).ScreenMode)._initValue)
end

-- DECOMPILER ERROR at PC56: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.SelectOptionFrame = function(self, category, detail)
  -- function num : 0_18
  local data = ((self._frames)[category])[detail]
  do
    if (self._list2)._curCategory ~= nil and (self._list2)._curFrame ~= nil then
      local beforedata = ((self._frames)[(self._list2)._curCategory])[(self._list2)._curFrame]
      ;
      (beforedata._uiFrame):SetShow(false)
    end
    ;
    (data._uiFrame):SetShow(true)
    ;
    (data._uiFrame):UpdateContentScroll()
    ;
    (data._uiScroll):SetControlTop()
    ;
    (data._uiFrame):UpdateContentPos()
    -- DECOMPILER ERROR at PC36: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (self._list2)._curCategory = category
    -- DECOMPILER ERROR at PC38: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (self._list2)._curFrame = detail
    ;
    ((self._ui)._listSearchBg):SetShow(false)
  end
end

-- DECOMPILER ERROR at PC59: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ListInit = function(self)
  -- function num : 0_19
  local tree2 = (self._ui)._list2
  tree2:changeAnimationSpeed(11)
  tree2:registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "FGlobal_Option_CategoryUpdate")
  tree2:createChildContent((CppEnums.PAUIList2ElementManagerType).tree)
  ;
  (tree2:getElementManager()):clearKey()
  local mainElement = (tree2:getElementManager()):getMainElement()
  local keyIndex = 1
  for category,details in pairs(self._frames) do
    -- DECOMPILER ERROR at PC36: Confused about usage of register: R9 in 'UnsetPending'

    ((self._list2)._tree2IndexMap)[keyIndex] = {_isMain = true, _index = i, _category = category}
    local treeElement = mainElement:createChild(toInt64(0, keyIndex))
    treeElement:setIsOpen(false)
    keyIndex = keyIndex + 1
    local count = 0
    for i,table in pairs((self._frames)[category]) do
      count = count + 1
    end
    if count > 1 then
      for i,table in pairs((self._frames)[category]) do
        -- DECOMPILER ERROR at PC73: Confused about usage of register: R16 in 'UnsetPending'

        ((self._list2)._tree2IndexMap)[keyIndex] = {_isMain = false, _index = i, _subIndex = j, _category = category, _detail = table._detail}
        local subTreeElement = treeElement:createChild(toInt64(0, keyIndex))
        keyIndex = keyIndex + 1
      end
    end
  end
end

-- DECOMPILER ERROR at PC62: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.GoCategory = function(self, clickCategory)
  -- function num : 0_20
  local _categoryKey = nil
  for key,table in pairs((self._list2)._tree2IndexMap) do
    if clickCategory == table._category then
      _categoryKey = key
      self:ClickedMainCategory(key, table._category)
      break
    end
  end
  do
    for key,table in pairs((self._list2)._tree2IndexMap) do
      if clickCategory == table._category and table._detail ~= nil then
        self:ClickedSubCategory(key, table._category, table._detail)
        break
      end
    end
    do
      self:MoveUi((self.UIMODE).Category)
    end
  end
end

-- DECOMPILER ERROR at PC65: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ClickedMainCategory = function(self, key, category)
  -- function num : 0_21
  local option = PaGlobal_Option
  local tree2 = (option._ui)._list2
  for k,value in pairs((option._list2)._tree2IndexMap) do
    if value._isMain then
      local keyElement = (tree2:getElementManager()):getByKey(toInt64(0, k), false)
      keyElement:setIsOpen(false)
    end
  end
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (option._list2)._selectedSubKey = nil
  ;
  (tree2:getElementManager()):toggle(toInt64(0, key))
  -- DECOMPILER ERROR at PC40: Confused about usage of register: R5 in 'UnsetPending'

  if (option._list2)._selectedKey ~= category then
    (option._list2)._selectedKey = category
  end
  if category == "Alert" then
    PaGlobal_Option:SelectOptionFrame("Alert", "Alarm")
  end
  ;
  (tree2:getElementManager()):refillKeyList()
  local heightIndex = tree2:getIndexByKey(toInt64(0, key))
  tree2:moveIndex(heightIndex)
end

-- DECOMPILER ERROR at PC68: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Option.ClickedSubCategory = function(self, key, category, detail)
  -- function num : 0_22
  PaGlobal_Option:SelectOptionFrame(category, detail)
end

FGlobal_Option_CategoryUpdate = function(contents, key)
  -- function num : 0_23
  local idx = Int64toInt32(key)
  local indexMap = ((PaGlobal_Option._list2)._tree2IndexMap)[idx]
  local categoryBar = (UI.getChildControl)(contents, "RadioButton_MenuName")
  local categoryFocus = (UI.getChildControl)(contents, "Static_Focus")
  local categorySubBar = (UI.getChildControl)(contents, "RadioButton_SubMenuName")
  local categorySubFocus = (UI.getChildControl)(categorySubBar, "Static_SubFocus")
  categoryBar:SetShow(true)
  categoryBar:setNotImpactScrollEvent(true)
  categoryFocus:SetShow(false)
  categorySubFocus:SetShow(false)
  categorySubBar:SetShow(false)
  if indexMap._isMain then
    categoryBar:SetText(indexMap._category)
    categoryBar:addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedMainCategory(" .. idx .. ", " .. " \"" .. indexMap._category .. "\"" .. ")")
  else
    categoryBar:SetShow(false)
    categorySubBar:SetShow(true)
    categorySubBar:SetText(indexMap._detail)
    categorySubBar:addInputEvent("Mouse_LUp", "PaGlobal_Option:ClickedSubCategory(" .. idx .. ", " .. "\"" .. indexMap._category .. "\"" .. ", " .. "\"" .. indexMap._detail .. "\"" .. ")")
  end
end


