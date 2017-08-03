-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\stable\panel_window_stablestallion_effect.luac 

-- params : ...
-- function num : 0
Panel_Window_StableStallion_Effect:SetShow(false)
local horseToehold = (UI.getChildControl)(Panel_Window_StableStallion_Effect, "Static_HorseToehold")
local awakenSuccess = (UI.getChildControl)(Panel_Window_StableStallion_Effect, "Static_AwakenSuccess")
local awakenFail = (UI.getChildControl)(Panel_Window_StableStallion_Effect, "Static_AwakenFail")
local effectControl = {}
local controlCount = 0
StableStallion_AwakenEffect = function(isAwaken, servantKey)
  -- function num : 0_0 , upvalues : horseToehold, awakenFail, awakenSuccess
  if isAwaken == 0 then
    StableStallion_Effect(Panel_Window_StableStallion_Effect, 6, 0, 220, servantKey)
    return 
  else
    if isAwaken == true then
      horseToehold:SetShow(true)
      awakenFail:SetShow(false)
      horseToehold:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLESTALLION_TEXT_AWAKENSUCCESS"))
      StableStallion_Effect(Panel_Window_StableStallion_Effect, 7, 0, 220, servantKey)
    else
      horseToehold:SetShow(true)
      awakenSuccess:SetShow(false)
      horseToehold:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLESTALLION_TEXT_AWAKENFAIL"))
      StableStallion_Effect(Panel_Window_StableStallion_Effect, 12, 0, 220, servantKey)
    end
  end
end

StableStallion_doAwakenEffect = function()
  -- function num : 0_1
  StableStallion_Effect(Panel_Window_StableStallion_Effect, 13, 0, -190)
end

StableStallion_Effect = function(control, index, posX, posY, servantKey)
  -- function num : 0_2 , upvalues : effectControl, controlCount
  if index == 0 then
    control:AddEffect("fUI_Alchemy_UpgradeStart01", false, posX, posY)
  else
  end
  if index ~= 1 or index == 2 then
    control:AddEffect("fCO_Egg_Random_01B", false, posX, posY)
  else
    if index == 3 then
      control:AddEffect("UI_NewSkill01", false, posX, posY)
      control:AddEffect("fUI_Horse_Upgrade_02A", false, posX, posY)
    else
      if index == 4 then
        control:AddEffect("fUI_Horse_Upgrade_03A", false, posX, posY)
      else
        if index == 5 then
          control:AddEffect("fUI_Horse_Upgrade_04A", false, posX, posY)
        else
          if index == 6 then
            control:AddEffect("fUI_Horse_Upgrade_05B", false, posX, posY)
          else
            if index == 7 then
              if servantKey == 9989 or servantKey == 9889 then
                control:AddEffect("fUI_Horse_Upgrade_06B", false, posX, posY)
              else
                if servantKey == 9988 or servantKey == 9888 then
                  control:AddEffect("fUI_Horse_Upgrade_06C", false, posX, posY)
                else
                  if servantKey == 9987 or servantKey == 9887 then
                    control:AddEffect("fUI_Horse_Upgrade_06B", false, posX, posY)
                  end
                end
              end
            else
            end
          end
        end
      end
    end
  end
  if index ~= 8 or index == 9 then
    control:AddEffect("fUI_Horse_Upgrade_01A", false, posX, posY)
    control:AddEffect("CO_UI_Horse_Upgrade_01A", false, posX, posY)
  else
    if index == 10 then
      control:AddEffect("fUI_Horse_Upgrade_01B", false, posX, posY)
      control:AddEffect("CO_UI_Horse_Upgrade_01B", false, posX, posY)
    else
      if index == 11 then
        control:AddEffect("fUI_Horse_Upgrade_01C", false, posX, posY)
        control:AddEffect("CO_UI_Horse_Upgrade_01C", false, posX, posY)
      else
        if index == 12 then
          control:AddEffect("fUI_Horse_Upgrade_06A", false, posX, posY)
        else
          if index == 13 then
            control:AddEffect("fUI_Horse_Upgrade_05A", false, posX, posY)
          end
        end
      end
    end
  end
  -- DECOMPILER ERROR at PC165: Confused about usage of register: R5 in 'UnsetPending'

  effectControl[controlCount] = control
  controlCount = controlCount + 1
end

StableStallion_EffectErase = function()
  -- function num : 0_3 , upvalues : controlCount, effectControl
  for i = 0, controlCount - 1 do
    (effectControl[i]):EraseAllEffect()
  end
end

StableStallion_EffectClose = function()
  -- function num : 0_4 , upvalues : awakenFail, awakenSuccess, horseToehold
  Panel_Window_StableStallion_Effect:SetShow(false)
  awakenFail:SetShow(false)
  awakenSuccess:SetShow(false)
  horseToehold:SetShow(false)
  limitEffect = false
end


