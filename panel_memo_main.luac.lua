-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\memo\panel_memo_main.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
PaGlobal_Memo = {Add, Save, Remove, ListOpen, ListClose, StickyClose, StickyClicked, StickyToggleShow, StickyAlphaSlider, StickyResizeStartPos, StickyResize, StickyClearFocus; 
_id = {}
, 
_stickyMemoList = {}
, 
_ui = {_buttonAddMemo = (UI.getChildControl)(Panel_Memo_List, "Button_AddMemo"), _buttonAllRemove = (UI.getChildControl)(Panel_Memo_List, "Button_AllDelete"), _buttonClose = (UI.getChildControl)(Panel_Memo_List, "Button_Win_Close"), _list2 = (UI.getChildControl)(Panel_Memo_List, "List2_MemoList"), _noMemoAlert = (UI.getChildControl)(Panel_Memo_List, "StaticText_NoMemoAlert")}
, _currentFocusId = nil, _currentFocusContent = nil, 
_SaveMode_ = {TEXT = 0, SETTING = 1, ALL = 2}
}
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_Memo")
FromClient_luaLoadComplete_Memo = function()
  -- function num : 0_0
  PaGlobal_Memo:Initialize()
end

-- DECOMPILER ERROR at PC68: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Memo.Initialize = function(self)
  -- function num : 0_1
  Panel_Memo_List:SetShow(false)
  Panel_Memo_List:RegisterShowEventFunc(true, "Panel_Memo_List_ShowAni()")
  Panel_Memo_List:RegisterShowEventFunc(false, "Panel_Memo_List_HideAni()")
  self:RegistEventHandler()
  local result = self:DataInitialize()
  if result == false then
    return 
  end
end

-- DECOMPILER ERROR at PC71: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Memo.DataInitialize = function(self)
  -- function num : 0_2
  ToClient_initMemoList()
  local memoCount = ToClient_getMemoCount()
  if memoCount == 0 then
    return false
  end
  local elements = {}
  for index = 0, memoCount - 1 do
    elements[index] = ToClient_getMemoAt(index)
  end
  for index = 0, memoCount - 1 do
    local info = elements[index]
    local id = info:getId()
    local reverse_index = memoCount - 1 - index
    -- DECOMPILER ERROR at PC28: Confused about usage of register: R10 in 'UnsetPending'

    ;
    (self._id)[reverse_index] = id
  end
  local list = (self._ui)._list2
  for index = 0, memoCount - 1 do
    (list:getElementManager()):pushKey(toInt64(0, (self._id)[index]))
    list:requestUpdateByKey(toInt64(0, (self._id)[index]))
  end
  for index = 0, memoCount - 1 do
    local info = elements[index]
    if info:isOn() == true then
      self:createStickyMemoWrapper(info:getId())
    end
  end
end

-- DECOMPILER ERROR at PC74: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Memo.RegistEventHandler = function(self)
  -- function num : 0_3
  ((self._ui)._buttonAddMemo):addInputEvent("Mouse_LUp", "PaGlobal_Memo:Add()")
  ;
  ((self._ui)._buttonAllRemove):addInputEvent("Mouse_LUp", "PaGlobal_Memo:AllRemove()")
  ;
  ((self._ui)._buttonClose):addInputEvent("Mouse_LUp", "PaGlobal_Memo:ListClose()")
  ;
  ((self._ui)._list2):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "FGlobal_Memo_List2EventControlCreate")
  ;
  ((self._ui)._list2):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
end

-- DECOMPILER ERROR at PC77: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Memo.Add = function(self)
  -- function num : 0_4
  local info = ToClient_addMemo()
  if info == nil then
    return 
  end
  local newId = info:getId()
  self._currentFocusId = newId
  ;
  (((self._ui)._list2):getElementManager()):pushKey(toInt64(0, newId))
  self:createStickyMemoWrapper(newId)
  if Panel_Memo_List:GetShow() == true then
    self:StickySetDefaultPos(newId)
  end
  self:ListUpdate()
end

-- DECOMPILER ERROR at PC80: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Memo.Save = function(self, saveMode, inputId)
  -- function num : 0_5
  if inputId ~= nil then
    self._currentFocusId = inputId
  end
  local id = self._currentFocusId
  local _saveMode = self:ReCheckSaveMode(saveMode)
  if _saveMode == nil then
    return 
  end
  local info = self:getInfoByCurData(id)
  local result = ToClient_updateMemo(info, _saveMode)
  if result == false or _saveMode == (self._SaveMode_).SETTING then
    return 
  end
  self:ListUpdate()
  self:StickyClearFocus()
  self:ComputeFrameContentSizeY(id)
end

