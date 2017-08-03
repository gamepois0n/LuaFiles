-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\characterinfo\ui_characterinfo_title.luac 

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
, title_ListAll = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_AllRound_CountValue"), title_ListCombat = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_Combat_CountValue"), title_ListProduct = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_Product_CountValue"), title_ListFish = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_Fishing_CountValue"), title_ListAllPercent = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_AllRound_PercentValue"), title_ListCombatPercent = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_Combat_PercentValue"), title_ListProductPercent = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_Product_PercentValue"), title_ListFishPercent = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_Fishing_PercentValue"), title_ListAllProgress = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "CircularProgress_AllRound"), title_ListCombatProgress = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "CircularProgress_Combat"), title_ListProductProgress = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "CircularProgress_Product"), title_ListFishProgress = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "CircularProgress_Fishing"), txt_AllRoundDesc = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_AllRoundDesc"), txt_CombatDesc = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_CombatDesc"), txt_ProductDesc = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_ProductDesc"), txt_FishingDesc = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_FishingDesc"), txt_TotalReward = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_TotalProgressReward"), txt_TotalReward_Value = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_TotalProgressReward_Value"), txt_PartDesc = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_SelectedType"), txt_SubTitleBar = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_LeftSubTitle"), CurrentCategoryIdx = 0, CurrentCategoryCount = 0, title_LastUpdateTime = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "StaticText_AcceptCooltime"), list2 = (UI.getChildControl)(Panel_Window_CharInfo_TitleInfo, "List2_CharacterInfo_TitleList")}
TitleInfo.Initialize = function(self)
  -- function num : 0_0 , upvalues : TitleInfo
  local self = TitleInfo
  local titleStartY = 75
  local titleGapY = 35
  local minSize = float2()
  minSize.x = 10
  minSize.y = 50
  ;
  (self.list2):setMinScrollBtnSize(minSize)
  ;
  (TitleInfo.txt_SubTitleBar):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TITLE_SUBTITLEBAR_COUNT", "count", ToClient_GetTotalAcquiredTitleCount()))
end

TitleInfo.TitleUpdate = function(self)
  -- function num : 0_1 , upvalues : UI_TM, TitleInfo
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
      (self.title_ListAll):SetText(titleCurrentGetCount .. "/" .. titleCurrentCount)
      ;
      (self.title_ListAllPercent):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TITLE_LISTALL", "percent", (string.format)("%.1f", titleCurrentPercent)))
      ;
      (self.title_ListAllProgress):SetProgressRate(titleCurrentPercent)
    else
      if categoryIdx == 1 then
        (self.title_ListCombat):SetText(titleCurrentGetCount .. "/" .. titleCurrentCount)
        ;
        (self.title_ListCombatPercent):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TITLE_LISTCOMBAT", "percent", (string.format)("%.1f", titleCurrentPercent)))
        ;
        (self.title_ListCombatProgress):SetProgressRate(titleCurrentPercent)
      else
        if categoryIdx == 2 then
          (self.title_ListProduct):SetText(titleCurrentGetCount .. "/" .. titleCurrentCount)
          ;
          (self.title_ListProductPercent):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TITLE_LISTPRODUCT", "percent", (string.format)("%.1f", titleCurrentPercent)))
          ;
          (self.title_ListProductProgress):SetProgressRate(titleCurrentPercent)
        else
          if categoryIdx == 3 then
            (self.title_ListFish):SetText(titleCurrentGetCount .. "/" .. titleCurrentCount)
            ;
            (self.title_ListFishPercent):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TITLE_LISTFISH", "percent", (string.format)("%.1f", titleCurrentPercent)))
            ;
            (self.title_ListFishProgress):SetProgressRate(titleCurrentPercent)
          end
        end
      end
    end
  end
  local lastCount = self.CurrentCategoryCount
  if lastCount < 1 then
    return 
  end
  ;
  ((self.list2):getElementManager()):clearKey()
  for titleIndex = 0, lastCount - 1 do
    ((self.list2):getElementManager()):pushKey(toInt64(0, titleIndex))
  end
end

FromClient_TitleInfo_Update = function()
  -- function num : 0_2 , upvalues : TitleInfo
  local self = TitleInfo
  self:TitleUpdate()
  self:updateCoolTime()
end

TitleInfo.updateCoolTime = function(self)
  -- function num : 0_3
  local coolTime = ToClient_GetUpdateTitleDelay()
  ;
  (self.title_LastUpdateTime):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TITLE_LASTUPDATETIME", "coolTime", coolTime))
end

TitleInfo_Open = function()
  -- function num : 0_4 , upvalues : TitleInfo
  TitleInfo:SetConsolePadGroup()
  ToClient_SetCurrentTitleCategory(0)
  TitleInfo_SetCategory(0)
  local self = TitleInfo
  ;
  (self.txt_SubTitleBar):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TITLE_SUBTITLEBAR_COUNT", "count", ToClient_GetTotalAcquiredTitleCount()))
  self.CurrentCategoryCount = ToClient_GetCategoryTitleCount(0)
  ;
  (TitleInfo.txt_PartDesc):SetText("")
  self:TitleUpdate()
  self:updateCoolTime()
end

