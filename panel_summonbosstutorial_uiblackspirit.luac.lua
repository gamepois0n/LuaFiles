-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\tutorial\panel_summonbosstutorial_uiblackspirit.luac 

-- params : ...
-- function num : 0
PaGlobal_SummonBossTutorial_UiBlackSpirit = {
_ui = {_obsidian = (UI.getChildControl)(Panel_SummonBossTutorial, "Static_Obsidian"), _obsidian_B = (UI.getChildControl)(Panel_SummonBossTutorial, "Static_Obsidian_B"), _obsidian_B_Left = (UI.getChildControl)(Panel_SummonBossTutorial, "Static_Obsidian_B_Left"), _obsidian_Text = (UI.getChildControl)(Panel_SummonBossTutorial, "StaticText_Obsidian_B"), _obsidian_Text_2 = (UI.getChildControl)(Panel_SummonBossTutorial, "StaticText_Obsidian_B_2"), _bubbleKey_W = (UI.getChildControl)(Panel_SummonBossTutorial, "StaticText_BubbleKey_W"), _bubbleKey_A = (UI.getChildControl)(Panel_SummonBossTutorial, "StaticText_BubbleKey_A"), _bubbleKey_S = (UI.getChildControl)(Panel_SummonBossTutorial, "StaticText_BubbleKey_S"), _bubbleKey_D = (UI.getChildControl)(Panel_SummonBossTutorial, "StaticText_BubbleKey_D"), _bubbleKey_I = (UI.getChildControl)(Panel_SummonBossTutorial, "StaticText_BubbleKey_I"), _bubbleKey_R = (UI.getChildControl)(Panel_SummonBossTutorial, "StaticText_BubbleKey_R"), _bubbleKey_T = (UI.getChildControl)(Panel_SummonBossTutorial, "StaticText_BubbleKey_T"), _bubbleKey_Shift = (UI.getChildControl)(Panel_SummonBossTutorial, "StaticText_BubbleKey_Shift"), _bubbleKey_Ctrl = (UI.getChildControl)(Panel_SummonBossTutorial, "StaticText_BubbleKey_Ctrl"), _mouseBody_L = (UI.getChildControl)(Panel_SummonBossTutorial, "Static_MouseBody_L"), _mouseLButton_L = (UI.getChildControl)(Panel_SummonBossTutorial, "Static_L_Btn_L"), _mouseLButton_R = (UI.getChildControl)(Panel_SummonBossTutorial, "Static_L_Btn_R"), _mouseBody_R = (UI.getChildControl)(Panel_SummonBossTutorial, "Static_MouseBody_R"), _mouseRButton_L = (UI.getChildControl)(Panel_SummonBossTutorial, "Static_R_Btn_L"), _mouseRButton_R = (UI.getChildControl)(Panel_SummonBossTutorial, "Static_R_Btn_R")}
, _firstBubbleKeyMargin = 20, _bubbleKeyMargin = 5, _enabledEffect = false, _blackSpiritRestorFunctor = nil, _texturePath_White = "New_UI_Common_ForLua/Widget/Bubble/Bubble.dds", _texturePath_Black = "New_UI_Common_ForLua/Widget/Bubble/Bubble_01.dds"}
-- DECOMPILER ERROR at PC132: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.setShowMouseL = function(self, bShow)
  -- function num : 0_0
  ((self._ui)._mouseBody_L):SetShow(bShow)
  ;
  ((self._ui)._mouseLButton_L):SetShow(bShow)
  ;
  ((self._ui)._mouseLButton_R):SetShow(bShow)
end

-- DECOMPILER ERROR at PC135: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.setPosMouseL = function(self, posX, posY)
  -- function num : 0_1
  ((self._ui)._mouseBody_L):SetPosX(posX)
  ;
  ((self._ui)._mouseBody_L):SetPosY(posY)
  ;
  ((self._ui)._mouseLButton_L):SetPosX(posX)
  ;
  ((self._ui)._mouseLButton_L):SetPosY(posY)
  ;
  ((self._ui)._mouseLButton_R):SetPosX(posX + 12)
  ;
  ((self._ui)._mouseLButton_R):SetPosY(posY)
end

