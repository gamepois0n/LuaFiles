local _mainPanel = Panel_Window_CharacterInfo_Renew
local _panel = Panel_Window_CharacterInfo_Challenge_Renew
local CharacterChallengeInfo = {
  _ui = {
    stc_CategoryTap = UI.getChildControl(_panel, "Static_Category_Tap"),
    frame_RewardList = UI.getChildControl(_panel, "Frame_Reward_List")
  },
  defaultFrameBG_CharacterInfo_Challenge = nil,
  challengeRewardSlotConfig = {
    createIcon = true,
    createBorder = true,
    createCount = true,
    createClassEquipBG = true,
    createCash = true
  },
  _uiBackBaseReward = {},
  _listBaseRewardSlots = {},
  _uiButtonSelectRewardSlots = {},
  _listSelectRewardSlots = {},
  _rewardList = {},
  _maxBasicSlotCount = 4,
  _maxSelectSlotCount = 6,
  _currentCategoryType = nil,
  _maxCategoryType = 6,
  _selectedReward_ChallengeIndex = nil,
  _selectedReward_SlotIndex = nil,
  challengeRewardInfoIndex = {doneInfo = 4, doneRewardInfo = 5}
}
function CharacterChallengeInfo:init()
  self._ui.stc_LT = UI.getChildControl(self._ui.stc_CategoryTap, "Static_LT_ConsoleUI")
  self._ui.stc_LT:addInputEvent("Mouse_LUp", "PaGlobalFunc_CharacterChallengeInfo_ShowLeftNextTab()")
  self._ui.stc_RT = UI.getChildControl(self._ui.stc_CategoryTap, "Static_RT_ConsoleUI")
  self._ui.stc_RT:addInputEvent("Mouse_LUp", "PaGlobalFunc_CharacterChallengeInfo_ShowRightNextTab()")
  self._ui.radioButton_Type = {}
  self._ui.radioButton_Type[0] = UI.getChildControl(self._ui.stc_CategoryTap, "RadioButton_Object")
  self._ui.radioButton_Type[0]:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_TAPMENU_SHORT"))
  self._ui.radioButton_Type[1] = UI.getChildControl(self._ui.stc_CategoryTap, "RadioButton_Time")
  self._ui.radioButton_Type[1]:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_TAPMENU_DAILY"))
  self._ui.radioButton_Type[2] = UI.getChildControl(self._ui.stc_CategoryTap, "RadioButton_PC_Room")
  self._ui.radioButton_Type[2]:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_TAPMENU_PCROOM"))
  self._ui.radioButton_Type[3] = UI.getChildControl(self._ui.stc_CategoryTap, "RadioButton_Event")
  self._ui.radioButton_Type[3]:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_TAPMENU_EVENT"))
  self._ui.radioButton_Type[4] = UI.getChildControl(self._ui.stc_CategoryTap, "RadioButton_Pre_Complete")
  self._ui.radioButton_Type[4]:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_TAPMENU_COMPLETE"))
  self._ui.radioButton_Type[5] = UI.getChildControl(self._ui.stc_CategoryTap, "RadioButton_Complete")
  self._ui.radioButton_Type[5]:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_TAPMENU_COMPLETEGETITEM"))
  for ii = 0, 5 do
    self._ui.radioButton_Type[ii]:addInputEvent("Mouse_LUp", "InputMLUp_CharacterChallengeInfo_TapToOpen(" .. ii .. ")")
  end
  self._ui.frame_Content = UI.getChildControl(self._ui.frame_RewardList, "Frame_Content")
  self._ui.stc_RewardBG = UI.getChildControl(self._ui.frame_Content, "Static_Reward_BG")
  self._ui.txt_Title = UI.getChildControl(self._ui.stc_RewardBG, "StaticText_Title")
  self._ui.txt_Desc = UI.getChildControl(self._ui.stc_RewardBG, "StaticText_Desc")
  self._ui.txt_Basic = UI.getChildControl(self._ui.stc_RewardBG, "StaticText_Basic")
  self._ui.txt_Select = UI.getChildControl(self._ui.stc_RewardBG, "StaticText_Select")
  self._ui.stc_BasicItem = {}
  for idx = 0, self._maxBasicSlotCount - 1 do
    self._ui.stc_BasicItem[idx] = UI.getChildControl(self._ui.stc_RewardBG, "Static_Basic_Item" .. idx)
  end
  self._ui.stc_SelectItem = {}
  for idx = 0, self._maxSelectSlotCount - 1 do
    self._ui.stc_SelectItem[idx] = UI.getChildControl(self._ui.stc_RewardBG, "Static_Select_Item" .. idx)
  end
  self._ui.button_GetReward = UI.getChildControl(self._ui.stc_RewardBG, "Button_Get_Reward")
  if true == _ContentsGroup_RenewUI then
    self._ui.txt_ReceiveIcon = UI.getChildControl(self._ui.stc_RewardBG, "StaticText_ReceiveIcon_ConsoleUI")
  end
  self._ui.stc_RewardBG:SetShow(false)
  self._ui.scroll_Vertical = UI.getChildControl(self._ui.frame_RewardList, "Frame_VerticalScroll")
  self._ui.btn_VerticalUp = UI.getChildControl(self._ui.scroll_Vertical, "Frame_VerticalScroll_UpButton")
  self._ui.btn_VerticalDown = UI.getChildControl(self._ui.scroll_Vertical, "Frame_VerticalScroll_DownButton")
  self._ui.btn_VerticalCtrl = UI.getChildControl(self._ui.scroll_Vertical, "Frame_VerticalScroll_CtrlButton")
  self._ui.scroll_Horizontal = UI.getChildControl(self._ui.frame_RewardList, "Frame_HorizontalScroll")
