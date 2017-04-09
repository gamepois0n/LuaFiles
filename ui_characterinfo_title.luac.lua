-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\characterinfo\ui_characterinfo_title.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local IM = CppEnums.EProcessorInputMode
local UI_color = Defines.Color
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_TM = CppEnums.TextMode
Panel_Window_CharInfo_TitleInfo:SetShow(false)
local TitleInfo = {
TitleUIPool = {}
, _titleListBG = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "Static_BG"), totalProgress = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "Static_TotalProgress_Progress"), totalProgressValue = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_TotalProgress_Percent"), 
Category_BTN = {(UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "RadioButton_Taste_Combat"), (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "RadioButton_Taste_Product"), (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "RadioButton_Taste_Fishing"); [0] = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "RadioButton_Taste_AllRound")}
, _titleRightListBG = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "Static_RightBG"), 
titleSubject_Btn = {(UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "RadioButton_Top_Combat"), (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "RadioButton_Top_Product"), (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "RadioButton_Top_Fish"); [0] = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "RadioButton_Top_AllRound")}
, titleListScroll = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "Scroll_TitleList"), title_ListAll = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_AllRound_CountValue"), title_ListCombat = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_Combat_CountValue"), title_ListProduct = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_Product_CountValue"), title_ListFish = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_Fishing_CountValue"), title_ListAllPercent = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_AllRound_PercentValue"), title_ListCombatPercent = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_Combat_PercentValue"), title_ListProductPercent = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_Product_PercentValue"), title_ListFishPercent = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_Fishing_PercentValue"), title_ListAllProgress = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "CircularProgress_AllRound"), title_ListCombatProgress = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "CircularProgress_Combat"), title_ListProductProgress = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "CircularProgress_Product"), title_ListFishProgress = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "CircularProgress_Fishing"), txt_AllRoundDesc = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_AllRoundDesc"), txt_CombatDesc = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_CombatDesc"), txt_ProductDesc = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_ProductDesc"), txt_FishingDesc = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_FishingDesc"), txt_TotalReward = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_TotalProgressReward"), txt_TotalReward_Value = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_TotalProgressReward_Value"), txt_PartDesc = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_SelectedType"), txt_SubTitleBar = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_LeftSubTitle"), CurrentCategoryIdx = 0, CurrentCategoryCount = 0, maxTitleShow = 13, NowTitleInterval = 0, MinTitleInterval = 0, MaxTitleInterval = 0, title_LastUpdateTime = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_AcceptCooltime")}
TitleInfo.titleListScrollBtn = (UI.getChildControl)(TitleInfo.titleListScroll, "Scroll_CtrlButton")
local titleTemplate = {_titleListBG = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "Static_TitleList_TitleBG"), _titleListTitle = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_TitleList_Title"), _titleSetTitle = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "Button_SetTitle")}
TitleInfo.Initialize = function(self)
  -- function num : 0_0 , upvalues : UI_PUCT, titleTemplate, TitleInfo
  local titleStartY = 75
  local titleGapY = 35
  for titleIdx = 0, self.maxTitleShow - 1 do
    local tempTitleUIPool = {}
    local CreateTitleListBG = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, self._titleRightListBG, "Title_ListBG_" .. titleIdx)
    CopyBaseProperty(titleTemplate._titleListBG, CreateTitleListBG)
    CreateTitleListBG:SetPosX(5)
    CreateTitleListBG:SetPosY(titleStartY)
    CreateTitleListBG:SetShow(false)
    tempTitleUIPool._titleListBG = CreateTitleListBG
    local CreateTitleListTitle = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, CreateTitleListBG, "Title_ListTitle_" .. titleIdx)
    CopyBaseProperty(titleTemplate._titleListTitle, CreateTitleListTitle)
    CreateTitleListTitle:SetPosX(20)
    CreateTitleListTitle:SetPosY(5)
    CreateTitleListTitle:SetShow(false)
    tempTitleUIPool._titleListTitle = CreateTitleListTitle
    local CreateTitleSet = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, CreateTitleListBG, "Title_ListTitleSet_" .. titleIdx)
    CopyBaseProperty(titleTemplate._titleSetTitle, CreateTitleSet)
    CreateTitleSet:SetPosX(265)
    CreateTitleSet:SetPosY(5)
    CreateTitleSet:SetShow(false)
    tempTitleUIPool._titleSetBTN = CreateTitleSet
    -- DECOMPILER ERROR at PC81: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (self.TitleUIPool)[titleIdx] = tempTitleUIPool
    titleStartY = titleStartY + titleGapY
    for key,value in pairs(tempTitleUIPool) do
      value:addInputEvent("Mouse_DownScroll", "TitleInfo_ListUpdate( true )")
      value:addInputEvent("Mouse_UpScroll", "TitleInfo_ListUpdate( false )")
    end
  end
  ;
  (TitleInfo.txt_SubTitleBar):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TITLE_SUBTITLEBAR_COUNT", "count", ToClient_GetTotalAcquiredTitleCount()))
