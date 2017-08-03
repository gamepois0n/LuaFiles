-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\extraction\panel_window_extraction_cloth_animation.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC2: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ExtractionCloth.showAni = function(self)
  -- function num : 0_0
  Panel_Window_Extraction_Cloth:SetShow(true)
  ;
  (UIAni.fadeInSCR_Right)(Panel_Window_Extraction_Cloth)
  ;
  (UIAni.AlphaAnimation)(1, self._effectCircleEff, 0, 0.2)
  ;
  (self._effectCircleEff):SetVertexAniRun("Ani_Rotate_New", true)
  ;
  (self._effectCircleEff):SetVertexAniRun("Ani_Color_Off", true)
  ;
  (self._effectCircleEff):SetShow(true)
end

-- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ExtractionCloth.hideAni = function(self)
  -- function num : 0_1
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_Window_Extraction_Cloth, 0, 0.2)
  aniInfo:SetHideAtEnd(true)
  local aniInfo1 = (UIAni.AlphaAnimation)(0, self._effectCircleEff, 0, 0.2)
  aniInfo1:SetHideAtEnd(true)
end

local extractionEffect = {extracting_Effect_Step1 = nil, equipItem_Effect = nil, cloth_Effect = nil}
ExtractionCloth_CheckTime = function(DeltaTime)
  -- function num : 0_2 , upvalues : extractionEffect
  local self = PaGlobal_ExtractionCloth
  if self._doExtracting then
    self._currentTime = self._currentTime + DeltaTime
  end
  if self._currentTime > 0 and self._currentTime < 1 and self._doExtracting == true then
    (self._extracting_Effect_Step1):SetShow(true)
    -- DECOMPILER ERROR at PC32: Confused about usage of register: R2 in 'UnsetPending'

    if extractionEffect.extracting_Effect_Step1 == nil then
      extractionEffect.extracting_Effect_Step1 = (self._extracting_Effect_Step1):AddEffect("fUI_Dress_Extraction01", false, -0.7, -4.7)
      -- DECOMPILER ERROR at PC41: Confused about usage of register: R2 in 'UnsetPending'

      extractionEffect.extracting_Effect_Step1 = (self._extracting_Effect_Step1):AddEffect("fUI_StoneExtract_SpinSmoke01", false, 0, 0)
    end
  else
    if self._currentTime >= 1 and self._currentTime < 1.8 and self._doExtracting == true then
      (self._extracting_Effect_Step1):SetShow(true)
    else
      if self._currentTime >= 1.8 and self._currentTime < 2.3 and self._doExtracting == true then
        if extractionEffect.equipItem_Effect ~= nil then
          ((self._equipItem).icon):EraseEffect(extractionEffect.equipItem_Effect)
        end
        ;
        (self._equipItem):clearItem()
        ;
        ((self._equipItem).slot_On):SetShow(false)
        ;
        ((self._equipItem).slot_Nil):SetShow(true)
        ;
        (self._extracting_Effect_Step1):SetShow(true)
      else
        if self._currentTime >= 2.3 and self._currentTime < 3 and self._doExtracting == true then
          (self._extracting_Effect_Step1):SetShow(true)
          -- DECOMPILER ERROR at PC119: Confused about usage of register: R2 in 'UnsetPending'

          if extractionEffect.cloth_Effect == nil then
            extractionEffect.cloth_Effect = (self._balks):AddEffect("fUI_Dress_Extraction02", false, 0, 4.2)
          end
        else
          if self._currentTime >= 3 and self._currentTime < 3.8 and self._doExtracting == true then
            (self._balks):SetMonoTone(false)
          else
            if self._currentTime >= 3.8 and self._currentTime < 4 and self._doExtracting == true then
              if extractionEffect.extracting_Effect_Step1 ~= nil then
                (self._extracting_Effect_Step1):EraseEffect(extractionEffect.extracting_Effect_Step1)
                -- DECOMPILER ERROR at PC154: Confused about usage of register: R2 in 'UnsetPending'

                extractionEffect.extracting_Effect_Step1 = nil
              end
              if extractionEffect.cloth_Effect ~= nil then
                (self._balks):EraseEffect(extractionEffect.cloth_Effect)
                -- DECOMPILER ERROR at PC165: Confused about usage of register: R2 in 'UnsetPending'

                extractionEffect.cloth_Effect = nil
              end
              self:successXXX()
            end
          end
        end
      end
    end
  end
end

local ExtractionCloth_ResultShowTime = 0
ExtractionClothResult_TimerReset = function()
  -- function num : 0_3 , upvalues : ExtractionCloth_ResultShowTime
  ExtractionCloth_ResultShowTime = 0
end

ExtractionCloth_CheckResultMsgShowTime = function(DeltaTime)
  -- function num : 0_4 , upvalues : ExtractionCloth_ResultShowTime
  ExtractionCloth_ResultShowTime = ExtractionCloth_ResultShowTime + DeltaTime
  if ExtractionCloth_ResultShowTime > 3 and Panel_Window_Extraction_Result:GetShow() == true then
    Panel_Window_Extraction_Result:SetShow(false)
  end
  if ExtractionCloth_ResultShowTime > 5 then
    ExtractionClothResult_TimerReset()
  end
end

-- DECOMPILER ERROR at PC22: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_ExtractionCloth.resultShow = function(self)
  -- function num : 0_5
  PaGlobal_ExtractionResult:resetChildControl()
  PaGlobal_ExtractionResult:resetAnimation()
  if PaGlobal_ExtractionResult:getShow() == false then
    PaGlobal_ExtractionResult:setShow(true)
    PaGlobal_ExtractionResult:setTextResultMsg(PAGetString(Defines.StringSheet_GAME, "LUA_EXTRACTION_CLOTH_2"))
  end
  ExtractionClothResult_TimerReset()
  Panel_Window_Extraction_Result:RegisterUpdateFunc("ExtractionCloth_CheckResultMsgShowTime")
end

FGlobal_ExtractionEffect_Init = function()
  -- function num : 0_6 , upvalues : extractionEffect
  local self = PaGlobal_ExtractionCloth
  self._currentTime = 0
  self._doExtracting = true
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R1 in 'UnsetPending'

  extractionEffect.extracting_Effect_Step1 = nil
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  extractionEffect.equipItem_Effect = nil
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

  extractionEffect.cloth_Effect = nil
end


