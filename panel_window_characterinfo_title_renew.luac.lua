-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\characterinfo\panel_window_characterinfo_title_renew.luac 

-- params : ...
-- function num : 0
local _panel = Panel_Window_CharacterInfo_Title_Renew
local _mainPanel = Panel_Window_CharacterInfo_Renew
local CharacterTitleInfo = {
_ui = {stc_GraphBg = (UI.getChildControl)(_panel, "Static_Graph_BG"), stc_TitleTapBg = (UI.getChildControl)(_panel, "Static_Title_Tap"), list_TitleList = (UI.getChildControl)(_panel, "List2_Title_List"), stc_TotalInfoBg = (UI.getChildControl)(_panel, "Static_Total_Progress_BG"), 
radiobutton_Category = {}
}
, _currentCategoryCount = 0, _currentCategoryIdx = 0, _currentClickTitleIdx = -1, defaultFrameBG_CharacterInfo_Title = nil, _isSelectedTitle = false, _currentTitleListType = 0, _maxTitleListType = 4, _previousTitleListType = nil}
CharacterTitleInfo.init = function(self)
  -- function num : 0_0 , upvalues : CharacterTitleInfo
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

  (self._ui).txt_Character_Title = (UI.getChildControl)((self._ui).stc_GraphBg, "StaticText_TitleName")
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_Title_Name_Info = (UI.getChildControl)((self._ui).stc_GraphBg, "StaticText_Title_Name_Info")
  self:current_TitleName()
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).progress_World = (UI.getChildControl)((self._ui).stc_GraphBg, "Progress2_World")
  -- DECOMPILER ERROR at PC33: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_WorldPercent = (UI.getChildControl)((self._ui).stc_GraphBg, "StaticText_World_Percent")
  -- DECOMPILER ERROR at PC41: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).progress_Battle = (UI.getChildControl)((self._ui).stc_GraphBg, "Progress2_Battle")
  -- DECOMPILER ERROR at PC49: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_BattlePercent = (UI.getChildControl)((self._ui).stc_GraphBg, "StaticText_Battle_Percent")
  -- DECOMPILER ERROR at PC57: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).progress_Life = (UI.getChildControl)((self._ui).stc_GraphBg, "Progress2_Life")
  -- DECOMPILER ERROR at PC65: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_LifePercent = (UI.getChildControl)((self._ui).stc_GraphBg, "StaticText_Life_Percent")
  -- DECOMPILER ERROR at PC73: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).progress_Fish = (UI.getChildControl)((self._ui).stc_GraphBg, "Progress2_Fish")
  -- DECOMPILER ERROR at PC81: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_FishPercent = (UI.getChildControl)((self._ui).stc_GraphBg, "StaticText_Fish_Percent")
  -- DECOMPILER ERROR at PC90: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).radiobutton_Category)[0] = (UI.getChildControl)((self._ui).stc_TitleTapBg, "RadioButton_World")
  -- DECOMPILER ERROR at PC99: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).radiobutton_Category)[1] = (UI.getChildControl)((self._ui).stc_TitleTapBg, "RadioButton_Battle")
  -- DECOMPILER ERROR at PC108: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).radiobutton_Category)[2] = (UI.getChildControl)((self._ui).stc_TitleTapBg, "RadioButton_Life")
  -- DECOMPILER ERROR at PC117: Confused about usage of register: R1 in 'UnsetPending'

  ;
  ((self._ui).radiobutton_Category)[3] = (UI.getChildControl)((self._ui).stc_TitleTapBg, "RadioButton_Fish")
  for ii = 0, 3 do
    (((self._ui).radiobutton_Category)[ii]):addInputEvent("Mouse_LUp", "InputMLUp_CharacterTitleInfo_TapToOpen(" .. ii .. " )")
  end
  -- DECOMPILER ERROR at PC140: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_LastUpdateTime = (UI.getChildControl)((self._ui).stc_TitleTapBg, "StaticText_AcceptCooltime")
  -- DECOMPILER ERROR at PC148: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_LTButton = (UI.getChildControl)((self._ui).stc_TitleTapBg, "Static_LT_ConsoleUI")
  ;
  ((self._ui).stc_LTButton):addInputEvent("Mouse_LUp", "PaGlobalFunc_CharacterTitleInfo_ShowLeftNextTab()")
  -- DECOMPILER ERROR at PC162: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).stc_RTButton = (UI.getChildControl)((self._ui).stc_TitleTapBg, "Static_RT_ConsoleUI")
  ;
  ((self._ui).stc_RTButton):addInputEvent("Mouse_LUp", "PaGlobalFunc_CharacterTitleInfo_ShowRightNextTab()")
  -- DECOMPILER ERROR at PC176: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_Total_Progress = (UI.getChildControl)((self._ui).stc_TotalInfoBg, "StaticText_Progress")
  -- DECOMPILER ERROR at PC184: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).progress_Total_Percent = (UI.getChildControl)((self._ui).stc_TotalInfoBg, "Progress2_Percent")
  -- DECOMPILER ERROR at PC192: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).txt_Reward = (UI.getChildControl)((self._ui).stc_TotalInfoBg, "StaticText_Reward")
  ;
  ((self._ui).list_TitleList):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "CharacterInfo_TitleList_ControlCreate")
  ;
  ((self._ui).list_TitleList):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  self:titleListCheck(0)
  CharacterTitleInfo:registMessageHandler()
