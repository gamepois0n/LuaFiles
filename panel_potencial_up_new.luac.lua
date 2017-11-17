-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\potencialup\panel_potencial_up_new.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_AV = CppEnums.PA_UI_ALIGNVERTICAL
local UI_TT = CppEnums.PAUI_TEXTURE_TYPE
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
Panel_Potencial_Up:SetShow(false, false)
Panel_Potencial_Up:setGlassBackground(true)
Panel_Potencial_Up:SetSize(getScreenSizeX(), Panel_Potencial_Up:GetSizeY())
Panel_Potencial_Up:ComputePos()
Panel_Potencial_Up:RegisterShowEventFunc(true, "Potencial_UpShowAni()")
Panel_Potencial_Up:RegisterShowEventFunc(false, "Potencial_UpHideAni()")
local Poten_UI = {_arcText = (UI.getChildControl)(Panel_Potencial_Up, "ArchiveText"), _titleText = (UI.getChildControl)(Panel_Potencial_Up, "TitleText"), _iconBack = (UI.getChildControl)(Panel_Potencial_Up, "IconBack"), _iconImage = (UI.getChildControl)(Panel_Potencial_Up, "IconSlot"), _iconEtc = (UI.getChildControl)(Panel_Potencial_Up, "IconEtc"), _iconGrade = (UI.getChildControl)(Panel_Potencial_Up, "IconGrade"), _attackSpeedText = (UI.getChildControl)(Panel_Potencial_Up, "StaticText_Potencial_AttackSpeed"), _castingSpeedText = (UI.getChildControl)(Panel_Potencial_Up, "StaticText_Potencial_CastingSpeed"), _moveSpeedText = (UI.getChildControl)(Panel_Potencial_Up, "StaticText_Potencial_MoveSpeed"), _criticalRateText = (UI.getChildControl)(Panel_Potencial_Up, "StaticText_Potencial_CriticalRate"), _fishingRateText = (UI.getChildControl)(Panel_Potencial_Up, "StaticText_Potencial_FishingRate"), _gatheringRateText = (UI.getChildControl)(Panel_Potencial_Up, "StaticText_Potencial_GatheringRate"), _dropItemRateText = (UI.getChildControl)(Panel_Potencial_Up, "StaticText_Potencial_DropItemRate")}
Poten_Resize = function()
  -- function num : 0_0 , upvalues : Poten_UI
  for _,control in pairs(Poten_UI) do
    control:ComputePos()
  end
end

local titleTable = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_KIND_1"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_KIND_2"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_KIND_3"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_KIND_4"), [4] = PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_KIND_5"), [5] = PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_KIND_6"), [6] = PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_KIND_7")}
local currentPotencial = {}
local maxPotencial = {}
local _titleText = {}
local _potenText = {}
local _potenProgress = {}
local currTime = 0
local potenMaxNo = 7
Potencial_UpShowAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_TT
  Panel_Potencial_Up:ChangeSpecialTextureInfoName("new_ui_common_forlua/Default/Mask_MidHorizon.dds")
  local FadeMaskAni = Panel_Potencial_Up:addTextureUVAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  FadeMaskAni:SetTextureType(UI_TT.PAUI_TEXTURE_TYPE_MASK)
  FadeMaskAni:SetStartUV(0, 0, 0)
  FadeMaskAni:SetEndUV(0.6, 0, 0)
  FadeMaskAni:SetStartUV(1, 0, 1)
  FadeMaskAni:SetEndUV(0.4, 0, 1)
  FadeMaskAni:SetStartUV(0, 1, 2)
  FadeMaskAni:SetEndUV(0.6, 1, 2)
  FadeMaskAni:SetStartUV(1, 1, 3)
  FadeMaskAni:SetEndUV(0.4, 1, 3)
  FadeMaskAni.IsChangeChild = true
end

Potencial_UpHideAni = function()
  -- function num : 0_2
  (UIAni.closeAni)(Panel_Potencial_Up)
end

