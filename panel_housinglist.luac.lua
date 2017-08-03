-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\housing\panel_housinglist.luac 

-- params : ...
-- function num : 0
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
Panel_HousingList:SetShow(false)
Panel_HousingList:setGlassBackground(true)
Panel_HousingList:ActiveMouseEventEffect(true)
Panel_HousingList:RegisterShowEventFunc(true, "Panel_HousingList_ShowAni()")
Panel_HousingList:RegisterShowEventFunc(false, "Panel_HousingList_HideAni()")
local isBeforeShow = false
local _naviCurrentInfo = nil
local HOUSE_CONTROL_COUNT = 9
Panel_HousingList_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_HousingList)
  local aniInfo1 = Panel_HousingList:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_HousingList:GetSizeX() / 2
  aniInfo1.AxisY = Panel_HousingList:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_HousingList:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_HousingList:GetSizeX() / 2
  aniInfo2.AxisY = Panel_HousingList:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_HousingList_HideAni = function()
  -- function num : 0_1
  Panel_HousingList:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_HousingList, 0, 0.1)
  aniInfo:SetHideAtEnd(true)
end

local HousingList = {_Static_BG = (UI.getChildControl)(Panel_HousingList, "Static_BG"), _Territory = (UI.getChildControl)(Panel_HousingList, "StaticText_Territory"), _TownName = (UI.getChildControl)(Panel_HousingList, "StaticText_TownName"), _Address = (UI.getChildControl)(Panel_HousingList, "StaticText_Address"), _Navi = (UI.getChildControl)(Panel_HousingList, "Button_Navi"), _btn_Close = (UI.getChildControl)(Panel_HousingList, "Button_Close"), _frame = (UI.getChildControl)(Panel_HousingList, "Frame_HousingList"), 
_housePos = {}
}
HousingList.frameContent = (UI.getChildControl)(HousingList._frame, "Frame_1_Content")
HousingList.frameScroll = (UI.getChildControl)(HousingList._frame, "Frame_1_VerticalScroll")
;
(HousingList.frameScroll):SetIgnore(false)
HousingList.Panel_HousingList_Initialize = function(self)
  -- function num : 0_2 , upvalues : HOUSE_CONTROL_COUNT
  (self.frameContent):DestroyAllChild()
  self.listArray = {}
  HOUSE_CONTROL_COUNT = ToClient_getMyDwellingCount()
  local guildHouseStaticStatusWrapper = ToClient_getMyGuildHouse()
  if guildHouseStaticStatusWrapper ~= nil then
    HOUSE_CONTROL_COUNT = HOUSE_CONTROL_COUNT + 1
  end
  HOUSE_CONTROL_COUNT = HOUSE_CONTROL_COUNT + ToClient_getMyVillaCount()
  for idx = 0, HOUSE_CONTROL_COUNT do
    local listArr = {}
    listArr._Territory = (UI.createAndCopyBasePropertyControl)(Panel_HousingList, "StaticText_Territory", self.frameContent, "HousingList_StaticText_Territory_" .. idx)
    listArr._TownName = (UI.createAndCopyBasePropertyControl)(Panel_HousingList, "StaticText_TownName", self.frameContent, "HousingList_StaticText_TownName_" .. idx)
    listArr._Address = (UI.createAndCopyBasePropertyControl)(Panel_HousingList, "StaticText_Address", self.frameContent, "HousingList_StaticText_Address_" .. idx)
    listArr._Navi = (UI.createAndCopyBasePropertyControl)(Panel_HousingList, "Button_Navi", self.frameContent, "HousingList_Button_Navi_" .. idx)
    -- DECOMPILER ERROR at PC66: Confused about usage of register: R7 in 'UnsetPending'

    ;
    (self.listArray)[idx] = listArr
  end
  for idx = 0, #self.listArray do
    (((self.listArray)[idx])._Territory):SetShow(false)
    ;
    (((self.listArray)[idx])._TownName):SetShow(false)
    ;
    (((self.listArray)[idx])._Address):SetShow(false)
    ;
    (((self.listArray)[idx])._Navi):SetShow(false)
  end
  ;
  (self.frameContent):SetIgnore(false)
  ;
  (self.frameContent):addInputEvent("Mouse_DownScroll", "HousingList_ScrollEvent( true )")
  ;
  (self.frameContent):addInputEvent("Mouse_UpScroll", "HousingList_ScrollEvent( false )")
  ;
  (self.frameScroll):SetControlTop()
  ;
  (self._frame):UpdateContentScroll()
  ;
  (self._frame):UpdateContentPos()