-- DECOMPILER ERROR at PC138: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.initialize = function(self)
  -- function num : 0_2
  ((self._ui)._obsidian_B):SetIgnore(true)
  ;
  ((self._ui)._obsidian_B_Left):SetIgnore(true)
  ;
  ((self._ui)._obsidian_B):SetColor((Defines.Color).C_FF000000)
  ;
  ((self._ui)._obsidian_B_Left):SetColor((Defines.Color).C_FF000000)
  ;
  ((self._ui)._obsidian_B):addInputEvent("Mouse_LUp", "PaGlobal_SummonBossTutorial_UiBlackSpirit:handleMouseLUpBubble()")
  ;
  ((self._ui)._obsidian_B):addInputEvent("Mouse_LDown", "PaGlobal_SummonBossTutorial_UiBlackSpirit:handleMouseLDownBubble()")
  ;
  ((self._ui)._obsidian_B):addInputEvent("Mouse_On", "PaGlobal_SummonBossTutorial_UiBlackSpirit:handleMouseOnBubble()")
  ;
  ((self._ui)._obsidian_B):addInputEvent("Mouse_Out", "PaGlobal_SummonBossTutorial_UiBlackSpirit:handleMouseOutBubble()")
  ;
  ((self._ui)._obsidian_B_Left):addInputEvent("Mouse_LUp", "PaGlobal_SummonBossTutorial_UiBlackSpirit:handleMouseLUpBubble()")
  ;
  ((self._ui)._obsidian_B_Left):addInputEvent("Mouse_LDown", "PaGlobal_SummonBossTutorial_UiBlackSpirit:handleMouseLDownBubble()")
  ;
  ((self._ui)._obsidian_B_Left):addInputEvent("Mouse_On", "PaGlobal_SummonBossTutorial_UiBlackSpirit:handleMouseOnBubble()")
  ;
  ((self._ui)._obsidian_B_Left):addInputEvent("Mouse_Out", "PaGlobal_SummonBossTutorial_UiBlackSpirit:handleMouseOutBubble()")
end

-- DECOMPILER ERROR at PC141: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.getBubbleKeyMargin = function(self)
  -- function num : 0_3
  return self._bubbleKeyMargin
end

-- DECOMPILER ERROR at PC144: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.eraseEffect = function(self, key)
  -- function num : 0_4
  ((self._ui)[key]):EraseAllEffect()
end

-- DECOMPILER ERROR at PC147: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.addEffect = function(self, key, effectName, isLoop, posX, posY)
  -- function num : 0_5
  ((self._ui)[key]):AddEffect(effectName, isLoop, posX, posY)
end

-- DECOMPILER ERROR at PC150: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.addEffectBlackSpirit = function(self, effectName, isLoop, posX, posY)
  -- function num : 0_6
  if self._enabledEffect == false then
    self._enabledEffect = true
    self:addEffect("_obsidian", effectName, isLoop, posX, posY)
  end
end

-- DECOMPILER ERROR at PC153: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.eraseEffectBlackSpirit = function(self)
  -- function num : 0_7
  self._enabledEffect = false
  self:eraseEffect("_obsidian")
end

-- DECOMPILER ERROR at PC156: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.resetPosition = function(self)
  -- function num : 0_8
  local scrX = getScreenSizeX()
  local scrY = getScreenSizeY()
  ;
  ((self._ui)._obsidian):SetPosX(scrX * 0.5 - 20)
  ;
  ((self._ui)._obsidian):SetPosY(scrY * 0.5 - 300)
  ;
  ((self._ui)._obsidian_B):SetPosX(scrX * 0.5 + 50)
  ;
  ((self._ui)._obsidian_B):SetPosY(scrY * 0.5 - 250)
  ;
  ((self._ui)._obsidian_Text):SetPosX(scrX * 0.5 + 53)
  ;
  ((self._ui)._obsidian_Text):SetPosY(scrY * 0.5 - 225)
  ;
  ((self._ui)._obsidian_Text_2):SetPosX(scrX * 0.5 + 53)
end

-- DECOMPILER ERROR at PC159: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.setShow = function(self, key, isShow)
  -- function num : 0_9
  ((self._ui)[key]):SetShow(isShow)
end

-- DECOMPILER ERROR at PC162: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.setPosX = function(self, key, posX)
  -- function num : 0_10
  ((self._ui)[key]):SetPosX(posX)
end

-- DECOMPILER ERROR at PC165: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.setPosY = function(self, key, posY)
  -- function num : 0_11
  ((self._ui)[key]):SetPosY(posY)
end

-- DECOMPILER ERROR at PC168: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.getPosX = function(self, key, posX)
  -- function num : 0_12
  return ((self._ui)[key]):GetPosX()
end

