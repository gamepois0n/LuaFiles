-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\tutorial\panel_tutorial_uimasking.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialUiMasking = {
_ui = {_maskBg_Quest = (UI.getChildControl)(Panel_Masking_Tutorial, "Static_MaskBg_Quest"), _maskBg_SelfExpGuage = (UI.getChildControl)(Panel_Masking_Tutorial, "Static_MaskBg_SelfExpGauge"), _maskBg_Spirit = (UI.getChildControl)(Panel_Masking_Tutorial, "Static_MaskBg_Spirit")}
}
local invenTutorialMaskCheck = false
-- DECOMPILER ERROR at PC26: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialUiMasking.showInventoryMasking = function(self, posX, posY)
  -- function num : 0_0 , upvalues : invenTutorialMaskCheck
  if invenTutorialMaskCheck == true then
    return 
  end
  invenTutorialMaskCheck = true
  Panel_Masking_Tutorial:SetShow(true)
  ;
  ((self._ui)._maskBg_Quest):SetShow(true)
  ;
  ((self._ui)._maskBg_SelfExpGuage):SetShow(false)
  ;
  ((self._ui)._maskBg_Spirit):SetShow(false)
  local _posX = Panel_Window_Inventory:GetPosX() + posX - 130
  local _posY = Panel_Window_Inventory:GetPosY() + posY - 115
  Panel_Masking_Tutorial:SetPosX(_posX)
  Panel_Masking_Tutorial:SetPosY(_posY)
end

-- DECOMPILER ERROR at PC29: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialUiMasking.showQuestMasking = function(self, posX, posY)
  -- function num : 0_1
  naviTutorialMaskCheck = true
  Panel_Masking_Tutorial:SetShow(true)
  ;
  ((self._ui)._maskBg_Quest):SetShow(true)
  ;
  ((self._ui)._maskBg_SelfExpGuage):SetShow(false)
  ;
  ((self._ui)._maskBg_Spirit):SetShow(false)
  local _posX = Panel_CheckedQuest:GetPosX() + posX - 150
  local _posY = Panel_CheckedQuest:GetPosY() + posY - 120
  Panel_Masking_Tutorial:SetPosX(_posX)
  Panel_Masking_Tutorial:SetPosY(_posY)
end

-- DECOMPILER ERROR at PC33: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialUiMasking.hideQuestMasking = function(self)
  -- function num : 0_2 , upvalues : invenTutorialMaskCheck
  Panel_Masking_Tutorial:SetShow(false)
  ;
  ((self._ui)._maskBg_Quest):SetShow(false)
  ;
  ((self._ui)._maskBg_SelfExpGuage):SetShow(false)
  ;
  ((self._ui)._maskBg_Spirit):SetShow(false)
  invenTutorialMaskCheck = false
end

-- DECOMPILER ERROR at PC37: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialUiMasking.showQuickSlotMasking = function(self, posX, posY)
  -- function num : 0_3 , upvalues : invenTutorialMaskCheck
  if invenTutorialMaskCheck == true then
    return 
  end
  invenTutorialMaskCheck = true
  Panel_Masking_Tutorial:SetShow(true)
  ;
  ((self._ui)._maskBg_Quest):SetShow(true)
  ;
  ((self._ui)._maskBg_SelfExpGuage):SetShow(false)
  ;
  ((self._ui)._maskBg_Spirit):SetShow(false)
  local _posX = Panel_QuickSlot:GetPosX() + posX - 130
  local _posY = Panel_QuickSlot:GetPosY() + posY - 115
  Panel_Masking_Tutorial:SetPosX(_posX)
  Panel_Masking_Tutorial:SetPosY(_posY)
end

-- DECOMPILER ERROR at PC41: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialUiMasking.showNewQuickSlotMasking = function(self, posX, posY)
  -- function num : 0_4 , upvalues : invenTutorialMaskCheck
  if invenTutorialMaskCheck == true then
    return 
  end
  invenTutorialMaskCheck = true
  Panel_Masking_Tutorial:SetShow(true)
  ;
  ((self._ui)._maskBg_Quest):SetShow(true)
  ;
  ((self._ui)._maskBg_SelfExpGuage):SetShow(false)
  ;
  ((self._ui)._maskBg_Spirit):SetShow(false)
  local _posX = posX - 136
  local _posY = posY - 136
  Panel_Masking_Tutorial:SetPosX(_posX)
  Panel_Masking_Tutorial:SetPosY(_posY)
end

-- DECOMPILER ERROR at PC44: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialUiMasking.showSpiritMasking = function(self)
  -- function num : 0_5
  Panel_Masking_Tutorial:SetShow(true)
  ;
  ((self._ui)._maskBg_Quest):SetShow(false)
  ;
  ((self._ui)._maskBg_SelfExpGuage):SetShow(false)
  ;
  ((self._ui)._maskBg_Spirit):SetShow(true)
  local _posX = Panel_NewQuest_Alarm:GetPosX() - 100
  local _posY = Panel_NewQuest_Alarm:GetPosY() - 70
  Panel_Masking_Tutorial:SetPosX(_posX)
  Panel_Masking_Tutorial:SetPosY(_posY)
end

-- DECOMPILER ERROR at PC47: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialUiMasking.showPanelMasking = function(self, targetPanel)
  -- function num : 0_6
  Panel_Masking_Tutorial:SetShow(true)
  ;
  ((self._ui)._maskBg_Quest):SetShow(true)
  ;
  ((self._ui)._maskBg_SelfExpGuage):SetShow(false)
  ;
  ((self._ui)._maskBg_Spirit):SetShow(false)
  Panel_Masking_Tutorial:SetPosX(targetPanel:GetPosX())
  Panel_Masking_Tutorial:SetPosY(targetPanel:GetPosY())
end

-- DECOMPILER ERROR at PC50: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialUiMasking.showChildControlMasking = function(self, parentPanel, childControl, offsetPosX, offsetPosY)
  -- function num : 0_7
  Panel_Masking_Tutorial:SetShow(true)
  ;
  ((self._ui)._maskBg_Quest):SetShow(true)
  ;
  ((self._ui)._maskBg_SelfExpGuage):SetShow(false)
  ;
  ((self._ui)._maskBg_Spirit):SetShow(false)
  if offsetPosX == nil then
    offsetPosX = 0
  end
  if offsetPosY == nil then
    offsetPosY = 0
  end
  local posX = parentPanel:GetPosX() + childControl:GetPosX() + childControl:GetSizeX() / 2 + offsetPosX - 136
  local posY = parentPanel:GetPosY() + childControl:GetPosY() + childControl:GetSizeY() / 2 + offsetPosY - 136
  Panel_Masking_Tutorial:SetPosX(posX)
  Panel_Masking_Tutorial:SetPosY(posY)
end


