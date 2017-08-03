-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\dialogue\panel_dialog_reward.luac 

-- params : ...
-- function num : 0
local UI_RewardType = CppEnums.RewardType
local UI_TM = CppEnums.TextMode
local UI_color = Defines.Color
local _questrewardSlotConfig = {createIcon = true, createBorder = true, createCount = true, createClassEquipBG = true, createCash = true}
local _baseRewardCount = 0
local _maxBaseSlotCount = 12
local _uiBackBaseReward = {}
local _listBaseRewardSlots = {}
local _selectRewardCount = 0
local _maxSelectSlotCount = 6
local _uiButtonSelectRewardSlots = {}
local _listSelectRewardSlots = {}
local _isSelectReward = false
local _selectRewardItemNameArry = {}
local _selectRewardItemName = nil
local _equipRewardItemCount = 0
local questDescPosY = 0
local questDescSizeY = 0
local questDescgap = 0
local _uiCheckButton = (UI.getChildControl)(Panel_Npc_Quest_Reward, "CheckButton_0")
local _uiQuestTitle = (UI.getChildControl)(Panel_Npc_Quest_Reward, "StaticText_Quest_Title")
local _uiQuestNpc = (UI.getChildControl)(Panel_Npc_Quest_Reward, "StaticText_ClearNpc")
local _uiQuestDesc = (UI.getChildControl)(Panel_Npc_Quest_Reward, "StaticText_Quest_Desc")
local reward_CloseButton = (UI.getChildControl)(Panel_Npc_Quest_Reward, "Button_Win_Close")
local defaultRewardText = (UI.getChildControl)(Panel_Npc_Quest_Reward, "Static_Menu_Reward")
local selectRewardText = (UI.getChildControl)(Panel_Npc_Quest_Reward, "Static_Menu_Reward_Select")
local expTooltipBase = (UI.getChildControl)(Panel_CheckedQuest, "StaticText_Notice_2")
local expTooltip = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_Npc_Quest_Reward, "expTooltip")
CopyBaseProperty(expTooltipBase, expTooltip)
expTooltip:SetColor(UI_color.C_FFFFFFFF)
expTooltip:SetAlpha(1)
expTooltip:SetFontColor(UI_color.C_FFFFFFFF)
expTooltip:SetAutoResize(true)
expTooltip:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
expTooltip:SetTextHorizonLeft()
expTooltip:SetShow(false)
local checkButtonOnTexture = _uiCheckButton:getOnTexture()
local checkButtonClickTexture = _uiCheckButton:getClickTexture()
reward_CloseButton:addInputEvent("Mouse_LUp", "FGlobal_ShowRewardList(false, " .. 0 .. ")")
for index = 0, _maxBaseSlotCount - 1 do
  local backBaseReward = (UI.getChildControl)(Panel_Npc_Quest_Reward, "Static_Slot_" .. index)
  backBaseReward:SetIgnore(true)
  _uiBackBaseReward[index] = backBaseReward
  local slot = {}
  ;
  (SlotItem.new)(slot, "BaseReward_" .. index, index, backBaseReward, _questrewardSlotConfig)
  slot:createChild()
  ;
  (slot.icon):SetPosX(-2)
  ;
  (slot.icon):SetPosY(-2)
  _listBaseRewardSlots[index] = slot
  Panel_Tooltip_Item_SetPosition(index, slot, "Dialog_QuestReward_Base")
end
for index = 0, _maxSelectSlotCount - 1 do
  local buttonSelectRewardSlot = (UI.getChildControl)(Panel_Npc_Quest_Reward, "CheckButton_" .. index)
  buttonSelectRewardSlot:addInputEvent("Mouse_LUp", "HandleClickedSelectedReward(" .. index .. ")")
  _uiButtonSelectRewardSlots[index] = buttonSelectRewardSlot
  local slot = {}
  ;
  (SlotItem.new)(slot, "SelectReward_" .. index, index, buttonSelectRewardSlot, _questrewardSlotConfig)
  slot:createChild()
  ;
  (slot.icon):SetPosX(3)
  ;
  (slot.icon):SetPosY(3)
  ;
  (slot.icon):SetIgnore(true)
  _listSelectRewardSlots[index] = slot
  Panel_Tooltip_Item_SetPosition(index, slot, "Dialog_QuestReward_Select")