end

CharacterTitleInfo.current_TitleName = function(self)
  -- function num : 0_1
  local selfplayer = getSelfPlayer()
  if selfplayer == nil then
    return 
  end
  ;
  ((self._ui).txt_Character_Title):SetShow(true)
  if selfplayer:checkToTitleKey() then
    ((self._ui).txt_Character_Title):SetText(selfplayer:getTitleName())
  else
    ;
    ((self._ui).txt_Character_Title):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_TITLE_NOAPPLIEDTITLEYET"))
  end
end

CharacterTitleInfo.titleListCheck = function(self, categoryIdx)
  -- function num : 0_2
  self._currentTitleListType = categoryIdx
  self._currentCategoryCount = ToClient_GetCategoryTitleCount(categoryIdx)
  self._currentCategoryIdx = categoryIdx
  local _fontColor = {selected = (Defines.Color).C_FFEEEEEE, defalut = (Defines.Color).C_FFC4BEBE}
  ToClient_SetCurrentTitleCategory(categoryIdx)
  for ii = 0, 3 do
    (((self._ui).radiobutton_Category)[ii]):SetFontColor(_fontColor.defalut)
  end
  ;
  (((self._ui).radiobutton_Category)[categoryIdx]):SetFontColor(_fontColor.selected)
  FromClient_CharacterTitleInfo_Update()
end

CharacterInfo_TitleList_ControlCreate = function(content, key)
  -- function num : 0_3 , upvalues : CharacterTitleInfo
  local self = CharacterTitleInfo
  local titleIndex = Int64toInt32(key)
  local titleWrapper = ToClient_GetTitleStaticStatusWrapper(titleIndex)
  if titleWrapper == nil then
    return 
  end
  local titleBG = (UI.getChildControl)(content, "RadioButton_Select_Title_Template")
  local titleName = (UI.getChildControl)(content, "StaticText_Title_Name_Template")
  local titleSet = (UI.getChildControl)(content, "StaticText_Status_Template")
  local radioButton_NA = (UI.getChildControl)(content, "RadioButton_NA_Template")
  radioButton_NA:SetIgnore(true)
  local stc_Selected = (UI.getChildControl)(content, "Static_Selected")
  titleName:SetText(titleWrapper:getName())
  if titleWrapper:isAcquired() == true then
    titleBG:SetIgnore(false)
    titleBG:addInputEvent("Mouse_On", "InputMOn_CharacterTitleInfo_ShowDescription(" .. self._currentCategoryIdx .. ", " .. titleIndex .. " )")
    titleBG:addInputEvent("Mouse_Out", "InputMOut_CharacterTitleInfo_CloseDescription()")
    titleBG:SetUnchecked()
    titleName:SetShow(true)
    titleSet:SetShow(true)
    titleBG:addInputEvent("Mouse_LUp", "InputMLUp_CharacterTitleInfo_TitleSet(" .. self._currentCategoryIdx .. ", " .. titleIndex .. " )")
    radioButton_NA:SetShow(false)
    if ToClient_IsAppliedTitle(titleWrapper:getKey()) then
      titleSet:SetText(PAGetString(Defines.StringSheet_GAME, ""))
      stc_Selected:SetShow(true)
    else
      titleSet:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TITLE_APPLICATION"))
      stc_Selected:SetShow(false)
    end
  else
    titleBG:SetIgnore(true)
    titleName:SetShow(true)
    radioButton_NA:SetIgnore(false)
    radioButton_NA:addInputEvent("Mouse_On", "InputMOn_CharacterTitleInfo_ShowDescription(" .. self._currentCategoryIdx .. ", " .. titleIndex .. " )")
    radioButton_NA:addInputEvent("Mouse_Out", "InputMOut_CharacterTitleInfo_CloseDescription()")
    titleBG:SetUnchecked()
    titleSet:SetShow(false)
    stc_Selected:SetShow(false)
    radioButton_NA:SetShow(true)
  end
