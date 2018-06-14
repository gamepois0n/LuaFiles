-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\characterinfo\panel_window_characterinfo_challenge_renew.luac 

-- params : ...
-- function num : 0
local _mainPanel = Panel_Window_CharacterInfo_Renew
local _panel = Panel_Window_CharacterInfo_Challenge_Renew
local CharacterChallengeInfo = {
_ui = {stc_CategoryTap = (UI.getChildControl)(_panel, "Static_Category_Tap"), frame_RewardList = (UI.getChildControl)(_panel, "Frame_Reward_List")}
, defaultFrameBG_CharacterInfo_Challenge = nil, 
challengeRewardSlotConfig = {createIcon = true, createBorder = true, createCount = true, createClassEquipBG = true, createCash = true}
, 
_uiBackBaseReward = {}
, 
_listBaseRewardSlots = {}
, 
_uiButtonSelectRewardSlots = {}
, 
_listSelectRewardSlots = {}
, 
_rewardList = {}
, _maxBasicSlotCount = 4, _maxSelectSlotCount = 6, _currentCategoryType = nil, _maxCategoryType = 6, _selectedReward_ChallengeIndex = nil, _selectedReward_SlotIndex = nil, 
challengeRewardInfoIndex = {doneInfo = 4, doneRewardInfo = 5}
}
CharacterChallengeInfo.init = function(self)
  -- function num : 0_0
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).stc_LT = (UI.getChildControl)((self._ui).stc_CategoryTap, "Static_LT_ConsoleUI")
  ;
  ((self._ui).stc_LT):addInputEvent("Mouse_LUp", "PaGlobalFunc_CharacterChallengeInfo_ShowLeftNextTab()")
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_RT = (UI.getChildControl)((self._ui).stc_CategoryTap, "Static_RT_ConsoleUI")
  ;
  ((self._ui).stc_RT):addInputEvent("Mouse_LUp", "PaGlobalFunc_CharacterChallengeInfo_ShowRightNextTab()")
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).radioButton_Type = {}
  -- DECOMPILER ERROR at PC39: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).radioButton_Type)[0] = (UI.getChildControl)((self._ui).stc_CategoryTap, "RadioButton_Object")
  ;
  (((self._ui).radioButton_Type)[0]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_TAPMENU_SHORT"))
  -- DECOMPILER ERROR at PC58: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).radioButton_Type)[1] = (UI.getChildControl)((self._ui).stc_CategoryTap, "RadioButton_Time")
  ;
  (((self._ui).radioButton_Type)[1]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_TAPMENU_DAILY"))
  -- DECOMPILER ERROR at PC77: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).radioButton_Type)[2] = (UI.getChildControl)((self._ui).stc_CategoryTap, "RadioButton_PC_Room")
  ;
  (((self._ui).radioButton_Type)[2]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_TAPMENU_PCROOM"))
  -- DECOMPILER ERROR at PC96: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).radioButton_Type)[3] = (UI.getChildControl)((self._ui).stc_CategoryTap, "RadioButton_Event")
  ;
  (((self._ui).radioButton_Type)[3]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_TAPMENU_EVENT"))
  -- DECOMPILER ERROR at PC115: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).radioButton_Type)[4] = (UI.getChildControl)((self._ui).stc_CategoryTap, "RadioButton_Pre_Complete")
  ;
  (((self._ui).radioButton_Type)[4]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_TAPMENU_COMPLETE"))
  -- DECOMPILER ERROR at PC134: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).radioButton_Type)[5] = (UI.getChildControl)((self._ui).stc_CategoryTap, "RadioButton_Complete")
  ;
  (((self._ui).radioButton_Type)[5]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_TAPMENU_COMPLETEGETITEM"))
  for ii = 0, 5 do
    (((self._ui).radioButton_Type)[ii]):addInputEvent("Mouse_LUp", "InputMLUp_CharacterChallengeInfo_TapToOpen(" .. R9_PC157 .. ")")
  end
  -- DECOMPILER ERROR at PC167: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).frame_Content = (UI.getChildControl)((self._ui).frame_RewardList, "Frame_Content")
  -- DECOMPILER ERROR at PC175: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_RewardBG = (UI.getChildControl)((self._ui).frame_Content, "Static_Reward_BG")
  -- DECOMPILER ERROR at PC183: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_Title = (UI.getChildControl)((self._ui).stc_RewardBG, "StaticText_Title")
  -- DECOMPILER ERROR at PC191: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_Desc = (UI.getChildControl)((self._ui).stc_RewardBG, "StaticText_Desc")
  -- DECOMPILER ERROR at PC199: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_Basic = (UI.getChildControl)((self._ui).stc_RewardBG, "StaticText_Basic")
  -- DECOMPILER ERROR at PC207: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_Select = (UI.getChildControl)((self._ui).stc_RewardBG, "StaticText_Select")
  -- DECOMPILER ERROR at PC210: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_BasicItem = {}
  for idx = 0, self._maxBasicSlotCount - 1 do
    -- DECOMPILER ERROR at PC226: Confused about usage of register: R5 in 'UnsetPending'

    ((self._ui).stc_BasicItem)[idx] = (UI.getChildControl)((self._ui).stc_RewardBG, "Static_Basic_Item" .. R9_PC157)
  end
  -- DECOMPILER ERROR at PC230: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_SelectItem = {}
  for idx = 0, self._maxSelectSlotCount - 1 do
    -- DECOMPILER ERROR at PC243: Overwrote pending register: R9 in 'AssignReg'

    -- DECOMPILER ERROR at PC246: Confused about usage of register: R5 in 'UnsetPending'

    ((self._ui).stc_SelectItem)[idx] = (UI.getChildControl)((self._ui).stc_RewardBG, "Static_Select_Item" .. R9_PC157)
  end
  -- DECOMPILER ERROR at PC255: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).button_GetReward = (UI.getChildControl)((self._ui).stc_RewardBG, "Button_Get_Reward")
  -- DECOMPILER ERROR at PC266: Confused about usage of register: R1 in 'UnsetPending'

  if _ContentsGroup_RenewUI == true then
    (self._ui).txt_ReceiveIcon = (UI.getChildControl)((self._ui).stc_RewardBG, "StaticText_ReceiveIcon_ConsoleUI")
  end
  ;
  ((self._ui).stc_RewardBG):SetShow(false)
  -- DECOMPILER ERROR at PC279: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).scroll_Vertical = (UI.getChildControl)((self._ui).frame_RewardList, "Frame_VerticalScroll")
  -- DECOMPILER ERROR at PC287: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).btn_VerticalUp = (UI.getChildControl)((self._ui).scroll_Vertical, "Frame_VerticalScroll_UpButton")
  -- DECOMPILER ERROR at PC295: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).btn_VerticalDown = (UI.getChildControl)((self._ui).scroll_Vertical, "Frame_VerticalScroll_DownButton")
  -- DECOMPILER ERROR at PC303: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).btn_VerticalCtrl = (UI.getChildControl)((self._ui).scroll_Vertical, "Frame_VerticalScroll_CtrlButton")
  -- DECOMPILER ERROR at PC311: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).scroll_Horizontal = (UI.getChildControl)((self._ui).frame_RewardList, "Frame_HorizontalScroll")
