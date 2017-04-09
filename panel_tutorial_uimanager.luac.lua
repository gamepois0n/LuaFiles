-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\tutorial\panel_tutorial_uimanager.luac 

-- params : ...
-- function num : 0
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_TutorialUiManager")
registerEvent("onScreenResize", "FromClient_TutorialScreenReposition")
registerEvent("EventSelfPlayerLevelUp", "FromClient_EventSelfPlayerLevelUp_TutorialUiManager")
PaGlobal_TutorialUiManager = {
_uiList = {_uiBlackSpirit = nil, _uiKeyButton = nil, _uiHeadlineMessage = nil, _uiMasking = nil}
, 
_uiPanelInfo = {}
}
-- DECOMPILER ERROR at PC219: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialUiManager._uiPanelInfo = {[Panel_SelfPlayerExpGage] = (CppEnums.PAGameUIType).PAGameUIPanel_SelfPlayer_ExpGage, [Panel_UIMain] = (CppEnums.PAGameUIType).PAGameUIPanel_UIMenu, [Panel_Radar] = (CppEnums.PAGameUIType).PAGameUIPanel_RadarMap, [Panel_QuickSlot] = (CppEnums.PAGameUIType).PAGameUIPanel_QuickSlot, [Panel_MainStatus_User_Bar] = (CppEnums.PAGameUIType).PAGameUIPanel_MainStatusBar, [Panel_Party] = (CppEnums.PAGameUIType).PAGameUIPanel_Party, [Panel_CheckedQuest] = (CppEnums.PAGameUIType).PAGameUIPanel_CheckedQuest, [Panel_MyHouseNavi] = (CppEnums.PAGameUIType).PAGameUIPanel_MyHouseNavi, [Panel_Window_Servant] = (CppEnums.PAGameUIType).PAGameUIPanel_ServantWindow, [Panel_NewEquip] = (CppEnums.PAGameUIType).PAGameUIPanel_NewEquipment, [Panel_PvpMode] = (CppEnums.PAGameUIType).PAGameUIPanel_PvpMode, [Panel_Adrenallin] = (CppEnums.PAGameUIType).PAGameUIPanel_Adrenallin, [Panel_GameTips] = (CppEnums.PAGameUIType).PAGameUIPanel_GameTips, [Panel_TimeBar] = (CppEnums.PAGameUIType).PAGameUIPanel_TimeBar, [Panel_SkillCommand] = (CppEnums.PAGameUIType).PAGameUIPanel_SkillCommand, [Panel_ClassResource] = (CppEnums.PAGameUIType).PAGameUIPanel_ClassResource, [Panel_NewQuickSlot_1] = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_1, [Panel_NewQuickSlot_2] = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_2, [Panel_NewQuickSlot_3] = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_3, [Panel_NewQuickSlot_4] = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_4, [Panel_NewQuickSlot_5] = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_5, [Panel_NewQuickSlot_6] = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_6, [Panel_NewQuickSlot_7] = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_7, [Panel_NewQuickSlot_8] = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_8, [Panel_NewQuickSlot_9] = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_9, [Panel_NewQuickSlot_0] = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_0, [Panel_NewQuickSlot_11] = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_11, [Panel_NewQuickSlot_12] = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_12, [Panel_NewQuickSlot_13] = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_13, [Panel_NewQuickSlot_14] = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_14, [Panel_NewQuickSlot_15] = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_15, [Panel_NewQuickSlot_16] = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_16, [Panel_NewQuickSlot_17] = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_17, [Panel_NewQuickSlot_18] = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_18, [Panel_NewQuickSlot_19] = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_19, [Panel_NewQuickSlot_10] = (CppEnums.PAGameUIType).PAGameUIPanel_NewQuickSlot_10, [Panel_SkillCooltime] = (CppEnums.PAGameUIType).PAGameUIPanel_SkillCoolTime, [Panel_Movie_KeyViewer] = (CppEnums.PAGameUIType).PAGameUIPanel_KeyViewer, [Panel_MainQuest] = (CppEnums.PAGameUIType).PAGameUIPanel_MainQuest}
-- DECOMPILER ERROR at PC222: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialUiManager.initialize = function(self)
  -- function num : 0_0
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  (self._uiList)._uiBlackSpirit = PaGlobal_TutorialUiBlackSpirit
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._uiList)._uiKeyButton = PaGlobal_TutorialUiKeyButton
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._uiList)._uiHeadlineMessage = PaGlobal_TutorialUiHeadlineMessage
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._uiList)._uiMasking = PaGlobal_TutorialUiMasking
  _PA_LOG("곽민�\176", "PaGlobal_TutorialUiManager:initialize() UI 매니�\128 초기�\148 완료!")
  Panel_Tutorial:RegisterShowEventFunc(true, "FGlobal_Tutorial_ShowAni()")
  Panel_Tutorial:RegisterShowEventFunc(false, "FGlobal_Tutorial_HideAni()")
  PaGlobal_TutorialManager:handleTutorialUiManagerInitialize()
end