end

InputMLUp_CharacterTitleInfo_TapToOpen = function(categoryIdx)
  -- function num : 0_4 , upvalues : CharacterTitleInfo
  local self = CharacterTitleInfo
  self:titleListCheck(categoryIdx)
end

InputMOn_CharacterTitleInfo_ShowDescription = function(categoryIdx, titleIdx)
  -- function num : 0_5 , upvalues : CharacterTitleInfo
  local self = CharacterTitleInfo
  ToClient_SetCurrentTitleCategory(categoryIdx)
  local titleWrapper = ToClient_GetTitleStaticStatusWrapper(titleIdx)
  ;
  ((self._ui).txt_Title_Name_Info):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui).txt_Title_Name_Info):SetText(titleWrapper:getDescription())
end

InputMOut_CharacterTitleInfo_CloseDescription = function()
  -- function num : 0_6 , upvalues : CharacterTitleInfo
  local self = CharacterTitleInfo
  ;
  ((self._ui).txt_Title_Name_Info):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui).txt_Title_Name_Info):SetText("")
end

CharacterTitleInfo.titleInfoUpdate = function(self)
  -- function num : 0_7
  local _titleCountByAll = ToClient_GetTotalTitleCount()
  local _titleTotalCount = ToClient_GetTotalTitleBuffCount()
  local titleCountByAll = ToClient_GetTotalTitleCount()
  local acquiredTitleCountByAll = ToClient_GetTotalAcquiredTitleCount()
  local titleTotalCount = ToClient_GetTotalTitleBuffCount()
  ;
  ((self._ui).txt_Reward):SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
  ;
  ((self._ui).txt_Reward):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TITLE_TOTALREWARD_VALUE"))
  if titleCountByAll ~= nil and acquiredTitleCountByAll ~= nil and titleTotalCount ~= nil then
    local totalPercent = acquiredTitleCountByAll / titleCountByAll * 100
    ;
    ((self._ui).progress_Total_Percent):SetProgressRate(totalPercent)
    ;
    ((self._ui).txt_Total_Progress):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_CHARACTERINFO_TITLE_TOTALPROGRESS") .. " : " .. (string.format)("%.1f", totalPercent) .. "%")
    for index = 0, titleTotalCount - 1 do
      local titleBuffWrapper = ToClient_GetTitleBuffWrapper(index)
      if titleBuffWrapper ~= nil then
        local buffDescription = titleBuffWrapper:getBuffDescription()
        ;
        ((self._ui).txt_Reward):SetText(buffDescription)
      end
    end
    local _categoryProgressDisplay = {[1] = (self._ui).progress_World, [2] = (self._ui).progress_Battle, [3] = (self._ui).progress_Life, [4] = (self._ui).progress_Fish}
    local _categoryPersentDisplay = {[1] = (self._ui).txt_WorldPercent, [2] = (self._ui).txt_BattlePercent, [3] = (self._ui).txt_LifePercent, [4] = (self._ui).txt_FishPercent}
    for ii = 1, 4 do
      local titleCurrentCount = ToClient_GetCategoryTitleCount(ii - 1)
      local titleCurrentGetCount = ToClient_GetAcquiredTitleCount(ii - 1)
      if titleCurrentCount ~= nil then
        if titleCurrentGetCount == nil then
          break
        end
        do
          local titleCurrentPercent = titleCurrentGetCount / titleCurrentCount * 100
          ;
          (_categoryProgressDisplay[ii]):SetProgressRate(titleCurrentPercent)
          ;
          (_categoryPersentDisplay[ii]):SetText((string.format)("%.1f", titleCurrentPercent) .. "%")
          -- DECOMPILER ERROR at PC130: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC130: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  do
    local lastCount = self._currentCategoryCount
    if lastCount < 1 then
      return 
    end
    if self._previousTitleListType == self._currentTitleListType then
      for titleIndex = 0, lastCount - 1 do
        ((self._ui).list_TitleList):requestUpdateByKey(toInt64(0, titleIndex))
      end
    else
      do
        self._previousTitleListType = self._currentTitleListType
        ;
        (((self._ui).list_TitleList):getElementManager()):clearKey()
        for titleIndex = 0, lastCount - 1 do
          (((self._ui).list_TitleList):getElementManager()):pushKey(toInt64(0, titleIndex))
        end
      end
    end
  end
