-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\profile\panel_window_profilereward.luac 

-- params : ...
-- function num : 0
Panel_Window_ProfileReward:SetShow(false)
local ProfileReward = {
_control = {_topBg = (UI.getChildControl)(Panel_Window_ProfileReward, "Static_TopBg"), _list2Profile = (UI.getChildControl)(Panel_Window_ProfileReward, "List2_LeftContent"), _rightDescBg = (UI.getChildControl)(Panel_Window_ProfileReward, "Static_RightDescBg"), _slotBG = nil}
, _radioBtnIndex = 0, _selecteIndex = 0, _termDesc = PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_DAY"), 
_string = {[(CppEnums.ProfileIndex).eUserProfileValueType_MonsterKillCount] = PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_TITLE_1"), [(CppEnums.ProfileIndex).eUserProfileValueType_FishingSuccessCount] = PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_TITLE_2"), [(CppEnums.ProfileIndex).eUserProfileValueType_ItemGainCount] = PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_TITLE_3"), [(CppEnums.ProfileIndex).eUserProfileValueType_ProductSuccessCount] = PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_TITLE_4"), [(CppEnums.ProfileIndex).eUserProfileValueType_Count] = 4}
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
, _rewardSlot = nil}
ProfileReward.Init = function(self)
  -- function num : 0_0
  local control = self._control
  control._playTime = (UI.getChildControl)(control._topBg, "StaticText_PlayTime")
  control._pcRoolTime = (UI.getChildControl)(control._topBg, "StaticText_PcRoomTime")
  control._circleBg = (UI.getChildControl)(control._rightDescBg, "Static_CircleBg")
  control._icon = (UI.getChildControl)(control._circleBg, "Static_Icon")
  control._name = (UI.getChildControl)(control._rightDescBg, "StaticText_Name")
  control._period = (UI.getChildControl)(control._rightDescBg, "StaticText_Period")
  control._desc = (UI.getChildControl)(control._rightDescBg, "StaticText_Desc")
  ;
  (control._period):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  (control._desc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  control._slotBG = (UI.getChildControl)(control._rightDescBg, "Reward_SlotBG")
  local createSlot = {}
  ;
  (SlotItem.new)(createSlot, "Reward_SlotItem", 0, control._slotBG, self.slotConfig)
  createSlot:createChild()
  ;
  (createSlot.icon):SetPosX(4)
  ;
  (createSlot.icon):SetPosY(1)
  ;
  (createSlot.icon):SetShow(true)
  self._rewardSlot = createSlot
end

FGlobal_ProfileReward_Update = function(tabBtnInit)
  -- function num : 0_1 , upvalues : ProfileReward
  local self = ProfileReward
  self._selecteIndex = 0
  if not tabBtnInit then
    self._radioBtnIndex = 0
    self:RadioBtn_Init()
  end
  ProfileReward_RightDataSet(self._selecteIndex)
  ToClient_RequestUserProfileInfo()
  ProfileReward_SetConsolePadGroup()
end

ProfileReward_SetConsolePadGroup = function()
  -- function num : 0_2
end

ProfileReward.RadioBtn_Init = function(self)
  -- function num : 0_3
  for index = 0, (CppEnums.ProfileInitTermType).eProfileInitTermType_Maxcount - 1 do
    (((self._control)._radioBtn)[index]):SetCheck(self._radioBtnIndex == index)
  end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

ProfileReward_Update = function()
  -- function num : 0_4 , upvalues : ProfileReward
  local self = ProfileReward
  local control = self._control
  ;
  ((control._list2Profile):getElementManager()):clearKey()
  for index = 0, (CppEnums.ProfileIndex).eUserProfileValueType_Count - 1 do
    ((control._list2Profile):getElementManager()):pushKey(toInt64(0, index))
  end
end

HandleClicked_RadioButton = function(index)
  -- function num : 0_5 , upvalues : ProfileReward
  local self = ProfileReward
  self._radioBtnIndex = index
  FGlobal_ProfileReward_Update(true)
end

ProfileReward_DataSet = function(content, key)
  -- function num : 0_6 , upvalues : ProfileReward
  local self = ProfileReward
  local contentBg = (UI.getChildControl)(content, "RadioButton_ContentBg")
  local title = (UI.getChildControl)(content, "StaticText_Title")
  local count = (UI.getChildControl)(content, "StaticText_Count")
  local _key = Int64toInt32(key)
  local _count = ToClient_GetProfileInfo(0, _key)
  contentBg:addInputEvent("Mouse_LUp", "ProfileReward_RightDataSet(" .. _key .. ")")
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
          _count = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_WEIGHT", "count", (string.format)("%.2f", Int64toInt32(_count) / 10000))
        else
          _count = makeDotMoney(_count)
        end
      end
    end
  end
  title:SetText((self._string)[_key])
  count:SetText(_count)
  ProfileReward_TimeSet()
  if self._selecteIndex == _key then
    contentBg:SetCheck(true)
  else
    contentBg:SetCheck(false)
  end
  local itemlist_SlotBG = (UI.getChildControl)(contents, "Template_Static_SlotBG")
  itemlist_SlotBG:SetShow(false)
  local createSlot = {}
  local itemlist_Slot = (UI.getChildControl)(contents, "Template_Static_Slot")
  itemlist_Slot:SetShow(true)
  ;
  (SlotItem.reInclude)(createSlot, "Reward_SlotItem", 0, itemlist_Slot, self.slotConfig)
  ;
  (createSlot.icon):SetSize(40, 40)
  ;
  (createSlot.border):SetSize(41, 41)
  ;
  (createSlot.border):SetPosX(0)
  local itemKey = ToClient_getSavageDefenceItemkey(idx)
  local price = ToClient_getSavageDefenceItemPrice(idx)
  if itemKey ~= 0 then
    local itemStatic = getItemEnchantStaticStatus(ItemEnchantKey(itemKey))
    local itemName = itemStatic:getName()
  end
end

ProfileReward_TimeSet = function()
  -- function num : 0_7 , upvalues : ProfileReward
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

ProfileReward_RightDataSet = function(index)
  -- function num : 0_8 , upvalues : ProfileReward
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
  (control._period):SetText(self._termDesc)
  ;
  (control._desc):SetText((self._desc)[index])
end

ProfileReward.registEvent = function(self)
  -- function num : 0_9
  registerEvent("ProfileReward_Updatelist", "ProfileReward_Update")
  ;
  ((self._control)._list2Profile):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "ProfileReward_DataSet")
  ;
  ((self._control)._list2Profile):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
end

FGlobal_ProfileReward_Show = function()
  -- function num : 0_10
  ProfileReward_Update()
  Panel_Window_ProfileReward:SetShow(true)
end

ProfileRewardItemSet = function()
  -- function num : 0_11 , upvalues : ProfileReward
  ProfileReward:SetItem()
end

ProfileReward.SetItem = function(self)
  -- function num : 0_12
  local itemWrapper = getInventoryItem(3)
  ;
  (self._rewardSlot):setItem(itemWrapper)
end

ProfileReward:Init()
ProfileReward:registEvent()
registerEvent("FromClient_luaLoadComplete", "ProfileRewardItemSet")

