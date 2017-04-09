-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\widget\dialogue\panel_challenge_reward.luac 

-- params : ...
-- function num : 0
Panel_Challenge_Reward:SetShow(false)
Panel_Challenge_Reward:setGlassBackground(true)
Panel_Challenge_Reward:SetPosX(200)
Panel_Challenge_Reward:SetPosY(300)
local UI_RewardType = CppEnums.RewardType
local UI_TM = CppEnums.TextMode
local UI_color = Defines.Color
local _questrewardSlotConfig = {createIcon = true, createBorder = true, createCount = true, createClassEquipBG = true, createCash = true}
local _remainRewardCount = 0
local _baseRewardCount = 0
local _maxBaseSlotCount = 12
local _uiBackBaseReward = {}
local _listBaseRewardSlots = {}
local _selectRewardCount = 0
local _maxSelectSlotCount = 6
local _uiButtonSelectRewardSlots = {}
local _listSelectRewardSlots = {}
local isHaveSelectReward = false
local questDescPosY = 0
local questDescSizeY = 0
local questDescgap = 0
local currentReward = 0
local selectedRewardSlotIndex = 0
local acceptButton_isShow = true
local isSpecialReward = false
local specialRewardWrapper = {}
local normalRewardWrapper = {}
local challengeTitleText = (UI.getChildControl)(Panel_Challenge_Reward, "StaticText_ChallengeReward_TitleText")
local remainRewardCount = (UI.getChildControl)(Panel_Challenge_Reward, "StaticText_RemainRewardCountText")
local reward_CloseButton = (UI.getChildControl)(Panel_Challenge_Reward, "Button_Win_Close")
local reward_AcceptButton = (UI.getChildControl)(Panel_Challenge_Reward, "Button_AcceptReward")
local reward_CancelButton = (UI.getChildControl)(Panel_Challenge_Reward, "Button_Cancel")
local expTooltipBase = (UI.getChildControl)(Panel_CheckedQuest, "StaticText_Notice_2")
local expTooltip = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, Panel_Challenge_Reward, "expTooltip")
CopyBaseProperty(expTooltipBase, expTooltip)
expTooltip:SetColor(UI_color.C_FFFFFFFF)
expTooltip:SetAlpha(1)
expTooltip:SetFontColor(UI_color.C_FFFFFFFF)
expTooltip:SetAutoResize(true)
expTooltip:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
expTooltip:SetTextHorizonCenter()
expTooltip:SetShow(false)
challengeTitleText:SetAutoResize(true)
challengeTitleText:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
local ChallengeSelectReward = {_textTitle = (UI.getChildControl)(Panel_Challenge_Reward, "Static_Text_Title"), _uiRewardSlot_0 = (UI.getChildControl)(Panel_Challenge_Reward, "Static_Reward_Slot_0_0"), _uiRewardSlot_1 = (UI.getChildControl)(Panel_Challenge_Reward, "Static_Reward_Slot_0_1"), _uiRewardSlot_2 = (UI.getChildControl)(Panel_Challenge_Reward, "Static_Reward_Slot_0_2"), _uiRewardSlot_3 = (UI.getChildControl)(Panel_Challenge_Reward, "Static_Reward_Slot_0_3"), _uiRewardSlot_4 = (UI.getChildControl)(Panel_Challenge_Reward, "Static_Reward_Slot_0_4"), _uiRewardSlot_5 = (UI.getChildControl)(Panel_Challenge_Reward, "Static_Reward_Slot_0_5"), _uiCheckButton_0 = (UI.getChildControl)(Panel_Challenge_Reward, "CheckButton_0"), _uiCheckButton_1 = (UI.getChildControl)(Panel_Challenge_Reward, "CheckButton_1"), _uiCheckButton_2 = (UI.getChildControl)(Panel_Challenge_Reward, "CheckButton_2"), _uiCheckButton_3 = (UI.getChildControl)(Panel_Challenge_Reward, "CheckButton_3"), _uiCheckButton_4 = (UI.getChildControl)(Panel_Challenge_Reward, "CheckButton_4"), _uiCheckButton_5 = (UI.getChildControl)(Panel_Challenge_Reward, "CheckButton_5"), _staticLine = (UI.getChildControl)(Panel_Challenge_Reward, "Static_Line_0"), _selectRewardBG = (UI.getChildControl)(Panel_Challenge_Reward, "Static_BG_1"), _staticSelectText = (UI.getChildControl)(Panel_Challenge_Reward, "Static_Menu_Reward_Select")}
local checkButtonOnTexture = (ChallengeSelectReward._uiCheckButton_0):getOnTexture()
local checkButtonClickTexture = (ChallengeSelectReward._uiCheckButton_0):getClickTexture()
local rewardPanelSizeY = Panel_Challenge_Reward:GetSizeY()
local noSelectPanelSizeY = (ChallengeSelectReward._staticLine):GetPosY() + reward_AcceptButton:GetSizeY() + 10
local buttonPosY = reward_AcceptButton:GetPosY()
reward_CloseButton:addInputEvent("Mouse_LUp", "FGlobal_ShowChallengeRewardList(false)")
reward_AcceptButton:addInputEvent("Mouse_LUp", "FGlobal_AcceptReward_Clicked()")
reward_CancelButton:addInputEvent("Mouse_LUp", "FGlobal_ShowChallengeRewardList(false)")
for index = 0, _maxBaseSlotCount - 1 do
  local backBaseReward = (UI.getChildControl)(Panel_Challenge_Reward, "Static_Slot_" .. index)
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
  Panel_Tooltip_Item_SetPosition(index, slot, "Dialog_ChallengeReward_Base")
