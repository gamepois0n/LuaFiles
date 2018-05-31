-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\dialogue\panel_dialog_main_quest_renew.luac 

-- params : ...
-- function num : 0
local Panel_Dialog_Main_Quest_Info = {_initialize = false, 
_ui = {static_QuestBg = (UI.getChildControl)(Panel_Dialog_Main, "Static_QuestBg"), staticText_QuestTitle = nil, list2_Quest_List = nil, static_Divider1 = nil, frame_Dialog_Quest = nil, frame_1_Content = nil, staticText_Quest_Npc_Words = nil, static_Divider2 = nil, staticText_Quest_Detail = nil, staticText_Quest_Condition = nil, staticText_Quest_Reward_Basic = nil, static_Divider3 = nil, 
static_Quest_Reward_Basic = {nil, nil, nil, nil, nil, nil}
, 
baseRewardSlot = {nil, nil, nil, nil, nil, nil}
, 
static_Quest_Reward_Select = {nil, nil, nil, nil, nil, nil}
, 
selectRewardSlot = {nil, nil, nil, nil, nil, nil}
, staticText_Quest_Reward_Select = nil, static_Divider4 = nil, expToolTip = nil, frame_1_VerticalScroll = nil, btn_Confirm = nil, btn_Cancel = nil}
, 
_config = {maxQuestRewardCount = 6, 
questRewardSlotConfig = {_createIcon = true, _createBorder = true, _createCount = true, _createClassEquipBG = true, _createCash = true}
}
, 
_enum = {eDefaulIndex = -1}
, 
_value = {isFirstOpen = false, leastSelectReward = 0}
, 
_text = {requestText = PAGetString(Defines.StringSheet_GAME, "DIALOG_BUTTON_QUEST"), progressingText = PAGetString(Defines.StringSheet_GAME, "DIALOG_BUTTON_QUEST_PROGRESS")}
, 
_pos = {
rewardTextPos = {X = nil, Y = nil}
}
, 
_space = {QuestframeSpcae = 8}
, 
_questIcon = {
{475, 1, 493, 20}
, 
{380, 11, 398, 30}
, 
{418, 1, 436, 20}
, 
{437, 1, 455, 20}
, 
{456, 1, 474, 20}
, 
{399, 1, 417, 20}
, 
{380, 11, 398, 30}
, 
{399, 21, 417, 40}
, 
{456, 21, 474, 40}
; texture = "Renewal/UI_Icon/Console_Icon_00.dds", 
[0] = {380, 31, 398, 50}
}
, 
_questId = {}
, 
_rewardIconPath = {[__eRewardExp] = "Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/EXP.dds", [__eRewardSkillExp] = "Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/SkillExp.dds", [__eRewardLifeExp] = "Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/EXP.dds", [__eRewardIntimacy] = "Icon/New_Icon/00000000_Special_Contributiveness.dds", [__eRewardKnowledge] = "Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/00000000_know_icon.dds", [__eRewardExpGrade] = "Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/ExpGrade.dds", [__eRewardSkillExpGrade] = "Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/SkillExpGrade.dds"}
}
Panel_Dialog_Main_Quest_Info.registerMessageHandler = function(self)
  -- function num : 0_0
  registerEvent("onScreenResize", "FromClient_onScreenResize_MainDialog_Quest")
end

Panel_Dialog_Main_Quest_Info.initialize = function(self)
  -- function num : 0_1
  self:close()
  self:initValue()
  self:initControl()
  self:registerMessageHandler()
end