end

HousingList_ScrollEvent = function(isDown)
  -- function num : 0_3 , upvalues : HousingList
  local self = HousingList
  if isDown then
    (self.frameScroll):ControlButtonDown()
  else
    ;
    (self.frameScroll):ControlButtonUp()
  end
  ;
  (self._frame):UpdateContentScroll()
end

Panel_HousingList_Update = function()
  -- function num : 0_4 , upvalues : HousingList
  HousingList:Panel_HousingList_Initialize()
  local self = HousingList
  local _myDwellingCount = ToClient_getMyDwellingCount()
  local _PosY = 0
  if _myDwellingCount > 0 then
    for idx = 0, _myDwellingCount - 1 do
      local characterStaticStatusWrapper = ToClient_getMyDwelling(idx)
      if characterStaticStatusWrapper ~= nil and characterStaticStatusWrapper:getName() ~= nil then
        local houseX = (characterStaticStatusWrapper:getObjectStaticStatus()):getHousePosX()
        local houseY = (characterStaticStatusWrapper:getObjectStaticStatus()):getHousePosY()
        local houseZ = (characterStaticStatusWrapper:getObjectStaticStatus()):getHousePosZ()
        local housePos = float3(houseX, houseY, houseZ)
        -- DECOMPILER ERROR at PC40: Confused about usage of register: R12 in 'UnsetPending'

        ;
        (self._housePos)[idx] = housePos
        local regionWrapper = ToClient_getRegionInfoWrapperByPosition(housePos)
        if idx ~= 0 then
          _PosY = (self._Territory):GetSizeY() + 7 + _PosY
        end
        ;
        (((self.listArray)[idx])._Territory):SetText(regionWrapper:getTerritoryName())
        ;
        (((self.listArray)[idx])._Territory):SetPosX(18)
        ;
        (((self.listArray)[idx])._Territory):SetPosY(_PosY)
        ;
        (((self.listArray)[idx])._Territory):SetShow(true)
        ;
        (((self.listArray)[idx])._TownName):SetText(regionWrapper:getAreaName())
        ;
        (((self.listArray)[idx])._TownName):SetPosX(150)
        ;
        (((self.listArray)[idx])._TownName):SetPosY(_PosY)
        ;
        (((self.listArray)[idx])._TownName):SetShow(true)
        ;
        (((self.listArray)[idx])._Address):SetText(characterStaticStatusWrapper:getName())
        ;
        (((self.listArray)[idx])._Address):SetPosX(310)
        ;
        (((self.listArray)[idx])._Address):SetPosY(_PosY)
        ;
        (((self.listArray)[idx])._Address):SetShow(true)
        ;
        (((self.listArray)[idx])._Navi):SetPosX(520)
        ;
        (((self.listArray)[idx])._Navi):SetPosY(_PosY + 2)
        ;
        (((self.listArray)[idx])._Navi):SetShow(true)
        ;
        (((self.listArray)[idx])._Navi):addInputEvent("Mouse_LUp", "_HousingListNavigatorStart(" .. idx .. "," .. _myDwellingCount .. ")")
      end
    end
  end
  do
    local idx = _myDwellingCount
    local guildHouseStaticStatusWrapper = ToClient_getMyGuildHouse()
    if guildHouseStaticStatusWrapper ~= nil and guildHouseStaticStatusWrapper ~= nil and guildHouseStaticStatusWrapper:getName() ~= nil then
      local houseX = (guildHouseStaticStatusWrapper:getObjectStaticStatus()):getHousePosX()
      local houseY = (guildHouseStaticStatusWrapper:getObjectStaticStatus()):getHousePosY()
      local houseZ = (guildHouseStaticStatusWrapper:getObjectStaticStatus()):getHousePosZ()
      local housePos = float3(houseX, houseY, houseZ)
      -- DECOMPILER ERROR at PC186: Confused about usage of register: R9 in 'UnsetPending'

      ;
      (self._housePos)[idx] = housePos
      local regionWrapper = ToClient_getRegionInfoWrapperByPosition(housePos)
      if idx ~= 0 then
        _PosY = (self._Territory):GetSizeY() + 7 + (_PosY)
      end
      ;
      (((self.listArray)[idx])._Territory):SetText(regionWrapper:getTerritoryName())
      ;
      (((self.listArray)[idx])._Territory):SetPosX(18)
      ;
      (((self.listArray)[idx])._Territory):SetPosY(_PosY)
      ;
      (((self.listArray)[idx])._Territory):SetShow(true)
      ;
      (((self.listArray)[idx])._TownName):SetText(regionWrapper:getAreaName())
      ;
      (((self.listArray)[idx])._TownName):SetPosX(150)
      ;
      (((self.listArray)[idx])._TownName):SetPosY(_PosY)
      ;
      (((self.listArray)[idx])._TownName):SetShow(true)
      ;
      (((self.listArray)[idx])._Address):SetText(guildHouseStaticStatusWrapper:getName())
      ;
      (((self.listArray)[idx])._Address):SetPosX(310)
      ;
      (((self.listArray)[idx])._Address):SetPosY(_PosY)
      ;
      (((self.listArray)[idx])._Address):SetShow(true)
      ;
      (((self.listArray)[idx])._Navi):SetPosX(520)
      ;
      (((self.listArray)[idx])._Navi):SetPosY(_PosY + 2)
      ;
      (((self.listArray)[idx])._Navi):SetShow(true)
      ;
      (((self.listArray)[idx])._Navi):addInputEvent("Mouse_LUp", "_HousingListNavigatorStart_GuildHouse(" .. idx .. ")")
    end
    do
      idx = idx + 1
      local _myVillaCount = ToClient_getMyVillaCount()
      if _myVillaCount > 0 then
        for villaIdx = 0, _myVillaCount - 1 do
          local characterStaticStatusWrapper = ToClient_getMyVilla(villaIdx)
          if characterStaticStatusWrapper ~= nil and characterStaticStatusWrapper:getName() ~= nil then
            local houseX = (characterStaticStatusWrapper:getObjectStaticStatus()):getHousePosX()
            local houseY = (characterStaticStatusWrapper:getObjectStaticStatus()):getHousePosY()
            local houseZ = (characterStaticStatusWrapper:getObjectStaticStatus()):getHousePosZ()
            local housePos = float3(houseX, houseY, houseZ)
            -- DECOMPILER ERROR at PC336: Confused about usage of register: R15 in 'UnsetPending'

            ;
            (self._housePos)[idx] = housePos
            local regionWrapper = ToClient_getRegionInfoWrapperByPosition(housePos)
            if idx ~= 0 then
              _PosY = (self._Territory):GetSizeY() + 7 + (_PosY)
            end
            ;
            (((self.listArray)[idx])._Territory):SetText(regionWrapper:getTerritoryName())
            ;
            (((self.listArray)[idx])._Territory):SetPosX(18)
            ;
            (((self.listArray)[idx])._Territory):SetPosY(_PosY)
            ;
            (((self.listArray)[idx])._Territory):SetShow(true)
            ;
            (((self.listArray)[idx])._TownName):SetText(regionWrapper:getAreaName())
            ;
            (((self.listArray)[idx])._TownName):SetPosX(150)
            ;
            (((self.listArray)[idx])._TownName):SetPosY(_PosY)
            ;
            (((self.listArray)[idx])._TownName):SetShow(true)
            ;
            (((self.listArray)[idx])._Address):SetText(characterStaticStatusWrapper:getName())
            ;
            (((self.listArray)[idx])._Address):SetPosX(310)
            ;
            (((self.listArray)[idx])._Address):SetPosY(_PosY)
            ;
            (((self.listArray)[idx])._Address):SetShow(true)
            ;
            (((self.listArray)[idx])._Navi):SetPosX(520)
            ;
            (((self.listArray)[idx])._Navi):SetPosY(_PosY + 2)
            ;
            (((self.listArray)[idx])._Navi):SetShow(true)
            ;
            (((self.listArray)[idx])._Navi):addInputEvent("Mouse_LUp", "_HousingListNavigatorStart_Villa(" .. villaIdx .. ")")
            idx = idx + 1
          end
        end
      end
      do
        if idx > 6 then
          (self.frameScroll):SetShow(true)
        else
          ;
          (self.frameScroll):SetShow(false)
        end
      end
    end
  end
