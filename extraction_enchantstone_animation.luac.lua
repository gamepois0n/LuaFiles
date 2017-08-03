-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\extraction\extraction_enchantstone_animation.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC2: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ExtractionEnchantStone.showAni = function(self)
  -- function num : 0_0
  Panel_Window_Extraction_EnchantStone:SetShow(true)
  ;
  (UIAni.fadeInSCR_Right)(Panel_Window_Extraction_EnchantStone)
  ;
  (UIAni.AlphaAnimation)(1, PaGlobal_ExtractionEnchantStone._uiEffectCircle, 0, 0.2)
  ;
  (self._uiEffectCircle):SetVertexAniRun("Ani_Color_Off", true)
  ;
  (self._uiEffectCircle):SetVertexAniRun("Ani_Rotate_New", true)
  ;
  (self._uiEffectCircle):SetShow(true)
end

-- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ExtractionEnchantStone.hideAni = function(self)
  -- function num : 0_1
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_Window_Extraction_EnchantStone, 0, 0.2)
  aniInfo:SetHideAtEnd(true)
  local aniInfo1 = (UIAni.AlphaAnimation)(0, self._uiEffectCircle, 0, 0.2)
  aniInfo1:SetHideAtEnd(true)
end

local extractingEffect = {_step1 = nil, _step2 = nil, _step3 = nil, _uiEquipItem = nil, _blackStoneWeapon = nil, _blackStoneArmor = nil}
ExtractionEnchant_EffectReset = function()
  -- function num : 0_2 , upvalues : extractingEffect
  local self = PaGlobal_ExtractionEnchantStone
  self._currentTime = 0
  self._doExtracting = false
  ;
  (self._uiEffectStep1):EraseAllEffect()
  ;
  (self._uiIconBlackStoneWeapon):EraseAllEffect()
  ;
  (self._uiIconBlackStoneArmor):EraseAllEffect()
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  extractingEffect._step1 = nil
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  extractingEffect._step2 = nil
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R1 in 'UnsetPending'

  extractingEffect._step3 = nil
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

  extractingEffect._uiEquipItem = nil
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R1 in 'UnsetPending'

  extractingEffect._blackStoneWeapon = nil
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  extractingEffect._blackStoneArmor = nil
end