Panel_Dialog_Main_Quest_Info.initControl = function(self)
  -- function num : 0_2
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).staticText_QuestTitle = (UI.getChildControl)((self._ui).static_QuestBg, "StaticText_QuestTitle")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).list2_Quest_List = (UI.getChildControl)((self._ui).static_QuestBg, "List2_Quest_List")
  ;
  ((self._ui).list2_Quest_List):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "PaGlobalFunc_MainDialog_Quest_List2EventControlCreate")
  ;
  ((self._ui).list2_Quest_List):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_Divider1 = (UI.getChildControl)((self._ui).static_QuestBg, "Static_Divider1")
  -- DECOMPILER ERROR at PC46: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).frame_Dialog_Quest = (UI.getChildControl)((self._ui).static_QuestBg, "Frame_Dialog_Quest")
  -- DECOMPILER ERROR at PC54: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).frame_1_Content = (UI.getChildControl)((self._ui).frame_Dialog_Quest, "Frame_1_Content")
  -- DECOMPILER ERROR at PC62: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Quest_Npc_Words = (UI.getChildControl)((self._ui).frame_1_Content, "StaticText_Quest_Npc_Words")
  -- DECOMPILER ERROR at PC70: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_Divider2 = (UI.getChildControl)((self._ui).frame_1_Content, "Static_Divider2")
  -- DECOMPILER ERROR at PC78: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Quest_Detail = (UI.getChildControl)((self._ui).frame_1_Content, "StaticText_Quest_Detail")
  -- DECOMPILER ERROR at PC86: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Quest_Condition = (UI.getChildControl)((self._ui).frame_1_Content, "StaticText_Quest_Condition")
  -- DECOMPILER ERROR at PC94: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Quest_Reward_Basic = (UI.getChildControl)((self._ui).frame_1_Content, "StaticText_Quest_Reward_Basic")
  -- DECOMPILER ERROR at PC102: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_Divider3 = (UI.getChildControl)((self._ui).frame_1_Content, "Static_Divider3")
  -- DECOMPILER ERROR at PC111: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).static_Quest_Reward_Basic)[0] = (UI.getChildControl)((self._ui).frame_1_Content, "Static_Quest_Reward_Basic1")
  -- DECOMPILER ERROR at PC120: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).static_Quest_Reward_Basic)[1] = (UI.getChildControl)((self._ui).frame_1_Content, "Static_Quest_Reward_Basic2")
  -- DECOMPILER ERROR at PC129: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).static_Quest_Reward_Basic)[2] = (UI.getChildControl)((self._ui).frame_1_Content, "Static_Quest_Reward_Basic3")
  -- DECOMPILER ERROR at PC138: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).static_Quest_Reward_Basic)[3] = (UI.getChildControl)((self._ui).frame_1_Content, "Static_Quest_Reward_Basic4")
  -- DECOMPILER ERROR at PC147: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).static_Quest_Reward_Basic)[4] = (UI.getChildControl)((self._ui).frame_1_Content, "Static_Quest_Reward_Basic5")
  -- DECOMPILER ERROR at PC156: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).static_Quest_Reward_Basic)[5] = (UI.getChildControl)((self._ui).frame_1_Content, "Static_Quest_Reward_Basic6")
  -- DECOMPILER ERROR at PC164: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).staticText_Quest_Reward_Select = (UI.getChildControl)((self._ui).frame_1_Content, "StaticText_Quest_Reward_Select")
  -- DECOMPILER ERROR at PC172: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_Divider4 = (UI.getChildControl)((self._ui).frame_1_Content, "Static_Divider4")
  -- DECOMPILER ERROR at PC181: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).static_Quest_Reward_Select)[0] = (UI.getChildControl)((self._ui).frame_1_Content, "Static_Quest_Reward_Select1")
  -- DECOMPILER ERROR at PC190: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).static_Quest_Reward_Select)[1] = (UI.getChildControl)((self._ui).frame_1_Content, "Static_Quest_Reward_Select2")
  -- DECOMPILER ERROR at PC199: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).static_Quest_Reward_Select)[2] = (UI.getChildControl)((self._ui).frame_1_Content, "Static_Quest_Reward_Select3")
  -- DECOMPILER ERROR at PC208: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).static_Quest_Reward_Select)[3] = (UI.getChildControl)((self._ui).frame_1_Content, "Static_Quest_Reward_Select4")
  -- DECOMPILER ERROR at PC217: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).static_Quest_Reward_Select)[4] = (UI.getChildControl)((self._ui).frame_1_Content, "Static_Quest_Reward_Select5")
  -- DECOMPILER ERROR at PC226: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).static_Quest_Reward_Select)[5] = (UI.getChildControl)((self._ui).frame_1_Content, "Static_Quest_Reward_Select6")
  for index = 0, (self._config).maxQuestRewardCount - 1 do
    local control = (UI.getChildControl)((self._ui).frame_1_Content, "Static_Quest_Reward_Basic" .. index + 1)
    local slot = {}
    ;
    (SlotItem.new)(slot, "Static_BaseReward_" .. index, index, control, (self._config).questRewardSlotConfig)
    slot:createChild()
    -- DECOMPILER ERROR at PC257: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self._ui).baseRewardSlot)[index] = slot
  end
  for index = 0, (self._config).maxQuestRewardCount - 1 do
    local control = (UI.getChildControl)((self._ui).frame_1_Content, "Static_Quest_Reward_Select" .. index + 1)
    local slot = {}
    ;
    (SlotItem.new)(slot, "Static_SelectReward_" .. index, index, control, (self._config).questRewardSlotConfig)
    slot:createChild()
    -- DECOMPILER ERROR at PC289: Confused about usage of register: R7 in 'UnsetPending'

    ;
    ((self._ui).selectRewardSlot)[index] = slot
  end
  -- DECOMPILER ERROR at PC298: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).frame_1_VerticalScroll = (UI.getChildControl)((self._ui).frame_Dialog_Quest, "Frame_1_VerticalScroll")
  -- DECOMPILER ERROR at PC306: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).btn_Confirm = (UI.getChildControl)((self._ui).static_QuestBg, "Button_Confirm")
  -- DECOMPILER ERROR at PC314: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).btn_Cancel = (UI.getChildControl)((self._ui).static_QuestBg, "Button_Cancel")
  self:CreateRewardToolTipControl()
