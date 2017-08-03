-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\fileexplorer\fileexplorer.luac 

-- params : ...
-- function num : 0
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local StaticText_Title = (UI.getChildControl)(Panel_FileExplorer, "StaticText_Title")
local btn_Question = (UI.getChildControl)(Panel_FileExplorer, "Button_Question")
local btn_Close = (UI.getChildControl)(Panel_FileExplorer, "Button_Win_Close")
local btn_Confirm = (UI.getChildControl)(Panel_FileExplorer, "Button_Confirm")
local btn_Cancle = (UI.getChildControl)(Panel_FileExplorer, "Button_Cancle")
local btn_Refresh = (UI.getChildControl)(Panel_FileExplorer, "Button_Refresh")
local combo_Ext = (UI.getChildControl)(Panel_FileExplorer, "Combobox_Filter_Zone")
local list_Ext = combo_Ext:GetListControl()
local btn_Back = (UI.getChildControl)(Panel_FileExplorer, "Button_Back")
local btn_Forward = (UI.getChildControl)(Panel_FileExplorer, "Button_Forward")
local text_EditBox = (UI.getChildControl)(Panel_FileExplorer, "Static_EditBox")
btn_Close:addInputEvent("Mouse_LUp", "closeExplorer()")
btn_Confirm:addInputEvent("Mouse_LUp", "FileExplorer_Confirm()")
btn_Cancle:addInputEvent("Mouse_LUp", "closeExplorer()")
btn_Refresh:addInputEvent("Mouse_LUp", "refreshFileList()")
combo_Ext:addInputEvent("Mouse_LUp", "Toggle_ExtBox()")
list_Ext:addInputEvent("Mouse_LUp", "SlectExtListIndex()")
btn_Back:addInputEvent("Mouse_LUp", "goToParentFolder()")
btn_Forward:addInputEvent("Mouse_LUp", "gotoPrevFolder()")
local btn_Open = (UI.getChildControl)(Panel_FileExplorer, "Button_Open")
local static_FilePath = (UI.getChildControl)(Panel_FileExplorer, "StaticText_FilePath")
local frame_FileList = (UI.getChildControl)(Panel_FileExplorer, "Frame_FileList")
local frame_Content = (UI.getChildControl)(frame_FileList, "Frame_1_Content")
local frame_Scroll = (UI.getChildControl)(frame_FileList, "Frame_1_VerticalScroll")
local frame_ScrollBtn = (UI.getChildControl)(frame_Scroll, "Frame_1_VerticalScroll_CtrlButton")
local frame_FileList2 = (UI.getChildControl)(Panel_FileExplorer, "Frame_2_FileList")
local frame_Content2 = (UI.getChildControl)(frame_FileList2, "Frame_2_Content")
local frame_Scroll2 = (UI.getChildControl)(frame_FileList2, "Frame_2_VerticalScroll")
local frame_ScrollBtn2 = (UI.getChildControl)(frame_Scroll2, "Frame_2_VerticalScroll_CtrlButton")
local temp_ItemBase = (UI.getChildControl)(Panel_FileExplorer, "Static_Item")
local temp_IconBase = (UI.getChildControl)(Panel_FileExplorer, "Static_Icon")
local temp_PathBase = (UI.getChildControl)(Panel_FileExplorer, "StaticText_FileName")
local _fileExplorer = ToClient_getFileExplorer()
local _itemYGap = 6
local _currentFrame = {frame = frame_FileList, content = frame_Content, scroll = frame_Scroll, scroll_Btn = frame_ScrollBtn}
local _swapFrame = {frame = frame_FileList2, content = frame_Content2, scroll = frame_Scroll2, scroll_Btn = frame_ScrollBtn2}
local _textureSize = 128
_ext_type_customize = 0
local _type_image = 0
local _type_customize = 1
local _folder_textureInfo = {x = 0, y = 0, endX = 32, endY = 32}
local _ext_arr = {
[_ext_type_customize] = {
[_type_image] = {x = 136, y = 9, endX = 254, endY = 137}
, 
[_type_customize] = {x = 5, y = 9, endX = 133, endY = 137}
}
}
local _current_ext_type = 0
local _openWithFunction, _btn_ConfirmFunction, _btn_CancelFunction = nil, nil, nil
local _listItemHeight = 12
local _cusomizeText = "Customization File"
local _bDirectorySerch = true
local _bUseFilter = true
local _isFileExplorerOpen = false
static_FilePath:SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
FileExplorer_Open = function(ExplorerTitleName, ExtensionType, ExtensionTypeList)
  -- function num : 0_0 , upvalues : _isFileExplorerOpen, _fileExplorer, text_EditBox, StaticText_Title, _current_ext_type, combo_Ext, list_Ext
  _isFileExplorerOpen = true
  _fileExplorer:init()
  text_EditBox:SetEditText("")
  StaticText_Title:SetText(ExplorerTitleName)
  _current_ext_type = ExtensionType
  combo_Ext:DeleteAllItem()
  local count = #ExtensionTypeList
  list_Ext:SetItemQuantity(count)
  for extIndex = 1, #ExtensionTypeList do
    local text = ExtensionTypeList[extIndex]
    combo_Ext:AddItem(ExtensionTypeList[extIndex])
  end
  combo_Ext:SetText(ExtensionTypeList[1])
  refreshFileList()
  Panel_FileExplorer:SetShow(true)
