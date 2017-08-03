-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\houseinfo\panel_new_housecontrol.luac 

-- params : ...
-- function num : 0
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_PP = CppEnums.PAUIMB_PRIORITY
local VCK = CppEnums.VirtualKeyCode
eHouseUseGroupType = CppEnums.eHouseUseType
Panel_HouseControl:SetShow(false)
Panel_HouseControl:setMaskingChild(true)
Panel_HouseControl:setGlassBackground(true)
Panel_HouseControl:RegisterShowEventFunc(true, "Panel_HouseControl_ShowAni()")
Panel_HouseControl:RegisterShowEventFunc(false, "Panel_HouseControl_HideAni()")
local Panel_HouseControl_Value_HouseKey = nil
Panel_HouseControl_ShowAni = function()
  -- function num : 0_0
  Panel_HouseControl:SetAlpha(0)
  ;
  (UIAni.AlphaAnimation)(1, Panel_HouseControl, 0, 0.2)
end

Panel_HouseControl_HideAni = function()
  -- function num : 0_1
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_HouseControl, 0, 0.15)
  aniInfo:SetHideAtEnd(true)
end

local houseInfoSS = nil
local waitingCancelWorkerNo = {}
HousePanel_Default_PosY = {_UseType_Title = 0, _UseType_Frame = 0, _UseType_Scroll = 0, _WorkList_Title = 0, _WorkList_Frame = 0, _WorkList_Scroll = 0, _Manage_Title = 0, _Manage_Frame = 0, _Image_Title = 0, _Image_Frame = 0, _Progress_Title = 0, _Progress_Frame = 0, _Info_Size = 0, _Adjust_Size = 0}
HouseControlManager = {_win_Close = (UI.getChildControl)(Panel_HouseControl, "Button_Win_Close"), _buttonQuestion = (UI.getChildControl)(Panel_HouseControl, "Button_Question"), _txt_House_Title = (UI.getChildControl)(Panel_HouseControl, "StaticText_Title"), _txt_UseType_Title = (UI.getChildControl)(Panel_HouseControl, "StaticText_UseType_Title"), _controlBG = (UI.getChildControl)(Panel_HouseControl, "Static_HouseControl_BG"), _scrollBar = (UI.getChildControl)(Panel_HouseControl, "Scroll_ScrollBar"), _scrollBarButton = nil, 
_gradeIconList = {}
, _houseInfo = nil, _houseKey = 0, _clickedUseTypeButton = false, _clickedUseType = 0, _clickedIndex = 0, _currentUseType = 0, 
_itemCheck = {}
, _offsetIndex = 0, _Panel_SizeY = 0, _isUsable = nil, _currentLevel = nil, _UseType_Desc = nil, _useTypeName = nil}
local template = {_button = (UI.getChildControl)(Panel_HouseControl, "Button_Smithy"), _grade = (UI.getChildControl)(Panel_HouseControl, "Button_Smithy_1"), _grade_Mask = (UI.getChildControl)(Panel_HouseControl, "Static_Smithy_Mask"), _onUpgrade = (UI.getChildControl)(Panel_HouseControl, "Static_A_Construction"), _UseTypeIcon = (UI.getChildControl)(Panel_HouseControl, "Static_MakedUseTypeIcon")}
local contributePlus = (UI.getChildControl)(Panel_HouseControl, "Static_ContributePlus")
local contributeMinus = (UI.getChildControl)(Panel_HouseControl, "Static_ContributeMinus")
local contentsViewcount = 7
HouseControlManager_buttonList = {}
HouseWorkListSection = {
bgList = {}
, 
borderList = {}
, 
overList = {}
, 
iconList = {}
, 
levelList = {}
, 
levelList_nonCraft = {}
, 
guideList = {}
, viewCount = 4, viewCount_Craft = 4, viewCount_nonCraft = 8, viewIndex = 0, contentCount = 0, collumMax = 5, currentHouseUseType = 0, currentReceipeKey = 0, currentLevel = 0, workCount = 0, maxCount = 0, minCount = 0, 
realTable = {}
, 
realIndex = {}
, Frame = (UI.getChildControl)(Panel_HouseControl, "Static_WorkList_BG"), scrollButton = nil, Title = (UI.getChildControl)(Panel_HouseControl, "StaticText_WorkList_Title"), BG = (UI.getChildControl)(Panel_HouseControl, "Button_WorkList"), BG_Border = (UI.getChildControl)(Panel_HouseControl, "Static_WorkList_Border"), BG_Over = (UI.getChildControl)(Panel_HouseControl, "Static_WorkList_Over"), level = (UI.getChildControl)(Panel_HouseControl, "StaticText_WorkList_Level"), level_nonCraft = (UI.getChildControl)(Panel_HouseControl, "StaticText_WorkList_Level_nonCraft"), guide = (UI.getChildControl)(Panel_HouseControl, "StaticText_WorkList_Guide"), guide_MyHouse = (UI.getChildControl)(Panel_HouseControl, "StaticText_MyHouse_Guide"), icon = (UI.getChildControl)(Panel_HouseControl, "Static_WorkList_Icon"), scroll = (UI.getChildControl)(Panel_HouseControl, "WorkList_ScrollBar")}
local HouseInfoSection = {_BG = (UI.getChildControl)(Panel_HouseControl, "Static_HouseInfo_BG"), _Name = (UI.getChildControl)(Panel_HouseControl, "StaticText_HouseInfo_Name"), _Desc = (UI.getChildControl)(Panel_HouseControl, "StaticText_HouseInfo_Desc"), _UseType_Icon = (UI.getChildControl)(Panel_HouseControl, "Static_HouseInfo_UseType_Icon"), _UseType_Name = (UI.getChildControl)(Panel_HouseControl, "StaticText_HouseInfo_UseType_Name"), _UseType_Desc = (UI.getChildControl)(Panel_HouseControl, "StaticText_HouseInfo_UseType_Desc")}
local HouseImageSection = {_Title = (UI.getChildControl)(Panel_HouseControl, "StaticText_HouseImage_Title"), _BG = (UI.getChildControl)(Panel_HouseControl, "Static_HouseImage_BG"), _Image = (UI.getChildControl)(Panel_HouseControl, "Static_HouseImage_Image")}
local HouseManageSection = {_Title = (UI.getChildControl)(Panel_HouseControl, "StaticText_Cost_Title"), _BG = (UI.getChildControl)(Panel_HouseControl, "Static_CostBG"), _btn_Buy = (UI.getChildControl)(Panel_HouseControl, "Button_Buy_House"), _btn_CantBuy_LD = (UI.getChildControl)(Panel_HouseControl, "Button_CantBuy_LinkDead"), _btn_CantBuy_LowPoint = (UI.getChildControl)(Panel_HouseControl, "Button_CantBuy_LowPoint"), _btn_Sell = (UI.getChildControl)(Panel_HouseControl, "Button_Sell_House"), _btn_CantSell = (UI.getChildControl)(Panel_HouseControl, "Button_CantSell_House"), _cost_BuySell = (UI.getChildControl)(Panel_HouseControl, "StaticText_Cost_BuySell"), _cost_BuySellValue = (UI.getChildControl)(Panel_HouseControl, "StaticText_Cost_BuySell_Value"), _explore_Current = (UI.getChildControl)(Panel_HouseControl, "StaticText_CurrentPoint_Tilte"), _explore_CurrentValue = (UI.getChildControl)(Panel_HouseControl, "StaticText_CurrentPoint_Value"), _btn_Change = (UI.getChildControl)(Panel_HouseControl, "Button_ChangeUseType"), _ChangeMax = (UI.getChildControl)(Panel_HouseControl, "Button_ChangeUseType_Max"), _time_Change = (UI.getChildControl)(Panel_HouseControl, "StaticText_ChangeTime"), _time_ChangeValue = (UI.getChildControl)(Panel_HouseControl, "StaticText_ChangeTime_Value"), _cost_Change = (UI.getChildControl)(Panel_HouseControl, "StaticText_ChangeCost"), _cost_ChangeValue = (UI.getChildControl)(Panel_HouseControl, "StaticText_ChangeCost_Value"), _cost_MyMoney = (UI.getChildControl)(Panel_HouseControl, "StaticText_MyMoney"), _cost_MyMoneyValue = (UI.getChildControl)(Panel_HouseControl, "StaticText_MyMoney_Value"), _btn_ManageWork = (UI.getChildControl)(Panel_HouseControl, "Button_ManageWork"), _BottomPosY = 0, _needTime = -1}
;
(HouseManageSection._ChangeMax):SetEnable(false)
;
(HouseManageSection._ChangeMax):SetMonoTone(true)
local HouseProgressSection = {_Title = (UI.getChildControl)(Panel_HouseControl, "StaticText_ProgressSection_Title"), _BG = (UI.getChildControl)(Panel_HouseControl, "Static_ProgressSection_BG"), _WorkName = (UI.getChildControl)(Panel_HouseControl, "StaticText_WorkName"), _Icon_BG = (UI.getChildControl)(Panel_HouseControl, "Static_Working_IconBG"), _Icon_Working = (UI.getChildControl)(Panel_HouseControl, "Static_Working_Icon"), _Icon_UseType = (UI.getChildControl)(Panel_HouseControl, "Static_UseType_Icon"), _Progress_BG = (UI.getChildControl)(Panel_HouseControl, "Static_WorkingProgress_BG"), _Progress = (UI.getChildControl)(Panel_HouseControl, "Progress2_Working"), _Progress_OnGoing = (UI.getChildControl)(Panel_HouseControl, "Progress2_OnGoing"), _ProgressText_1 = (UI.getChildControl)(Panel_HouseControl, "StaticText_ProgressTxt_1"), _ProgressText_2 = (UI.getChildControl)(Panel_HouseControl, "StaticText_ProgressTxt_2"), _ProgressText_Value = (UI.getChildControl)(Panel_HouseControl, "StaticText_Progress_Value"), _RemainTime = (UI.getChildControl)(Panel_HouseControl, "StaticText_leftTime"), _RemainTime_Vlaue = (UI.getChildControl)(Panel_HouseControl, "StaticText_leftTime_Vlaue"), _OnGoingText = (UI.getChildControl)(Panel_HouseControl, "StaticText_OnGoing_Text"), _OnGoingText_Vlaue = (UI.getChildControl)(Panel_HouseControl, "StaticText_OnGoing_Value"), _Btn_CancelWork = (UI.getChildControl)(Panel_HouseControl, "Button_cancelWork"), _Btn_LargCraft = (UI.getChildControl)(Panel_HouseControl, "Button_LargeCraft"), _Btn_Immediately = (UI.getChildControl)(Panel_HouseControl, "Button_MakeImmediately"), _workType = nil, _worker = nil, 
_workerNo = {}
, _saveProgress = 0, _saveIcon = nil, _workingProgress = 0, _remainTime = 0, _updateCount = 0, isFale_Init = false, _itemKey_Tooltip = nil}
;
(HouseProgressSection._Btn_Immediately):SetShow(false)
-- DECOMPILER ERROR at PC583: Confused about usage of register: R18 in 'UnsetPending'

HousePanel_Default_PosY.savePosition = function(self)
  -- function num : 0_2 , upvalues : HouseManageSection, HouseImageSection, HouseProgressSection, HouseInfoSection
  self._UseType_Title = (HouseControlManager._txt_UseType_Title):GetPosY()
  self._UseType_Frame = (HouseControlManager._controlBG):GetPosY()
  self._UseType_Scroll = (HouseControlManager._scrollBar):GetPosY()
  self._WorkList_Title = (HouseWorkListSection.Title):GetPosY()
  self._WorkList_Frame = (HouseWorkListSection.Frame):GetPosY()
  self._WorkList_Scroll = (HouseWorkListSection.scroll):GetPosY()
  self._Manage_Title = (HouseManageSection._Title):GetPosY()
  self._Manage_Frame = (HouseManageSection._BG):GetPosY()
  self._Image_Title = (HouseImageSection._Title):GetPosY()
  self._Image_Frame = (HouseImageSection._BG):GetPosY()
  self._Progress_Title = (HouseProgressSection._Title):GetPosY()
  self._Progress_Frame = (HouseProgressSection._BG):GetPosY()
  self._Info_Size = (HouseInfoSection._BG):GetSizeY()
end

HousePanel_Default_PosY:savePosition()
-- DECOMPILER ERROR at PC592: Confused about usage of register: R18 in 'UnsetPending'

HousePanel_Default_PosY.SetPosition = function(self)
  -- function num : 0_3 , upvalues : HouseManageSection, HouseImageSection, HouseProgressSection
  (HouseControlManager._txt_UseType_Title):SetPosY(self._UseType_Title + self._Adjust_Size)
  ;
  (HouseControlManager._controlBG):SetPosY(self._UseType_Frame + self._Adjust_Size)
  ;
  (HouseControlManager._scrollBar):SetPosY(self._UseType_Scroll + self._Adjust_Size)
  ;
  (HouseWorkListSection.Title):SetPosY(self._WorkList_Title + self._Adjust_Size)
  ;
  (HouseWorkListSection.Frame):SetPosY(self._WorkList_Frame + self._Adjust_Size)
  ;
  (HouseWorkListSection.scroll):SetPosY(self._WorkList_Scroll + self._Adjust_Size)
  ;
  (HouseManageSection._Title):SetPosY(self._Manage_Title + self._Adjust_Size)
  ;
  (HouseManageSection._BG):SetPosY(self._Manage_Frame + self._Adjust_Size)
  ;
  (HouseImageSection._Title):SetPosY(self._Image_Title + self._Adjust_Size)
  ;
  (HouseImageSection._BG):SetPosY(self._Image_Frame + self._Adjust_Size)
  ;
  (HouseProgressSection._Title):SetPosY(self._Progress_Title + self._Adjust_Size)
  ;
  (HouseProgressSection._BG):SetPosY(self._Progress_Frame + self._Adjust_Size)
  Panel_HouseControl:SetSize(Panel_HouseControl:GetSizeX(), (HouseImageSection._BG):GetPosY() + (HouseImageSection._BG):GetSizeY() + 20)
  Panel_HouseControl:SetEnableArea(3, 3, 640, Panel_HouseControl:GetSizeY() - 4)
end

FGlobal_Reset_HousePanelPos = function()
  -- function num : 0_4
  local PosX = (getScreenSizeX() - Panel_HouseControl:GetSizeX()) / 2
  local PosY = (getScreenSizeY() - Panel_HouseControl:GetSizeY()) / 2
  Panel_HouseControl:SetPosX(PosX)
  Panel_HouseControl:SetPosY(PosY)
end

FGlobal_Set_HousePanelPos_ForWorldmapTutorial = function()
  -- function num : 0_5
  Panel_HouseControl:SetPosX((getScreenSizeX() - Panel_HouseControl:GetSizeX()) / 2)
  Panel_HouseControl:SetPosY(getScreenSizeY() - Panel_HouseControl:GetSizeY() - getScreenSizeY() * 0.05)
end

FGlobal_Set_HousePanelPos = function(_panel)
  -- function num : 0_6
  if _panel == nil then
    return 
  end
  local PosX = _panel:GetPosX()
  local PosY = _panel:GetPosY()
  Panel_HouseControl:SetPosX(PosX)
  Panel_HouseControl:SetPosY(PosY)
end

local GetBottomPos = function(control)
  -- function num : 0_7
  if control == nil then
    (UI.ASSERT)(false, "GetBottomPos(control) , control nil")
    return 
  end
  return control:GetPosY() + control:GetSizeY()
end

Set_HouseUseType_Texture_BG = function(_control)
  -- function num : 0_8
  local useType = HouseControlManager._currentGroupType
  local _Target = _control
  if useType == 1 then
    local path = "new_ui_common_forlua/Window/HouseInfo/HouseInfo_01.dds"
    HouseProgressSection_SetBaseTextureUV(_Target, path, 1, 137, 626, 204)
  else
    do
      if useType == 2 then
        local path = "new_ui_common_forlua/Window/HouseInfo/HouseInfo_01.dds"
        HouseProgressSection_SetBaseTextureUV(_Target, path, 1, 273, 626, 340)
      else
        do
          if useType == 3 then
            local path = "new_ui_common_forlua/Window/HouseInfo/HouseInfo_01.dds"
            HouseProgressSection_SetBaseTextureUV(_Target, path, 1, 341, 626, 408)
          else
            do
              if useType == 4 then
                local path = "new_ui_common_forlua/Window/HouseInfo/HouseInfo_01.dds"
                HouseProgressSection_SetBaseTextureUV(_Target, path, 1, 69, 626, 136)
              else
                do
                  if useType == 5 then
                    local path = "new_ui_common_forlua/Window/HouseInfo/HouseInfo_01.dds"
                    HouseProgressSection_SetBaseTextureUV(_Target, path, 1, 69, 626, 136)
                  else
                    do
                      if useType == 6 then
                        local path = "new_ui_common_forlua/Window/HouseInfo/HouseInfo_01.dds"
                        HouseProgressSection_SetBaseTextureUV(_Target, path, 1, 69, 626, 136)
                      else
                        do
                          if useType == 7 then
                            local path = "new_ui_common_forlua/Window/HouseInfo/HouseInfo_01.dds"
                            HouseProgressSection_SetBaseTextureUV(_Target, path, 1, 69, 626, 136)
                          else
                            do
                              if useType == 8 then
                                local path = "new_ui_common_forlua/Window/HouseInfo/HouseInfo_01.dds"
                                HouseProgressSection_SetBaseTextureUV(_Target, path, 1, 69, 626, 136)
                              else
                                do
                                  if useType == 9 then
                                    local path = "new_ui_common_forlua/Window/HouseInfo/HouseInfo_01.dds"
                                    HouseProgressSection_SetBaseTextureUV(_Target, path, 1, 69, 626, 136)
                                  else
                                    do
                                      if useType == 10 then
                                        local path = "new_ui_common_forlua/Window/HouseInfo/HouseInfo_01.dds"
                                        HouseProgressSection_SetBaseTextureUV(_Target, path, 1, 69, 626, 136)
                                      else
                                        do
                                          if useType == 11 then
                                            local path = "new_ui_common_forlua/Window/HouseInfo/HouseInfo_01.dds"
                                            HouseProgressSection_SetBaseTextureUV(_Target, path, 1, 205, 626, 272)
                                          else
                                            do
                                              if useType == 12 then
                                                local path = "new_ui_common_forlua/Window/HouseInfo/HouseInfo_01.dds"
                                                HouseProgressSection_SetBaseTextureUV(_Target, path, 1, 69, 626, 136)
                                              else
                                                do
                                                  if useType == 13 then
                                                    local path = "new_ui_common_forlua/Window/HouseInfo/HouseInfo_01.dds"
                                                    HouseProgressSection_SetBaseTextureUV(_Target, path, 1, 409, 626, 476)
                                                  else
                                                    do
                                                      if useType == 14 then
                                                        local path = "new_ui_common_forlua/Window/HouseInfo/HouseInfo_01.dds"
                                                        HouseProgressSection_SetBaseTextureUV(_Target, path, 1, 409, 626, 476)
                                                      else
                                                        do
                                                          if useType == 15 then
                                                            local path = "new_ui_common_forlua/Window/HouseInfo/HouseInfo_01.dds"
                                                            HouseProgressSection_SetBaseTextureUV(_Target, path, 1, 69, 626, 136)
                                                          else
                                                            do
                                                              if useType == 16 then
                                                                local path = "new_ui_common_forlua/Window/HouseInfo/HouseInfo_01.dds"
                                                                HouseProgressSection_SetBaseTextureUV(_Target, path, 1, 69, 626, 136)
                                                              else
                                                                do
                                                                  if useType == 17 then
                                                                    local path = "new_ui_common_forlua/Window/HouseInfo/HouseInfo_01.dds"
                                                                    HouseProgressSection_SetBaseTextureUV(_Target, path, 1, 477, 626, 544)
                                                                  else
                                                                    do
                                                                      if useType == 18 then
                                                                        local path = "new_ui_common_forlua/Window/HouseInfo/HouseInfo_01.dds"
                                                                        HouseProgressSection_SetBaseTextureUV(_Target, path, 1, 477, 626, 544)
                                                                      else
                                                                        do
                                                                          if useType == 19 then
                                                                            local path = "new_ui_common_forlua/Window/HouseInfo/HouseInfo_01.dds"
                                                                            HouseProgressSection_SetBaseTextureUV(_Target, path, 1, 477, 626, 544)
                                                                          else
                                                                            do
                                                                              if useType == 20 then
                                                                                local path = "new_ui_common_forlua/Window/HouseInfo/HouseInfo_01.dds"
                                                                                HouseProgressSection_SetBaseTextureUV(_Target, path, 1, 477, 626, 544)
                                                                              else
                                                                                do
                                                                                  if useType == 21 then
                                                                                    local path = "new_ui_common_forlua/Window/HouseInfo/HouseInfo_01.dds"
                                                                                    HouseProgressSection_SetBaseTextureUV(_Target, path, 1, 477, 626, 544)
                                                                                  else
                                                                                    do
                                                                                      if useType == 22 then
                                                                                        local path = "new_ui_common_forlua/Window/HouseInfo/HouseInfo_01.dds"
                                                                                        HouseProgressSection_SetBaseTextureUV(_Target, path, 1, 477, 626, 544)
                                                                                      else
                                                                                        do
                                                                                          if useType == 23 then
                                                                                            local path = "new_ui_common_forlua/Window/HouseInfo/HouseInfo_01.dds"
                                                                                            HouseProgressSection_SetBaseTextureUV(_Target, path, 1, 477, 626, 544)
                                                                                          else
                                                                                            do
                                                                                              if useType == 0 then
                                                                                                local path = "new_ui_common_forlua/Window/HouseInfo/HouseInfo_01.dds"
                                                                                                HouseProgressSection_SetBaseTextureUV(_Target, path, 1, 1, 626, 68)
                                                                                              else
                                                                                                do
                                                                                                  local path = "new_ui_common_forlua/Window/HouseInfo/HouseInfo_01.dds"
                                                                                                  HouseProgressSection_SetBaseTextureUV(_Target, path, 1, 545, 626, 612)
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
      end
    end
  end
end

