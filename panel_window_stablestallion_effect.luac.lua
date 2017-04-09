-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\servant\stable\panel_window_stablestallion_effect.luac 

-- params : ...
-- function num : 0
Panel_Window_StableStallion_Effect:SetShow(false)
local horseToehold = (UI.getChildControl)(Panel_Window_StableStallion_Effect, "Static_HorseToehold")
local awakenSuccess = (UI.getChildControl)(Panel_Window_StableStallion_Effect, "Static_AwakenSuccess")
local awakenFail = (UI.getChildControl)(Panel_Window_StableStallion_Effect, "Static_AwakenFail")
local limitEffect = false
local effectControl = {}
local controlCount = 0
StableStallion_AwakenEffect = function(isAwaken)
  -- function num : 0_0 , upvalues : horseToehold, awakenSuccess, awakenFail, limitEffect
  local index = 0
  if isAwaken == 0 then
    local randomIndexX = getRandomValue(0, 300)
    local randomIndexY = getRandomValue(0, 300)
    StableStallion_Effect(Panel_Window_StableStallion_Effect, 6, randomIndexX - 100, randomIndexY)
    return 
  else
    do
      if isAwaken == true then
        horseToehold:SetShow(true)
        awakenSuccess:SetShow(true)
        awakenFail:SetShow(false)
        horseToehold:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLESTALLION_TEXT_AWAKENSUCCESS"))
        if limitEffect == false then
          StableStallion_Effect(Panel_Window_StableStallion_Effect, 8, 0, 220)
          limitEffect = true
        end
        local randomIndexX = getRandomValue(0, 1600)
        local randomIndexY = getRandomValue(0, 1400)
        local randomEffect = getRandomValue(0, index)
        if randomEffect == 0 then
          StableStallion_Effect(Panel_Window_StableStallion_Effect, 7, randomIndexX - 800, randomIndexX - 500)
        else
          if randomEffect == 1 then
            StableStallion_Effect(Panel_Window_StableStallion_Effect, 6, randomIndexX - 800, randomIndexX - 500)
          end
        end
        index = 1
      else
        do
          horseToehold:SetShow(true)
          awakenSuccess:SetShow(false)
          awakenFail:SetShow(true)
          horseToehold:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLESTALLION_TEXT_AWAKENFAIL"))
          if limitEffect == false then
            Panel_Window_StableStallion_Effect:AddEffect("fUI_RedWar_Lose01", false, 0, 220)
            limitEffect = true
          end
          index = 10
        end
      end
    end
  end
end

StableStallion_Effect = function(control, index, posX, posY)
  -- function num : 0_1 , upvalues : effectControl, controlCount
  if index == 0 then
    control:AddEffect("fUI_Alchemy_UpgradeStart01", false, posX, posY)
  else
    if index == 1 then
      control:AddEffect("UI_ImperialLight", false, posX, posY)
    else
      if index == 2 then
        control:AddEffect("fCO_Egg_Random_01B", false, posX, posY)
      else
        if index == 3 then
          control:AddEffect("UI_NewSkill01", false, posX, posY)
        else
          if index == 4 then
            control:AddEffect("UI_QustComplete02", false, posX, posY)
          else
            if index == 5 then
              control:AddEffect("fCO_Egg_Random_01B", false, posX, posY)
            else
              if index == 6 then
                control:AddEffect("fUI_ImperialStart", false, posX, posY)
              else
                if index == 7 then
                  control:AddEffect("fUI_GoldenBell_01A", false, posX, posY)
                else
                  if index == 8 then
                    control:AddEffect("fUI_RedWar_Win01", false, posX, posY)
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  -- DECOMPILER ERROR at PC82: Confused about usage of register: R4 in 'UnsetPending'

  effectControl[controlCount] = control
  controlCount = controlCount + 1
end

StableStallion_EffectErase = function()
  -- function num : 0_2 , upvalues : controlCount, effectControl
  for i = 0, controlCount - 1 do
    (effectControl[i]):EraseAllEffect()
  end
end

StableStallion_EffectClose = function()
  -- function num : 0_3 , upvalues : awakenFail, awakenSuccess, horseToehold, limitEffect
  Panel_Window_StableStallion_Effect:SetShow(false)
  awakenFail:SetShow(false)
  awakenSuccess:SetShow(false)
  horseToehold:SetShow(false)
  limitEffect = false
end


