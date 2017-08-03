-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\fileexplorer\fileexplorer_customization.luac 

-- params : ...
-- function num : 0
OpenExplorerSaveCustomizing = function()
  -- function num : 0_0
  InitExplorerOption(PAGetString(Defines.StringSheet_RESOURCE, "FILEEXPLORER_TITLE"))
  FileExplorer_CustomConfirmFunction(SaveCustomData)
  refreshFileList()
end

OpenExplorerLoadCustomizing = function()
  -- function num : 0_1
  InitExplorerOption(PAGetString(Defines.StringSheet_RESOURCE, "FILEEXPLORER_TITLE"))
  FileExplorer_CustomConfirmFunction(LoadCustomData)
  refreshFileList()
end

InitExplorerOption = function(titleName)
  -- function num : 0_2
  local FilterType = {"None"}
  FileExplorer_Open(titleName, 0, FilterType)
  FileExplorerSetFilterBoxAtIndex(0)
  FileExplorerAddPathToCurrentPath("Customization")
  FileExplorer_NotUseFilterComboBox(false)
  FileExplorer_SetEditText("CustomizationData")
  FileExplorer_setEditTextMaxInput(100)
end

LoadCustomData = function(text)
  -- function num : 0_3
  if text == "" then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATION_MESSAGEBOX_NONAME")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY"), content = messageBoxMemo, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
    return 
  end
  do
    local loadPath = FileExplorer_getCurrentPath()
    if not isExistCustomizationFile(text, loadPath) then
      local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATION_MESSAGEBOX_LOAD_FAILED")
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
    else
      do
        local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATION_MESSAGEBOX_APPLY")
        do
          local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = LoadCustomYesBtn, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
          ;
          (MessageBox.showMessageBox)(messageBoxData)
          closeExplorer()
        end
      end
    end
  end
end

LoadCustomYesBtn = function()
  -- function num : 0_4
  local text = FileExplorer_GetEditText()
  local loadPath = FileExplorer_getCurrentPath()
  loadCustomizationData(text, loadPath)
end

SaveCustomData = function(text)
  -- function num : 0_5
  if text == "" then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATION_MESSAGEBOX_NONAME")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY"), content = messageBoxMemo, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
    return 
  end
  do
    local savePath = FileExplorer_getCurrentPath()
    if isExistCustomizationFile(text, savePath) then
      local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATION_MESSAGEBOX_SAVE")
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = SaveCustomYesBtn, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
    else
      do
        SaveCustomizationFile(text, savePath)
        closeExplorer()
      end
    end
  end
end

SaveCustomYesBtn = function()
  -- function num : 0_6
  local text = FileExplorer_GetEditText()
  local savePath = FileExplorer_getCurrentPath()
  SaveCustomizationFile(text, savePath)
end

SaveCustomizationFile = function(strFileName, savePath)
  -- function num : 0_7
  if not saveCustomizationData(strFileName, savePath) then
    local errorString = "" .. strFileName .. " - " .. PAGetString(Defines.StringSheet_SymbolNo, "eErrNoInvalidFileNameToSave")
    Event_MessageBox_NotifyMessage(errorString)
  end
end

FromClient_OnDownloadFromWeb_Customizing = function(path, filename)
  -- function num : 0_8
  if (string.find)(filename, ".bdc", -4) == nil then
    return 
  end
  loadCustomizationData(filename, path)
end

registerEvent("FromClient_OnDownloadFromWeb", "FromClient_OnDownloadFromWeb_Customizing")

