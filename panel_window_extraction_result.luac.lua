-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\extraction\panel_window_extraction_result.luac 

-- params : ...
-- function num : 0
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
PaGlobal_ExtractionResult = {_uiResultMsgBG = (UI.getChildControl)(Panel_Window_Extraction_Result, "Static_Finish"), _uiTextResultMsg = (UI.getChildControl)(Panel_Window_Extraction_Result, "StaticText_Finish")}
-- DECOMPILER ERROR at PC20: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_ExtractionResult.setTextResultMsg = function(self, text)
  -- function num : 0_0
  (self._uiTextResultMsg):SetText(text)
end

-- DECOMPILER ERROR at PC23: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_ExtractionResult.initialize = function(self)
  -- function num : 0_1
  self:resetPanel()
  self:resetChildControl()
  self:resetAnimation()
end

-- DECOMPILER ERROR at PC27: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_ExtractionResult.resetPanel = function(self)
  -- function num : 0_2 , upvalues : UI_color
  Panel_Window_Extraction_Result:SetSize(getScreenSizeX(), getScreenSizeY())
  Panel_Window_Extraction_Result:SetPosX(0)
  Panel_Window_Extraction_Result:SetPosY(0)
  Panel_Window_Extraction_Result:SetColor(UI_color.C_00FFFFFF)
  Panel_Window_Extraction_Result:SetIgnore(true)
  Panel_Window_Extraction_Result:SetShow(false)
end

-- DECOMPILER ERROR at PC30: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_ExtractionResult.resetChildControl = function(self)
  -- function num : 0_3
  (self._uiResultMsgBG):SetSize(getScreenSizeX() + 40, 90)
  ;
  (self._uiResultMsgBG):SetPosX(-20)
  ;
  (self._uiResultMsgBG):ComputePos()
  ;
  (self._uiTextResultMsg):SetSize(getScreenSizeX(), 90)
  ;
  (self._uiTextResultMsg):ComputePos()
end

-- DECOMPILER ERROR at PC33: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_ExtractionResult.resetAnimation = function(self)
  -- function num : 0_4
  (self._uiResultMsgBG):ResetVertexAni()
  ;
  (self._uiResultMsgBG):SetVertexAniRun("Ani_Scale_0", true)
end

-- DECOMPILER ERROR at PC36: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_ExtractionResult.getShow = function(self)
  -- function num : 0_5
  return Panel_Window_Extraction_Result:GetShow()
end

-- DECOMPILER ERROR at PC39: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_ExtractionResult.setShow = function(self)
  -- function num : 0_6
  Panel_Window_Extraction_Result:SetShow(true)
end

-- DECOMPILER ERROR at PC42: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_ExtractionResult.setHide = function(self)
  -- function num : 0_7
  Panel_Window_Extraction_Result:SetShow(false)
end

PaGlobal_ExtractionResult_Resize = function()
  -- function num : 0_8
  PaGlobal_ExtractionResult:initialize()
end

-- DECOMPILER ERROR at PC47: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_ExtractionResult.registMessageHandler = function(self)
  -- function num : 0_9
  registerEvent("onScreenResize", "PaGlobal_ExtractionResult_Resize")
end

PaGlobal_ExtractionResult:initialize()
PaGlobal_ExtractionResult:registMessageHandler()