end

Panel_Dialog_Main_Quest_Info.open = function(self)
  -- function num : 0_3
  ((self._ui).static_QuestBg):SetShow(true, true)
end

Panel_Dialog_Main_Quest_Info.close = function(self)
  -- function num : 0_4
  ((self._ui).static_QuestBg):SetShow(false)
end

Panel_Dialog_Main_Quest_Info.update = function(self)
  -- function num : 0_5
  self:close()
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
    return 
  end
  local isCompleteQuest = dialogData:getIscompleteQuest()
  if isCompleteQuest == true then
    self:openAndSetData(dialogData)
    return 
  end
  local questCount = dialogData:getAcceptableQuestCount()
  questCount = questCount + dialogData:getIsProgressingQuestCount()
  if questCount == 0 then
    return 
  end
  local openCheck = PaGlobalFunc_MainDialog_Bottom_IsLeastFunButtonDefault()
  if openCheck == true and (self._value).isFirstOpen == false then
    self:openAndSetData(dialogData)
  else
    local leasFunButtomIndex = PaGlobalFunc_MainDialog_Bottom_GetLeastFunButtonIndex()
    local funcButton = dialogData:getFuncButtonAt(leasFunButtomIndex)
    if funcButton == nil then
      return 
    end
    local funcButtonType = tonumber(funcButton._param)
    if funcButtonType == (CppEnums.ContentsType).Contents_NewQuest or funcButtonType == (CppEnums.ContentsType).Contents_Quest then
      self:openAndSetData(dialogData)
    end
  end
end

Panel_Dialog_Main_Quest_Info.openAndSetData = function(self, dialogData)
  -- function num : 0_6
  self:open()
  PaGlobalFunc_MainDialog_Quest_IsFirstSet()
  local topTitle = (self._text).requestText
  local questCount = dialogData:getHaveQuestCount()
  local accpetable = dialogData:getAcceptableQuestCount()
  topTitle = topTitle .. "(" .. accpetable .. "/" .. questCount .. ")"
  ;
  ((self._ui).staticText_QuestTitle):SetText(topTitle)
  self:updateQuestList(dialogData)
  self:update_Quest_Infomation()
end

Panel_Dialog_Main_Quest_Info.initValue = function(self)
  -- function num : 0_7
  self._initialize = true
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).isFirstOpen = false
end

Panel_Dialog_Main_Quest_Info.updateQuestList = function(self, dialogData)
  -- function num : 0_8
  (((self._ui).list2_Quest_List):getElementManager()):clearKey()
  for k in pairs(self._questId) do
    -- DECOMPILER ERROR at PC11: Confused about usage of register: R6 in 'UnsetPending'

    (self._questId)[k] = nil
  end
  local questCount = dialogData:getHaveQuestCount()
  if questCount == 0 then
    return 
  end
  for index = 0, questCount - 1 do
    -- DECOMPILER ERROR at PC24: Confused about usage of register: R7 in 'UnsetPending'

    (self._questId)[index] = index
    ;
    (((self._ui).list2_Quest_List):getElementManager()):pushKey(toInt64(0, (self._questId)[index]))
    ;
    ((self._ui).list2_Quest_List):requestUpdateByKey(toInt64(0, (self._questId)[index]))
  end
