local Window_WorldMap_BottomMenuInfo = {
  _ui = {
    _static_RightBg = UI.getChildControl(Panel_Worldmap_BottomMenu, "Static_RightBg"),
    _static_LeftBg = UI.getChildControl(Panel_Worldmap_BottomMenu, "Static_LeftBg"),
    _bookMarkList = {},
    _findList = {},
    _currentList = {}
  },
  _config = {
    _bookMarkCount = 10,
    _findCount = 17,
    _bookMarkMode = 0,
    _findMode = 1
  },
  _strConfig = {
    [0] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_1"),
    [1] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_2"),
    [2] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_6"),
    [3] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_9"),
    [4] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_7"),
    [5] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_8"),
    [6] = PAGetString(Defines.StringSheet_GAME, "CHATTING_TAB_GUILD"),
    [7] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_5"),
    [8] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_16"),
    [9] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_17"),
    [10] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_18"),
    [11] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_19"),
    [12] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_20"),
    [13] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_21"),
    [14] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_29"),
    [15] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_22"),
    [16] = PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_NPCTYPETEXT_25")
  },
  _spawnType = {
    [0] = CppEnums.SpawnType.eSpawnType_SkillTrainer,
    [1] = CppEnums.SpawnType.eSpawnType_ItemRepairer,
    [2] = CppEnums.SpawnType.eSpawnType_WareHouse,
    [3] = CppEnums.SpawnType.eSpawnType_transfer,
    [4] = CppEnums.SpawnType.eSpawnType_Stable,
    [5] = CppEnums.SpawnType.eSpawnType_Wharf,
    [6] = CppEnums.SpawnType.eSpawnType_guild,
    [7] = CppEnums.SpawnType.eSpawnType_TradeMerchant,
    [8] = CppEnums.SpawnType.eSpawnType_Grocery,
    [9] = CppEnums.SpawnType.eSpawnType_Weapon,
    [10] = CppEnums.SpawnType.eSpawnType_Jewel,
    [11] = CppEnums.SpawnType.eSpawnType_Furniture,
    [12] = CppEnums.SpawnType.eSpawnType_Collect,
    [13] = CppEnums.SpawnType.eSpawnType_Fish,
    [14] = CppEnums.SpawnType.eSpawnType_Cook,
    [15] = CppEnums.SpawnType.eSpawnType_Worker,
    [16] = CppEnums.SpawnType.eSpawnType_ItemMarket
  },
  _currentIndex = 0
}
function Window_WorldMap_BottomMenuInfo:InitControl()
  self._ui._staticText_BookMarkTitle = UI.getChildControl(self._ui._static_LeftBg, "StaticText_MainTitle")
  self._ui._staticText_FindTitle = UI.getChildControl(self._ui._static_LeftBg, "StaticText_FindNpcTitle")
  self._ui._staticText_FindDecs = UI.getChildControl(self._ui._static_LeftBg, "StaticText_NpcType")
  self._ui._static_BookMarkBg = UI.getChildControl(self._ui._static_RightBg, "Static_BookMarkBg")
  self._ui._static_FindBg = UI.getChildControl(self._ui._static_RightBg, "Static_NpcTypeBg")
  for index = 0, self._config._bookMarkCount - 1 do
    self._ui._bookMarkList[index] = UI.getChildControl(self._ui._static_BookMarkBg, "RadioButton_" .. index + 1)
  end
  for index = 0, self._config._findCount - 1 do
    self._ui._findList[index] = UI.getChildControl(self._ui._static_FindBg, "RadioButton_" .. index + 11)
  end
  self._ui._static_KeyGuide_Select = UI.getChildControl(self._ui._static_FindBg, "StaticText_RT_ConsoleUI")
end
function Window_WorldMap_BottomMenuInfo:InitEvent()
end
function Window_WorldMap_BottomMenuInfo:InitRegister()
end
function Window_WorldMap_BottomMenuInfo:Initialize()
  self:InitControl()
  self:InitEvent()
  self:InitRegister()
end
function PaGlobalFunc_WorldMap_BottomMenu_UpdateMenu(value)
  local self = Window_WorldMap_BottomMenuInfo
  local count = #self._ui._currentList + 1
  self._currentIndex = self._currentIndex + value
  if self._currentIndex < 0 then
    self._currentIndex = count - 1
  end
  if count - 1 < self._currentIndex then
    self._currentIndex = 0
  end
  for index = 0, count - 1 do
    self._ui._currentList[index]:SetCheck(self._currentIndex == index)
  end
  self._ui._static_KeyGuide_Select:SetPosX(self._ui._currentList[self._currentIndex]:GetPosX() + 5)
  self._ui._staticText_FindDecs:SetText(self._strConfig[self._currentIndex])