end
for index = 0, _maxSelectSlotCount - 1 do
  local buttonSelectRewardSlot = (UI.getChildControl)(Panel_Challenge_Reward, "CheckButton_" .. index)
  buttonSelectRewardSlot:addInputEvent("Mouse_LUp", "HandleSelectedRewardClicked(" .. index .. ")")
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
  (slot.icon):SetIgnore(true)
  _listSelectRewardSlots[index] = slot
  Panel_Tooltip_Item_SetPosition(index, slot, "Dialog_ChallengeReward_Select")
end
HandleSelectedRewardClicked = function(selectIndex)
  -- function num : 0_0 , upvalues : selectedRewardSlotIndex, _uiButtonSelectRewardSlots, checkButtonClickTexture
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
  ;
  (_uiButtonSelectRewardSlots[selectIndex]):setRenderTexture(checkButtonClickTexture)
end

HandleOnSelectedChallengeReward = function(index)
  -- function num : 0_1 , upvalues : _uiButtonSelectRewardSlots, checkButtonOnTexture
  Panel_Tooltip_Item_Show_GeneralStatic(index, "Dialog_ChallengeReward_Select", true)
  ;
  (_uiButtonSelectRewardSlots[index]):setRenderTexture(checkButtonOnTexture)
end

setChallengeReward = function(uiSlot, reward, index, questType)
  -- function num : 0_2 , upvalues : UI_RewardType, _uiButtonSelectRewardSlots
  uiSlot._type = reward._type
  if UI_RewardType.RewardType_Exp == reward._type then
    (uiSlot.count):SetText("")
    ;
    (uiSlot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/EXP.dds")
    ;
    (uiSlot.icon):addInputEvent("Mouse_On", "ChallengeRewardTooltip( \"Exp\", true, \"" .. questType .. "\", " .. index .. " )")
    ;
    (uiSlot.icon):addInputEvent("Mouse_Out", "ChallengeRewardTooltip( \"Exp\", false, \"" .. questType .. "\", " .. index .. " )")
  else
    if UI_RewardType.RewardType_SkillExp == reward._type then
      (uiSlot.count):SetText("")
      ;
      (uiSlot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/SkillExp.dds")
      ;
      (uiSlot.icon):addInputEvent("Mouse_On", "ChallengeRewardTooltip( \"SkillExp\", true, \"" .. questType .. "\", " .. index .. " )")
      ;
      (uiSlot.icon):addInputEvent("Mouse_Out", "ChallengeRewardTooltip( \"SkillExp\", false, \"" .. questType .. "\", " .. index .. " )")
    else
      if UI_RewardType.RewardType_ProductExp == reward._type then
        (uiSlot.count):SetText("")
        ;
        (uiSlot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/EXP.dds")
        ;
        (uiSlot.icon):addInputEvent("Mouse_On", "ChallengeRewardTooltip( \"ProductExp\", true, \"" .. questType .. "\", " .. index .. " )")
        ;
        (uiSlot.icon):addInputEvent("Mouse_Out", "ChallengeRewardTooltip( \"ProductExp\", false, \"" .. questType .. "\", " .. index .. " )")
      else
        if UI_RewardType.RewardType_Item == reward._type then
          local itemStatic = getItemEnchantStaticStatus(ItemEnchantKey(reward._item))
          uiSlot:setItemByStaticStatus(itemStatic, reward._count)
          uiSlot._item = reward._item
          if questType == "main" then
            (uiSlot.icon):addInputEvent("Mouse_On", "Panel_Tooltip_Item_Show_GeneralStatic(" .. index .. ",\"Dialog_ChallengeReward_Base\",true)")
            ;
            (uiSlot.icon):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_Show_GeneralStatic(" .. index .. ",\"Dialog_ChallengeReward_Base\",false)")
          else
            ;
            (uiSlot.icon):addInputEvent("Mouse_On", "")
            ;
            (uiSlot.icon):addInputEvent("Mouse_Out", "")
            ;
            (_uiButtonSelectRewardSlots[index]):addInputEvent("Mouse_On", "HandleOnSelectedChallengeReward(" .. index .. ")")
            ;
            (_uiButtonSelectRewardSlots[index]):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_Show_GeneralStatic(" .. index .. ",\"Dialog_ChallengeReward_Select\",false)")
          end
          return reward._isEquipable
        else
          do
            if UI_RewardType.RewardType_Intimacy == reward._type then
              (uiSlot.count):SetText(tostring(reward._value))
              ;
              (uiSlot.icon):ChangeTextureInfoName("Icon/New_Icon/00000000_Special_Contributiveness.dds")
              ;
              (uiSlot.icon):addInputEvent("Mouse_On", "ChallengeRewardTooltip( \"Intimacy\", true, \"" .. questType .. "\", " .. index .. " )")
              ;
              (uiSlot.icon):addInputEvent("Mouse_Out", "ChallengeRewardTooltip( \"Intimacy\", false, \"" .. questType .. "\", " .. index .. " )")
            else
              if UI_RewardType.RewardType_Knowledge == reward._type then
                (uiSlot.count):SetText("")
                ;
                (uiSlot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/00000000_know_icon.dds")
                ;
                (uiSlot.icon):addInputEvent("Mouse_On", "ChallengeRewardTooltip( \"Knowledge\", true, \"" .. questType .. "\", " .. index .. "," .. reward._mentalCard .. " )")
                ;
                (uiSlot.icon):addInputEvent("Mouse_Out", "ChallengeRewardTooltip( \"Knowledge\", false, \"" .. questType .. "\", " .. index .. "," .. reward._mentalCard .. " )")
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

ChallengeRewardTooltip = function(type, show, questtype, index, mentalCardKey)
  -- function num : 0_3 , upvalues : expTooltip, _uiBackBaseReward, _uiButtonSelectRewardSlots
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
              expTooltip:SetText("[ì§\128ì‹] " .. mentalCardName .. "\n" .. mentalCardDesc)
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

FromClient_ChallengeReward_UpdateText = function()
  -- function num : 0_4 , upvalues : isSpecialReward, specialRewardWrapper, normalRewardWrapper, currentReward, challengeTitleText, remainRewardCount, isHaveSelectReward
  isSpecialReward = false
  local specialRewardCount = 0
  local normalRewardCount = 0
  for i = 0, ToClient_GetChallengeRewardInfoCount() - 1 do
    local rewardWrapper = ToClient_GetChallengeRewardInfoWrapper(i)
    -- DECOMPILER ERROR at PC18: Confused about usage of register: R7 in 'UnsetPending'

    if rewardWrapper:getType() == 0 then
      specialRewardWrapper[specialRewardCount] = rewardWrapper
      specialRewardCount = specialRewardCount + 1
    else
      -- DECOMPILER ERROR at PC22: Confused about usage of register: R7 in 'UnsetPending'

      normalRewardWrapper[normalRewardCount] = rewardWrapper
      normalRewardCount = normalRewardCount + 1
    end
  end
  if specialRewardCount > 0 then
    isSpecialReward = true
  end
  if specialRewardWrapper[currentReward] ~= nil then
    local baseCount = (specialRewardWrapper[currentReward]):getBaseRewardCount()
    challengeTitleText:SetText((specialRewardWrapper[currentReward]):getName())
    remainRewardCount:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHALLENGE_REWARD_REMAINREWARDCOUNT", "normalRewardCount", normalRewardCount))
    local _baseReward = {}
    for idx = 1, baseCount do
      local baseReward = (specialRewardWrapper[currentReward]):getBaseRewardAt(idx - 1)
      _baseReward[idx] = {}
      -- DECOMPILER ERROR at PC72: Confused about usage of register: R9 in 'UnsetPending'

      ;
      (_baseReward[idx])._type = baseReward._type
      -- DECOMPILER ERROR at PC81: Confused about usage of register: R9 in 'UnsetPending'

      if (CppEnums.RewardType).RewardType_Exp == baseReward._type then
        (_baseReward[idx])._exp = baseReward._experience
      else
        -- DECOMPILER ERROR at PC91: Confused about usage of register: R9 in 'UnsetPending'

        if (CppEnums.RewardType).RewardType_SkillExp == baseReward._type then
          (_baseReward[idx])._exp = baseReward._skillExperience
        else
          -- DECOMPILER ERROR at PC101: Confused about usage of register: R9 in 'UnsetPending'

          if (CppEnums.RewardType).RewardType_ProductExp == baseReward._type then
            (_baseReward[idx])._exp = baseReward._productExperience
          else
            -- DECOMPILER ERROR at PC112: Confused about usage of register: R9 in 'UnsetPending'

            if (CppEnums.RewardType).RewardType_Item == baseReward._type then
              (_baseReward[idx])._item = baseReward:getItemEnchantKey()
              -- DECOMPILER ERROR at PC115: Confused about usage of register: R9 in 'UnsetPending'

              ;
              (_baseReward[idx])._count = baseReward._itemCount
            else
              -- DECOMPILER ERROR at PC126: Confused about usage of register: R9 in 'UnsetPending'

              if (CppEnums.RewardType).RewardType_Intimacy == baseReward._type then
                (_baseReward[idx])._character = baseReward:getIntimacyCharacter()
                -- DECOMPILER ERROR at PC129: Confused about usage of register: R9 in 'UnsetPending'

                ;
                (_baseReward[idx])._value = baseReward._intimacyValue
              else
                -- DECOMPILER ERROR at PC140: Confused about usage of register: R9 in 'UnsetPending'

                if (CppEnums.RewardType).RewardType_Knowledge == baseReward._type then
                  (_baseReward[idx])._character = baseReward:getMentalCardKey()
                end
              end
            end
          end
        end
      end
    end
    local selectCount = (specialRewardWrapper[currentReward]):getSelectRewardCount()
    local _selectReward = {}
    if selectCount > 0 then
      isHaveSelectReward = true
      for idx = 1, selectCount do
        local selectReward = (specialRewardWrapper[currentReward]):getSelectRewardAt(idx - 1)
        _selectReward[idx] = {}
        -- DECOMPILER ERROR at PC166: Confused about usage of register: R11 in 'UnsetPending'

        ;
        (_selectReward[idx])._type = selectReward._type
        -- DECOMPILER ERROR at PC175: Confused about usage of register: R11 in 'UnsetPending'

        if (CppEnums.RewardType).RewardType_Exp == selectReward._type then
          (_selectReward[idx])._exp = selectReward._experience
        else
          -- DECOMPILER ERROR at PC185: Confused about usage of register: R11 in 'UnsetPending'

          if (CppEnums.RewardType).RewardType_SkillExp == selectReward._type then
            (_selectReward[idx])._exp = selectReward._skillExperience
          else
            -- DECOMPILER ERROR at PC195: Confused about usage of register: R11 in 'UnsetPending'

            if (CppEnums.RewardType).RewardType_ProductExp == selectReward._type then
              (_selectReward[idx])._exp = selectReward._productExperience
            else
              -- DECOMPILER ERROR at PC206: Confused about usage of register: R11 in 'UnsetPending'

              if (CppEnums.RewardType).RewardType_Item == selectReward._type then
                (_selectReward[idx])._item = selectReward:getItemEnchantKey()
                -- DECOMPILER ERROR at PC209: Confused about usage of register: R11 in 'UnsetPending'

                ;
                (_selectReward[idx])._count = selectReward._itemCount
                local selfPlayer = getSelfPlayer()
                if selfPlayer ~= nil then
                  local classType = selfPlayer:getClassType()
                  -- DECOMPILER ERROR at PC220: Confused about usage of register: R13 in 'UnsetPending'

                  ;
                  (_selectReward[idx])._isEquipable = selectReward:isEquipable(classType)
                end
              else
                do
                  do
                    -- DECOMPILER ERROR at PC231: Confused about usage of register: R11 in 'UnsetPending'

                    if (CppEnums.RewardType).RewardType_Intimacy == selectReward._type then
                      (_selectReward[idx])._character = selectReward:getIntimacyCharacter()
                      -- DECOMPILER ERROR at PC234: Confused about usage of register: R11 in 'UnsetPending'

                      ;
                      (_selectReward[idx])._value = selectReward._intimacyValue
                    else
                      -- DECOMPILER ERROR at PC245: Confused about usage of register: R11 in 'UnsetPending'

                      if (CppEnums.RewardType).RewardType_Knowledge == selectReward._type then
                        (_selectReward[idx])._character = selectReward:getMentalCardKey()
                      end
                    end
                    -- DECOMPILER ERROR at PC246: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC246: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC246: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC246: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC246: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC246: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC246: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC246: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC246: LeaveBlock: unexpected jumping out IF_STMT

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
    FGlobal_SetChallengeRewardList(_baseReward, _selectReward)
    Fglobal_Challenge_UpdateData()
    if ((getSelfPlayer()):get()):getLevel() > 4 then
      Panel_SpecialReward_Alert:SetShow(true)
      Panel_SpecialReward_Alert:SetSpanSize(-33, 95)
    end
  else
    do
      Panel_SpecialReward_Alert:SetShow(false)
      if normalRewardWrapper[currentReward] ~= nil then
        local baseCount = (normalRewardWrapper[currentReward]):getBaseRewardCount()
        challengeTitleText:SetText((normalRewardWrapper[currentReward]):getName())
        remainRewardCount:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHALLENGE_REWARD_REMAINREWARDCOUNT", "normalRewardCount", normalRewardCount))
        local _baseReward = {}
        for idx = 1, baseCount do
          local baseReward = (normalRewardWrapper[currentReward]):getBaseRewardAt(idx - 1)
          _baseReward[idx] = {}
          -- DECOMPILER ERROR at PC322: Confused about usage of register: R9 in 'UnsetPending'

          ;
          (_baseReward[idx])._type = baseReward._type
          -- DECOMPILER ERROR at PC331: Confused about usage of register: R9 in 'UnsetPending'

          if (CppEnums.RewardType).RewardType_Exp == baseReward._type then
            (_baseReward[idx])._exp = baseReward._experience
          else
            -- DECOMPILER ERROR at PC341: Confused about usage of register: R9 in 'UnsetPending'

            if (CppEnums.RewardType).RewardType_SkillExp == baseReward._type then
              (_baseReward[idx])._exp = baseReward._skillExperience
            else
              -- DECOMPILER ERROR at PC351: Confused about usage of register: R9 in 'UnsetPending'

              if (CppEnums.RewardType).RewardType_ProductExp == baseReward._type then
                (_baseReward[idx])._exp = baseReward._productExperience
              else
                -- DECOMPILER ERROR at PC362: Confused about usage of register: R9 in 'UnsetPending'

                if (CppEnums.RewardType).RewardType_Item == baseReward._type then
                  (_baseReward[idx])._item = baseReward:getItemEnchantKey()
                  -- DECOMPILER ERROR at PC365: Confused about usage of register: R9 in 'UnsetPending'

                  ;
                  (_baseReward[idx])._count = baseReward._itemCount
                else
                  -- DECOMPILER ERROR at PC376: Confused about usage of register: R9 in 'UnsetPending'

                  if (CppEnums.RewardType).RewardType_Intimacy == baseReward._type then
                    (_baseReward[idx])._character = baseReward:getIntimacyCharacter()
                    -- DECOMPILER ERROR at PC379: Confused about usage of register: R9 in 'UnsetPending'

                    ;
                    (_baseReward[idx])._value = baseReward._intimacyValue
                  end
                end
              end
            end
          end
        end
        local selectCount = (normalRewardWrapper[currentReward]):getSelectRewardCount()
        local _selectReward = {}
        if selectCount > 0 then
          isHaveSelectReward = true
          for idx = 1, selectCount do
            local selectReward = (normalRewardWrapper[currentReward]):getSelectRewardAt(idx - 1)
            _selectReward[idx] = {}
            -- DECOMPILER ERROR at PC405: Confused about usage of register: R11 in 'UnsetPending'

            ;
            (_selectReward[idx])._type = selectReward._type
            -- DECOMPILER ERROR at PC414: Confused about usage of register: R11 in 'UnsetPending'

            if (CppEnums.RewardType).RewardType_Exp == selectReward._type then
              (_selectReward[idx])._exp = selectReward._experience
            else
              -- DECOMPILER ERROR at PC424: Confused about usage of register: R11 in 'UnsetPending'

              if (CppEnums.RewardType).RewardType_SkillExp == selectReward._type then
                (_selectReward[idx])._exp = selectReward._skillExperience
              else
                -- DECOMPILER ERROR at PC434: Confused about usage of register: R11 in 'UnsetPending'

                if (CppEnums.RewardType).RewardType_ProductExp == selectReward._type then
                  (_selectReward[idx])._exp = selectReward._productExperience
                else
                  -- DECOMPILER ERROR at PC445: Confused about usage of register: R11 in 'UnsetPending'

                  if (CppEnums.RewardType).RewardType_Item == selectReward._type then
                    (_selectReward[idx])._item = selectReward:getItemEnchantKey()
                    -- DECOMPILER ERROR at PC448: Confused about usage of register: R11 in 'UnsetPending'

                    ;
                    (_selectReward[idx])._count = selectReward._itemCount
                    local selfPlayer = getSelfPlayer()
                    if selfPlayer ~= nil then
                      local classType = selfPlayer:getClassType()
                      -- DECOMPILER ERROR at PC459: Confused about usage of register: R13 in 'UnsetPending'

                      ;
                      (_selectReward[idx])._isEquipable = selectReward:isEquipable(classType)
                    end
                  else
                    do
                      do
                        -- DECOMPILER ERROR at PC470: Confused about usage of register: R11 in 'UnsetPending'

                        if (CppEnums.RewardType).RewardType_Intimacy == selectReward._type then
                          (_selectReward[idx])._character = selectReward:getIntimacyCharacter()
                          -- DECOMPILER ERROR at PC473: Confused about usage of register: R11 in 'UnsetPending'

                          ;
                          (_selectReward[idx])._value = selectReward._intimacyValue
                        end
                        -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                        -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                        -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                        -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                        -- DECOMPILER ERROR at PC474: LeaveBlock: unexpected jumping out IF_STMT

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
        FGlobal_SetChallengeRewardList(_baseReward, _selectReward)
        Fglobal_Challenge_UpdateData()
        if ((getSelfPlayer()):get()):getLevel() > 4 then
          if (getGameServiceType() == 7 or getGameServiceType() == 8) and getContentsServiceType() == (CppEnums.ContentsServiceType).eContentsServiceType_CBT then
            Panel_ChallengeReward_Alert:SetShow(false)
          else
            Panel_ChallengeReward_Alert:SetShow(true)
          end
          Panel_ChallengeReward_Alert:SetSpanSize(-33, 84)
        end
        FGlobal_RightBottomIconReposition()
      else
        do
          Panel_ChallengeReward_Alert:SetShow(false)
          if ToClient_GetChallengeRewardInfoCount() == 0 then
            FGlobal_ShowChallengeRewardList(false)
            Panel_ChallengeReward_Alert:SetShow(false)
            Fglobal_Challenge_UpdateData()
          end
        end
      end
    end
  end
end

FGlobal_AcceptReward_Clicked = function()
  -- function num : 0_5 , upvalues : currentReward, _uiButtonSelectRewardSlots, selectedRewardSlotIndex
  local rewardWrapper = ToClient_GetChallengeRewardInfoWrapper(currentReward)
  local challengeKey = rewardWrapper:getKey()
  local selectCount = rewardWrapper:getSelectRewardCount()
  if selectCount > 0 then
    local isCheck = false
    for i = 0, selectCount - 1 do
      if (_uiButtonSelectRewardSlots[i]):IsCheck() then
        isCheck = true
      end
    end
    if isCheck == false then
      local msg = {main = PAGetString(Defines.StringSheet_GAME, "DIALOG_MESSAGE_SELECT_REWARD"), sub = PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGEREWARD_GETITEMTOSELECT")}
      Proc_ShowMessage_Ack_WithOut_ChattingMessage_For_RewardSelect(msg, 6, 4)
      return 
    end
  end
  do
    ToClient_AcceptReward_ButtonClicked(challengeKey, selectedRewardSlotIndex)
    FromClient_ChallengeReward_UpdateText()
    FGlobal_ShowChallengeRewardList(Panel_Challenge_Reward:GetShow())
  end
end

FGlobal_SetShowChallengeRewardList = function(isShow)
  -- function num : 0_6 , upvalues : acceptButton_isShow, remainRewardCount, reward_AcceptButton, reward_CancelButton
  if Panel_Window_CharInfo_Status:GetShow() then
    local posX = Panel_Window_CharInfo_Status:GetPosX()
    local posY = Panel_Window_CharInfo_Status:GetPosY()
    local posY = Panel_Window_CharInfo_Status:GetPosY()
    local sizeX = Panel_Window_CharInfo_Status:GetSizeX()
    local sizeY = Panel_Window_CharInfo_Status:GetSizeY()
    local rewardPosX = posX + sizeX + 20
    local rewardPosY = posY + sizeY / 4
    if getScreenSizeX() < rewardPosX + Panel_Challenge_Reward:GetSizeX() then
      rewardPosX = posX - Panel_Challenge_Reward:GetSizeX() - 20
    end
    if getScreenSizeY() < rewardPosY + Panel_Challenge_Reward:GetSizeY() then
      rewardPosY = getScreenSizeY() - Panel_Challenge_Reward:GetSizeY() - 20
    end
    Panel_Challenge_Reward:SetPosX(rewardPosX)
    Panel_Challenge_Reward:SetPosY(rewardPosY)
  else
    do
      Panel_Challenge_Reward:SetPosX(Panel_CheckedQuest:GetPosX() - Panel_Challenge_Reward:GetSizeX())
      Panel_Challenge_Reward:SetPosY(getScreenSizeY() / 2 - Panel_Challenge_Reward:GetSizeY() / 2)
      Panel_Challenge_Reward:SetShow(isShow)
      if acceptButton_isShow == false then
        remainRewardCount:SetShow(false)
        reward_AcceptButton:SetShow(false)
        reward_CancelButton:SetPosX(Panel_Challenge_Reward:GetSizeX() / 2 - reward_CancelButton:GetSizeX() / 2)
      else
        remainRewardCount:SetShow(true)
        reward_AcceptButton:SetShow(true)
        reward_CancelButton:SetPosX(Panel_Challenge_Reward:GetSizeX() / 2 + reward_CancelButton:GetSizeX() / 2 - 35)
        FromClient_ChallengeReward_UpdateText()
      end
      acceptButton_isShow = true
    end
  end
end

FGlobal_SelectReward_IsShow = function(isShow)
  -- function num : 0_7 , upvalues : noSelectPanelSizeY, reward_AcceptButton, reward_CancelButton, rewardPanelSizeY, buttonPosY
  if isShow == false then
    Challenge_SelectReward_IsShow(false)
    Panel_Challenge_Reward:SetSize(Panel_Challenge_Reward:GetSizeX(), noSelectPanelSizeY)
    reward_AcceptButton:SetPosY(noSelectPanelSizeY - reward_AcceptButton:GetSizeY() - 10)
    reward_CancelButton:SetPosY(noSelectPanelSizeY - reward_AcceptButton:GetSizeY() - 10)
  else
    Challenge_SelectReward_IsShow(true)
    Panel_Challenge_Reward:SetSize(Panel_Challenge_Reward:GetSizeX(), rewardPanelSizeY)
    reward_AcceptButton:SetPosY(buttonPosY)
    reward_CancelButton:SetPosY(buttonPosY)
  end
end

Challenge_SelectReward_IsShow = function(isShow)
  -- function num : 0_8 , upvalues : ChallengeSelectReward
  for _,control in pairs(ChallengeSelectReward) do
    control:SetShow(isShow)
  end
end

FGlobal_SetChallengeRewardList = function(baseReward, selectReward)
  -- function num : 0_9 , upvalues : _baseRewardCount, _maxBaseSlotCount, _uiBackBaseReward, _listBaseRewardSlots, _selectRewardCount, _uiButtonSelectRewardSlots, _maxSelectSlotCount, _listSelectRewardSlots
  _baseRewardCount = #baseReward
  for index = 0, _maxBaseSlotCount - 1 do
    (_uiBackBaseReward[index]):EraseAllEffect()
    if index < _baseRewardCount then
      setChallengeReward(_listBaseRewardSlots[index], baseReward[index + 1], index, "main")
      ;
      (_uiBackBaseReward[index]):SetShow(true)
    else
      ;
      (_uiBackBaseReward[index]):SetShow(false)
    end
  end
  if selectReward == nil then
    FGlobal_SelectReward_IsShow(false)
    return 
  else
    _selectRewardCount = #selectReward
  end
  for index = 0, 5 do
    (_uiButtonSelectRewardSlots[index]):SetCheck(false)
  end
  local _equipRewardCount = 0
  local _equipEnableSlot = nil
  for index = 0, _maxSelectSlotCount - 1 do
    (_uiButtonSelectRewardSlots[index]):EraseAllEffect()
    if index < _selectRewardCount then
      local isEquipable = setChallengeReward(_listSelectRewardSlots[index], selectReward[index + 1], index, "sub")
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
          -- DECOMPILER ERROR at PC111: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC111: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC111: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  if _equipRewardCount == 1 and _equipEnableSlot ~= nil then
    HandleSelectedRewardClicked(_equipEnableSlot)
  end
  FGlobal_SelectReward_IsShow(true)
end

FGlobal_ShowChallengeRewardList = function(isVisible)
  -- function num : 0_10
  if isVisible then
    if ToClient_GetChallengeRewardInfoCount() > 0 then
      FGlobal_SetShowChallengeRewardList(true)
      Panel_Challenge_Reward:SetShow(true)
    else
      Panel_Challenge_Reward:SetShow(false)
    end
  else
    Panel_Challenge_Reward:SetShow(false)
  end
end

Panel_Challenge_Reward_JustShow = function(rewardWrapper)
  -- function num : 0_11 , upvalues : challengeTitleText, acceptButton_isShow
  challengeTitleText:SetText(rewardWrapper:getName())
  acceptButton_isShow = false
  FGlobal_SetShowChallengeRewardList(true)
end

FromClient_CompleteChallengeReward = function()
  -- function num : 0_12 , upvalues : isSpecialReward
  local rewardCount = ToClient_GetChallengeRewardInfoCount()
  if rewardCount == nil or rewardCount == 0 then
    return 
  end
  local rewardWrapper = ToClient_GetChallengeRewardInfoWrapper(rewardCount - 1)
  if rewardWrapper ~= nil then
    if rewardWrapper:getType() == 0 then
      isSpecialReward = true
    else
      local message = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHALLENGE_REWARD_ARCHIVEMENT", "challengeName", rewardWrapper:getName())
      Proc_ShowBigMessage_Ack_WithOut_ChattingMessage(message)
    end
  end
  do
    FromClient_ChallengeReward_UpdateText()
  end
end

FromClient_ChallengeReward_UpdateText()
local _buttonQuestion = (UI.getChildControl)(Panel_Challenge_Reward, "Button_Question")
_buttonQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelQuestReward\" )")
_buttonQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelQuestReward\", \"true\")")
_buttonQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelQuestReward\", \"false\")")
registerEvent("FromClient_ChallengeReward_UpdateText", "FromClient_ChallengeReward_UpdateText")
registerEvent("FromClient_CompleteChallengeReward", "FromClient_CompleteChallengeReward")

