-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\tagcharacter\panel_window_tagcharacter.luac 

-- params : ...
-- function num : 0
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_Class = CppEnums.ClassType
local UI_DefaultFaceTexture = CppEnums.ClassType_DefaultFaceTexture
local PP = CppEnums.PAUIMB_PRIORITY
local ePcWorkingType = CppEnums.PcWorkType
local const_64 = Defines.s64_const
local TagCharacter = {_doTag = false}
PaGlobal_Request_TagCharacter = function(characterKey)
  -- function num : 0_0
  ToClient_RequestDuelCharacter(characterKey)
end

PaGlobal_Delete_TagCharacter = function(characterKey)
  -- function num : 0_1
  ToClient_RequestDeleteDuelCharacter(characterKey)
end

PaGlobal_IsTagChange = function()
  -- function num : 0_2 , upvalues : TagCharacter
  local retBool = TagCharacter._doTag
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  if TagCharacter._doTag == true then
    TagCharacter._doTag = false
  end
  return retBool
end

PaGlobal_TagCharacter_Change = function()
  -- function num : 0_3 , upvalues : TagCharacter
  local index = ToClient_GetMyDuelCharacterIndex()
  if index == -1 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_TAGCHAR_CANT_FIND_CHARACTER"))
    return 
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  TagCharacter._doTag = true
  Panel_GameExit_ChangeCharacter(index)
end


