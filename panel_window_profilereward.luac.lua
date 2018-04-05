-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\profile\panel_window_profilereward.luac 

-- params : ...
-- function num : 0
Panel_Window_Profile:SetShow(false)
local ProfileReward = {
_control = {_topBg = (UI.getChildControl)(Panel_Window_Profile, "Static_TopBg"), _list2Profile = (UI.getChildControl)(Panel_Window_Profile, "List2_LeftContent"), _rightDescBg = (UI.getChildControl)(Panel_Window_Profile, "Static_RightDescBg"), _slotBG = nil}
, _radioBtnIndex = 0, _selecteIndex = 0, _termDesc = PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_DAY"), 
_string = {[(CppEnums.ProfileIndex).eUserProfileValueType_MonsterKillCount] = PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_TITLE_1"), [(CppEnums.ProfileIndex).eUserProfileValueType_FishingSuccessCount] = PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_TITLE_2"), [(CppEnums.ProfileIndex).eUserProfileValueType_ItemGainCount] = PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_TITLE_3"), [(CppEnums.ProfileIndex).eUserProfileValueType_ProductSuccessCount] = PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_TITLE_4"), [(CppEnums.ProfileIndex).eUserProfileValueType_Count] = 4}
, 
_rewardKey = {[(CppEnums.ProfileIndex).eUserProfileValueType_MonsterKillCount] = -1, [(CppEnums.ProfileIndex).eUserProfileValueType_FishingSuccessCount] = -1, [(CppEnums.ProfileIndex).eUserProfileValueType_ItemGainCount] = -1, [(CppEnums.ProfileIndex).eUserProfileValueType_ProductSuccessCount] = -1, [(CppEnums.ProfileIndex).eUserProfileValueType_Count] = 4}
, 
_rewardIndex = {[(CppEnums.ProfileIndex).eUserProfileValueType_MonsterKillCount] = -1, [(CppEnums.ProfileIndex).eUserProfileValueType_FishingSuccessCount] = -1, [(CppEnums.ProfileIndex).eUserProfileValueType_ItemGainCount] = -1, [(CppEnums.ProfileIndex).eUserProfileValueType_ProductSuccessCount] = -1, [(CppEnums.ProfileIndex).eUserProfileValueType_Count] = 4}
, 
_desc = {[(CppEnums.ProfileIndex).eUserProfileValueType_MonsterKillCount] = PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_DESC_1"), [(CppEnums.ProfileIndex).eUserProfileValueType_FishingSuccessCount] = PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_DESC_2"), [(CppEnums.ProfileIndex).eUserProfileValueType_ItemGainCount] = PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_DESC_3"), [(CppEnums.ProfileIndex).eUserProfileValueType_ProductSuccessCount] = PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_DESC_4")}
, _iconPath = "New_UI_Common_forLua/Window/CharacterInfo/my_info_achievement_00.dds", 
_iconCoordinate = {
[(CppEnums.ProfileIndex).eUserProfileValueType_MonsterKillCount] = {x1 = 72, y1 = 109, x2 = 142, y2 = 179}
, 
[(CppEnums.ProfileIndex).eUserProfileValueType_FishingSuccessCount] = {x1 = 1, y1 = 180, x2 = 71, y2 = 250}
, 
[(CppEnums.ProfileIndex).eUserProfileValueType_ItemGainCount] = {x1 = 72, y1 = 180, x2 = 142, y2 = 250}
, 
[(CppEnums.ProfileIndex).eUserProfileValueType_ProductSuccessCount] = {x1 = 1, y1 = 109, x2 = 71, y2 = 179}
}
, 
slotConfig = {createIcon = true, createBorder = true, createCount = true, createEnchant = true, createCash = true}
, 
_rewardSlot = {}
, 
_rewardSlotBG = {}
, _isOpenAble = true, _periodType = 0}
local RewardSlotCount = 4
local isShowProfileRewardPanel = false
FGlobal_ProfileReward_PeriodUpdate = function(period)
  -- function num : 0_0 , upvalues : ProfileReward
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  ProfileReward._periodType = period
  FGlobal_ProfileReward_AllUpdate()
  ProfileReward_RightDataSet(0)
end