local group_3 = nil
TitleInfo.SetConsolePadGroup = function(self)
  -- function num : 0_5 , upvalues : group_3
  Panel_Window_CharInfo_Status:deleteConsoleUIGroup(1)
  Panel_Window_CharInfo_Status:deleteConsoleUIGroup(2)
  Panel_Window_CharInfo_Status:deleteConsoleUIGroup(3)
  Panel_Window_CharInfo_Status:deleteConsoleUIGroup(4)
  Panel_Window_CharInfo_Status:deleteConsoleUIGroup(5)
  local group_1 = Panel_Window_CharInfo_Status:addConsoleUIGroup(1, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  local group_2 = Panel_Window_CharInfo_Status:addConsoleUIGroup(2, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_NOTEVENT)
  group_3 = Panel_Window_CharInfo_Status:addConsoleUIGroup(3, (CppEnums.PA_CONSOLE_UI_CONTROL_TYPE).eCONSOLE_UI_CONTROL_TYPE_LIST2)
  group_1:addControl(0, 0, 4, 1, (self.Category_BTN)[0])
  group_1:addControl(1, 0, 4, 1, (self.Category_BTN)[1])
  group_1:addControl(2, 0, 4, 1, (self.Category_BTN)[2])
  group_1:addControl(3, 0, 4, 1, (self.Category_BTN)[3])
  group_2:addControl(0, 0, 4, 1, (self.titleSubject_Btn)[0])
  group_2:addControl(1, 0, 4, 1, (self.titleSubject_Btn)[1])
  group_2:addControl(2, 0, 4, 1, (self.titleSubject_Btn)[2])
  group_2:addControl(3, 0, 4, 1, (self.titleSubject_Btn)[3])
end

CharInfoMouseUpScroll = function()
  -- function num : 0_6 , upvalues : TitleInfo
  local scroll = ((TitleInfo.list2):GetVScroll()):GetControlButton()
  ;
  (TitleInfo.list2):MouseUpScroll(scroll)
end

CharInfoMouseDownScroll = function()
  -- function num : 0_7 , upvalues : TitleInfo
  local scroll = ((TitleInfo.list2):GetVScroll()):GetControlButton()
  ;
  (TitleInfo.list2):MouseDownScroll(scroll)
end

TitleInfo.registEventHandler = function(self)
  -- function num : 0_8
  for idx = 0, 3 do
    ((self.Category_BTN)[idx]):addInputEvent("Mouse_LUp", "TitleInfo_SetCategory( " .. idx .. " )")
    ;
    ((self.titleSubject_Btn)[idx]):addInputEvent("Mouse_LUp", "TitleInfo_SetCategory( " .. idx .. " )")
    ;
    ((self.Category_BTN)[idx]):addInputEvent("Mouse_On", "HandleMouseEvent_CategoryDesc( " .. idx .. ", true )")
    ;
    ((self.Category_BTN)[idx]):addInputEvent("Mouse_Out", "HandleMouseEvent_CategoryDesc( " .. idx .. ", false )")
  end
  ;
  (self.list2):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "CharacterInfo_Title_ListControlCreate")
  ;
  (self.list2):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
end

HandleMouseEvent_CategoryDesc = function(descType, isOn)
  -- function num : 0_9 , upvalues : TitleInfo
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
  -- function num : 0_10 , upvalues : TitleInfo
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
  self:TitleUpdate()
  self:updateCoolTime()
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

CharacterInfo_Title_ListControlCreate = function(content, key)
  -- function num : 0_14 , upvalues : TitleInfo, group_3
  local self = TitleInfo
  local titleIndex = Int64toInt32(key)
  local titleWrapper = ToClient_GetTitleStaticStatusWrapper(titleIndex)
  if titleWrapper == nil then
    return 
  end
  local titleBG = (UI.getChildControl)(content, "List2_Static_TitleList_TitleBG")
  titleBG:setNotImpactScrollEvent(true)
  local titleName = (UI.getChildControl)(content, "List2_StaticText_TitleList_Title")
  local titleSet = (UI.getChildControl)(content, "List2_Button_SetTitle")
  group_3:addControl(0, titleIndex, 2, self.CurrentCategoryCount, titleBG)
  group_3:addControl(1, titleIndex, 2, self.CurrentCategoryCount, titleSet)
  if titleWrapper:isAcquired() == true then
    titleBG:SetIgnore(false)
    titleBG:addInputEvent("Mouse_LUp", "HandleClick_ShowDescription(" .. self.CurrentCategoryIdx .. ", " .. titleIndex .. " )")
    titleName:SetShow(true)
    titleName:SetText(titleWrapper:getName())
    titleSet:SetShow(true)
    titleSet:addInputEvent("Mouse_LUp", "HandleClick_TitleSet(" .. self.CurrentCategoryIdx .. ", " .. titleIndex .. " )")
    if ToClient_IsAppliedTitle(titleWrapper:getKey()) then
      titleSet:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TITLE_RELEASE"))
    else
      titleSet:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CHARACTERINFO_TITLE_APPLICATION"))
    end
  else
    titleBG:SetIgnore(false)
    titleName:SetShow(true)
    titleName:SetText("<PAColor0xFF444444>" .. titleWrapper:getName() .. "<PAOldColor>")
    titleBG:addInputEvent("Mouse_LUp", "HandleClick_ShowDescription(" .. self.CurrentCategoryIdx .. "," .. titleIndex .. ")")
    titleSet:SetShow(false)
    group_3:deleteControl(titleIndex * 2 + 1)
  end
end

TitleInfo:Initialize()
TitleInfo:registEventHandler()
TitleInfo:registMessageHandler()