HouseInfoSection.init = function(self)
  -- function num : 0_9 , upvalues : UI_TM, HouseInfoSection
  (self._Name):SetText(HouseControlManager._feature1)
  ;
  (self._Desc):SetAutoResize(true)
  ;
  (self._Desc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self._Desc):SetText(HouseControlManager._feature2)
  Set_HouseUseType_Texture_Icon(HouseInfoSection._UseType_Icon)
  ;
  (self._UseType_Name):SetText(HouseControlManager._useTypeName)
  ;
  (self._UseType_Desc):SetAutoResize(true)
  ;
  (self._UseType_Desc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  -- DECOMPILER ERROR at PC43: Confused about usage of register: R1 in 'UnsetPending'

  HouseControlManager._UseType_Desc = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_USETYPE_DESC_EMPTY")
  -- DECOMPILER ERROR at PC59: Confused about usage of register: R1 in 'UnsetPending'

  if HouseControlManager._currentUseType > -1 then
    HouseControlManager._UseType_Desc = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_USETYPE_DESC_" .. tostring(HouseControlManager._currentUseType))
  end
  ;
  (self._UseType_Desc):SetText(HouseControlManager._UseType_Desc)
  Set_HouseUseType_Texture_BG(HouseInfoSection._BG)
  -- DECOMPILER ERROR at PC76: Confused about usage of register: R1 in 'UnsetPending'

  HousePanel_Default_PosY._Adjust_Size = (self._BG):GetSizeY() - HousePanel_Default_PosY._Info_Size
  HousePanel_Default_PosY:SetPosition()
end

HouseImageSection.init = function(self)
  -- function num : 0_10
  (self._BG):AddChild(self._Image)
  Panel_HouseControl:RemoveControl(self._Image)
end

HouseImageSection:init()
HouseImageSection.setImage = function(self, houseInfo)
  -- function num : 0_11
  (self._Image):ChangeTextureInfoName(HouseControlManager._screenShotPath)
  ;
  (self._Image):SetPosX(((self._BG):GetSizeX() - (self._Image):GetSizeX()) / 2)
  ;
  (self._Image):SetPosY(((self._BG):GetSizeY() - (self._Image):GetSizeY()) / 2)
  ;
  (self._Image):SetShow(true)
end

FGlobal_AddChild = function(_panel, _parent, _child)
  -- function num : 0_12
  _parent:AddChild(_child)
  _panel:RemoveControl(_child)
  local _parent_Span = _parent:GetSpanSize()
  local _child_Span = _child:GetSpanSize()
  _child:SetSpanSize(_child_Span.x - _parent_Span.x, _child_Span.y - _parent_Span.y)
end

local _copy_Control = function(_parent, _child, index, _param, rowIndex, collumIndex)
  -- function num : 0_13
  _child[index] = (UI.createControl)(_param._type, _parent, tostring(_param._name) .. tostring(rowIndex) .. "_" .. tostring(collumIndex))
  CopyBaseProperty(_param._template, _child[index])
  _spanX = _param._spanX + _param._gapX * (collumIndex - 1)
  _spanY = _param._spanY + _param._gapY * (rowIndex - 1)
  ;
  (_child[index]):SetSpanSize(_spanX, _spanY)
  ;
  (_child[index]):SetShow(true)
  ;
  (_child[index]):SetEnable(true)
end

local _find_Control = function(_uiBase, _target)
  -- function num : 0_14
  for key,vlaue in pairs(_uiBase) do
    if tostring(key) == _target then
      return vlaue
    end
  end
end

FGlobal_Set_Table_Control = function(_uiBase, _targetName, _gapName, isRow, isCollum)
  -- function num : 0_15 , upvalues : _find_Control, _copy_Control
  local _parent = _uiBase._BG
  local _parent_Span = _parent:GetSpanSize()
  local _target = _find_Control(_uiBase, _targetName)
  local _template = _find_Control(_uiBase._Template, _targetName)
  local _gapBase = _find_Control(_uiBase._Template, _gapName)
  local _name = _template:GetID() .. "_"
  local _GapX = (_uiBase._Template)._collum_PosX_Gap
  if _GapX == nil then
    _GapX = 0
  end
  local _GapY = (_uiBase._Template)._row_PosY_Gap
  if _GapY == nil then
    _GapY = 0
  end
  local _Param = {_type = _template:GetType(), _name = _name, _template = _template, _spanX = (_template:GetSpanSize()).x - _parent_Span.x, _spanY = (_template:GetSpanSize()).y - _parent_Span.y, _gapX = _gapBase:GetSizeX() + _GapX, _gapY = _gapBase:GetSizeY() + _GapY}
  _template:SetShow(false)
  local index = 1
  if isRow then
    local _rowMax = (_uiBase._Template)._rowMax
    for rowIndex = 1, _rowMax do
      if isCollum then
        local _collumMax = (_uiBase._Template)._collumMax
        for collumIndex = 1, _collumMax do
          _copy_Control(_parent, _target, index, _Param, rowIndex, collumIndex)
          index = index + 1
        end
      else
        do
          do
            _copy_Control(_parent, _target, index, _Param, rowIndex, 1)
            index = index + 1
            -- DECOMPILER ERROR at PC95: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC95: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC95: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  else
    do
      if isCollum then
        local _collumMax = (_uiBase._Template)._collumMax
        for collumIndex = 1, _collumMax do
          _copy_Control(_parent, _target, index, _Param, 1, collumIndex)
          index = index + 1
        end
      end
    end
  end
end

FGlobal_Clear_Control = function(_uiBase)
  -- function num : 0_16
  for key,value in pairs(_uiBase) do
    value:SetShow(false)
  end
end

local currentLevel = 0
local isMaxLevel = false
local currentLevelSelect = -1
local selectType = -1
-- DECOMPILER ERROR at PC634: Confused about usage of register: R25 in 'UnsetPending'

HouseControlManager.initialize = function(self)
  -- function num : 0_17 , upvalues : HouseManageSection, contributeMinus, contributePlus, template, contentsViewcount, UI_PUCT
  self._scrollBarButton = (UI.getChildControl)(self._scrollBar, "ScrollBar_CtrlButton")
  ;
  (self._win_Close):addInputEvent("Mouse_LUp", "FGlobal_CloseHouseControl()")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelHouseControl\" )")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelHouseControl\", \"true\")")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelHouseControl\", \"false\")")
  ;
  (HouseManageSection._btn_Buy):addInputEvent("Mouse_LUp", "handleClickedHouseControlBuyHouse()")
  ;
  (HouseManageSection._btn_CantBuy_LD):addInputEvent("Mouse_LUp", "handleClicked_Check_PrevHouse(true)")
  ;
  (HouseManageSection._btn_Sell):addInputEvent("Mouse_LUp", "handleClickedHouseControlSellHouse()")
  ;
  (HouseManageSection._btn_CantSell):addInputEvent("Mouse_LUp", "handleClicked_Check_NextHouse(true)")
  ;
  (HouseManageSection._btn_ManageWork):addInputEvent("Mouse_LUp", "handleClickedHouseControlDoWorkHouse()")
  ;
  (HouseManageSection._btn_Change):addInputEvent("Mouse_LUp", "handleClickedHouseControlChangeStateHouse()")
  ;
  (HouseManageSection._btn_Buy):AddChild(contributeMinus)
  ;
  (HouseManageSection._btn_Sell):AddChild(contributePlus)
  Panel_HouseControl:RemoveControl(contributeMinus)
  Panel_HouseControl:RemoveControl(contributePlus)
  ;
  (self._controlBG):addInputEvent("Mouse_UpScroll", "HouseControlManager:updateScroll(true)")
  ;
  (self._controlBG):addInputEvent("Mouse_DownScroll", "HouseControlManager:updateScroll(false)")
  ;
  (self._scrollBar):addInputEvent("Mouse_UpScroll", "HouseControlManager:updateScroll(true)")
  ;
  (self._scrollBar):addInputEvent("Mouse_DownScroll", "HouseControlManager:updateScroll(false)")
  ;
  (self._scrollBar):addInputEvent("Mouse_LPress", "HouseControlManager:updateScrollPos()")
  ;
  (self._scrollBarButton):addInputEvent("Mouse_UpScroll", "HouseControlManager:updateScroll(true)")
  ;
  (self._scrollBarButton):addInputEvent("Mouse_DownScroll", "HouseControlManager:updateScroll(false)")
  ;
  (self._scrollBarButton):addInputEvent("Mouse_LPress", "HouseControlManager:updateScrollPos()")
  local type_posYgap = 1
  local type_PosX = ((template._button):GetSpanSize()).x - ((self._controlBG):GetSpanSize()).x
  local type_PosY = ((template._button):GetSpanSize()).y - ((self._controlBG):GetSpanSize()).y
  for index = 1, contentsViewcount do
    local uigroup = {
ui = {}
}
    -- DECOMPILER ERROR at PC149: Confused about usage of register: R9 in 'UnsetPending'

    HouseControlManager_buttonList[index] = uigroup
    uigroup._index = index
    local button = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_RADIOBUTTON, self._controlBG, "Static_Button_" .. index)
    CopyBaseProperty(template._button, button)
    button:SetPosX(type_PosX)
    button:SetPosY(type_PosY)
    button:SetShow(true)
    button:addInputEvent("Mouse_LUp", "handleClickedHouseControlSetUseType(" .. index .. ")")
    button:addInputEvent("Mouse_UpScroll", "HouseControlManager:updateScroll(true)")
    button:addInputEvent("Mouse_DownScroll", "HouseControlManager:updateScroll(false)")
    -- DECOMPILER ERROR at PC190: Confused about usage of register: R10 in 'UnsetPending'

    ;
    (uigroup.ui)._button = button
    type_PosY = type_PosY + button:GetSizeY() + type_posYgap
    local onUpgrade_PosX = ((template._onUpgrade):GetSpanSize()).x - ((template._button):GetSpanSize()).x
    local onUpgrade_PosY = ((template._onUpgrade):GetSpanSize()).y - ((template._button):GetSpanSize()).y
    local onUpgrade = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, button, "Static_onUpgrade_" .. index)
    CopyBaseProperty(template._onUpgrade, onUpgrade)
    onUpgrade:SetPosX(onUpgrade_PosX)
    onUpgrade:SetPosY(onUpgrade_PosY)
    onUpgrade:SetShow(false)
    onUpgrade:ResetVertexAni()
    uigroup._onUpgrade = onUpgrade
    local UseTypeIcon_PosX = ((template._UseTypeIcon):GetSpanSize()).x - ((template._button):GetSpanSize()).x
    local UseTypeIcon_PosY = ((template._UseTypeIcon):GetSpanSize()).y - ((template._button):GetSpanSize()).y
    local UseTypeIcon = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, button, "Static_UseTypeIcon_" .. index)
    CopyBaseProperty(template._UseTypeIcon, UseTypeIcon)
    UseTypeIcon:SetPosX(UseTypeIcon_PosX)
    UseTypeIcon:SetPosY(UseTypeIcon_PosY)
    uigroup._UseTypeIcon = UseTypeIcon
    -- DECOMPILER ERROR at PC288: Confused about usage of register: R16 in 'UnsetPending'

    ;
    (uigroup.ui)._grade = {}
    uigroup._grade_Mask = {}
    local grade_PosX = ((template._grade):GetSpanSize()).x - ((template._button):GetSpanSize()).x
    local grade_PosY = ((template._grade):GetSpanSize()).y - ((template._button):GetSpanSize()).y
    local grade_posXgap = 1
    for level = 1, 5 do
      local grade = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_BUTTON, button, "Static_Grade_" .. index .. "_" .. level)
      local grade_Mask = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, button, "Static_Grade_Mask_" .. index .. "_" .. level)
      CopyBaseProperty(template._grade, grade)
      CopyBaseProperty(template._grade_Mask, grade_Mask)
      grade:SetPosX(grade_PosX)
      grade:SetPosY(grade_PosY)
      grade_Mask:SetPosX(grade_PosX)
      grade_Mask:SetPosY(grade_PosY)
      grade:SetShow(true)
      grade_Mask:SetShow(false)
      grade:addInputEvent("Mouse_LUp", "handleClickedHouseControlSetUseType(" .. index .. ")")
      grade:addInputEvent("Mouse_UpScroll", "HouseControlManager:updateScroll(true)")
      grade:addInputEvent("Mouse_DownScroll", "HouseControlManager:updateScroll(false)")
      grade:ActiveMouseEventEffect(true)
      -- DECOMPILER ERROR at PC388: Confused about usage of register: R25 in 'UnsetPending'

      ;
      ((uigroup.ui)._grade)[level] = grade
      -- DECOMPILER ERROR at PC390: Confused about usage of register: R25 in 'UnsetPending'

      ;
      (uigroup._grade_Mask)[level] = grade_Mask
      grade_PosX = grade_PosX + grade:GetSizeX() + grade_posXgap
    end
    uigroup.update = function(self, houseInfoStaticStatusWrapper)
    -- function num : 0_17_0
    local realIndex = HouseControlManager._offsetIndex + self._index - 1
    if realIndex < 0 or houseInfoStaticStatusWrapper:getReceipeCount() <= realIndex then
      ((self.ui)._button):SetShow(false)
      return 
    end
    local houseInfoCraftWrapper = houseInfoStaticStatusWrapper:getHouseCraftWrapperByIndex(realIndex)
    self:uicontrol(houseInfoCraftWrapper:getLevel(), houseInfoCraftWrapper:getReciepeName())
    ;
    ((self.ui)._button):SetShow(true)
    if not ((HouseControlManager_buttonList[self._index])._onUpgrade):GetShow() then
      ((HouseControlManager_buttonList[self._index])._UseTypeIcon):SetShow(true)
    end
    HouseControlManager:UseTypeIconTexture(self._index, houseInfoCraftWrapper:getGroupType())
  end

    uigroup.uiTextureControl = function(self, currentLevel, isSameReceipe)
    -- function num : 0_17_1
    for key,value in pairs((self.ui)._grade) do
      if value:GetShow() then
        value:ChangeTextureInfoName("new_ui_common_forlua/window/houseinfo/housecontrol_00.dds")
        local x1, y1, x2, y2 = nil, nil, nil, nil
        if key <= currentLevel and isSameReceipe then
          x1 = setTextureUV_Func(value, 1, 52, 19, 70)
        else
          -- DECOMPILER ERROR at PC36: Overwrote pending register: R11 in 'AssignReg'

          -- DECOMPILER ERROR at PC37: Overwrote pending register: R10 in 'AssignReg'

          -- DECOMPILER ERROR at PC38: Overwrote pending register: R9 in 'AssignReg'

          x1 = setTextureUV_Func(value, 1, 33, 19, 51)
        end
        ;
        (value:getBaseTexture()):setUV(x1, y1, x2, y2)
        value:setRenderTexture(value:getBaseTexture())
      end
    end
  end

    uigroup.updateRentHouse = function(self, houseInfoStaticStatusWrapper, rentHouseWrapper)
    -- function num : 0_17_2
    local realIndex = HouseControlManager._offsetIndex + self._index - 1
    local currentLevel = 0
    local receipeKeyRaw = -1
    if rentHouseWrapper ~= nil and rentHouseWrapper:isSet() then
      currentLevel = rentHouseWrapper:getLevel()
      receipeKeyRaw = rentHouseWrapper:getType()
    end
    if receipeKeyRaw == 0 and ToClient_IsMyLiveHouse(HouseControlManager._houseKey) == false then
      currentLevel = 0
    end
    do
      local isSameReceipe = receipeKeyRaw == houseInfoStaticStatusWrapper:getReceipeByIndex(realIndex)
      self:uiTextureControl(currentLevel, isSameReceipe)
      -- DECOMPILER ERROR: 1 unprocessed JMP targets
    end
  end

    uigroup.uicontrol = function(self, maxLevel, name)
    -- function num : 0_17_3
    for key,value in pairs((self.ui)._grade) do
      local isShow = key <= maxLevel
      value:SetShow(isShow)
    end
    ;
    ((self.ui)._button):SetText(name)
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end

    uigroup.SetTextureUV = function(self, pData, pX1, pY1, pX2, pY2)
    -- function num : 0_17_4
    pData:ChangeTextureInfoName("new_ui_common_forlua/window/houseinfo/housecontrol_00.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(pData, pX1, pY1, pX2, pY2)
    ;
    (pData:getBaseTexture()):setUV(x1, y1, x2, y2)
    pData:setRenderTexture(pData:getBaseTexture())
  end

    uigroup.getGroupType = function(self, houseInfoStaticStatusWrapper)
    -- function num : 0_17_5
    local realIndex = HouseControlManager._offsetIndex + self._index - 1
    return houseInfoStaticStatusWrapper:getGroupTypeByIndex(realIndex)
  end

    uigroup.SetCheck = function(self, isCheck)
    -- function num : 0_17_6
    for key,value in pairs(self.ui) do
      if key ~= "_grade" then
        value:SetCheck(isCheck)
      end
    end
  end

    uigroup.SetIgnore = function(self, isIgnore)
    -- function num : 0_17_7
    for key,value in pairs(self.ui) do
      if key == "_grade" then
        for key,gradeValue in pairs(value) do
          gradeValue:SetIgnore(isIgnore)
        end
      else
        do
          do
            value:SetIgnore(isIgnore)
            -- DECOMPILER ERROR at PC19: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC19: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC19: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end

  end
  for key,value in pairs(template) do
    (UI.deleteControl)(value)
  end
end

HouseControlManager:initialize()
-- DECOMPILER ERROR at PC640: Confused about usage of register: R25 in 'UnsetPending'

HouseControlManager.clear = function(self)
  -- function num : 0_18
  for key,value in pairs(HouseControlManager_buttonList) do
    (value._onUpgrade):SetShow(false)
    ;
    (value._UseTypeIcon):SetShow(false)
    ;
    ((value.ui)._button):SetShow(false)
    ;
    ((value.ui)._button):ResetVertexAni()
    ;
    ((value.ui)._button):SetAlpha(1)
    for _key,_value in pairs(value._grade_Mask) do
      _value:SetShow(false)
    end
  end
end

-- DECOMPILER ERROR at PC644: Confused about usage of register: R25 in 'UnsetPending'

HouseControlManager.updateScroll = function(self, isUp)
  -- function num : 0_19 , upvalues : contentsViewcount
  if HouseControlManager._isSet == false then
    return 
  end
  local count = HouseControlManager._receipeCount - contentsViewcount
  if count < 0 then
    count = 0
  end
  -- DECOMPILER ERROR at PC22: Confused about usage of register: R3 in 'UnsetPending'

  if isUp then
    HouseControlManager._offsetIndex = (math.max)(HouseControlManager._offsetIndex - 1, 0)
  else
    -- DECOMPILER ERROR at PC32: Confused about usage of register: R3 in 'UnsetPending'

    HouseControlManager._offsetIndex = (math.min)(HouseControlManager._offsetIndex + 1, count)
  end
  ;
  (self._scrollBar):SetControlPos(HouseControlManager._offsetIndex / count)
  HouseControlManager:clear()
  HouseControlManager:UpdateMyHouse()
  HouseControlManager:UpdateCommon()
end

-- DECOMPILER ERROR at PC648: Confused about usage of register: R25 in 'UnsetPending'

HouseControlManager.updateScrollPos = function(self)
  -- function num : 0_20 , upvalues : contentsViewcount
  local pos = (self._scrollBar):GetControlPos()
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R2 in 'UnsetPending'

  if HouseControlManager._receipeCount < contentsViewcount then
    HouseControlManager._offsetIndex = 0
  else
    -- DECOMPILER ERROR at PC20: Confused about usage of register: R2 in 'UnsetPending'

    HouseControlManager._offsetIndex = (math.floor)((HouseControlManager._receipeCount - contentsViewcount) * pos)
  end
  HouseControlManager:clear()
  HouseControlManager:UpdateMyHouse()
  HouseControlManager:UpdateCommon()
end

-- DECOMPILER ERROR at PC651: Confused about usage of register: R25 in 'UnsetPending'

HouseControlManager.SetIgnore = function(self, isIgnore)
  -- function num : 0_21
  for key,value in pairs(HouseControlManager_buttonList) do
    value:SetIgnore(isIgnore)
  end
end

-- DECOMPILER ERROR at PC654: Confused about usage of register: R25 in 'UnsetPending'

HouseControlManager.SetCheck = function(self, IsCheck)
  -- function num : 0_22
  for key,value in pairs(HouseControlManager_buttonList) do
    value:SetCheck(IsCheck)
  end
end

-- DECOMPILER ERROR at PC657: Confused about usage of register: R25 in 'UnsetPending'

HouseControlManager.UseTypeIconTexture = function(self, index, useType)
  -- function num : 0_23
  local control = (HouseControlManager_buttonList[index])._UseTypeIcon
  local pos = {}
  if useType == 1 then
    pos = {189, 265, 207, 283}
  else
    if useType == 2 then
      pos = {208, 265, 226, 283}
    else
      if useType == 3 then
        pos = {227, 265, 245, 283}
      else
        if useType == 4 then
          pos = {246, 265, 264, 283}
        else
          if useType == 5 then
            pos = {265, 265, 283, 283}
          else
            if useType == 6 then
              pos = {284, 265, 302, 283}
            else
              if useType == 7 then
                pos = {303, 265, 321, 283}
              else
                if useType == 8 then
                  pos = {322, 265, 340, 283}
                else
                  if useType == 9 then
                    pos = {170, 284, 188, 302}
                  else
                    if useType == 10 then
                      pos = {189, 284, 207, 302}
                    else
                      if useType == 11 then
                        pos = {208, 284, 226, 302}
                      else
                        if useType == 12 then
                          pos = {227, 284, 245, 302}
                        else
                          if useType == 13 then
                            pos = {246, 284, 264, 302}
                          else
                            if useType == 14 then
                              pos = {265, 284, 283, 302}
                            else
                              if useType == 15 then
                                pos = {284, 284, 302, 302}
                              else
                                if useType == 16 then
                                  pos = {303, 284, 321, 302}
                                else
                                  if useType == 17 then
                                    pos = {322, 284, 340, 302}
                                  else
                                    if useType == 18 then
                                      pos = {227, 303, 245, 321}
                                    else
                                      if useType == 19 then
                                        pos = {170, 303, 188, 321}
                                      else
                                        if useType == 20 then
                                          pos = {208, 303, 226, 321}
                                        else
                                          if useType == 21 then
                                            pos = {189, 303, 207, 321}
                                          else
                                            if useType == 22 then
                                              pos = {246, 303, 264, 321}
                                            else
                                              if useType == 23 then
                                                pos = {265, 303, 283, 321}
                                              else
                                                if useType == 0 then
                                                  pos = {170, 265, 188, 283}
                                                else
                                                  pos = {0, 0, 0, 0}
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
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  control:ChangeTextureInfoName("/New_UI_Common_forLua/Window/HouseInfo/HouseIcon.dds")
  local x1, y1, x2, y2 = setTextureUV_Func(control, pos[1], pos[2], pos[3], pos[4])
  ;
  (control:getBaseTexture()):setUV(x1, y1, x2, y2)
  control:setRenderTexture(control:getBaseTexture())
end

-- DECOMPILER ERROR at PC660: Confused about usage of register: R25 in 'UnsetPending'

HouseControlManager.WorkinUseTypeIconTexture = function(self, index, useType)
  -- function num : 0_24
  local control = (HouseControlManager_buttonList[index])._onUpgrade
  local path = ""
  if useType == 1 then
    path = useType .. ".dds"
  else
    if useType == 2 then
      path = useType .. ".dds"
    else
      if useType == 3 then
        path = useType .. ".dds"
      else
        if useType == 4 then
          path = useType .. ".dds"
        else
          if useType == 5 then
            path = useType .. ".dds"
          else
            if useType == 6 then
              path = useType .. ".dds"
            else
              if useType == 7 then
                path = useType .. ".dds"
              else
                if useType == 8 then
                  path = useType .. ".dds"
                else
                  if useType == 9 then
                    path = useType .. ".dds"
                  else
                    if useType == 10 then
                      path = useType .. ".dds"
                    else
                      if useType == 11 then
                        path = useType .. ".dds"
                      else
                        if useType == 12 then
                          path = useType .. ".dds"
                        else
                          if useType == 13 then
                            path = useType .. ".dds"
                          else
                            if useType == 14 then
                              path = useType .. ".dds"
                            else
                              if useType == 15 then
                                path = useType .. ".dds"
                              else
                                if useType == 16 then
                                  path = useType .. ".dds"
                                else
                                  if useType == 17 then
                                    path = useType .. ".dds"
                                  else
                                    if useType == 18 then
                                      path = useType .. ".dds"
                                    else
                                      if useType == 19 then
                                        path = useType .. ".dds"
                                      else
                                        if useType == 20 then
                                          path = useType .. ".dds"
                                        else
                                          if useType == 21 then
                                            path = useType .. ".dds"
                                          else
                                            if useType == 22 then
                                              path = useType .. ".dds"
                                            else
                                              if useType == 23 then
                                                path = useType .. ".dds"
                                              else
                                                if useType == 0 then
                                                  path = useType .. ".dds"
                                                else
                                                  path = useType .. ".dds"
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
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  control:ChangeTextureInfoName("/New_UI_Common_forLua/Window/HouseInfo/useType/" .. path)
  control:setRenderTexture(control:getBaseTexture())
end

-- DECOMPILER ERROR at PC664: Confused about usage of register: R25 in 'UnsetPending'

HouseControlManager.SetEnableBuyButton = function(self, bEnable)
  -- function num : 0_25 , upvalues : HouseManageSection
  (HouseManageSection._btn_Buy):SetEnable(bEnable)
  ;
  (HouseManageSection._btn_Buy):SetDisableColor(not bEnable)
end

-- DECOMPILER ERROR at PC668: Confused about usage of register: R25 in 'UnsetPending'

HouseControlManager.AddEffectBuyButton = function(self, effectName, isLoop, offsetX, offsetY)
  -- function num : 0_26 , upvalues : HouseManageSection
  (HouseManageSection._btn_Buy):AddEffect(effectName, isLoop, offsetX, offsetY)
end

-- DECOMPILER ERROR at PC673: Confused about usage of register: R25 in 'UnsetPending'

HouseControlManager.EraseAllEffectBuyButton = function(self)
  -- function num : 0_27 , upvalues : HouseManageSection
  (HouseManageSection._btn_Buy):EraseAllEffect()
end

-- DECOMPILER ERROR at PC678: Confused about usage of register: R25 in 'UnsetPending'

HouseControlManager.SetEnableSellButton = function(self, bEnable)
  -- function num : 0_28 , upvalues : HouseManageSection
  (HouseManageSection._btn_Sell):SetEnable(bEnable)
  ;
  (HouseManageSection._btn_Sell):SetDisableColor(not bEnable)
end

-- DECOMPILER ERROR at PC683: Confused about usage of register: R25 in 'UnsetPending'

HouseControlManager.AddEffectSellButton = function(self, effectName, isLoop, offsetX, offsetY)
  -- function num : 0_29 , upvalues : HouseManageSection
  (HouseManageSection._btn_Sell):AddEffect(effectName, isLoop, offsetX, offsetY)
end

-- DECOMPILER ERROR at PC688: Confused about usage of register: R25 in 'UnsetPending'

HouseControlManager.EraseAllEffectSellButton = function(self)
  -- function num : 0_30 , upvalues : HouseManageSection
  (HouseManageSection._btn_Sell):EraseAllEffect()
end

-- DECOMPILER ERROR at PC693: Confused about usage of register: R25 in 'UnsetPending'

HouseControlManager.SetEnableChangeUseTypeButton = function(self, bEnable)
  -- function num : 0_31 , upvalues : HouseManageSection
  (HouseManageSection._btn_Change):SetEnable(bEnable)
  ;
  (HouseManageSection._btn_Change):SetDisableColor(not bEnable)
end

-- DECOMPILER ERROR at PC697: Confused about usage of register: R25 in 'UnsetPending'

HouseControlManager.FindGroupTypeUiButtonByHouseKey = function(self, houseKey, groupType)
  -- function num : 0_32
  local houseInfoStaticStatusWrapper = ToClient_GetHouseInfoStaticStatusWrapper(houseKey)
  if houseInfoStaticStatusWrapper:isSet() == false then
    return 
  end
  for key,value in pairs(HouseControlManager_buttonList) do
    if groupType == value:getGroupType(houseInfoStaticStatusWrapper) then
      return (value.ui)._button
    end
  end
end

-- DECOMPILER ERROR at PC701: Confused about usage of register: R25 in 'UnsetPending'

HouseControlManager.AddEffectGroupTypeButtonByHouseKey = function(self, houseKey, groupType, effectName, isLoop, offsetX, offsetY)
  -- function num : 0_33
  local uiButton = self:FindGroupTypeUiButtonByHouseKey(houseKey, groupType)
  if uiButton ~= nil then
    uiButton:AddEffect(effectName, isLoop, offsetX, offsetY)
  end
end

-- DECOMPILER ERROR at PC705: Confused about usage of register: R25 in 'UnsetPending'

HouseControlManager.EraseAllEffectGroupTypeButtonByHouseKey = function(self, houseKey, groupType)
  -- function num : 0_34
  local uiButton = self:FindGroupTypeUiButtonByHouseKey(houseKey, groupType)
  if uiButton ~= nil then
    uiButton:EraseAllEffect()
  end
end

local handleClickedHouseControlBuyHouseContinue = function()
  -- function num : 0_35
  ToClient_RequestBuyHouse(HouseControlManager._houseKey, HouseControlManager._clickedUseType, 1)
  if Panel_House_SellBuy_Condition:GetShow() == true and Panel_HouseControl:GetShow() == true then
    WorldMapPopupManager:pop()
  end
  PaGlobal_TutorialManager:handleClickedHouseControlBuyHouseContinue()
end

handleClickedHouseControlBuyHouse = function()
  -- function num : 0_36 , upvalues : handleClickedHouseControlBuyHouseContinue, UI_PP
  if workerManager_CheckWorkingOtherChannelAndMsg() then
    return 
  end
  local houseInfoStaticStatusWrapper = ToClient_GetHouseInfoStaticStatusWrapper(HouseControlManager._houseKey)
  if houseInfoStaticStatusWrapper:isSet() == false then
    return 
  end
  local nextRentHouseLevel = 1
  local realIndex = houseInfoStaticStatusWrapper:getIndexByReceipeKey(HouseControlManager._clickedUseType)
  local houseInfoCraftWrapper = houseInfoStaticStatusWrapper:getHouseCraftWrapperByIndex(realIndex)
  local listCount = houseInfoStaticStatusWrapper:getNeedItemListCount(HouseControlManager._clickedUseType, nextRentHouseLevel)
  local needTime_sec = houseInfoStaticStatusWrapper:getTransperTime(HouseControlManager._clickedUseType, nextRentHouseLevel, nextRentHouseLevel)
  local needTime = ((Util.Time).timeFormatting)(needTime_sec)
  local houseName = HouseControlManager._houseName
  local useTypeName = houseInfoCraftWrapper:getReciepeName()
  local itemExplain = ""
  itemExplain = itemExplain .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_NEEDPOINT", "needPoint", HouseControlManager._needExplorePoint) .. "\n"
  for index = 0, listCount - 1 do
    local itemKey = houseInfoStaticStatusWrapper:getNeedItemListItemKey(HouseControlManager._clickedUseType, nextRentHouseLevel, index)
    local itemName = (getItemEnchantStaticStatus(itemKey)):getName()
    local itemCount = houseInfoStaticStatusWrapper:getNeedItemListItemCount(HouseControlManager._clickedUseType, nextRentHouseLevel, index)
    -- DECOMPILER ERROR at PC77: Confused about usage of register: R17 in 'UnsetPending'

    ;
    (HouseControlManager._itemCheck)[index] = false
    for invenIndex = 0, inventory_getSize() - 1 do
      -- DECOMPILER ERROR at PC113: Confused about usage of register: R21 in 'UnsetPending'

      if getInventoryItem(invenIndex) ~= nil and itemKey:getItemKey() == (((getInventoryItem(invenIndex)):get()):getKey()):getItemKey() and itemCount <= ((getInventoryItem(invenIndex)):get()):getCount_s64() then
        (HouseControlManager._itemCheck)[index] = true
      end
    end
    local needCost = makeDotMoney(Int64toInt32(itemCount)) .. " " .. itemName
    itemExplain = itemExplain .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_NEEDCOST", "needCost", needCost) .. "\n"
  end
  itemExplain = itemExplain .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_NEEDTIME", "needTime", needTime)
  itemExplain = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_BUYHOUSE_CONTENT", "houseName", houseName, "useTypeName", useTypeName) .. "\n\n" .. itemExplain
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_BUYHOUSE_TITLE"), content = itemExplain, functionYes = handleClickedHouseControlBuyHouseContinue, functionCancel = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData, "top")
end

local houseUsingLayerFunctionList = {}
houseUsingLayerFunctionList.beforePop = function(self)
  -- function num : 0_37
  local houseInfoStaticWrapper = ToClient_GetHouseInfoStaticStatusWrapper(HouseControlManager._houseKey)
  local regionInfoWrapper = ToClient_getRegionInfoWrapperByWaypoint(houseInfoStaticWrapper:getParentNodeKey())
  if regionInfoWrapper ~= nil and (regionInfoWrapper:get()):isMainOrMinorTown() then
    warehouse_requestInfo(houseInfoStaticWrapper:getParentNodeKey())
  end
end

houseUsingLayerFunctionList.afterPop = function(self)
  -- function num : 0_38
end

handleClickedHouseControlDoWorkHouse = function()
  -- function num : 0_39 , upvalues : houseUsingLayerFunctionList
  if ToClient_IsUsable(HouseControlManager._houseKey) == false then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_CHANGESTATE_MESSAGE"))
  else
    local param = {_houseName = HouseControlManager._houseName, _useTypeName = HouseControlManager._useTypeName, _useType_Desc = HouseControlManager._UseType_Desc, _level = HouseControlManager._currentLevel, _useType = HouseControlManager._currentUseType, _houseKey = HouseControlManager._houseKey, _houseUseType = HouseControlManager._currentGroupType}
    if HouseControlManager._currentGroupType == 12 or HouseControlManager._currentGroupType == 13 or HouseControlManager._currentGroupType == 14 then
      FGLobal_PopupAdd(Panel_LargeCraft_WorkManager, houseUsingLayerFunctionList)
      FGlobal_LargeCraft_WorkManager_Open(FGlobal_SelectedHouseInfo(HouseControlManager._houseKey), param)
    else
      FGLobal_PopupAdd(Panel_RentHouse_WorkManager, houseUsingLayerFunctionList)
      FGlobal_RentHouse_WorkManager_Open(FGlobal_SelectedHouseInfo(HouseControlManager._houseKey), param)
    end
  end
end

FGLobal_PopupAdd = function(panel, addtionalFunctionList)
  -- function num : 0_40
  if panel:GetShow() == false then
    WorldMapPopupManager:increaseLayer(false, addtionalFunctionList)
    WorldMapPopupManager:push(panel, true)
  end
end

local handleClickedHouseControlSellHouseContinue = function()
  -- function num : 0_41
  local houseKey = HouseControlManager._houseKey
  ToClient_RequestReturnHouse(houseKey)
  WorldMapPopupManager:pop()
  PaGlobal_TutorialManager:handleClickedHouseControlSellHouseContinue(houseKey)
end

handleClickedHouseControlSellHouse = function()
  -- function num : 0_42 , upvalues : houseInfoSS, handleClickedHouseControlSellHouseContinue, UI_PP
  local workingcnt = ToClient_getHouseWorkingWorkerList(houseInfoSS)
  local returnPoint = HouseControlManager._needExplorePoint
  local houseName = HouseControlManager._houseName
  if ToClient_IsUsable(HouseControlManager._houseKey) == false then
    local sellHouseContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_SELLHOUSE_ONCHANGEUSETYPE", "houseName", houseName) .. "\n\n" .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_RETURNPOINT", "returnPoint", returnPoint)
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_SELLHOUSE_TITLE"), content = sellHouseContent, functionYes = handleClickedHouseControlSellHouseContinue, functionCancel = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData, "top")
  else
    do
      if workingcnt > 0 then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_SELLHOUSE_ONCRAFT"))
        return 
      else
        local sellHouseContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_SELLHOUSE_DEFAULT", "houseName", houseName) .. "\n\n" .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_RETURNPOINT", "returnPoint", returnPoint)
        local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_SELLHOUSE_TITLE"), content = sellHouseContent, functionYes = handleClickedHouseControlSellHouseContinue, functionCancel = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
        ;
        (MessageBox.showMessageBox)(messageboxData, "top")
      end
    end
  end
