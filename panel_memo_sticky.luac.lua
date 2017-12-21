-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\memo\panel_memo_sticky.luac 

-- params : ...
-- function num : 0
FGlobal_Memo_EventFocusOut = function()
  -- function num : 0_0
  PaGlobal_Memo:Save((PaGlobal_Memo._SaveMode_).TEXT)
end

FGlobal_Memo_CheckUiEdit = function(targetUI)
  -- function num : 0_1
  if PaGlobal_Memo._currentFocusId == nil then
    return false
  end
  local currentMemo = (PaGlobal_Memo._stickyMemoList)[PaGlobal_Memo._currentFocusId]
  if currentMemo == nil then
    return false
  end
  local currentEdit = ((PaGlobal_Memo._stickyMemoList)[PaGlobal_Memo._currentFocusId])._uiMultiLineText
  if targetUI ~= nil and targetUI:GetKey() == currentEdit:GetKey() then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC6: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Memo.StickyToggleShow = function(self, id)
  -- function num : 0_2
  local info = ToClient_getMemo(id)
  local stickyMemo = (self._stickyMemoList)[id]
  if info:isOn() == true then
    stickyMemo._isOn = false
    ;
    (stickyMemo._mainPanel):SetShow(false)
    ;
    (stickyMemo._mainPanel):CloseUISubApp()
    ;
    (stickyMemo._uiCheckbuttonPopup):SetCheck(false)
  else
    if stickyMemo == nil then
      self:createStickyMemoWrapper(id)
    else
      stickyMemo._isOn = true
      ;
      (stickyMemo._mainPanel):SetShow(true)
    end
  end
  self:Save((self._SaveMode_).SETTING, id)
  self:StickyClearFocus()
  if Panel_Memo_List:IsShow() == true then
    ((self._ui)._list2):requestUpdateByKey(toInt64(0, id))
  end
end

-- DECOMPILER ERROR at PC9: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Memo.StickyClose = function(self, id)
  -- function num : 0_3
  self:StickyToggleShow(id)
  TooltipSimple_Hide()
end

-- DECOMPILER ERROR at PC12: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Memo.StickyClickedContent = function(self, id)
  -- function num : 0_4
  local stickyMemo = (self._stickyMemoList)[id]
  if self._currentFocusId ~= nil and self._currentFocusId ~= id then
    self:Save()
  end
  self._currentFocusId = id
  self._currentFocusContent = (stickyMemo._uiMultiLineText):GetEditText()
  local default_text = PAGetString(Defines.StringSheet_GAME, "LUA_MEMO_INSERTCONTENT")
  if self._currentFocusContent == default_text then
    (stickyMemo._uiMultiLineText):SetEditText("")
  end
  SetFocusEdit(stickyMemo._uiMultiLineText)
  ;
  (stickyMemo._uiframe):UpdateContentScroll()
  ;
  (stickyMemo._uiframeScroll):SetControlBottom()
  ;
  (stickyMemo._uiframe):UpdateContentPos()
end

-- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Memo.StickyAlphaSlider = function(self, id)
  -- function num : 0_5
  self:ComputeControlAlpha(id)
  self:Save((self._SaveMode_).SETTING, id)
end

-- DECOMPILER ERROR at PC18: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Memo.StickyResizeStartPos = function(self, id)
  -- function num : 0_6
  local panel = ((self._stickyMemoList)[id])._mainPanel
  orgMouseX = getMousePosX()
  orgMouseY = getMousePosY()
  orgPanelPosX = panel:GetPosX()
  orgPanelSizeX = panel:GetSizeX()
  orgPanelSizeY = panel:GetSizeY()
end