end

Panel_Dialog_Main_Quest_Info.update_Quest_Infomation = function(self)
  -- function num : 0_9
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
    return 
  end
  local questInfo = questList_getQuestInfo(dialogData:getQuestRaw())
  if questInfo == nil then
    return 
  end
  self:Quest_InfomationSetData(dialogData)
  self:QuestInfomationSetPosAll()
end

Panel_Dialog_Main_Quest_Info.Quest_InfomationSetData = function(self, dialogData)
  -- function num : 0_10
  local selectedIndex = dialogData:getSelectedQuestIndex()
  local simplequestData = dialogData:getHaveQuestAt(selectedIndex)
  if simplequestData == nil then
    return 
  end
  local npcWord = simplequestData:getQuestDialog()
  if npcWord ~= nil and npcWord ~= "" then
    ((self._ui).staticText_Quest_Npc_Words):SetAutoResize(true)
    ;
    ((self._ui).staticText_Quest_Npc_Words):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
    ;
    ((self._ui).staticText_Quest_Npc_Words):SetText(npcWord)
  end
  local questDesc = simplequestData:getQuestDesc()
  if questDesc ~= nil and questDesc ~= "" then
    ((self._ui).staticText_Quest_Detail):SetAutoResize(true)
    ;
    ((self._ui).staticText_Quest_Detail):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
    ;
    ((self._ui).staticText_Quest_Detail):SetText(questDesc)
  end
  local completeDesc = PAGetStringParam1(Defines.StringSheet_GAME, "QUESTLIST_COMPLETETARGET", "getCompleteDisplay", simplequestData:getCompleteDisplay())
  local demandCount = simplequestData:getDemandCount()
  for demandIndex = 0, demandCount - 1 do
    local desc = simplequestData:getDemandAtDesc(R14_PC70)
    if desc ~= nil then
      completeDesc = completeDesc .. R14_PC70 .. desc
    end
  end
  ;
  ((self._ui).staticText_Quest_Condition):SetAutoResize(true)
  ;
  ((self._ui).staticText_Quest_Condition):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui).staticText_Quest_Condition):SetText(completeDesc)
  self:SetQuestReward(simplequestData)
  self:QuestButtonUpdate(dialogData)
end

Panel_Dialog_Main_Quest_Info.QuestInfomationSetPosAll = function(self)
  -- function num : 0_11
  local StartPosY = ((self._ui).staticText_Quest_Npc_Words):GetPosY()
  local currentPosY = ((self._ui).staticText_Quest_Npc_Words):GetPosY()
  local PanY = (self._space).QuestframeSpcae
  currentPosY = currentPosY + ((self._ui).staticText_Quest_Npc_Words):GetSizeY() + PanY
  ;
  ((self._ui).static_Divider2):SetPosY(currentPosY)
  currentPosY = currentPosY + ((self._ui).static_Divider2):GetSizeY() + PanY
  ;
  ((self._ui).staticText_Quest_Detail):SetPosY(currentPosY)
  currentPosY = currentPosY + ((self._ui).staticText_Quest_Detail):GetSizeY() + PanY
  ;
  ((self._ui).staticText_Quest_Condition):SetPosY(currentPosY)
  currentPosY = currentPosY + ((self._ui).staticText_Quest_Condition):GetSizeY() + PanY
  ;
  ((self._ui).staticText_Quest_Reward_Basic):SetPosY(currentPosY)
  currentPosY = currentPosY + ((self._ui).staticText_Quest_Reward_Basic):GetSizeY() + PanY
  ;
  ((self._ui).static_Divider3):SetPosY(currentPosY)
  currentPosY = currentPosY + ((self._ui).static_Divider3):GetSizeY() + PanY
  for key,value in pairs((self._ui).static_Quest_Reward_Basic) do
    value:SetPosY(currentPosY)
  end
  currentPosY = currentPosY + (((self._ui).static_Quest_Reward_Basic)[1]):GetSizeY() + PanY
  ;
  ((self._ui).staticText_Quest_Reward_Select):SetPosY(currentPosY)
  currentPosY = currentPosY + ((self._ui).staticText_Quest_Reward_Select):GetSizeY() + PanY
  ;
  ((self._ui).static_Divider4):SetPosY(currentPosY)
  currentPosY = currentPosY + ((self._ui).static_Divider4):GetSizeY() + PanY
  for key,value in pairs((self._ui).static_Quest_Reward_Select) do
    value:SetPosY(currentPosY)
  end
  currentPosY = currentPosY + (((self._ui).static_Quest_Reward_Select)[0]):GetSizeY() + PanY
  ;
  ((self._ui).frame_1_VerticalScroll):SetControlPos(0)
  ;
  ((self._ui).frame_Dialog_Quest):UpdateContentPos()
  ;
  ((self._ui).frame_Dialog_Quest):UpdateContentScroll()