ProfileReward.Init = function(self)
  -- function num : 0_1 , upvalues : RewardSlotCount
  local control = self._control
  control._playTime = (UI.getChildControl)(control._topBg, "StaticText_PlayTime")
  control._pcRoolTime = (UI.getChildControl)(control._topBg, "StaticText_PcRoomTime")
  control._circleBg = (UI.getChildControl)(control._rightDescBg, "Static_CircleBg")
  control._icon = (UI.getChildControl)(control._circleBg, "Static_Icon")
  control._name = (UI.getChildControl)(control._rightDescBg, "StaticText_Name")
  control._period = (UI.getChildControl)(control._rightDescBg, "StaticText_Period")
  control._desc = (UI.getChildControl)(control._rightDescBg, "StaticText_Desc")
  control._rewardText = (UI.getChildControl)(control._rightDescBg, "StaticText_RewardText")
  control._nextrewardText = (UI.getChildControl)(control._rightDescBg, "StaticText_NextRewardText")
  ;
  (control._period):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  (control._desc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  control._slotBG = (UI.getChildControl)(control._rightDescBg, "Static_RewardsBG")
  local radiobutton = (UI.getChildControl)(Panel_Window_Profile, "RadioButton_Daily")
  radiobutton:addInputEvent("Mouse_LUp", "FGlobal_ProfileReward_PeriodUpdate(" .. 1 .. ")")
  radiobutton:SetCheck(true)
  radiobutton = (UI.getChildControl)(Panel_Window_Profile, "RadioButton_Weekly")
  radiobutton:addInputEvent("Mouse_LUp", "FGlobal_ProfileReward_PeriodUpdate(" .. 7 .. ")")
  radiobutton = (UI.getChildControl)(Panel_Window_Profile, "RadioButton_Monthly")
  radiobutton:addInputEvent("Mouse_LUp", "FGlobal_ProfileReward_PeriodUpdate(" .. 30 .. ")")
  radiobutton = (UI.getChildControl)(Panel_Window_Profile, "RadioButton_SumAll")
  radiobutton:addInputEvent("Mouse_LUp", "FGlobal_ProfileReward_PeriodUpdate(" .. 0 .. ")")
  for index = 0, RewardSlotCount - 1 do
    -- DECOMPILER ERROR at PC142: Confused about usage of register: R7 in 'UnsetPending'

    (self._rewardSlotBG)[index] = (UI.getChildControl)(control._slotBG, "Static_RewardItemSlotBg_" .. tostring(index))
    ;
    ((self._rewardSlotBG)[index]):SetShow(true)
    local createSlot = {}
    ;
    (SlotItem.new)(createSlot, "Reward_SlotItem" .. tostring(index), 0, (self._rewardSlotBG)[index], self.slotConfig)
    createSlot:createChild()
    ;
    (createSlot.icon):SetShow(true)
    -- DECOMPILER ERROR at PC169: Confused about usage of register: R8 in 'UnsetPending'

    ;
    (self._rewardSlot)[index] = createSlot
  end
  self._isOpenAble = true
  self._periodType = 1
end

FGlobal_ProfileReward_Update = function(tabBtnInit)
  -- function num : 0_2 , upvalues : ProfileReward
  local self = ProfileReward
  self._selecteIndex = 0
  if not tabBtnInit then
    self._radioBtnIndex = 0
    self:RadioBtn_Init()
  end
  ProfileReward_RightDataSet(self._selecteIndex)
  ToClient_RequestUserProfileInfo()
end

FromClient_ProfileRewardUpdate = function()
  -- function num : 0_3 , upvalues : ProfileReward
  local self = ProfileReward
  local index = self._selecteIndex
  FGlobal_ProfileReward_AllUpdate()
  ProfileReward_RightDataSet(index)
end

ProfileReward.RadioBtn_Init = function(self)
  -- function num : 0_4
  for index = 0, (CppEnums.ProfileInitTermType).eProfileInitTermType_Maxcount - 1 do
    (((self._control)._radioBtn)[index]):SetCheck(self._radioBtnIndex == index)
  end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

FGlobal_ProfileReward_AllUpdate = function()
  -- function num : 0_5 , upvalues : ProfileReward
  local self = ProfileReward
  local control = self._control
  ;
  ((control._list2Profile):getElementManager()):clearKey()
  for index = 0, (CppEnums.ProfileIndex).eUserProfileValueType_Count - 1 do
    ((control._list2Profile):getElementManager()):pushKey(toInt64(0, index))
  end
end

HandleClicked_RadioButton = function(index)
  -- function num : 0_6 , upvalues : ProfileReward
  local self = ProfileReward
  self._radioBtnIndex = index
  FGlobal_ProfileReward_Update(true)
end

ProfileReward_DataSet = function(content, key)
  -- function num : 0_7 , upvalues : ProfileReward
  local self = ProfileReward
  local contentBg = (UI.getChildControl)(content, "RadioButton_ContentBg")
  local title = (UI.getChildControl)(content, "StaticText_Title")
  local count = (UI.getChildControl)(content, "StaticText_Count")
  local type_ = Int64toInt32(key)
  local countProfileInfo = ToClient_GetProfileInfo(self._periodType, type_)
  if countProfileInfo == -1 then
    title:SetText(" ")
    count:SetText(" ")
    return 
  end
  local countText = " "
  contentBg:addInputEvent("Mouse_LUp", "ProfileReward_RightDataSet(" .. type_ .. ")")
  if (CppEnums.ProfileIndex).eUserProfileValueType_MonsterKillCount == type_ then
    countText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_MONSTERCOUNT", "count", makeDotMoney(countProfileInfo))
  else
    if (CppEnums.ProfileIndex).eUserProfileValueType_FishingSuccessCount == type_ then
      countText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_ITEMCOUNT", "count", makeDotMoney(countProfileInfo))
    else
      if (CppEnums.ProfileIndex).eUserProfileValueType_ItemGainCount == type_ then
        countText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_ITEMCOUNT", "count", makeDotMoney(countProfileInfo))
      else
        if (CppEnums.ProfileIndex).eUserProfileValueType_ProductSuccessCount == type_ then
          countText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_WEIGHT", "count", (string.format)("%.2f", Int64toInt32(countProfileInfo) / 10000))
        else
          countText = makeDotMoney(countProfileInfo)
        end
      end
    end
  end
  title:SetText((self._string)[type_])
  count:SetText(countText)
  ProfileReward_TimeSet()
  if self._selecteIndex == type_ then
    contentBg:SetCheck(true)
  else
    contentBg:SetCheck(false)
  end
end

FGlobal_ProfileReward_ApplyGetReward = function(type, index)
  -- function num : 0_8 , upvalues : ProfileReward
  ToClient_sendApplyGetProfileReward((ProfileReward._rewardKey)[type], index)
end

ProfileReward_TimeSet = function()
  -- function num : 0_9 , upvalues : ProfileReward
  local self = ProfileReward
  local control = self._control
  local temporaryPCRoomWrapper = getTemporaryInformationWrapper()
  local isPremiumPcRoom = temporaryPCRoomWrapper:isPremiumPcRoom()
  local userPlayTime = ((Util.Time).timeFormatting)(Int64toInt32(ToClient_GetUserPlayTimePerDay()))
  local totalPlayTime = ((Util.Time).timeFormatting_Minute)(Int64toInt32(ToClient_GetCharacterPlayTime()))
  ;
  (control._playTime):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_TODAYPLAYTIME") .. "<PAColor0xFFFFC730>" .. tostring(userPlayTime) .. "<PAOldColor> | " .. PAGetString(Defines.StringSheet_GAME, "LUA_CONTRACT_TIME_BLACKSPIRIT") .. "<PAColor0xFFFFC730> " .. totalPlayTime .. "<PAOldColor> ")
  if isPremiumPcRoom and (isGameTypeKorea() or isGameTypeJapan()) then
    (control._playTime):SetPosY(5)
    ;
    (control._pcRoolTime):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_PCROOMPLAYTIME") .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_PCROOMTIME", "getPcRoomPlayTime", convertStringFromDatetime(ToClient_GetPcRoomPlayTime())))
    ;
    (control._pcRoolTime):SetShow(true)
  else
    ;
    (control._playTime):SetPosY(20)
    ;
    (control._pcRoolTime):SetShow(false)
  end