-- DECOMPILER ERROR at PC21: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Memo.StickyResize = function(self, id)
  -- function num : 0_7
  local stickyMemo = (self._stickyMemoList)[id]
  if (stickyMemo._uiCheckbuttonPopup):IsCheck() then
    return 
  end
  local info = ToClient_getMemo(id)
  local panel = stickyMemo._mainPanel
  local currentPosX = panel:GetPosX()
  local currentPosY = panel:GetPosY()
  local currentX = getMousePosX()
  local currentY = getMousePosY()
  local deltaX = currentX - orgMouseX
  local deltaY = currentY - orgMouseY
  local sizeX = orgPanelSizeX + deltaX
  local sizeY = orgPanelSizeY + deltaY
  if sizeX > 600 then
    sizeX = 600
  else
    if sizeX < 300 then
      sizeX = 300
    end
  end
  if sizeY > 600 then
    sizeY = 600
  else
    if sizeY < 212 then
      sizeY = 212
    end
  end
  local currentSizeX = panel:GetSizeX()
  local currentSizeY = panel:GetSizeY()
  self:ComputeControlShape(id, currentPosX, currentPosY, sizeX, sizeY)
end

-- DECOMPILER ERROR at PC24: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Memo.StickyResizeEnd = function(self, id)
  -- function num : 0_8
  local stickyMemo = (self._stickyMemoList)[id]
  if (stickyMemo._uiCheckbuttonPopup):IsCheck() then
    return 
  end
  do
    local isFocused = self._currentFocusId ~= nil
    self:Save((self._SaveMode_).SETTING, id)
    if isFocused == true then
      SetFocusEdit(stickyMemo._uiMultiLineText)
    end
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC27: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Memo.ComputeFrameContentSizeY = function(self, id)
  -- function num : 0_9
  local stickyMemo = (self._stickyMemoList)[id]
  local info = ToClient_getMemo(id)
  ;
  (stickyMemo._uiframeContent):SetSize((stickyMemo._uiframeContent):GetSizeX(), info:getFrameContentY())
end

-- DECOMPILER ERROR at PC30: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Memo.StickyToggleChangeColor = function(self, id)
  -- function num : 0_10
  local stickyMemo = (self._stickyMemoList)[id]
  local isShow = ((stickyMemo._colorChange)._uiframe):GetShow()
  if isShow == true then
    isShow = false
  else
    isShow = true
  end
  ;
  ((stickyMemo._colorChange)._uiframe):SetShow(isShow)
end

-- DECOMPILER ERROR at PC33: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Memo.StickyChangeColorEnd = function(self, id, color)
  -- function num : 0_11
  self:StickyApplyColor(id, color)
  ;
  ((((self._stickyMemoList)[id])._colorChange)._uiframe):SetShow(false)
  self:Save((self._SaveMode_).SETTING, id)
end

-- DECOMPILER ERROR at PC36: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Memo.Check_PopUI = function(self, id)
  -- function num : 0_12
  local stickyMemo = (self._stickyMemoList)[id]
  if (stickyMemo._uiCheckbuttonPopup):IsCheck() == true then
    self:Save((self._SaveMode_).SETTING, id)
    stickyMemo._isSubAppMode = true
    ;
    (stickyMemo._mainPanel):OpenUISubApp()
  else
    stickyMemo._isSubAppMode = false
    ;
    (stickyMemo._mainPanel):CloseUISubApp()
  end
end

-- DECOMPILER ERROR at PC39: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Memo.createStickyMemoWrapper = function(self, id)
  -- function num : 0_13
  local info = ToClient_getMemo(id)
  local content = info:getContent()
  if content == "" or content == "Content" then
    content = PAGetString(Defines.StringSheet_GAME, "LUA_MEMO_INSERTCONTENT")
  end
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (self._stickyMemoList)[id] = PaGlobal_Memo:createStickyMemo(id, content)
  local stickyMemo = (self._stickyMemoList)[id]
  local panel = stickyMemo._mainPanel
  ;
  (stickyMemo._mainPanel):SetShow(true)
  ;
  (stickyMemo._uiSlider):SetControlPos(info:getAlpha() * 100)
  self:ComputeControlShape(id, info:getPositionX(), info:getPositionY(), info:getSizeX(), info:getSizeY())
  self:ComputeControlAlpha(id)
  self:StickyApplyColor(id, info:getColor())
end