end

_HousingListNavigatorStart = function(idx, _myDwellingCount)
  -- function num : 0_5 , upvalues : HousingList, HOUSE_CONTROL_COUNT, _naviCurrentInfo
  local self = HousingList
  ToClient_DeleteNaviGuideByGroup(0)
  for ii = 0, HOUSE_CONTROL_COUNT do
    (((self.listArray)[ii])._Navi):SetCheck(false)
  end
  if _naviCurrentInfo ~= idx then
    local navigationGuideParam = NavigationGuideParam()
    navigationGuideParam._isAutoErase = true
    worldmapNavigatorStart((HousingList._housePos)[idx], navigationGuideParam, false, false, true)
    ;
    (((self.listArray)[idx])._Navi):SetCheck(true)
    _naviCurrentInfo = idx
  else
    do
      _naviCurrentInfo = nil
    end
  end
end

_HousingListNavigatorStart_GuildHouse = function(ctrlIndex)
  -- function num : 0_6 , upvalues : HousingList, HOUSE_CONTROL_COUNT, _naviCurrentInfo
  local self = HousingList
  ToClient_DeleteNaviGuideByGroup(0)
  for ii = 0, HOUSE_CONTROL_COUNT do
    (((self.listArray)[ii])._Navi):SetCheck(false)
  end
  if _naviCurrentInfo ~= ctrlIndex then
    local navigationGuideParam = NavigationGuideParam()
    navigationGuideParam._isAutoErase = true
    worldmapNavigatorStart((HousingList._housePos)[ctrlIndex], navigationGuideParam, false, false, true)
    ;
    (((self.listArray)[ctrlIndex])._Navi):SetCheck(true)
    _naviCurrentInfo = ctrlIndex
  else
    do
      _naviCurrentInfo = nil
    end
  end
