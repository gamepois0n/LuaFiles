-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\interaction\panel_interaction_friendhouselist.luac 

-- params : ...
-- function num : 0
local IM = CppEnums.EProcessorInputMode
Panel_Interaction_FriendHouseList:SetShow(false)
Panel_Interaction_FriendHouseList:ActiveMouseEventEffect(true)
Panel_Interaction_FriendHouseList:setGlassBackground(true)
local FriendHouseRank = {_txtTitle = (UI.getChildControl)(Panel_Interaction_FriendHouseList, "StaticText_Title"), _btnClose = (UI.getChildControl)(Panel_Interaction_FriendHouseList, "Button_Win_Close"), _btnHelp = (UI.getChildControl)(Panel_Interaction_FriendHouseList, "Button_Question"), _scroll = (UI.getChildControl)(Panel_Interaction_FriendHouseList, "Scroll_FriendList"), _listBg = (UI.getChildControl)(Panel_Interaction_FriendHouseList, "Static_BG"), 
_tab = {[0] = (UI.getChildControl)(Panel_Interaction_FriendHouseList, "RadioButton_Tab_Rank"), [1] = (UI.getChildControl)(Panel_Interaction_FriendHouseList, "RadioButton_Tab_Friend"), [2] = (UI.getChildControl)(Panel_Interaction_FriendHouseList, "RadioButton_Tab_Guild"), [3] = (UI.getChildControl)(Panel_Interaction_FriendHouseList, "RadioButton_Tab_Party")}
, _createTabCount = 4, 
_tabPool = {}
, _createListCount = 15, 
_listPool = {}
, _listCount = 0, _startIndex = 0, _selectedTabIdx = 0, 
_posConfig = {_tabStartPosX = 14, _tabPosXGap = 100, _listStartPosY = 83, _listPosYGap = 25}
}
;
(FriendHouseRank._btnHelp):SetShow(false)
FriendHouseRank.Initialize = function(self)
  -- function num : 0_0
  for listIdx = 0, self._createListCount - 1 do
    local list = {}
    list.name = (UI.createAndCopyBasePropertyControl)(Panel_Interaction_FriendHouseList, "StaticText_PlayerName", Panel_Interaction_FriendHouseList, "FriendHouseList_List_" .. listIdx)
    ;
    (list.name):SetPosX(18)
    ;
    (list.name):SetPosY((self._posConfig)._listStartPosY + (self._posConfig)._listPosYGap * listIdx)
    ;
    (list.name):addInputEvent("Mouse_UpScroll", "FriendHouseRank_ScrollEvent( true )")
    ;
    (list.name):addInputEvent("Mouse_DownScroll", "FriendHouseRank_ScrollEvent( false )")
    list.visitBtn = (UI.createAndCopyBasePropertyControl)(Panel_Interaction_FriendHouseList, "Button_Visit", list.name, "FriendHouseList_ListBtn_" .. listIdx)
    ;
    (list.visitBtn):SetPosX((list.name):GetSizeX() - (list.visitBtn):GetSizeX())
    ;
    (list.visitBtn):SetPosY(0)
    ;
    (list.visitBtn):addInputEvent("Mouse_UpScroll", "FriendHouseRank_ScrollEvent( true )")
    ;
    (list.visitBtn):addInputEvent("Mouse_DownScroll", "FriendHouseRank_ScrollEvent( false )")
    ;
    (UIScroll.InputEventByControl)(list.name, "FriendHouseRank_ScrollEvent")
    -- DECOMPILER ERROR at PC79: Confused about usage of register: R6 in 'UnsetPending'

    ;
    (self._listPool)[listIdx] = list
  end
end

FriendHouseRank.registEventHandler = function(self)
  -- function num : 0_1
  (self._listBg):addInputEvent("Mouse_UpScroll", "FriendHouseRank_ScrollEvent( true )")
  ;
  (self._listBg):addInputEvent("Mouse_DownScroll", "FriendHouseRank_ScrollEvent( false )")
  ;
  (self._listBg):SetIgnore(false)
  ;
  ((self._tab)[0]):addInputEvent("Mouse_LUp", "FriendHouseRank_SelectTab( " .. 0 .. " )")
  ;
  ((self._tab)[1]):addInputEvent("Mouse_LUp", "FriendHouseRank_SelectTab( " .. 1 .. " )")
  ;
  ((self._tab)[2]):addInputEvent("Mouse_LUp", "FriendHouseRank_SelectTab( " .. 2 .. " )")
  ;
  ((self._tab)[3]):addInputEvent("Mouse_LUp", "FriendHouseRank_SelectTab( " .. 3 .. " )")
  ;
  (self._btnClose):addInputEvent("Mouse_LUp", "FriendHouseRank_Close()")
  ;
  (UIScroll.InputEvent)(self._scroll, "FriendHouseRank_ScrollEvent")
end

FriendHouseRank.registMessageHandler = function(self)
  -- function num : 0_2
end