FGlobal_Tutorial_ShowAni = function()
  -- function num : 0_1
  PaGlobal_TutorialUiManager:showAni()
end

FGlobal_Tutorial_HideAni = function()
  -- function num : 0_2
  PaGlobal_TutorialUiManager:hideAni()
end

-- DECOMPILER ERROR at PC229: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialUiManager.showAni = function(self)
  -- function num : 0_3
  PaGlobal_TutorialUiBlackSpirit:changeBubbleTextureForAni(false)
  Panel_Tutorial:ResetVertexAni()
  Panel_Tutorial:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_IN)
  local aniInfo = Panel_Tutorial:addColorAnimation(0, 0.75, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo:SetStartColor((Defines.Color).C_00FFFFFF)
  aniInfo:SetEndColor((Defines.Color).C_FFFFFFFF)
  aniInfo.IsChangeChild = true
end

-- DECOMPILER ERROR at PC232: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialUiManager.hideAni = function(self)
  -- function num : 0_4
  PaGlobal_TutorialUiBlackSpirit:changeBubbleTextureForAni(false)
  Panel_Tutorial:ResetVertexAni()
  Panel_Tutorial:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo = Panel_Tutorial:addColorAnimation(0, 1.25, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo:SetStartColor((Defines.Color).C_FFFFFFFF)
  aniInfo:SetEndColor((Defines.Color).C_00FFFFFF)
  aniInfo.IsChangeChild = true
  aniInfo:SetHideAtEnd(true)
  aniInfo:SetDisableWhileAni(true)
end

-- DECOMPILER ERROR at PC235: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialUiManager.loadAllUiSavedInfo = function(self)
  -- function num : 0_5
  for key,value in pairs(self._uiPanelInfo) do
    local isShow = ToClient_GetUiInfo(value, 0, (CppEnums.PanelSaveType).PanelSaveType_IsShow)
    if isShow ~= -1 then
      key:SetShow(isShow)
      local posX = ToClient_GetUiInfo(value, 0, (CppEnums.PanelSaveType).PanelSaveType_PositionX)
      local posY = ToClient_GetUiInfo(value, 0, (CppEnums.PanelSaveType).PanelSaveType_PositionY)
      if posX ~= -1 or posY ~= -1 then
        key:SetPosX(posX)
        key:SetPosY(posY)
      end
      checkAndSetPosInScreen(key)
    end
  end
  local chattingPanelCount = ToClient_getChattingPanelCount()
  for panelIndex = 0, chattingPanelCount - 1 do
    local chatPanel = ToClient_getChattingPanel(panelIndex)
    if chatPanel:isOpen() then
      local chatPanelUI = FGlobal_getChattingPanel(panelIndex)
      chatPanelUI:SetShow(true)
      local posX = ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_ChattingWindow, panelIndex, (CppEnums.PanelSaveType).PanelSaveType_PositionX)
      local posY = ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_ChattingWindow, panelIndex, (CppEnums.PanelSaveType).PanelSaveType_PositionY)
      chatPanelUI:SetPosX(posX)
      chatPanelUI:SetPosY(posY)
    end
  end
  Chatting_OnResize()
end

FromClient_TutorialScreenReposition = function()
  -- function num : 0_6
  PaGlobal_TutorialUiManager:repositionScreen()
end

-- DECOMPILER ERROR at PC240: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialUiManager.repositionScreen = function(self)
  -- function num : 0_7
  local scrX = getScreenSizeX()
  local scrY = getScreenSizeY()
  Panel_Tutorial:SetSize(scrX, scrY)
  Panel_Tutorial:SetPosX(0)
  Panel_Tutorial:SetPosY(0)
  for key,value in pairs(self._uiList) do
    for _,vv in pairs(value._ui) do
      vv:ComputePos()
    end
  end
end

-- DECOMPILER ERROR at PC243: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialUiManager.closeAllWindow = function(self)
  -- function num : 0_8
  if check_ShowWindow() then
    close_WindowPanelList()
  else
    FGlobal_HideDialog()
  end
end

-- DECOMPILER ERROR at PC246: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialUiManager.restoreAllUiByUserSetting = function(self)
  -- function num : 0_9
  if CheckTutorialEnd() then
    self:loadAllUiSavedInfo()
    if Panel_WorldMap:GetShow() == true and Panel_CheckedQuest:GetShow() then
      FGlobal_QuestWidget_Close()
    end
  end
  if isGameTypeThisCountry((CppEnums.ContryCode).eContryCode_KOR) or isGameTypeThisCountry((CppEnums.ContryCode).eContryCode_JAP) then
    FGlobal_MovieGuideButton_Position()
  end
  self:showConditionalUi()
end