end

local handleClickedHouseControlChangeStateHouseContinue = function()
  -- function num : 0_43 , upvalues : Panel_HouseControl_Value_HouseKey
  local houseIndex = Panel_HouseControl_Value_HouseKey
  local rentHouseWrapper = ToClient_GetRentHouseWrapper(HouseControlManager._houseKey)
  local useType = rentHouseWrapper:getType()
  local level = 1
  if useType == HouseControlManager._clickedUseType and eHouseUseGroupType.Count ~= HouseControlManager._currentGroupType then
    level = rentHouseWrapper:getLevel() + 1
  end
  ToClient_RequestChangeHouseUseType(HouseControlManager._houseKey, HouseControlManager._clickedUseType, level)
end

handleClickedHouseControlChangeStateHouse = function()
  -- function num : 0_44 , upvalues : Panel_HouseControl_Value_HouseKey, handleClickedHouseControlChangeStateHouseContinue, UI_PP
  local rentHouseWrapper = ToClient_GetRentHouseWrapper(HouseControlManager._houseKey)
  local houseInfoStaticStatusWrapper = rentHouseWrapper:getStaticStatus()
  local useType = rentHouseWrapper:getType()
  local nextRentHouseLevel = 1
  if HouseControlManager._clickedUseType == useType and eHouseUseGroupType.Count ~= HouseControlManager._currentGroupType then
    nextRentHouseLevel = rentHouseWrapper:getLevel() + 1
  end
  local realIndex = houseInfoStaticStatusWrapper:getIndexByReceipeKey(HouseControlManager._clickedUseType)
  local houseInfoCraftWrapper = houseInfoStaticStatusWrapper:getHouseCraftWrapperByIndex(realIndex)
  local targetUseTypeName = houseInfoCraftWrapper:getReciepeName()
  realIndex = houseInfoStaticStatusWrapper:getIndexByReceipeKey(HouseControlManager._currentUseType)
  houseInfoCraftWrapper = houseInfoStaticStatusWrapper:getHouseCraftWrapperByIndex(realIndex)
  local currentUseTypeName = houseInfoCraftWrapper:getReciepeName()
  local rentHouseLevel = rentHouseWrapper:getLevel()
  local listCount = houseInfoStaticStatusWrapper:getNeedItemListCount(HouseControlManager._clickedUseType, nextRentHouseLevel)
  local needTime = ((Util.Time).timeFormatting)(houseInfoStaticStatusWrapper:getTransperTime(HouseControlManager._clickedUseType, nextRentHouseLevel, nextRentHouseLevel))
  local itemExplain = ""
  for index = 0, listCount - 1 do
    local itemKey = houseInfoStaticStatusWrapper:getNeedItemListItemKey(HouseControlManager._clickedUseType, nextRentHouseLevel, index)
    local itemName = (getItemEnchantStaticStatus(itemKey)):getName()
    local itemCount = houseInfoStaticStatusWrapper:getNeedItemListItemCount(HouseControlManager._clickedUseType, nextRentHouseLevel, index)
    Panel_HouseControl_Value_HouseKey = HouseControlManager._clickedUseType
    -- DECOMPILER ERROR at PC86: Confused about usage of register: R19 in 'UnsetPending'

    ;
    (HouseControlManager._itemCheck)[index] = false
    for invenIndex = 0, inventory_getSize() - 1 do
      -- DECOMPILER ERROR at PC122: Confused about usage of register: R23 in 'UnsetPending'

      if getInventoryItem(invenIndex) ~= nil and itemKey:getItemKey() == (((getInventoryItem(invenIndex)):get()):getKey()):getItemKey() and itemCount <= ((getInventoryItem(invenIndex)):get()):getCount_s64() then
        (HouseControlManager._itemCheck)[index] = true
      end
    end
    local needCost = Int64toInt32(itemCount) .. " " .. itemName
    itemExplain = itemExplain .. itemName .. " " .. Int64toInt32(itemCount) .. PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_COUNT") .. "\n"
  end
  itemExplain = itemExplain .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_NEEDTIME", "needTime", needTime)
  local HouseKey = HouseControlManager._houseKey
  local workingcnt = ToClient_getHouseWorkingWorkerList(houseInfoStaticStatusWrapper:get())
  local _title = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_CHANGESTATE_TITLE_1")
  if ToClient_IsUsable(HouseKey) == false then
    itemExplain = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_CHANGESTATE_CONTENT_1", "currentTypeName", currentUseTypeName, "targetTypeName", targetUseTypeName) .. "\n\n" .. itemExplain
  else
    if workingcnt > 0 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_CHANGESTATE_CONTENT_2"))
      return 
    else
      if targetUseTypeName == currentUseTypeName then
        itemExplain = PAGetStringParam3(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_CHANGESTATE_CONTENT_4", "currentTypeName", currentUseTypeName, "rentHouseLevel", rentHouseLevel, "nextLevel", rentHouseLevel + 1) .. "\n\n" .. itemExplain
        _title = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_CHANGESTATE_TITLE_2")
      else
        itemExplain = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_CHANGESTATE_CONTENT_3", "currentTypeName", currentUseTypeName, "targetTypeName", targetUseTypeName) .. "\n\n" .. itemExplain
      end
    end
  end
  local messageboxData = {title = _title, content = itemExplain, functionYes = handleClickedHouseControlChangeStateHouseContinue, functionCancel = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData, "top")
end

handleClickedHouseControlSetUseType = function(index)
  -- function num : 0_45 , upvalues : HouseManageSection
  local houseInfoStaticStatusWrapper = ToClient_GetHouseInfoStaticStatusWrapper(HouseControlManager._houseKey)
  if houseInfoStaticStatusWrapper:isSet() == false then
    return 
  end
  local realIndex = HouseControlManager._offsetIndex + index - 1
  local receipeKey = houseInfoStaticStatusWrapper:getReceipeByIndex(realIndex)
  local groupType = houseInfoStaticStatusWrapper:getGroupTypeByIndex(realIndex)
  local houseInfoCraftWrapper = houseInfoStaticStatusWrapper:getHouseCraftWrapperByIndex(realIndex)
  local maxLevel = houseInfoCraftWrapper:getLevel()
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R7 in 'UnsetPending'

  if HouseControlManager._clickedUseType ~= receipeKey then
    HouseControlManager._clickedUseType = receipeKey
    -- DECOMPILER ERROR at PC31: Confused about usage of register: R7 in 'UnsetPending'

    HouseControlManager._clickedUseTypeButton = true
    -- DECOMPILER ERROR at PC33: Confused about usage of register: R7 in 'UnsetPending'

    HouseControlManager._clickedGroupType = groupType
    HouseControlManager:clear()
    HouseControlManager:UpdateMyHouse()
    HouseControlManager:UpdateCommon()
    HouseManageSection:update_ChangeCost()
    HouseWorkListSection:updateFirstShow(groupType, receipeKey, maxLevel, true)
    PaGlobal_TutorialManager:handleClickedHouseControlSetUseType(index, groupType)
  end
end

-- DECOMPILER ERROR at PC743: Confused about usage of register: R29 in 'UnsetPending'

HouseControlManager.UpdateCommon = function(self)
  -- function num : 0_46 , upvalues : contentsViewcount
  local houseInfoStaticStatusWrapper = ToClient_GetHouseInfoStaticStatusWrapper(self._houseKey)
  if houseInfoStaticStatusWrapper == nil then
    return 
  end
  if houseInfoStaticStatusWrapper:isSet() == false then
    return 
  end
  local receipeCount = houseInfoStaticStatusWrapper:getReceipeCount()
  ;
  (UIScroll.SetButtonSize)(self._scrollBar, contentsViewcount, receipeCount)
  for key,value in pairs(HouseControlManager_buttonList) do
    value:update(houseInfoStaticStatusWrapper)
  end
  local rentHouseWrapper = ToClient_GetRentHouseWrapper(self._houseKey)
  if rentHouseWrapper == nil or rentHouseWrapper:isSet() == false then
    for key,value in pairs(HouseControlManager_buttonList) do
      value:updateRentHouse(houseInfoStaticStatusWrapper, nil)
    end
    return 
  end
  for key,value in pairs(HouseControlManager_buttonList) do
    value:updateRentHouse(houseInfoStaticStatusWrapper, rentHouseWrapper)
  end
end

-- DECOMPILER ERROR at PC748: Confused about usage of register: R29 in 'UnsetPending'

HouseControlManager.UpdateCheckTarget = function(self, houseInfoStaticStatusWrapper)
  -- function num : 0_47 , upvalues : HouseManageSection
  self:SetCheck(false)
  local clickedButton = HouseControlManager_buttonList[houseInfoStaticStatusWrapper:getIndexByReceipeKey(self._clickedUseType) - self._offsetIndex + 1]
  if clickedButton == nil then
    return 
  end
  local realIndex = houseInfoStaticStatusWrapper:getIndexByReceipeKey(self._clickedUseType)
  local houseInfoCraftWrapper = houseInfoStaticStatusWrapper:getHouseCraftWrapperByIndex(realIndex)
  ;
  (HouseManageSection._btn_Buy):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_BUYHOUSE_TITLE") .. " : " .. houseInfoCraftWrapper:getReciepeName())
  HouseManageSection:update_ChangeCost()
  ;
  ((clickedButton.ui)._button):SetCheck(true)
end

-- DECOMPILER ERROR at PC753: Confused about usage of register: R29 in 'UnsetPending'

HouseControlManager.UpdateEmptyHouse = function(self)
  -- function num : 0_48 , upvalues : HouseManageSection
  local houseInfoStaticStatusWrapper = ToClient_GetHouseInfoStaticStatusWrapper(self._houseKey)
  if houseInfoStaticStatusWrapper:isSet() == false then
    return 
  end
  local isPurchasable = houseInfoStaticStatusWrapper:isPurchasable(HouseControlManager._clickedGroupType)
  if isPurchasable and HouseControlManager._needExplorePoint <= ToClient_RequestGetMyExploredPoint() then
    (HouseManageSection._btn_Buy):SetShow(true)
    ;
    (HouseManageSection._btn_CantBuy_LowPoint):SetShow(false)
    ;
    (HouseManageSection._btn_CantBuy_LD):SetShow(false)
  else
    if isPurchasable and ToClient_RequestGetMyExploredPoint() < HouseControlManager._needExplorePoint then
      (HouseManageSection._btn_Buy):SetShow(false)
      ;
      (HouseManageSection._btn_CantBuy_LowPoint):SetShow(true)
      ;
      (HouseManageSection._btn_CantBuy_LD):SetShow(false)
    else
      ;
      (HouseManageSection._btn_Buy):SetShow(false)
      ;
      (HouseManageSection._btn_CantBuy_LowPoint):SetShow(false)
      ;
      (HouseManageSection._btn_CantBuy_LD):SetShow(true)
    end
  end
  ;
  (HouseManageSection._cost_BuySell):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_NEEDEXPLORE"))
  self:UpdateCheckTarget(houseInfoStaticStatusWrapper)
  ;
  (HouseManageSection._btn_Change):SetShow(false)
  ;
  (HouseManageSection._btn_Sell):SetShow(false)
  ;
  (HouseManageSection._btn_ManageWork):SetShow(false)
  ;
  (HouseManageSection._cost_BuySell):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_NEEDEXPLORE"))
end

local changeWorkDataList = {}
local isMaxLevel = false
-- DECOMPILER ERROR at PC760: Confused about usage of register: R31 in 'UnsetPending'

HouseControlManager.UpdateMyHouse = function(self)
  -- function num : 0_49 , upvalues : HouseManageSection
  local houseInfoStaticStatusWrapper = ToClient_GetHouseInfoStaticStatusWrapper(self._houseKey)
  if houseInfoStaticStatusWrapper == nil then
    return 
  end
  if houseInfoStaticStatusWrapper:isSet() == false then
    return 
  end
  self:SetIgnore(false)
  self:SetCheck(false)
  local rentHouseWrapper = ToClient_GetRentHouseWrapper(self._houseKey)
  if rentHouseWrapper == nil then
    self:UpdateEmptyHouse()
    return 
  end
  self._currentUseType = rentHouseWrapper:getType()
  self._currentGroupType = rentHouseWrapper:getHouseUseType()
  if ToClient_IsMyLiveHouse(self._houseKey) == false and eHouseUseGroupType.Empty == self._currentGroupType then
    self._currentGroupType = eHouseUseGroupType.Count
  end
  local useType = nil
  if self._clickedUseTypeButton == true then
    useType = self._clickedUseType
  else
    useType = self._currentUseType
  end
  local index = houseInfoStaticStatusWrapper:getIndexByReceipeKey(useType) - HouseControlManager._offsetIndex
  if HouseControlManager_buttonList[index + 1] ~= nil then
    (((HouseControlManager_buttonList[index + 1]).ui)._button):SetCheck(true)
  end
  local workingcnt = ToClient_getHouseWorkingWorkerList(houseInfoStaticStatusWrapper:get())
  local index = houseInfoStaticStatusWrapper:getIndexByReceipeKey(self._currentUseType) - HouseControlManager._offsetIndex
  if HouseControlManager_buttonList[index + 1] ~= nil then
    if HouseControlManager._isUsable == false then
      local level = rentHouseWrapper:getLevel()
      ;
      (((HouseControlManager_buttonList[index + 1])._grade_Mask)[level]):SetShow(true)
    else
      do
        do
          if workingcnt > 0 then
            local index = houseInfoStaticStatusWrapper:getIndexByReceipeKey(self._currentUseType) - HouseControlManager._offsetIndex
            ;
            ((HouseControlManager_buttonList[index + 1])._onUpgrade):SetShow(true)
            HouseControlManager:WorkinUseTypeIconTexture(index + 1, self._currentGroupType)
            ;
            ((HouseControlManager_buttonList[index + 1])._UseTypeIcon):SetShow(false)
            ;
            (((HouseControlManager_buttonList[index + 1]).ui)._button):SetVertexAniRun("Ani_Color_New", true)
          end
          ;
          (HouseManageSection._cost_BuySell):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_WITHDRAWEXPLORE"))
          ;
          (HouseManageSection._btn_Buy):SetShow(false)
          local isMaxLevel = rentHouseWrapper:isMaxLevel()
          local receipeKeyRaw = rentHouseWrapper:getType()
          local realIndex = houseInfoStaticStatusWrapper:getIndexByReceipeKey(useType)
          local houseInfoCraftWrapper = houseInfoStaticStatusWrapper:getHouseCraftWrapperByIndex(realIndex)
          if self._clickedUseTypeButton == true and (self._clickedUseType ~= self._currentUseType or self._clickedGroupType ~= eHouseUseGroupType.Empty or self._currentGroupType == eHouseUseGroupType.Count) and houseInfoCraftWrapper ~= nil then
            (HouseManageSection._ChangeMax):SetShow(false)
            ;
            (HouseManageSection._btn_Change):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_CHANGESTATE_TITLE_1") .. " : " .. houseInfoCraftWrapper:getReciepeName())
            ;
            (HouseManageSection._btn_Change):SetShow(true)
            ;
            (HouseManageSection._btn_Change):EraseAllEffect()
            ;
            (HouseManageSection._btn_Change):AddEffect("UI_ButtonLineRight_WhiteLong", false, -10, -3)
          else
            if HouseControlManager._isUsable == true and isMaxLevel == false and eHouseUseGroupType.Empty ~= self._currentUseType then
              (HouseManageSection._ChangeMax):SetShow(false)
              ;
              (HouseManageSection._btn_Change):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_GRADEUP_TITLE"))
              ;
              (HouseManageSection._btn_Change):SetShow(true)
              ;
              (HouseManageSection._btn_Change):EraseAllEffect()
              ;
              (HouseManageSection._btn_Change):AddEffect("UI_ButtonLineRight_WhiteLong", false, -10, -3)
            else
              if HouseControlManager._isUsable == true and isMaxLevel == true then
                (HouseManageSection._btn_Change):SetShow(false)
                ;
                (HouseManageSection._ChangeMax):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_BTN_MAXLEVEL_1"))
                ;
                (HouseManageSection._ChangeMax):SetShow(true)
              else
                ;
                (HouseManageSection._btn_Change):SetShow(false)
                ;
                (HouseManageSection._ChangeMax):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_BTN_MAXLEVEL_2"))
                ;
                (HouseManageSection._ChangeMax):SetShow(true)
              end
            end
          end
          HouseManageSection:update_ChangeCost()
          if houseInfoStaticStatusWrapper:isSalable() then
            (HouseManageSection._btn_Sell):SetShow(true)
            ;
            (HouseManageSection._btn_CantSell):SetShow(false)
          else
            ;
            (HouseManageSection._btn_Sell):SetShow(false)
            ;
            (HouseManageSection._btn_CantSell):SetShow(true)
          end
          ;
          (HouseManageSection._cost_BuySell):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_WITHDRAWEXPLORE"))
          isMaxLevel = false
        end
      end
    end
  end
end

FGlobal_UpdateHouseControl = function(houseInfoSSWrapper)
  -- function num : 0_50 , upvalues : houseInfoSS, HouseManageSection, HouseImageSection, HouseInfoSection
  FGlobal_GrandWorldMap_SearchToWorldMapMode()
  houseInfoSS = houseInfoSSWrapper:get()
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

  HouseControlManager._houseKey = houseInfoSSWrapper:getHouseKey()
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R1 in 'UnsetPending'

  HouseControlManager._isUsable = ToClient_IsUsable(HouseControlManager._houseKey)
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

  HouseControlManager._feature1 = ToClient_getHouseFeature1(houseInfoSS)
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R1 in 'UnsetPending'

  HouseControlManager._feature2 = ToClient_getHouseFeature2(houseInfoSS)
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

  HouseControlManager._screenShotPath = ToClient_getScreenShotPath(houseInfoSS, 0)
  -- DECOMPILER ERROR at PC34: Confused about usage of register: R1 in 'UnsetPending'

  HouseControlManager._isSalable = houseInfoSSWrapper:isSalable()
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R1 in 'UnsetPending'

  HouseControlManager._isPurchasable = houseInfoSSWrapper:isPurchasable()
  -- DECOMPILER ERROR at PC42: Confused about usage of register: R1 in 'UnsetPending'

  HouseControlManager._needExplorePoint = houseInfoSSWrapper:getNeedExplorePoint()
  -- DECOMPILER ERROR at PC46: Confused about usage of register: R1 in 'UnsetPending'

  HouseControlManager._isSet = houseInfoSSWrapper:isSet()
  -- DECOMPILER ERROR at PC50: Confused about usage of register: R1 in 'UnsetPending'

  HouseControlManager._receipeCount = houseInfoSSWrapper:getReceipeCount()
  -- DECOMPILER ERROR at PC54: Confused about usage of register: R1 in 'UnsetPending'

  HouseControlManager._houseName = houseInfoSSWrapper:getName()
  -- DECOMPILER ERROR at PC56: Confused about usage of register: R1 in 'UnsetPending'

  HouseControlManager._clickedUseType = 0
  -- DECOMPILER ERROR at PC58: Confused about usage of register: R1 in 'UnsetPending'

  HouseControlManager._clickedUseTypeButton = false
  -- DECOMPILER ERROR at PC60: Confused about usage of register: R1 in 'UnsetPending'

  HouseControlManager._offsetIndex = 0
  ;
  (HouseControlManager._scrollBar):SetControlPos(0)
  HouseManageSection:Set()
  HouseImageSection:setImage()
  HouseWorkListSection:clear()
  HouseProgressSection_Hide()
  FGlobal_Hide_Tooltip_Work(nil, true)
  -- DECOMPILER ERROR at PC85: Confused about usage of register: R1 in 'UnsetPending'

  HouseControlManager._Panel_SizeY = Panel_HouseControl:GetSizeY()
  local rentHouse = ToClient_GetRentHouseWrapper(HouseControlManager._houseKey)
  -- DECOMPILER ERROR at PC99: Confused about usage of register: R2 in 'UnsetPending'

  if rentHouse ~= nil and rentHouse:isSet() == true then
    HouseControlManager._currentUseType = rentHouse:getType()
    -- DECOMPILER ERROR at PC103: Confused about usage of register: R2 in 'UnsetPending'

    HouseControlManager._currentLevel = rentHouse:getLevel()
    -- DECOMPILER ERROR at PC107: Confused about usage of register: R2 in 'UnsetPending'

    HouseControlManager._currentGroupType = rentHouse:getHouseUseType()
    -- DECOMPILER ERROR at PC111: Confused about usage of register: R2 in 'UnsetPending'

    HouseControlManager._clickedUseType = HouseControlManager._currentUseType
    -- DECOMPILER ERROR at PC115: Confused about usage of register: R2 in 'UnsetPending'

    HouseControlManager._clickedGroupType = HouseControlManager._currentGroupType
  else
    -- DECOMPILER ERROR at PC118: Confused about usage of register: R2 in 'UnsetPending'

    HouseControlManager._currentUseType = -1
    -- DECOMPILER ERROR at PC122: Confused about usage of register: R2 in 'UnsetPending'

    HouseControlManager._currentGroupType = eHouseUseGroupType.Count
    -- DECOMPILER ERROR at PC124: Confused about usage of register: R2 in 'UnsetPending'

    HouseControlManager._clickedUseType = 2
    -- DECOMPILER ERROR at PC126: Confused about usage of register: R2 in 'UnsetPending'

    HouseControlManager._clickedGroupType = 2
  end
  local realIndex = houseInfoSSWrapper:getIndexByReceipeKey(HouseControlManager._currentUseType)
  local houseInfoCraftWrapper = houseInfoSSWrapper:getHouseCraftWrapperByIndex(realIndex)
  -- DECOMPILER ERROR at PC139: Confused about usage of register: R4 in 'UnsetPending'

  if houseInfoCraftWrapper ~= nil then
    HouseControlManager._useTypeName = houseInfoCraftWrapper:getReciepeName()
  else
    -- DECOMPILER ERROR at PC147: Confused about usage of register: R4 in 'UnsetPending'

    HouseControlManager._useTypeName = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_TYPENAME_EMPTYHOUSE")
  end
  ;
  (HouseControlManager._txt_House_Title):SetText(HouseControlManager._houseName)
  HouseInfoSection:init()
  HouseControlManager:SetCheck(false)
  -- DECOMPILER ERROR at PC162: Confused about usage of register: R4 in 'UnsetPending'

  HouseControlManager._clickedUseTypeButton = true
  HouseControlManager:clear()
  if ToClient_IsMyHouse(HouseControlManager._houseKey) == true then
    HouseControlManager:UpdateMyHouse()
  else
    HouseControlManager:UpdateEmptyHouse()
  end
  HouseControlManager:UpdateCommon()
  if houseInfoSSWrapper:isSet() == false then
    return 
  end
  for realIdx = 0, HouseControlManager._receipeCount do
    if HouseControlManager._clickedUseType == houseInfoSSWrapper:getReceipeByIndex(realIdx) then
      local index = realIdx - HouseControlManager._offsetIndex + 1
      handleClickedHouseControlSetUseType(index)
      return 
    end
  end
end

FGlobal_CloseHouseControl = function()
  -- function num : 0_51
  FGlobal_WorldMapWindowEscape()
end

-- DECOMPILER ERROR at PC773: Confused about usage of register: R31 in 'UnsetPending'

HouseWorkListSection.initialize = function(self)
  -- function num : 0_52 , upvalues : UI_PUCT, UI_TM
  local bgPosX_Deafault = 13
  local bgPosX = bgPosX_Deafault
  local bgPosY = 3
  local iconPosX_Deafault = 16
  local iconPosX = iconPosX_Deafault
  local iconPosY = 6
  local gapX = 15
  local gapY = 6
  local coloumCount = 0
  local rowCount = 0
  self.contentCount = self.viewCount_Craft * self.collumMax
  for index = 0, self.contentCount - 1 do
    -- DECOMPILER ERROR at PC31: Confused about usage of register: R15 in 'UnsetPending'

    (self.bgList)[index] = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, self.Frame, "bgList_" .. tostring(index))
    CopyBaseProperty(self.BG, (self.bgList)[index])
    ;
    ((self.bgList)[index]):SetPosY(bgPosY)
    ;
    ((self.bgList)[index]):SetPosX(bgPosX)
    -- DECOMPILER ERROR at PC59: Confused about usage of register: R15 in 'UnsetPending'

    ;
    (self.borderList)[index] = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, self.Frame, "borderList_" .. tostring(index))
    CopyBaseProperty(self.BG_Border, (self.borderList)[index])
    ;
    ((self.borderList)[index]):SetPosY(bgPosY)
    ;
    ((self.borderList)[index]):SetPosX(bgPosX)
    -- DECOMPILER ERROR at PC87: Confused about usage of register: R15 in 'UnsetPending'

    ;
    (self.iconList)[index] = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, self.Frame, "iconList_" .. tostring(index))
    CopyBaseProperty(self.icon, (self.iconList)[index])
    ;
    ((self.iconList)[index]):SetPosX(iconPosX)
    ;
    ((self.iconList)[index]):SetPosY(iconPosY)
    -- DECOMPILER ERROR at PC115: Confused about usage of register: R15 in 'UnsetPending'

    ;
    (self.overList)[index] = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, self.Frame, "overList_" .. tostring(index))
    CopyBaseProperty(self.BG_Over, (self.overList)[index])
    ;
    ((self.overList)[index]):SetPosY(bgPosY + 2)
    ;
    ((self.overList)[index]):SetPosX(bgPosX + 3)
    coloumCount = coloumCount + 1
    if coloumCount == 5 then
      bgPosY = bgPosY + (self.icon):GetSizeY() + gapY
      bgPosX = bgPosX_Deafault
    else
      bgPosX = bgPosX + (self.icon):GetSizeX() + gapX
    end
    -- DECOMPILER ERROR at PC160: Confused about usage of register: R15 in 'UnsetPending'

    if coloumCount == 1 then
      (self.levelList)[rowCount] = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, self.Frame, "levelList_" .. tostring(rowCount))
      CopyBaseProperty(self.level, (self.levelList)[rowCount])
      ;
      ((self.levelList)[rowCount]):SetPosY(iconPosY + ((self.icon):GetSizeY() - (self.level):GetSizeY()) / 2)
    end
    if coloumCount == 5 then
      coloumCount = 0
      iconPosY = iconPosY + (self.icon):GetSizeY() + gapY
      iconPosX = iconPosX_Deafault
      rowCount = rowCount + 1
    else
      iconPosX = iconPosX + (self.icon):GetSizeX() + gapX
    end
    ;
    ((self.overList)[index]):addInputEvent("Mouse_UpScroll", "HouseWorkListSection:Scroll(true)")
    ;
    ((self.overList)[index]):addInputEvent("Mouse_DownScroll", "HouseWorkListSection:Scroll(false)")
    ;
    ((self.overList)[index]):addInputEvent("Mouse_On", "HouseWorkListSection_ShowTooltip(" .. index .. ")")
    ;
    ((self.overList)[index]):addInputEvent("Mouse_Out", "HouseWorkListSection_HideTooltip(" .. index .. ")")
    ;
    ((self.overList)[index]):addInputEvent("Mouse_LUp", "HandleClickedWorkListIcon(" .. index .. ")")
    local asdf = {_type = 10, icon = (self.overList)[index]}
    Panel_Tooltip_Item_SetPosition(index, asdf, "workListMilibogi")
  end
  local nonCraft_GapY = 4
  local nonCraft_PosY = nonCraft_GapY
  for index = 0, self.viewCount_nonCraft - 1 do
    -- DECOMPILER ERROR at PC264: Confused about usage of register: R17 in 'UnsetPending'

    (self.levelList_nonCraft)[index] = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, self.Frame, "levelList_nonCraft_" .. tostring(index))
    CopyBaseProperty(self.level_nonCraft, (self.levelList_nonCraft)[index])
    ;
    ((self.levelList_nonCraft)[index]):SetPosY(nonCraft_PosY)
    -- DECOMPILER ERROR at PC287: Confused about usage of register: R17 in 'UnsetPending'

    ;
    (self.guideList)[index] = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, self.Frame, "guideList_" .. tostring(index))
    CopyBaseProperty(self.guide, (self.guideList)[index])
    ;
    ((self.guideList)[index]):SetPosY(nonCraft_PosY)
    nonCraft_PosY = nonCraft_PosY + ((self.levelList_nonCraft)[index]):GetSizeY() + nonCraft_GapY
  end
  -- DECOMPILER ERROR at PC313: Confused about usage of register: R13 in 'UnsetPending'

  ;
  (self.guideList).MyHouse = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATICTEXT, self.Frame, "guideList_MyHouse")
  CopyBaseProperty(self.guide_MyHouse, (self.guideList).MyHouse)
  ;
  ((self.guideList).MyHouse):SetAutoResize(true)
  ;
  ((self.guideList).MyHouse):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  ((self.guideList).MyHouse):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_HELP_MYHOUSE"))
  ;
  ((self.guideList).MyHouse):SetPosX(((self.Frame):GetSizeX() - ((self.guideList).MyHouse):GetSizeX()) / 2)
  ;
  ((self.guideList).MyHouse):SetPosY(((self.Frame):GetSizeY() - ((self.guideList).MyHouse):GetSizeY()) / 2)
  ;
  (self.Frame):addInputEvent("Mouse_UpScroll", "HouseWorkListSection:Scroll(true)")
  self.scrollButton = (UI.getChildControl)(self.scroll, "Frame_ScrollBar_thumb")
  ;
  (self.Frame):addInputEvent("Mouse_DownScroll", "HouseWorkListSection:Scroll(false)")
  ;
  (self.Frame):SetIgnore(false)
  ;
  (self.scroll):addInputEvent("Mouse_UpScroll", "HouseWorkListSection:Scroll(true)")
  ;
  (self.scroll):addInputEvent("Mouse_DownScroll", "HouseWorkListSection:Scroll(false)")
  ;
  (self.scroll):addInputEvent("Mouse_LDown", "HouseWorkListSection:ScrollOnClick()")
  ;
  (self.scroll):addInputEvent("Mouse_LUp", "HouseWorkListSection:ScrollOnClick()")
  ;
  (self.scrollButton):addInputEvent("Mouse_UpScroll", "HouseWorkListSection:Scroll(true)")
  ;
  (self.scrollButton):addInputEvent("Mouse_DownScroll", "HouseWorkListSection:Scroll(false)")
  ;
  (self.scrollButton):addInputEvent("Mouse_LPress", "HouseWorkListSection:ScrollOnClick()")
  ;
  (self.icon):SetShow(false)
  ;
  (self.BG):SetShow(false)