end

FGlobal_ProfileReward_GetTermText = function(period)
  -- function num : 0_10
  if period == 1 then
    return PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_DAY")
  else
    if period == 7 then
      return PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_WEEK")
    end
  end
  return PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_MONTH")
end

ProfileReward_RightDataSet = function(index)
  -- function num : 0_11 , upvalues : ProfileReward, RewardSlotCount
  local self = ProfileReward
  local control = self._control
  self._selecteIndex = index
  ;
  (control._icon):ChangeTextureInfoName(self._iconPath)
  local x1, y1, x2, y2 = setTextureUV_Func(control._icon, ((self._iconCoordinate)[index]).x1, ((self._iconCoordinate)[index]).y1, ((self._iconCoordinate)[index]).x2, ((self._iconCoordinate)[index]).y2)
  ;
  ((control._icon):getBaseTexture()):setUV(x1, y1, x2, y2)
  ;
  (control._icon):setRenderTexture((control._icon):getBaseTexture())
  ;
  (control._name):SetText((self._string)[index])
  ;
  (control._period):SetText(FGlobal_ProfileReward_GetTermText(self._periodType))
  ;
  (control._desc):SetText((self._desc)[index])
  -- DECOMPILER ERROR at PC55: Confused about usage of register: R7 in 'UnsetPending'

  ;
  (ProfileReward._rewardKey)[index] = 0
  local profilerewardwrapper = ToClient_getProfileRewardItem(self._periodType, index)
  if profilerewardwrapper ~= nil then
    local isIgnore = profilerewardwrapper:getUserProfileRewardFlag()
    -- DECOMPILER ERROR at PC68: Confused about usage of register: R9 in 'UnsetPending'

    ;
    (ProfileReward._rewardKey)[index] = profilerewardwrapper:getUserProfileRewardKey()
    for arrindex = 0, RewardSlotCount - 1 do
      local itemStatic = getItemEnchantStaticStatus(profilerewardwrapper:getUserProfileRewardItemkey(arrindex))
      local rewardkey = 0
      if itemStatic ~= nil then
        ((ProfileReward._rewardSlotBG)[arrindex]):SetShow(true)
        ;
        (((ProfileReward._rewardSlot)[arrindex]).icon):SetShow(true)
        ;
        (((ProfileReward._rewardSlot)[arrindex]).icon):SetIgnore(isIgnore == true)
        ;
        (((ProfileReward._rewardSlot)[arrindex]).icon):addInputEvent("Mouse_LUp", "FGlobal_ProfileReward_ApplyGetReward(" .. index .. "," .. arrindex .. ")")
        ;
        ((ProfileReward._rewardSlot)[arrindex]):setItemByStaticStatus(itemStatic, profilerewardwrapper:getUserProfileRewardItemCount(arrindex))
      else
        (((ProfileReward._rewardSlot)[arrindex]).icon):SetShow(false)
        ;
        ((ProfileReward._rewardSlotBG)[arrindex]):SetShow(false)
      end
    end
  end
  -- DECOMPILER ERROR: 4 unprocessed JMP targets