-- DECOMPILER ERROR at PC171: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.getPosY = function(self, key, posY)
  -- function num : 0_13
  return ((self._ui)[key]):GetPosY()
end

-- DECOMPILER ERROR at PC174: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.getSizeY = function(self, key, sizeY)
  -- function num : 0_14
  return ((self._ui)[key]):GetSizeY()
end

-- DECOMPILER ERROR at PC177: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.setShowBubbleKey = function(self, key, isShow)
  -- function num : 0_15
  ((self._ui)[key]):SetShow(isShow)
end

-- DECOMPILER ERROR at PC180: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.setShowBlackSpirit = function(self, isShow)
  -- function num : 0_16
  self:setShow("_obsidian", isShow)
end

-- DECOMPILER ERROR at PC183: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.setShowAll = function(self, isShow)
  -- function num : 0_17
  for key,value in pairs(self._ui) do
    value:SetShow(isShow)
  end
end

-- DECOMPILER ERROR at PC186: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.hideBubbleKey = function(self)
  -- function num : 0_18
  ((self._ui)._bubbleKey_W):SetShow(false)
  ;
  ((self._ui)._bubbleKey_A):SetShow(false)
  ;
  ((self._ui)._bubbleKey_S):SetShow(false)
  ;
  ((self._ui)._bubbleKey_D):SetShow(false)
  ;
  ((self._ui)._bubbleKey_I):SetShow(false)
  ;
  ((self._ui)._bubbleKey_R):SetShow(false)
  ;
  ((self._ui)._bubbleKey_T):SetShow(false)
  ;
  ((self._ui)._bubbleKey_Shift):SetShow(false)
  ;
  ((self._ui)._bubbleKey_Ctrl):SetShow(false)
end

-- DECOMPILER ERROR at PC189: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.changeBubbleKeyByKeySetting = function(self)
  -- function num : 0_19
  ((self._ui)._bubbleKey_W):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_MoveFront))
  ;
  ((self._ui)._bubbleKey_A):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_MoveLeft))
  ;
  ((self._ui)._bubbleKey_S):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_MoveBack))
  ;
  ((self._ui)._bubbleKey_D):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_MoveRight))
  ;
  ((self._ui)._bubbleKey_I):SetText(keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_Inventory))
  ;
  ((self._ui)._bubbleKey_R):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_Interaction))
  ;
  ((self._ui)._bubbleKey_T):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_AutoRun))
  ;
  ((self._ui)._bubbleKey_Shift):SetText(keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_Dash))
  ;
  ((self._ui)._bubbleKey_Ctrl):SetText(keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_CursorOnOff))
end

-- DECOMPILER ERROR at PC192: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.showSuggestCallSpiritUi = function(self)
  -- function num : 0_20
  Panel_Tutorial:SetShow(true, true)
  PaGlobal_TutorialUiManager:hideAllTutorialUi()
  ;
  (PaGlobal_TutorialUiManager:getUiMasking()):showSpiritMasking()
  local blackSpiritKeyString = keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_BlackSpirit)
  PaGlobal_SummonBossTutorial_UiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_20_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_46"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_47"), true, getScreenSizeX() - 125, getScreenSizeY() - 125)
  end
)
end

-- DECOMPILER ERROR at PC195: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.resetSpiritUiForTutorial = function(self)
  -- function num : 0_21
  self:resetPosition()
  ;
  (PaGlobal_TutorialUiManager:getUiBlackSpirit()):hideBubbleKey()
  ;
  (PaGlobal_TutorialUiManager:getUiBlackSpirit()):addEffectBlackSpirit("fUI_DarkSpirit_Tutorial", true, 0, 0)
end