end
QuestReward_Init = function()
  -- function num : 0_0 , upvalues : defaultRewardText, UI_TM, selectRewardText
  defaultRewardText:SetTextMode(UI_TM.eTextMode_AutoWrap)
  defaultRewardText:SetText(PAGetString(Defines.StringSheet_RESOURCE, "DIALOGUE_REWARD_TXT_REWARD"))
  defaultRewardText:SetAutoResize(true)
  selectRewardText:SetTextMode(UI_TM.eTextMode_AutoWrap)
  selectRewardText:SetText(PAGetString(Defines.StringSheet_RESOURCE, "DIALOGUE_REWARD_TXT_SREWARD"))
  selectRewardText:SetAutoResize(true)
end

HandleClickedSelectedReward = function(selectIndex)
  -- function num : 0_1 , upvalues : _uiButtonSelectRewardSlots, checkButtonClickTexture, _isSelectReward, _selectRewardItemName, _selectRewardItemNameArry
  for index = 0, 5 do
    (_uiButtonSelectRewardSlots[index]):SetCheck(false)
    ;
    (_uiButtonSelectRewardSlots[index]):EraseAllEffect()
  end
  ;
  (_uiButtonSelectRewardSlots[selectIndex]):AddEffect("UI_Quest_Compensate_Loop", true, 0, 0)
  ;
  (_uiButtonSelectRewardSlots[selectIndex]):SetCheck(true)
  ;
  (_uiButtonSelectRewardSlots[selectIndex]):setRenderTexture(checkButtonClickTexture)
  _isSelectReward = true
  ReqeustDialog_selectReward(selectIndex)
  _selectRewardItemName = _selectRewardItemNameArry[selectIndex]
end

FGlobal_SelectedRewardConfirm = function()
  -- function num : 0_2 , upvalues : _selectRewardItemName
  if _selectRewardItemName ~= nil then
    return _selectRewardItemName
  else
    return false
  end
end

FGlobal_SelectRewardItemNameClear = function()
  -- function num : 0_3 , upvalues : _selectRewardItemName
  _selectRewardItemName = nil
end

HandleOnSelectedReward = function(index)
  -- function num : 0_4 , upvalues : _uiButtonSelectRewardSlots, checkButtonOnTexture
  Panel_Tooltip_Item_Show_GeneralStatic(index, "Dialog_QuestReward_Select", true)
  ;
  (_uiButtonSelectRewardSlots[index]):setRenderTexture(checkButtonOnTexture)
end