end
function CharacterChallengeInfo:updateData(index)
  self._currentCategoryType = index
  for radioIdx = 0, 5 do
    self._ui.radioButton_Type[radioIdx]:SetFontColor(Defines.Color.C_FF888888)
  end
  self._ui.radioButton_Type[index]:SetFontColor(Defines.Color.C_FFEEEEEE)
  local progressLength
  if self.challengeRewardInfoIndex.doneInfo == index then
    progressLength = ToClient_GetCompletedChallengeCount()
  elseif self.challengeRewardInfoIndex.doneRewardInfo == index then
    progressLength = ToClient_GetChallengeRewardInfoCount()
  else
    progressLength = ToClient_GetProgressChallengeCount(index + 1)
  end
  local uiIdx = 0
  while progressLength > uiIdx do
    if nil == self._rewardList[uiIdx] then
      local _newReward = self:getNewRewardCopy(uiIdx)
      _newReward.stc_RewardBG:SetPosY(150 * uiIdx)
      self._rewardList[uiIdx] = _newReward
    end
    local progressInfo
    if self.challengeRewardInfoIndex.doneInfo == index then
      progressInfo = ToClient_GetCompletedChallengeAt(uiIdx)
      self._rewardList[uiIdx].button_GetReward:removeInputEvent("Mouse_LUp")
      if true == _ContentsGroup_RenewUI then
        self._rewardList[uiIdx].txt_ReceiveIcon:SetShow(false)
      end
      self._rewardList[uiIdx].button_GetReward:SetColor(Defines.Color.C_70FFFFFF)
      self._rewardList[uiIdx].button_GetReward:SetIgnore(true)
      self._rewardList[uiIdx].button_GetReward:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_CHALLENGE_ACHIVED"))
    elseif self.challengeRewardInfoIndex.doneRewardInfo == index then
      progressInfo = ToClient_GetChallengeRewardInfoWrapper(uiIdx)
      self._rewardList[uiIdx].button_GetReward:addInputEvent("Mouse_LUp", "HandleClicked_Reward_Show_Renew( " .. uiIdx .. ", " .. 0 .. " )")
      local existRewardCount = progressInfo:getRewardCount()
      self._rewardList[uiIdx].button_GetReward:SetIgnore(false)
      self._rewardList[uiIdx].button_GetReward:SetColor(Defines.Color.C_FFFFFFFF)
      if true == _ContentsGroup_RenewUI then
        self._rewardList[uiIdx].txt_ReceiveIcon:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHALLENGE_BTNGETREWARD", "existRewardCount", existRewardCount))
        self._rewardList[uiIdx].txt_ReceiveIcon:SetShow(true)
        self._rewardList[uiIdx].button_GetReward:SetText("")
      else
        self._rewardList[uiIdx].button_GetReward:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHALLENGE_BTNGETREWARD", "existRewardCount", existRewardCount))
      end
    else
      progressInfo = ToClient_GetProgressChallengeAt(index + 1, uiIdx)
      self._rewardList[uiIdx].button_GetReward:removeInputEvent("Mouse_LUp")
      if true == _ContentsGroup_RenewUI then
        self._rewardList[uiIdx].txt_ReceiveIcon:SetShow(false)
      end
      self._rewardList[uiIdx].button_GetReward:SetColor(Defines.Color.C_70FFFFFF)
      self._rewardList[uiIdx].button_GetReward:SetIgnore(true)
      self._rewardList[uiIdx].button_GetReward:SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_CHALLENGE_NOTACHIVED"))
    end
    if nil == self._listBaseRewardSlots[uiIdx] then
      self._uiBackBaseReward[uiIdx] = {}
      self._listBaseRewardSlots[uiIdx] = {}
      for basicSlotIdx = 0, self._maxBasicSlotCount - 1 do
        self._uiBackBaseReward[uiIdx][basicSlotIdx] = self._rewardList[uiIdx].stc_BasicItem[basicSlotIdx]
        local slot = {}
        SlotItem.new(slot, "BaseReward_" .. basicSlotIdx, basicSlotIdx, self._rewardList[uiIdx].stc_BasicItem[basicSlotIdx], self.challengeRewardSlotConfig)
        slot:createChild()
        slot.icon:SetSize(42, 42)
        slot.icon:SetPosX(14)
        slot.icon:SetPosY(14)
        slot.border:SetSize(42, 42)
        slot.border:SetPosX(1)
        slot.border:SetPosY(1)
        self._listBaseRewardSlots[uiIdx][basicSlotIdx] = slot
      end
    end
    if nil == self._listSelectRewardSlots[uiIdx] then
      self._uiButtonSelectRewardSlots[uiIdx] = {}
      self._listSelectRewardSlots[uiIdx] = {}
      for selectSlotIdx = 0, self._maxSelectSlotCount - 1 do
        self._uiButtonSelectRewardSlots[uiIdx][selectSlotIdx] = self._rewardList[uiIdx].stc_SelectItem[selectSlotIdx]
        local slot = {}
        SlotItem.new(slot, "SelectReward_" .. selectSlotIdx, selectSlotIdx, self._rewardList[uiIdx].stc_SelectItem[selectSlotIdx], self.challengeRewardSlotConfig)
        slot:createChild()
        slot.icon:SetSize(30, 30)
        slot.icon:SetPosX(5)
        slot.icon:SetPosY(5)
        slot.icon:SetIgnore(false)
        slot.border:SetSize(30, 30)
        slot.count:SetPosX(-5)
        slot.count:SetPosY(13)
        slot.classEquipBG:SetHorizonRight()
        slot.classEquipBG:SetVerticalBottom()
        slot.classEquipBG:SetSpanSize(2, 2)
        self._listSelectRewardSlots[uiIdx][selectSlotIdx] = slot
      end
    end
    self:rewardUpdate(progressInfo, uiIdx, uiIdx)
    self._rewardList[uiIdx].txt_Desc:SetTextMode(CppEnums.TextMode.eTextMode_AutoWrap)
    self._rewardList[uiIdx].txt_Desc:SetAutoResize(true)
    self._rewardList[uiIdx].txt_Title:SetText(progressInfo:getName())
    self._rewardList[uiIdx].txt_Desc:SetText(progressInfo:getDesc())
    self._rewardList[uiIdx].stc_RewardBG:SetShow(true)
    uiIdx = uiIdx + 1
  end
  while uiIdx < #self._rewardList do
    self._rewardList[uiIdx].stc_RewardBG:SetShow(false)
    uiIdx = uiIdx + 1
  end
  self._ui.frame_RewardList:UpdateContentScroll()
  self._ui.scroll_Vertical:SetControlTop()
  self._ui.frame_RewardList:UpdateContentPos()
  self._ui.frame_Content:SetSize(self._ui.frame_Content:GetSizeX(), 150 * progressLength)
  self._ui.frame_Content:SetIgnore(false)
  self._ui.scroll_Vertical:SetShow(true)
  self._ui.scroll_Vertical:SetPosXY(0, 0)
