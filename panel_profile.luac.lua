-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\characterinfo\panel_profile.luac 

-- params : ...
-- function num : 0
Panel_Window_Profile:SetShow(false)
local myProfile = {_rewardBG; 
_control = {_topBg = (UI.getChildControl)(Panel_Window_Profile, "Static_TopBg"), _list2Profile = (UI.getChildControl)(Panel_Window_Profile, "List2_LeftContent"), _rightDescBg = (UI.getChildControl)(Panel_Window_Profile, "Static_RightDescBg"), 
_radioBtn = {[0] = (UI.getChildControl)(Panel_Window_Profile, "RadioButton_Daily"), [1] = (UI.getChildControl)(Panel_Window_Profile, "RadioButton_Weekly"), [2] = (UI.getChildControl)(Panel_Window_Profile, "RadioButton_Monthly"), [3] = (UI.getChildControl)(Panel_Window_Profile, "RadioButton_SumAll")}
}
, _radioBtnIndex = 0, _selecteIndex = 0, 
_termIndex = {[0] = 1, [1] = 7, [2] = 30, [3] = 0}
, 
_termDesc = {[0] = PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_DAY"), [1] = PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_WEEK"), [2] = PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_MONTH"), [3] = PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_TOTAL")}
, 
_string = {[(CppEnums.ProfileIndex).eUserProfileValueType_MonsterKillCount] = PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_TITLE_1"), [(CppEnums.ProfileIndex).eUserProfileValueType_FishingSuccessCount] = PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_TITLE_2"), [(CppEnums.ProfileIndex).eUserProfileValueType_ItemGainCount] = PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_TITLE_3"), [(CppEnums.ProfileIndex).eUserProfileValueType_ProductSuccessCount] = PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_TITLE_4"), [(CppEnums.ProfileIndex).eUserProfileValueType_Count] = 4}
, 
_desc = {[(CppEnums.ProfileIndex).eUserProfileValueType_MonsterKillCount] = PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_DESC_1"), [(CppEnums.ProfileIndex).eUserProfileValueType_FishingSuccessCount] = PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_DESC_2"), [(CppEnums.ProfileIndex).eUserProfileValueType_ItemGainCount] = PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_DESC_3"), [(CppEnums.ProfileIndex).eUserProfileValueType_ProductSuccessCount] = PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_DESC_4")}
, 
_rewardKey = {[(CppEnums.ProfileIndex).eUserProfileValueType_MonsterKillCount] = -1, [(CppEnums.ProfileIndex).eUserProfileValueType_FishingSuccessCount] = -1, [(CppEnums.ProfileIndex).eUserProfileValueType_ItemGainCount] = -1, [(CppEnums.ProfileIndex).eUserProfileValueType_ProductSuccessCount] = -1, [(CppEnums.ProfileIndex).eUserProfileValueType_Count] = 4}
, 
_rewardIndex = {[(CppEnums.ProfileIndex).eUserProfileValueType_MonsterKillCount] = -1, [(CppEnums.ProfileIndex).eUserProfileValueType_FishingSuccessCount] = -1, [(CppEnums.ProfileIndex).eUserProfileValueType_ItemGainCount] = -1, [(CppEnums.ProfileIndex).eUserProfileValueType_ProductSuccessCount] = -1, [(CppEnums.ProfileIndex).eUserProfileValueType_Count] = 4}
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
, _periodType = 0}
local group_2 = nil
local RewardSlotCount = 4
myProfile.Init = function(self)
  -- function num : 0_0 , upvalues : RewardSlotCount
  local control = self._control
  control._playTime = (UI.getChildControl)(control._topBg, "StaticText_PlayTime")
  control._pcRoolTime = (UI.getChildControl)(control._topBg, "StaticText_PcRoomTime")
  control._circleBg = (UI.getChildControl)(control._rightDescBg, "Static_CircleBg")
  control._icon = (UI.getChildControl)(control._circleBg, "Static_Icon")
  control._name = (UI.getChildControl)(control._rightDescBg, "StaticText_Name")
  control._period = (UI.getChildControl)(control._rightDescBg, "StaticText_Period")
  control._desc = (UI.getChildControl)(control._rightDescBg, "StaticText_Desc")
  control._slotBG = (UI.getChildControl)(control._rightDescBg, "Static_RewardsBG")
  ;
  (control._period):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  (control._desc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
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
    -- DECOMPILER ERROR at PC130: Confused about usage of register: R7 in 'UnsetPending'

    (self._rewardSlotBG)[index] = (UI.getChildControl)(control._slotBG, "Static_RewardItemSlotBg_" .. tostring(index))
    ;
    ((self._rewardSlotBG)[index]):SetShow(true)
    local createSlot = {}
    ;
    (SlotItem.new)(createSlot, "Reward_SlotItem" .. tostring(index), 0, (self._rewardSlotBG)[index], self.slotConfig)
    createSlot:createChild()
    local sizeX = (createSlot.icon):GetSizeX()
    local sizeY = (createSlot.icon):GetSizeY()
    ;
    (createSlot.icon):SetShow(true)
    ;
    (createSlot.icon):SetSize(sizeX * 0.8, sizeY * 0.8)
    -- DECOMPILER ERROR at PC168: Confused about usage of register: R10 in 'UnsetPending'

    ;
    (self._rewardSlot)[index] = createSlot
  end
  ;
  (control._slotBG):SetShow(false)
  self._periodType = 1
end

FGlobal_ProfileReward_ApplyGetReward = function(index)
  -- function num : 0_1 , upvalues : myProfile
  _PA_LOG("오명�\128", tostring(index) .. tostring((myProfile._rewardKey)[index]))
  ToClient_sendApplyGetProfileReward((myProfile._rewardKey)[index])
end

FGlobal_ProfileReward_PeriodUpdate = function(period)
  -- function num : 0_2 , upvalues : myProfile
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  myProfile._periodType = period
  FGlobal_ProfileReward_AllUpdate()
  ProfileReward_RightDataSet(0)
end

FGlobal_Profile_Update = function(tabBtnInit)
  -- function num : 0_3 , upvalues : myProfile
  local self = myProfile
  self._selecteIndex = 0
  if not tabBtnInit then
    self._radioBtnIndex = 0
    self:RadioBtn_Init()
  end
  Profile_RightDataSet(self._selecteIndex)
  ToClient_RequestUserProfileInfo()
end

myProfile.RadioBtn_Init = function(self)
  -- function num : 0_4
  for index = 0, (CppEnums.ProfileInitTermType).eProfileInitTermType_Maxcount - 1 do
    (((self._control)._radioBtn)[index]):SetCheck(self._radioBtnIndex == index)
  end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

Profile_Update = function()
  -- function num : 0_5 , upvalues : myProfile
  local self = myProfile
  local control = self._control
  ;
  ((control._list2Profile):getElementManager()):clearKey()
  for index = 0, (CppEnums.ProfileIndex).eUserProfileValueType_Count - 1 do
    ((control._list2Profile):getElementManager()):pushKey(toInt64(0, index))
  end
end

HandleClicked_RadioButton = function(index)
  -- function num : 0_6 , upvalues : myProfile
  local self = myProfile
  self._radioBtnIndex = index
  FGlobal_Profile_Update(true)
end

Profile_DataSet = function(content, key)
  -- function num : 0_7 , upvalues : myProfile
  local self = myProfile
  local contentBg = (UI.getChildControl)(content, "RadioButton_ContentBg")
  local title = (UI.getChildControl)(content, "StaticText_Title")
  local count = (UI.getChildControl)(content, "StaticText_Count")
  local _key = Int64toInt32(key)
  local _count = ToClient_GetProfileInfo((self._termIndex)[self._radioBtnIndex], _key)
  contentBg:addInputEvent("Mouse_LUp", "Profile_RightDataSet(" .. _key .. ")")
  if (CppEnums.ProfileIndex).eUserProfileValueType_MonsterKillCount == _key then
    _count = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_MONSTERCOUNT", "count", makeDotMoney(_count))
  else
    if (CppEnums.ProfileIndex).eUserProfileValueType_FishingSuccessCount == _key then
      _count = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_ITEMCOUNT", "count", makeDotMoney(_count))
    else
      if (CppEnums.ProfileIndex).eUserProfileValueType_ItemGainCount == _key then
        _count = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_ITEMCOUNT", "count", makeDotMoney(_count))
      else
        if (CppEnums.ProfileIndex).eUserProfileValueType_ProductSuccessCount == _key then
          _count = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_WEIGHT", "count", makeWeightString(_count))
        else
          _count = makeDotMoney(_count)
        end
      end
    end
  end
  title:SetText((self._string)[_key])
  count:SetText(_count)
  Profile_TimeSet()
  if self._selecteIndex == _key then
    contentBg:SetCheck(true)
  else
    contentBg:SetCheck(false)
  end
end

Profile_TimeSet = function()
  -- function num : 0_8 , upvalues : myProfile
  local self = myProfile
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

Profile_RightDataSet = function(index)
  -- function num : 0_9 , upvalues : myProfile, RewardSlotCount
  local self = myProfile
  local control = self._control
  self._selecteIndex = index
  ;
  (control._icon):ChangeTextureInfoName(self._iconPath)
  do
    local x1, y1, x2, y2 = setTextureUV_Func(control._icon, ((self._iconCoordinate)[index]).x1, ((self._iconCoordinate)[index]).y1, ((self._iconCoordinate)[index]).x2, ((self._iconCoordinate)[index]).y2)
    ;
    ((control._icon):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    (control._icon):setRenderTexture((control._icon):getBaseTexture())
    ;
    (control._name):SetText((self._string)[index])
    ;
    (control._period):SetText((self._termDesc)[self._radioBtnIndex])
    ;
    (control._desc):SetText((self._desc)[index])
    if ToClient_IsDevelopment() then
      (control._slotBG):SetShow(true)
      local profilerewardwrapper = ToClient_getProfileRewardItem(self._periodType, index)
      if profilerewardwrapper ~= nil then
        local userProfileValue = profilerewardwrapper:getUserProfileValue()
        local userProfileRewardFlag = profilerewardwrapper:getRewardFlag()
        for arrindex = 0, RewardSlotCount - 1 do
          local itemStatic = getItemEnchantStaticStatus(profilerewardwrapper:getUserProfileRewardItemkey(arrindex))
          local rewardkey = 0
          if itemStatic ~= nil then
            ((myProfile._rewardSlotBG)[arrindex]):SetShow(true)
            ;
            (((myProfile._rewardSlot)[arrindex]).icon):SetShow(true)
            if userProfileRewardFlag == true then
              (((myProfile._rewardSlot)[arrindex]).icon):SetIgnore(true)
            else
              ;
              (((myProfile._rewardSlot)[arrindex]).icon):SetIgnore(userProfileValue < profilerewardwrapper:getUserProfileRewardGoal(arrindex))
            end
            -- DECOMPILER ERROR at PC125: Confused about usage of register: R16 in 'UnsetPending'

            ;
            (myProfile._rewardKey)[arrindex] = profilerewardwrapper:getUserProfileRewardKey(arrindex)
            local keyindex = arrindex
            ;
            (((myProfile._rewardSlot)[arrindex]).icon):addInputEvent("Mouse_LUp", "FGlobal_ProfileReward_ApplyGetReward(" .. keyindex .. ")")
            ;
            ((myProfile._rewardSlot)[arrindex]):setItemByStaticStatus(itemStatic, profilerewardwrapper:getUserProfileRewardItemCount(arrindex))
          else
            -- DECOMPILER ERROR at PC150: Confused about usage of register: R16 in 'UnsetPending'

            (myProfile._rewardKey)[arrindex] = 0
            ;
            (((myProfile._rewardSlot)[arrindex]).icon):SetShow(false)
            ;
            ((myProfile._rewardSlotBG)[arrindex]):SetShow(false)
          end
        end
      end
    else
      (control._slotBG):SetShow(false)
    end
    -- DECOMPILER ERROR: 6 unprocessed JMP targets
  end
end

myProfile.registEvent = function(self)
  -- function num : 0_10
  registerEvent("Profile_Updatelist", "Profile_Update")
  for index = 0, (CppEnums.ProfileInitTermType).eProfileInitTermType_Maxcount - 1 do
    (((self._control)._radioBtn)[index]):addInputEvent("Mouse_LUp", "HandleClicked_RadioButton(" .. index .. ")")
  end
  ;
  ((self._control)._list2Profile):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "Profile_DataSet")
  ;
  ((self._control)._list2Profile):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
end

myProfile:Init()
myProfile:registEvent()