-- DECOMPILER ERROR at PC42: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Memo.createStickyMemo = function(self, stickyMemoId, content)
  -- function num : 0_14
  local stickyMemo = {_id = stickyMemoId, _content = content, _isOn = true, _mainPanel = nil, _uiClose = nil, _uiAddMemo = nil, _uiEditTitleImg = nil, _uiSizeControl = nil, _uiSave = nil, _uiButtonColorChange = nil, 
_colorChange = {_uiframe = nil, _uiframeContent = nil, _title = nil, _bg = nil, 
_uiButton = {[0] = nil, [1] = nil, [2] = nil, [3] = nil}
}
, _uiSlider = nil, _uiSliderButton = nil, _uiEmpty = nil, _uiframe = nil, _uiframeContent = nil, _uiframeScroll = nil, _uiMultiLineText = nil, _uiMultiLineTextContent = nil, _uiMultiLineTextScroll = nil, _curline = 0, _uiCheckbuttonPopup = nil, _stickyMemoAlpha = 1, _stickyMemoColor = 0, _isSubAppMode = false}
  stickyMemo.initialize = function(self, stickyMemoId)
    -- function num : 0_14_0 , upvalues : stickyMemo
    stickyMemo:createPanel(stickyMemoId)
    stickyMemo:prepareControl(stickyMemoId)
  end

  stickyMemo.clear = function(self)
    -- function num : 0_14_1 , upvalues : stickyMemo
    if (stickyMemo._uiCheckbuttonPopup):IsCheck() == true then
      (stickyMemo._mainPanel):CloseUISubApp()
    end
    ;
    (UI.deletePanel)((self._mainPanel):GetID())
    self._mainPanel = nil
  end

  stickyMemo.createPanel = function(self, stickyMemoId)
    -- function num : 0_14_2 , upvalues : stickyMemo
    local newName = "Panel_Memo_Sticky" .. stickyMemoId
    -- DECOMPILER ERROR at PC11: Confused about usage of register: R3 in 'UnsetPending'

    stickyMemo._mainPanel = (UI.createPanel)(newName, (Defines.UIGroup).PAGameUIGroup_Dialog)
    CopyBaseProperty(Panel_Memo_Sticky, stickyMemo._mainPanel)
    ;
    (stickyMemo._mainPanel):SetDragAll(true)
    ;
    (stickyMemo._mainPanel):SetShow(true)
  end

  stickyMemo.prepareControl = function(self, stickyMemoId)
    -- function num : 0_14_3 , upvalues : stickyMemo
    self._uiEditTitleImg = stickyMemo:createControl((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Memo_Sticky, self._mainPanel, "Static_TitleImage", 0)
    self._uiClose = stickyMemo:createControl((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, Panel_Memo_Sticky, self._mainPanel, "Button_Close", 0)
    ;
    (self._uiClose):addInputEvent("Mouse_LUp", "PaGlobal_Memo:StickyClose(" .. stickyMemoId .. ")")
    ;
    (self._uiClose):addInputEvent("Mouse_On", "PaGlobal_Memo:Tooltip_Show(" .. 0 .. ")")
    ;
    (self._uiClose):addInputEvent("Mouse_Out", "PaGlobal_Memo:Tooltip_Hide()")
    self._uiSlider = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_SLIDER, self._mainPanel, "Slider_Alpha")
    self._uiSliderButton = (self._uiSlider):GetControlButton()
    ;
    (self._uiSliderButton):addInputEvent("Mouse_On", "PaGlobal_Memo:Tooltip_Show(" .. 1 .. ")")
    ;
    (self._uiSliderButton):addInputEvent("Mouse_Out", "PaGlobal_Memo:Tooltip_Hide()")
    local style = (UI.getChildControl)(Panel_Memo_Sticky, "Slider_Alpha")
    CopyBaseProperty(style, self._uiSlider)
    ;
    (self._uiSlider):SetInterval(100)
    ;
    (self._uiSliderButton):addInputEvent("Mouse_LPress", "PaGlobal_Memo:StickyAlphaSlider( " .. stickyMemoId .. ")")
    ;
    (self._uiSlider):addInputEvent("Mouse_LUp", "PaGlobal_Memo:StickyAlphaSlider( " .. stickyMemoId .. ")")
    ;
    (self._uiSlider):SetControlPos(100)
    self._uiSizeControl = stickyMemo:createControl((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, Panel_Memo_Sticky, self._mainPanel, "Button_SizeControl", 0)
    ;
    (self._uiSizeControl):addInputEvent("Mouse_LDown", "PaGlobal_Memo:StickyResizeStartPos( " .. stickyMemoId .. " )")
    ;
    (self._uiSizeControl):addInputEvent("Mouse_LPress", "PaGlobal_Memo:StickyResize( " .. stickyMemoId .. " )")
    ;
    (self._uiSizeControl):addInputEvent("Mouse_LUp", "PaGlobal_Memo:StickyResizeEnd( " .. stickyMemoId .. " )")
    self._uiframe = stickyMemo:createControl((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_FRAME, Panel_Memo_Sticky, self._mainPanel, "Frame_Sticky", 0)
    ;
    (self._uiframe):addInputEvent("Mouse_LUp", "PaGlobal_Memo:StickyClickedContent(" .. stickyMemoId .. ")")
    self._uiframeContent = (self._uiframe):GetFrameContent()
    self._uiframeScroll = (self._uiframe):GetVScroll()
    local styleFrame = (UI.getChildControl)(Panel_Memo_Sticky, "Frame_Sticky")
    local styleScroll = (UI.getChildControl)(styleFrame, "Frame_1_VerticalScroll")
    CopyBaseProperty(styleScroll, self._uiframeScroll)
    local multilinestyle = (UI.getChildControl)(Panel_Memo_Sticky, "MultilineEdit_Content")
    self._uiMultiLineText = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_MULTILINEEDIT, self._uiframeContent, "MultilineEdit_Content" .. 0)
    CopyBaseProperty(multilinestyle, self._uiMultiLineText)
    ;
    (self._uiMultiLineText):SetEditText(stickyMemo._content)
    ;
    (self._uiMultiLineText):SetMaxEditLine(9)
    ;
    (self._uiMultiLineText):SetMaxInput(2000)
    ;
    (self._uiMultiLineText):SetTextVerticalTop(true)
    ;
    (self._uiMultiLineText):SetFontColor((Defines.Color).C_FFC4BEBE)
    self._uiSave = stickyMemo:createControl((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, Panel_Memo_Sticky, self._mainPanel, "Button_SaveMemo", 0)
    ;
    (self._uiSave):addInputEvent("Mouse_LUp", "PaGlobal_Memo:Save(" .. (PaGlobal_Memo._SaveMode_).ALL .. "," .. stickyMemoId .. ")")
    self._uiAddMemo = stickyMemo:createControl((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, Panel_Memo_Sticky, self._mainPanel, "Button_AddMemo", 0)
    ;
    (self._uiAddMemo):addInputEvent("Mouse_LUp", "PaGlobal_Memo:Add()")
    ;
    (self._uiAddMemo):addInputEvent("Mouse_On", "PaGlobal_Memo:Tooltip_Show(" .. 2 .. ")")
    ;
    (self._uiAddMemo):addInputEvent("Mouse_Out", "PaGlobal_Memo:Tooltip_Hide()")
    self._uiCheckbuttonPopup = stickyMemo:createControl((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_CHECKBUTTON, Panel_Memo_Sticky, self._mainPanel, "CheckButton_PopUp", 0)
    ;
    (self._uiCheckbuttonPopup):addInputEvent("Mouse_LUp", "PaGlobal_Memo:Check_PopUI(" .. stickyMemoId .. ")")
    ;
    (self._uiCheckbuttonPopup):addInputEvent("Mouse_On", "PaGlobal_Memo:Tooltip_Show(" .. 3 .. ")")
    ;
    (self._uiCheckbuttonPopup):addInputEvent("Mouse_Out", "PaGlobal_Memo:Tooltip_Hide()")
    self._uiButtonColorChange = stickyMemo:createControl((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, Panel_Memo_Sticky, self._mainPanel, "Button_ColorChange", 0)
    ;
    (self._uiButtonColorChange):addInputEvent("Mouse_LUp", "PaGlobal_Memo:StickyToggleChangeColor( " .. stickyMemoId .. " )")
    ;
    (self._uiButtonColorChange):addInputEvent("Mouse_On", "PaGlobal_Memo:Tooltip_Show(" .. 4 .. ")")
    ;
    (self._uiButtonColorChange):addInputEvent("Mouse_Out", "PaGlobal_Memo:Tooltip_Hide()")
    -- DECOMPILER ERROR at PC348: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._colorChange)._uiframe = stickyMemo:createControl((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_FRAME, Panel_Memo_Sticky, self._mainPanel, "Frame_Sticky_ColorChange", 0)
    -- DECOMPILER ERROR at PC354: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._colorChange)._uiframeContent = ((self._colorChange)._uiframe):GetFrameContent()
    local colorBg = (UI.createAndCopyBasePropertyControl)(Panel_Memo_Sticky, "Static_Bg", (self._colorChange)._uiframeContent, "Static_Bg")
    local colorTitle = (UI.createAndCopyBasePropertyControl)(Panel_Memo_Sticky, "StaticText_ColorTitle", (self._colorChange)._uiframeContent, "StaticText_ColorTitle")
    colorBg:SetShow(true)
    colorTitle:SetShow(true)
    for color = 0, 5 do
      local colorStyle = (UI.getChildControl)(Panel_Memo_Sticky, "Button_Color_" .. tostring(color))
      -- DECOMPILER ERROR at PC403: Confused about usage of register: R13 in 'UnsetPending'

      ;
      ((self._colorChange)._uiButton)[color] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, (self._colorChange)._uiframeContent, "Button_Color_" .. color)
      CopyBaseProperty(colorStyle, ((self._colorChange)._uiButton)[color])
      ;
      (((self._colorChange)._uiButton)[color]):addInputEvent("Mouse_LUp", "PaGlobal_Memo:StickyChangeColorEnd(" .. stickyMemoId .. "," .. color .. ")")
      ;
      (((self._colorChange)._uiButton)[color]):SetShow(true)
    end
    ;
    ((self._colorChange)._uiframe):SetShow(false)
    ;
    (self._mainPanel):addInputEvent("Mouse_UpScroll", "PaGlobal_Memo:OnMouseWheel( " .. stickyMemoId .. ", true )")
    ;
    (self._mainPanel):addInputEvent("Mouse_DownScroll", "PaGlobal_Memo:OnMouseWheel( " .. stickyMemoId .. ", false )")
    ;
    (self._uiMultiLineText):addInputEvent("Mouse_UpScroll", "PaGlobal_Memo:OnMouseWheel( " .. stickyMemoId .. ", true )")
    ;
    (self._uiMultiLineText):addInputEvent("Mouse_DownScroll", "PaGlobal_Memo:OnMouseWheel( " .. stickyMemoId .. ", false )")
    -- DECOMPILER ERROR at PC469: Confused about usage of register: R8 in 'UnsetPending'

    PaGlobal_Memo.Tooltip_Show = function(self, uiType)
      -- function num : 0_14_3_0 , upvalues : stickyMemo
      local uiControl, name, desc = nil
      if uiType == 0 then
        uiControl = stickyMemo._uiClose
        name = PAGetString(Defines.StringSheet_GAME, "LUA_MEMO_CLOSE")
      else
        if uiType == 1 then
          uiControl = stickyMemo._uiSliderButton
          name = PAGetString(Defines.StringSheet_GAME, "LUA_MEMO_TRANSPARENCY")
        else
          if uiType == 2 then
            uiControl = stickyMemo._uiAddMemo
            name = PAGetString(Defines.StringSheet_GAME, "LUA_MEMO_ADD")
          else
            if uiType == 3 then
              uiControl = stickyMemo._uiCheckbuttonPopup
              name = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_TOOLTIP_NAME")
              if (stickyMemo._uiCheckbuttonPopup):IsCheck() then
                desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_CHECK_TOOLTIP")
              else
                desc = PAGetString(Defines.StringSheet_GAME, "LUA_POPUI_NOCHECK_TOOLTIP")
              end
            else
              if uiType == 4 then
                uiControl = stickyMemo._uiButtonColorChange
                name = PAGetString(Defines.StringSheet_GAME, "LUA_MEMO_COLORCHANGE")
              end
            end
          end
        end
      end
      TooltipSimple_Show(uiControl, name, desc)
    end

    -- DECOMPILER ERROR at PC472: Confused about usage of register: R8 in 'UnsetPending'

    PaGlobal_Memo.Tooltip_Hide = function(self)
      -- function num : 0_14_3_1
      TooltipSimple_Hide()
    end

  end

  stickyMemo.createControl = function(self, controlType, parentStyleControl, parentControl, controlName, index)
    -- function num : 0_14_4
    local styleControl = (UI.getChildControl)(parentStyleControl, controlName)
    local control = (UI.createControl)(controlType, parentControl, controlName .. index)
    CopyBaseProperty(styleControl, control)
    return control
  end

  stickyMemo:initialize(stickyMemoId)
  return stickyMemo
end

-- DECOMPILER ERROR at PC45: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Memo.OnMouseWheel = function(self, stickyMemoId, isUp)
  -- function num : 0_15
  local stickyMemo = (self._stickyMemoList)[stickyMemoId]
  local targetScroll = stickyMemo._uiFrameScroll
  if targetScroll == nil then
    return 
  end
  if isUp then
    targetScroll:ControlButtonUp()
  else
    targetScroll:ControlButtonDown()
  end
  ;
  (stickyMemo._uiFrame):UpdateContentPos()
end

-- DECOMPILER ERROR at PC48: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Memo.ComputeControlShape = function(self, id, posX, posY, sizeX, sizeY)
  -- function num : 0_16
  local stickyMemo = (self._stickyMemoList)[id]
  local info = ToClient_getMemo(id)
  local panel = stickyMemo._mainPanel
  panel:SetSize(sizeX, sizeY)
  panel:SetPosX(posX)
  panel:SetPosY(posY)
  ;
  (stickyMemo._uiEditTitleImg):SetSize(sizeX, 25)
  ;
  (stickyMemo._uiSizeControl):ComputePos()
  ;
  (stickyMemo._uiButtonColorChange):SetPosX(panel:GetSizeX() - 65)
  ;
  (stickyMemo._uiClose):SetPosX(panel:GetSizeX() - (stickyMemo._uiClose):GetSizeX() - 5)
  ;
  ((stickyMemo._colorChange)._uiframe):SetPosX(panel:GetSizeX() - ((stickyMemo._colorChange)._uiframe):GetSizeX() - 10)
  ;
  (stickyMemo._uiMultiLineText):SetSize(panel:GetSizeX() - 30, 5)
  ;
  (stickyMemo._uiMultiLineText):SetMaxEditLine(30)
  ;
  (stickyMemo._uiMultiLineText):SetEditText((stickyMemo._uiMultiLineText):GetEditText(), false)
  ;
  (stickyMemo._uiframe):SetSize(panel:GetSizeX() - 15, panel:GetSizeY() - 63)
  ;
  (stickyMemo._uiframeContent):SetSize(panel:GetSizeX() - 15, info:getFrameContentY())
  ;
  (stickyMemo._uiSave):ComputePos()
  ;
  (stickyMemo._uiSlider):ComputePos()
  ;
  (stickyMemo._uiCheckbuttonPopup):ComputePos()
  ;
  (stickyMemo._uiframe):UpdateContentScroll()
  ;
  (stickyMemo._uiframeScroll):SetControlTop()
  ;
  (stickyMemo._uiframe):UpdateContentPos()
end

-- DECOMPILER ERROR at PC51: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Memo.ComputeControlAlpha = function(self, id)
  -- function num : 0_17
  local stickyMemo = (self._stickyMemoList)[id]
  local panel = stickyMemo._mainPanel
  stickyMemo._stickyMemoAlpha = (stickyMemo._uiSlider):GetControlPos() * 0.9 + 0.1
  panel:SetAlpha(stickyMemo._stickyMemoAlpha)
  ;
  (stickyMemo._uiSave):SetAlpha(stickyMemo._stickyMemoAlpha)
  ;
  (stickyMemo._uiSave):SetFontAlpha(stickyMemo._stickyMemoAlpha)
end

-- DECOMPILER ERROR at PC54: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Memo.StickyApplyColor = function(self, id, color)
  -- function num : 0_18
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R3 in 'UnsetPending'

  ((self._stickyMemoList)[id])._stickyMemoColor = color
  local control = ((self._stickyMemoList)[id])._uiEditTitleImg
  local _x1, _y1, _x2, _y2 = nil, nil, nil, nil
  if color == 0 then
    _x1 = 1
  else
    -- DECOMPILER ERROR at PC22: Overwrote pending register: R7 in 'AssignReg'

    -- DECOMPILER ERROR at PC23: Overwrote pending register: R6 in 'AssignReg'

    -- DECOMPILER ERROR at PC24: Overwrote pending register: R5 in 'AssignReg'

    if color == 1 then
      _x1 = 30
    else
      -- DECOMPILER ERROR at PC32: Overwrote pending register: R7 in 'AssignReg'

      -- DECOMPILER ERROR at PC33: Overwrote pending register: R6 in 'AssignReg'

      -- DECOMPILER ERROR at PC34: Overwrote pending register: R5 in 'AssignReg'

      if color == 2 then
        _x1 = 59
      else
        -- DECOMPILER ERROR at PC42: Overwrote pending register: R7 in 'AssignReg'

        -- DECOMPILER ERROR at PC43: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC44: Overwrote pending register: R5 in 'AssignReg'

        if color == 3 then
          _x1 = 88
        else
          -- DECOMPILER ERROR at PC52: Overwrote pending register: R7 in 'AssignReg'

          -- DECOMPILER ERROR at PC53: Overwrote pending register: R6 in 'AssignReg'

          -- DECOMPILER ERROR at PC54: Overwrote pending register: R5 in 'AssignReg'

          if color == 4 then
            _x1 = 117
          else
            -- DECOMPILER ERROR at PC62: Overwrote pending register: R7 in 'AssignReg'

            -- DECOMPILER ERROR at PC63: Overwrote pending register: R6 in 'AssignReg'

            -- DECOMPILER ERROR at PC64: Overwrote pending register: R5 in 'AssignReg'

            if color == 5 then
              _x1 = 146
            end
          end
        end
      end
    end
  end
  control:ChangeTextureInfoName("New_UI_Common_forLua/Widget/Memo/Memo_00.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(control, _x1, _y1, _x2, _y2)
  ;
  (control:getBaseTexture()):setUV(x1, y1, x2, y2)
  control:setRenderTexture(control:getBaseTexture())
end

-- DECOMPILER ERROR at PC57: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Memo.StickySetDefaultPos = function(self, id)
  -- function num : 0_19
  local lsitPosX = Panel_Memo_List:GetPosX()
  local lsitPosY = Panel_Memo_List:GetPosY()
  local lsitSizeX = Panel_Memo_List:GetSizeX()
  local panel = ((self._stickyMemoList)[id])._mainPanel
  local centerX = getScreenSizeX() * 0.5
  if centerX < lsitPosX then
    panel:SetPosX(lsitPosX - panel:GetSizeX() - 10)
  else
    panel:SetPosX(lsitPosX + lsitSizeX + 10)
  end
  panel:SetPosY(lsitPosY + 15)
  self:Save((self._SaveMode_).SETTING, id)
end