end

_HousingListNavigatorStart_Villa = function(ctrlIndex)
  -- function num : 0_7 , upvalues : HousingList, HOUSE_CONTROL_COUNT, _naviCurrentInfo
  local self = HousingList
  ToClient_DeleteNaviGuideByGroup(0)
  for ii = 0, HOUSE_CONTROL_COUNT do
    (((self.listArray)[ii])._Navi):SetCheck(false)
  end
  if _naviCurrentInfo ~= ctrlIndex then
    local navigationGuideParam = NavigationGuideParam()
    navigationGuideParam._isAutoErase = true
    worldmapNavigatorStart((HousingList._housePos)[ctrlIndex], navigationGuideParam, false, false, true)
    ;
    (((self.listArray)[ctrlIndex])._Navi):SetCheck(true)
    _naviCurrentInfo = ctrlIndex
  else
    do
      _naviCurrentInfo = nil
    end
  end
end

FGlobal_HousingList_Open = function()
  -- function num : 0_8
  audioPostEvent_SystemUi(13, 6)
  Panel_HousingList_Update()
  if Panel_HousingList:IsShow() then
    Panel_HousingList:SetShow(false, true)
  else
    Panel_HousingList:SetShow(true, true)
  end
end

HousingList_Close = function()
  -- function num : 0_9
  audioPostEvent_SystemUi(13, 5)
  Panel_HousingList:SetShow(false, false)
end

HandleClicked_HousingList_Close = function()
  -- function num : 0_10
  HousingList_Close()
end

HousingList.registEventHandler = function(self)
  -- function num : 0_11
  (self._btn_Close):addInputEvent("Mouse_LUp", "HandleClicked_HousingList_Close()")
end

renderModeChange_Panel_HousingList_Update = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_12
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  Panel_HousingList_Update()
end

registerEvent("FromClient_RenderModeChangeState", "renderModeChange_Panel_HousingList_Update")
HousingList:registEventHandler()

