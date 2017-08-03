-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\chatting\panel_chatting_macro.luac 

-- params : ...
-- function num : 0
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local StyleUI = {_c_macroBG = (UI.getChildControl)(Panel_Chatting_Macro, "Static_C_MacroBG"), _c_macroKey = (UI.getChildControl)(Panel_Chatting_Macro, "StaticText_C_MacroKey"), _c_btn_Normal = (UI.getChildControl)(Panel_Chatting_Macro, "Button_C_Normal"), _c_btn_Party = (UI.getChildControl)(Panel_Chatting_Macro, "Button_C_Party"), _c_btn_Guild = (UI.getChildControl)(Panel_Chatting_Macro, "Button_C_Guild"), _c_btn_World = (UI.getChildControl)(Panel_Chatting_Macro, "Button_C_World"), _c_btn_WorldWithItem = (UI.getChildControl)(Panel_Chatting_Macro, "Button_C_WorldWithItem"), _c_edit_InputMacro = (UI.getChildControl)(Panel_Chatting_Macro, "Edit_C_InputMacro")}
Panel_Chatting_Macro:RegisterShowEventFunc(true, "Panel_Chatting_Macro_ShowAni()")
Panel_Chatting_Macro:RegisterShowEventFunc(false, "Panel_Chatting_Macro_HideAni()")
local macroCount = 10
local macroChatTypeCount = 5
local maxEditInput = 100
if isGameTypeKorea() then
  macroChatTypeCount = 5
else
  if isGameTypeJapan() then
    macroChatTypeCount = 5
  else
    macroChatTypeCount = 4
  end
end
local startPosY = 7
local ChatMacro = {
_chatType = {}
, 
_buttonChatType = {}
, 
_editChatMessage = {}
}
local currentInputEditIndex = -1
Panel_Chatting_Macro_ShowAni = function()
  -- function num : 0_0
  Panel_Chatting_Macro:SetAlpha(0)
  ;
  (UIAni.AlphaAnimation)(1, Panel_Chatting_Macro, 0, 0.2)
end

Panel_Chatting_Macro_HideAni = function()
  -- function num : 0_1
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_Chatting_Macro, 0, 0.2)
  aniInfo:SetHideAtEnd(true)
end