end
function CharacterChallengeInfo:getNewRewardCopy(uiIdx)
  local _newCopy = {
    stc_RewardBG,
    txt_Title,
    txt_Desc,
    txt_Basic,
    txt_Select,
    stc_BasicItem = {},
    stc_BasicItemBG = {},
    stc_SelectItem = {},
    stc_SelectItemBG = {},
    button_GetReward,
    txt_ReceiveIcon
  }
  _newCopy.stc_RewardBG = UI.createAndCopyBasePropertyControl(self._ui.frame_Content, "Static_Reward_BG", self._ui.frame_Content, "Static_Reward_BG_No" .. uiIdx)
  _newCopy.txt_Title = UI.createAndCopyBasePropertyControl(self._ui.stc_RewardBG, "StaticText_Title", _newCopy.stc_RewardBG, "StaticText_Title_No" .. uiIdx)
  _newCopy.txt_Desc = UI.createAndCopyBasePropertyControl(self._ui.stc_RewardBG, "StaticText_Desc", _newCopy.stc_RewardBG, "StaticText_Desc_No" .. uiIdx)
  _newCopy.txt_Basic = UI.createAndCopyBasePropertyControl(self._ui.stc_RewardBG, "StaticText_Basic", _newCopy.stc_RewardBG, "StaticText_Basic_No" .. uiIdx)
  _newCopy.txt_Select = UI.createAndCopyBasePropertyControl(self._ui.stc_RewardBG, "StaticText_Select", _newCopy.stc_RewardBG, "StaticText_Select_No" .. uiIdx)
  for idx = 0, self._maxBasicSlotCount - 1 do
    _newCopy.stc_BasicItemBG[idx] = UI.createAndCopyBasePropertyControl(self._ui.stc_RewardBG, "Static_Basic_Item" .. idx, _newCopy.stc_RewardBG, "Static_Basic_ItemBG_No" .. uiIdx .. "_" .. idx)
    _newCopy.stc_BasicItem[idx] = UI.createAndCopyBasePropertyControl(self._ui.stc_RewardBG, "Static_Basic_Item" .. idx, _newCopy.stc_RewardBG, "Static_Basic_Item_No" .. uiIdx .. "_" .. idx)
  end
  for idx = 0, self._maxSelectSlotCount - 1 do
    _newCopy.stc_SelectItemBG[idx] = UI.createAndCopyBasePropertyControl(self._ui.stc_RewardBG, "Static_Select_Item" .. idx, _newCopy.stc_RewardBG, "Static_Select_ItemBG_No" .. uiIdx .. "_" .. idx)
    _newCopy.stc_SelectItem[idx] = UI.createAndCopyBasePropertyControl(self._ui.stc_RewardBG, "Static_Select_Item" .. idx, _newCopy.stc_RewardBG, "Static_Select_Item_No" .. uiIdx .. "_" .. idx)
  end
  _newCopy.button_GetReward = UI.createAndCopyBasePropertyControl(self._ui.stc_RewardBG, "Button_Get_Reward", _newCopy.stc_RewardBG, "Button_Get_Reward_No" .. uiIdx)
  if _ContentsGroup_RenewUI then
    _newCopy.txt_ReceiveIcon = UI.createAndCopyBasePropertyControl(self._ui.stc_RewardBG, "StaticText_ReceiveIcon_ConsoleUI", _newCopy.stc_RewardBG, "StaticText_ReceiveIcon_ConsoleUI_No" .. uiIdx)
  end
  return _newCopy