end

CharacterChallengeInfo.updateData = function(self, index)
  -- function num : 0_1
  self._currentCategoryType = index
  for radioIdx = 0, 5 do
    (((self._ui).radioButton_Type)[radioIdx]):SetFontColor((Defines.Color).C_FF888888)
  end
  ;
  (((self._ui).radioButton_Type)[index]):SetFontColor((Defines.Color).C_FFEEEEEE)
  local progressLength = nil
  if (self.challengeRewardInfoIndex).doneInfo == index then
    progressLength = ToClient_GetCompletedChallengeCount()
  else
    if (self.challengeRewardInfoIndex).doneRewardInfo == index then
      progressLength = ToClient_GetChallengeRewardInfoCount()
    else
      progressLength = ToClient_GetProgressChallengeCount(index + 1)
    end
  end
  local uiIdx = 0
  while 1 do
    if uiIdx < progressLength then
      do
        if (self._rewardList)[uiIdx] == nil then
          local _newReward = self:getNewRewardCopy(uiIdx)
          ;
          (_newReward.stc_RewardBG):SetPosY(150 * uiIdx)
          -- DECOMPILER ERROR at PC58: Confused about usage of register: R5 in 'UnsetPending'

          ;
          (self._rewardList)[uiIdx] = _newReward
        end
        local progressInfo = nil
        if (self.challengeRewardInfoIndex).doneInfo == index then
          progressInfo = ToClient_GetCompletedChallengeAt(uiIdx)
          ;
          (((self._rewardList)[uiIdx]).button_GetReward):removeInputEvent("Mouse_LUp")
          if _ContentsGroup_RenewUI == true then
            (((self._rewardList)[uiIdx]).txt_ReceiveIcon):SetShow(false)
          end
          ;
          (((self._rewardList)[uiIdx]).button_GetReward):SetColor((Defines.Color).C_70FFFFFF)
          ;
          (((self._rewardList)[uiIdx]).button_GetReward):SetIgnore(true)
          ;
          (((self._rewardList)[uiIdx]).button_GetReward):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_CHALLENGE_ACHIVED"))
        else
          if (self.challengeRewardInfoIndex).doneRewardInfo == index then
            progressInfo = ToClient_GetChallengeRewardInfoWrapper(uiIdx)
            ;
            (((self._rewardList)[uiIdx]).button_GetReward):addInputEvent("Mouse_LUp", "HandleClicked_Reward_Show_Renew( " .. uiIdx .. ", " .. 0 .. " )")
            local existRewardCount = progressInfo:getRewardCount()
            ;
            (((self._rewardList)[uiIdx]).button_GetReward):SetIgnore(false)
            ;
            (((self._rewardList)[uiIdx]).button_GetReward):SetColor((Defines.Color).C_FFFFFFFF)
            if _ContentsGroup_RenewUI == true then
              (((self._rewardList)[uiIdx]).txt_ReceiveIcon):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHALLENGE_BTNGETREWARD", "existRewardCount", existRewardCount))
              ;
              (((self._rewardList)[uiIdx]).txt_ReceiveIcon):SetShow(true)
              ;
              (((self._rewardList)[uiIdx]).button_GetReward):SetText("")
            else
              ;
              (((self._rewardList)[uiIdx]).button_GetReward):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHALLENGE_BTNGETREWARD", "existRewardCount", existRewardCount))
            end
          else
            do
              progressInfo = ToClient_GetProgressChallengeAt(index + 1, uiIdx)
              ;
              (((self._rewardList)[uiIdx]).button_GetReward):removeInputEvent("Mouse_LUp")
              if _ContentsGroup_RenewUI == true then
                (((self._rewardList)[uiIdx]).txt_ReceiveIcon):SetShow(false)
              end
              ;
              (((self._rewardList)[uiIdx]).button_GetReward):SetColor((Defines.Color).C_70FFFFFF)
              ;
              (((self._rewardList)[uiIdx]).button_GetReward):SetIgnore(true)
              ;
              (((self._rewardList)[uiIdx]).button_GetReward):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_CHALLENGE_NOTACHIVED"))
              -- DECOMPILER ERROR at PC235: Confused about usage of register: R5 in 'UnsetPending'

              if (self._listBaseRewardSlots)[uiIdx] == nil then
                (self._uiBackBaseReward)[uiIdx] = {}
                -- DECOMPILER ERROR at PC238: Confused about usage of register: R5 in 'UnsetPending'

                ;
                (self._listBaseRewardSlots)[uiIdx] = {}
                for basicSlotIdx = 0, self._maxBasicSlotCount - 1 do
                  -- DECOMPILER ERROR at PC250: Confused about usage of register: R9 in 'UnsetPending'

                  ((self._uiBackBaseReward)[uiIdx])[basicSlotIdx] = (((self._rewardList)[uiIdx]).stc_BasicItem)[basicSlotIdx]
                  local slot = {}
                  ;
                  (SlotItem.new)(slot, "BaseReward_" .. R13_PC257, R13_PC257, (((self._rewardList)[uiIdx]).stc_BasicItem)[basicSlotIdx], self.challengeRewardSlotConfig)
                  slot:createChild()
                  -- DECOMPILER ERROR at PC270: Overwrote pending register: R13 in 'AssignReg'

                  ;
                  (slot.icon):SetSize(42, R13_PC257)
                  ;
                  (slot.icon):SetPosX(14)
                  ;
                  (slot.icon):SetPosY(14)
                  -- DECOMPILER ERROR at PC283: Overwrote pending register: R13 in 'AssignReg'

                  ;
                  (slot.border):SetSize(42, R13_PC257)
                  ;
                  (slot.border):SetPosX(1)
                  ;
                  (slot.border):SetPosY(1)
                  -- DECOMPILER ERROR at PC295: Confused about usage of register: R10 in 'UnsetPending'

                  ;
                  ((self._listBaseRewardSlots)[uiIdx])[basicSlotIdx] = slot
                end
              end
              do
                -- DECOMPILER ERROR at PC303: Confused about usage of register: R5 in 'UnsetPending'

                if (self._listSelectRewardSlots)[uiIdx] == nil then
                  (self._uiButtonSelectRewardSlots)[uiIdx] = {}
                  -- DECOMPILER ERROR at PC306: Confused about usage of register: R5 in 'UnsetPending'

                  ;
                  (self._listSelectRewardSlots)[uiIdx] = {}
                  for selectSlotIdx = 0, self._maxSelectSlotCount - 1 do
                    -- DECOMPILER ERROR at PC318: Confused about usage of register: R9 in 'UnsetPending'

                    ((self._uiButtonSelectRewardSlots)[uiIdx])[selectSlotIdx] = (((self._rewardList)[uiIdx]).stc_SelectItem)[selectSlotIdx]
                    local slot = {}
                    -- DECOMPILER ERROR at PC324: Overwrote pending register: R13 in 'AssignReg'

                    -- DECOMPILER ERROR at PC326: Overwrote pending register: R13 in 'AssignReg'

                    ;
                    (SlotItem.new)(slot, "SelectReward_" .. R13_PC257, R13_PC257, (((self._rewardList)[uiIdx]).stc_SelectItem)[selectSlotIdx], self.challengeRewardSlotConfig)
                    slot:createChild()
                    -- DECOMPILER ERROR at PC338: Overwrote pending register: R13 in 'AssignReg'

                    ;
                    (slot.icon):SetSize(30, R13_PC257)
                    ;
                    (slot.icon):SetPosX(5)
                    ;
                    (slot.icon):SetPosY(5)
                    ;
                    (slot.icon):SetIgnore(false)
                    -- DECOMPILER ERROR at PC355: Overwrote pending register: R13 in 'AssignReg'

                    ;
                    (slot.border):SetSize(30, R13_PC257)
                    ;
                    (slot.count):SetPosX(-5)
                    ;
                    (slot.count):SetPosY(13)
                    ;
                    (slot.classEquipBG):SetHorizonRight()
                    ;
                    (slot.classEquipBG):SetVerticalBottom()
                    -- DECOMPILER ERROR at PC374: Overwrote pending register: R13 in 'AssignReg'

                    ;
                    (slot.classEquipBG):SetSpanSize(2, R13_PC257)
                    -- DECOMPILER ERROR at PC378: Confused about usage of register: R10 in 'UnsetPending'

                    ;
                    ((self._listSelectRewardSlots)[uiIdx])[selectSlotIdx] = slot
                  end
                end
                do
                  do
                    self:rewardUpdate(progressInfo, uiIdx, uiIdx)
                    ;
                    (((self._rewardList)[uiIdx]).txt_Desc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
                    ;
                    (((self._rewardList)[uiIdx]).txt_Desc):SetAutoResize(true)
                    ;
                    (((self._rewardList)[uiIdx]).txt_Title):SetText(progressInfo:getName())
                    ;
                    (((self._rewardList)[uiIdx]).txt_Desc):SetText(progressInfo:getDesc())
                    ;
                    (((self._rewardList)[uiIdx]).stc_RewardBG):SetShow(true)
                    uiIdx = uiIdx + 1
                    -- DECOMPILER ERROR at PC420: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC420: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC420: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC420: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC420: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC420: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC420: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC420: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC420: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC420: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
            end
          end
        end
      end
    end
  end
  while uiIdx < #self._rewardList do
    (((self._rewardList)[uiIdx]).stc_RewardBG):SetShow(false)
    uiIdx = uiIdx + 1
  end
  ;
  ((self._ui).frame_RewardList):UpdateContentScroll()
  ;
  ((self._ui).scroll_Vertical):SetControlTop()
  ;
  ((self._ui).frame_RewardList):UpdateContentPos()
  ;
  ((self._ui).frame_Content):SetSize(((self._ui).frame_Content):GetSizeX(), 150 * progressLength)
  ;
  ((self._ui).frame_Content):SetIgnore(false)
  ;
  ((self._ui).scroll_Vertical):SetShow(true)
  ;
  ((self._ui).scroll_Vertical):SetPosXY(0, 0)
end

CharacterChallengeInfo.getNewRewardCopy = function(self, uiIdx)
  -- function num : 0_2
  local _newCopy = {stc_RewardBG, txt_Title, txt_Desc, txt_Basic, txt_Select, button_GetReward, txt_ReceiveIcon; 
stc_BasicItem = {}
, 
stc_BasicItemBG = {}
, 
stc_SelectItem = {}
, 
stc_SelectItemBG = {}
}
  _newCopy.stc_RewardBG = (UI.createAndCopyBasePropertyControl)((self._ui).frame_Content, "Static_Reward_BG", (self._ui).frame_Content, "Static_Reward_BG_No" .. uiIdx)
  _newCopy.txt_Title = (UI.createAndCopyBasePropertyControl)((self._ui).stc_RewardBG, "StaticText_Title", _newCopy.stc_RewardBG, "StaticText_Title_No" .. uiIdx)
  _newCopy.txt_Desc = (UI.createAndCopyBasePropertyControl)((self._ui).stc_RewardBG, "StaticText_Desc", _newCopy.stc_RewardBG, "StaticText_Desc_No" .. uiIdx)
  _newCopy.txt_Basic = (UI.createAndCopyBasePropertyControl)((self._ui).stc_RewardBG, "StaticText_Basic", _newCopy.stc_RewardBG, "StaticText_Basic_No" .. uiIdx)
  _newCopy.txt_Select = (UI.createAndCopyBasePropertyControl)((self._ui).stc_RewardBG, "StaticText_Select", _newCopy.stc_RewardBG, "StaticText_Select_No" .. uiIdx)
  for idx = 0, self._maxBasicSlotCount - 1 do
    -- DECOMPILER ERROR at PC93: Confused about usage of register: R7 in 'UnsetPending'

    (_newCopy.stc_BasicItemBG)[idx] = (UI.createAndCopyBasePropertyControl)((self._ui).stc_RewardBG, "Static_Basic_Item" .. idx, _newCopy.stc_RewardBG, "Static_Basic_ItemBG_No" .. uiIdx .. "_" .. idx)
    -- DECOMPILER ERROR at PC109: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (_newCopy.stc_BasicItem)[idx] = (UI.createAndCopyBasePropertyControl)((self._ui).stc_RewardBG, "Static_Basic_Item" .. idx, _newCopy.stc_RewardBG, "Static_Basic_Item_No" .. uiIdx .. "_" .. idx)
  end
  for idx = 0, self._maxSelectSlotCount - 1 do
    -- DECOMPILER ERROR at PC131: Confused about usage of register: R7 in 'UnsetPending'

    (_newCopy.stc_SelectItemBG)[idx] = (UI.createAndCopyBasePropertyControl)((self._ui).stc_RewardBG, "Static_Select_Item" .. idx, _newCopy.stc_RewardBG, "Static_Select_ItemBG_No" .. uiIdx .. "_" .. idx)
    -- DECOMPILER ERROR at PC147: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (_newCopy.stc_SelectItem)[idx] = (UI.createAndCopyBasePropertyControl)((self._ui).stc_RewardBG, "Static_Select_Item" .. idx, _newCopy.stc_RewardBG, "Static_Select_Item_No" .. uiIdx .. "_" .. idx)
  end
  _newCopy.button_GetReward = (UI.createAndCopyBasePropertyControl)((self._ui).stc_RewardBG, "Button_Get_Reward", _newCopy.stc_RewardBG, "Button_Get_Reward_No" .. uiIdx)
  if _ContentsGroup_RenewUI then
    _newCopy.txt_ReceiveIcon = (UI.createAndCopyBasePropertyControl)((self._ui).stc_RewardBG, "StaticText_ReceiveIcon_ConsoleUI", _newCopy.stc_RewardBG, "StaticText_ReceiveIcon_ConsoleUI_No" .. uiIdx)
  end
  return _newCopy
end

CharacterChallengeInfo.rewardUpdate = function(self, challengeWrapper, challengeIdx, uiIdx)
  -- function num : 0_3
  if challengeWrapper == nil then
    return 
  end
  local baseCount = challengeWrapper:getBaseRewardCount()
  local _baseReward = {}
  for idx = 1, baseCount do
    local baseReward = challengeWrapper:getBaseRewardAt(idx - 1)
    _baseReward[idx] = {}
    -- DECOMPILER ERROR at PC17: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (_baseReward[idx])._type = baseReward._type
    -- DECOMPILER ERROR at PC24: Confused about usage of register: R11 in 'UnsetPending'

    if __eRewardExp == baseReward._type then
      (_baseReward[idx])._exp = baseReward._experience
    else
      -- DECOMPILER ERROR at PC32: Confused about usage of register: R11 in 'UnsetPending'

      if __eRewardSkillExp == baseReward._type then
        (_baseReward[idx])._exp = baseReward._skillExperience
      else
        -- DECOMPILER ERROR at PC40: Confused about usage of register: R11 in 'UnsetPending'

        if __eRewardLifeExp == baseReward._type then
          (_baseReward[idx])._exp = baseReward._productExperience
        else
          -- DECOMPILER ERROR at PC49: Confused about usage of register: R11 in 'UnsetPending'

          if __eRewardItem == baseReward._type then
            (_baseReward[idx])._item = baseReward:getItemEnchantKey()
            -- DECOMPILER ERROR at PC52: Confused about usage of register: R11 in 'UnsetPending'

            ;
            (_baseReward[idx])._count = baseReward._itemCount
          else
            -- DECOMPILER ERROR at PC61: Confused about usage of register: R11 in 'UnsetPending'

            if __eRewardIntimacy == baseReward._type then
              (_baseReward[idx])._character = baseReward:getIntimacyCharacter()
              -- DECOMPILER ERROR at PC64: Confused about usage of register: R11 in 'UnsetPending'

              ;
              (_baseReward[idx])._value = baseReward._intimacyValue
            end
          end
        end
      end
    end
  end
  local _baseRewardCount = #_baseReward
  for ii = 0, self._maxBasicSlotCount - 1 do
    (((self._uiBackBaseReward)[uiIdx])[ii]):EraseAllEffect()
    if ii < _baseRewardCount then
      self:setChallengeRewardShow(((self._listBaseRewardSlots)[uiIdx])[ii], _baseReward[ii + 1], uiIdx, ii, "main")
      ;
      (((self._uiBackBaseReward)[uiIdx])[ii]):SetShow(true)
    else
      ;
      (((self._uiBackBaseReward)[uiIdx])[ii]):SetShow(false)
    end
  end
  local selectCount = challengeWrapper:getSelectRewardCount()
  local _selectReward = {}
  if selectCount > 0 then
    for idx = 1, selectCount do
      local selectReward = challengeWrapper:getSelectRewardAt(idx - 1)
      _selectReward[idx] = {}
      -- DECOMPILER ERROR at PC119: Confused about usage of register: R14 in 'UnsetPending'

      ;
      (_selectReward[idx])._type = selectReward._type
      -- DECOMPILER ERROR at PC126: Confused about usage of register: R14 in 'UnsetPending'

      if __eRewardExp == selectReward._type then
        (_selectReward[idx])._exp = selectReward._experience
      else
        -- DECOMPILER ERROR at PC134: Confused about usage of register: R14 in 'UnsetPending'

        if __eRewardSkillExp == selectReward._type then
          (_selectReward[idx])._exp = selectReward._skillExperience
        else
          -- DECOMPILER ERROR at PC142: Confused about usage of register: R14 in 'UnsetPending'

          if __eRewardLifeExp == selectReward._type then
            (_selectReward[idx])._exp = selectReward._productExperience
          else
            -- DECOMPILER ERROR at PC151: Confused about usage of register: R14 in 'UnsetPending'

            if __eRewardItem == selectReward._type then
              (_selectReward[idx])._item = selectReward:getItemEnchantKey()
              -- DECOMPILER ERROR at PC154: Confused about usage of register: R14 in 'UnsetPending'

              ;
              (_selectReward[idx])._count = selectReward._itemCount
              local selfPlayer = getSelfPlayer()
              if selfPlayer ~= nil then
                local classType = selfPlayer:getClassType()
                -- DECOMPILER ERROR at PC165: Confused about usage of register: R16 in 'UnsetPending'

                ;
                (_selectReward[idx])._isEquipable = selectReward:isEquipable(classType)
              end
            else
              do
                do
                  -- DECOMPILER ERROR at PC174: Confused about usage of register: R14 in 'UnsetPending'

                  if __eRewardIntimacy == selectReward._type then
                    (_selectReward[idx])._character = selectReward:getIntimacyCharacter()
                    -- DECOMPILER ERROR at PC177: Confused about usage of register: R14 in 'UnsetPending'

                    ;
                    (_selectReward[idx])._value = selectReward._intimacyValue
                  end
                  -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC178: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
    end
  end
  local _selectRewardCount = #_selectReward
  for ii = 0, self._maxSelectSlotCount - 1 do
    if ii < _selectRewardCount then
      self:setChallengeRewardShow(((self._listSelectRewardSlots)[uiIdx])[ii], _selectReward[ii + 1], uiIdx, ii, "sub")
      ;
      (((self._uiButtonSelectRewardSlots)[uiIdx])[ii]):SetShow(true)
      if self._currentCategoryType == 5 then
        ((((self._listSelectRewardSlots)[uiIdx])[ii]).icon):addInputEvent("Mouse_LUp", "ChallengeSelectReward_Set_Renew( " .. challengeIdx .. ", " .. uiIdx .. ", " .. ii .. " )")
        ;
        ((((self._listSelectRewardSlots)[uiIdx])[ii]).icon):SetColor((Defines.Color).C_70FFFFFF)
      end
    else
      ;
      (((self._uiButtonSelectRewardSlots)[uiIdx])[ii]):SetShow(false)
    end
  end
end

ChallengeSelectReward_Set_Renew = function(challenge_Idx, uiIdx, slot_Idx)
  -- function num : 0_4 , upvalues : CharacterChallengeInfo
  local self = CharacterChallengeInfo
  self._selectedReward_ChallengeIndex = challenge_Idx
  self._selectedReward_SlotIndex = slot_Idx
  local progressLength = ToClient_GetChallengeRewardInfoCount()
  for ui_idx = 0, progressLength - 1 do
    for idx = 0, self._maxSelectSlotCount - 1 do
      ((((self._listSelectRewardSlots)[ui_idx])[idx]).icon):SetColor((Defines.Color).C_70FFFFFF)
    end
  end
  ;
  ((((self._listSelectRewardSlots)[uiIdx])[slot_Idx]).icon):SetColor((Defines.Color).C_FFFFFFFF)
  local challengeWrapper = ToClient_GetChallengeRewardInfoWrapper(challenge_Idx)
  local selectRewardCount = challengeWrapper:getSelectRewardCount()
  if selectRewardCount == 0 then
    self._selectedReward_SlotIndex = 0
  end
end

HandleClicked_Reward_Show_Renew = function(challenge_Idx, selectIndex)
  -- function num : 0_5 , upvalues : CharacterChallengeInfo
  local self = CharacterChallengeInfo
  local selectedRewardSlotIndex = self._selectedReward_SlotIndex
  local challengeWrapper = ToClient_GetChallengeRewardInfoWrapper(challenge_Idx)
  local selectRewardCount = challengeWrapper:getSelectRewardCount()
  if selectRewardCount ~= 0 and selectedRewardSlotIndex == nil then
    Proc_ShowMessage_Ack_WithOut_ChattingMessage(PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_YOUCANSELECTITEM"))
    return 
  end
  if challengeWrapper == nil then
    Proc_ShowMessage_Ack_WithOut_ChattingMessage(PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_WRONGINFOCHALLENGE"))
    return 
  end
  if selectRewardCount ~= 0 and selectRewardCount - 1 < selectedRewardSlotIndex then
    Proc_ShowMessage_Ack_WithOut_ChattingMessage(PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_WRONGSELECTVALUE"))
    return 
  end
  if self._selectedReward_ChallengeIndex ~= challenge_Idx and selectRewardCount ~= 0 then
    Proc_ShowMessage_Ack_WithOut_ChattingMessage(PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_WRONGSELECTVALUE"))
    return 
  end
  if selectRewardCount == 0 or selectedRewardSlotIndex == nil then
    selectedRewardSlotIndex = selectRewardCount
  end
  local challengeKey = challengeWrapper:getKey()
  ToClient_AcceptReward_ButtonClicked(challengeKey, selectedRewardSlotIndex)
end

CharacterChallengeInfo.setChallengeRewardShow = function(self, uiSlot, reward, uiIdx, index, questType)
  -- function num : 0_6
  uiSlot._type = reward._type
  if __eRewardExp == reward._type then
    (uiSlot.count):SetText("")
    ;
    (uiSlot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/EXP.dds")
    ;
    (uiSlot.icon):addInputEvent("Mouse_On", "ChallengeRewardTooltip_Renew( \"Exp\", true, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
    ;
    (uiSlot.icon):addInputEvent("Mouse_Out", "ChallengeRewardTooltip_Renew( \"Exp\", false, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
    ;
    (uiSlot.icon):setTooltipEventRegistFunc("ChallengeRewardTooltip_Renew( \"Exp\", true, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
  else
    if __eRewardSkillExp == reward._type then
      (uiSlot.count):SetText("")
      ;
      (uiSlot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/SkillExp.dds")
      ;
      (uiSlot.icon):addInputEvent("Mouse_On", "ChallengeRewardTooltip_Renew( \"SkillExp\", true, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
      ;
      (uiSlot.icon):addInputEvent("Mouse_Out", "ChallengeRewardTooltip_Renew( \"SkillExp\", false, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
      ;
      (uiSlot.icon):setTooltipEventRegistFunc("ChallengeRewardTooltip_Renew( \"SkillExp\", true, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
    else
      if __eRewardLifeExp == reward._type then
        (uiSlot.count):SetText("")
        ;
        (uiSlot.icon):ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/EXP.dds")
        ;
        (uiSlot.icon):addInputEvent("Mouse_On", "ChallengeRewardTooltip_Renew( \"ProductExp\", true, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
        ;
        (uiSlot.icon):addInputEvent("Mouse_Out", "ChallengeRewardTooltip_Renew( \"ProductExp\", false, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
        ;
        (uiSlot.icon):setTooltipEventRegistFunc("ChallengeRewardTooltip_Renew( \"ProductExp\", true, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
      else
        if __eRewardItem == reward._type then
          local itemStatic = getItemEnchantStaticStatus(ItemEnchantKey(reward._item))
          uiSlot:setItemByStaticStatus(itemStatic, reward._count)
          uiSlot._item = reward._item
          if questType == "main" then
            (uiSlot.icon):addInputEvent("Mouse_On", "Challenge_RewardItemTooltipShow_Renew( true, " .. uiIdx .. ", " .. index .. ", \"" .. questType .. "\" )")
            ;
            (uiSlot.icon):addInputEvent("Mouse_Out", "Challenge_RewardItemTooltipShow_Renew( false, " .. uiIdx .. ", " .. index .. ", \"" .. questType .. "\" )")
            ;
            (uiSlot.icon):setTooltipEventRegistFunc("Challenge_RewardItemTooltipShow_Renew( true, " .. uiIdx .. ", " .. index .. ", \"" .. questType .. "\" )")
          else
            ;
            (uiSlot.icon):addInputEvent("Mouse_On", "Challenge_RewardItemTooltipShow_Renew( true, " .. uiIdx .. ", " .. index .. ", \"" .. questType .. "\" )")
            ;
            (uiSlot.icon):addInputEvent("Mouse_Out", "Challenge_RewardItemTooltipShow_Renew( false, " .. uiIdx .. ", " .. index .. ", \"" .. questType .. "\" )")
            ;
            (uiSlot.icon):setTooltipEventRegistFunc("Challenge_RewardItemTooltipShow_Renew( true, " .. uiIdx .. ", " .. index .. ", \"" .. questType .. "\" )")
          end
          return reward._isEquipable
        else
          do
            if __eRewardIntimacy == reward._type then
              (uiSlot.count):SetText(tostring(reward._value))
              ;
              (uiSlot.icon):ChangeTextureInfoName("Icon/New_Icon/00000000_Special_Contributiveness.dds")
              ;
              (uiSlot.icon):addInputEvent("Mouse_On", "ChallengeRewardTooltip_Renew( \"Intimacy\", true, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
              ;
              (uiSlot.icon):addInputEvent("Mouse_Out", "ChallengeRewardTooltip_Renew( \"Intimacy\", false, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
              ;
              (uiSlot.icon):setTooltipEventRegistFunc("ChallengeRewardTooltip_Renew( \"Intimacy\", true, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
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

ChallengeRewardTooltip_Renew = function(type, show, questtype, index, uiIdx)
  -- function num : 0_7 , upvalues : CharacterChallengeInfo
  local self = CharacterChallengeInfo
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
      expTooltip:SetPosX((((self._uiBackBaseReward)[uiIdx])[index]):GetPosX() - expTooltip:GetSizeX() / 2)
      expTooltip:SetPosY((((self._uiBackBaseReward)[uiIdx])[index]):GetPosY() - expTooltip:GetSizeY() - 10)
    else
      expTooltip:SetPosX((((self._uiButtonSelectRewardSlots)[uiIdx])[index]):GetPosX() - expTooltip:GetSizeX() / 2)
      expTooltip:SetPosY((((self._uiButtonSelectRewardSlots)[uiIdx])[index]):GetPosY() - expTooltip:GetSizeY())
    end
    registTooltipControl(expTooltip, Panel_CheckedQuest)
    expTooltip:SetShow(true)
  else
    expTooltip:SetShow(false)
  end
end

Challenge_RewardItemTooltipShow_Renew = function(isShow, uiIdx, slotNo, rewardType)
  -- function num : 0_8 , upvalues : CharacterChallengeInfo
  local self = CharacterChallengeInfo
  local passTooltipType, uiSlot = nil, nil
  if rewardType == "main" then
    passTooltipType = "Dialog_ChallengeReward_Base"
    uiSlot = ((self._listBaseRewardSlots)[uiIdx])[slotNo]
  else
    passTooltipType = "Dialog_ChallengeReward_Select"
    uiSlot = ((self._listSelectRewardSlots)[uiIdx])[slotNo]
  end
  Panel_Tooltip_Item_SetPosition(slotNo, uiSlot, passTooltipType)
  if isShow == true then
    Panel_Tooltip_Item_Show_GeneralStatic(slotNo, passTooltipType, true)
  else
    if isShow == false then
      Panel_Tooltip_Item_hideTooltip()
    end
  end
end

InputMLUp_CharacterChallengeInfo_TapToOpen = function(index)
  -- function num : 0_9 , upvalues : CharacterChallengeInfo
  local self = CharacterChallengeInfo
  self:updateData(index)
end

PaGlobalFunc_CharacterChallengeInfo_UpdateData = function()
  -- function num : 0_10 , upvalues : CharacterChallengeInfo
  if CharacterChallengeInfo == nil then
    return 
  end
  local self = CharacterChallengeInfo
  self:updateData(self._currentCategoryType)
end

CharacterChallengeInfo.registEvent = function(self)
  -- function num : 0_11
  registerEvent("FromClient_ChallengeReward_UpdateText", "PaGlobalFunc_CharacterChallengeInfo_UpdateData")
end

FromClient_luaLoadComplete_Panel_Window_Character_ChallengeInfo = function()
  -- function num : 0_12 , upvalues : CharacterChallengeInfo, _mainPanel, _panel
  local self = CharacterChallengeInfo
  self:init()
  self.defaultFrameBG_CharacterInfo_Challenge = (UI.getChildControl)(_mainPanel, "Static_ChallengeInfoBg")
  ;
  (self.defaultFrameBG_CharacterInfo_Challenge):SetShow(false)
  ;
  (self.defaultFrameBG_CharacterInfo_Challenge):MoveChilds((self.defaultFrameBG_CharacterInfo_Challenge):GetID(), _panel)
  deletePanel(_panel:GetID())
  self:registEvent()
  self:updateData(0)
end

PaGlobalFunc_CharacterChallengeInfo_ShowRightNextTab = function()
  -- function num : 0_13 , upvalues : CharacterChallengeInfo
  local self = CharacterChallengeInfo
  self:ShowNextTab(false)
end

PaGlobalFunc_CharacterChallengeInfo_ShowLeftNextTab = function()
  -- function num : 0_14 , upvalues : CharacterChallengeInfo
  local self = CharacterChallengeInfo
  self:ShowNextTab(true)
end

CharacterChallengeInfo.ShowNextTab = function(self, isLeft)
  -- function num : 0_15
  -- DECOMPILER ERROR at PC7: Unhandled construct in 'MakeBoolean' P1

  if isLeft == true and self._currentCategoryType > 0 then
    self._currentCategoryType = self._currentCategoryType - 1
    self:updateData(self._currentCategoryType)
  end
  if self._currentCategoryType < self._maxCategoryType - 1 then
    self._currentCategoryType = self._currentCategoryType + 1
    self:updateData(self._currentCategoryType)
  end
end

PaGlobalFunc_CharacterChallengeInfoTab_PadControl = function(index)
  -- function num : 0_16 , upvalues : CharacterChallengeInfo
  self = CharacterChallengeInfo
  if index == 0 then
    self:ShowNextTab(true)
  else
    self:ShowNextTab(false)
  end
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_Panel_Window_Character_ChallengeInfo")