end
function Window_WorldMap_BottomMenuInfo:FindNPC(index)
  local spawnType = self._spawnType[index]
  local player = getSelfPlayer()
  if nil == player then
    return
  end
  if player:get():getLevel() < 11 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_TUTORIAL_ACK"))
    return
  end
  if 0 ~= ToClient_GetMyTeamNoLocalWar() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_LOCALWAR_CANTNAVI_ACK"))
    return
  end
  _AudioPostEvent_SystemUiForXBOX(50, 0)
  ToClient_DeleteNaviGuideByGroup(0)
  local position = player:get3DPos()
  local nearNpcInfo = getNearNpcInfoByType(spawnType, position)
  if nil == nearNpcInfo then
    return
  end
  local curChannelData = getCurrentChannelServerData()
  if false == curChannelData._isMain and CppEnums.SpawnType.eSpawnType_TerritoryTrade == spawnType then
    NotifyDisplay(PAGetString(Defines.StringSheet_GAME, "LUA_WIDGET_TOWNNPCNAVI_IMPERIAL_DELIVERY_ONLY_FIRSTCH"))
    return
  end
  local isSpawnNearNpc = nearNpcInfo:isTimeSpawn()
  local pos = nearNpcInfo:getPosition()
  local npcNaviKey = ToClient_WorldMapNaviStart(pos, NavigationGuideParam(), false, false)
  _AudioPostEvent_SystemUiForXBOX(0, 14)
  local selfPlayer = player:get()
  selfPlayer:setNavigationMovePath(npcNaviKey)
  selfPlayer:checkNaviPathUI(npcNaviKey)
  if false == isSpawnNearNpc then
    NotifyDisplay(PAGetString(Defines.StringSheet_GAME, "NPCNAVIGATION_REST_AVAILABLE"))
  end
  Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TOWNNPCNAVI_NAVIGATIONDESCRIPTION", "npcName", tostring(self._strConfig[index])))
  PaGlobal_TutorialManager:handleClickedTownNpcIconNaviStart(spawnType, false)
end
function Window_WorldMap_BottomMenuInfo:UpdateWayPoint(index)
end
function PaGlobalFunc_WorldMap_BottomMenu_FindNPC()
  local self = Window_WorldMap_BottomMenuInfo
  self:FindNPC(self._currentIndex)
end
function PaGlobalFunc_WorldMap_BottomMenu_UpdateWayPoint()
  local self = Window_WorldMap_BottomMenuInfo
  self:UpdateWayPoint(self._currentIndex)
end
function PaGlobalFunc_WorldMap_BottomMenu_ModeChange()
  local self = Window_WorldMap_BottomMenuInfo
  self._ui._static_FindBg:SetShow(PaGlobalFunc_WorldMap_GetIsTownMode())
  self._ui._staticText_FindTitle:SetShow(PaGlobalFunc_WorldMap_GetIsTownMode())
  self._ui._staticText_FindDecs:SetShow(PaGlobalFunc_WorldMap_GetIsTownMode())
  if false == PaGlobalFunc_WorldMap_GetIsTownMode() then
  else
    self._ui._currentList = self._ui._findList
  end
end
function PaGlobalFunc_WorldMap_BottomMenu_GetShow()
  return Panel_Worldmap_BottomMenu:GetShow()
end
function PaGlobalFunc_WorldMap_BottomMenu_SetShow(isShow, isAni)
  Panel_Worldmap_BottomMenu:SetShow(isShow, isAni)
end
function PaGlobalFunc_WorldMap_BottomMenu_Open()
  local self = Window_WorldMap_BottomMenuInfo
  PaGlobalFunc_WorldMap_BottomMenu_ModeChange()
  PaGlobalFunc_WorldMap_BottomMenu_UpdateMenu(0)
  if true == PaGlobalFunc_WorldMap_BottomMenu_GetShow() then
    return
  end
  PaGlobal_ConsoleWorldMapKeyGuide_SetPos(true)
  PaGlobalFunc_WorldMap_BottomMenu_SetShow(true, false)
end
function PaGlobalFunc_WorldMap_BottomMenu_Close()
  if false == PaGlobalFunc_WorldMap_BottomMenu_GetShow() then
    return
  end
  PaGlobal_ConsoleWorldMapKeyGuide_SetPos(false)
  PaGlobalFunc_WorldMap_BottomMenu_SetShow(false, false)
end
function PaGlobalFunc_FromClient_WorldMap_BottomMenu_luaLoadComplete()
  local self = Window_WorldMap_BottomMenuInfo
  self:Initialize()
end
registerEvent("FromClient_luaLoadComplete", "PaGlobalFunc_FromClient_WorldMap_BottomMenu_luaLoadComplete")
