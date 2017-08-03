-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\changenickname\panel_change_nickname.luac 

-- params : ...
-- function num : 0
local UIMode = Defines.UIMode
local IM = CppEnums.EProcessorInputMode
local UI_TM = CppEnums.TextMode
Panel_ChangeNickname:SetShow(false, false)
Panel_ChangeNickname:setGlassBackground(true)
local changeName = {title = (UI.getChildControl)(Panel_ChangeNickname, "Static_Text_Title_Import"), desc = (UI.getChildControl)(Panel_ChangeNickname, "StaticText_1"), alert = (UI.getChildControl)(Panel_ChangeNickname, "StaticText_3"), defaultSizeY = 295}
local _nameType = nil
local changeNickname = {edit_Nickname = (UI.getChildControl)(Panel_ChangeNickname, "Edit_Nickname"), button_OK = (UI.getChildControl)(Panel_ChangeNickname, "Button_Apply_Import"), button_Cancel = (UI.getChildControl)(Panel_ChangeNickname, "Button_Cancel_Import")}
changeNickname.init = function(self)
  -- function num : 0_0 , upvalues : changeName, UI_TM
  ;
  (UI.ASSERT)(self.edit_Nickname ~= nil and type(self.edit_Nickname) ~= "number", "Edit_Nickname")
  ;
  (UI.ASSERT)(self.button_OK ~= nil and type(self.button_OK) ~= "number", "Button_Apply_Import")
  ;
  (UI.ASSERT)(self.button_Cancel ~= nil and type(self.button_Cancel) ~= "number", "Button_Cancel_Import")
  ;
  (changeName.desc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (changeName.alert):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self.button_OK):addInputEvent("Mouse_LUp", "handleClicked_ChangeNickname()")
  ;
  (self.button_Cancel):addInputEvent("Mouse_LUp", "ChangeNickname_Close()")
  ;
  (self.edit_Nickname):addInputEvent("Mouse_LUp", "handleClicked_ClickEdit()")
  registerEvent("FromClient_ShowChangeNickname", "FromClient_ShowChangeNickname")
  registerEvent("FromClient_ChangeName", "FromClient_ChangeName")
  -- DECOMPILER ERROR: 5 unprocessed JMP targets
end

handleClicked_ClickEdit = function()
  -- function num : 0_1 , upvalues : changeNickname, IM
  if not Panel_ChangeNickname:IsShow() then
    return 
  end
  local self = changeNickname
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  ;
  (self.edit_Nickname):SetMaxInput(getGameServiceTypeUserNickNameLength())
  SetFocusEdit(self.edit_Nickname)
end

handleClicked_ChangeNickname = function()
  -- function num : 0_2 , upvalues : changeNickname, _nameType
  local self = changeNickname
  local name = (self.edit_Nickname):GetEditText()
  local toClient_ChangeName = function()
    -- function num : 0_2_0 , upvalues : _nameType, name
    if _nameType == 0 then
      ToClient_RequestChangeCharacterName(name)
    else
      if _nameType == 1 then
        ToClient_RequestChangeGuildName(name)
      else
        if _nameType == 2 then
          ToClient_ChangeNickName(name)
        end
      end
    end
    ChangeNickname_Close()
  end

  local changeType = ""
  if _nameType == 0 then
    changeType = PAGetString(Defines.StringSheet_GAME, "LUA_NAMECHANGE_10")
  else
    if _nameType == 1 then
      changeType = PAGetString(Defines.StringSheet_GAME, "LUA_NAMECHANGE_11")
    else
      if _nameType == 2 then
        changeType = PAGetString(Defines.StringSheet_GAME, "LUA_NAMECHANGE_12")
      end
    end
  end
  local messageBoxMemo = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_NAMECHANGE_13", "changeType", changeType, "name", name)
  local messageBoxData = {title = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NAMECHANGE_14", "changeType", changeType), content = messageBoxMemo, functionYes = toClient_ChangeName, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

FromClient_ChangeName = function()
  -- function num : 0_3 , upvalues : _nameType
  if _nameType == 2 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_NAMECHANGE_15"))
  else
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_NAMECHANGE_1"))
  end
end

FromClient_ShowChangeNickname = function(param)
  -- function num : 0_4 , upvalues : _nameType, changeName, IM, changeNickname
  if Panel_ChangeNickname:GetShow() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_NAMECHANGE_2"))
    return 
  end
  _nameType = param
  local self = changeName
  if _nameType == 0 then
    (self.title):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NAMECHANGE_3"))
    ;
    (self.desc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NAMECHANGE_4"))
    ;
    (self.alert):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NAMECHANGE_5"))
  else
    if _nameType == 1 then
      local isGuildMaster = ((getSelfPlayer()):get()):isGuildMaster()
      if not isGuildMaster then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_NAMECHANGE_6"))
        return 
      end
      ;
      (self.title):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NAMECHANGE_7"))
      ;
      (self.desc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NAMECHANGE_8"))
      ;
      (self.alert):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NAMECHANGE_9"))
    else
      do
        if _nameType == 2 then
          (self.title):SetText(PAGetString(Defines.StringSheet_RESOURCE, "UI_CHANGE_NICKNAME_TITLE"))
          ;
          (self.desc):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_NICKNAME_NOTIFY_1"))
          ;
          (self.alert):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NICKNAME_NOTIFY_3"))
        end
        self:PanelResize_ByFontSize(_nameType)
        Panel_ChangeNickname:SetShow(true)
        ;
        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
        ;
        (changeNickname.edit_Nickname):SetEditText("")
        ;
        (changeNickname.edit_Nickname):SetMaxInput(getGameServiceTypeUserNickNameLength())
        SetFocusEdit(changeNickname.edit_Nickname)
      end
    end
  end
end

ChangeNickname_Close = function()
  -- function num : 0_5 , upvalues : changeNickname, IM
  local self = changeNickname
  ;
  (self.edit_Nickname):SetEditText("")
  if Panel_ChangeNickname:GetShow() then
    Panel_ChangeNickname:SetShow(false)
    ClearFocusEdit()
    if AllowChangeInputMode() then
      if check_ShowWindow() then
        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
      else
        ;
        (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
      end
    else
      SetFocusChatting()
    end
  end
end

changeNickname:init()
changeName.PanelResize_ByFontSize = function(self, _nameType)
  -- function num : 0_6
  local basePosY = 140
  if (ToClient_getGameOptionControllerWrapper()):getUIFontSizeType() > 0 then
    (self.alert):SetPosY(basePosY - 20)
  else
    if _nameType == 2 then
      (self.alert):SetPosY(basePosY + 5)
    else
      ;
      (self.alert):SetPosY(basePosY)
    end
  end
end