ChatMacro.initialize = function(self)
  -- function num : 0_2 , upvalues : macroCount, UI_PUCT, StyleUI, startPosY, ChatMacro, maxEditInput
  local ui = {}
  for idx = 0, macroCount - 1 do
    ui._macroBG = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_Chatting_Macro, "Static_MacroBG_" .. idx)
    CopyBaseProperty(StyleUI._c_macroBG, ui._macroBG)
    ;
    (ui._macroBG):SetShow(true)
    ;
    (ui._macroBG):SetPosY(startPosY + idx * 32)
    ui._macroKey = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, ui._macroBG, "StaticText_MacroKey_" .. idx)
    CopyBaseProperty(StyleUI._c_macroKey, ui._macroKey)
    ;
    (ui._macroKey):SetShow(true)
    ;
    (ui._macroKey):SetPosX(5)
    if idx < 9 then
      (ui._macroKey):SetText(PAGetString(Defines.StringSheet_GAME, "InputCustomizer_Alt") .. "+" .. PAGetString(Defines.StringSheet_GAME, "InputCustomizer_Shift") .. "+" .. idx + 1)
    else
      if idx == 9 then
        (ui._macroKey):SetText(PAGetString(Defines.StringSheet_GAME, "InputCustomizer_Alt") .. "+" .. PAGetString(Defines.StringSheet_GAME, "InputCustomizer_Shift") .. "+0")
      end
    end
    -- DECOMPILER ERROR at PC103: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (ChatMacro._buttonChatType)[idx] = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, ui._macroBG, "Button_Normal_" .. idx)
    CopyBaseProperty(StyleUI._c_btn_Normal, (ChatMacro._buttonChatType)[idx])
    ;
    ((ChatMacro._buttonChatType)[idx]):SetShow(true)
    ;
    ((ChatMacro._buttonChatType)[idx]):addInputEvent("Mouse_LUp", "HandleClicked_ChatMacroType(" .. idx .. ")")
    -- DECOMPILER ERROR at PC138: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (ChatMacro._editChatMessage)[idx] = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_EDIT, ui._macroBG, "Edit_InputMacro_" .. idx)
    CopyBaseProperty(StyleUI._c_edit_InputMacro, (ChatMacro._editChatMessage)[idx])
    ;
    ((ChatMacro._editChatMessage)[idx]):SetShow(true)
    -- DECOMPILER ERROR at PC154: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (ChatMacro._chatType)[idx] = 0
    ;
    ((ChatMacro._editChatMessage)[idx]):SetMaxInput(maxEditInput)
    ;
    ((ChatMacro._editChatMessage)[idx]):addInputEvent("Mouse_LDown", "HandleClicked_ChatMacroInputEdit(" .. idx .. ")")
    if isGameTypeKorea() then
      Panel_Chatting_Macro:SetSize(370, 355)
      ;
      (StyleUI._c_macroBG):SetSize(360, 30)
      ;
      (ui._macroBG):SetSize(360, 30)
      ;
      (StyleUI._c_macroBG):SetPosX(5)
      ;
      (ui._macroBG):SetPosX(5)
      ;
      (StyleUI._c_btn_Normal):SetPosX(80)
      ;
      (StyleUI._c_btn_Party):SetPosX(80)
      ;
      (StyleUI._c_btn_Guild):SetPosX(80)
      ;
      (StyleUI._c_btn_World):SetPosX(80)
      ;
      (StyleUI._c_btn_WorldWithItem):SetPosX(80)
      ;
      ((ChatMacro._editChatMessage)[idx]):SetPosX(140)
    else
      if isGameTypeTaiwan() then
        Panel_Chatting_Macro:SetSize(370, 355)
        ;
        (StyleUI._c_macroBG):SetSize(360, 30)
        ;
        (ui._macroBG):SetSize(360, 30)
        ;
        (StyleUI._c_macroBG):SetPosX(5)
        ;
        (ui._macroBG):SetPosX(5)
        ;
        (StyleUI._c_btn_Normal):SetPosX(80)
        ;
        (StyleUI._c_btn_Party):SetPosX(80)
        ;
        (StyleUI._c_btn_Guild):SetPosX(80)
        ;
        (StyleUI._c_btn_World):SetPosX(80)
        ;
        (StyleUI._c_btn_WorldWithItem):SetPosX(80)
        ;
        ((ChatMacro._editChatMessage)[idx]):SetPosX(140)
      else
        Panel_Chatting_Macro:SetSize(370, 355)
        ;
        (StyleUI._c_macroBG):SetSize(360, 30)
        ;
        (ui._macroBG):SetSize(360, 30)
        ;
        (StyleUI._c_macroBG):SetPosX(5)
        ;
        (ui._macroBG):SetPosX(5)
        ;
        (StyleUI._c_btn_Normal):SetPosX(80)
        ;
        (StyleUI._c_btn_Party):SetPosX(80)
        ;
        (StyleUI._c_btn_Guild):SetPosX(80)
        ;
        (StyleUI._c_btn_World):SetPosX(80)
        ;
        (StyleUI._c_btn_WorldWithItem):SetPosX(80)
        ;
        ((ChatMacro._editChatMessage)[idx]):SetPosX(140)
      end
    end
  end
  Panel_Chatting_Macro:RemoveControl(StyleUI._c_macroBG)
  Panel_Chatting_Macro:RemoveControl(StyleUI._c_macroKey)
  Panel_Chatting_Macro:RemoveControl(StyleUI._c_edit_InputMacro)
  ;
  (StyleUI._c_btn_Normal):SetShow(false)
  ;
  (StyleUI._c_btn_Party):SetShow(false)
  ;
  (StyleUI._c_btn_Guild):SetShow(false)
  ;
  (StyleUI._c_btn_World):SetShow(false)
  ;
  (StyleUI._c_btn_WorldWithItem):SetShow(false)
end