-- DECOMPILER ERROR at PC198: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.setSpiritUiForTutorial = function(self, text1, text2, isLeftSideBubble, spiritPosX, spiritPosY, isIgnore)
  -- function num : 0_22
  self:resetSpiritUiForTutorial()
  ;
  ((self._ui)._obsidian):SetShow(true)
  ;
  ((self._ui)._obsidian_B):ResetVertexAni()
  ;
  ((self._ui)._obsidian_B):SetVertexAniRun("Ani_Color_Out", true)
  ;
  ((self._ui)._obsidian_B_Left):ResetVertexAni()
  ;
  ((self._ui)._obsidian_B_Left):SetVertexAniRun("Ani_Color_Out", true)
  if text1 == nil and text2 == nil then
    ((self._ui)._obsidian_B):SetShow(false)
    ;
    ((self._ui)._obsidian_B_Left):SetShow(false)
  else
    ;
    ((self._ui)._obsidian_B):SetShow(not isLeftSideBubble)
    ;
    ((self._ui)._obsidian_B_Left):SetShow(isLeftSideBubble)
  end
  local multiplyOneOrZero = 0
  local obsidian_B = nil
  if isLeftSideBubble == true then
    obsidian_B = (self._ui)._obsidian_B_Left
    multiplyOneOrZero = 0
  else
    if isLeftSideBubble == false then
      obsidian_B = (self._ui)._obsidian_B
      multiplyOneOrZero = 1
    end
  end
  ;
  ((self._ui)._obsidian_Text):SetShow(text1 ~= nil)
  ;
  ((self._ui)._obsidian_Text_2):SetShow(text2 ~= nil)
  if text1 == nil then
    ((self._ui)._obsidian_Text):SetText("")
  else
    ((self._ui)._obsidian_Text):SetText(text1)
  end
  if text2 == nil then
    ((self._ui)._obsidian_Text_2):SetText("")
  else
    ((self._ui)._obsidian_Text_2):SetText(text2)
  end
  local text1SizeX = ((self._ui)._obsidian_Text):GetTextSizeX()
  local text1SizeY = ((self._ui)._obsidian_Text):GetTextSizeY()
  local text2SizeX = ((self._ui)._obsidian_Text_2):GetTextSizeX()
  local text2SizeY = (((self._ui)._obsidian_Text_2):GetTextSizeY())
  local largerTextSizeX, largerTextSizeY = nil, nil
  if text1SizeX <= text2SizeX then
    largerTextSizeX = text2SizeX
  else
    largerTextSizeX = text1SizeX
  end
  if text1SizeY <= text2SizeY then
    largerTextSizeY = text2SizeY
  else
    largerTextSizeY = text1SizeY
  end
  local obsidianB_widthMargin = 30
  local obsidianB_heightMargin = 50
  obsidian_B:SetSize(largerTextSizeX + obsidianB_widthMargin, text1SizeY + text2SizeY + obsidianB_heightMargin)
  local scrX = getScreenSizeX()
  local scrY = getScreenSizeY()
  local obsidianB_PosXMargin = 40
  local obsidianB_PosYMargin = 40
  local screenCorner_PosXMargin = 20
  local screenCorner_PosYMargin = 20
  local isLeftCulledWhenLeftSideBubble = spiritPosX - obsidian_B:GetSizeX() - obsidianB_PosXMargin - screenCorner_PosXMargin < 0
  local isRightCulledWhenLeftSideBubble = scrX < spiritPosX + ((self._ui)._obsidian):GetSizeX() + screenCorner_PosXMargin
  local isLeftCulledWhenRightSideBubble = spiritPosX - screenCorner_PosXMargin < 0
  local isRightCulledWhenRightSideBubble = scrX < spiritPosX + ((self._ui)._obsidian):GetSizeX() + obsidianB_PosXMargin + obsidian_B:GetSizeX() + screenCorner_PosXMargin
  local fixedSpiritPosX = 0
  if isLeftSideBubble == true then
    if isLeftCulledWhenLeftSideBubble then
      fixedSpiritPosX = obsidian_B:GetSizeX() + obsidianB_PosXMargin + screenCorner_PosXMargin
    elseif isRightCulledWhenLeftSideBubble then
      fixedSpiritPosX = scrX - ((self._ui)._obsidian):GetSizeX() - screenCorner_PosXMargin
    else
      fixedSpiritPosX = spiritPosX
    end
  elseif isLeftSideBubble == false then
    if isLeftCulledWhenRightSideBubble then
      fixedSpiritPosX = screenCorner_PosXMargin
    elseif isRightCulledWhenRightSideBubble then
      fixedSpiritPosX = scrX - screenCorner_PosXMargin - obsidian_B:GetSizeX() - obsidianB_PosXMargin - ((self._ui)._obsidian):GetSizeX()
    else
      fixedSpiritPosX = spiritPosX
    end
  end
  ;
  ((self._ui)._obsidian):SetPosX(fixedSpiritPosX)
  ;
  ((self._ui)._obsidian):SetPosY(spiritPosY)
  local obsidianPosX = ((self._ui)._obsidian):GetPosX()
  local obsidianPosY = ((self._ui)._obsidian):GetPosY()
  local obsidianSizeX = ((self._ui)._obsidian):GetSizeX()
  local obsidianSizeY = ((self._ui)._obsidian):GetSizeX()
  if isLeftSideBubble == true then
    obsidian_B:SetPosX(obsidianPosX - obsidian_B:GetSizeX() - obsidianB_PosXMargin)
    obsidian_B:SetPosY(obsidianPosY - obsidianSizeY - obsidianB_PosYMargin)
  elseif isLeftSideBubble == false then
    obsidian_B:SetPosX(obsidianPosX + obsidianSizeX + obsidianB_PosXMargin)
    obsidian_B:SetPosY(obsidianPosY + obsidianB_PosYMargin)
  end
  local obsidianB_PosX = obsidian_B:GetPosX()
  local obsidianB_PosY = obsidian_B:GetPosY()
  local obsidianText1_PosXLeftMargin = obsidianB_widthMargin / 3
  local obsidianText1_PosYTopMargin = obsidianB_heightMargin / 6
  ;
  ((self._ui)._obsidian_Text):SetPosX(obsidianB_PosX + obsidianText1_PosXLeftMargin)
  ;
  ((self._ui)._obsidian_Text):SetPosY(obsidianText1_PosYTopMargin * 2.75 * multiplyOneOrZero + obsidianB_PosY + obsidianText1_PosYTopMargin)
  local text1PosY = ((self._ui)._obsidian_Text):GetPosY()
  local obsidianText2_PosXLeftMargin = obsidianText1_PosXLeftMargin
  do
    local obsidianText2_PosYTopMargin = obsidianText1_PosYTopMargin
    ;
    ((self._ui)._obsidian_Text_2):SetPosX(obsidianB_PosX + obsidianText2_PosXLeftMargin)
    ;
    ((self._ui)._obsidian_Text_2):SetPosY(text1PosY + text1SizeY + obsidianText2_PosYTopMargin)
    if isIgnore == nil then
      self:setIgnoreBubble(true)
    else
      self:setIgnoreBubble(isIgnore)
    end
    if isIgnore == false then
      local currentBubble = obsidian_B
      local uiMouseBody_L = (self._ui)._mouseBody_L
      local mouseBodyPosX = currentBubble:GetPosX() + currentBubble:GetSizeX() - uiMouseBody_L:GetSizeX() * 1
      local mouseBodyPosY = currentBubble:GetPosY() + currentBubble:GetSizeY() - uiMouseBody_L:GetSizeY() * 0.35
      self:setPosMouseL(mouseBodyPosX, mouseBodyPosY)
      self:setShowMouseL(true)
    else
      self:setShowMouseL(false)
    end
    -- DECOMPILER ERROR: 26 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC201: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.setSpiritUiForTutorialFunctor = function(self, functor)
  -- function num : 0_23
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R2 in 'UnsetPending'

  PaGlobal_SummonBossTutorial_UiBlackSpirit._blackSpiritRestorFunctor = functor
  self:doSpiritUiForTutorialFunctor()