end

TitleInfo_ListUpdate = function(UpDown)
  -- function num : 0_1 , upvalues : TitleInfo
  local self = TitleInfo
  local nowTitleInterval = self.NowTitleInterval
  local minTitleInterval = self.MinTitleInterval
  local maxTitleInterval = self.CurrentCategoryCount - 13
  local categoryCurrent = self.CurrentCategoryCount
  if categoryCurrent < self.maxTitleShow then
    return 
  end
  if UpDown == true then
    if nowTitleInterval < maxTitleInterval then
      (self.titleListScroll):ControlButtonDown()
      nowTitleInterval = nowTitleInterval + 1
      self.NowTitleInterval = nowTitleInterval
      self:TitleUpdate(nowTitleInterval)
    else
      return 
    end
  else
    if minTitleInterval < nowTitleInterval then
      (self.titleListScroll):ControlButtonUp()
      nowTitleInterval = nowTitleInterval - 1
      self.NowTitleInterval = nowTitleInterval
      self:TitleUpdate(nowTitleInterval)
    else
      return 
    end
  end
end

TitleInfo.TitleUpdate = function(self, startIdx)
  -- function num : 0_2 , upvalues : UI_TM, TitleInfo
  local titleCountByAll = ToClient_GetTotalTitleCount()
  local titleTotalCount = ToClient_GetTotalTitleBuffCount()
  ;
  (self.txt_TotalReward_Value):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TITLE_TOTALREWARD_VALUE"))
  ;
  (self.txt_PartDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  if (TitleInfo.txt_PartDesc):GetText() == "" or (TitleInfo.txt_PartDesc):GetText() == nil then
    (self.txt_PartDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TITLE_PARTDESC"))
  end
  if titleCountByAll == nil then
    return 
  end
  self.MaxTitleInterval = titleCountByAll
  local gotTitleCountByAll = ToClient_GetTotalAcquiredTitleCount()
  if gotTitleCountByAll == nil then
    return 
  end
  local totalPercent = gotTitleCountByAll / titleCountByAll * 100
  ;
  (self.totalProgress):SetProgressRate(totalPercent)
  ;
  (self.totalProgressValue):SetText((string.format)("%.1f", totalPercent) .. "%")
  for index = 0, titleTotalCount - 1 do
    local titleBuffWrapper = ToClient_GetTitleBuffWrapper(index)
    if titleBuffWrapper ~= nil then
      local buffDescription = titleBuffWrapper:getBuffDescription()
      ;
      (self.txt_TotalReward_Value):SetTextMode(UI_TM.eTextMode_AutoWrap)
      ;
      (self.txt_TotalReward_Value):SetText(buffDescription)
    end
  end
  for categoryIdx = 0, 3 do
    ToClient_GetCategoryTitleCount(categoryIdx)
    local titleCurrentCount = ToClient_GetCategoryTitleCount(categoryIdx)
    local titleCurrentGetCount = ToClient_GetAcquiredTitleCount(categoryIdx)
    local titleCurrentPercent = 0
    if titleCurrentGetCount == 0 then
      titleCurrentPercent = 0
    else
      titleCurrentPercent = titleCurrentGetCount / titleCurrentCount * 100
    end
    if self.CurrentCategoryIdx == categoryIdx then
      ((self.Category_BTN)[categoryIdx]):SetCheck(true)
      ;
      ((self.titleSubject_Btn)[categoryIdx]):SetCheck(true)
    end
    if categoryIdx == 0 then
      (self.title_ListAll):SetText(titleCurrentGetCount)
      ;
      (self.title_ListAllPercent):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TITLE_LISTALL", "percent", (string.format)("%.1f", titleCurrentPercent)))
      ;
      (self.title_ListAllProgress):SetProgressRate(titleCurrentPercent)
    else
      if categoryIdx == 1 then
        (self.title_ListCombat):SetText(titleCurrentGetCount)
        ;
        (self.title_ListCombatPercent):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TITLE_LISTCOMBAT", "percent", (string.format)("%.1f", titleCurrentPercent)))
        ;
        (self.title_ListCombatProgress):SetProgressRate(titleCurrentPercent)
      else
        if categoryIdx == 2 then
          (self.title_ListProduct):SetText(titleCurrentGetCount)
          ;
          (self.title_ListProductPercent):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TITLE_LISTPRODUCT", "percent", (string.format)("%.1f", titleCurrentPercent)))
          ;
          (self.title_ListProductProgress):SetProgressRate(titleCurrentPercent)
        else
          if categoryIdx == 3 then
            (self.title_ListFish):SetText(titleCurrentGetCount)
            ;
            (self.title_ListFishPercent):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TITLE_LISTFISH", "percent", (string.format)("%.1f", titleCurrentPercent)))
            ;
            (self.title_ListFishProgress):SetProgressRate(titleCurrentPercent)
          end
        end
      end
    end
  end
  for idx = 0, 12 do
    local titleList = (self.TitleUIPool)[idx]
    for key,value in pairs(titleList) do
      value:SetShow(false)
    end
  end
  local slotLimitedIdx = 0
  local lastCount = self.CurrentCategoryCount
  if lastCount < 1 then
    return 
  end
  if lastCount <= self.maxTitleShow then
    (self.titleListScroll):SetShow(false)
  else
    ;
    (self.titleListScroll):SetShow(true)
  end
  for titleIdx = startIdx, lastCount - 1 do
    local uiIdx = titleIdx - startIdx
    local titleWrapper = ToClient_GetTitleStaticStatusWrapper(titleIdx)
    local titleSlot = (self.TitleUIPool)[uiIdx]
    if titleSlot == nil then
      return 
    end
    if titleWrapper == nil then
      (titleSlot._titleListBG):SetShow(false)
    else
      ;
      (titleSlot._titleListBG):SetShow(true)
      if titleWrapper:isAcquired() == true then
        (titleSlot._titleListBG):SetText(titleWrapper:getName())
        ;
        (titleSlot._titleListBG):addInputEvent("Mouse_LUp", "HandleClick_ShowDescription(" .. self.CurrentCategoryIdx .. "," .. titleIdx .. ")")
        ;
        (titleSlot._titleSetBTN):SetShow(true)
        ;
        (titleSlot._titleSetBTN):addInputEvent("Mouse_LUp", "HandleClick_TitleSet(" .. self.CurrentCategoryIdx .. "," .. titleIdx .. ")")
        if ToClient_IsAppliedTitle(titleWrapper:getKey()) then
          (titleSlot._titleSetBTN):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TITLE_RELEASE"))
        else
          ;
          (titleSlot._titleSetBTN):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TITLE_APPLICATION"))
        end
      else
        ;
        (titleSlot._titleListBG):SetText("<PAColor0xFF444444>" .. titleWrapper:getName() .. "<PAOldColor>")
        ;
        (titleSlot._titleListBG):addInputEvent("Mouse_LUp", "HandleClick_ShowDescription(" .. self.CurrentCategoryIdx .. "," .. titleIdx .. ")")
        ;
        (titleSlot._titleSetBTN):SetShow(false)
      end
    end
    if uiIdx > 12 then
      return 
    end
  end
end

FromClient_TitleInfo_Update = function()
  -- function num : 0_3 , upvalues : TitleInfo
  local self = TitleInfo
  self:TitleUpdate(self.NowTitleInterval)
  self:updateCoolTime()
end

TitleInfo.updateCoolTime = function(self)
  -- function num : 0_4
  local coolTime = ToClient_GetUpdateTitleDelay()
  ;
  (self.title_LastUpdateTime):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TITLE_LASTUPDATETIME", "coolTime", coolTime))
end

TitleInfo_Open = function()
  -- function num : 0_5 , upvalues : TitleInfo
  ToClient_SetCurrentTitleCategory(0)
  TitleInfo_SetCategory(0)
  local self = TitleInfo
  ;
  (self.txt_SubTitleBar):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TITLE_SUBTITLEBAR_COUNT", "count", ToClient_GetTotalAcquiredTitleCount()))
  self.CurrentCategoryCount = ToClient_GetCategoryTitleCount(0)
  self:SetScroll()
  ;
  (TitleInfo.txt_PartDesc):SetText("")
  self:TitleUpdate(0)
  self:updateCoolTime()
end

TitleInfo.registEventHandler = function(self)
  -- function num : 0_6
  (self._titleRightListBG):addInputEvent("Mouse_DownScroll", "TitleInfo_ListUpdate( true )")
  ;
  (self._titleRightListBG):addInputEvent("Mouse_UpScroll", "TitleInfo_ListUpdate( false )")
  ;
  (self.titleListScroll):addInputEvent("Mouse_LUp", "HandleClick_TitleInfo()")
  ;
  (self.titleListScrollBtn):addInputEvent("Mouse_LUp", "HandleClick_TitleInfo()")
  ;
  (self.titleListScrollBtn):addInputEvent("Mouse_LPress", "HandleClick_TitleInfo()")
  for idx = 0, 3 do
    ((self.Category_BTN)[idx]):addInputEvent("Mouse_LUp", "TitleInfo_SetCategory( " .. idx .. " )")
    ;
    ((self.titleSubject_Btn)[idx]):addInputEvent("Mouse_LUp", "TitleInfo_SetCategory( " .. idx .. " )")
    ;
    ((self.Category_BTN)[idx]):addInputEvent("Mouse_On", "HandleMouseEvent_CategoryDesc( " .. idx .. ", true )")
    ;
    ((self.Category_BTN)[idx]):addInputEvent("Mouse_Out", "HandleMouseEvent_CategoryDesc( " .. idx .. ", false )")
  end
end

HandleMouseEvent_CategoryDesc = function(descType, isOn)
  -- function num : 0_7 , upvalues : TitleInfo
  if descType == 0 and isOn == true then
    (TitleInfo.txt_AllRoundDesc):SetAlpha(0)
    ;
    (TitleInfo.txt_AllRoundDesc):SetFontAlpha(0)
    ;
    (TitleInfo.txt_AllRoundDesc):ResetVertexAni()
    local AniInfo = (UIAni.AlphaAnimation)(1, TitleInfo.txt_AllRoundDesc, 0, 0.15)
    ;
    (TitleInfo.txt_AllRoundDesc):SetShow(true)
  else
    do
      if descType == 1 and isOn == true then
        (TitleInfo.txt_CombatDesc):SetAlpha(0)
        ;
        (TitleInfo.txt_CombatDesc):SetFontAlpha(0)
        ;
        (TitleInfo.txt_CombatDesc):ResetVertexAni()
        local AniInfo = (UIAni.AlphaAnimation)(1, TitleInfo.txt_CombatDesc, 0, 0.15)
        ;
        (TitleInfo.txt_CombatDesc):SetShow(true)
      else
        do
          if descType == 2 and isOn == true then
            (TitleInfo.txt_ProductDesc):SetAlpha(0)
            ;
            (TitleInfo.txt_ProductDesc):SetFontAlpha(0)
            ;
            (TitleInfo.txt_ProductDesc):ResetVertexAni()
            local AniInfo = (UIAni.AlphaAnimation)(1, TitleInfo.txt_ProductDesc, 0, 0.15)
            ;
            (TitleInfo.txt_ProductDesc):SetShow(true)
          else
            do
              if descType == 3 and isOn == true then
                (TitleInfo.txt_FishingDesc):SetAlpha(0)
                ;
                (TitleInfo.txt_FishingDesc):SetFontAlpha(0)
                ;
                (TitleInfo.txt_FishingDesc):ResetVertexAni()
                local AniInfo = (UIAni.AlphaAnimation)(1, TitleInfo.txt_FishingDesc, 0, 0.15)
                ;
                (TitleInfo.txt_FishingDesc):SetShow(true)
              end
              do
                if descType == 0 and isOn == false then
                  (TitleInfo.txt_AllRoundDesc):ResetVertexAni()
                  local AniInfo = (UIAni.AlphaAnimation)(0, TitleInfo.txt_AllRoundDesc, 0, 0.1)
                  AniInfo:SetHideAtEnd(true)
                else
                  do
                    if descType == 1 and isOn == false then
                      (TitleInfo.txt_CombatDesc):ResetVertexAni()
                      local AniInfo1 = (UIAni.AlphaAnimation)(0, TitleInfo.txt_CombatDesc, 0, 0.1)
                      AniInfo1:SetHideAtEnd(true)
                    else
                      do
                        if descType == 2 and isOn == false then
                          (TitleInfo.txt_ProductDesc):ResetVertexAni()
                          local AniInfo2 = (UIAni.AlphaAnimation)(0, TitleInfo.txt_ProductDesc, 0, 0.1)
                          AniInfo2:SetHideAtEnd(true)
                        else
                          do
                            if descType == 3 and isOn == false then
                              (TitleInfo.txt_FishingDesc):ResetVertexAni()
                              local AniInfo3 = (UIAni.AlphaAnimation)(0, TitleInfo.txt_FishingDesc, 0, 0.1)
                              AniInfo3:SetHideAtEnd(true)
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

TitleInfo_SetCategory = function(categoryIdx)
  -- function num : 0_8 , upvalues : TitleInfo
  local self = TitleInfo
  for idx = 0, 3 do
    ((self.Category_BTN)[idx]):SetCheck(false)
    ;
    ((self.titleSubject_Btn)[idx]):SetCheck(false)
    ;
    ((self.titleSubject_Btn)[idx]):SetFontColor(4291083966)
  end
  ToClient_SetCurrentTitleCategory(categoryIdx)
  self.CurrentCategoryCount = ToClient_GetCategoryTitleCount(categoryIdx)
  self.CurrentCategoryIdx = categoryIdx
  ;
  ((self.Category_BTN)[categoryIdx]):SetCheck(true)
  if categoryIdx == 0 then
    ((self.titleSubject_Btn)[0]):SetFontColor(4294959762)
  else
    if categoryIdx == 1 then
      ((self.titleSubject_Btn)[1]):SetFontColor(4294940310)
    else
      if categoryIdx == 2 then
        ((self.titleSubject_Btn)[2]):SetFontColor(4292935574)
      else
        if categoryIdx == 3 then
          ((self.titleSubject_Btn)[3]):SetFontColor(4288076287)
        end
      end
    end
  end
  self:SetScroll()
  self.NowTitleInterval = 0
  self:TitleUpdate(self.NowTitleInterval)
  self:updateCoolTime()
end

TitleInfo.SetScroll = function(self)
  -- function num : 0_9
  (self.titleListScrollBtn):ComputePos()
  ;
  (self.titleListScroll):SetInterval(self.CurrentCategoryCount - self.maxTitleShow)
  local titleCtrBtn = (self.titleListScrollBtn):GetSizeY() / self.maxTitleShow * 3
  if titleCtrBtn < 100 then
    titleCtrBtn = 100
  end
  ;
  (self.titleListScrollBtn):SetSize((self.titleListScrollBtn):GetSizeX(), titleCtrBtn)
  ;
  (self.titleListScroll):SetControlTop()
end

HandleClick_TitleInfo = function()
  -- function num : 0_10 , upvalues : TitleInfo
  local self = TitleInfo
  local maxTitleInterval = self.CurrentCategoryCount - self.maxTitleShow
  local posByTitleInterval = 1 / maxTitleInterval
  local currentTitleInterval = (math.floor)((self.titleListScroll):GetControlPos() / posByTitleInterval + 0.5)
  self.NowTitleInterval = currentTitleInterval
  self:TitleUpdate(self.NowTitleInterval)
end

TitleInfo.registMessageHandler = function(self)
  -- function num : 0_11
  registerEvent("FromClient_TitleInfo_UpdateText", "FromClient_TitleInfo_Update")
end

HandleClick_ShowDescription = function(categoryIdx, titleIdx)
  -- function num : 0_12 , upvalues : TitleInfo, UI_TM
  ToClient_SetCurrentTitleCategory(categoryIdx)
  local titleWrapper = ToClient_GetTitleStaticStatusWrapper(titleIdx)
  ;
  (TitleInfo.txt_PartDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (TitleInfo.txt_PartDesc):SetText(titleWrapper:getDescription())
end

HandleClick_TitleSet = function(categoryIdx, titleIdx)
  -- function num : 0_13 , upvalues : TitleInfo, UI_TM
  ToClient_SetCurrentTitleCategory(categoryIdx)
  local titleWrapper = ToClient_GetTitleStaticStatusWrapper(titleIdx)
  ;
  (TitleInfo.txt_PartDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (TitleInfo.txt_PartDesc):SetText(titleWrapper:getDescription())
  ToClient_TitleSetRequest(categoryIdx, titleIdx)
end

TitleInfo:Initialize()
TitleInfo:registEventHandler()
TitleInfo:registMessageHandler()

