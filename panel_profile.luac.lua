-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\characterinfo\panel_profile.luac 

-- params : ...
-- function num : 0
Panel_Window_Profile:SetShow(false)
local myProfile = {
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
}
local group_2 = nil
myProfile.Init = function(self)
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
end

FGlobal_Profile_Update = function(tabBtnInit)
  -- function num : 0_1 , upvalues : myProfile
  local self = myProfile
  self._selecteIndex = 0
  if not tabBtnInit then
    self._radioBtnIndex = 0
    self:RadioBtn_Init()
  end
  Profile_RightDataSet(self._selecteIndex)
  ToClient_RequestUserProfileInfo()
  Profile_SetConsolePadGroup()
end

Profile_SetConsolePadGroup = function()
  -- function num : 0_2 , upvalues : myProfile
  Panel_Window_CharInfo_Status:deleteConsoleUIGroup(1)
  Panel_Window_CharInfo_Status:deleteConsoleUIGroup(2)
  Panel_Window_CharInfo_Status:deleteConsoleUIGroup(3)
  Panel_Window_CharInfo_Status:deleteConsoleUIGroup(4)
  Panel_Window_CharInfo_Status:deleteConsoleUIGroup(5)
  local control = myProfile._control
  local group_1 = Panel_Window_CharInfo_Status:addConsoleUIGroup(1, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  group_1:addControl(0, 0, 4, 1, (control._radioBtn)[0])
  group_1:addControl(1, 0, 4, 1, (control._radioBtn)[1])
  group_1:addControl(2, 0, 4, 1, (control._radioBtn)[2])
  group_1:addControl(3, 0, 4, 1, (control._radioBtn)[3])
end

myProfile.RadioBtn_Init = function(self)
  -- function num : 0_3
  for index = 0, (CppEnums.ProfileInitTermType).eProfileInitTermType_Maxcount - 1 do
    (((self._control)._radioBtn)[index]):SetCheck(self._radioBtnIndex == index)
  end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

Profile_Update = function()
  -- function num : 0_4 , upvalues : myProfile, group_2
  local self = myProfile
  local control = self._control
  ;
  ((control._list2Profile):getElementManager()):clearKey()
  Panel_Window_CharInfo_Status:deleteConsoleUIGroup(2)
  group_2 = Panel_Window_CharInfo_Status:addConsoleUIGroup(2, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  for index = 0, (CppEnums.ProfileIndex).eUserProfileValueType_Count - 1 do
    ((control._list2Profile):getElementManager()):pushKey(toInt64(0, index))
  end
end

HandleClicked_RadioButton = function(index)
  -- function num : 0_5 , upvalues : myProfile
  local self = myProfile
  self._radioBtnIndex = index
  FGlobal_Profile_Update(true)
end

Profile_DataSet = function(content, key)
  -- function num : 0_6 , upvalues : myProfile, group_2
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
          _count = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_WEIGHT", "count", (string.format)("%.2f", Int64toInt32(_count) / 10000))
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
  group_2:addControl(_key, 0, (CppEnums.ProfileIndex).eUserProfileValueType_Count, 1, contentBg)
end

Profile_TimeSet = function()
  -- function num : 0_7 , upvalues : myProfile
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
  -- function num : 0_8 , upvalues : myProfile
  local self = myProfile
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
  (control._period):SetText((self._termDesc)[self._radioBtnIndex])
  ;
  (control._desc):SetText((self._desc)[index])
end

myProfile.registEvent = function(self)
  -- function num : 0_9
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

