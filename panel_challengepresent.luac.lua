-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\challengepresent\panel_challengepresent.luac 

-- params : ...
-- function num : 0
local UI_RewardType = CppEnums.RewardType
local UI_TM = CppEnums.TextMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local IM = CppEnums.EProcessorInputMode
Panel_ChallengePresent:SetShow(false)
Panel_ChallengePresent:setGlassBackground(true)
Panel_ChallengePresent:ActiveMouseEventEffect(true)
Panel_ChallengePresent:RegisterShowEventFunc(true, "Panel_ChallengePresent_ShowAni()")
Panel_ChallengePresent:RegisterShowEventFunc(false, "Panel_ChallengePresent_HideAni()")
local _questrewardSlotConfig = {createIcon = true, createBorder = true, createCount = true, createClassEquipBG = true, createCash = true}
local _remainRewardCount = 0
local _baseRewardCount = 0
local _maxBaseSlotCount = 6
local _uiBackBaseReward = {}
local _listBaseRewardSlots = {}
local _selectRewardCount = 0
local _maxSelectSlotCount = 6
local _uiButtonSelectRewardSlots = {}
local _listSelectRewardSlots = {}
local isHaveSelectReward = false
local specialRewardCount = 0
local questDescPosY = 0
local questDescSizeY = 0
local questDescgap = 0
local currentReward = 0
local selectedRewardSlotIndex = 0
local acceptButton_isShow = true
local specialRewardWrapper = {}
local normalRewardWrapper = {}
local isInit = true
local beforBenefitReward = 0
local challengeTitleText = (UI.getChildControl)(Panel_ChallengePresent, "StaticText_EventTitle")
local remainRewardCount = (UI.getChildControl)(Panel_ChallengePresent, "StaticText_RemainRewardCountText")
local reward_CloseButton = (UI.getChildControl)(Panel_ChallengePresent, "Button_Close")
local reward_AcceptButton = (UI.getChildControl)(Panel_ChallengePresent, "Button_GiveMe")
local reward_CancelButton = (UI.getChildControl)(Panel_ChallengePresent, "Button_Cancel")
local specialRewardIcon = (UI.getChildControl)(Panel_SpecialReward_Alert, "Static_Icon")
specialRewardIcon:addInputEvent("Mouse_LUp", "FGlobal_ChallengePresent_Open()")
local _buttonQuestion = (UI.getChildControl)(Panel_ChallengePresent, "Button_Question")
_buttonQuestion:SetShow(false)
Panel_ChallengePresent_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  local aniInfo1 = Panel_ChallengePresent:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.12)
  aniInfo1.AxisX = Panel_ChallengePresent:GetSizeX() / 2
  aniInfo1.AxisY = Panel_ChallengePresent:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_ChallengePresent:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.12)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_ChallengePresent:GetSizeX() / 2
  aniInfo2.AxisY = Panel_ChallengePresent:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_ChallengePresent_HideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color
  local aniInfo1 = Panel_ChallengePresent:addColorAnimation(0, 0.1, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

local SpecialSelectReward = {_uiRewardSlot_0 = (UI.getChildControl)(Panel_ChallengePresent, "Static_ItemBG_0"), _uiRewardSlot_1 = (UI.getChildControl)(Panel_ChallengePresent, "Static_ItemBG_1"), _uiRewardSlot_2 = (UI.getChildControl)(Panel_ChallengePresent, "Static_ItemBG_2"), _uiRewardSlot_3 = (UI.getChildControl)(Panel_ChallengePresent, "Static_ItemBG_3"), _uiRewardSlot_4 = (UI.getChildControl)(Panel_ChallengePresent, "Static_ItemBG_4"), _uiRewardSlot_5 = (UI.getChildControl)(Panel_ChallengePresent, "Static_ItemBG_5"), _uiCheckButton_0 = (UI.getChildControl)(Panel_ChallengePresent, "Checkbox_SelectedBG_0"), _uiCheckButton_1 = (UI.getChildControl)(Panel_ChallengePresent, "Checkbox_SelectedBG_1"), _uiCheckButton_2 = (UI.getChildControl)(Panel_ChallengePresent, "Checkbox_SelectedBG_2"), _uiCheckButton_3 = (UI.getChildControl)(Panel_ChallengePresent, "Checkbox_SelectedBG_3"), _uiCheckButton_4 = (UI.getChildControl)(Panel_ChallengePresent, "Checkbox_SelectedBG_4"), _uiCheckButton_5 = (UI.getChildControl)(Panel_ChallengePresent, "Checkbox_SelectedBG_5")}
local eventDesc = (UI.getChildControl)(Panel_ChallengePresent, "StaticText_EventDesc")
local checkButtonOnTexture = (SpecialSelectReward._uiCheckButton_0):getOnTexture()
local checkButtonClickTexture = (SpecialSelectReward._uiCheckButton_0):getClickTexture()
reward_CloseButton:addInputEvent("Mouse_LUp", "ShowSpecialRewardList(false)")
reward_AcceptButton:addInputEvent("Mouse_LUp", "Panel_ChallengePresent_AcceptReward_Clicked()")
reward_CancelButton:addInputEvent("Mouse_LUp", "ShowSpecialRewardList(false)")
for index = 0, _maxBaseSlotCount - 1 do
  local backBaseReward = (UI.getChildControl)(Panel_ChallengePresent, "Static_Slot_" .. index)
  backBaseReward:SetIgnore(true)
  _uiBackBaseReward[index] = backBaseReward
  local slot = {}
  ;
  (SlotItem.new)(slot, "BaseReward_" .. index, index, backBaseReward, _questrewardSlotConfig)
  slot:createChild()
  ;
  (slot.icon):SetPosX(0)
  ;
  (slot.icon):SetPosY(0)
  _listBaseRewardSlots[index] = slot
  Panel_Tooltip_Item_SetPosition(index, slot, "Dialog_ChallengePcroomReward_Base")
end
for index = 0, _maxSelectSlotCount - 1 do
  local buttonSelectRewardSlot = (UI.getChildControl)(Panel_ChallengePresent, "Checkbox_SelectedBG_" .. index)
  buttonSelectRewardSlot:addInputEvent("Mouse_LUp", "HandleClicked_SelectedReward(" .. index .. ")")
  _uiButtonSelectRewardSlots[index] = buttonSelectRewardSlot
  local slot = {}
  ;
  (SlotItem.new)(slot, "SelectReward_" .. index, index, buttonSelectRewardSlot, _questrewardSlotConfig)
  slot:createChild()
  ;
  (slot.icon):SetPosX(4)
  ;
  (slot.icon):SetPosY(4)
  ;
  (slot.icon):SetIgnore(false)
  _listSelectRewardSlots[index] = slot
  Panel_Tooltip_Item_SetPosition(index, slot, "Dialog_ChallengeReward_Select")
end
HandleClicked_SelectedReward = function(selectIndex)
  -- function num : 0_2 , upvalues : selectedRewardSlotIndex, _uiButtonSelectRewardSlots
  selectedRewardSlotIndex = selectIndex
  for index = 0, 5 do
    (_uiButtonSelectRewardSlots[index]):SetCheck(false)
    ;
    (_uiButtonSelectRewardSlots[index]):EraseAllEffect()
  end
  ;
  (_uiButtonSelectRewardSlots[selectIndex]):AddEffect("UI_Quest_Compensate_Loop", true, 0, 0)
  ;
  (_uiButtonSelectRewardSlots[selectIndex]):SetCheck(true)
end

ShowTooltip_SpecialReward = function(index)
  -- function num : 0_3 , upvalues : _uiButtonSelectRewardSlots, checkButtonOnTexture
  Panel_Tooltip_Item_Show_GeneralStatic(index, "Dialog_ChallengeReward_Select", true)
  ;
  (_uiButtonSelectRewardSlots[index]):setRenderTexture(checkButtonOnTexture)
end

Set_Special_Reward = function(uiSlot, reward, index, questType)
  -- function num : 0_4 , upvalues : UI_RewardType, _uiButtonSelectRewardSlots
  uiSlot._type = reward._type
  if UI_RewardType.RewardType_Exp == reward._type then
    (uiSlot.count):SetText("")
    ;
    (uiSlot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/EXP.dds")
    ;
    (uiSlot.icon):addInputEvent("Mouse_On", "SpecialRewardTooltip( \"Exp\", true, \"" .. questType .. "\", " .. index .. " )")
    ;
    (uiSlot.icon):addInputEvent("Mouse_Out", "SpecialRewardTooltip( \"Exp\", false, \"" .. questType .. "\", " .. index .. " )")
  else
    if UI_RewardType.RewardType_SkillExp == reward._type then
      (uiSlot.count):SetText("")
      ;
      (uiSlot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/SkillExp.dds")
      ;
      (uiSlot.icon):addInputEvent("Mouse_On", "SpecialRewardTooltip( \"SkillExp\", true, \"" .. questType .. "\", " .. index .. " )")
      ;
      (uiSlot.icon):addInputEvent("Mouse_Out", "SpecialRewardTooltip( \"SkillExp\", false, \"" .. questType .. "\", " .. index .. " )")
    else
      if UI_RewardType.RewardType_ProductExp == reward._type then
        (uiSlot.count):SetText("")
        ;
        (uiSlot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/EXP.dds")
        ;
        (uiSlot.icon):addInputEvent("Mouse_On", "SpecialRewardTooltip( \"ProductExp\", true, \"" .. questType .. "\", " .. index .. " )")
        ;
        (uiSlot.icon):addInputEvent("Mouse_Out", "SpecialRewardTooltip( \"ProductExp\", false, \"" .. questType .. "\", " .. index .. " )")
      else
        if UI_RewardType.RewardType_Item == reward._type then
          local itemStatic = getItemEnchantStaticStatus(ItemEnchantKey(reward._item))
          uiSlot:setItemByStaticStatus(itemStatic, reward._count)
          uiSlot._item = reward._item
          if questType == "main" then
            (uiSlot.icon):addInputEvent("Mouse_On", "Panel_Tooltip_Item_Show_GeneralStatic(" .. index .. ",\"Dialog_ChallengePcroomReward_Base\",true)")
            ;
            (uiSlot.icon):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_Show_GeneralStatic(" .. index .. ",\"Dialog_ChallengePcroomReward_Base\",false)")
          else
            ;
            (uiSlot.icon):addInputEvent("Mouse_On", "")
            ;
            (uiSlot.icon):addInputEvent("Mouse_Out", "")
            ;
            (_uiButtonSelectRewardSlots[index]):addInputEvent("Mouse_On", "ShowTooltip_SpecialReward(" .. index .. ")")
            ;
            (_uiButtonSelectRewardSlots[index]):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_Show_GeneralStatic(" .. index .. ",\"Dialog_ChallengePcroomReward_Select\",false)")
          end
          return reward._isEquipable
        else
          do
            if UI_RewardType.RewardType_Intimacy == reward._type then
              (uiSlot.count):SetText(tostring(reward._value))
              ;
              (uiSlot.icon):ChangeTextureInfoName("Icon/New_Icon/00000000_Special_Contributiveness.dds")
              ;
              (uiSlot.icon):addInputEvent("Mouse_On", "SpecialRewardTooltip( \"Intimacy\", true, \"" .. questType .. "\", " .. index .. " )")
              ;
              (uiSlot.icon):addInputEvent("Mouse_Out", "SpecialRewardTooltip( \"Intimacy\", false, \"" .. questType .. "\", " .. index .. " )")
            else
              ;
              (uiSlot.icon):addInputEvent("Mouse_On", "")
              ;
              (uiSlot.icon):addInputEvent("Mouse_Out", "")
            end
            return false
          end
        end
      end
    end
  end
end

SpecialRewardTooltip = function(type, show, questtype, index)
  -- function num : 0_5 , upvalues : _uiBackBaseReward, _uiButtonSelectRewardSlots
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
          end
        end
      end
    end
    if questtype == "main" then
      expTooltip:SetPosX((_uiBackBaseReward[index]):GetPosX() - expTooltip:GetSizeX() / 2)
      expTooltip:SetPosY((_uiBackBaseReward[index]):GetPosY() - expTooltip:GetSizeY() - 10)
    else
      expTooltip:SetPosX((_uiButtonSelectRewardSlots[index]):GetPosX() - expTooltip:GetSizeX() / 2)
      expTooltip:SetPosY((_uiButtonSelectRewardSlots[index]):GetPosY() - expTooltip:GetSizeY())
    end
    expTooltip:SetShow(true)
  else
    expTooltip:SetShow(false)
  end
end

FromClient_SpecialReward_UpdateText = function()
  -- function num : 0_6 , upvalues : specialRewardCount, currentReward, challengeTitleText, eventDesc, isHaveSelectReward, remainRewardCount
  specialRewardCount = 0
  local rewardCount = ToClient_GetBenefitRewardInfoCount()
  if rewardCount <= 0 then
    Panel_SpecialReward_Alert:SetShow(false)
  else
    Panel_SpecialReward_Alert:SetShow(true)
  end
  currentReward = rewardCount - 1
  local rewardWrapper = ToClient_GetBenefitRewardInfoWrapper(currentReward)
  if rewardWrapper ~= nil then
    local baseCount = rewardWrapper:getBaseRewardCount()
    challengeTitleText:SetText(rewardWrapper:getName())
    eventDesc:SetText(rewardWrapper:getDesc())
    local _baseReward = {}
    for idx = 1, baseCount do
      local baseReward = rewardWrapper:getBaseRewardAt(idx - 1)
      _baseReward[idx] = {}
      -- DECOMPILER ERROR at PC46: Confused about usage of register: R9 in 'UnsetPending'

      ;
      (_baseReward[idx])._type = baseReward._type
      -- DECOMPILER ERROR at PC55: Confused about usage of register: R9 in 'UnsetPending'

      if (CppEnums.RewardType).RewardType_Exp == baseReward._type then
        (_baseReward[idx])._exp = baseReward._experience
      else
        -- DECOMPILER ERROR at PC65: Confused about usage of register: R9 in 'UnsetPending'

        if (CppEnums.RewardType).RewardType_SkillExp == baseReward._type then
          (_baseReward[idx])._exp = baseReward._skillExperience
        else
          -- DECOMPILER ERROR at PC75: Confused about usage of register: R9 in 'UnsetPending'

          if (CppEnums.RewardType).RewardType_ProductExp == baseReward._type then
            (_baseReward[idx])._exp = baseReward._productExperience
          else
            -- DECOMPILER ERROR at PC86: Confused about usage of register: R9 in 'UnsetPending'

            if (CppEnums.RewardType).RewardType_Item == baseReward._type then
              (_baseReward[idx])._item = baseReward:getItemEnchantKey()
              -- DECOMPILER ERROR at PC89: Confused about usage of register: R9 in 'UnsetPending'

              ;
              (_baseReward[idx])._count = baseReward._itemCount
            else
              -- DECOMPILER ERROR at PC100: Confused about usage of register: R9 in 'UnsetPending'

              if (CppEnums.RewardType).RewardType_Intimacy == baseReward._type then
                (_baseReward[idx])._character = baseReward:getIntimacyCharacter()
                -- DECOMPILER ERROR at PC103: Confused about usage of register: R9 in 'UnsetPending'

                ;
                (_baseReward[idx])._value = baseReward._intimacyValue
              end
            end
          end
        end
      end
    end
    local selectCount = rewardWrapper:getSelectRewardCount()
    local _selectReward = {}
    if selectCount > 0 then
      isHaveSelectReward = true
      for idx = 1, selectCount do
        local selectReward = rewardWrapper:getSelectRewardAt(idx - 1)
        _selectReward[idx] = {}
        -- DECOMPILER ERROR at PC123: Confused about usage of register: R11 in 'UnsetPending'

        ;
        (_selectReward[idx])._type = selectReward._type
        -- DECOMPILER ERROR at PC132: Confused about usage of register: R11 in 'UnsetPending'

        if (CppEnums.RewardType).RewardType_Exp == selectReward._type then
          (_selectReward[idx])._exp = selectReward._experience
        else
          -- DECOMPILER ERROR at PC142: Confused about usage of register: R11 in 'UnsetPending'

          if (CppEnums.RewardType).RewardType_SkillExp == selectReward._type then
            (_selectReward[idx])._exp = selectReward._skillExperience
          else
            -- DECOMPILER ERROR at PC152: Confused about usage of register: R11 in 'UnsetPending'

            if (CppEnums.RewardType).RewardType_ProductExp == selectReward._type then
              (_selectReward[idx])._exp = selectReward._productExperience
            else
              -- DECOMPILER ERROR at PC163: Confused about usage of register: R11 in 'UnsetPending'

              if (CppEnums.RewardType).RewardType_Item == selectReward._type then
                (_selectReward[idx])._item = selectReward:getItemEnchantKey()
                -- DECOMPILER ERROR at PC166: Confused about usage of register: R11 in 'UnsetPending'

                ;
                (_selectReward[idx])._count = selectReward._itemCount
                local selfPlayer = getSelfPlayer()
                if selfPlayer ~= nil then
                  local classType = selfPlayer:getClassType()
                  -- DECOMPILER ERROR at PC177: Confused about usage of register: R13 in 'UnsetPending'

                  ;
                  (_selectReward[idx])._isEquipable = selectReward:isEquipable(classType)
                end
              else
                do
                  do
                    -- DECOMPILER ERROR at PC188: Confused about usage of register: R11 in 'UnsetPending'

                    if (CppEnums.RewardType).RewardType_Intimacy == selectReward._type then
                      (_selectReward[idx])._character = selectReward:getIntimacyCharacter()
                      -- DECOMPILER ERROR at PC191: Confused about usage of register: R11 in 'UnsetPending'

                      ;
                      (_selectReward[idx])._value = selectReward._intimacyValue
                    end
                    -- DECOMPILER ERROR at PC192: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC192: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC192: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC192: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC192: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC192: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC192: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC192: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC192: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
            end
          end
        end
      end
    else
      isHaveSelectReward = false
      _selectReward = nil
    end
    SetSpecialRewardList(_baseReward, _selectReward)
    specialRewardCount = specialRewardCount + 1
  end
  do
    remainRewardCount:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHALLENGEPRESENT_REMAINREWARDCOUNT", "specialRewardCount", specialRewardCount))
  end
end

Panel_ChallengePresent_AcceptReward_Clicked = function()
  -- function num : 0_7 , upvalues : currentReward, _uiButtonSelectRewardSlots, selectedRewardSlotIndex
  local rewardWrapper = ToClient_GetBenefitRewardInfoWrapper(currentReward)
  local specialRewardKey = rewardWrapper:getKey()
  local selectCount = rewardWrapper:getSelectRewardCount()
  if selectCount ~= 0 then
    local isCheck = false
    for i = 0, selectCount - 1 do
      if (_uiButtonSelectRewardSlots[i]):IsCheck() then
        isCheck = true
      end
    end
    if isCheck == false then
      local msg = {main = PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGEPRESENT_SELECTREWARDITEM"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGEPRESENT_SELECTGETITEM")}
      Proc_ShowMessage_Ack_WithOut_ChattingMessage_For_RewardSelect(msg, 6, 4)
      return 
    end
  else
    do
      selectedRewardSlotIndex = 0
      ToClient_AcceptReward_ButtonClicked(specialRewardKey, selectedRewardSlotIndex)
      FGlobal_ChallengePresent_Close()
    end
  end
end

FGlobal_ChallengePresent_AcceptReward = function()
  -- function num : 0_8
  Panel_ChallengePresent_AcceptReward_Clicked()
end

SetSpecialRewardList = function(baseReward, selectReward)
  -- function num : 0_9 , upvalues : _baseRewardCount, _maxBaseSlotCount, _uiBackBaseReward, _listBaseRewardSlots, _uiButtonSelectRewardSlots, _maxSelectSlotCount, _listSelectRewardSlots
  _baseRewardCount = #baseReward
  for index = 0, _maxBaseSlotCount - 1 do
    (_uiBackBaseReward[index]):EraseAllEffect()
    if index < _baseRewardCount then
      Set_Special_Reward(_listBaseRewardSlots[index], baseReward[index + 1], index, "main")
    end
  end
  for index = 0, 5 do
    (_uiButtonSelectRewardSlots[index]):SetCheck(false)
  end
  local _equipRewardCount = 0
  local _equipEnableSlot, _selectRewardCount = nil, nil
  if selectReward ~= nil then
    _selectRewardCount = #selectReward
  else
    _selectRewardCount = 0
  end
  for index = 0, _maxSelectSlotCount - 1 do
    (_uiButtonSelectRewardSlots[index]):EraseAllEffect()
    if index < _selectRewardCount then
      local isEquipable = Set_Special_Reward(_listSelectRewardSlots[index], selectReward[index + 1], index, "sub")
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
    else
      do
        do
          ;
          (_uiButtonSelectRewardSlots[index]):SetShow(false)
          -- DECOMPILER ERROR at PC95: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC95: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC95: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  if _equipRewardCount == 1 and _equipEnableSlot ~= nil then
    HandleClicked_SelectedReward(_equipEnableSlot)
  end
end

ShowSpecialRewardList = function(isVisible)
  -- function num : 0_10
  if isVisible then
    Panel_ChallengePresent:SetShow(true, true)
  else
    Panel_ChallengePresent:SetShow(false, true)
  end
end

FGlobal_ChallengePresent_Open = function()
  -- function num : 0_11
  local rewardCount = ToClient_GetBenefitRewardInfoCount()
  if rewardCount == nil or rewardCount == 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGEPRESENT_DONTGETITEM"))
    return 
  end
  FromClient_SpecialReward_UpdateText()
  Panel_ChallengePresent:SetShow(true, true)
end

FGlobal_ChallengePresent_Close = function()
  -- function num : 0_12 , upvalues : IM
  if not AllowChangeInputMode() then
    SetFocusChatting()
  else
    if check_ShowWindow() then
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
    else
      ;
      (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
    end
  end
  Panel_ChallengePresent:SetShow(false, true)
end

registerEvent("FromClient_BenefitReward_UpdateText", "FromClient_SpecialReward_UpdateText")

