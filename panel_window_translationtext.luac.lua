-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\translationreport\panel_window_translationtext.luac 

-- params : ...
-- function num : 0
Panel_Window_TranslationText:SetShow(false)
local UI_TM = CppEnums.TextMode
PaGlobal_TranslationText = {btn_Close = (UI.getChildControl)(Panel_Window_TranslationText, "Button_Win_Close"), desc1 = (UI.getChildControl)(Panel_Window_TranslationText, "StaticText_Desc1"), desc2 = (UI.getChildControl)(Panel_Window_TranslationText, "StaticText_Desc2"), desc3 = (UI.getChildControl)(Panel_Window_TranslationText, "StaticText_Desc3"), num1 = (UI.getChildControl)(Panel_Window_TranslationText, "StaticText_Number1"), num2 = (UI.getChildControl)(Panel_Window_TranslationText, "StaticText_Number2"), num3 = (UI.getChildControl)(Panel_Window_TranslationText, "StaticText_Number3"), nonBG1 = (UI.getChildControl)(Panel_Window_TranslationText, "StaticText_NonBG1"), nonBG2 = (UI.getChildControl)(Panel_Window_TranslationText, "StaticText_NonBG2"), nonBG3 = (UI.getChildControl)(Panel_Window_TranslationText, "StaticText_NonBG3"), tooltipbg = (UI.getChildControl)(Panel_Window_TranslationText, "Static_ItemTooltip")}
-- DECOMPILER ERROR at PC81: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TranslationText.itemdesc = (UI.getChildControl)(PaGlobal_TranslationText.tooltipbg, "StaticText_ItemDesc")
-- DECOMPILER ERROR at PC85: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TranslationText.Initialize = function(self)
  -- function num : 0_0 , upvalues : UI_TM
  (self.btn_Close):addInputEvent("Mouse_LUp", "PaGlobal_TranslationText:MouseActionClick()")
  ;
  (self.desc1):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self.desc1):SetText("BaseFont_8 : พี�\136 �\128ลี้ย�\135 �\128ครื่อง ชั้น ชี�\137")
  ;
  (self.desc2):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self.desc2):SetText("BaseFont_10 : พี�\136 �\128ลี้ย�\135 �\128ครื่อง ชั้น ชี�\137")
  ;
  (self.desc3):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self.desc3):SetText("BaseFont_12 : พี�\136 �\128ลี้ย�\135 �\128ครื่อง ชั้น ชี�\137")
  ;
  (self.nonBG1):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self.nonBG1):SetText("BaseFont_8 : พี�\136 �\128ลี้ย�\135 �\128ครื่อง ชั้น ชี�\137")
  ;
  (self.nonBG2):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self.nonBG2):SetText("BaseFont_10 : พี�\136 �\128ลี้ย�\135 �\128ครื่อง ชั้น ชี�\137")
  ;
  (self.nonBG3):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self.nonBG3):SetText("BaseFont_12 : พี�\136 �\128ลี้ย�\135 �\128ครื่อง ชั้น ชี�\137")
  ;
  (self.num1):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self.num1):SetText("BaseFont_8 : 10,234,567,890")
  ;
  (self.num2):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self.num2):SetText("BaseFont_10 : 10,234,567,890")
  ;
  (self.num3):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self.num3):SetText("BaseFont_12 : 10,234,567,890")
  ;
  (self.itemdesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self.itemdesc):SetText("<PAColor0xff748cab>- �\128속됨(�\128�\184)<PAOldColor>\n- 개인 거래 불가\n\n- 워리�\180, 레인�\128, 소서�\172, 자이언트, 금수�\145, 무사, 매화, 발키�\172, 쿠노이치, 닌자, 다크나이�\184, 위자�\156, 위치 전용\n\n<PAColor0xffc4a68a>- 설명 : 모험�\128�\152 외형�\132 꾸며주는 무기, 보조 무기, 의상�\180 담겨 있는 상자�\188 획득�\160 �\152 있다. 마우�\164 우클릭으�\156 사용 �\156 직업�\144 맞는 의상�\132 획득�\160 �\152 있다.<PAOldColor>\n\n- 판매�\128 : 판매 불가")
end

-- DECOMPILER ERROR at PC88: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TranslationText.Update = function(self)
  -- function num : 0_1
  (self.desc2):SetPosY((self.desc1):GetPosY() + (self.desc1):GetTextSizeY() + 10)
  ;
  (self.desc3):SetPosY((self.desc2):GetPosY() + (self.desc2):GetTextSizeY() + 10)
  ;
  (self.nonBG2):SetPosY((self.nonBG1):GetPosY() + (self.nonBG1):GetTextSizeY() + 10)
  ;
  (self.nonBG3):SetPosY((self.nonBG2):GetPosY() + (self.nonBG2):GetTextSizeY() + 10)
  ;
  (self.num2):SetPosY((self.num1):GetPosY() + (self.num1):GetTextSizeY() + 10)
  ;
  (self.num3):SetPosY((self.num2):GetPosY() + (self.num2):GetTextSizeY() + 10)
end

-- DECOMPILER ERROR at PC91: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TranslationText.Open = function(self)
  -- function num : 0_2
  Panel_Window_TranslationText:SetShow(true)
  Panel_Window_TranslationText:ComputePos()
  PaGlobal_TranslationText:Update()
end

-- DECOMPILER ERROR at PC94: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TranslationText.MouseActionClick = function(self)
  -- function num : 0_3
  Panel_Window_TranslationText:SetShow(false)
end

PaGlobal_TranslationText:Initialize()