end

Panel_Dialog_Main_Quest_Info.QuestButtonUpdate = function(self, dialogData)
  -- function num : 0_12
  local questButton = {}
  questButton[0] = (self._ui).btn_Confirm
  questButton[1] = (self._ui).btn_Cancel
  for key,value in pairs(questButton) do
    value:SetShow(false)
    value:ComputePos()
  end
  local QuestButtonCount = dialogData:getQuestButtonCount()
  for index = 0, QuestButtonCount - 1 do
    local QuestButton = dialogData:getQuestButtonAt(index)
    if QuestButton ~= nil then
      (questButton[index]):SetText(QuestButton:getText())
      ;
      (questButton[index]):SetShow(true)
      ;
      (questButton[index]):addInputEvent("Mouse_LUp", "ToClient_ClickQuestButton(" .. index .. ")")
    end
  end
end

Panel_Dialog_Main_Quest_Info.SetQuestReward = function(self, simplequestData)
  -- function num : 0_13
  self:ClearQuestReward()
  local questInfo = simplequestData:getQuestStaticStatusWrapper()
  if questInfo == nil then
    return 
  end
  local baseRewardCount = questInfo:getQuestBaseRewardCount()
  local selectRewardCount = questInfo:getQuestSelectRewardCount()
  for baseIndex = 0, baseRewardCount - 1 do
    local baseReward = questInfo:getQuestBaseRewardAt(baseIndex)
    if baseReward == nil then
      break
    end
    self:SetRewardIcon(((self._ui).baseRewardSlot)[baseIndex], baseReward, baseIndex, "base")
  end
  do
    for selectIndex = 0, selectRewardCount - 1 do
      local selectReward = questInfo:getQuestSelectRewardAt(selectIndex)
      if selectReward == nil then
        break
      end
      self:SetRewardIcon(((self._ui).selectRewardSlot)[selectIndex], selectReward, selectIndex, "select")
    end
    do
      for key,value in pairs((self._ui).static_Quest_Reward_Select) do
        value:EraseAllEffect()
      end
    end
  end
end

Panel_Dialog_Main_Quest_Info.SetRewardIcon = function(self, slot, reward, index, rewardStr)
  -- function num : 0_14
  local rewardType = reward:getType()
  if rewardType == nil then
    return 
  end
  slot._type = rewardType
  if __eRewardItem == rewardType then
    local itemStatic = getItemEnchantStaticStatus(ItemEnchantKey(reward:getItemEnchantKey()))
    if itemStatic == nil then
      return 
    end
    ;
    (slot.icon):SetShow(true)
    if reward:getItemCount() ~= 0 and slot.count == nil then
      slot.count = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, slot.icon, "StaticText_" .. slot.id .. "_Count")
      ;
      (slot.count):SetHorizonRight()
      ;
      (slot.count):SetVerticalBottom()
      ;
      (slot.count):SetIgnore(true)
    end
    slot:setItemByStaticStatus(itemStatic, reward:getItemCount())
    slot._item = reward:getItemEnchantKey()
    if rewardStr == "base" then
      (slot.icon):addInputEvent("Mouse_On", "Panel_Tooltip_Item_Show_GeneralStatic(" .. index .. ",\"Dialog_QuestReward_Base\",true)")
      ;
      (slot.icon):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_Show_GeneralStatic(" .. index .. ",\"Dialog_QuestReward_Base\",false)")
      Panel_Tooltip_Item_SetPosition(index, slot, "Dialog_QuestReward_Base")
    end
    if rewardStr == "select" then
      (slot.icon):addInputEvent("Mouse_On", "Panel_Tooltip_Item_Show_GeneralStatic(" .. index .. ",\"Dialog_QuestReward_Select\",true)")
      ;
      (slot.icon):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_Show_GeneralStatic(" .. index .. ",\"Dialog_QuestReward_Select\",false)")
      ;
      (slot.icon):addInputEvent("Mouse_LUp", "PaGlobalFunc_MainDialog_Quest_HandleClickedSelectedReward(" .. index .. ")")
      Panel_Tooltip_Item_SetPosition(index, slot, "Dialog_QuestReward_Select")
    end
  else
    do
      ;
      (slot.icon):ChangeTextureInfoName((self._rewardIconPath)[rewardType])
      ;
      (slot.icon):addInputEvent("Mouse_On", "PaGlobalFunc_MainDialog_Quest_RewardToolTip(" .. rewardType .. ", true,\"" .. rewardStr .. "\"," .. index .. " )")
      ;
      (slot.icon):addInputEvent("Mouse_Out", "PaGlobalFunc_MainDialog_Quest_RewardToolTip(" .. rewardType .. ", false,\"" .. rewardStr .. "\"," .. index .. " )")
      ;
      (slot.icon):SetShow(true)
    end
  end
