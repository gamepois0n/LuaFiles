-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\guild\frame_guild_notice.luac 

-- params : ...
-- function num : 0
local UI_TM = CppEnums.TextMode
local UI_color = Defines.Color
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local IM = CppEnums.EProcessorInputMode
local defaultFrameBG_Notice = (UI.getChildControl)(Panel_Window_Guild, "Static_Frame_NoticeBG")
local _frame_Notice = (UI.getChildControl)(Panel_Guild_Notice, "Static_NoticeFrame_BG")
local ui_Notice = {_main_Notice = (UI.getChildControl)(Panel_Guild_Notice, "StaticText_M_Notice"), _main_Comment = (UI.getChildControl)(Panel_Guild_Notice, "StaticText_M_Comment"), _edit_Notice = (UI.getChildControl)(Panel_Guild_Notice, "Edit_Notice"), _edit_Comment = (UI.getChildControl)(Panel_Guild_Notice, "Edit_Comment"), _txt_noticeHelp = (UI.getChildControl)(Panel_Guild_Notice, "StaticText_Notice_Help"), _btn_NoticeConfirm = (UI.getChildControl)(Panel_Guild_Notice, "Button_Notice_Confirm"), _btn_CommentConfirm = (UI.getChildControl)(Panel_Guild_Notice, "Button_Comment_Confirm"), _comment_ID = (UI.getChildControl)(Panel_Guild_Notice, "StaticText_C_ID"), _comment_Comment = (UI.getChildControl)(Panel_Guild_Notice, "StaticText_C_Comment"), _comment_Scroll = (UI.getChildControl)(Panel_Guild_Notice, "VerticalScroll")}
defaultFrameBG_Notice:MoveChilds(defaultFrameBG_Notice:GetID(), Panel_Guild_Notice)
deletePanel(Panel_Guild_Notice:GetID())
;
(ui_Notice._btn_NoticeConfirm):SetShow(false)
saved_Guild_Frame_Notice = _frame_Notice
guildNotice_NoticeInputMode = function()
  -- function num : 0_0 , upvalues : IM
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
end

guildNotice_CommentInputMode = function()
  -- function num : 0_1 , upvalues : IM
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
end

guildNotice_Output = function()
  -- function num : 0_2 , upvalues : IM
  ClearFocusEdit()
  if AllowChangeInputMode() then
    if (UI.checkShowWIndow)() then
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    else
      ;
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
    end
  else
    SetFocusChatting()
  end
end

guildNotice_GetComment_Update = function()
  -- function num : 0_3
end

guild_GuildNotice_Show = function(isShow)
  -- function num : 0_4 , upvalues : defaultFrameBG_Notice
  if isShow == true then
    defaultFrameBG_Notice:SetShow(true)
  else
    defaultFrameBG_Notice:SetShow(false)
  end
end

;
(ui_Notice._edit_Notice):addInputEvent("Mouse_LUp", "guildNotice_NoticeInputMode()")
;
(ui_Notice._edit_Comment):addInputEvent("Mouse_LUp", "guildNotice_CommentInputMode()")