ExtractionEnchant_CheckTime = function(DeltaTime)
  -- function num : 0_3 , upvalues : extractingEffect
  local self = PaGlobal_ExtractionEnchantStone
  self._currentTime = self._currentTime + DeltaTime
  if self._currentTime > 0 and self._currentTime < 1 and self._doExtracting == true then
    (self._uiEffectStep1):SetShow(true)
    -- DECOMPILER ERROR at PC29: Confused about usage of register: R2 in 'UnsetPending'

    if extractingEffect._step1 == nil then
      extractingEffect._step1 = (self._uiEffectStep1):AddEffect("UI_StoneExtract_01", false, 0, 0)
      -- DECOMPILER ERROR at PC38: Confused about usage of register: R2 in 'UnsetPending'

      extractingEffect._step1 = (self._uiEffectStep1):AddEffect("UI_ItemJewel", false, 0, 0)
      -- DECOMPILER ERROR at PC47: Confused about usage of register: R2 in 'UnsetPending'

      extractingEffect._step1 = (self._uiEffectStep1):AddEffect("fUI_StoneExtract_SpinSmoke01", false, 0, 0)
    end
    ;
    (self._uiEffectStep2):SetShow(false)
    ;
    (self._uiEffectStep3):SetShow(false)
  else
    if self._currentTime >= 1 and self._currentTime < 1.8 and self._doExtracting == true then
      (self._uiEffectStep1):SetShow(true)
      ;
      (self._uiEffectStep2):SetShow(false)
      ;
      (self._uiEffectStep3):SetShow(false)
    else
      if self._currentTime >= 1.8 and self._currentTime < 2.3 and self._doExtracting == true then
        if extractingEffect._uiEquipItem ~= nil then
          ((self._uiEquipItem).icon):EraseEffect(extractingEffect._uiEquipItem)
        end
        ;
        (self._uiEquipItem):clearItem()
        ;
        ((self._uiEquipItem).slot_On):SetShow(false)
        ;
        ((self._uiEquipItem).slot_Nil):SetShow(true)
        ;
        (self._uiEffectStep1):SetShow(true)
        ;
        (self._uiEffectStep2):SetShow(false)
        ;
        (self._uiEffectStep3):SetShow(false)
      else
        if self._currentTime >= 2.3 and self._currentTime < 3 and self._doExtracting == true then
          (self._uiEffectStep1):SetShow(true)
          ;
          (self._uiEffectStep2):SetShow(false)
          ;
          (self._uiEffectStep3):SetShow(false)
          -- DECOMPILER ERROR at PC157: Confused about usage of register: R2 in 'UnsetPending'

          if extractingEffect._blackStoneWeapon == nil then
            extractingEffect._blackStoneWeapon = (self._uiIconBlackStoneWeapon):AddEffect("UI_ItemEnchant01", false, -2.5, -2.5)
          end
          -- DECOMPILER ERROR at PC170: Confused about usage of register: R2 in 'UnsetPending'

          if extractingEffect._blackStoneArmor == nil then
            extractingEffect._blackStoneArmor = (self._uiIconBlackStoneArmor):AddEffect("UI_ItemEnchant01", false, -2.5, -2.5)
          end
        else
          if self._currentTime >= 3 and self._currentTime < 3.8 and self._doExtracting == true then
            (self._uiEffectStep3):SetShow(false)
            ;
            (self._uiIconBlackStoneWeapon):SetMonoTone(false)
            ;
            (self._uiIconBlackStoneArmor):SetMonoTone(false)
          else
            if self._currentTime >= 3.8 and self._currentTime < 4 and self._doExtracting == true then
              if extractingEffect._step1 ~= nil then
                (self._uiEffectStep1):EraseEffect(extractingEffect._step1)
                -- DECOMPILER ERROR at PC213: Confused about usage of register: R2 in 'UnsetPending'

                extractingEffect._step1 = nil
              end
              if extractingEffect._blackStoneWeapon ~= nil then
                (self._uiIconBlackStoneWeapon):EraseEffect(extractingEffect._blackStoneWeapon)
                -- DECOMPILER ERROR at PC224: Confused about usage of register: R2 in 'UnsetPending'

                extractingEffect._uiIconBlackStoneWeapon = nil
              end
              if extractingEffect._blackStoneArmor ~= nil then
                (self._uiIconBlackStoneArmor):EraseEffect(extractingEffect._blackStoneArmor)
                -- DECOMPILER ERROR at PC235: Confused about usage of register: R2 in 'UnsetPending'

                extractingEffect._blackStoneArmor = nil
              end
              self:successXXX()
            end
          end
        end
      end
    end
  end
end

local ExtractionEnchantStone_ResultShowTime = 0
ExtractionEnchantStoneResult_TimerReset = function()
  -- function num : 0_4 , upvalues : ExtractionEnchantStone_ResultShowTime
  ExtractionEnchantStone_ResultShowTime = 0
end

ExtractionEnchantStone_CheckResultMsgShowTime = function(DeltaTime)
  -- function num : 0_5 , upvalues : ExtractionEnchantStone_ResultShowTime
  ExtractionEnchantStone_ResultShowTime = ExtractionEnchantStone_ResultShowTime + DeltaTime
  if ExtractionEnchantStone_ResultShowTime > 3 and Panel_Window_Extraction_Result:GetShow() == true then
    Panel_Window_Extraction_Result:SetShow(false)
  end
  if ExtractionEnchantStone_ResultShowTime > 5 then
    ExtractionEnchantStone_ResultShowTime = 0
  end
end

-- DECOMPILER ERROR at PC28: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_ExtractionEnchantStone.resultShow = function(self)
  -- function num : 0_6
  PaGlobal_ExtractionResult:resetChildControl()
  PaGlobal_ExtractionResult:resetAnimation()
  if PaGlobal_ExtractionResult:getShow() == false then
    PaGlobal_ExtractionResult:setShow(true)
    PaGlobal_ExtractionResult:setTextResultMsg(PAGetString(Defines.StringSheet_GAME, "LUA_EXTRACTION_ENCHANTSTONE_RESULTMSG"))
  end
  ExtractionEnchantStoneResult_TimerReset()
  Panel_Window_Extraction_Result:RegisterUpdateFunc("ExtractionEnchantStone_CheckResultMsgShowTime")
  PaGlobal_TutorialManager:handleExtractionEnchantStoneResultShow()
end


