-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\autoquest\panel_autoquest.luac 

-- params : ...
-- function num : 0
Panel_AutoQuest:SetShow(false)
PaGlobal_AutoQuestMsg = {
_ui = {_staticBlackSpirit = (UI.getChildControl)(Panel_AutoQuest, "Static_BlackSpirit"), _staticStartAutoBG = (UI.getChildControl)(Panel_AutoQuest, "Static_StartAutoBG"), _staticTextStartAuto = nil}
, _accessBlackSpiritClick = nil}
-- DECOMPILER ERROR at PC24: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AutoQuestMsg.Initialize = function(self)
  -- function num : 0_0
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui)._staticTextStartAuto = (UI.getChildControl)((self._ui)._staticStartAutoBG, "StaticText_StartAutoText")
  ;
  ((self._ui)._staticBlackSpirit):addInputEvent("Mouse_LUp", "FGlobal_MouseclickTest()")
end

FGlobal_AutoQuestBlackSpiritMessage = function(message)
  -- function num : 0_1
  self = PaGlobal_AutoQuestMsg
  ;
  ((self._ui)._staticBlackSpirit):EraseAllEffect()
  ;
  ((self._ui)._staticBlackSpirit):AddEffect("fUI_DarkSpirit_Tutorial", true, 0, 0)
  ;
  ((self._ui)._staticBlackSpirit):SetShow(true)
  ;
  ((self._ui)._staticStartAutoBG):SetShow(true)
  ;
  ((self._ui)._staticTextStartAuto):SetShow(true)
  ;
  ((self._ui)._staticTextStartAuto):SetText(message)
  ;
  ((self._ui)._staticStartAutoBG):SetSize(((self._ui)._staticTextStartAuto):GetTextSizeX() + 25, ((self._ui)._staticTextStartAuto):GetTextSizeY() + 37)
  ;
  ((self._ui)._staticStartAutoBG):SetPosX(((self._ui)._staticBlackSpirit):GetPosX() - ((self._ui)._staticStartAutoBG):GetSizeX() - 20)
  ;
  ((self._ui)._staticStartAutoBG):SetPosY(((self._ui)._staticBlackSpirit):GetPosY() + 15)
  Panel_AutoQuest:SetShow(true)
end

FGlobal_MouseclickTest = function()
  -- function num : 0_2
  FGlobal_AutoQuestBlackSpiritMessage("ì™\128ì•™~")
  ;
  (PaGlobal_AutoQuestMsg._accessBlackSpiritClick)()
end

FGlobal_EndBlackSpiritMessage = function()
  -- function num : 0_3
  self = PaGlobal_AutoQuestMsg
  ;
  ((self._ui)._staticTextStartAuto):SetText("")
  ;
  ((self._ui)._staticStartAutoBG):SetShow(false)
end

PaGlobal_AutoQuestMsg:Initialize()