end

InputMLUp_CharacterTitleInfo_TitleSet = function(categoryIdx, titleIdx)
  -- function num : 0_8 , upvalues : CharacterTitleInfo
  local self = CharacterTitleInfo
  ToClient_SetCurrentTitleCategory(categoryIdx)
  CharacterTitleInfo:current_TitleName()
  ToClient_TitleSetRequest(categoryIdx, titleIdx)
  self._isSelectedTitle = true
  self._currentClickTitleIdx = titleIdx
end

CharacterTitleInfo.registMessageHandler = function(self)
  -- function num : 0_9
  registerEvent("FromClient_TitleInfo_UpdateText", "FromClient_CharacterTitleInfo_Update")
end

FromClient_CharacterTitleInfo_Update = function()
  -- function num : 0_10 , upvalues : CharacterTitleInfo, _mainPanel
  local self = CharacterTitleInfo
  if _mainPanel:IsShow() == false then
    return 
  end
  self:titleInfoUpdate()
  self:current_TitleName()
  self:updateCoolTime()
end

CharacterTitleInfo.updateCoolTime = function(self)
  -- function num : 0_11
  local coolTime = ToClient_GetUpdateTitleDelay()
  if coolTime > 0 then
    self._isSelectedTitle = true
    ;
    ((self._ui).txt_LastUpdateTime):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TITLE_LASTUPDATETIME", "coolTime", coolTime))
  else
    self._isSelectedTitle = false
    ;
    ((self._ui).txt_LastUpdateTime):SetText("")
  end
end

FromClient_luaLoadComplete_Panel_Window_CharacterInfo_Title = function()
  -- function num : 0_12 , upvalues : CharacterTitleInfo, _panel
  local self = CharacterTitleInfo
  self:init()
  self.defaultFrameBG_CharacterInfo_Title = (UI.getChildControl)(Panel_Window_CharacterInfo_Renew, "Static_TitleInfoBg")
  ;
  (self.defaultFrameBG_CharacterInfo_Title):SetShow(false)
  ;
  (self.defaultFrameBG_CharacterInfo_Title):MoveChilds((self.defaultFrameBG_CharacterInfo_Title):GetID(), _panel)
  deletePanel(_panel:GetID())
end

CoolTimeCountdown_UpdatePerFrame = function(deltaTime)
  -- function num : 0_13 , upvalues : CharacterTitleInfo
  local self = CharacterTitleInfo
  if self._isSelectedTitle then
    self:updateCoolTime()
  end
end

PaGlobalFunc_CharacterTitleInfo_ShowRightNextTab = function()
  -- function num : 0_14 , upvalues : CharacterTitleInfo
  local self = CharacterTitleInfo
  self:ShowNextTab(false)
end

PaGlobalFunc_CharacterTitleInfo_ShowLeftNextTab = function()
  -- function num : 0_15 , upvalues : CharacterTitleInfo
  local self = CharacterTitleInfo
  self:ShowNextTab(true)
end

CharacterTitleInfo.ShowNextTab = function(self, isLeft)
  -- function num : 0_16
  if isLeft == true then
    if self._currentTitleListType > 0 then
      self._currentTitleListType = self._currentTitleListType - 1
    else
      self._currentTitleListType = self._maxTitleListType - 1
    end
    self:titleListCheck(self._currentTitleListType)
  else
    if self._currentTitleListType < self._maxTitleListType - 1 then
      self._currentTitleListType = self._currentTitleListType + 1
    else
      self._currentTitleListType = 0
    end
    self:titleListCheck(self._currentTitleListType)
  end
end

PaGlobalFunc_CharacterTitleInfoTab_PadControl = function(index)
  -- function num : 0_17 , upvalues : CharacterTitleInfo
  self = CharacterTitleInfo
  if index == 0 then
    self:ShowNextTab(true)
  else
    self:ShowNextTab(false)
  end
end

registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_Panel_Window_CharacterInfo_Title")

