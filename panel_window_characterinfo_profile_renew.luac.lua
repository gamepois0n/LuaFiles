-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\characterinfo\panel_window_characterinfo_profile_renew.luac 

-- params : ...
-- function num : 0
local _panel = Panel_Window_CharacterInfo_Profile_Renew
local _mainPanel = Panel_Window_CharacterInfo_Renew
local CharacterProfileInfo = {
_ui = {stc_BG = (UI.getChildControl)(_panel, "Static_BG"), stc_CategoryTap = (UI.getChildControl)(_panel, "Static_Category_Tap"), stc_BottomBg = (UI.getChildControl)(_panel, "Static_BottomBg")}
, defaultFrameBG_CharacterInfo_Profile = nil, 
termIndex = {[0] = 1, [1] = 7, [2] = 30, [3] = 0}
, _maxCategoryType = 4, _currentCategoryType = 0}
CharacterProfileInfo.init = function(self)
  -- function num : 0_0
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).radioButton = {[0] = (UI.getChildControl)((self._ui).stc_CategoryTap, "RadioButton_Day"), [1] = (UI.getChildControl)((self._ui).stc_CategoryTap, "RadioButton_Week"), [2] = (UI.getChildControl)((self._ui).stc_CategoryTap, "RadioButton_Month"), [3] = (UI.getChildControl)((self._ui).stc_CategoryTap, "RadioButton_Total")}
  for inputIdx = 0, 3 do
    (((self._ui).radioButton)[inputIdx]):addInputEvent("Mouse_LUp", "InputMLUp_CharacterProfileInfo_TapToOpen(" .. inputIdx .. ")")
  end
  -- DECOMPILER ERROR at PC53: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_LT_ConsoleUI = (UI.getChildControl)((self._ui).stc_CategoryTap, "Static_LT_ConsoleUI")
  ;
  ((self._ui).stc_LT_ConsoleUI):addInputEvent("Mouse_LUp", "PaGlobalFunc_CharacterProfileInfo_ShowLeftNextTab()")
  -- DECOMPILER ERROR at PC67: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_RT_ConsoleUI = (UI.getChildControl)((self._ui).stc_CategoryTap, "Static_RT_ConsoleUI")
  ;
  ((self._ui).stc_RT_ConsoleUI):addInputEvent("Mouse_LUp", "PaGlobalFunc_CharacterProfileInfo_ShowRightNextTab()")
  -- DECOMPILER ERROR at PC81: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_MonsterBG = (UI.getChildControl)((self._ui).stc_BottomBg, "Static_Monster_BG")
  -- DECOMPILER ERROR at PC89: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_MonsterIconBG = (UI.getChildControl)((self._ui).stc_MonsterBG, "Static_Monster_Icon_BG")
  -- DECOMPILER ERROR at PC97: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_MonsterIcon = (UI.getChildControl)((self._ui).stc_MonsterBG, "Static_Monster_Icon")
  -- DECOMPILER ERROR at PC105: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_MonsterTitle = (UI.getChildControl)((self._ui).stc_MonsterBG, "StaticText_Monster_Title")
  ;
  ((self._ui).txt_MonsterTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_TITLE_1"))
  -- DECOMPILER ERROR at PC122: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_MonsterCount = (UI.getChildControl)((self._ui).stc_MonsterBG, "StaticText_Monster_Count")
  -- DECOMPILER ERROR at PC130: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_MonsterDesc = (UI.getChildControl)((self._ui).stc_MonsterBG, "StaticText_Monster_Desc")
  ;
  ((self._ui).txt_MonsterDesc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui).txt_MonsterDesc):SetAutoResize(true)
  ;
  ((self._ui).txt_MonsterDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_DESC_1"))
  -- DECOMPILER ERROR at PC159: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_FishBG = (UI.getChildControl)((self._ui).stc_BottomBg, "Static_Fish_BG")
  -- DECOMPILER ERROR at PC167: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_FishIconBG = (UI.getChildControl)((self._ui).stc_FishBG, "Static_Fish_Icon_BG")
  -- DECOMPILER ERROR at PC175: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_FishIcon = (UI.getChildControl)((self._ui).stc_FishBG, "Static_Fish_Icon")
  -- DECOMPILER ERROR at PC183: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_FishTitle = (UI.getChildControl)((self._ui).stc_FishBG, "StaticText_Fish_Title")
  ;
  ((self._ui).txt_FishTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_TITLE_2"))
  -- DECOMPILER ERROR at PC200: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_FishCount = (UI.getChildControl)((self._ui).stc_FishBG, "StaticText_Fish_Count")
  -- DECOMPILER ERROR at PC208: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_FishDesc = (UI.getChildControl)((self._ui).stc_FishBG, "StaticText_Fish_Desc")
  ;
  ((self._ui).txt_FishDesc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui).txt_FishDesc):SetAutoResize(true)
  ;
  ((self._ui).txt_FishDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_DESC_2"))
  -- DECOMPILER ERROR at PC237: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_GatherBG = (UI.getChildControl)((self._ui).stc_BottomBg, "Static_Gather_BG")
  -- DECOMPILER ERROR at PC245: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_GatherIconBG = (UI.getChildControl)((self._ui).stc_GatherBG, "Static_Gather_Icon_BG")
  -- DECOMPILER ERROR at PC253: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_GatherIcon = (UI.getChildControl)((self._ui).stc_GatherBG, "Static_Gather_Icon")
  -- DECOMPILER ERROR at PC261: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_GatherTitle = (UI.getChildControl)((self._ui).stc_GatherBG, "StaticText_Gather_Title")
  ;
  ((self._ui).txt_GatherTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_TITLE_3"))
  -- DECOMPILER ERROR at PC278: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_GatherCount = (UI.getChildControl)((self._ui).stc_GatherBG, "StaticText_Gather_Count")
  -- DECOMPILER ERROR at PC286: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_GatherDesc = (UI.getChildControl)((self._ui).stc_GatherBG, "StaticText_Gather_Desc")
  ;
  ((self._ui).txt_GatherDesc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui).txt_GatherDesc):SetAutoResize(true)
  ;
  ((self._ui).txt_GatherDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_DESC_3"))
  -- DECOMPILER ERROR at PC315: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_WeightBG = (UI.getChildControl)((self._ui).stc_BottomBg, "Static_Weight_BG")
  -- DECOMPILER ERROR at PC323: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_WeightIconBG = (UI.getChildControl)((self._ui).stc_WeightBG, "Static_Weight_Icon_BG")
  -- DECOMPILER ERROR at PC331: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_WeightIcon = (UI.getChildControl)((self._ui).stc_WeightBG, "Static_Weight_Icon")
  -- DECOMPILER ERROR at PC339: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_WeightTitle = (UI.getChildControl)((self._ui).stc_WeightBG, "StaticText_Weight_Title")
  ;
  ((self._ui).txt_WeightTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_TITLE_4"))
  -- DECOMPILER ERROR at PC356: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_WeightCount = (UI.getChildControl)((self._ui).stc_WeightBG, "StaticText_Weight_Count")
  -- DECOMPILER ERROR at PC364: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_WeightDesc = (UI.getChildControl)((self._ui).stc_WeightBG, "StaticText_Weight_Desc")
  ;
  ((self._ui).txt_WeightDesc):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui).txt_WeightDesc):SetAutoResize(true)
  ;
  ((self._ui).txt_WeightDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_DESC_4"))
  -- DECOMPILER ERROR at PC393: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_PlayTimeTotal = (UI.getChildControl)((self._ui).stc_BottomBg, "StaticText_PlayTimeTotal")
  -- DECOMPILER ERROR at PC401: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_PlayTimeDay = (UI.getChildControl)((self._ui).stc_BottomBg, "StaticText_PlayTimeToday")
  -- DECOMPILER ERROR at PC409: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_PlayTimePcRoom = (UI.getChildControl)((self._ui).stc_BottomBg, "StaticText_PlayTimePcRoom")
  ;
  ((self._ui).txt_PlayTimePcRoom):SetShow(false)
end

CharacterProfileInfo.updateData = function(self, period)
  -- function num : 0_1
  self._currentCategoryType = period
  ToClient_RequestUserProfileInfo()
  for btnIdx = 0, #(self._ui).radioButton do
    (((self._ui).radioButton)[btnIdx]):SetFontColor((Defines.Color).C_FF888888)
  end
  ;
  (((self._ui).radioButton)[period]):SetFontColor((Defines.Color).C_FFEEEEEE)
  local _dayPlayTime = ((Util.Time).timeFormatting)(Int64toInt32(ToClient_GetUserPlayTimePerDay()))
  ;
  ((self._ui).txt_PlayTimeDay):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_TODAYPLAYTIME") .. " <PAColor0xFFFFC730>" .. _dayPlayTime)
  local _totalPlayTime = ((Util.Time).timeFormatting_Minute)(Int64toInt32(ToClient_GetCharacterPlayTime()))
  ;
  ((self._ui).txt_PlayTimeTotal):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CONTRACT_TIME_BLACKSPIRIT") .. " <PAColor0xFFFFC730>" .. _totalPlayTime)
  local _temporaryPCRoomWrapper = getTemporaryInformationWrapper()
  local _isPremiumPcRoom = _temporaryPCRoomWrapper:isPremiumPcRoom()
  if _isPremiumPcRoom == true and (isGameTypeKorea() or isGameTypeJapan()) then
    ((self._ui).txt_PlayTimePcRoom):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_PCROOMPLAYTIME") .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SELFCHARACTERINFO_PCROOMTIME", "getPcRoomPlayTime", convertStringFromDatetime(ToClient_GetPcRoomPlayTime())))
    ;
    ((self._ui).txt_PlayTimePcRoom):SetShow(true)
  else
    if _isPremiumPcRoom == false then
      ((self._ui).txt_PlayTimePcRoom):SetShow(false)
    end
  end
  local _periodIdx = (self.termIndex)[period]
  local _monsterCountText = tostring(ToClient_GetProfileInfo(_periodIdx, (CppEnums.ProfileIndex).eUserProfileValueType_MonsterKillCount))
  ;
  ((self._ui).txt_MonsterCount):SetText(_monsterCountText)
  local _fishCountText = tostring(ToClient_GetProfileInfo(_periodIdx, (CppEnums.ProfileIndex).eUserProfileValueType_FishingSuccessCount))
  ;
  ((self._ui).txt_FishCount):SetText(_fishCountText)
  local _gatherCountText = tostring(ToClient_GetProfileInfo(_periodIdx, (CppEnums.ProfileIndex).eUserProfileValueType_ItemGainCount))
  ;
  ((self._ui).txt_GatherCount):SetText(_gatherCountText)
  local _weightText = ToClient_GetProfileInfo(_periodIdx, (CppEnums.ProfileIndex).eUserProfileValueType_ProductSuccessCount)
  _weightText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ACHIVEMENT_WEIGHT", "count", makeWeightString(_weightText))
  ;
  ((self._ui).txt_WeightCount):SetText(_weightText)
end

InputMLUp_CharacterProfileInfo_TapToOpen = function(radioBtnIdx)
  -- function num : 0_2 , upvalues : CharacterProfileInfo
  self = CharacterProfileInfo
  self:updateData(radioBtnIdx)
end

FromClient_luaLoadComplete_Panel_Window_Character_ProfileInfo = function()
  -- function num : 0_3 , upvalues : CharacterProfileInfo, _mainPanel, _panel
  local self = CharacterProfileInfo
  self:init()
  self.defaultFrameBG_CharacterInfo_Profile = (UI.getChildControl)(_mainPanel, "Static_ProfileInfoBg")
  ;
  (self.defaultFrameBG_CharacterInfo_Profile):SetShow(false)
  ;
  (self.defaultFrameBG_CharacterInfo_Profile):MoveChilds((self.defaultFrameBG_CharacterInfo_Profile):GetID(), _panel)
  deletePanel(_panel:GetID())
  InputMLUp_CharacterProfileInfo_TapToOpen(0)
end

PaGlobalFunc_CharacterProfileInfo_ShowRightNextTab = function()
  -- function num : 0_4 , upvalues : CharacterProfileInfo
  local self = CharacterProfileInfo
  self:ShowNextTab(false)
end

PaGlobalFunc_CharacterProfileInfo_ShowLeftNextTab = function()
  -- function num : 0_5 , upvalues : CharacterProfileInfo
  local self = CharacterProfileInfo
  self:ShowNextTab(true)
end

CharacterProfileInfo.ShowNextTab = function(self, isLeft)
  -- function num : 0_6
  if isLeft == true then
    if self._currentCategoryType > 0 then
      self._currentCategoryType = self._currentCategoryType - 1
    else
      self._currentCategoryType = self._maxCategoryType - 1
    end
    self:updateData(self._currentCategoryType)
  else
    if self._currentCategoryType < self._maxCategoryType - 1 then
      self._currentCategoryType = self._currentCategoryType + 1
    else
      self._currentCategoryType = 0
    end
    self:updateData(self._currentCategoryType)
  end
end

PaGlobalFunc_CharacterProfileInfoTab_PadControl = function(index)
  -- function num : 0_7 , upvalues : CharacterProfileInfo
  self = CharacterProfileInfo
  _PA_LOG("원선", "PaGlobalFunc_CharacterInfoTab_PadControl" .. index)
  if index == 0 then
    self:ShowNextTab(true)
  else
    self:ShowNextTab(false)
  end
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_Panel_Window_Character_ProfileInfo")

