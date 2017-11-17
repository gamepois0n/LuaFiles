-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\characterinfo\ui_characterinfo_basic_global.luac 

-- params : ...
-- function num : 0
local UI_Color = Defines.Color
FGlobal_UI_CharacterInfo_Basic_Global_CraftColorReplace = function(lev)
  -- function num : 0_0 , upvalues : UI_Color
  local levColor = UI_Color.C_FFC4C4C4
  if lev >= 1 and lev <= 10 then
    levColor = UI_Color.C_FFC4C4C4
  else
    if lev >= 11 and lev <= 20 then
      levColor = UI_Color.C_FF76B24D
    else
      if lev >= 21 and lev <= 30 then
        levColor = UI_Color.C_FF3B8BBE
      else
        if lev >= 31 and lev <= 40 then
          levColor = UI_Color.C_FFEBC467
        else
          if lev >= 41 and lev <= 50 then
            levColor = UI_Color.C_FFD04D47
          else
            if lev >= 51 and lev <= 80 then
              levColor = UI_Color.C_FFB23BC7
            else
              if lev >= 81 and lev <= 100 then
                levColor = UI_Color.C_FFC78045
              end
            end
          end
        end
      end
    end
  end
  return levColor
end

FGlobal_UI_CharacterInfo_Basic_Global_CraftLevelReplace = function(lev)
  -- function num : 0_1
  if lev >= 1 and lev <= 10 then
    lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_1") .. lev
  else
    if lev >= 11 and lev <= 20 then
      lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_2") .. lev - 10
    else
      if lev >= 21 and lev <= 30 then
        lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_3") .. lev - 20
      else
        if lev >= 31 and lev <= 40 then
          lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_4") .. lev - 30
        else
          if lev >= 41 and lev <= 50 then
            lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_5") .. lev - 40
          else
            if lev >= 51 and lev <= 80 then
              lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_6") .. lev - 50
            else
              if lev >= 81 and lev <= 100 then
                lev = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_CRAFTLEVEL_GROUP_7") .. lev - 80
              end
            end
          end
        end
      end
    end
  end
  return lev
end

FGlobal_UI_CharacterInfo_Basic_Global_CheckIntroduceUiEdit = function(targetUI)
  -- function num : 0_2
  do
    local self = PaGlobal_CharacterInfoBasic
    do return targetUI ~= nil and targetUI:GetKey() == ((self._ui)._multilineEdit):GetKey() end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end