end
function CharacterChallengeInfo:rewardUpdate(challengeWrapper, challengeIdx, uiIdx)
  if nil == challengeWrapper then
    return
  end
  local baseCount = challengeWrapper:getBaseRewardCount()
  local _baseReward = {}
  for idx = 1, baseCount do
    local baseReward = challengeWrapper:getBaseRewardAt(idx - 1)
    _baseReward[idx] = {}
    _baseReward[idx]._type = baseReward._type
    if __eRewardExp == baseReward._type then
      _baseReward[idx]._exp = baseReward._experience
    elseif __eRewardSkillExp == baseReward._type then
      _baseReward[idx]._exp = baseReward._skillExperience
    elseif __eRewardLifeExp == baseReward._type then
      _baseReward[idx]._exp = baseReward._productExperience
    elseif __eRewardItem == baseReward._type then
      _baseReward[idx]._item = baseReward:getItemEnchantKey()
      _baseReward[idx]._count = baseReward._itemCount
    elseif __eRewardIntimacy == baseReward._type then
      _baseReward[idx]._character = baseReward:getIntimacyCharacter()
      _baseReward[idx]._value = baseReward._intimacyValue
    end
  end
  local _baseRewardCount = #_baseReward
  for ii = 0, self._maxBasicSlotCount - 1 do
    self._uiBackBaseReward[uiIdx][ii]:EraseAllEffect()
    if ii < _baseRewardCount then
      self:setChallengeRewardShow(self._listBaseRewardSlots[uiIdx][ii], _baseReward[ii + 1], uiIdx, ii, "main")
      self._uiBackBaseReward[uiIdx][ii]:SetShow(true)
    else
      self._uiBackBaseReward[uiIdx][ii]:SetShow(false)
    end
  end
  local selectCount = challengeWrapper:getSelectRewardCount()
  local _selectReward = {}
  if selectCount > 0 then
    for idx = 1, selectCount do
      local selectReward = challengeWrapper:getSelectRewardAt(idx - 1)
      _selectReward[idx] = {}
      _selectReward[idx]._type = selectReward._type
      if __eRewardExp == selectReward._type then
        _selectReward[idx]._exp = selectReward._experience
      elseif __eRewardSkillExp == selectReward._type then
        _selectReward[idx]._exp = selectReward._skillExperience
      elseif __eRewardLifeExp == selectReward._type then
        _selectReward[idx]._exp = selectReward._productExperience
      elseif __eRewardItem == selectReward._type then
        _selectReward[idx]._item = selectReward:getItemEnchantKey()
        _selectReward[idx]._count = selectReward._itemCount
        local selfPlayer = getSelfPlayer()
        if nil ~= selfPlayer then
          local classType = selfPlayer:getClassType()
          _selectReward[idx]._isEquipable = selectReward:isEquipable(classType)
        end
      elseif __eRewardIntimacy == selectReward._type then
        _selectReward[idx]._character = selectReward:getIntimacyCharacter()
        _selectReward[idx]._value = selectReward._intimacyValue
      end
    end
  end
  local _selectRewardCount = #_selectReward
  for ii = 0, self._maxSelectSlotCount - 1 do
    if ii < _selectRewardCount then
      self:setChallengeRewardShow(self._listSelectRewardSlots[uiIdx][ii], _selectReward[ii + 1], uiIdx, ii, "sub")
      self._uiButtonSelectRewardSlots[uiIdx][ii]:SetShow(true)
      if 5 == self._currentCategoryType then
        self._listSelectRewardSlots[uiIdx][ii].icon:addInputEvent("Mouse_LUp", "ChallengeSelectReward_Set_Renew( " .. challengeIdx .. ", " .. uiIdx .. ", " .. ii .. " )")
        self._listSelectRewardSlots[uiIdx][ii].icon:SetColor(Defines.Color.C_70FFFFFF)
      end
    else
      self._uiButtonSelectRewardSlots[uiIdx][ii]:SetShow(false)
    end
  end