HandleClicked_ChatMacroType = function(index)
  -- function num : 0_3 , upvalues : ChatMacro, macroChatTypeCount, StyleUI
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  (ChatMacro._chatType)[index] = (ChatMacro._chatType)[index] + 1
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  if macroChatTypeCount <= (ChatMacro._chatType)[index] then
    (ChatMacro._chatType)[index] = 0
  end
  local copyUI = StyleUI._c_btn_Normal
  if (ChatMacro._chatType)[index] == 1 then
    copyUI = StyleUI._c_btn_Party
  else
    if (ChatMacro._chatType)[index] == 2 then
      copyUI = StyleUI._c_btn_Guild
    else
      if (ChatMacro._chatType)[index] == 3 then
        copyUI = StyleUI._c_btn_World
      else
        if (ChatMacro._chatType)[index] == 4 then
          copyUI = StyleUI._c_btn_WorldWithItem
        end
      end
    end
  end
  CopyBaseProperty(copyUI, (ChatMacro._buttonChatType)[index])
  ;
  ((ChatMacro._buttonChatType)[index]):SetShow(true)
end

HandleClicked_ChatMacroInputEdit = function(index)
  -- function num : 0_4 , upvalues : currentInputEditIndex
  currentInputEditIndex = index
  ;
  (UI.Set_ProcessorInputMode)((CppEnums.EProcessorInputMode).eProcessorInputMode_ChattingInputMode)
end

ChatMacro.update = function(self)
  -- function num : 0_5 , upvalues : macroCount, StyleUI
  for index = 0, macroCount - 1 do
    local text = ToClient_getMacroChatMessage(index)
    ;
    ((self._editChatMessage)[index]):SetEditText(text)
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._chatType)[index] = ToClient_getMacroChatType(index)
    local copyUI = StyleUI._c_btn_Normal
    if (self._chatType)[index] == 1 then
      copyUI = StyleUI._c_btn_Party
    else
      if (self._chatType)[index] == 2 then
        copyUI = StyleUI._c_btn_Guild
      else
        if (self._chatType)[index] == 3 then
          copyUI = StyleUI._c_btn_World
        else
          if (self._chatType)[index] == 4 then
            copyUI = StyleUI._c_btn_WorldWithItem
          end
        end
      end
    end
    CopyBaseProperty(copyUI, (self._buttonChatType)[index])
    ;
    ((self._buttonChatType)[index]):SetShow(true)
  end
end

ChatMacro.saveMacro = function(self)
  -- function num : 0_6 , upvalues : macroCount
  for index = 0, macroCount - 1 do
    ToClient_SetChatMacro(index, (self._chatType)[index], ((self._editChatMessage)[index]):GetEditText())
  end
  ToClient_SaveChatMacro()
end

ChatMacro:initialize()
FGlobal_Chatting_Macro_ShowToggle = function()
  -- function num : 0_7 , upvalues : ChatMacro
  if Panel_Chatting_Macro:IsShow() then
    ChatMacro:saveMacro()
    Panel_Chatting_Macro:SetShow(false, true)
    FGlobal_Chatting_Macro_SetCHK(false)
    ChatInput_Show()
  else
    if Panel_Chat_SocialMenu:GetShow() then
      Panel_Chat_SocialMenu:SetShow(false)
      Panel_Chatting_Macro:SetShow(true, true)
      ChatMacro:update()
    else
      Panel_Chatting_Macro:SetShow(true, true)
      ChatMacro:update()
    end
  end
  Panel_Chatting_Macro:SetPosY(Panel_Chatting_Input:GetPosY() - Panel_Chatting_Macro:GetSizeY() - 5)
  Panel_Chatting_Macro:SetPosX(Panel_Chatting_Input:GetSizeX() + Panel_Chatting_Input:GetPosX())
end

ChatMacro_CheckCurrentUiEdit = function(targetUI)
  -- function num : 0_8 , upvalues : currentInputEditIndex, ChatMacro
  if currentInputEditIndex == -1 then
    return false
  end
  do return targetUI ~= nil and targetUI:GetKey() == ((ChatMacro._editChatMessage)[currentInputEditIndex]):GetKey() end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end