-- DECOMPILER ERROR at PC83: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Memo.Remove = function(self, id)
  -- function num : 0_6
  local result = ToClient_removeMemo(id)
  if result == false then
    return 
  end
  ;
  (((self._ui)._list2):getElementManager()):removeKey(id)
  if (self._stickyMemoList)[id] ~= nil then
    ((self._stickyMemoList)[id]):clear()
    -- DECOMPILER ERROR at PC22: Confused about usage of register: R3 in 'UnsetPending'

    ;
    (self._stickyMemoList)[id] = nil
  end
  TooltipSimple_Hide()
  self:ListUpdate()
  self:StickyClearFocus()
end

-- DECOMPILER ERROR at PC86: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Memo.AllRemove = function(self)
  -- function num : 0_7
  local memoCount = ToClient_getMemoCount()
  if memoCount == 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_MEMOLIST_NOMEMO"))
    return 
  end
  local applyFunc = function()
    -- function num : 0_7_0 , upvalues : self
    ToClient_removeAllMemo()
    for k in pairs(self._id) do
      local id = (self._id)[k]
      if (self._stickyMemoList)[id] ~= nil then
        ((self._stickyMemoList)[id]):clear()
        -- DECOMPILER ERROR at PC22: Confused about usage of register: R5 in 'UnsetPending'

        ;
        (self._stickyMemoList)[id] = nil
      end
      ;
      (((self._ui)._list2):getElementManager()):removeKey(id)
    end
    self:ListUpdate()
    self:StickyClearFocus()
  end

  local _title = PAGetString(Defines.StringSheet_GAME, "LUA_MEMOLIST_DELETETITLE")
  local _content = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MEMOLIST_DELETEDESC", "count", memoCount)
  local messageBoxData = {title = _title, content = _content, functionYes = applyFunc, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

-- DECOMPILER ERROR at PC89: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Memo.RemoveConfirmPopUp = function(self, id)
  -- function num : 0_8
  local applyFunc = function()
    -- function num : 0_8_0 , upvalues : self, id
    self:Remove(id)
  end

  local _title = PAGetString(Defines.StringSheet_GAME, "LUA_MEMOLIST_CURRENTDELETEDTITLE")
  local _content = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MEMOLIST_CURRENTDELETEDESC", "count", memoCount)
  local messageBoxData = {title = _title, content = _content, functionYes = applyFunc, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

-- DECOMPILER ERROR at PC92: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Memo.ReCheckSaveMode = function(self, saveMode)
  -- function num : 0_9
  if saveMode ~= (self._SaveMode_).SETTING then
    if self._currentFocusId == nil then
      return nil
    end
    if saveMode == (self._SaveMode_).ALL then
      return (self._SaveMode_).ALL
    end
    if self:IsChanged() == false then
      self:StickyClearFocus()
      return nil
    end
    return (self._SaveMode_).TEXT
  else
    return (self._SaveMode_).SETTING
  end
end

-- DECOMPILER ERROR at PC95: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Memo.ListUpdate = function(self)
  -- function num : 0_10
  if Panel_Memo_List:IsShow() == false then
    return 
  end
  local memoCount = ToClient_getMemoCount()
  if memoCount == 0 then
    ((self._ui)._noMemoAlert):SetShow(true)
    return false
  end
  ;
  ((self._ui)._noMemoAlert):SetShow(false)
  for k in pairs(self._id) do
    -- DECOMPILER ERROR at PC27: Confused about usage of register: R6 in 'UnsetPending'

    (self._id)[k] = nil
  end
  for index = 0, memoCount - 1 do
    local reverse_index = memoCount - 1 - index
    -- DECOMPILER ERROR at PC40: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self._id)[index] = ToClient_getMemoIdAt(reverse_index)
  end
  ;
  (((self._ui)._list2):getElementManager()):clearKey()
  for index = 0, memoCount - 1 do
    (((self._ui)._list2):getElementManager()):pushKey(toInt64(0, (self._id)[index]))
    ;
    ((self._ui)._list2):requestUpdateByKey(toInt64(0, (self._id)[index]))
  end
end

FGlobal_Memo_List2EventControlCreate = function(list_content, key)
  -- function num : 0_11 , upvalues : UI_TM
  local id = Int64toInt32(key)
  local info = ToClient_getMemo(id)
  local _content = info:getContent()
  local bg = (UI.getChildControl)(list_content, "List2_Static_MemoList_TitleBG")
  local content = (UI.getChildControl)(list_content, "List2_StaticText_MemoList_Content")
  local toggleButton = (UI.getChildControl)(list_content, "List2_CheckButton_MemoList_ToggleShow")
  local removeButton = (UI.getChildControl)(list_content, "List2_Button_MemoList_RemoveMemo")
  do
    local updatetime = (UI.getChildControl)(list_content, "List2_StaticText_MemoList_UpdateTime")
    content:SetShow(true)
    if _content == "" or _content == "Content" then
      _content = PAGetString(Defines.StringSheet_GAME, "LUA_MEMO_INSERTCONTENT")
    end
    content:SetText(_content)
    content:setLineCountByLimitAutoWrap(3)
    content:SetTextMode(UI_TM.eTextMode_Limit_AutoWrap)
    updatetime:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_MEMO_LASTUPDATE", "time", info:getUpdateTime()))
    toggleButton:SetCheck(info:isOn() == true)
    MemoList_SimpleTooltipShow = function(uiType)
    -- function num : 0_11_0 , upvalues : toggleButton, removeButton
    local uiControl, name = nil
    if uiType == 0 then
      uiControl = toggleButton
      name = PAGetString(Defines.StringSheet_GAME, "LUA_MEMOLIST_TOGGLE")
    else
      if uiType == 1 then
        uiControl = removeButton
        name = PAGetString(Defines.StringSheet_GAME, "LUA_MEMOLIST_DELETE")
      end
    end
    TooltipSimple_Show(uiControl, name)
  end

    MemoList_SimpleTooltipHide = function()
    -- function num : 0_11_1
    TooltipSimple_Hide()
  end

    bg:addInputEvent("Mouse_LDClick", "PaGlobal_Memo:StickyToggleShow( " .. id .. ")")
    toggleButton:addInputEvent("Mouse_LUp", "PaGlobal_Memo:StickyToggleShow( " .. id .. ")")
    toggleButton:addInputEvent("Mouse_On", "MemoList_SimpleTooltipShow(" .. 0 .. ")")
    toggleButton:addInputEvent("Mouse_Out", "MemoList_SimpleTooltipHide()")
    removeButton:addInputEvent("Mouse_LUp", "PaGlobal_Memo:RemoveConfirmPopUp( " .. id .. " ) ")
    removeButton:addInputEvent("Mouse_On", "MemoList_SimpleTooltipShow(" .. 1 .. ")")
    removeButton:addInputEvent("Mouse_Out", "MemoList_SimpleTooltipHide()")
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC101: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Memo.StickyClearFocus = function(self)
  -- function num : 0_12
  ClearFocusEdit()
  self._currentFocusId = nil
  self._currentFocusContent = nil
end

-- DECOMPILER ERROR at PC104: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Memo.IsChanged = function(self)
  -- function num : 0_13
  if self._currentFocusId == nil then
    return false
  end
  local stickyMemo = (self._stickyMemoList)[self._currentFocusId]
  if self._currentFocusContent == (stickyMemo._uiMultiLineText):GetEditText() then
    return false
  end
  return true
end

Panel_Memo_List_ShowAni = function()
  -- function num : 0_14
  local aniInfo1 = Panel_Memo_List:addScaleAnimation(0, 0.08, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.12)
  aniInfo1.AxisX = Panel_Memo_List:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Memo_List:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_Memo_List:addScaleAnimation(0.08, 0.15, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.12)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Memo_List:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Memo_List:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_Memo_List_HideAni = function()
  -- function num : 0_15
  local aniInfo1 = Panel_Memo_List:addColorAnimation(0, 0.1, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor((Defines.Color).C_FFFFFFFF)
  aniInfo1:SetEndColor((Defines.Color).C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

-- DECOMPILER ERROR at PC111: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Memo.ListOpen = function(self)
  -- function num : 0_16
  if not Panel_Memo_List:IsShow() then
    Panel_Memo_List:SetShow(true, true)
    ToClient_refreshMemoUpdateTime()
    self:ListUpdate()
  end
end

-- DECOMPILER ERROR at PC114: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Memo.ListClose = function(self)
  -- function num : 0_17
  if Panel_Memo_List:IsShow() then
    Panel_Memo_List:SetShow(false, true)
  end
  TooltipSimple_Hide()
end

-- DECOMPILER ERROR at PC117: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Memo.getInfoByCurData = function(self, id)
  -- function num : 0_18
  local stickyMemo = (self._stickyMemoList)[id]
  local posX = (stickyMemo._mainPanel):GetPosX()
  local posY = (stickyMemo._mainPanel):GetPosY()
  do
    if stickyMemo._isSubAppMode == true then
      local info = ToClient_getMemo(id)
      posX = info:getPositionX()
      posY = info:getPositionY()
    end
    local info = MemoInfo(id)
    info:setInfo((stickyMemo._uiMultiLineText):GetEditText(), stickyMemo._isOn, int2(posX, posY), int2((stickyMemo._mainPanel):GetSizeX(), (stickyMemo._mainPanel):GetSizeY()), stickyMemo._stickyMemoAlpha, stickyMemo._stickyMemoColor)
    return info
  end
end

-- DECOMPILER ERROR at PC120: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_Memo.Tablelength = function(self, T)
  -- function num : 0_19
  local count = 0
  for _ in pairs(T) do
    count = count + 1
  end
  return count
end