end

-- DECOMPILER ERROR at PC204: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.doSpiritUiForTutorialFunctor = function(self)
  -- function num : 0_24
  if PaGlobal_SummonBossTutorial_UiBlackSpirit._blackSpiritRestorFunctor == nil then
    return 
  end
  ;
  (PaGlobal_SummonBossTutorial_UiBlackSpirit._blackSpiritRestorFunctor)()
end

-- DECOMPILER ERROR at PC207: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.addBubbleKey = function(self, ...)
  -- function num : 0_25
  local bubbleKeyPosX, bubbleKeyPosY, bubbleKeySizeX, currentBubbleSizeX, previousBubbleKey = nil, nil, nil, nil, nil
  for index,value in ipairs({...}) do
    bubbleKeyPosY = ((self._ui)._obsidian_Text_2):GetPosY()
    bubbleKeySizeX = ((self._ui)[value]):GetSizeX()
    currentBubbleSizeX = (self:getCurrentObsidianBubble()):GetSizeX()
    if index == 1 then
      bubbleKeyPosX = ((self._ui)._obsidian_Text_2):GetPosX() + ((self._ui)._obsidian_Text_2):GetTextSizeX() + self._firstBubbleKeyMargin
      ;
      (self:getCurrentObsidianBubble()):SetSize(currentBubbleSizeX + self._firstBubbleKeyMargin + bubbleKeySizeX, (self:getCurrentObsidianBubble()):GetSizeY())
      previousBubbleKey = (self._ui)[value]
    else
      bubbleKeyPosX = previousBubbleKey:GetPosX() + previousBubbleKey:GetSizeX() + self._bubbleKeyMargin
      ;
      (self:getCurrentObsidianBubble()):SetSize(currentBubbleSizeX + self._bubbleKeyMargin + bubbleKeySizeX, (self:getCurrentObsidianBubble()):GetSizeY())
      previousBubbleKey = (self._ui)[value]
    end
    ;
    ((self._ui)[value]):SetPosX(bubbleKeyPosX)
    ;
    ((self._ui)[value]):SetPosY(bubbleKeyPosY)
    ;
    ((self._ui)[value]):SetShow(true)
  end
