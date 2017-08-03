-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\extraction\extraction_crystal_animation.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC2: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ExtractionCrystal.resultShow = function(self)
  -- function num : 0_0
  PaGlobal_ExtractionResult:resetChildControl()
  PaGlobal_ExtractionResult:resetAnimation()
  if PaGlobal_ExtractionResult:getShow() == false then
    PaGlobal_ExtractionResult:setShow(true)
    if self._extractionType == 0 then
      PaGlobal_ExtractionResult:setTextResultMsg(PAGetString(Defines.StringSheet_GAME, "LUA_EXTRACTION_CRYSTAL_EXTRACT_DONE"))
    else
      PaGlobal_ExtractionResult:setTextResultMsg(PAGetString(Defines.StringSheet_GAME, "LUA_EXTRACTION_CRYSTAL_REMOVE_DONE"))
    end
  end
  ExtractionCrystalResult_TimerReset()
  Panel_Window_Extraction_Result:RegisterUpdateFunc("ExtractionCrystal_CheckResultMsgShowTime")
end

local ExtractionCrystal_ResultShowTime = 0
ExtractionCrystalResult_TimerReset = function()
  -- function num : 0_1 , upvalues : ExtractionCrystal_ResultShowTime
  ExtractionCrystal_ResultShowTime = 0
end

ExtractionCrystal_CheckResultMsgShowTime = function(DeltaTime)
  -- function num : 0_2 , upvalues : ExtractionCrystal_ResultShowTime
  ExtractionCrystal_ResultShowTime = ExtractionCrystal_ResultShowTime + DeltaTime
  if ExtractionCrystal_ResultShowTime > 3 and Panel_Window_Extraction_Result:GetShow() == true then
    Panel_Window_Extraction_Result:SetShow(false)
  end
  if ExtractionCrystal_ResultShowTime > 5 then
    ExtractionCrystal_ResultShowTime = 0
  end
end