end

ProfileReward.registEvent = function(self)
  -- function num : 0_12
  registerEvent("ProfileReward_Updatelist", "FGlobal_ProfileReward_AllUpdate")
  ;
  ((self._control)._list2Profile):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "ProfileReward_DataSet")
  ;
  ((self._control)._list2Profile):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
end

FromClient_ProfileRewardShow = function()
  -- function num : 0_13 , upvalues : isShowProfileRewardPanel
  ToClient_RequestUserProfileInfo()
  isShowProfileRewardPanel = true
end

FGlobal_ProfileReward_Show = function()
  -- function num : 0_14
  Panel_Window_Profile:SetShow(true)
  FGlobal_ProfileReward_AllUpdate()
  ProfileReward_RightDataSet(0)
end

FGlobal_ProfileReward_Close = function()
  -- function num : 0_15
  Panel_Window_Profile:SetShow(false)
end

FGlobal_ProfileReward_Close_InGameExit = function()
  -- function num : 0_16
  Panel_Window_Profile:SetShow(false)
  Panel_GameExit_ShowConfirmPanel()
end

FGlobal_ProfileReward_IsShow = function()
  -- function num : 0_17
  return Panel_Window_Profile:GetShow()
end

ProfileReward:Init()
ProfileReward:registEvent()
registerEvent("FromClient_luaLoadComplete", "ProfileRewardItemSet")
registerEvent("FromClient_UpdateProfileRewardInfo", "ProfileReward_RightDataSet")
registerEvent("FromClient_ProfileRewardUpdate", "FromClient_ProfileRewardUpdate")
registerEvent("FromClient_ProfileRewardShow", "FromClient_ProfileRewardShow")
registerEvent("Profile_Updatelist", "FromClient_ProfileRewardUpdate")