end

Panel_Dialog_Main_Quest_Info.CreateRewardToolTipControl = function(self)
  -- function num : 0_15
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).expToolTip = (UI.getChildControl)((self._ui).frame_1_Content, "StaticText_ToolTipTemplete")
  ;
  ((self._ui).expToolTip):SetColor((Defines.Color).C_FFFFFFFF)
  ;
  ((self._ui).expToolTip):SetAlpha(1)
  ;
  ((self._ui).expToolTip):SetFontColor((Defines.Color).C_FFFFFFFF)
  ;
  ((self._ui).expToolTip):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui).expToolTip):SetAutoResize(true)
  ;
  ((self._ui).expToolTip):SetTextHorizonCenter()
  ;
  ((self._ui).expToolTip):SetShow(false)
  ;
  ((self._ui).expToolTip):SetIgnore(true)
end

Panel_Dialog_Main_Quest_Info.ClearQuestReward = function(self)
  -- function num : 0_16
  for index = 0, (self._config).maxQuestRewardCount - 1 do
    ((((self._ui).baseRewardSlot)[index]).icon):SetShow(false)
    ;
    ((((self._ui).selectRewardSlot)[index]).icon):SetShow(false)
    if (((self._ui).baseRewardSlot)[index]).count ~= nil then
      ((((self._ui).baseRewardSlot)[index]).count):SetShow(false)
      -- DECOMPILER ERROR at PC36: Confused about usage of register: R5 in 'UnsetPending'

      ;
      (((self._ui).baseRewardSlot)[index])._item = 0
    end
    if (((self._ui).selectRewardSlot)[index]).count ~= nil then
      ((((self._ui).selectRewardSlot)[index]).count):SetShow(false)
      -- DECOMPILER ERROR at PC53: Confused about usage of register: R5 in 'UnsetPending'

      ;
      (((self._ui).selectRewardSlot)[index])._item = 0
    end
  end
end

Panel_Dialog_Main_Quest_Info.Resize = function(self)
  -- function num : 0_17
  local sizeX = getScreenSizeX()
  local sizeY = getScreenSizeY()
  local titleSpanY = (math.abs)((((self._ui).staticText_QuestTitle):GetSpanSize()).y)
  local spanY = (((self._ui).static_QuestBg):GetSpanSize()).y
  local diffY = sizeY - (titleSpanY + spanY + ((self._ui).static_QuestBg):GetSizeY())
  if diffY < 0 then
    ((self._ui).static_QuestBg):SetSize(((self._ui).static_QuestBg):GetSizeX(), ((self._ui).static_QuestBg):GetSizeY() + diffY)
    ;
    ((self._ui).frame_Dialog_Quest):SetSize(((self._ui).frame_Dialog_Quest):GetSizeX(), ((self._ui).frame_Dialog_Quest):GetSizeY() + diffY)
  else
    local newSizeY = sizeY - titleSpanY - spanY
    local newDiff = newSizeY - ((self._ui).static_QuestBg):GetSizeY()
    ;
    ((self._ui).static_QuestBg):SetSize(((self._ui).static_QuestBg):GetSizeX(), ((self._ui).static_QuestBg):GetSizeY() + newDiff)
    ;
    ((self._ui).frame_Dialog_Quest):SetSize(((self._ui).frame_Dialog_Quest):GetSizeX(), ((self._ui).frame_Dialog_Quest):GetSizeY() + newDiff)
  end
  do
    ;
    ((self._ui).static_QuestBg):ComputePos()
  end
