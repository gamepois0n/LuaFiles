-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\worldmap_grand\wordmap_craft\worldmap_grand_guildcraft_changeworker.luac 

-- params : ...
-- function num : 0
Worldmap_Grand_GuildCraft_ChangeWorker:SetShow(false)
Worldmap_Grand_GuildCraft_ChangeWorker:ActiveMouseEventEffect(true)
Worldmap_Grand_GuildCraft_ChangeWorker:setGlassBackground(true)
local GuildCraft_ChangeWorker = {
ui = {btn_close = (UI.getChildControl)(Worldmap_Grand_GuildCraft_ChangeWorker, "Button_Win_Close"), scroll = (UI.getChildControl)(Worldmap_Grand_GuildCraft_ChangeWorker, "Scroll"), bg = (UI.getChildControl)(Worldmap_Grand_GuildCraft_ChangeWorker, "Static_BG")}
, 
config = {maxListCount = 5, totalRaw = 0, startIdx = 0, houseKeyRaw = nil}
, 
uiPool = {
worker = {}
}
}
local workerNoRawArray = {}
GuildCraft_ChangeWorker.Init = function(self)
  -- function num : 0_0
  for listIdx = 0, (self.config).maxListCount - 1 do
    -- DECOMPILER ERROR at PC9: Confused about usage of register: R5 in 'UnsetPending'

    ((self.uiPool).worker)[listIdx] = {}
    local list = ((self.uiPool).worker)[listIdx]
    list.bg = (UI.createAndCopyBasePropertyControl)(Worldmap_Grand_GuildCraft_ChangeWorker, "Static_WorkerBG", (self.ui).bg, "GuildCraft_ChangeWorker_WorkerBG_" .. listIdx)
    list.name = (UI.createAndCopyBasePropertyControl)(Worldmap_Grand_GuildCraft_ChangeWorker, "StaticText_WorkerName", list.bg, "GuildCraft_ChangeWorker_WorkerName_" .. listIdx)
    list.homeway = (UI.createAndCopyBasePropertyControl)(Worldmap_Grand_GuildCraft_ChangeWorker, "StaticText_HomeWay", list.bg, "GuildCraft_ChangeWorker_WorkerHomeWay_" .. listIdx)
    list.selectBtn = (UI.createAndCopyBasePropertyControl)(Worldmap_Grand_GuildCraft_ChangeWorker, "Button_Select", list.bg, "GuildCraft_ChangeWorker_SelectBtn_" .. listIdx)
    ;
    (list.bg):SetSpanSize(5, ((list.bg):GetSizeY() + 3) * listIdx + 5)
    ;
    (list.name):SetSpanSize(5, 5)
    ;
    (list.homeway):SetSpanSize(10, 25)
    ;
    (list.selectBtn):SetSpanSize(225, 5)
    ;
    (list.bg):SetShow(false)
    ;
    (list.bg):SetIgnore(false)
    ;
    (list.homeway):SetTextMode((CppEnums.TextMode).eTextMode_Limit_AutoWrap)
  end
  ;
  ((self.ui).btn_close):addInputEvent("Mouse_LUp", "HandleClicked_GuildCraft_ChangeWorker_Close()")
  ;
  ((self.ui).bg):addInputEvent("Mouse_UpScroll", "GuildCraft_ChangeWorker_ScrollEvent( true )")
  ;
  ((self.ui).bg):addInputEvent("Mouse_DownScroll", "GuildCraft_ChangeWorker_ScrollEvent( false )")
  ;
  (UIScroll.InputEvent)((self.ui).scroll, "GuildCraft_ChangeWorker_ScrollEvent")
end