FriendHouseRank.Update = function(self)
  -- function num : 0_3 , upvalues : FriendHouseRank
  local self = FriendHouseRank
  for listIdx = 0, self._createListCount - 1 do
    local list = (self._listPool)[listIdx]
    ;
    (list.name):SetShow(false)
    ;
    (list.visitBtn):SetShow(false)
  end
  self._listCount = housing_getVisitableHouseWrapperCount()
  if self._listCount <= 0 then
    local list = (self._listPool)[0]
    ;
    (list.name):SetShow(true)
    ;
    (list.name):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INTERACTION_FRIENDHOUSELIST_EMPTYHOUSE"))
    ;
    (list.visitBtn):SetShow(true)
    ;
    (list.visitBtn):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INTERACTION_FRIENDHOUSELIST_VISIT"))
    ;
    (list.visitBtn):addInputEvent("Mouse_LUp", "FriendHouseRank_VisitFriend( " .. 0 .. ", false )")
  else
    do
      local count = 0
      for listIdx = self._startIndex, self._listCount - 1 do
        if self._createListCount <= count then
          break
        end
        local list = (self._listPool)[count]
        local VisitableHouseWrapper = housing_getVisitableHouseWrapper(listIdx)
        ;
        (list.name):SetShow(true)
        ;
        (list.name):SetText(PAGetStringParam3(Defines.StringSheet_GAME, "LUA_INTERACTION_FRIENDHOUSELIST_HOUSERANK", "listIdx", listIdx + 1, "getUserNickname", VisitableHouseWrapper:getUserNickname(), "getInteriorPoint", VisitableHouseWrapper:getInteriorPoint()))
        ;
        (list.visitBtn):SetShow(true)
        ;
        (list.visitBtn):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INTERACTION_FRIENDHOUSELIST_ENTREE"))
        ;
        (list.visitBtn):addInputEvent("Mouse_LUp", "FriendHouseRank_VisitFriend( " .. listIdx .. ", true )")
        count = count + 1
      end
      do
        _PA_LOG("유흥�\160", " FriendHouseRank:Update() - UIScroll.SetButtonSize " .. self._createListCount .. " " .. self._listCount)
        ;
        (UIScroll.SetButtonSize)(self._scroll, self._createListCount, self._listCount)
      end
    end
  end
end

FriendHouseRank_VisitFriend = function(index, isUse)
  -- function num : 0_4
  if isUse == true then
    housing_SelectVisitableHouse(index)
  else
    housing_visitEmptyHouse()
  end
  FriendHouseRank_Close()
end

FriendHouseRank_SelectTab = function(idx)
  -- function num : 0_5 , upvalues : FriendHouseRank
  local self = FriendHouseRank
  for listIdx = 0, self._createListCount - 1 do
    local list = (self._listPool)[listIdx]
    ;
    (list.name):SetShow(false)
    ;
    (list.visitBtn):SetShow(false)
  end
  self._startIndex = 0
  ;
  (UIScroll.SetButtonSize)(self._scroll, self._createListCount, 0)
  self._selectedTabIdx = idx
  housing_SelectVisitableHouseType(self._selectedTabIdx)
end

FriendHouseRank_ScrollEvent = function(isScrollUp)
  -- function num : 0_6 , upvalues : FriendHouseRank
  local self = FriendHouseRank
  self._startIndex = (UIScroll.ScrollEvent)(self._scroll, isScrollUp, self._createListCount, self._listCount, self._startIndex, 1)
  _PA_LOG("유흥�\160", "FriendHouseRank_ScrollEvent " .. self._startIndex)
  self:Update()
end

FGlobal_FriendHouseRank_Open = function()
  -- function num : 0_7 , upvalues : FriendHouseRank, IM
  local self = FriendHouseRank
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local posX = scrSizeX - scrSizeX / 2 + Panel_Interaction_FriendHouseList:GetSizeY() / 3
  local posY = scrSizeY - scrSizeY / 2 - Panel_Interaction_FriendHouseList:GetSizeY() / 2
  Panel_Interaction_FriendHouseList:SetPosX((string.format)("%.0f", posX))
  Panel_Interaction_FriendHouseList:SetPosY((string.format)("%.0f", posY))
  if not Panel_Interaction_FriendHouseList:GetShow() then
    Panel_Interaction_FriendHouseList:SetShow(true)
    ;
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
  end
  self:Update()
end

FriendHouseRank_Close = function()
  -- function num : 0_8 , upvalues : IM
  if not Panel_Interaction_FriendHouseList:GetShow() then
    return 
  end
  if Panel_Interaction_FriendHouseList:GetShow() then
    Panel_Interaction_FriendHouseList:SetShow(false)
    ;
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_GameMode)
  end
end

FromCLient_Interaction_FriendHouseRank_Update = function(type)
  -- function num : 0_9 , upvalues : FriendHouseRank
  local self = FriendHouseRank
  self._selectedTabIdx = type
  FGlobal_FriendHouseRank_Open()
end

registerEvent("EventUpdateHouseRankerList", "FGlobal_FriendHouseRank_Open")
registerEvent("EventUpdateVisitableHouseList", "FromCLient_Interaction_FriendHouseRank_Update")
FriendHouseRank:Initialize()
FriendHouseRank:registEventHandler()
FriendHouseRank:registMessageHandler()

