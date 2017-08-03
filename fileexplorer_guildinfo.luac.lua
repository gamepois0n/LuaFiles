-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\fileexplorer\fileexplorer_guildinfo.luac 

-- params : ...
-- function num : 0
FromClient_OpenExplorer_GuildInfo = function(title, defaultName, paramList)
  -- function num : 0_0
  local paramCount = 0
  for key,value in pairs(paramList) do
    paramCount = paramCount + 1
  end
  do
    if paramCount ~= 0 or title ~= "" then
      return 
    end
    local filterType = {"bmp,jpg,png,gif,jpeg"}
    FileExplorer_Open(PAGetString(Defines.StringSheet_RESOURCE, "FILEEXPLORER_TITLE"), 0, filterType)
    FileExplorer_NotUseFilterComboBox(false)
    FileExplorer_setEditTextMaxInput(50)
    FileExplorer_CustomConfirmFunction(OnGuildInfoFunction)
    FileExplorer_CustomCancelFunction(closeFileSelectionRequest)
    refreshFileList()
  end
end

closeFileSelectionRequest = function()
  -- function num : 0_1
  FromClient_FinishiFileSelectionRequest()
end

OnGuildInfoFunction = function(text)
  -- function num : 0_2
  if text == "" then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATION_MESSAGEBOX_NONAME")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY"), content = messageBoxMemo, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
    return 
  end
  do
    local currentPath = FileExplorer_getCurrentPath()
    local fullPath = currentPath .. "\\" .. text
    if not isCorrectFile(text) then
      local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATION_MESSAGEBOX_LOAD_FAILED")
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
    else
      do
        FromClient_getExplorerData(fullPath)
        closeExplorer()
      end
    end
  end
end

registerEvent("FromClient_OpenExplorer", "FromClient_OpenExplorer_GuildInfo")

