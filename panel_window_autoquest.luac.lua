-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\autoquest\panel_window_autoquest.luac 

-- params : ...
-- function num : 0
Panel_Window_AutoQuest:SetShow(false)
PaGlobal_AutoQuest = {
_ui = {_btn_BlackSpirit = (UI.getChildControl)(Panel_Window_AutoQuest, "Button_BlackSpiritQuest"), _btn_BattleQuest = (UI.getChildControl)(Panel_Window_AutoQuest, "Button_BattleQuest"), _checkBtn_Potion = (UI.getChildControl)(Panel_Window_AutoQuest, "CheckButton_PotionUse")}
}
-- DECOMPILER ERROR at PC28: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_AutoQuest.Initialize = function(self)
  -- function num : 0_0
  ((self._ui)._btn_BlackSpirit):addInputEvent("Mouse_LUp", "PaGlobal_AutoQuest:StartBlackSpiritQuest()")
  ;
  ((self._ui)._btn_BattleQuest):addInputEvent("Mouse_LUp", "PaGlobal_AutoQuest:EndBlackSpiritQuest()")
end

local index = 0
-- DECOMPILER ERROR at PC33: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_AutoQuest.StartBlackSpiritQuest = function(self)
  -- function num : 0_1 , upvalues : index
  local message = ""
  if index == 0 then
    message = "성채 건설 �\128�\165 �\128역을 벗어났어! 돌아�\128 멍충�\132"
  else
    if index == 1 then
      message = "하루 한번 특별�\156 시간! 집중전투 �\139"
    else
      if index == 2 then
        message = "회전 �\128르기 돌진찌르�\176 깊게찌르�\176 강타 잡아메치�\176"
      else
        if index == 3 then
          message = "게시�\144 일정 달력 입사면접 일정 �\128재줒�\135 알림"
          index = 0
        end
      end
    end
  end
  FGlobal_AutoQuestBlackSpiritMessage(message)
  index = index + 1
end

-- DECOMPILER ERROR at PC36: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_AutoQuest.EndBlackSpiritQuest = function(self)
  -- function num : 0_2
  FGlobal_EndBlackSpiritMessage()
end

PaGlobal_AutoQuest:Initialize()