end
function ChallengeSelectReward_Set_Renew(challenge_Idx, uiIdx, slot_Idx)
  local self = CharacterChallengeInfo
  self._selectedReward_ChallengeIndex = challenge_Idx
  self._selectedReward_SlotIndex = slot_Idx
  local progressLength = ToClient_GetChallengeRewardInfoCount()
  for ui_idx = 0, progressLength - 1 do
    for idx = 0, self._maxSelectSlotCount - 1 do
      self._listSelectRewardSlots[ui_idx][idx].icon:SetColor(Defines.Color.C_70FFFFFF)
    end
  end
  self._listSelectRewardSlots[uiIdx][slot_Idx].icon:SetColor(Defines.Color.C_FFFFFFFF)
  local challengeWrapper = ToClient_GetChallengeRewardInfoWrapper(challenge_Idx)
  local selectRewardCount = challengeWrapper:getSelectRewardCount()
  if 0 == selectRewardCount then
    self._selectedReward_SlotIndex = 0
  end
end
function HandleClicked_Reward_Show_Renew(challenge_Idx, selectIndex)
  local self = CharacterChallengeInfo
  local selectedRewardSlotIndex = self._selectedReward_SlotIndex
  local challengeWrapper = ToClient_GetChallengeRewardInfoWrapper(challenge_Idx)
  local selectRewardCount = challengeWrapper:getSelectRewardCount()
  if 0 ~= selectRewardCount and nil == selectedRewardSlotIndex then
    Proc_ShowMessage_Ack_WithOut_ChattingMessage(PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_YOUCANSELECTITEM"))
    return
  end
  if nil == challengeWrapper then
    Proc_ShowMessage_Ack_WithOut_ChattingMessage(PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_WRONGINFOCHALLENGE"))
    return
  end
  if 0 ~= selectRewardCount and selectedRewardSlotIndex > selectRewardCount - 1 then
    Proc_ShowMessage_Ack_WithOut_ChattingMessage(PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_WRONGSELECTVALUE"))
    return
  end
  if self._selectedReward_ChallengeIndex ~= challenge_Idx and 0 ~= selectRewardCount then
    Proc_ShowMessage_Ack_WithOut_ChattingMessage(PAGetString(Defines.StringSheet_GAME, "LUA_CHALLENGE_WRONGSELECTVALUE"))
    return
  end
  if 0 == selectRewardCount or nil == selectedRewardSlotIndex then
    selectedRewardSlotIndex = selectRewardCount
  end
  local challengeKey = challengeWrapper:getKey()
  ToClient_AcceptReward_ButtonClicked(challengeKey, selectedRewardSlotIndex)
end
function CharacterChallengeInfo:setChallengeRewardShow(uiSlot, reward, uiIdx, index, questType)
  uiSlot._type = reward._type
  if __eRewardExp == reward._type then
    uiSlot.count:SetText("")
    uiSlot.icon:ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/EXP.dds")
    uiSlot.icon:addInputEvent("Mouse_On", "ChallengeRewardTooltip_Renew( \"Exp\", true, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
    uiSlot.icon:addInputEvent("Mouse_Out", "ChallengeRewardTooltip_Renew( \"Exp\", false, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
    uiSlot.icon:setTooltipEventRegistFunc("ChallengeRewardTooltip_Renew( \"Exp\", true, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
  elseif __eRewardSkillExp == reward._type then
    uiSlot.count:SetText("")
    uiSlot.icon:ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/SkillExp.dds")
    uiSlot.icon:addInputEvent("Mouse_On", "ChallengeRewardTooltip_Renew( \"SkillExp\", true, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
    uiSlot.icon:addInputEvent("Mouse_Out", "ChallengeRewardTooltip_Renew( \"SkillExp\", false, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
    uiSlot.icon:setTooltipEventRegistFunc("ChallengeRewardTooltip_Renew( \"SkillExp\", true, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
  elseif __eRewardLifeExp == reward._type then
    uiSlot.count:SetText("")
    uiSlot.icon:ChangeTextureInfoName("Icon/New_Icon/03_ETC/12_DoApplyDirectlyItem/EXP.dds")
    uiSlot.icon:addInputEvent("Mouse_On", "ChallengeRewardTooltip_Renew( \"ProductExp\", true, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
    uiSlot.icon:addInputEvent("Mouse_Out", "ChallengeRewardTooltip_Renew( \"ProductExp\", false, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
    uiSlot.icon:setTooltipEventRegistFunc("ChallengeRewardTooltip_Renew( \"ProductExp\", true, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
  elseif __eRewardItem == reward._type then
    local itemStatic = getItemEnchantStaticStatus(ItemEnchantKey(reward._item))
    uiSlot:setItemByStaticStatus(itemStatic, reward._count)
    uiSlot._item = reward._item
    if "main" == questType then
      uiSlot.icon:addInputEvent("Mouse_On", "Challenge_RewardItemTooltipShow_Renew( true, " .. uiIdx .. ", " .. index .. ", \"" .. questType .. "\" )")
      uiSlot.icon:addInputEvent("Mouse_Out", "Challenge_RewardItemTooltipShow_Renew( false, " .. uiIdx .. ", " .. index .. ", \"" .. questType .. "\" )")
      uiSlot.icon:setTooltipEventRegistFunc("Challenge_RewardItemTooltipShow_Renew( true, " .. uiIdx .. ", " .. index .. ", \"" .. questType .. "\" )")
    else
      uiSlot.icon:addInputEvent("Mouse_On", "Challenge_RewardItemTooltipShow_Renew( true, " .. uiIdx .. ", " .. index .. ", \"" .. questType .. "\" )")
      uiSlot.icon:addInputEvent("Mouse_Out", "Challenge_RewardItemTooltipShow_Renew( false, " .. uiIdx .. ", " .. index .. ", \"" .. questType .. "\" )")
      uiSlot.icon:setTooltipEventRegistFunc("Challenge_RewardItemTooltipShow_Renew( true, " .. uiIdx .. ", " .. index .. ", \"" .. questType .. "\" )")
    end
    return reward._isEquipable
  elseif __eRewardIntimacy == reward._type then
    uiSlot.count:SetText(tostring(reward._value))
    uiSlot.icon:ChangeTextureInfoName("Icon/New_Icon/00000000_Special_Contributiveness.dds")
    uiSlot.icon:addInputEvent("Mouse_On", "ChallengeRewardTooltip_Renew( \"Intimacy\", true, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
    uiSlot.icon:addInputEvent("Mouse_Out", "ChallengeRewardTooltip_Renew( \"Intimacy\", false, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
    uiSlot.icon:setTooltipEventRegistFunc("ChallengeRewardTooltip_Renew( \"Intimacy\", true, \"" .. questType .. "\", " .. index .. ", " .. uiIdx .. " )")
  else
    uiSlot.icon:addInputEvent("Mouse_On", "")
    uiSlot.icon:addInputEvent("Mouse_Out", "")
  end
  return false
end
function ChallengeRewardTooltip_Renew(type, show, questtype, index, uiIdx)
  local self = CharacterChallengeInfo
  if true == show then
    if "Exp" == type then
      expTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_EXP"))
    elseif "SkillExp" == type then
      expTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_SKILLEXP"))
    elseif "ProductExp" == type then
      expTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_PRODUCTEXP"))
    elseif "Intimacy" == type then
      expTooltip:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_QUESTREWARD_SIMPLE_TOOLTIP_INTIMACY"))
    end
    if "main" == questtype then
      expTooltip:SetPosX(self._uiBackBaseReward[uiIdx][index]:GetPosX() - expTooltip:GetSizeX() / 2)
      expTooltip:SetPosY(self._uiBackBaseReward[uiIdx][index]:GetPosY() - expTooltip:GetSizeY() - 10)
    else
      expTooltip:SetPosX(self._uiButtonSelectRewardSlots[uiIdx][index]:GetPosX() - expTooltip:GetSizeX() / 2)
      expTooltip:SetPosY(self._uiButtonSelectRewardSlots[uiIdx][index]:GetPosY() - expTooltip:GetSizeY())
    end
    registTooltipControl(expTooltip, Panel_CheckedQuest)
    expTooltip:SetShow(true)
  else
    expTooltip:SetShow(false)
  end
end
function Challenge_RewardItemTooltipShow_Renew(isShow, uiIdx, slotNo, rewardType)
  local self = CharacterChallengeInfo
  local passTooltipType, uiSlot
  if "main" == rewardType then
    passTooltipType = "Dialog_ChallengeReward_Base"
    uiSlot = self._listBaseRewardSlots[uiIdx][slotNo]
  else
    passTooltipType = "Dialog_ChallengeReward_Select"
    uiSlot = self._listSelectRewardSlots[uiIdx][slotNo]
  end
  Panel_Tooltip_Item_SetPosition(slotNo, uiSlot, passTooltipType)
  if true == isShow then
    Panel_Tooltip_Item_Show_GeneralStatic(slotNo, passTooltipType, true)
  elseif false == isShow then
    Panel_Tooltip_Item_hideTooltip()
  end
end
function InputMLUp_CharacterChallengeInfo_TapToOpen(index)
  local self = CharacterChallengeInfo
  self:updateData(index)
end
function PaGlobalFunc_CharacterChallengeInfo_UpdateData()
  if nil == CharacterChallengeInfo then
    return
  end
  local self = CharacterChallengeInfo
  self:updateData(self._currentCategoryType)
end
function CharacterChallengeInfo:registEvent()
  registerEvent("FromClient_ChallengeReward_UpdateText", "PaGlobalFunc_CharacterChallengeInfo_UpdateData")
end
function FromClient_luaLoadComplete_Panel_Window_Character_ChallengeInfo()
  local self = CharacterChallengeInfo
  self:init()
  self.defaultFrameBG_CharacterInfo_Challenge = UI.getChildControl(_mainPanel, "Static_ChallengeInfoBg")
  self.defaultFrameBG_CharacterInfo_Challenge:SetShow(false)
  self.defaultFrameBG_CharacterInfo_Challenge:MoveChilds(self.defaultFrameBG_CharacterInfo_Challenge:GetID(), _panel)
  deletePanel(_panel:GetID())
  self:registEvent()
  self:updateData(0)
end
function PaGlobalFunc_CharacterChallengeInfo_ShowRightNextTab()
  local self = CharacterChallengeInfo
  self:ShowNextTab(false)
end
function PaGlobalFunc_CharacterChallengeInfo_ShowLeftNextTab()
  local self = CharacterChallengeInfo
  self:ShowNextTab(true)
end
function CharacterChallengeInfo:ShowNextTab(isLeft)
  if true == isLeft then
    if 0 < self._currentCategoryType then
      self._currentCategoryType = self._currentCategoryType - 1
      self:updateData(self._currentCategoryType)
    end
  elseif self._currentCategoryType < self._maxCategoryType - 1 then
    self._currentCategoryType = self._currentCategoryType + 1
    self:updateData(self._currentCategoryType)
  end
end
function PaGlobalFunc_CharacterChallengeInfoTab_PadControl(index)
  self = CharacterChallengeInfo
  if 0 == index then
    self:ShowNextTab(true)
  else
    self:ShowNextTab(false)
  end
end
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_Panel_Window_Character_ChallengeInfo")