end

PaGlobalFunc_MainDialog_Quest_IsFirstSet = function()
  -- function num : 0_18 , upvalues : Panel_Dialog_Main_Quest_Info
  local self = Panel_Dialog_Main_Quest_Info
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).isFirstOpen = true
end

PaGlobalFunc_MainDialog_Quest_IsFirstReset = function()
  -- function num : 0_19 , upvalues : Panel_Dialog_Main_Quest_Info
  local self = Panel_Dialog_Main_Quest_Info
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._value).isFirstOpen = false
end

PaGlobalFunc_MainDialog_Quest_Open = function()
  -- function num : 0_20 , upvalues : Panel_Dialog_Main_Quest_Info
  local self = Panel_Dialog_Main_Quest_Info
  self:open()
end

PaGlobalFunc_MainDialog_Quest_Close = function()
  -- function num : 0_21 , upvalues : Panel_Dialog_Main_Quest_Info
  local self = Panel_Dialog_Main_Quest_Info
  self:close()
end

PaGlobalFunc_MainDialog_Quest_Update = function()
  -- function num : 0_22 , upvalues : Panel_Dialog_Main_Quest_Info
  local self = Panel_Dialog_Main_Quest_Info
  self:update()
end

PaGlobalFunc_MainDialog_Quest_GetShow = function()
  -- function num : 0_23 , upvalues : Panel_Dialog_Main_Quest_Info
  local self = Panel_Dialog_Main_Quest_Info
  return ((self._ui).static_QuestBg):GetShow()
end

PaGlobalFunc_MainDialog_Quest_List2EventControlCreate = function(list_content, key)
  -- function num : 0_24
  local id = Int64toInt32(key)
  local dialogData = ToClient_GetCurrentDialogData()
  local simplequestData = dialogData:getHaveQuestAt(id)
  local questInfo = simplequestData:getQuestStaticStatusWrapper()
  local questTitle = questInfo:getTitle()
  local questTypeIcon = questInfo:getQuestType()
  local radioButton_Quest = (UI.getChildControl)(list_content, "RadioButton_Quest")
  local questName = (UI.getChildControl)(list_content, "StaticText_Quest_Name")
  local questTypeIcon = ((UI.getChildControl)(list_content, "Static_QuestTypeIcon"))
  local realTiTile = nil
  if simplequestData._isProgressing then
    realTiTile = questTitle .. PAGetString(Defines.StringSheet_GAME, "DIALOG_BUTTON_QUEST_PROGRESS")
  else
    if simplequestData._isComplete then
      realTiTile = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_QUEST_WINDOW_COMPLETEQUEST", "questTitle", questTitle)
    else
      realTiTile = questTitle
    end
  end
  local selecIndex = dialogData:getSelectedQuestIndex()
  radioButton_Quest:SetCheck(id == selecIndex)
  do
    local questType = questInfo:getQuestType()
    FGlobal_ChangeOnTextureForDialogQuestIcon(questTypeIcon, questType)
    radioButton_Quest:addInputEvent("Mouse_LUp", "PaGlobal_MainDialog_Quest_ClickQuestList(" .. id .. ")")
    questName:SetText(realTiTile)
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

PaGlobal_MainDialog_Quest_ClickQuestList = function(index)
  -- function num : 0_25 , upvalues : Panel_Dialog_Main_Quest_Info
  local self = Panel_Dialog_Main_Quest_Info
  ToClient_ClickQuestList(index)
  self:update_Quest_Infomation()
end