local setReward = function(uiSlot, reward, index, questType)
  -- function num : 0_5 , upvalues : UI_RewardType, _uiButtonSelectRewardSlots
  uiSlot._type = reward._type
  if UI_RewardType.RewardType_Exp == reward._type then
    (uiSlot.count):SetText("")
    ;
    (uiSlot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/EXP.dds")
    ;
    (uiSlot.icon):addInputEvent("Mouse_On", "rewardTooltip( \"Exp\", true, \"" .. questType .. "\", " .. index .. " )")
    ;
    (uiSlot.icon):addInputEvent("Mouse_Out", "rewardTooltip( \"Exp\", false, \"" .. questType .. "\", " .. index .. " )")
  else
    if UI_RewardType.RewardType_SkillExp == reward._type then
      (uiSlot.count):SetText("")
      ;
      (uiSlot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/SkillExp.dds")
      ;
      (uiSlot.icon):addInputEvent("Mouse_On", "rewardTooltip( \"SkillExp\", true, \"" .. questType .. "\", " .. index .. " )")
      ;
      (uiSlot.icon):addInputEvent("Mouse_Out", "rewardTooltip( \"SkillExp\", false, \"" .. questType .. "\", " .. index .. " )")
    else
      if UI_RewardType.RewardType_ProductExp == reward._type then
        (uiSlot.count):SetText("")
        ;
        (uiSlot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/EXP.dds")
        ;
        (uiSlot.icon):addInputEvent("Mouse_On", "rewardTooltip( \"ProductExp\", true, \"" .. questType .. "\", " .. index .. " )")
        ;
        (uiSlot.icon):addInputEvent("Mouse_Out", "rewardTooltip( \"ProductExp\", false, \"" .. questType .. "\", " .. index .. " )")
      else
        if UI_RewardType.RewardType_Item == reward._type then
          local itemStatic = getItemEnchantStaticStatus(ItemEnchantKey(reward._item))
          uiSlot:setItemByStaticStatus(itemStatic, reward._count)
          uiSlot._item = reward._item
          if questType == "main" then
            (uiSlot.icon):addInputEvent("Mouse_On", "Panel_Tooltip_Item_Show_GeneralStatic(" .. index .. ",\"Dialog_QuestReward_Base\",true)")
            ;
            (uiSlot.icon):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_Show_GeneralStatic(" .. index .. ",\"Dialog_QuestReward_Base\",false)")
          else
            ;
            (uiSlot.icon):addInputEvent("Mouse_On", "")
            ;
            (uiSlot.icon):addInputEvent("Mouse_Out", "")
            ;
            (_uiButtonSelectRewardSlots[index]):addInputEvent("Mouse_On", "HandleOnSelectedReward(" .. index .. ")")
            ;
            (_uiButtonSelectRewardSlots[index]):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_Show_GeneralStatic(" .. index .. ",\"Dialog_QuestReward_Select\",false)")
          end
          return reward._isEquipable
        else
          do
            if UI_RewardType.RewardType_Intimacy == reward._type then
              (uiSlot.count):SetText(tostring(reward._value))
              ;
              (uiSlot.icon):ChangeTextureInfoName("Icon/New_Icon/00000000_Special_Contributiveness.dds")
              ;
              (uiSlot.icon):addInputEvent("Mouse_On", "rewardTooltip( \"Intimacy\", true, \"" .. questType .. "\", " .. index .. " )")
              ;
              (uiSlot.icon):addInputEvent("Mouse_Out", "rewardTooltip( \"Intimacy\", false, \"" .. questType .. "\", " .. index .. " )")
            else
              if UI_RewardType.RewardType_Knowledge == reward._type then
                (uiSlot.count):SetText("")
                ;
                (uiSlot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/00000000_know_icon.dds")
                ;
                (uiSlot.icon):addInputEvent("Mouse_On", "rewardTooltip( \"Knowledge\", true, \"" .. questType .. "\", " .. index .. "," .. reward._mentalCard .. " )")
                ;
                (uiSlot.icon):addInputEvent("Mouse_Out", "rewardTooltip( \"Knowledge\", false, \"" .. questType .. "\", " .. index .. "," .. reward._mentalCard .. " )")
              else
                ;
                (uiSlot.icon):addInputEvent("Mouse_On", "")
                ;
                (uiSlot.icon):addInputEvent("Mouse_Out", "")
              end
            end
            return false
          end
        end
      end
    end
  end
end

rewardTooltip = function(type, show, questtype, index, mentalCardKey)
  -- function num : 0_6 , upvalues : expTooltip, _uiBackBaseReward, _uiButtonSelectRewardSlots
  if show == true then
    if type == "Exp" then
      expTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_EXP"))
    else
      if type == "SkillExp" then
        expTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_SKILLEXP"))
      else
        if type == "ProductExp" then
          expTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_PRODUCTEXP"))
        else
          if type == "Intimacy" then
            expTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_INTIMACY"))
          else
            if type == "Knowledge" then
              local mentalCardSSW = ToClinet_getMentalCardStaticStatus(mentalCardKey)
              local mentalCardName = mentalCardSSW:getName()
              local mentalCardDesc = mentalCardSSW:getDesc()
              expTooltip:SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_REWARD_TOOLTIP_KNOWLEDGE", "mentalCardName", mentalCardName, "mentalCardName2", mentalCardName))
            end
          end
        end
      end
    end
    do
      if questtype == "main" then
        expTooltip:SetPosX((_uiBackBaseReward[index]):GetPosX() - expTooltip:GetSizeX() / 2)
        expTooltip:SetPosY((_uiBackBaseReward[index]):GetPosY() - expTooltip:GetSizeY() - 10)
      else
        expTooltip:SetPosX((_uiButtonSelectRewardSlots[index]):GetPosX() - expTooltip:GetSizeX() / 2)
        expTooltip:SetPosY((_uiButtonSelectRewardSlots[index]):GetPosY() - expTooltip:GetSizeY())
      end
      expTooltip:SetShow(true)
      expTooltip:SetShow(false)
    end
  end
end

FGlobal_SetRewardList = function(baseReward, selectReward, questData)
  -- function num : 0_7 , upvalues : _baseRewardCount, _selectRewardCount, _maxBaseSlotCount, _uiBackBaseReward, setReward, _listBaseRewardSlots, _uiButtonSelectRewardSlots, _maxSelectSlotCount, _listSelectRewardSlots, _selectRewardItemNameArry, _equipRewardItemCount, _uiQuestTitle, _uiQuestNpc, _uiQuestDesc, UI_TM, questDescSizeY, questDescPosY, questDescgap
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local userLevel = (selfPlayer:get()):getLevel()
  _baseRewardCount = #baseReward
  _selectRewardCount = #selectReward
  FGlobal_SelectRewardItemNameClear()
  Panel_Npc_Quest_Reward:deleteConsoleUIGroup(0)
  Panel_Npc_Quest_Reward:deleteConsoleUIGroup(1)
  local group_0 = (Panel_Npc_Quest_Reward:addConsoleUIGroup(0, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT))
  local group_1 = nil
  if _selectRewardCount > 0 then
    group_1 = Panel_Npc_Quest_Reward:addConsoleUIGroup(1, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  end
  for index = 0, _maxBaseSlotCount - 1 do
    (_uiBackBaseReward[index]):EraseAllEffect()
    if index < _baseRewardCount then
      setReward(_listBaseRewardSlots[index], baseReward[index + 1], index, "main")
      ;
      (_uiBackBaseReward[index]):SetShow(true)
      group_0:addControl(index % 6, index / 6, 6, 2, (_listBaseRewardSlots[index]).icon)
    else
      ;
      (_uiBackBaseReward[index]):SetShow(false)
    end
  end
  for index = 0, 5 do
    (_uiButtonSelectRewardSlots[index]):SetCheck(false)
  end
  local _equipRewardCount = 0
  local _equipEnableSlot = nil
  for index = 0, _maxSelectSlotCount - 1 do
    (_uiButtonSelectRewardSlots[index]):EraseAllEffect()
    if index < _selectRewardCount then
      local isEquipable = setReward(_listSelectRewardSlots[index], selectReward[index + 1], index, "sub")
      if isEquipable then
        _equipRewardCount = _equipRewardCount + 1
        _equipEnableSlot = index
      end
      ;
      (_uiButtonSelectRewardSlots[index]):SetShow(true)
      ;
      (_uiButtonSelectRewardSlots[index]):SetCheck(false)
      ;
      (_uiButtonSelectRewardSlots[index]):AddEffect("UI_Quest_Compensate", true, 0, 0)
      ;
      (_uiButtonSelectRewardSlots[index]):AddEffect("fUI_Light", false, 0, 0)
      group_1:addControl(index, 0, 6, 1, _uiButtonSelectRewardSlots[index])
    else
      do
        ;
        (_uiButtonSelectRewardSlots[index]):SetShow(false)
        if userLevel < 50 and _selectRewardCount > 0 then
          (_uiButtonSelectRewardSlots[0]):SetCheck(true)
          HandleClickedSelectedReward(0)
        end
        do
          do
            if index < _selectRewardCount then
              local itemStatic = getItemEnchantStaticStatus(ItemEnchantKey((selectReward[index + 1])._item))
              -- DECOMPILER ERROR at PC185: Confused about usage of register: R14 in 'UnsetPending'

              _selectRewardItemNameArry[index] = itemStatic:getName()
            end
            -- DECOMPILER ERROR at PC188: Confused about usage of register: R13 in 'UnsetPending'

            _selectRewardItemNameArry[index] = nil
            -- DECOMPILER ERROR at PC189: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC189: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC189: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC189: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  _equipRewardItemCount = _equipRewardCount
  if _equipRewardCount == 1 and _equipEnableSlot ~= nil then
    local classType = (getSelfPlayer()):getClassType()
    if classType == 0 or classType == 24 then
      classType = 4
    else
      classType = 0
    end
    local itemStatic = getItemEnchantStaticStatus(ItemEnchantKey((selectReward[_equipEnableSlot + 1])._item))
    if ((itemStatic:get())._usableClassType):isOn(classType) == false then
      HandleClickedSelectedReward(_equipEnableSlot)
    end
  end
  do
    if questData ~= nil then
      _uiQuestTitle:SetText(questData:getTitle())
      _uiQuestTitle:ChangeTextureInfoName(questData:getIconPath())
      _uiQuestNpc:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "QUESTLIST_COMPLETETARGET", "getCompleteDisplay", questData:getCompleteDisplay()))
      _uiQuestDesc:SetAutoResize(true)
      _uiQuestDesc:SetTextMode(UI_TM.eTextMode_AutoWrap)
      _uiQuestDesc:SetText(questData:getDesc())
      _uiQuestDesc:SetPosY(-49)
      _uiQuestNpc:SetPosY(-94)
      _uiQuestTitle:SetPosY(-74)
      questDescSizeY = _uiQuestDesc:GetSizeY()
      questDescPosY = _uiQuestDesc:GetPosY()
      questDescgap = questDescSizeY + questDescPosY + 5
      if questDescSizeY + questDescPosY > 0 then
        _uiQuestDesc:SetPosY(-49 - questDescgap)
        _uiQuestNpc:SetPosY(-94 - questDescgap)
        _uiQuestTitle:SetPosY(-74 - questDescgap)
      end
      _uiQuestTitle:ComputePos()
      _uiQuestNpc:ComputePos()
      _uiQuestDesc:ComputePos()
      _uiQuestTitle:SetShow(true)
      _uiQuestNpc:SetShow(true)
      _uiQuestDesc:SetShow(true)
    else
      _uiQuestTitle:SetShow(false)
      _uiQuestNpc:SetShow(false)
      _uiQuestDesc:SetShow(false)
    end
  end
end

FGlobal_ShowRewardList = function(isVisible, isManualClick)
  -- function num : 0_8 , upvalues : _baseRewardCount, _selectRewardCount
  if isVisible then
    if _baseRewardCount > 0 or _selectRewardCount > 0 then
      Panel_Npc_Quest_Reward:SetShow(true)
    else
      Panel_Npc_Quest_Reward:SetShow(false)
      if Panel_Npc_Quest_Reward:IsUISubApp() == true then
        Panel_Npc_Quest_Reward:CloseUISubApp()
      end
    end
  else
    if isFlushedUI() and ((getSelfPlayer()):get()):getLevel() < 11 and isManualClick ~= nil and isManualClick == 0 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DIALOG_REWARD_SHOWREWARDLIST"))
      return 
    end
    Panel_Npc_Quest_Reward:SetShow(false)
    if Panel_Npc_Quest_Reward:IsUISubApp() == true then
      Panel_Npc_Quest_Reward:CloseUISubApp()
    end
  end
end

FGlobal_getSelectRewardPosition = function()
  -- function num : 0_9 , upvalues : _uiButtonSelectRewardSlots
  local Position = {_Return = false, _PosX = -1, _PosY = -1}
  Position._Return = true
  Position._PosX = (_uiButtonSelectRewardSlots[0]):GetPosX() + Panel_Npc_Quest_Reward:GetPosX()
  Position._PosY = (_uiButtonSelectRewardSlots[0]):GetPosY() + Panel_Npc_Quest_Reward:GetPosY()
  return Position
end

local _buttonQuestion = (UI.getChildControl)(Panel_Npc_Quest_Reward, "Button_Question")
_buttonQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelQuestReward\" )")
_buttonQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelQuestReward\", \"true\")")
_buttonQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelQuestReward\", \"false\")")
QuestReward_Init()