end

FileExplorer_getCurrentPath = function()
  -- function num : 0_1 , upvalues : _fileExplorer
  return _fileExplorer:getCurrentPath()
end

FileExplorer_setEditTextMaxInput = function(inputsize)
  -- function num : 0_2 , upvalues : text_EditBox
  text_EditBox:SetMaxInput(inputsize)
end

FileExplorer_NotUseFilterComboBox = function(bUseBox)
  -- function num : 0_3 , upvalues : combo_Ext, _bUseFilter
  combo_Ext:SetShow(bUseBox)
  _bUseFilter = bUseBox
end

FileExplorer_NotUsePrevNextBtn = function(bUseBtn)
  -- function num : 0_4 , upvalues : btn_Back, btn_Forward
  btn_Back:SetShow(bUseBtn)
  btn_Forward:SetShow(bUseBtn)
end

FileExplorer_NotUseEditText = function(bUseEditText)
  -- function num : 0_5 , upvalues : text_EditBox
  text_EditBox:SetShow(bUseEditText)
end

FileExplorerAddPathToCurrentPath = function(addPath)
  -- function num : 0_6 , upvalues : _fileExplorer
  _fileExplorer:setAddPathToCurrentPath(addPath)
end

FileExplorerSetFilterBoxAtIndex = function(index)
  -- function num : 0_7 , upvalues : combo_Ext
  if index ~= nil then
    combo_Ext:SetSelectItemIndex(index)
  else
    combo_Ext:SetSelectItemIndex(0)
  end
end

local Init = function()
  -- function num : 0_8 , upvalues : _fileExplorer
  _fileExplorer:init()
end

local swapFrame = function()
  -- function num : 0_9 , upvalues : _currentFrame, _swapFrame
  local frame = _currentFrame.frame
  local content = _currentFrame.content
  local scroll = _currentFrame.scroll
  local scroll_Btn = _currentFrame.scroll_Btn
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R4 in 'UnsetPending'

  _currentFrame.frame = _swapFrame.frame
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R4 in 'UnsetPending'

  _currentFrame.content = _swapFrame.content
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R4 in 'UnsetPending'

  _currentFrame.scroll = _swapFrame.scroll
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R4 in 'UnsetPending'

  _currentFrame.scroll_Btn = _swapFrame.scroll_Btn
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R4 in 'UnsetPending'

  _swapFrame.frame = frame
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R4 in 'UnsetPending'

  _swapFrame.content = content
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R4 in 'UnsetPending'

  _swapFrame.scroll = scroll
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R4 in 'UnsetPending'

  _swapFrame.scroll_Btn = scroll_Btn
end