end

HouseWorkListSection:initialize()
-- DECOMPILER ERROR at PC779: Confused about usage of register: R31 in 'UnsetPending'

HouseWorkListSection.clear = function(self)
  -- function num : 0_53
  for key,value in pairs(self.bgList) do
    value:SetShow(false)
  end
  for key,value in pairs(self.borderList) do
    value:SetShow(false)
  end
  for key,value in pairs(self.overList) do
    value:SetShow(false)
  end
  for key,value in pairs(self.iconList) do
    value:SetShow(false)
  end
  for key,value in pairs(self.levelList) do
    value:SetShow(false)
  end
  for key,value in pairs(self.levelList_nonCraft) do
    value:SetShow(false)
  end
  for key,value in pairs(self.guideList) do
    value:SetShow(false)
  end
  ;
  (self.scroll):SetShow(false)
end

-- DECOMPILER ERROR at PC783: Confused about usage of register: R31 in 'UnsetPending'

HouseWorkListSection.setRealTable = function(self, houseUseType, receipeKey, level, houseInfoStaticStatusWrapper)
  -- function num : 0_54
  self.realTable = {}
  self:getWorkList()
  self.workCount = ToClient_getHouseWorkableListByData(HouseControlManager._houseKey, receipeKey, level)
  local workCount = ToClient_getHouseWorkableListByDataOnlySize(receipeKey, 1, level)
  local collumIndex = 0
  local rowIndex = 0
  local indexLevel = 1
  local savedLevel = 0
  local levelCount = 0
  local levelUp = false
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R12 in 'UnsetPending'

  if workCount == 0 then
    (self.realTable).isCraft = false
    self.viewCount = self.viewCount_nonCraft
    for lv = 1, level do
      -- DECOMPILER ERROR at PC34: Confused about usage of register: R16 in 'UnsetPending'

      (self.realTable)[rowIndex] = {}
      -- DECOMPILER ERROR at PC37: Confused about usage of register: R16 in 'UnsetPending'

      ;
      ((self.realTable)[rowIndex]).level = lv
      rowIndex = rowIndex + 1
      -- DECOMPILER ERROR at PC41: Confused about usage of register: R16 in 'UnsetPending'

      ;
      (self.realTable)[rowIndex] = {}
      if eHouseUseGroupType.Lodging == houseUseType then
        local workerCount = houseInfoStaticStatusWrapper:getWorkerCount(lv)
        -- DECOMPILER ERROR at PC58: Confused about usage of register: R17 in 'UnsetPending'

        ;
        ((self.realTable)[rowIndex]).guide = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_LODGING2", "workerCount", workerCount)
      else
        do
          if eHouseUseGroupType.Depot == houseUseType then
            local extendWarehouseCount = houseInfoStaticStatusWrapper:getExtendWarehouseCount(lv)
            -- DECOMPILER ERROR at PC76: Confused about usage of register: R17 in 'UnsetPending'

            ;
            ((self.realTable)[rowIndex]).guide = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_DEPOT2", "extendWarehouseCount", extendWarehouseCount)
          else
            do
              if eHouseUseGroupType.Ranch == houseUseType then
                local extendStableCount = houseInfoStaticStatusWrapper:getExtendStableCount(lv)
                -- DECOMPILER ERROR at PC94: Confused about usage of register: R17 in 'UnsetPending'

                ;
                ((self.realTable)[rowIndex]).guide = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_RANCH2", "extendStableCount", extendStableCount)
              else
                do
                  do
                    -- DECOMPILER ERROR at PC97: Confused about usage of register: R16 in 'UnsetPending'

                    ;
                    (self.realTable).isCraft = nil
                    self.realTable = {}
                    rowIndex = 0
                    do break end
                    if lv < level then
                      rowIndex = rowIndex + 1
                    end
                    -- DECOMPILER ERROR at PC105: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC105: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC105: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC105: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC105: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC105: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC105: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC105: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                    -- DECOMPILER ERROR at PC105: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
            end
          end
        end
      end
    end
  else
    -- DECOMPILER ERROR at PC110: Confused about usage of register: R12 in 'UnsetPending'

    if workCount > 0 then
      (self.realTable).isCraft = true
      self.viewCount = self.viewCount_Craft
      for index = 0, workCount - 1 do
        -- DECOMPILER ERROR at PC127: Confused about usage of register: R16 in 'UnsetPending'

        if index == 0 or levelUp == true then
          if (self.realTable)[rowIndex] == nil then
            (self.realTable)[rowIndex] = {}
          end
          -- DECOMPILER ERROR at PC130: Confused about usage of register: R16 in 'UnsetPending'

          ;
          ((self.realTable)[rowIndex]).level = indexLevel
          rowIndex = rowIndex + 1
          levelUp = false
        end
        -- DECOMPILER ERROR at PC139: Confused about usage of register: R16 in 'UnsetPending'

        if (self.realTable)[rowIndex] == nil then
          (self.realTable)[rowIndex] = {}
        end
        -- DECOMPILER ERROR at PC148: Confused about usage of register: R16 in 'UnsetPending'

        if ((self.realTable)[rowIndex])[collumIndex] == nil then
          ((self.realTable)[rowIndex])[collumIndex] = {}
        end
        -- DECOMPILER ERROR at PC152: Confused about usage of register: R16 in 'UnsetPending'

        ;
        (((self.realTable)[rowIndex])[collumIndex]).index = index
        if indexLevel ~= savedLevel then
          levelCount = ToClient_getHouseWorkableListByDataOnlySize(receipeKey, 1, indexLevel) - 1
          savedLevel = indexLevel
        end
        if index == levelCount then
          levelUp = true
          collumIndex = self.collumMax
          indexLevel = indexLevel + 1
          if level < indexLevel then
            break
          end
        end
        if collumIndex < self.collumMax - 1 then
          collumIndex = collumIndex + 1
        else
          collumIndex = 0
          rowIndex = rowIndex + 1
        end
      end
    end
  end
  do
    self.viewIndex = 0
    self.maxCount = rowIndex + 1
    self.minCount = self.maxCount - self.viewCount
    if self.minCount < 0 then
      self.minCount = 0
    end
  end