Current_Poten_Update = function()
  -- function num : 0_3 , upvalues : currentPotencial
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local playerGet = player:get()
  local UI_classType = CppEnums.ClassType
  local potentialType = {move = 0, attack = 1, cast = 2, levelText = PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TEXT_POTENLEVEL")}
  local currentAttackSpeedPoint = player:characterStatPointSpeed(potentialType.attack)
  local limitAttackSpeedPoint = player:characterStatPointLimitedSpeed(potentialType.attack)
  if limitAttackSpeedPoint < currentAttackSpeedPoint then
    currentAttackSpeedPoint = limitAttackSpeedPoint
  end
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R6 in 'UnsetPending'

  currentPotencial[0] = currentAttackSpeedPoint - 5
  local currentCastingSpeedPoint = player:characterStatPointSpeed(potentialType.cast)
  local limitCastingSpeedPoint = player:characterStatPointLimitedSpeed(potentialType.cast)
  if limitCastingSpeedPoint < currentCastingSpeedPoint then
    currentCastingSpeedPoint = limitCastingSpeedPoint
  end
  -- DECOMPILER ERROR at PC42: Confused about usage of register: R8 in 'UnsetPending'

  currentPotencial[1] = currentCastingSpeedPoint - 5
  local currentMoveSpeedPoint = player:characterStatPointSpeed(potentialType.move)
  local limitMoveSpeedPoint = player:characterStatPointLimitedSpeed(potentialType.move)
  if limitMoveSpeedPoint < currentMoveSpeedPoint then
    currentMoveSpeedPoint = limitMoveSpeedPoint
  end
  -- DECOMPILER ERROR at PC54: Confused about usage of register: R10 in 'UnsetPending'

  currentPotencial[2] = currentMoveSpeedPoint - 5
  local currentCriticalRatePoint = player:characterStatPointCritical()
  local limitCriticalRatePoint = player:characterStatPointLimitedCritical()
  if limitCriticalRatePoint < currentCriticalRatePoint then
    currentCriticalRatePoint = limitCriticalRatePoint
  end
  -- DECOMPILER ERROR at PC63: Confused about usage of register: R12 in 'UnsetPending'

  currentPotencial[3] = currentCriticalRatePoint
  local currentFishingRatePoint = player:getCharacterStatPointFishing()
  local limitFishingRatePoint = player:getCharacterStatPointLimitedFishing()
  if limitFishingRatePoint < currentFishingRatePoint then
    currentFishingRatePoint = limitFishingRatePoint
  end
  -- DECOMPILER ERROR at PC72: Confused about usage of register: R14 in 'UnsetPending'

  currentPotencial[4] = currentFishingRatePoint
  local currentProductRatePoint = player:getCharacterStatPointCollection()
  local limitProductRatePoint = player:getCharacterStatPointLimitedCollection()
  if limitProductRatePoint < currentProductRatePoint then
    currentProductRatePoint = limitProductRatePoint
  end
  -- DECOMPILER ERROR at PC81: Confused about usage of register: R16 in 'UnsetPending'

  currentPotencial[5] = currentProductRatePoint
  local currentDropItemRatePoint = player:getCharacterStatPointDropItem()
  local limitDropItemRatePoint = player:getCharacterStatPointLimitedDropItem()
  if limitDropItemRatePoint < currentDropItemRatePoint then
    currentDropItemRatePoint = limitDropItemRatePoint
  end
  -- DECOMPILER ERROR at PC90: Confused about usage of register: R18 in 'UnsetPending'

  currentPotencial[6] = currentDropItemRatePoint
  Compare_Potencial(currentPotencial)
end

Compare_Potencial = function(currentPotencial)
  -- function num : 0_4 , upvalues : maxPotencial, Poten_UI, titleTable, currTime
  local potenCheck = false
  for i = 0, #currentPotencial do
    if maxPotencial[i] < currentPotencial[i] then
      potenCheck = true
    end
  end
  if potenCheck == true then
    Potencial_Init()
  end
  local potenCount = 0
  local title = nil
  local gap = 60
  local potentialType = {move = 0, attack = 1, cast = 2}
  for i = 0, #currentPotencial do
    if tonumber(maxPotencial[i]) < tonumber(currentPotencial[i]) then
      local potenUpgrade = tonumber(currentPotencial[i]) - tonumber(maxPotencial[i])
      -- DECOMPILER ERROR at PC46: Confused about usage of register: R11 in 'UnsetPending'

      maxPotencial[i] = currentPotencial[i]
      if i == 0 then
        (Poten_UI._attackSpeedText):SetShow(true)
        ;
        (Poten_UI._attackSpeedText):SetText(titleTable[i] .. " : " .. potenUpgrade .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_UP_1") .. " ( " .. maxPotencial[i] .. PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_UP_2") .. " )")
        ;
        (Poten_UI._attackSpeedText):SetPosY((Poten_UI._attackSpeedText):GetPosY() + gap * potenCount)
      else
        if i == 1 then
          (Poten_UI._castingSpeedText):SetShow(true)
          ;
          (Poten_UI._castingSpeedText):SetText(titleTable[i] .. " : " .. potenUpgrade .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_UP_1") .. " ( " .. maxPotencial[i] .. PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_UP_2") .. " )")
          ;
          (Poten_UI._castingSpeedText):SetPosY((Poten_UI._attackSpeedText):GetPosY() + gap * potenCount)
        else
          if i == 2 then
            (Poten_UI._moveSpeedText):SetShow(true)
            ;
            (Poten_UI._moveSpeedText):SetText(titleTable[i] .. " : " .. potenUpgrade .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_UP_1") .. " ( " .. maxPotencial[i] .. PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_UP_2") .. " )")
            ;
            (Poten_UI._moveSpeedText):SetPosY((Poten_UI._attackSpeedText):GetPosY() + gap * potenCount)
          else
            if i == 3 then
              (Poten_UI._criticalRateText):SetShow(true)
              ;
              (Poten_UI._criticalRateText):SetText(titleTable[i] .. " : " .. potenUpgrade .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_UP_1") .. " ( " .. maxPotencial[i] .. PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_UP_2") .. " )")
              ;
              (Poten_UI._criticalRateText):SetPosY((Poten_UI._attackSpeedText):GetPosY() + gap * potenCount)
            else
              if i == 4 then
                (Poten_UI._fishingRateText):SetShow(true)
                ;
                (Poten_UI._fishingRateText):SetText(titleTable[i] .. " : " .. potenUpgrade .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_UP_1") .. " ( " .. maxPotencial[i] .. PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_UP_2") .. " )")
                ;
                (Poten_UI._fishingRateText):SetPosY((Poten_UI._attackSpeedText):GetPosY() + gap * potenCount)
              else
                if i == 5 then
                  (Poten_UI._gatheringRateText):SetShow(true)
                  ;
                  (Poten_UI._gatheringRateText):SetText(titleTable[i] .. " : " .. potenUpgrade .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_UP_1") .. " ( " .. maxPotencial[i] .. PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_UP_2") .. " )")
                  ;
                  (Poten_UI._gatheringRateText):SetPosY((Poten_UI._attackSpeedText):GetPosY() + gap * potenCount)
                else
                  if i == 6 then
                    (Poten_UI._dropItemRateText):SetShow(true)
                    ;
                    (Poten_UI._dropItemRateText):SetText(titleTable[i] .. " : " .. potenUpgrade .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_UP_1") .. " ( " .. maxPotencial[i] .. PAGetString(Defines.StringSheet_GAME, "LUA_POTENCIAL_UP_2") .. " )")
                    ;
                    (Poten_UI._dropItemRateText):SetPosY((Poten_UI._attackSpeedText):GetPosY() + gap * potenCount)
                  end
                end
              end
            end
          end
        end
      end
      if title ~= nil then
        title = tostring(title .. " / " .. titleTable[i])
      else
        title = titleTable[i]
      end
      potenCount = potenCount + 1
    end
  end
  if potenCount > 0 then
    Panel_Potencial_Up:SetShow(true, true)
    ;
    (Poten_UI._arcText):SetText(title)
    ;
    (Poten_UI._arcText):SetShow(true)
    ;
    (Poten_UI._titleText):SetShow(true)
    ;
    (Poten_UI._iconBack):SetShow(true)
    ;
    (Poten_UI._iconImage):SetShow(true)
    ;
    (Poten_UI._iconEtc):SetShow(true)
    ;
    (Poten_UI._iconGrade):SetShow(true)
    currTime = 0
  end
  Max_Potencial()
end

local potenLimit = {}
Max_Potencial = function()
  -- function num : 0_5 , upvalues : maxPotencial, potenLimit
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local potentialType = {move = 0, attack = 1, cast = 2}
  local currentAttackSpeedPoint = player:characterStatPointSpeed(potentialType.attack)
  local limitAttackSpeedPoint = player:characterStatPointLimitedSpeed(potentialType.attack)
  if limitAttackSpeedPoint < currentAttackSpeedPoint then
    currentAttackSpeedPoint = limitAttackSpeedPoint
  end
  local equipedAttackSpeedPoint = currentAttackSpeedPoint - 5
  local maxAttackSpeedPoint = limitAttackSpeedPoint - 5
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R6 in 'UnsetPending'

  maxPotencial[0] = equipedAttackSpeedPoint
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R6 in 'UnsetPending'

  potenLimit[0] = maxAttackSpeedPoint
  local currentCastingSpeedPoint = player:characterStatPointSpeed(potentialType.cast)
  local limitCastingSpeedPoint = player:characterStatPointLimitedSpeed(potentialType.cast)
  if limitCastingSpeedPoint < currentCastingSpeedPoint then
    currentCastingSpeedPoint = limitCastingSpeedPoint
  end
  local equipedCastingSpeedPoint = currentCastingSpeedPoint - 5
  local maxCastingSpeedPoint = limitCastingSpeedPoint - 5
  -- DECOMPILER ERROR at PC36: Confused about usage of register: R10 in 'UnsetPending'

  maxPotencial[1] = equipedCastingSpeedPoint
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R10 in 'UnsetPending'

  potenLimit[1] = maxCastingSpeedPoint
  local currentMoveSpeedPoint = player:characterStatPointSpeed(potentialType.move)
  local limitMoveSpeedPoint = player:characterStatPointLimitedSpeed(potentialType.move)
  if limitMoveSpeedPoint < currentMoveSpeedPoint then
    currentMoveSpeedPoint = limitMoveSpeedPoint
  end
  local equipedMoveSpeedPoint = currentMoveSpeedPoint - 5
  local maxMoveSpeedPoint = limitMoveSpeedPoint - 5
  -- DECOMPILER ERROR at PC51: Confused about usage of register: R14 in 'UnsetPending'

  maxPotencial[2] = equipedMoveSpeedPoint
  -- DECOMPILER ERROR at PC53: Confused about usage of register: R14 in 'UnsetPending'

  potenLimit[2] = maxMoveSpeedPoint
  local currentCriticalRatePoint = player:characterStatPointCritical()
  local limitCriticalRatePoint = player:characterStatPointLimitedCritical()
  if limitCriticalRatePoint < currentCriticalRatePoint then
    currentCriticalRatePoint = limitCriticalRatePoint
  end
  local equipedCriticalRatePoint = currentCriticalRatePoint
  local maxCriticalRatePoint = limitCriticalRatePoint
  -- DECOMPILER ERROR at PC64: Confused about usage of register: R18 in 'UnsetPending'

  maxPotencial[3] = equipedCriticalRatePoint
  -- DECOMPILER ERROR at PC66: Confused about usage of register: R18 in 'UnsetPending'

  potenLimit[3] = maxCriticalRatePoint
  local currentFishingRatePoint = player:getCharacterStatPointFishing()
  local limitFishingRatePoint = player:getCharacterStatPointLimitedFishing()
  if limitFishingRatePoint < currentFishingRatePoint then
    currentFishingRatePoint = limitFishingRatePoint
  end
  local equipedFishingRatePoint = currentFishingRatePoint
  local maxFishingRatePoint = limitFishingRatePoint
  -- DECOMPILER ERROR at PC77: Confused about usage of register: R22 in 'UnsetPending'

  maxPotencial[4] = equipedFishingRatePoint
  -- DECOMPILER ERROR at PC79: Confused about usage of register: R22 in 'UnsetPending'

  potenLimit[4] = maxFishingRatePoint
  local currentProductRatePoint = player:getCharacterStatPointCollection()
  local limitProductRatePoint = player:getCharacterStatPointLimitedCollection()
  if limitProductRatePoint < currentProductRatePoint then
    currentProductRatePoint = limitProductRatePoint
  end
  local equipedProductRatePoint = currentProductRatePoint
  local maxProductRatePoint = limitProductRatePoint
  -- DECOMPILER ERROR at PC90: Confused about usage of register: R26 in 'UnsetPending'

  maxPotencial[5] = equipedProductRatePoint
  -- DECOMPILER ERROR at PC92: Confused about usage of register: R26 in 'UnsetPending'

  potenLimit[5] = maxProductRatePoint
  local currentDropItemRatePoint = player:getCharacterStatPointDropItem()
  local limitDropItemRatePoint = player:getCharacterStatPointLimitedDropItem()
  if limitDropItemRatePoint < currentDropItemRatePoint then
    currentDropItemRatePoint = limitDropItemRatePoint
  end
  local equipedDropItemRatePoint = currentDropItemRatePoint
  local maxDropItemRatePoint = limitDropItemRatePoint
  -- DECOMPILER ERROR at PC103: Confused about usage of register: R30 in 'UnsetPending'

  maxPotencial[6] = equipedDropItemRatePoint
  -- DECOMPILER ERROR at PC105: Confused about usage of register: R30 in 'UnsetPending'

  potenLimit[6] = maxDropItemRatePoint
end

Potencial_Init = function()
  -- function num : 0_6 , upvalues : Poten_UI
  Panel_Potencial_Up:SetShow(false, false)
  for _,control in pairs(Poten_UI) do
    control:SetShow(false)
  end
end

Potencial_Up_Update_ShowFunction = function(deltaTime)
  -- function num : 0_7 , upvalues : currTime
  if Panel_Acquire:IsShow() then
    Panel_Potencial_Up:SetShow(false, false)
  else
    currTime = currTime + deltaTime
  end
  if currTime > 3.5 and Panel_Potencial_Up:IsShow() == true then
    currTime = 0
    local Panel_Potencial_Up_Hide = (UIAni.AlphaAnimation)(0, Panel_Potencial_Up, 0, 0.3)
    Panel_Potencial_Up_Hide:SetHideAtEnd(true)
  end
end

Poten_Resize()
Max_Potencial()
Panel_Potencial_Up:RegisterUpdateFunc("Potencial_Up_Update_ShowFunction")
registerEvent("FromClient_UpdateSelfPlayerStatPoint", "Current_Poten_Update")