PaGlobalFunc_MainDialog_Quest_RewardToolTip = function(rewardType, show, rewardStr, index, mentalCardKey)
  -- function num : 0_26 , upvalues : Panel_Dialog_Main_Quest_Info
  local self = Panel_Dialog_Main_Quest_Info
  if (self._ui).expToolTip == nil then
    return 
  end
  if show == true then
    if __eRewardExp == rewardType then
      ((self._ui).expToolTip):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_EXP"))
    else
      if __eRewardSkillExp == rewardType then
        ((self._ui).expToolTip):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_SKILLEXP"))
      else
        if __eRewardLifeExp == rewardType then
          ((self._ui).expToolTip):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_PRODUCTEXP"))
        else
          if __eRewardIntimacy == rewardType then
            ((self._ui).expToolTip):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_INTIMACY"))
          else
            if __eRewardExpGrade == rewardType then
              ((self._ui).expToolTip):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_EXP_GRADE"))
            else
              if __eRewardSkillExpGrade == rewardType then
                ((self._ui).expToolTip):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_SKILLEXP_GRADE"))
              else
                if __eRewardKnowledge == rewardType then
                  local mentalCardSSW = ToClinet_getMentalCardStaticStatus(mentalCardKey)
                  if mentalCardSSW == nil then
                    return 
                  end
                  local mentalCardName = mentalCardSSW:getName()
                  local mentalCardDesc = mentalCardSSW:getDesc()
                  ;
                  ((self._ui).expToolTip):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_REWARD_TOOLTIP_KNOWLEDGE", "mentalCardName", mentalCardName, "mentalCardName2", mentalCardName))
                end
              end
            end
          end
        end
      end
    end
    do
      if rewardStr == "base" then
        ((self._ui).expToolTip):SetPosX((((self._ui).static_Quest_Reward_Basic)[index]):GetPosX())
        ;
        ((self._ui).expToolTip):SetPosY((((self._ui).static_Quest_Reward_Basic)[index]):GetPosY() - ((self._ui).expToolTip):GetSizeY() * 2)
      else
        if rewardStr == "select" then
          ((self._ui).expToolTip):SetPosX(((((self._ui).static_Quest_Reward_Select)[index]).icon):GetPosX())
          ;
          ((self._ui).expToolTip):SetPosY(((((self._ui).static_Quest_Reward_Select)[index]).icon):GetPosY() - ((self._ui).expToolTip):GetSizeY() * 2)
        end
      end
      ;
      ((self._ui).expToolTip):SetShow(true)
      ;
      ((self._ui).expToolTip):SetShow(false)
    end
  end
end

PaGlobalFunc_MainDialog_Quest_HandleClickedSelectedReward = function(selectIndex)
  -- function num : 0_27 , upvalues : Panel_Dialog_Main_Quest_Info
  local self = Panel_Dialog_Main_Quest_Info
  local leastIndex = (self._value).leastSelectReward
  ;
  (((self._ui).static_Quest_Reward_Select)[leastIndex]):EraseAllEffect()
  ;
  (((self._ui).static_Quest_Reward_Select)[selectIndex]):AddEffect("UI_Quest_Compensate", true, 0, 0)
  ;
  (((self._ui).static_Quest_Reward_Select)[selectIndex]):AddEffect("fUI_Light", false, 0, 0)
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._value).leastSelectReward = selectIndex
  ReqeustDialog_selectReward(selectIndex)
end

PaGlobalFunc_MainDialog_Quest_InteractionCheck = function()
  -- function num : 0_28 , upvalues : Panel_Dialog_Main_Quest_Info
  local self = Panel_Dialog_Main_Quest_Info
  local isShow = ((self._ui).static_QuestBg):GetShow()
  if isShow == false then
    return 
  end
  local dialogData = ToClient_GetCurrentDialogData()
  if dialogData == nil then
    return 
  end
  local questButtonCount = dialogData:getQuestButtonCount()
  if questButtonCount == 0 then
    return 
  end
  audioPostEvent_SystemUi(0, 0)
  ReqeustDialog_selectReward(selectIndex)
  ToClient_ClickQuestButton(0)
end

FromClient_InitMainDialog_Quest = function()
  -- function num : 0_29 , upvalues : Panel_Dialog_Main_Quest_Info
  local self = Panel_Dialog_Main_Quest_Info
  self:initialize()
  self:Resize()
end

FromClient_onScreenResize_MainDialog_Quest = function()
  -- function num : 0_30 , upvalues : Panel_Dialog_Main_Quest_Info
  local self = Panel_Dialog_Main_Quest_Info
  self:Resize()
end

registerEvent("FromClient_luaLoadComplete", "FromClient_InitMainDialog_Quest")

