-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\righttopicons\panel_personalicon_hunting.luac 

-- params : ...
-- function num : 0
local _btn_HuntingAlert = FGlobal_GetPersonalIconControl(3)
local _huntingPlus = FGlobal_GetPersonalText(3)
_btn_HuntingAlert:ActiveMouseEventEffect(true)
_btn_HuntingAlert:setGlassBackground(true)
local msg = {name, desc}
WhaleConditionCheck = function()
  -- function num : 0_0 , upvalues : msg, _huntingPlus
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  msg.name = ""
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R0 in 'UnsetPending'

  msg.desc = ""
  local whaleCount = ToClient_worldmapActorManagerGetActorRegionList(2)
  if whaleCount > 0 then
    for index = 0, whaleCount - 1 do
      local areaName = ToClient_worldmapActorManagerGetActorRegionByIndex(index)
      local count = ToClient_worldmapActorManagerGetActorCountByIndex(index)
      -- DECOMPILER ERROR at PC38: Confused about usage of register: R7 in 'UnsetPending'

      if areaName ~= nil then
        if index == 0 then
          msg.desc = msg.desc .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_WHALE_FIND", "areaName", tostring(areaName), "count", count)
        else
          -- DECOMPILER ERROR at PC56: Confused about usage of register: R7 in 'UnsetPending'

          msg.desc = msg.desc .. "\n" .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_WHALE_FIND", "areaName", tostring(areaName), "count", count)
        end
      end
    end
    -- DECOMPILER ERROR at PC64: Confused about usage of register: R1 in 'UnsetPending'

    msg.name = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_WHALE_FIND_NAME")
    _huntingPlus:SetShow(true)
  end
  local gargoyleCount = ToClient_worldmapActorManagerGetActorRegionList(3)
  if gargoyleCount > 0 then
    for index = 0, gargoyleCount - 1 do
      local areaName = ToClient_worldmapActorManagerGetActorRegionByIndex(index)
      local count = ToClient_worldmapActorManagerGetActorCountByIndex(index)
      -- DECOMPILER ERROR at PC106: Confused about usage of register: R8 in 'UnsetPending'

      if areaName ~= nil then
        if index == 0 then
          if whaleCount > 0 then
            msg.desc = msg.desc .. "\n" .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_HUNTING_GARGOYLE", "areaName", tostring(areaName), "count", count)
          else
            -- DECOMPILER ERROR at PC123: Confused about usage of register: R8 in 'UnsetPending'

            msg.desc = msg.desc .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_HUNTING_GARGOYLE", "areaName", tostring(areaName), "count", count)
          end
        else
          -- DECOMPILER ERROR at PC141: Confused about usage of register: R8 in 'UnsetPending'

          msg.desc = msg.desc .. "\n" .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_HUNTING_GARGOYLE", "areaName", tostring(areaName), "count", count)
        end
      end
    end
    -- DECOMPILER ERROR at PC149: Confused about usage of register: R2 in 'UnsetPending'

    msg.name = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_WHALE_FIND_NAME")
    _huntingPlus:SetShow(true)
  end
  -- DECOMPILER ERROR at PC163: Confused about usage of register: R2 in 'UnsetPending'

  if gargoyleCount + whaleCount == 0 then
    msg.name = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_WHALE")
    -- DECOMPILER ERROR at PC170: Confused about usage of register: R2 in 'UnsetPending'

    msg.desc = PAGetString(Defines.StringSheet_GAME, "LUA_MOVIEGUIDE_WHALE_NOT_FIND")
    _huntingPlus:SetShow(false)
  end
end

Hunting_ToolTip_ShowToggle = function(isShow)
  -- function num : 0_1 , upvalues : _btn_HuntingAlert, msg
  WhaleConditionCheck()
  if isShow == false then
    TooltipSimple_Hide()
    return 
  end
  TooltipSimple_Show(_btn_HuntingAlert, msg.name, msg.desc)
end

FGlobal_WhaleConditionCheck = function()
  -- function num : 0_2 , upvalues : _btn_HuntingAlert
  if _btn_HuntingAlert:GetShow() then
    WhaleConditionCheck()
  end
end

WhaleConditionCheck()