end

-- DECOMPILER ERROR at PC210: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.addOverBubbleKey = function(self, destKey, targetKey)
  -- function num : 0_26
  self:setPosX(destKey, self:getPosX(targetKey))
  self:setPosY(destKey, self:getPosY(targetKey) - self:getSizeY(targetKey) - self:getBubbleKeyMargin())
  self:setShow(destKey, true)
end

-- DECOMPILER ERROR at PC213: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.getCurrentObsidianBubble = function(self)
  -- function num : 0_27
  if ((self._ui)._obsidian_B):GetShow() == true then
    return (self._ui)._obsidian_B
  else
    if ((self._ui)._obsidian_B_Left):GetShow() == true then
      return (self._ui)._obsidian_B_Left
    else
      return nil
    end
  end
end

-- DECOMPILER ERROR at PC216: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.setIgnoreBubble = function(self, bIgnore)
  -- function num : 0_28
  local currentBubble = self:getCurrentObsidianBubble()
  currentBubble:SetIgnore(bIgnore)
end

-- DECOMPILER ERROR at PC219: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.handleMouseOnBubble = function(self)
  -- function num : 0_29
  local currentBubble = self:getCurrentObsidianBubble()
  if currentBubble ~= nil then
    self:changeBubbleTextureForAni(true)
    currentBubble:SetVertexAniRun("Ani_Color_On", true)
  end
end

-- DECOMPILER ERROR at PC222: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.handleMouseOutBubble = function(self)
  -- function num : 0_30
  local currentBubble = self:getCurrentObsidianBubble()
  if currentBubble ~= nil then
    self:changeBubbleTextureForAni(true)
    currentBubble:SetVertexAniRun("Ani_Color_Out", true)
  end
end

-- DECOMPILER ERROR at PC225: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.handleMouseLDownBubble = function(self)
  -- function num : 0_31
  local currentBubble = self:getCurrentObsidianBubble()
  if currentBubble ~= nil then
    self:changeBubbleTextureForAni(true)
    currentBubble:SetVertexAniRun("Ani_Color_LDown", true)
  end
end

-- DECOMPILER ERROR at PC228: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.handleMouseLUpBubble = function(self)
  -- function num : 0_32
  local currentBubble = self:getCurrentObsidianBubble()
  if currentBubble ~= nil then
    self:changeBubbleTextureForAni(true)
    currentBubble:SetVertexAniRun("Ani_Color_LUp", true)
    PaGlobal_TutorialManager:handleMouseLUpBubble()
  end
end

FromClient_luaLoadComplete_SummonBossTutorial_UiBlackSpirit = function()
  -- function num : 0_33
  PaGlobal_SummonBossTutorial_UiBlackSpirit:initialize()
end

OnResize_SummonBossTutorial_UiBlackSpirit = function()
  -- function num : 0_34
  PaGlobal_SummonBossTutorial_UiBlackSpirit:doSpiritUiForTutorialFunctor()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_SummonBossTutorial_UiBlackSpirit")
registerEvent("onScreenResize", "OnResize_SummonBossTutorial_UiBlackSpirit")
-- DECOMPILER ERROR at PC243: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_SummonBossTutorial_UiBlackSpirit.changeBubbleTextureForAni = function(self, bWhite)
  -- function num : 0_35
  if Panel_Tutorial:isPlayAnimation() == true then
    ((self._ui)._obsidian_B):ChangeTextureInfoName(self._texturePath_Black)
    ;
    ((self._ui)._obsidian_B_Left):ChangeTextureInfoName(self._texturePath_Black)
    return 
  end
  local destTexture = self._texturePath_Black
  if bWhite == true then
    destTexture = self._texturePath_White
  else
    if bWhite == false then
      destTexture = self._texturePath_Black
    end
  end
  ;
  ((self._ui)._obsidian_B):ChangeTextureInfoName(destTexture)
  ;
  ((self._ui)._obsidian_B_Left):ChangeTextureInfoName(destTexture)
end