-- DECOMPILER ERROR at PC249: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialUiManager.showConditionalUi = function(self)
  -- function num : 0_10
  FGlobal_MyHouseNavi_Update()
  FGlobal_MovieGuideButton_Position()
  Panel_Widget_TownNpcNavi:SetShow(true, true)
  FGlobal_PetControl_CheckUnSealPet()
  FGlobal_Party_ConditionalShow()
  if ToClient_GetUiInfo((CppEnums.PAGameUIType).PAGameUIPanel_GameTips, 0, (CppEnums.PanelSaveType).PanelSaveType_IsShow) == 1 then
    GameTips_Show()
    GameTips_Reposition()
  end
  if isPvpEnable() then
    PvpMode_ShowButton(true)
  else
    PvpMode_ShowButton(false)
  end
  FGlobal_ResetRadarUI()
end

-- DECOMPILER ERROR at PC252: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialUiManager.setShowAllDefaultUi = function(self, isShow)
  -- function num : 0_11
  Panel_SelfPlayerExpGage:SetShow(isShow)
  Panel_TimeBar:SetShow(isShow)
  FGlobal_Panel_Radar_Show(isShow)
  FGlobal_Panel_RadarRealLine_Show(isShow)
  Panel_Adrenallin:SetShow(isShow)
  Panel_CheckedQuest:SetShow(isShow)
  Panel_MainQuest:SetShow(isShow)
  PaGlobal_TutorialUiManager:setShowChattingPanel(isShow)
  Panel_GameTips:SetShow(isShow)
  Panel_GameTipMask:SetShow(isShow)
  Panel_MainStatus_User_Bar:SetShow(isShow)
  if (CppEnums.ClassType).ClassType_Sorcerer ~= (getSelfPlayer()):getClassType() then
    Panel_ClassResource:SetShow(Panel_MainStatus_User_Bar:GetShow() ~= true)
    if Panel_MainStatus_User_Bar:GetShow() == false then
      Panel_ClassResource:SetShow(false)
    end
    FGlobal_NewQuickSlot_Update()
    QuickSlot_UpdateData()
    Panel_UIMain:SetShow(isShow)
    Panel_SkillCommand:SetShow(isShow)
    if isShow == true then
      FGlobal_MovieGuideButton_Position()
      FGlobal_MyHouseNavi_Update()
      Panel_NewEventProduct_Alarm:SetShow(isShow)
      FGlobal_PetControl_CheckUnSealPet()
    elseif isShow == false then
      Panel_AutoTraining:SetShow(false)
      Panel_VillageSiegeArea:SetShow(false)
      Panel_HuntingAlertButton:SetShow(false)
      Panel_VoiceChatStatus:SetShow(false)
      Panel_MovieGuideButton:SetShow(false)
      Panel_Widget_TownNpcNavi:SetShow(false)
      Panel_MyHouseNavi:SetShow(false)
      Panel_Window_PetIcon:SetShow(false)
      Panel_Window_PetControl:SetShow(false)
      Panel_ChallengeReward_Alert:SetShow(false)
      Panel_Movie_KeyViewer:SetShow(false)
    end
    if isPvpEnable() then
      PvpMode_ShowButton(true)
    else
      PvpMode_ShowButton(false)
    end
    -- DECOMPILER ERROR: 7 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC255: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialUiManager.hideAllTutorialUi = function(self)
  -- function num : 0_12
  for _,v in pairs(self._uiList) do
    for __,vv in pairs(v._ui) do
      vv:SetShow(false)
    end
  end
end

-- DECOMPILER ERROR at PC258: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialUiManager.setShowChattingPanel = function(self, isShow)
  -- function num : 0_13
  local chattingPanelCount = ToClient_getChattingPanelCount()
  for panelIndex = 0, chattingPanelCount - 1 do
    local chatPanel = ToClient_getChattingPanel(panelIndex)
    if chatPanel:isOpen() then
      local chatPanelUI = FGlobal_getChattingPanel(panelIndex)
      chatPanelUI:SetShow(isShow)
      if chatPanel:isCombinedToMainPanel() == true and panelIndex ~= 0 then
        chatPanelUI:SetShow(false)
      end
    end
  end
  Panel_Chat0:SetShow(isShow)
end

FromClient_luaLoadComplete_TutorialUiManager = function()
  -- function num : 0_14
  PaGlobal_TutorialUiManager:initialize()
end

FromClient_EventSelfPlayerLevelUp_TutorialUiManager = function()
  -- function num : 0_15
  if CheckTutorialEnd() then
    PaGlobal_TutorialUiManager:restoreAllUiByUserSetting()
  end
end

-- DECOMPILER ERROR at PC265: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialUiManager.getUiBlackSpirit = function(self)
  -- function num : 0_16
  return (self._uiList)._uiBlackSpirit
end

-- DECOMPILER ERROR at PC268: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialUiManager.getUiKeyButton = function(self)
  -- function num : 0_17
  return (self._uiList)._uiKeyButton
end

-- DECOMPILER ERROR at PC271: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialUiManager.getUiHeadlineMessage = function(self)
  -- function num : 0_18
  return (self._uiList)._uiHeadlineMessage
end

-- DECOMPILER ERROR at PC274: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialUiManager.getUiMasking = function(self)
  -- function num : 0_19
  return (self._uiList)._uiMasking
end