end

-- DECOMPILER ERROR at PC787: Confused about usage of register: R31 in 'UnsetPending'

HouseWorkListSection.updateFirstShow = function(self, houseUseType, receipeKey, level, resetPos)
  -- function num : 0_55
  self.currentHouseUseType = houseUseType
  self.currentReceipeKey = receipeKey
  self.currentLevel = level
  local houseInfoStaticStatusWrapper = ToClient_GetHouseInfoStaticStatusWrapper(HouseControlManager._houseKey)
  if resetPos then
    self:setRealTable(houseUseType, receipeKey, level, houseInfoStaticStatusWrapper)
  end
  self:clear()
  local collumIndex = 0
  local rowIndex = self.viewIndex
  self.realIndex = {}
  if (self.realTable).isCraft == true then
    for index = 0, self.contentCount - 1 do
      if (self.realTable)[rowIndex] == nil then
        break
      end
      if ((self.realTable)[rowIndex]).level ~= nil and collumIndex == 0 then
        levelRow = (math.ceil)((index + 1) / self.collumMax) - 1
        ;
        ((self.levelList)[levelRow]):SetText(((self.realTable)[rowIndex]).level .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_HOUSEWORKLIST_HOUSE_LEVEL"))
        ;
        ((self.levelList)[levelRow]):SetShow(true)
        -- DECOMPILER ERROR at PC72: Confused about usage of register: R12 in 'UnsetPending'

        ;
        (self.realIndex)[index] = nil
      end
      -- DECOMPILER ERROR at PC83: Confused about usage of register: R12 in 'UnsetPending'

      if ((self.realTable)[rowIndex])[collumIndex] ~= nil then
        (self.realIndex)[index] = (((self.realTable)[rowIndex])[collumIndex]).index
        local realLevel = (((self.realTable)[rowIndex])[collumIndex]).level
        local esSSW = ToClient_getHouseDataWorkableItemExchangeByIndex((self.realIndex)[index])
        if esSSW:isSet() then
          local esSS = esSSW:get()
          local workIcon = "icon/" .. esSSW:getIcon()
          local itemStatic = nil
          if esSSW:getUseExchangeIcon() == false then
            itemStatic = (esSS:getFirstDropGroup()):getItemStaticStatus()
            workIcon = "icon/" .. getItemIconPath(itemStatic)
          end
          if itemStatic ~= nil then
            local gradeType = 0
            if gradeType > 0 and gradeType <= #(UI.itemSlotConfig).borderTexture then
              ((self.borderList)[index]):ChangeTextureInfoName((((UI.itemSlotConfig).borderTexture)[gradeType]).texture)
              local x1, y1, x2, y2 = setTextureUV_Func((self.borderList)[index], (((UI.itemSlotConfig).borderTexture)[gradeType]).x1, (((UI.itemSlotConfig).borderTexture)[gradeType]).y1, (((UI.itemSlotConfig).borderTexture)[gradeType]).x2, (((UI.itemSlotConfig).borderTexture)[gradeType]).y2)
              ;
              (((self.borderList)[index]):getBaseTexture()):setUV(x1, y1, x2, y2)
              ;
              ((self.borderList)[index]):setRenderTexture(((self.borderList)[index]):getBaseTexture())
              ;
              ((self.borderList)[index]):SetShow(true)
            else
              do
                do
                  do
                    do
                      ;
                      ((self.borderList)[index]):SetShow(false)
                      ;
                      ((self.borderList)[index]):SetShow(false)
                      ;
                      ((self.bgList)[index]):SetShow(true)
                      ;
                      ((self.overList)[index]):SetShow(true)
                      ;
                      ((self.iconList)[index]):ChangeTextureInfoName(workIcon)
                      ;
                      ((self.iconList)[index]):SetShow(true)
                      if collumIndex < self.collumMax - 1 then
                        collumIndex = collumIndex + 1
                      else
                        collumIndex = 0
                        rowIndex = rowIndex + 1
                      end
                      -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                      -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC224: LeaveBlock: unexpected jumping out IF_STMT

                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  else
    if (self.realTable).isCraft == false then
      for index = 0, self.viewCount - 1 do
        if (self.realTable)[rowIndex] == nil then
          break
        end
        if ((self.realTable)[rowIndex]).level ~= nil then
          ((self.levelList_nonCraft)[index]):SetText(((self.realTable)[rowIndex]).level .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_HOUSEWORKLIST_HOUSE_LEVEL"))
          ;
          ((self.levelList_nonCraft)[index]):SetShow(true)
        else
          if ((self.realTable)[rowIndex]).guide ~= nil then
            ((self.guideList)[index]):SetText(((self.realTable)[rowIndex]).guide)
            ;
            ((self.guideList)[index]):SetShow(true)
          end
        end
        rowIndex = rowIndex + 1
      end
    else
      do
        if (self.realTable).isCraft == nil then
          ((self.guideList).MyHouse):SetShow(true)
        end
        ;
        (UIScroll.SetButtonSize)(self.scroll, self.viewCount, self.maxCount)
        ;
        (self.scroll):SetControlPos(self.viewIndex / self.minCount)
      end
    end
  end
end

-- DECOMPILER ERROR at PC791: Confused about usage of register: R31 in 'UnsetPending'

HouseWorkListSection.ScrollOnClick = function(self)
  -- function num : 0_56
  local namnunSize = (self.scroll):GetSizeY() - (self.scrollButton):GetSizeY()
  local namnunPercents = (self.scrollButton):GetPosY() / namnunSize
  self.viewIndex = (math.floor)(namnunPercents * (self.maxCount - self.viewCount))
  self:updateFirstShow(self.currentHouseUseType, self.currentReceipeKey, self.currentLevel, false)
end

-- DECOMPILER ERROR at PC795: Confused about usage of register: R31 in 'UnsetPending'

HouseWorkListSection.Scroll = function(self, isUp)
  -- function num : 0_57
  if self.workCount == 0 then
    return 
  end
  if isUp == false then
    self.viewIndex = (math.min)(self.minCount, self.viewIndex + 1)
  else
    self.viewIndex = (math.max)(0, self.viewIndex - 1)
  end
  self:updateFirstShow(self.currentHouseUseType, self.currentReceipeKey, self.currentLevel, false)
  HouseWorkListSection_ShowTooltip_Reflesh()
end

local currentIndex = nil
HouseWorkListSection_ShowTooltip = function(index)
  -- function num : 0_58 , upvalues : VCK, currentIndex
  if isKeyPressed(VCK.KeyCode_CONTROL) then
    Keep_Tooltip_Work = true
    return 
  end
  local uiBase = (HouseWorkListSection.iconList)[index]
  local esSSW = ToClient_getHouseDataWorkableItemExchangeByIndex((HouseWorkListSection.realIndex)[index])
  if esSSW:isSet() then
    FGlobal_Show_Tooltip_Work(esSSW, uiBase)
    currentIndex = index
  end
end

HouseWorkListSection_ShowTooltip_Reflesh = function()
  -- function num : 0_59 , upvalues : currentIndex
  local uiBase = (HouseWorkListSection.iconList)[currentIndex]
  local realIndex = (HouseWorkListSection.realIndex)[currentIndex]
  if uiBase == nil or realIndex == nil then
    return 
  end
  local esSSW = ToClient_getHouseDataWorkableItemExchangeByIndex(realIndex)
  if esSSW == nil then
    return 
  end
  if realIndex ~= nil and esSSW:isSet() then
    FGlobal_Show_Tooltip_Work(esSSW, uiBase)
  else
    FGlobal_Hide_Tooltip_Work(esSSW, true)
  end
end

HandleClickedWorkListIcon = function(index)
  -- function num : 0_60 , upvalues : VCK
  if isKeyPressed(VCK.KeyCode_CONTROL) then
    HouseWorkListSection:getWorkList()
    local esSSW = ToClient_getHouseDataWorkableItemExchangeByIndex((HouseWorkListSection.realIndex)[index])
    if esSSW:isSet() then
      FGlobal_Show_Tooltip_Work_Copy(esSSW)
    end
  end
end

HouseWorkListSection_HideTooltip = function(index)
  -- function num : 0_61 , upvalues : VCK, currentIndex
  if isKeyPressed(VCK.KeyCode_CONTROL) or currentIndex ~= index then
    return 
  end
  local esSSW = ToClient_getHouseDataWorkableItemExchangeByIndex((HouseWorkListSection.realIndex)[index])
  if esSSW:isSet() then
    FGlobal_Hide_Tooltip_Work(esSSW, true)
    currentIndex = nil
  end
end

-- DECOMPILER ERROR at PC814: Confused about usage of register: R32 in 'UnsetPending'

HouseWorkListSection.getWorkList = function(self)
  -- function num : 0_62
  self.workCount = ToClient_getHouseWorkableListByData(HouseControlManager._houseKey, self.currentReceipeKey, self.currentLevel)
end

HouseControl_getItemStaticStatusByIndex = function(index)
  -- function num : 0_63
  local realIndex = (HouseWorkListSection.realIndex)[index]
  if realIndex == nil then
    return nil
  end
  local workIcon = getWorkableExchangeIconByIndex(realIndex)
  if workIcon ~= nil and workIcon ~= "" then
    return nil
  end
  local itemEnchantStaticStatusWrapper = getWorkableFirstItemStaticWrapperByIndex(realIndex)
  if itemEnchantStaticStatusWrapper:get() == nil then
    return nil
  end
  return itemEnchantStaticStatusWrapper
end

HouseManageSection.init = function(self)
  -- function num : 0_64
  (self._BG):AddChild(self._btn_Buy)
  ;
  (self._BG):AddChild(self._btn_CantBuy_LD)
  ;
  (self._BG):AddChild(self._btn_CantBuy_LowPoint)
  ;
  (self._BG):AddChild(self._btn_Sell)
  ;
  (self._BG):AddChild(self._btn_CantSell)
  ;
  (self._BG):AddChild(self._cost_BuySell)
  ;
  (self._BG):AddChild(self._cost_BuySellValue)
  ;
  (self._BG):AddChild(self._explore_Current)
  ;
  (self._BG):AddChild(self._explore_CurrentValue)
  ;
  (self._BG):AddChild(self._btn_Change)
  ;
  (self._BG):AddChild(self._ChangeMax)
  ;
  (self._BG):AddChild(self._time_Change)
  ;
  (self._BG):AddChild(self._time_ChangeValue)
  ;
  (self._BG):AddChild(self._cost_Change)
  ;
  (self._BG):AddChild(self._cost_ChangeValue)
  ;
  (self._BG):AddChild(self._cost_MyMoney)
  ;
  (self._BG):AddChild(self._cost_MyMoneyValue)
  ;
  (self._BG):AddChild(self._btn_ManageWork)
  Panel_HouseControl:RemoveControl(self._btn_Buy)
  Panel_HouseControl:RemoveControl(self._btn_CantBuy_LD)
  Panel_HouseControl:RemoveControl(self._btn_CantBuy_LowPoint)
  Panel_HouseControl:RemoveControl(self._btn_Sell)
  Panel_HouseControl:RemoveControl(self._btn_CantSell)
  Panel_HouseControl:RemoveControl(self._cost_BuySell)
  Panel_HouseControl:RemoveControl(self._cost_BuySellValue)
  Panel_HouseControl:RemoveControl(self._explore_Current)
  Panel_HouseControl:RemoveControl(self._explore_CurrentValue)
  Panel_HouseControl:RemoveControl(self._btn_Change)
  Panel_HouseControl:RemoveControl(self._ChangeMax)
  Panel_HouseControl:RemoveControl(self._time_Change)
  Panel_HouseControl:RemoveControl(self._time_ChangeValue)
  Panel_HouseControl:RemoveControl(self._cost_Change)
  Panel_HouseControl:RemoveControl(self._cost_ChangeValue)
  Panel_HouseControl:RemoveControl(self._cost_MyMoney)
  Panel_HouseControl:RemoveControl(self._cost_MyMoneyValue)
  Panel_HouseControl:RemoveControl(self._btn_ManageWork)
  local BGSpanX = ((self._BG):GetSpanSize()).x
  local BGSpanY = ((self._BG):GetSpanSize()).y
  ;
  (self._btn_Buy):SetSpanSize(((self._btn_Buy):GetSpanSize()).x - BGSpanX, ((self._btn_Buy):GetSpanSize()).y - BGSpanY)
  ;
  (self._btn_CantBuy_LD):SetSpanSize(((self._btn_CantBuy_LD):GetSpanSize()).x - BGSpanX, ((self._btn_CantBuy_LD):GetSpanSize()).y - BGSpanY)
  ;
  (self._btn_CantBuy_LowPoint):SetSpanSize(((self._btn_CantBuy_LowPoint):GetSpanSize()).x - BGSpanX, ((self._btn_CantBuy_LowPoint):GetSpanSize()).y - BGSpanY)
  ;
  (self._btn_Sell):SetSpanSize(((self._btn_Sell):GetSpanSize()).x - BGSpanX, ((self._btn_Sell):GetSpanSize()).y - BGSpanY)
  ;
  (self._btn_CantSell):SetSpanSize(((self._btn_CantSell):GetSpanSize()).x - BGSpanX, ((self._btn_CantSell):GetSpanSize()).y - BGSpanY)
  ;
  (self._cost_BuySell):SetSpanSize(((self._cost_BuySell):GetSpanSize()).x - BGSpanX, ((self._cost_BuySell):GetSpanSize()).y - BGSpanY)
  ;
  (self._cost_BuySellValue):SetSpanSize(((self._cost_BuySellValue):GetSpanSize()).x - BGSpanX, ((self._cost_BuySellValue):GetSpanSize()).y - BGSpanY)
  ;
  (self._explore_Current):SetSpanSize(((self._explore_Current):GetSpanSize()).x - BGSpanX, ((self._explore_Current):GetSpanSize()).y - BGSpanY)
  ;
  (self._explore_CurrentValue):SetSpanSize(((self._explore_CurrentValue):GetSpanSize()).x - BGSpanX, ((self._explore_CurrentValue):GetSpanSize()).y - BGSpanY)
  ;
  (self._btn_Change):SetSpanSize(((self._btn_Change):GetSpanSize()).x - BGSpanX, ((self._btn_Change):GetSpanSize()).y - BGSpanY)
  ;
  (self._ChangeMax):SetSpanSize(((self._ChangeMax):GetSpanSize()).x - BGSpanX, ((self._ChangeMax):GetSpanSize()).y - BGSpanY)
  ;
  (self._time_Change):SetSpanSize(((self._time_Change):GetSpanSize()).x - BGSpanX, ((self._time_Change):GetSpanSize()).y - BGSpanY)
  ;
  (self._time_ChangeValue):SetSpanSize(((self._time_ChangeValue):GetSpanSize()).x - BGSpanX, ((self._time_ChangeValue):GetSpanSize()).y - BGSpanY)
  ;
  (self._cost_Change):SetSpanSize(((self._cost_Change):GetSpanSize()).x - BGSpanX, ((self._cost_Change):GetSpanSize()).y - BGSpanY)
  ;
  (self._cost_ChangeValue):SetSpanSize(((self._cost_ChangeValue):GetSpanSize()).x - BGSpanX, ((self._cost_ChangeValue):GetSpanSize()).y - BGSpanY)
  ;
  (self._cost_MyMoney):SetSpanSize(((self._cost_MyMoney):GetSpanSize()).x - BGSpanX, ((self._cost_MyMoney):GetSpanSize()).y - BGSpanY)
  ;
  (self._cost_MyMoneyValue):SetSpanSize(((self._cost_MyMoneyValue):GetSpanSize()).x - BGSpanX, ((self._cost_MyMoneyValue):GetSpanSize()).y - BGSpanY)
  ;
  (self._btn_ManageWork):SetSpanSize(((self._btn_ManageWork):GetSpanSize()).x - BGSpanX, ((self._btn_ManageWork):GetSpanSize()).y - BGSpanY)
end

HouseManageSection:init()
HouseManageSection.Set = function(self)
  -- function num : 0_65
  local gapBtn_TxtY = 40
  local gapTxt_BtnY = 30
  local gapTxt_TxtY = 25
  local adjustGap = 5
  local posY = 10
  local isMyHouse = ToClient_IsMyHouse(HouseControlManager._houseKey)
  local currentExplorePoint = ToClient_RequestGetMyExploredPoint()
  local rentHouseWrapper = ToClient_GetRentHouseWrapper(HouseControlManager._houseKey)
  local isWorkable = isMyHouse == true and ToClient_IsUsable(HouseControlManager._houseKey) == true and not rentHouseWrapper:isSet() or eHouseUseGroupType.ImproveWorkshop <= rentHouseWrapper:getType()
  if isMyHouse == true then
    posY = posY - adjustGap
    gapBtn_TxtY = gapBtn_TxtY - adjustGap
    gapTxt_BtnY = gapTxt_BtnY - adjustGap
    gapTxt_TxtY = gapTxt_TxtY - adjustGap
  end
  ;
  (self._btn_Buy):SetShow(false)
  ;
  (self._btn_CantBuy_LD):SetShow(false)
  ;
  (self._btn_CantBuy_LowPoint):SetShow(false)
  ;
  (self._btn_Sell):SetShow(false)
  ;
  (self._btn_CantSell):SetShow(false)
  ;
  (self._btn_Change):SetShow(false)
  ;
  (self._ChangeMax):SetShow(false)
  ;
  (self._btn_ManageWork):SetShow(false)
  ;
  (self._btn_Buy):SetSpanSize(((self._btn_Buy):GetSpanSize()).x, posY)
  ;
  (self._btn_CantBuy_LD):SetSpanSize(((self._btn_CantBuy_LD):GetSpanSize()).x, posY)
  ;
  (self._btn_CantBuy_LowPoint):SetSpanSize(((self._btn_CantBuy_LowPoint):GetSpanSize()).x, posY)
  ;
  (self._btn_Sell):SetSpanSize(((self._btn_Sell):GetSpanSize()).x, posY)
  ;
  (self._btn_CantSell):SetSpanSize(((self._btn_CantSell):GetSpanSize()).x, posY)
  posY = posY + (gapBtn_TxtY)
  ;
  (self._cost_BuySell):SetSpanSize(((self._cost_BuySell):GetSpanSize()).x, posY)
  ;
  (self._cost_BuySellValue):SetSpanSize(((self._cost_BuySellValue):GetSpanSize()).x, posY)
  ;
  (self._cost_BuySellValue):SetText(HouseControlManager._needExplorePoint)
  posY = posY + (gapTxt_TxtY)
  ;
  (self._explore_Current):SetSpanSize(((self._explore_Current):GetSpanSize()).x, posY)
  ;
  (self._explore_CurrentValue):SetSpanSize(((self._explore_CurrentValue):GetSpanSize()).x, posY)
  ;
  (self._explore_CurrentValue):SetText(currentExplorePoint)
  if isMyHouse == true then
    posY = posY + (gapTxt_BtnY)
    ;
    (self._btn_Change):SetSpanSize(((self._btn_Change):GetSpanSize()).x, posY)
    ;
    (self._ChangeMax):SetSpanSize(((self._ChangeMax):GetSpanSize()).x, posY)
    posY = posY + (gapBtn_TxtY)
  else
    posY = posY + (gapTxt_TxtY)
  end
  ;
  (self._time_Change):SetSpanSize(((self._time_Change):GetSpanSize()).x, posY)
  ;
  (self._time_ChangeValue):SetSpanSize(((self._time_ChangeValue):GetSpanSize()).x, posY)
  posY = posY + (gapTxt_TxtY)
  ;
  (self._cost_Change):SetSpanSize(((self._cost_Change):GetSpanSize()).x, posY)
  ;
  (self._cost_ChangeValue):SetSpanSize(((self._cost_ChangeValue):GetSpanSize()).x, posY)
  do
    local _posY = posY + (gapTxt_TxtY)
    ;
    (self._cost_MyMoney):SetSpanSize(((self._cost_Change):GetSpanSize()).x, _posY)
    ;
    (self._cost_MyMoneyValue):SetSpanSize(((self._cost_ChangeValue):GetSpanSize()).x, _posY)
    if isWorkable then
      posY = posY + (gapTxt_BtnY)
      ;
      (self._btn_ManageWork):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_DOWORK"))
      ;
      (self._btn_ManageWork):SetSpanSize(((self._btn_ManageWork):GetSpanSize()).x, posY)
    end
    -- DECOMPILER ERROR: 6 unprocessed JMP targets
  end
end

HouseManageSection.update_ChangeCost = function(self)
  -- function num : 0_66
  local rentHouseWrapper = ToClient_GetRentHouseWrapper(HouseControlManager._houseKey)
  local houseInfoStaticStatusWrapper = ToClient_GetHouseInfoStaticStatusWrapper(HouseControlManager._houseKey)
  if HouseControlManager._isSet == false then
    return 
  end
  local isMyHouse = ToClient_IsMyHouse(HouseControlManager._houseKey)
  local isMaxLevel = false
  local isUsable = ToClient_IsUsable(HouseControlManager._houseKey)
  local nextRentHouseLevel = 1
  if isMyHouse == true and rentHouseWrapper:isSet() then
    isMaxLevel = rentHouseWrapper:isMaxLevel()
    houseUseType = rentHouseWrapper:getType()
    if HouseControlManager._clickedUseType == houseUseType then
      if isUsable and isMaxLevel == false then
        nextRentHouseLevel = rentHouseWrapper:getLevel() + 1
      else
        if isUsable == false then
          nextRentHouseLevel = rentHouseWrapper:getLevel()
        end
      end
    end
  end
  local listCount = houseInfoStaticStatusWrapper:getNeedItemListCount(HouseControlManager._clickedUseType, nextRentHouseLevel)
  local itemKey = {}
  local itemName = {}
  local itemCount = {}
  for index = 0, listCount - 1 do
    itemKey[index] = houseInfoStaticStatusWrapper:getNeedItemListItemKey(HouseControlManager._clickedUseType, nextRentHouseLevel, index)
    itemName[index] = (getItemEnchantStaticStatus(itemKey[index])):getName()
    itemCount[index] = Int64toInt32(houseInfoStaticStatusWrapper:getNeedItemListItemCount(HouseControlManager._clickedUseType, nextRentHouseLevel, index))
  end
  local selfPlayerWrapper = getSelfPlayer()
  local selfPlayer = selfPlayerWrapper:get()
  local inventory = selfPlayer:getInventory()
  local myMoney = Int64toInt32(inventory:getMoney_s64())
  local myMoneyDot = makeDotMoney(myMoney)
  ;
  (self._cost_MyMoneyValue):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_HAVEMONEY", "myMoney", myMoneyDot))
  if itemCount[0] ~= nil and itemName[0] ~= nil then
    if HouseControlManager._clickedUseType == houseUseType and isMaxLevel == true and isUsable == true then
      (self._cost_ChangeValue):SetText("--")
    else
      local needMoney = itemCount[0]
      if myMoney < needMoney then
        needMoney = "<PAColor0xFFDB2B2B>" .. makeDotMoney(needMoney) .. " " .. itemName[0] .. "<PAOldColor>"
      else
        needMoney = makeDotMoney(needMoney) .. " " .. itemName[0]
      end
      ;
      (self._cost_ChangeValue):SetText(needMoney)
    end
  else
    do
      ;
      (self._cost_ChangeValue):SetText("--")
      self._needTime = -1
      local needTime = "--"
      if HouseControlManager._clickedUseType == houseUseType and isMaxLevel == true and isUsable == true then
        self._needTime = 0
      else
        self._needTime = houseInfoStaticStatusWrapper:getTransperTime(HouseControlManager._clickedUseType, nextRentHouseLevel, nextRentHouseLevel)
      end
      if self._needTime ~= 0 then
        needTime = ((Util.Time).timeFormatting)(self._needTime)
      end
      ;
      (self._time_ChangeValue):SetText(needTime)
      do
        local isWorkable = isMyHouse == true and ToClient_IsUsable(HouseControlManager._houseKey) == true and rentHouseWrapper ~= nil and eHouseUseGroupType.ImproveWorkshop <= rentHouseWrapper:getType()
        if HouseControlManager._currentUseType == HouseControlManager._clickedUseType and isWorkable then
          (self._btn_ManageWork):SetShow(true)
          ;
          (self._cost_MyMoney):SetShow(false)
          ;
          (self._cost_MyMoneyValue):SetShow(false)
        else
          (self._btn_ManageWork):SetShow(false)
          ;
          (self._cost_MyMoney):SetShow(true)
          ;
          (self._cost_MyMoneyValue):SetShow(true)
        end
        -- DECOMPILER ERROR: 3 unprocessed JMP targets
      end
    end
  end
end

HouseProgressSection.Init = function(self)
  -- function num : 0_67 , upvalues : UI_TM
  (self._BG):AddChild(self._WorkName)
  ;
  (self._BG):AddChild(self._Icon_BG)
  ;
  (self._BG):AddChild(self._Icon_Working)
  ;
  (self._BG):AddChild(self._Icon_UseType)
  ;
  (self._BG):AddChild(self._Progress_BG)
  ;
  (self._BG):AddChild(self._Progress_OnGoing)
  ;
  (self._BG):AddChild(self._Progress)
  ;
  (self._BG):AddChild(self._ProgressText_Value)
  ;
  (self._BG):AddChild(self._RemainTime)
  ;
  (self._BG):AddChild(self._RemainTime_Vlaue)
  ;
  (self._BG):AddChild(self._Btn_CancelWork)
  ;
  (self._BG):AddChild(self._Btn_LargCraft)
  ;
  (self._BG):AddChild(self._Btn_Immediately)
  Panel_HouseControl:RemoveControl(self._WorkName)
  Panel_HouseControl:RemoveControl(self._Icon_BG)
  Panel_HouseControl:RemoveControl(self._Icon_Working)
  Panel_HouseControl:RemoveControl(self._Icon_UseType)
  Panel_HouseControl:RemoveControl(self._Progress_BG)
  Panel_HouseControl:RemoveControl(self._Progress_OnGoing)
  Panel_HouseControl:RemoveControl(self._Progress)
  Panel_HouseControl:RemoveControl(self._ProgressText_Value)
  Panel_HouseControl:RemoveControl(self._RemainTime)
  Panel_HouseControl:RemoveControl(self._RemainTime_Vlaue)
  Panel_HouseControl:RemoveControl(self._Btn_CancelWork)
  Panel_HouseControl:RemoveControl(self._Btn_LargCraft)
  Panel_HouseControl:RemoveControl(self._Btn_Immediately)
  local BGSpanX = ((self._BG):GetSpanSize()).x
  local BGSpanY = ((self._BG):GetSpanSize()).y
  ;
  (self._WorkName):SetSpanSize(((self._WorkName):GetSpanSize()).x - BGSpanX, ((self._WorkName):GetSpanSize()).y - BGSpanY)
  ;
  (self._Icon_BG):SetSpanSize(((self._Icon_BG):GetSpanSize()).x - BGSpanX, ((self._Icon_BG):GetSpanSize()).y - BGSpanY)
  ;
  (self._Icon_Working):SetSpanSize(((self._Icon_Working):GetSpanSize()).x - BGSpanX, ((self._Icon_Working):GetSpanSize()).y - BGSpanY)
  ;
  (self._Icon_UseType):SetSpanSize(((self._Icon_UseType):GetSpanSize()).x - BGSpanX, ((self._Icon_UseType):GetSpanSize()).y - BGSpanY)
  ;
  (self._Progress_BG):SetSpanSize(((self._Progress_BG):GetSpanSize()).x - BGSpanX, ((self._Progress_BG):GetSpanSize()).y - BGSpanY)
  ;
  (self._Progress_OnGoing):SetSpanSize(((self._Progress_OnGoing):GetSpanSize()).x - BGSpanX, ((self._Progress_OnGoing):GetSpanSize()).y - BGSpanY)
  ;
  (self._Progress):SetSpanSize(((self._Progress):GetSpanSize()).x - BGSpanX, ((self._Progress):GetSpanSize()).y - BGSpanY)
  ;
  (self._ProgressText_Value):SetSpanSize(((self._ProgressText_Value):GetSpanSize()).x - BGSpanX, ((self._ProgressText_Value):GetSpanSize()).y - BGSpanY)
  ;
  (self._RemainTime):SetSpanSize(((self._RemainTime):GetSpanSize()).x - BGSpanX, ((self._RemainTime):GetSpanSize()).y - BGSpanY)
  ;
  (self._RemainTime_Vlaue):SetSpanSize(((self._RemainTime_Vlaue):GetSpanSize()).x - BGSpanX, ((self._RemainTime_Vlaue):GetSpanSize()).y - BGSpanY)
  ;
  (self._Btn_CancelWork):SetSpanSize(((self._Btn_CancelWork):GetSpanSize()).x - BGSpanX, ((self._Btn_CancelWork):GetSpanSize()).y - BGSpanY)
  ;
  (self._Btn_LargCraft):SetSpanSize(((self._Btn_LargCraft):GetSpanSize()).x - BGSpanX, ((self._Btn_LargCraft):GetSpanSize()).y - BGSpanY)
  ;
  (self._Btn_Immediately):SetSpanSize(((self._Btn_Immediately):GetSpanSize()).x - BGSpanX, ((self._Btn_Immediately):GetSpanSize()).y - BGSpanY)
  FGlobal_AddChild(Panel_HouseControl, self._BG, self._ProgressText_1)
  FGlobal_AddChild(Panel_HouseControl, self._BG, self._ProgressText_2)
  FGlobal_AddChild(Panel_HouseControl, self._BG, self._OnGoingText)
  FGlobal_AddChild(Panel_HouseControl, self._BG, self._OnGoingText_Vlaue)
  ;
  (self._Title):SetShow(false)
  ;
  (self._BG):SetShow(false)
  ;
  (self._WorkName):SetTextMode(UI_TM.eTextMode_LimitText)
  ;
  (self._Btn_CancelWork):addInputEvent("Mouse_LUp", "HouseProgressSection_CancelWork()")
  ;
  (self._Btn_LargCraft):addInputEvent("Mouse_LUp", "handleClickedHouseControlDoWorkHouse()")
  ;
  (self._Btn_Immediately):addInputEvent("Mouse_LUp", "ImmediatelyComplete()")
end

HouseProgressSection:Init()
HouseProgressSection_Init = function()
  -- function num : 0_68 , upvalues : HouseProgressSection, houseInfoSS
  local workType = HouseProgressSection._workType
  local houseKey = HouseControlManager._houseKey
  local workingcnt = -1
  currentWorkCountCheck = false
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R3 in 'UnsetPending'

  HouseProgressSection._workerNo = {}
  if eWorkType.craft == workType then
    workingcnt = ToClient_getHouseWorkingWorkerList(houseInfoSS)
    -- DECOMPILER ERROR at PC21: Confused about usage of register: R3 in 'UnsetPending'

    if workingcnt == 0 then
      HouseProgressSection.isFale_Init = true
    end
    for idx = 0, workingcnt - 1 do
      local worker = (ToClient_getHouseWorkingWorkerByIndex(houseInfoSS, idx)).workerNo
      local workerNo = worker:get_s64()
      local esSSW = ToClient_getItemExchangeSourceStaticStatusWrapperByWorker(workerNo)
      if esSSW:isSet() then
        local workingIcon = esSSW:getIcon()
        local workName = esSSW:getDescription()
        ;
        (HouseProgressSection._Icon_Working):ChangeTextureInfoName("icon/" .. workingIcon)
        -- DECOMPILER ERROR at PC52: Confused about usage of register: R12 in 'UnsetPending'

        HouseProgressSection._saveIcon = workingIcon
        -- DECOMPILER ERROR at PC54: Confused about usage of register: R12 in 'UnsetPending'

        HouseProgressSection._worker = worker
        -- DECOMPILER ERROR at PC57: Confused about usage of register: R12 in 'UnsetPending'

        ;
        (HouseProgressSection._workerNo)[idx] = workerNo
        ;
        (HouseProgressSection._WorkName):SetText(workName)
        ;
        (HouseProgressSection._Icon_BG):SetShow(true)
        ;
        (HouseProgressSection._Icon_Working):SetShow(true)
        ;
        (HouseProgressSection._Icon_Working):addInputEvent("Mouse_On", "HouseProgressSection_Show_Tooltip_Work()")
        ;
        (HouseProgressSection._Icon_Working):addInputEvent("Mouse_Out", "HouseProgressSection_Hide_Tooltip_Work()")
        ;
        (HouseProgressSection._Icon_UseType):SetShow(false)
        ;
        (HouseProgressSection._RemainTime):SetShow(true)
        ;
        (HouseProgressSection._RemainTime_Vlaue):SetShow(true)
        ;
        (HouseProgressSection._Btn_LargCraft):SetShow(false)
        ;
        (HouseProgressSection._Btn_CancelWork):SetShow(true)
        ;
        (HouseProgressSection._ProgressText_1):SetShow(true)
        ;
        (HouseProgressSection._ProgressText_2):SetShow(false)
        ;
        (HouseProgressSection._Progress_OnGoing):SetShow(false)
        ;
        (HouseProgressSection._OnGoingText):SetShow(false)
        ;
        (HouseProgressSection._OnGoingText_Vlaue):SetShow(false)
      end
    end
  else
    do
      if eWorkType.changeHouseUseType == workType then
        (HouseProgressSection._WorkName):SetText(HouseControlManager._useTypeName .. " " .. HouseControlManager._currentLevel .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_ONCHANGE_LEVEL"))
        Set_HouseUseType_Texture_Icon(HouseProgressSection._Icon_UseType)
        ;
        (HouseProgressSection._Icon_UseType):SetShow(true)
        ;
        (HouseProgressSection._Icon_Working):SetShow(false)
        ;
        (HouseProgressSection._Icon_BG):SetShow(false)
        ;
        (HouseProgressSection._RemainTime):SetShow(true)
        ;
        (HouseProgressSection._RemainTime_Vlaue):SetShow(true)
        ;
        (HouseProgressSection._Btn_LargCraft):SetShow(false)
        ;
        (HouseProgressSection._Btn_CancelWork):SetShow(false)
        ;
        (HouseProgressSection._ProgressText_1):SetShow(true)
        ;
        (HouseProgressSection._ProgressText_2):SetShow(false)
        ;
        (HouseProgressSection._Progress_OnGoing):SetShow(false)
        ;
        (HouseProgressSection._OnGoingText):SetShow(false)
        ;
        (HouseProgressSection._OnGoingText_Vlaue):SetShow(false)
        ;
        (HouseProgressSection._Btn_Immediately):SetShow(false)
      else
        if eWorkType.largeCraft == workType then
          local currentKey = ToClient_getLargeCraftExchangeKeyRaw(houseInfoSS)
          local workData = ToClient_getHouseWorkableListCount(houseInfoSS)
          local workCount = ToClient_getRentHouseWorkableListByCustomOnlySize(HouseControlManager._currentUseType, 1, HouseControlManager._currentLevel)
          for index = 1, workCount do
            if currentKey == ToClient_getWorkableExchangeKeyByIndex(index - 1) then
              local esSSW = ToClient_getHouseWorkableItemExchangeByIndex(houseInfoSS, index - 1)
              if esSSW:isSet() then
                local itemStatic = (esSSW:getResultItemStaticStatusWrapper()):get()
                local workName = esSSW:getDescription()
                local workIcon = "icon/" .. esSSW:getIcon()
                local resultIcon = workIcon
                local resultName = "???"
                local resultKey = nil
                if esSSW:getUseExchangeIcon() == false then
                  resultName = getItemName(itemStatic)
                  resultKey = itemStatic._key
                end
                -- DECOMPILER ERROR at PC284: Confused about usage of register: R17 in 'UnsetPending'

                HouseProgressSection._itemKey_Tooltip = resultKey
                local esSS = esSSW:get()
                local eSSCount = getExchangeSourceNeedItemList(esSS, true)
                local workingCout = ToClient_getHouseWorkingWorkerList(houseInfoSS)
                local totalCount = 0
                local sumProgressCount = 0
                local sumOnGoingCount = 0
                local workingList = {}
                for idx = 1, workingCout do
                  local workerNo = ((ToClient_getHouseWorkingWorkerByIndex(houseInfoSS, idx - 1)).workerNo):get_s64()
                  local resourceIndex = ToClient_getLargeCraftWorkIndexByWorker(workerNo) + 1
                  -- DECOMPILER ERROR at PC315: Confused about usage of register: R30 in 'UnsetPending'

                  ;
                  (HouseProgressSection._workerNo)[idx] = workerNo
                  if workingList[resourceIndex] == nil then
                    workingList[resourceIndex] = {}
                  end
                  local _index = #workingList[resourceIndex] + 1
                  -- DECOMPILER ERROR at PC325: Confused about usage of register: R31 in 'UnsetPending'

                  ;
                  (workingList[resourceIndex])[_index] = workerNo
                end
                for idx = 1, eSSCount do
                  local onGoingCount = 0
                  if workingList[idx] ~= nil then
                    onGoingCount = #workingList[idx]
                  end
                  local itemStaticInfomationWrapper = getExchangeSourceNeedItemByIndex(idx - 1)
                  local fullCount = Int64toInt32(itemStaticInfomationWrapper:getCount_s64())
                  local progressCount = ToClient_getLargeCarftCompleteProgressPoint(houseInfoSS, esSSW:getExchangeKeyRaw(), idx - 1)
                  if progressCount < 0 then
                    progressCount = 0
                  else
                    progressCount = fullCount - progressCount
                  end
                  totalCount = totalCount + fullCount
                  sumProgressCount = sumProgressCount + (progressCount)
                  sumOnGoingCount = sumOnGoingCount + onGoingCount
                end
                local _workingProgress = (math.floor)((sumProgressCount) / (totalCount) * 100)
                local _onGoingProgress = (math.floor)((sumOnGoingCount + (sumProgressCount)) / (totalCount) * 100)
                ;
                (HouseProgressSection._ProgressText_1):SetShow(false)
                ;
                (HouseProgressSection._ProgressText_2):SetShow(true)
                ;
                (HouseProgressSection._ProgressText_Value):SetText(tostring(sumProgressCount) .. "/" .. tostring(totalCount))
                ;
                (HouseProgressSection._Progress):SetProgressRate(_workingProgress)
                ;
                (HouseProgressSection._Progress_OnGoing):SetProgressRate(_onGoingProgress)
                ;
                (HouseProgressSection._Progress_OnGoing):SetShow(true)
                ;
                (HouseProgressSection._OnGoingText_Vlaue):SetText(tostring(sumOnGoingCount))
                ;
                (HouseProgressSection._OnGoingText):SetShow(true)
                ;
                (HouseProgressSection._OnGoingText_Vlaue):SetShow(true)
                ;
                (HouseProgressSection._Icon_Working):ChangeTextureInfoName(workIcon)
                ;
                (HouseProgressSection._WorkName):SetText(workName)
                ;
                (HouseProgressSection._Icon_BG):SetShow(true)
                ;
                (HouseProgressSection._Icon_Working):SetShow(true)
                ;
                (HouseProgressSection._Icon_Working):addInputEvent("Mouse_On", "HouseProgressSection_Show_Tooltip_LargeCraft()")
                ;
                (HouseProgressSection._Icon_Working):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_hideTooltip()")
                ;
                (HouseProgressSection._Icon_UseType):SetShow(false)
                ;
                (HouseProgressSection._RemainTime):SetShow(false)
                ;
                (HouseProgressSection._RemainTime_Vlaue):SetShow(false)
                ;
                (HouseProgressSection._Btn_LargCraft):SetShow(true)
                ;
                (HouseProgressSection._Btn_CancelWork):SetShow(false)
                break
              end
            end
          end
        end
      end
    end
  end
end

HouseProgressSection_SetBaseTextureUV = function(pData, pPath, pX1, pY1, pX2, pY2)
  -- function num : 0_69
  pData:ChangeTextureInfoName(pPath)
  local x1, y1, x2, y2 = setTextureUV_Func(pData, pX1, pY1, pX2, pY2)
  ;
  (pData:getBaseTexture()):setUV(x1, y1, x2, y2)
  pData:setRenderTexture(pData:getBaseTexture())
end

local houseTextureList = {
[(CppEnums.eHouseUseType).Empty] = {path = "new_ui_common_forlua/Window/HouseInfo/HouseIcon.dds", 
pos = {1, 1, 43, 43}
}
, 
[(CppEnums.eHouseUseType).Lodging] = {path = "new_ui_common_forlua/Window/HouseInfo/HouseIcon.dds", 
pos = {1, 1, 43, 43}
}
, 
[(CppEnums.eHouseUseType).Depot] = {path = "new_ui_common_forlua/Window/HouseInfo/HouseIcon.dds", 
pos = {87, 1, 129, 43}
}
, 
[(CppEnums.eHouseUseType).Ranch] = {path = "new_ui_common_forlua/Window/HouseInfo/HouseIcon.dds", 
pos = {130, 1, 172, 43}
}
, 
[(CppEnums.eHouseUseType).WeaponForgingWorkshop] = {path = "new_ui_common_forlua/Window/HouseInfo/HouseIcon.dds", 
pos = {173, 1, 215, 43}
}
, 
[(CppEnums.eHouseUseType).ArmorForgingWorkshop] = {path = "new_ui_common_forlua/Window/HouseInfo/HouseIcon.dds", 
pos = {216, 1, 258, 43}
}
, 
[(CppEnums.eHouseUseType).HandMadeWorkshop] = {path = "new_ui_common_forlua/Window/HouseInfo/HouseIcon.dds", 
pos = {259, 1, 301, 43}
}
, 
[(CppEnums.eHouseUseType).WoodCraftWorkshop] = {path = "new_ui_common_forlua/Window/HouseInfo/HouseIcon.dds", 
pos = {302, 1, 344, 43}
}
, 
[(CppEnums.eHouseUseType).JewelryWorkshop] = {path = "new_ui_common_forlua/Window/HouseInfo/HouseIcon.dds", 
pos = {345, 1, 387, 43}
}
, 
[(CppEnums.eHouseUseType).ToolWorkshop] = {path = "new_ui_common_forlua/Window/HouseInfo/HouseIcon.dds", 
pos = {388, 1, 430, 43}
}
, 
[(CppEnums.eHouseUseType).Refinery] = {path = "new_ui_common_forlua/Window/HouseInfo/HouseIcon.dds", 
pos = {431, 1, 473, 43}
}
, 
[(CppEnums.eHouseUseType).ImproveWorkshop] = {path = "new_ui_common_forlua/Window/HouseInfo/HouseIcon.dds", 
pos = {1, 44, 43, 86}
}
, 
[(CppEnums.eHouseUseType).CannonWorkshop] = {path = "new_ui_common_forlua/Window/HouseInfo/HouseIcon.dds", 
pos = {44, 44, 86, 86}
}
, 
[(CppEnums.eHouseUseType).Shipyard] = {path = "new_ui_common_forlua/Window/HouseInfo/HouseIcon.dds", 
pos = {87, 44, 129, 86}
}
, 
[(CppEnums.eHouseUseType).CarriageWorkshop] = {path = "new_ui_common_forlua/Window/HouseInfo/HouseIcon.dds", 
pos = {130, 44, 172, 86}
}
, 
[(CppEnums.eHouseUseType).HorseArmorWorkshop] = {path = "new_ui_common_forlua/Window/HouseInfo/HouseIcon.dds", 
pos = {173, 44, 215, 86}
}
, 
[(CppEnums.eHouseUseType).FurnitureWorkshop] = {path = "new_ui_common_forlua/Window/HouseInfo/HouseIcon.dds", 
pos = {216, 44, 258, 86}
}
, 
[(CppEnums.eHouseUseType).LocalSpecailtiesWorkshop] = {path = "new_ui_common_forlua/Window/HouseInfo/HouseIcon.dds", 
pos = {259, 44, 301, 86}
}
, 
[(CppEnums.eHouseUseType).Wardrobe] = {path = "new_ui_common_forlua/Window/HouseInfo/HouseIcon.dds", 
pos = {345, 259, 387, 301}
}
, 
[(CppEnums.eHouseUseType).SiegeWeapons] = {path = "new_ui_common_forlua/Window/HouseInfo/HouseIcon.dds", 
pos = {431, 44, 473, 86}
}
, 
[(CppEnums.eHouseUseType).ShipParts] = {path = "new_ui_common_forlua/Window/HouseInfo/HouseIcon.dds", 
pos = {388, 44, 430, 86}
}
, 
[(CppEnums.eHouseUseType).WagonParts] = {path = "new_ui_common_forlua/Window/HouseInfo/HouseIcon.dds", 
pos = {345, 44, 387, 86}
}
, 
[(CppEnums.eHouseUseType).AssetManagementshop] = {path = "new_ui_common_forlua/Window/HouseInfo/HouseIcon.dds", 
pos = {388, 259, 430, 301}
}
, 
[(CppEnums.eHouseUseType).PotteryWorkshop] = {path = "new_ui_common_forlua/Window/HouseInfo/HouseIcon.dds", 
pos = {431, 259, 473, 301}
}
}
Set_HouseUseType_Texture_Icon = function(_Target)
  -- function num : 0_70 , upvalues : houseTextureList
  local textureTarget = houseTextureList[HouseControlManager._currentGroupType]
  if textureTarget ~= nil then
    HouseProgressSection_SetBaseTextureUV(_Target, textureTarget.path, (textureTarget.pos)[1], (textureTarget.pos)[2], (textureTarget.pos)[3], (textureTarget.pos)[4])
  else
    HouseProgressSection_SetBaseTextureUV(_Target, "new_ui_common_forlua/Window/HouseInfo/HouseIcon.dds", 302, 44, 344, 86)
  end
end

local currentWorkCountCheck = false
HouseProgressSection_Update = function()
  -- function num : 0_71 , upvalues : HouseProgressSection, currentWorkCountCheck, waitingCancelWorkerNo
  if (HouseProgressSection._BG):GetShow() == false or eWorkType.largeCraft == workType then
    return 
  end
  local workType = HouseProgressSection._workType
  local workingcnt = -1
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R2 in 'UnsetPending'

  HouseProgressSection._updateCount = HouseProgressSection._updateCount + 1
  if eWorkType.craft == workType then
    workingcnt = HouseProgressSection:getWorkingList()
    if HouseProgressSection.isFale_Init == true and workingcnt > 0 then
      HouseProgressSection_Init()
      -- DECOMPILER ERROR at PC37: Confused about usage of register: R2 in 'UnsetPending'

      HouseProgressSection.isFale_Init = false
    end
    if HouseControlManager._houseKey == 0 then
      return 
    end
    local workName = (HouseProgressSection._WorkName):GetText()
    for idx = 0, workingcnt - 1 do
      local worker = (getWorkingByIndex(idx)).workerNo
      local workerNo = worker:get_s64()
      -- DECOMPILER ERROR at PC62: Confused about usage of register: R9 in 'UnsetPending'

      HouseProgressSection._workingProgress = getWorkingProgress(workerNo) * 100000
      -- DECOMPILER ERROR at PC71: Confused about usage of register: R9 in 'UnsetPending'

      HouseProgressSection._remainTime = ((Util.Time).timeFormatting)(ToClient_getWorkingTime(workerNo))
      ;
      (HouseProgressSection._ProgressText_Value):SetText((string.format)("%3.1f%%", HouseProgressSection._workingProgress))
      ;
      (HouseProgressSection._Progress):SetProgressRate(HouseProgressSection._workingProgress)
      ;
      (HouseProgressSection._RemainTime_Vlaue):SetText(HouseProgressSection._remainTime)
      -- DECOMPILER ERROR at PC97: Confused about usage of register: R9 in 'UnsetPending'

      HouseProgressSection._saveProgress = HouseProgressSection._workingProgress
      if ToClient_getNpcWorkerWorkingCount(workerNo) > 0 and currentWorkCountCheck == false then
        (HouseProgressSection._WorkName):SetText(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_NEW_HOUSECONTROL_WORKNAME", "workName", workName, "workerNo", ToClient_getNpcWorkerWorkingCount(workerNo)))
        currentWorkCountCheck = true
      end
      local workStringNo = tostring(workerNo)
      if waitingCancelWorkerNo[workStringNo] == true then
        (HouseProgressSection._Btn_CancelWork):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEW_HOUSECONTROL_CANCELRESERVE"))
        ;
        (HouseProgressSection._Btn_CancelWork):SetEnable(false)
        ;
        (HouseProgressSection._Btn_CancelWork):SetMonoTone(true)
      else
        -- DECOMPILER ERROR at PC151: Confused about usage of register: R10 in 'UnsetPending'

        waitingCancelWorkerNo[workStringNo] = nil
        ;
        (HouseProgressSection._Btn_CancelWork):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_NEW_HOUSECONTROL_WORKCANCEL"))
        ;
        (HouseProgressSection._Btn_CancelWork):SetEnable(true)
        ;
        (HouseProgressSection._Btn_CancelWork):SetMonoTone(false)
      end
    end
  else
    do
      -- DECOMPILER ERROR at PC182: Confused about usage of register: R2 in 'UnsetPending'

      if eWorkType.changeHouseUseType == workType then
        HouseProgressSection._workingProgress = ToClient_GetProgressRateChangeHouseUseType(HouseControlManager._houseKey)
        -- DECOMPILER ERROR at PC192: Confused about usage of register: R2 in 'UnsetPending'

        HouseProgressSection._remainTime = ((Util.Time).timeFormatting)(ToClient_GetLeftTimeChangeHouseUseType(HouseControlManager._houseKey))
        ;
        (HouseProgressSection._ProgressText_Value):SetText((string.format)("%3.1f%%", HouseProgressSection._workingProgress))
        ;
        (HouseProgressSection._Progress):SetProgressRate(HouseProgressSection._workingProgress)
        ;
        (HouseProgressSection._RemainTime_Vlaue):SetText(HouseProgressSection._remainTime)
      end
    end
  end
end

HouseProgressSection_Set = function(workType)
  -- function num : 0_72 , upvalues : HouseProgressSection, HouseManageSection
  (HouseProgressSection._Title):SetShow(true)
  ;
  (HouseProgressSection._BG):SetShow(true)
  ;
  (HouseProgressSection._Btn_Immediately):SetShow(false)
  ;
  (HouseManageSection._Title):SetShow(false)
  ;
  (HouseManageSection._BG):SetShow(false)
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R1 in 'UnsetPending'

  HouseProgressSection._workType = workType
  -- DECOMPILER ERROR at PC28: Confused about usage of register: R1 in 'UnsetPending'

  HouseProgressSection._workingProgress = 0
  -- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

  HouseProgressSection._saveProgress = 0
  -- DECOMPILER ERROR at PC32: Confused about usage of register: R1 in 'UnsetPending'

  HouseProgressSection._updateCount = 0
  if HouseProgressSection._workType == eWorkType.craft then
    (HouseProgressSection._Btn_CancelWork):SetShow(true)
    ;
    (HouseProgressSection._Btn_Immediately):SetShow(true)
    ;
    (HouseProgressSection._Btn_Immediately):addInputEvent("Mouse_LUp", "HouseProgressSection_Immediately_CraftItem()")
  else
    if HouseProgressSection._workType == eWorkType.changeHouseUseType then
      (HouseProgressSection._Btn_CancelWork):SetShow(false)
      if false then
        (HouseProgressSection._Btn_Immediately):SetShow(true)
        ;
        (HouseProgressSection._Btn_Immediately):addInputEvent("Mouse_LUp", "ImmediatelyComplete()")
      end
    else
      if HouseProgressSection._workType == eWorkType.largeCraft then
        (HouseProgressSection._Btn_CancelWork):SetShow(false)
        if false then
          (HouseProgressSection._Btn_Immediately):SetShow(true)
          ;
          (HouseProgressSection._Btn_Immediately):addInputEvent("Mouse_LUp", "ImmediatelyComplete()")
        end
      end
    end
  end
  if isGameTypeEnglish() then
    (HouseProgressSection._Btn_Immediately):SetShow(false)
  end
  -- DECOMPILER ERROR at PC117: Confused about usage of register: R1 in 'UnsetPending'

  HouseProgressSection.isFale_Init = false
  HouseProgressSection_Init()
  HouseProgressSection_Update()
end

HouseProgressSection_Hide = function()
  -- function num : 0_73 , upvalues : HouseProgressSection, HouseManageSection, currentWorkCountCheck
  (HouseProgressSection._Title):SetShow(false)
  ;
  (HouseProgressSection._BG):SetShow(false)
  ;
  (HouseManageSection._Title):SetShow(true)
  ;
  (HouseManageSection._BG):SetShow(true)
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R0 in 'UnsetPending'

  HouseProgressSection._workType = nil
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

  HouseProgressSection._itemKey_Tooltip = nil
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R0 in 'UnsetPending'

  HouseProgressSection._nodekey = 0
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R0 in 'UnsetPending'

  HouseProgressSection._saveProgress = 0
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R0 in 'UnsetPending'

  HouseProgressSection._updateCount = 0
  isFale_Init = false
  currentWorkCountCheck = false
end

HouseProgressSection_Immediately_CraftItem = function()
  -- function num : 0_74 , upvalues : houseInfoSS, HouseProgressSection, UI_PP
  local worker = (ToClient_getHouseWorkingWorkerByIndex(houseInfoSS, 0)).workerNo
  local workerNo = worker:get_s64()
  local esSSW = ToClient_getItemExchangeSourceStaticStatusWrapperByWorker(workerNo)
  if esSSW:isSet() then
    local workingIcon = esSSW:getIcon()
    local workName = esSSW:getDescription()
    -- DECOMPILER ERROR at PC22: Confused about usage of register: R5 in 'UnsetPending'

    HouseProgressSection._remainTimeInt = ToClient_getWorkingTime(workerNo)
    -- DECOMPILER ERROR at PC31: Confused about usage of register: R5 in 'UnsetPending'

    HouseProgressSection._needPearl = ToClient_GetUsingPearlByRemainingPearl((CppEnums.InstantCashType).eInstant_CompleteNpcWorking, HouseProgressSection._remainTimeInt)
    local messageboxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_IMMEDIATELYCOMPLETE_MSGBOX_TITLE")
    local messageBoxMemo = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_NEW_HOUSECONTROL_USEPEARL", "workName", workName, "needPearl", tostring(HouseProgressSection._needPearl))
    local messageboxData = {title = messageboxTitle, content = messageBoxMemo, functionYes = HouseProgressSection_Immediately_CraftItemYes, functionCancel = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData, "middle")
  end
end

HouseProgressSection_Immediately_CraftItemYes = function()
  -- function num : 0_75 , upvalues : HouseProgressSection
  ToClient_requestQuickComplete(HouseProgressSection._worker, HouseProgressSection._needPearl)
end

HouseProgressSection_CancelWork = function()
  -- function num : 0_76 , upvalues : houseInfoSS, UI_PP
  local worker = (ToClient_getHouseWorkingWorkerByIndex(houseInfoSS, 0)).workerNo
  local workerNo = worker:get_s64()
  local workingcnt = ToClient_getNpcWorkerWorkingCount(workerNo)
  local esSSW = ToClient_getItemExchangeSourceStaticStatusWrapperByWorker(workerNo)
  if esSSW:isSet() and workingcnt > 0 then
    local workingIcon = esSSW:getIcon()
    local workName = esSSW:getDescription()
    local cancelWorkContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_CANCELWORK_CONTENT", "workName", workName)
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_CANCELWORK_TITLE"), content = cancelWorkContent, functionYes = HouseProgressSection_CancelWork_Continue, functionCancel = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData, "middle")
  else
    do
      if esSSW:isSet() and workingcnt < 1 then
        local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_CANCELWORK_TITLE"), content = PAGetString(Defines.StringSheet_GAME, "LUA_NEW_HOUSECONTROL_ONLYONEWORK"), functionApply = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
        ;
        (MessageBox.showMessageBox)(messageboxData, "middle")
      end
    end
  end
end

ImmediatelyComplete = function()
  -- function num : 0_77 , upvalues : UI_PP
  local needPearl = ToClient_GetNeedCompletePearl(HouseControlManager._houseKey)
  local messageboxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_IMMEDIATELYCOMPLETE_MSGBOX_TITLE")
  local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_NEW_HOUSECONTROL_USEMOREPEARL", "needPearl", needPearl)
  local messageboxData = {title = messageboxTitle, content = messageBoxMemo, functionYes = HouseProgressSection_ImmediatelyYes, functionCancel = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData, "middle")
end

HouseProgressSection_ImmediatelyYes = function()
  -- function num : 0_78
  ToClient_RequestCompleteChangeUseType(HouseControlManager._houseKey)
end

HouseProgressSection_CancelWork_Continue = function()
  -- function num : 0_79 , upvalues : HouseProgressSection
  ToClient_requestCancelNextWorking(HouseProgressSection._worker)
end

HouseProgressSection_Check = function()
  -- function num : 0_80 , upvalues : HouseProgressSection, houseInfoSS
  if HouseControlManager._currentUseType == HouseControlManager._clickedUseType then
    local workingcnt = HouseProgressSection:getWorkingList()
    local isUsable = ToClient_IsUsable(HouseControlManager._houseKey)
    local isLargeCraft = ToClient_getLargeCraftExchangeKeyRaw(houseInfoSS)
    if isUsable == false then
      if (HouseProgressSection._BG):GetShow() == false then
        HouseProgressSection_Set(eWorkType.changeHouseUseType)
      else
        HouseProgressSection_Update()
      end
    else
      if isLargeCraft > 0 then
        if (HouseProgressSection._BG):GetShow() == false then
          HouseProgressSection_Set(eWorkType.largeCraft)
        else
          HouseProgressSection_Update()
        end
      else
        if workingcnt > 0 then
          if (HouseProgressSection._BG):GetShow() == false then
            HouseProgressSection_Set(eWorkType.craft)
          else
            HouseProgressSection_Update()
          end
        else
          if (HouseProgressSection._BG):GetShow() then
            HouseProgressSection_Hide()
          end
        end
      end
    end
  else
    do
      if (HouseProgressSection._BG):GetShow() then
        HouseProgressSection_Hide()
      end
    end
  end
end

HouseProgressSection.getWorkingList = function(self)
  -- function num : 0_81
  local workingCnt = getWorkingListAtRentHouse(HouseControlManager._houseKey)
  return workingCnt
end

HouseProgressSection_Show_Tooltip_Work = function()
  -- function num : 0_82 , upvalues : VCK, HouseProgressSection
  if isKeyPressed(VCK.KeyCode_CONTROL) then
    Keep_Tooltip_Work = true
    return 
  end
  local uiBase = HouseProgressSection._Icon_BG
  local esSSW = ToClient_getItemExchangeSourceStaticStatusWrapperByWorker((HouseProgressSection._workerNo)[0])
  if esSSW:isSet() then
    FGlobal_Show_Tooltip_Work(esSSW, uiBase)
  end
end

HouseProgressSection_Hide_Tooltip_Work = function()
  -- function num : 0_83 , upvalues : VCK, HouseProgressSection
  if isKeyPressed(VCK.KeyCode_CONTROL) then
    return 
  end
  local esSSW = ToClient_getItemExchangeSourceStaticStatusWrapperByWorker((HouseProgressSection._workerNo)[0])
  FGlobal_Hide_Tooltip_Work(esSSW, false)
end

HouseProgressSection_Show_Tooltip_LargeCraft = function()
  -- function num : 0_84 , upvalues : HouseProgressSection
  local staticStatusKey = HouseProgressSection._itemKey_Tooltip
  local uiBase = HouseProgressSection._Icon_BG
  if staticStatusKey == nil or uiBase == nil then
    return 
  end
  local staticStatusWrapper = getItemEnchantStaticStatus(staticStatusKey)
  Panel_Tooltip_Item_Show(staticStatusWrapper, uiBase, true, false)
end

FromClient_changeLeftHouseProgressSection = function(workerNo)
  -- function num : 0_85 , upvalues : waitingCancelWorkerNo
  local workStringNo = tostring(workerNo)
  -- DECOMPILER ERROR at PC4: Confused about usage of register: R2 in 'UnsetPending'

  waitingCancelWorkerNo[workStringNo] = true
end

registerEvent("FromClient_changeLeftWorking", "FromClient_changeLeftHouseProgressSection")
registerEvent("FromClient_ReceiveBuyHouse", "FromClient_ReceiveBuyHouse")
registerEvent("FromClient_ReceiveReturnHouse", "FromClient_ReceiveReturnHouse")
registerEvent("FromClient_ReceiveChangeUseType", "FGlobal_ReceiveChangeUseType")
registerEvent("FromClient_ReceiveSetMyHouse", "FromClient_ReceiveSetMyHouse")
registerEvent("FromClient_AppliedChangeUseType", "FromClient_AppliedChangeUseType")
registerEvent("WorldMap_StopWorkerWorking", "FromClient_House_StopWork")
registerEvent("WorldMap_WorkerDataUpdateByHouse", "FromClient_House_StartWork")
Panel_HouseControl:RegisterUpdateFunc("HouseProgressSection_Check")
local Refresh_HouseIcon_Texture = function(houseInfoSSWrapper)
  -- function num : 0_86
  if houseInfoSSWrapper == nil then
    return 
  end
  local _houseKey = houseInfoSSWrapper:getHouseKey()
  local _houseBtn = ToClient_findHouseButtonByKey(_houseKey)
  FGlobal_HouseHoldButtonSetBaseTexture(_houseBtn)
end

FromClient_ReceiveBuyHouse = function(houseInfoSSWrapper)
  -- function num : 0_87 , upvalues : Refresh_HouseIcon_Texture
  Refresh_HouseIcon_Texture(houseInfoSSWrapper)
  local NextHouseCount = houseInfoSSWrapper:getNextHouseCount()
  for idx = 0, NextHouseCount - 1 do
    local NextHouseInfoStaticStatusWrapper = houseInfoSSWrapper:getNextHouseInfoStaticStatusWrapper(idx)
    Refresh_HouseIcon_Texture(NextHouseInfoStaticStatusWrapper)
  end
  if Panel_House_SellBuy_Condition:GetShow() then
    handleClicked_Check_PrevHouse(false)
    if Panel_House_SellBuy_Condition:GetShow() and House_SellBuy_Condition.isAll == true then
      HandleClick_House_SellBuy_All()
    else
      -- DECOMPILER ERROR at PC37: Confused about usage of register: R2 in 'UnsetPending'

      House_SellBuy_Condition.isAll = false
    end
  end
  if Panel_HouseControl:GetShow() and HouseControlManager._houseKey == houseInfoSSWrapper:getHouseKey() then
    FGlobal_UpdateHouseControl(houseInfoSSWrapper)
  end
  if isWorldMapGrandOpen() then
    FGlobal_WorldMapGrand_NodeExplorePoint_Update()
  end
end

FromClient_ReceiveReturnHouse = function(houseInfoSSWrapper)
  -- function num : 0_88 , upvalues : Refresh_HouseIcon_Texture
  Refresh_HouseIcon_Texture(houseInfoSSWrapper)
  local NextHouseCount = houseInfoSSWrapper:getNextHouseCount()
  for idx = 0, NextHouseCount - 1 do
    local NextHouseInfoStaticStatusWrapper = houseInfoSSWrapper:getNextHouseInfoStaticStatusWrapper(idx)
    Refresh_HouseIcon_Texture(NextHouseInfoStaticStatusWrapper)
  end
  if Panel_House_SellBuy_Condition:GetShow() then
    handleClicked_Check_NextHouse(false)
    if Panel_House_SellBuy_Condition:GetShow() and House_SellBuy_Condition.isAll == true then
      HandleClick_House_SellBuy_All()
    else
      -- DECOMPILER ERROR at PC37: Confused about usage of register: R2 in 'UnsetPending'

      House_SellBuy_Condition.isAll = false
    end
  end
  if Panel_HouseControl:GetShow() and HouseControlManager._houseKey == houseInfoSSWrapper:getHouseKey() then
    FGlobal_UpdateHouseControl(houseInfoSSWrapper)
  end
  if isWorldMapGrandOpen() then
    FGlobal_WorldMapGrand_NodeExplorePoint_Update()
  end
end

FGlobal_ReceiveChangeUseType = function(houseInfoSSWrapper, hasPreviouseHouse)
  -- function num : 0_89 , upvalues : Refresh_HouseIcon_Texture
  local _houseKey = houseInfoSSWrapper:getHouseKey()
  local rentHouse = ToClient_GetRentHouseWrapper(_houseKey)
  local _currentGroupType = eHouseUseGroupType.Count
  if rentHouse ~= nil and rentHouse:isSet() == true then
    _currentGroupType = rentHouse:getHouseUseType()
  end
  if _currentGroupType == eHouseUseGroupType.Empty then
    FGlobal_MiniGame_HouseControl_Empty()
    if hasPreviouseHouse == true then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CHANGE_HOUSE_USETYPE_MYHOUSE"))
    end
  end
  if _currentGroupType == eHouseUseGroupType.Depot then
    FGlobal_MiniGame_HouseControl_Depot()
  end
  if _currentGroupType == eHouseUseGroupType.Refinery then
    FGlobal_MiniGame_HouseControl_Refinery()
  end
  if _currentGroupType == eHouseUseGroupType.LocalSpecailtiesWorkshop then
    FGlobal_MiniGame_HouseControl_LocalSpecailtiesWorkshop()
  end
  if _currentGroupType == eHouseUseGroupType.Shipyard then
    FGlobal_MiniGame_HouseControl_Shipyard()
  end
  Refresh_HouseIcon_Texture(houseInfoSSWrapper)
  local NextHouseCount = houseInfoSSWrapper:getNextHouseCount()
  for idx = 0, NextHouseCount - 1 do
    local NextHouseInfoStaticStatusWrapper = houseInfoSSWrapper:getNextHouseInfoStaticStatusWrapper(idx)
    Refresh_HouseIcon_Texture(NextHouseInfoStaticStatusWrapper)
  end
  local typeName = " "
  local needTime = 0
  local currentHouseLevel = 1
  local changeHouseKey = houseInfoSSWrapper:getHouseKey()
  local rentHouseWrapper = ToClient_GetRentHouseWrapper(changeHouseKey)
  if rentHouseWrapper:isSet() then
    local houseInfoStaticStatus = rentHouseWrapper:getStaticStatus()
    local index = houseInfoStaticStatus:getIndexByReceipeKey(rentHouseWrapper:getType())
    local craftWrapper = houseInfoStaticStatus:getHouseCraftWrapperByIndex(index)
    typeName = craftWrapper:getReciepeName()
    currentHouseLevel = rentHouseWrapper:getLevel()
    local currentUseType = rentHouseWrapper:getType()
    local houseInfoStaticStatusWrapper = ToClient_GetHouseInfoStaticStatusWrapper(changeHouseKey)
    if houseInfoStaticStatusWrapper:isSet() then
      needTime = houseInfoStaticStatusWrapper:getTransperTime(currentUseType, currentHouseLevel, currentHouseLevel)
    end
  end
  do
    if needTime ~= 0 then
      if currentHouseLevel > 1 then
        Proc_ShowMessage_Ack(houseInfoSSWrapper:getName() .. PAGetStringParam2(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_TYPENAME_MESSAGE_1", "typeName", typeName, "typeLevel", currentHouseLevel))
      else
        if currentHouseLevel == 1 then
          Proc_ShowMessage_Ack(houseInfoSSWrapper:getName() .. PAGetStringParam1(Defines.StringSheet_GAME, "LUA_HOUSECONTROL_TYPENAME_MESSAGE_2", "typeName", typeName))
        end
      end
    end
    if Panel_HouseControl:GetShow() and HouseControlManager._houseKey == houseInfoSSWrapper:getHouseKey() then
      FGlobal_UpdateHouseControl(houseInfoSSWrapper)
    end
    FGlobal_MyHouseNavi_Update()
  end
end

FromClient_ReceiveSetMyHouse = function(houseInfoSSWrapper)
  -- function num : 0_90 , upvalues : Refresh_HouseIcon_Texture
  Refresh_HouseIcon_Texture(houseInfoSSWrapper)
  local NextHouseCount = houseInfoSSWrapper:getNextHouseCount()
  for idx = 0, NextHouseCount - 1 do
    local NextHouseInfoStaticStatusWrapper = houseInfoSSWrapper:getNextHouseInfoStaticStatusWrapper(idx)
    Refresh_HouseIcon_Texture(NextHouseInfoStaticStatusWrapper)
  end
  if Panel_HouseControl:GetShow() and HouseControlManager._houseKey == houseInfoSSWrapper:getHouseKey() then
    HouseControlManager:clear()
    HouseControlManager:UpdateMyHouse()
    HouseControlManager:UpdateCommon()
  end
end

FromClient_AppliedChangeUseType = function(houseInfoSSWrapper)
  -- function num : 0_91 , upvalues : Refresh_HouseIcon_Texture
  Refresh_HouseIcon_Texture(houseInfoSSWrapper)
  local NextHouseCount = houseInfoSSWrapper:getNextHouseCount()
  for idx = 0, NextHouseCount - 1 do
    local NextHouseInfoStaticStatusWrapper = houseInfoSSWrapper:getNextHouseInfoStaticStatusWrapper(idx)
    Refresh_HouseIcon_Texture(NextHouseInfoStaticStatusWrapper)
  end
  FromClient_HouseControl_Refresh(houseInfoSSWrapper)
end

FromClient_House_StopWork = function(workerNo, isUserRequest)
  -- function num : 0_92 , upvalues : HouseProgressSection
  for key,value in pairs(HouseProgressSection._workerNo) do
    if value == workerNo then
      local houseInfoSSWrapper = ToClient_GetHouseInfoStaticStatusWrapper(HouseControlManager._houseKey)
      FromClient_HouseControl_Refresh(houseInfoSSWrapper)
      break
    end
  end
end

FromClient_House_StartWork = function(rentHouseWrapper)
  -- function num : 0_93 , upvalues : Refresh_HouseIcon_Texture
  local houseInfoSSWrapper = rentHouseWrapper:getStaticStatus()
  Refresh_HouseIcon_Texture(houseInfoSSWrapper)
  local NextHouseCount = houseInfoSSWrapper:getNextHouseCount()
  for idx = 0, NextHouseCount - 1 do
    local NextHouseInfoStaticStatusWrapper = houseInfoSSWrapper:getNextHouseInfoStaticStatusWrapper(idx)
    Refresh_HouseIcon_Texture(NextHouseInfoStaticStatusWrapper)
  end
  FromClient_HouseControl_Refresh(houseInfoSSWrapper)
end

FromClient_HouseControl_Refresh = function(houseInfoSSWrapper)
  -- function num : 0_94 , upvalues : Refresh_HouseIcon_Texture
  Refresh_HouseIcon_Texture(houseInfoSSWrapper)
  local NextHouseCount = houseInfoSSWrapper:getNextHouseCount()
  for idx = 0, NextHouseCount - 1 do
    local NextHouseInfoStaticStatusWrapper = houseInfoSSWrapper:getNextHouseInfoStaticStatusWrapper(idx)
    Refresh_HouseIcon_Texture(NextHouseInfoStaticStatusWrapper)
  end
  if Panel_HouseControl:GetShow() and HouseControlManager._houseKey == houseInfoSSWrapper:getHouseKey() then
    FGlobal_UpdateHouseControl(houseInfoSSWrapper)
  end
end

local prevHouse_List = {}
local prevHouse_List_Cost = {}
local best_Junction = 1
local prevHouse_List_End = function()
  -- function num : 0_95 , upvalues : prevHouse_List, prevHouse_List_Cost, best_Junction
  if #prevHouse_List < 0 or #prevHouse_List_Cost < 0 then
    return 
  end
  local save_Cost = 0
  for idx,value in pairs(prevHouse_List_Cost) do
    if idx == 1 then
      save_Cost = value
      best_Junction = idx
    else
      if value < save_Cost then
        save_Cost = value
        best_Junction = idx
      end
    end
  end
  show_PrevHouse(prevHouse_List[best_Junction], prevHouse_List_Cost[best_Junction], HouseControlManager._clickedUseType)
  FGLobal_PopupAdd(Panel_House_SellBuy_Condition)
  prevHouse_List = {}
  prevHouse_List_Cost = {}
end

prevHouse_List_Continue = function(continueList)
  -- function num : 0_96 , upvalues : prevHouse_List, prevHouse_List_Cost
  local prevHouse_Continue = continueList
  local temp_Continue = {}
  for i = 1, #prevHouse_Continue do
    local junction = prevHouse_Continue[i]
    local houseInfoStaticStatusWrapper = ToClient_GetHouseInfoStaticStatusWrapper((prevHouse_List[junction])[#prevHouse_List[junction]])
    local PrevHouseCount = houseInfoStaticStatusWrapper:getPrevHouseCount()
    for idx = 0, PrevHouseCount - 1 do
      -- DECOMPILER ERROR at PC35: Confused about usage of register: R14 in 'UnsetPending'

      if idx > 0 then
        if prevHouse_List[#prevHouse_List + 1] == nil then
          prevHouse_List[#prevHouse_List + 1] = {}
        end
        for index = 1, #prevHouse_List[junction] do
          -- DECOMPILER ERROR at PC50: Confused about usage of register: R18 in 'UnsetPending'

          (prevHouse_List[#prevHouse_List + 1])[index] = (prevHouse_List[junction])[index]
        end
        -- DECOMPILER ERROR at PC58: Confused about usage of register: R14 in 'UnsetPending'

        prevHouse_List_Cost[#prevHouse_List + 1] = prevHouse_List_Cost[junction]
        junction = #prevHouse_List + 1
      end
      local PrevHouseInfoStaticStatusWrapper = houseInfoStaticStatusWrapper:getPrevHouseInfoStaticStatusWrapper(idx)
      local HouseKey = PrevHouseInfoStaticStatusWrapper:getHouseKey()
      -- DECOMPILER ERROR at PC78: Confused about usage of register: R16 in 'UnsetPending'

      if ToClient_IsMyHouse(HouseKey) == false then
        (prevHouse_List[junction])[#prevHouse_List[junction] + 1] = HouseKey
        -- DECOMPILER ERROR at PC85: Confused about usage of register: R16 in 'UnsetPending'

        prevHouse_List_Cost[junction] = prevHouse_List_Cost[junction] + PrevHouseInfoStaticStatusWrapper:getNeedExplorePoint()
        temp_Continue[#temp_Continue + 1] = junction
      else
        -- DECOMPILER ERROR at PC101: Confused about usage of register: R16 in 'UnsetPending'

        if ToClient_IsMyLiveHouse(HouseKey) then
          (prevHouse_List[junction])[#prevHouse_List[junction] + 1] = HouseKey
          -- DECOMPILER ERROR at PC105: Confused about usage of register: R16 in 'UnsetPending'

          prevHouse_List_Cost[junction] = prevHouse_List_Cost[junction]
          temp_Continue[#temp_Continue + 1] = junction
        end
      end
    end
  end
  return temp_Continue
end

handleClicked_Check_PrevHouse = function(isRefresh)
  -- function num : 0_97 , upvalues : prevHouse_List, prevHouse_List_Cost, prevHouse_List_End
  clear_HouseSelectedAni_bySellBuy()
  local houseKey = HouseControlManager._houseKey
  if isRefresh == false and House_SellBuy_Condition.conditionKey ~= -1 then
    houseKey = House_SellBuy_Condition.conditionKey
    if ToClient_IsMyHouse(houseKey) == true then
      HandleClick_House_SellBuy_Close()
      return 
    end
  end
  prevHouse_List = {}
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R2 in 'UnsetPending'

  prevHouse_List[1] = {}
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (prevHouse_List[1])[1] = houseKey
  local houseInfoStaticStatusWrapper = ToClient_GetHouseInfoStaticStatusWrapper(houseKey)
  prevHouse_List_Cost = {}
  -- DECOMPILER ERROR at PC36: Confused about usage of register: R3 in 'UnsetPending'

  prevHouse_List_Cost[1] = houseInfoStaticStatusWrapper:getNeedExplorePoint()
  local temp_Continue = {}
  temp_Continue[1] = 1
  local maxCostCalcCount = 10
  local costCalcCount = 0
  while #temp_Continue > 0 and costCalcCount < maxCostCalcCount do
    temp_Continue = prevHouse_List_Continue(temp_Continue)
    costCalcCount = costCalcCount + 1
  end
  prevHouse_List_End()
end

local nextHouse_List = {}
local nextHouse_List_Cost = 0
local nextHouse_List_End = function()
  -- function num : 0_98 , upvalues : nextHouse_List, nextHouse_List_Cost
  if #nextHouse_List < 0 then
    return 
  end
  show_NextHouse(nextHouse_List, nextHouse_List_Cost)
  FGLobal_PopupAdd(Panel_House_SellBuy_Condition)
  nextHouse_List = {}
  nextHouse_List_Cost = 0
end

nextHouse_List_Check_StandAlnoe = function(currentKey, closedKey)
  -- function num : 0_99 , upvalues : nextHouse_List
  local checkKey = currentKey
  local temp_Continue = {}
  for idx = 1, #checkKey do
    local HouseKey = checkKey[idx]
    local houseInfoStaticStatusWrapper = ToClient_GetHouseInfoStaticStatusWrapper(HouseKey)
    local PrevHouseCount = houseInfoStaticStatusWrapper:getPrevHouseCount()
    if PrevHouseCount == 0 then
      return temp_Continue, true
    end
    for idx = 0, PrevHouseCount - 1 do
      local PrevHouseInfoStaticStatusWrapper = houseInfoStaticStatusWrapper:getPrevHouseInfoStaticStatusWrapper(idx)
      local PrevHouseKey = PrevHouseInfoStaticStatusWrapper:getHouseKey()
      if ToClient_IsMyHouse(PrevHouseKey) == true and PrevHouseKey ~= closedKey and PrevHouseKey ~= nextHouse_List[1] then
        temp_Continue[#temp_Continue + 1] = PrevHouseKey
      end
    end
  end
  return temp_Continue, false
end

nextHouse_List_Continue = function(continueList)
  -- function num : 0_100 , upvalues : nextHouse_List, nextHouse_List_Cost
  local nextHouse_Continue = continueList
  local temp_Continue = {}
  for i = 1, #nextHouse_Continue do
    local junction = nextHouse_Continue[i]
    local houseInfoStaticStatusWrapper = ToClient_GetHouseInfoStaticStatusWrapper(nextHouse_List[junction])
    local NextHouseCount = houseInfoStaticStatusWrapper:getNextHouseCount()
    for idx = 0, NextHouseCount - 1 do
      local NextHouseInfoStaticStatusWrapper = houseInfoStaticStatusWrapper:getNextHouseInfoStaticStatusWrapper(idx)
      local HouseKey = NextHouseInfoStaticStatusWrapper:getHouseKey()
      if ToClient_IsMyHouse(HouseKey) == true then
        local temp_HouseKey = {}
        temp_HouseKey[1] = HouseKey
        local isStandAlone = false
        local maxCostCalcCount = 10
        local costCalcCount = 0
        while #temp_HouseKey > 0 and costCalcCount < maxCostCalcCount do
          temp_HouseKey = nextHouse_List_Check_StandAlnoe(temp_HouseKey, nextHouse_List[junction])
          costCalcCount = costCalcCount + 1
        end
        houseInfoStaticStatusWrapper = ToClient_GetHouseInfoStaticStatusWrapper(nextHouse_List[junction])
        -- DECOMPILER ERROR at PC57: Confused about usage of register: R20 in 'UnsetPending'

        if isStandAlone == false then
          nextHouse_List[#nextHouse_List + 1] = HouseKey
          nextHouse_List_Cost = nextHouse_List_Cost + NextHouseInfoStaticStatusWrapper:getNeedExplorePoint()
          temp_Continue[#temp_Continue + 1] = #nextHouse_List
        end
      end
    end
  end
  return temp_Continue
end

handleClicked_Check_NextHouse = function(isRefresh)
  -- function num : 0_101 , upvalues : nextHouse_List, nextHouse_List_Cost, nextHouse_List_End
  clear_HouseSelectedAni_bySellBuy()
  local houseKey = HouseControlManager._houseKey
  if isRefresh == false and House_SellBuy_Condition.conditionKey ~= -1 then
    houseKey = House_SellBuy_Condition.conditionKey
    if ToClient_IsMyHouse(houseKey) == false then
      HandleClick_House_SellBuy_Close()
      return 
    end
  end
  nextHouse_List = {}
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R2 in 'UnsetPending'

  nextHouse_List[1] = houseKey
  local houseInfoStaticStatusWrapper = ToClient_GetHouseInfoStaticStatusWrapper(houseKey)
  nextHouse_List_Cost = houseInfoStaticStatusWrapper:getNeedExplorePoint()
  local temp_Continue = {}
  temp_Continue[1] = 1
  local maxCostCalcCount = 10
  local costCalcCount = 0
  while #temp_Continue > 0 and costCalcCount < maxCostCalcCount do
    temp_Continue = nextHouse_List_Continue(temp_Continue)
    costCalcCount = costCalcCount + 1
  end
  nextHouse_List_End()
end

FromClient_WorldMap_WorkerDataUpdateByHouseControl = function()
  -- function num : 0_102 , upvalues : currentWorkCountCheck
  HouseProgressSection_Init()
  currentWorkCountCheck = false
  HouseProgressSection_Update()
end

registerEvent("WorldMap_WorkerDataUpdate", "FromClient_WorldMap_WorkerDataUpdateByHouseControl")