local MakeFileItem = function(name)
  -- function num : 0_10 , upvalues : UI_PUCT, _currentFrame, temp_ItemBase, temp_IconBase, temp_PathBase
  local fileItem = {}
  fileItem._item = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, _currentFrame.content, name)
  CopyBaseProperty(temp_ItemBase, fileItem._item)
  fileItem._icon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, fileItem._item, name .. "_icon")
  CopyBaseProperty(temp_IconBase, fileItem._icon)
  fileItem._text = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, fileItem._item, name .. "_text")
  CopyBaseProperty(temp_PathBase, fileItem._text)
  ;
  (fileItem._item):SetPosX(0)
  ;
  (fileItem._item):SetPosY(0)
  ;
  (fileItem._icon):SetPosX(5)
  ;
  (fileItem._icon):SetPosY(0)
  ;
  (fileItem._text):SetPosX((fileItem._icon):GetSizeX() + 10)
  ;
  (fileItem._text):SetPosY(0)
  ;
  (fileItem._text):SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
  return fileItem
end

refreshFileList = function()
  -- function num : 0_11 , upvalues : combo_Ext, _fileExplorer, temp_ItemBase, frame_FileList, _currentFrame, swapFrame, static_FilePath, MakeFileItem, _itemYGap, _folder_textureInfo, list_Ext, _bDirectorySerch, _ext_arr, _current_ext_type
  local selectText = combo_Ext:GetSelectItem()
  if selectText == "None" then
    selectText = ""
  end
  local count = _fileExplorer:getCurrentFoloderFileList(selectText)
  local sizeY = temp_ItemBase:GetSizeY()
  local sizeX = frame_FileList:GetSizeX()
  local foldercount = _fileExplorer:getChildFolderList()
  ;
  (_currentFrame.frame):SetShow(false)
  ;
  (_currentFrame.scroll):SetControlPos(0)
  swapFrame()
  ;
  (_currentFrame.content):DestroyAllChild()
  ;
  (_currentFrame.frame):SetShow(true)
  static_FilePath:SetText(_fileExplorer:getCurrentFolderName())
  for index = 0, foldercount - 1 do
    local item = MakeFileItem("folder_" .. tostring(R12_PC54))
    -- DECOMPILER ERROR at PC61: Overwrote pending register: R12 in 'AssignReg'

    ;
    (item._item):SetPosY(R12_PC54)
    -- DECOMPILER ERROR at PC65: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC66: Overwrote pending register: R12 in 'AssignReg'

    ;
    (item._text):SetText(R12_PC54(R12_PC54, R14_PC68))
    ;
    (item._item):SetSize(sizeX, (item._item):GetSizeY())
    ;
    (item._item):SetShow(true)
    ;
    (item._icon):SetShow(true)
    ;
    (item._text):SetShow(true)
    local x1, y1, x2, y2 = setTextureUV_Func(item._icon, _folder_textureInfo.x, _folder_textureInfo.y, _folder_textureInfo.endX, _folder_textureInfo.endY)
    ;
    ((item._icon):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    (item._icon):setRenderTexture((item._icon):getBaseTexture())
    ;
    (item._item):addInputEvent("Mouse_LDClick", "goToChildFolderAtIndex(" .. R18_PC121 .. ")")
  end
  local selectType = list_Ext:GetSelectIndex()
  if selectType >= 0 then
    for index = 0, count - 1 do
      local item = MakeFileItem(tostring(index))
      if _bDirectorySerch then
        (item._item):SetPosY((foldercount + index) * sizeY + _itemYGap)
      else
        ;
        (item._item):SetPosY(index * sizeY + _itemYGap)
      end
      ;
      (item._text):SetTextMode((CppEnums.TextMode).eTextMode_LimitText)
      ;
      (item._text):SetText(_fileExplorer:getFileNameAtIndex(index))
      ;
      (item._item):SetSize(sizeX, (item._item):GetSizeY())
      ;
      (item._item):SetShow(true)
      ;
      (item._icon):SetShow(true)
      ;
      (item._text):SetShow(true)
      local x1, y1, x2, y2 = setTextureUV_Func(item._icon, ((_ext_arr[_current_ext_type])[selectType]).x, ((_ext_arr[_current_ext_type])[selectType]).y, ((_ext_arr[_current_ext_type])[selectType]).endX, ((_ext_arr[_current_ext_type])[selectType]).endY)
      ;
      ((item._icon):getBaseTexture()):setUV(x1, R18_PC121, x2, y2)
      -- DECOMPILER ERROR at PC222: Overwrote pending register: R18 in 'AssignReg'

      ;
      (item._icon):setRenderTexture((item._icon):getBaseTexture())
      ;
      (item._item):addInputEvent("Mouse_LUp", "ClickItem(" .. index .. ")")
    end
  end
  do
    ;
    (_currentFrame.frame):UpdateContentPos()
    ;
    (_currentFrame.frame):UpdateContentScroll()
  end
end

FileExplorer_SetDirectorySerch = function(bUse)
  -- function num : 0_12 , upvalues : _bDirectorySerch
  _bDirectorySerch = bUse
end

Toggle_ExtBox = function()
  -- function num : 0_13 , upvalues : combo_Ext
  combo_Ext:ToggleListbox()
end

FileExplorer_SetNameToBtn_Confirm = function(name)
  -- function num : 0_14 , upvalues : btn_Confirm
  btn_Confirm:SetText(name)
end

FileExplorer_CustomConfirmFunction = function(func)
  -- function num : 0_15 , upvalues : _btn_ConfirmFunction
  _btn_ConfirmFunction = func
end

FileExplorer_CustomCancelFunction = function(func)
  -- function num : 0_16 , upvalues : _btn_CancelFunction
  _btn_CancelFunction = func
end

FileExplorer_Confirm = function(index)
  -- function num : 0_17 , upvalues : _btn_ConfirmFunction, text_EditBox
  if _btn_ConfirmFunction == nil then
    return 
  end
  _btn_ConfirmFunction(text_EditBox:GetEditText())
end

closeExplorer = function()
  -- function num : 0_18 , upvalues : _isFileExplorerOpen, _btn_CancelFunction
  Panel_FileExplorer:SetShow(false)
  _isFileExplorerOpen = false
  ClearFocusEdit()
  if _btn_CancelFunction == nil then
    return 
  end
  _btn_CancelFunction()
end

FileExplorer_clearPrevPathList = function()
  -- function num : 0_19
  ClearPrevPathlist()
end

FileExplorer_SetEditText = function(text)
  -- function num : 0_20 , upvalues : text_EditBox
  text_EditBox:SetEditText(text)
end

FileExplorer_GetEditText = function()
  -- function num : 0_21 , upvalues : text_EditBox
  return text_EditBox:GetEditText()
end

goToParentFolder = function()
  -- function num : 0_22 , upvalues : _fileExplorer
  _fileExplorer:gotoParentPath()
  refreshFileList()
end

gotoPrevFolder = function()
  -- function num : 0_23 , upvalues : _fileExplorer
  _fileExplorer:gotoPrevPath()
  refreshFileList()
end

goToChildFolderAtIndex = function(index)
  -- function num : 0_24 , upvalues : _fileExplorer
  _fileExplorer:ClearPrevPathlist()
  _fileExplorer:gotoChildPathAtIndex(index)
  refreshFileList()
end

ClickItem = function(index)
  -- function num : 0_25 , upvalues : _fileExplorer, text_EditBox
  local FileName = _fileExplorer:getFileNameAtIndex(index)
  text_EditBox:SetEditText(FileName)
end

SlectExtListIndex = function()
  -- function num : 0_26 , upvalues : list_Ext, combo_Ext
  local selectIndex = list_Ext:GetSelectIndex()
  combo_Ext:SetSelectItemIndex(selectIndex)
  refreshFileList()
end

callOpenFunction = function(index)
  -- function num : 0_27 , upvalues : _openWithFunction, _fileExplorer
  closeExplorer()
  if _openWithFunction == nil then
    return 
  end
  local text = _fileExplorer:getCurrentPath()
  text = "" .. text .. "\\" .. _fileExplorer:getFileNameAtIndex(index)
  _openWithFunction(text)
end

FileExplorer_getTextFocusEdit = function()
  -- function num : 0_28 , upvalues : text_EditBox
  return text_EditBox:GetFocusEdit()
end

FileExplorer_IsOpen = function(...)
  -- function num : 0_29 , upvalues : _isFileExplorerOpen
  return _isFileExplorerOpen
end