GuildCraft_ChangeWorker:Init()
GuildCraft_ChangeWorker.Update = function(self)
  -- function num : 0_1 , upvalues : workerNoRawArray
  workerNoRawArray = {}
  for idx = 0, (self.config).maxListCount - 1 do
    local list = ((self.uiPool).worker)[idx]
    ;
    (list.bg):SetShow(false)
    ;
    (list.selectBtn):addInputEvent("Mouse_LUp", "")
  end
  local myWorkerCount = ToClient_getMyNpcWorkerCount()
  local waitWorkerCount = 0
  for workerIdx = 0, myWorkerCount - 1 do
    local workerWrapper = ToClient_getMyNpcWorkerByIndex(workerIdx)
    local workerNoRaw = ((workerWrapper:get()):getWorkerNo()):get_s64()
    local workerWrapperLua = getWorkerWrapper(workerNoRaw, true)
    -- DECOMPILER ERROR at PC50: Confused about usage of register: R10 in 'UnsetPending'

    if workerWrapperLua:isWorking() == false and workerWrapperLua:getIsAuctionInsert() == false then
      workerNoRawArray[waitWorkerCount] = workerNoRaw
      waitWorkerCount = waitWorkerCount + 1
    end
  end
  -- DECOMPILER ERROR at PC54: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self.config).totalRaw = waitWorkerCount
  local uiCount = 0
  for workerIdx = (self.config).startIdx, waitWorkerCount - 1 do
    if (self.config).maxListCount <= uiCount then
      break
    end
    local workerWrapperLua = getWorkerWrapper(workerNoRawArray[workerIdx], true)
    local workerLev = workerWrapperLua:getLevel()
    local workerGrade = workerWrapperLua:getGrade()
    local workerGradeColor = workerWrapperLua:getGradeToColorString()
    local workerName = workerWrapperLua:getName()
    local workerCurrentAp = workerWrapperLua:getActionPoint()
    local workerMaxAp = workerWrapperLua:getMaxActionPoint()
    local workerHomeWayPoint = workerWrapperLua:getHomeWaypoint()
    local guildHouseInfoSSW = ToClient_GetGuildHouseInfoStaticStatusWrapper((self.config).houseKeyRaw)
    local parentNodeKey = guildHouseInfoSSW:getParentNodeKey()
    local isWorkable = workerWrapperLua:isWorkingable(parentNodeKey)
    local homeName = ToClient_GetNodeNameByWaypointKey(workerHomeWayPoint)
    if isWorkable then
      homeName = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLDMAP_GUILDCRAFT_WORKER_HOME_LINK", "HomeName", homeName)
    else
      homeName = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WORLDMAP_GUILDCRAFT_WORKER_HOME_UNLINK", "HomeName", homeName)
    end
    local list = ((self.uiPool).worker)[uiCount]
    ;
    (list.bg):SetShow(true)
    ;
    (list.name):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. workerLev .. " " .. workerGradeColor .. workerName .. "<PAOldColor> (" .. workerCurrentAp .. "/" .. workerMaxAp .. ")")
    ;
    (list.homeway):SetText(homeName)
    ;
    (list.bg):addInputEvent("Mouse_On", "GuildCraft_ChangeWorker_WorkerTooltip( true,\t" .. uiCount .. ", " .. workerIdx .. " )")
    ;
    (list.bg):addInputEvent("Mouse_Out", "GuildCraft_ChangeWorker_WorkerTooltip( false,\t" .. uiCount .. ", " .. workerIdx .. " )")
    ;
    (list.bg):addInputEvent("Mouse_UpScroll", "GuildCraft_ChangeWorker_ScrollEvent( true )")
    ;
    (list.bg):addInputEvent("Mouse_DownScroll", "GuildCraft_ChangeWorker_ScrollEvent( false )")
    ;
    (list.selectBtn):addInputEvent("Mouse_LUp", "HandleClicked_GuildCraft_SetChangeWorker( " .. workerIdx .. ", " .. parentNodeKey .. " )")
    uiCount = uiCount + 1
  end
  do
    ;
    (UIScroll.SetButtonSize)((self.ui).scroll, (self.config).maxListCount, (self.config).totalRaw)
    if (((self.ui).scroll):GetControlButton()):GetSizeY() < 20 then
      (((self.ui).scroll):GetControlButton()):SetSize(10, 50)
    end
    if (self.config).maxListCount < waitWorkerCount then
      ((self.ui).scroll):SetShow(true)
    else
      ;
      ((self.ui).scroll):SetShow(false)
    end
  end
end

GuildCraft_ChangeWorker_ScrollEvent = function(isUp)
  -- function num : 0_2 , upvalues : GuildCraft_ChangeWorker
  local self = GuildCraft_ChangeWorker
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self.config).startIdx = (UIScroll.ScrollEvent)((self.ui).scroll, isUp, (self.config).maxListCount, (self.config).totalRaw, (self.config).startIdx, 1)
  self:Update()
end

GuildCraft_ChangeWorker_WorkerTooltip = function(isShow, uiIdx, workerIdx)
  -- function num : 0_3 , upvalues : GuildCraft_ChangeWorker, workerNoRawArray
  local control = (((GuildCraft_ChangeWorker.uiPool).worker)[uiIdx]).bg
  local workerNoRaw = workerNoRawArray[workerIdx]
  if isShow == true then
    FGlobal_ShowWorkerTooltipByWorkerNoRaw(workerNoRaw, control)
  else
    FGlobal_HideWorkerTooltip()
  end
end

HandleClicked_GuildCraft_SetChangeWorker = function(workerIdx)
  -- function num : 0_4 , upvalues : workerNoRawArray
  local workerNoRaw = workerNoRawArray[workerIdx]
  FGlobal_GuildCraft_SetWorker(workerNoRaw)
  HandleClicked_GuildCraft_ChangeWorker_Close()
end

FGlobal_GuildCraft_ChangeWorker_Open = function(houseKeyRaw)
  -- function num : 0_5 , upvalues : GuildCraft_ChangeWorker
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  (GuildCraft_ChangeWorker.config).houseKeyRaw = houseKeyRaw
  GuildCraft_ChangeWorker:Update()
end

HandleClicked_GuildCraft_ChangeWorker_Close = function()
  -- function num : 0_6 , upvalues : GuildCraft_ChangeWorker
  WorldMapPopupManager:pop()
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (GuildCraft_ChangeWorker.config).houseKeyRaw = nil
end

GuildCraft_ChangeWorker_onScreenResize = function()
  -- function num : 0_7
  Worldmap_Grand_GuildCraft_ChangeWorker:ComputePos()
end

registerEvent("onScreenResize", "GuildCraft_ChangeWorker_onScreenResize")

