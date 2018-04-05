-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\worldmap_grand\new_worldmap_nodestable.luac 

-- params : ...
-- function num : 0
Panel_NodeStable:SetShow(false)
Panel_NodeStable:SetDragEnable(false)
Panel_NodeStable:ActiveMouseEventEffect(true)
Panel_NodeStable:setGlassBackground(true)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local isContentsStallionEnable = ToClient_IsContentsGroupOpen("243")
local isContentsNineTierEnable = ToClient_IsContentsGroupOpen("80")
local nodeStableList = {
_config = {
slot = {startX = 7, startY = 9, gapY = 121}
, 
icon = {startX = 7, startY = -3, startNameX = 8, startNameY = 97, startEffectX = -1, startEffectY = -1, startSexIconX = 5, startSexIconY = 3, startGradeX = 87, startGradeY = 10, startLevelX = 8, startLevelY = 86, startStateX = 9, startStateY = 27}
, slotCount = 3}
, _List_Button_Close = (UI.getChildControl)(Panel_NodeStable, "List_Button_Close"), _staticListBG = (UI.getChildControl)(Panel_NodeStable, "List_ListBG"), _staticSlotCount = (UI.getChildControl)(Panel_NodeStable, "List_SlotCountValue"), _scroll = (UI.getChildControl)(Panel_NodeStable, "Scroll_Slot_List"), _slots = (Array.new)(), _selectSlotNo = nil, _startSlotIndex = 0, _nodeWaypointKey = 0, _nodeServantCount = 0}
nodeStableList.init = function(self)
  -- function num : 0_0
  for slotidx = 0, (self._config).slotCount - 1 do
    local slot = {}
    slot.slotNo = slotidx
    slot.panel = Panel_NodeStable
    slot.button = (UI.createAndCopyBasePropertyControl)(Panel_NodeStable, "List_SlotBG", self._staticListBG, "nodeStableList_Slot_" .. slotidx)
    slot.icon = (UI.createAndCopyBasePropertyControl)(Panel_NodeStable, "List_Icon", slot.button, "nodeStableList_Slot_Icon_" .. slotidx)
    slot.name = (UI.createAndCopyBasePropertyControl)(Panel_NodeStable, "List_Name_Value", slot.button, "nodeStableList_Slot_Name_" .. slotidx)
    slot.maleIcon = (UI.createAndCopyBasePropertyControl)(Panel_NodeStable, "List_MaleIcon", slot.button, "nodeStableList_Slot_IconMale_" .. slotidx)
    slot.femaleIcon = (UI.createAndCopyBasePropertyControl)(Panel_NodeStable, "List_FemaleIcon", slot.button, "nodeStableList_Slot_IconFemale_" .. slotidx)
    slot.grade = (UI.createAndCopyBasePropertyControl)(Panel_NodeStable, "List_Tear_Value", slot.button, "nodeStableList_Slot_Grade_" .. slotidx)
    slot.level = (UI.createAndCopyBasePropertyControl)(Panel_NodeStable, "List_Level_Value", slot.button, "nodeStableList_Slot_Level_" .. slotidx)
    slot.effect = (UI.createAndCopyBasePropertyControl)(Panel_NodeStable, "List_ButtonEffect", slot.button, "nodeStableList_Slot_Effect_" .. slotidx)
    slot.coma = (UI.createAndCopyBasePropertyControl)(Panel_NodeStable, "List_Coma", slot.button, "nodeStableList_Slot_Coma_" .. slotidx)
    slot.link = (UI.createAndCopyBasePropertyControl)(Panel_NodeStable, "List_Link", slot.button, "nodeStableList_Slot_Link_" .. slotidx)
    slot.registerMating = (UI.createAndCopyBasePropertyControl)(Panel_NodeStable, "List_RegisterMating", slot.button, "nodeStableList_Slot_RegisterMating_" .. slotidx)
    slot.registerMarket = (UI.createAndCopyBasePropertyControl)(Panel_NodeStable, "List_RegisterMarket", slot.button, "nodeStableList_Slot_RegisterMarket_" .. slotidx)
    slot.mating = (UI.createAndCopyBasePropertyControl)(Panel_NodeStable, "List_Mating", slot.button, "nodeStableList_Slot_Mating_" .. slotidx)
    slot.matingComplete = (UI.createAndCopyBasePropertyControl)(Panel_NodeStable, "List_MatingComplete", slot.button, "nodeStableList_Slot_MatingCompletes_" .. slotidx)
    slot.isSeized = (UI.createAndCopyBasePropertyControl)(Panel_NodeStable, "List_Seized", slot.button, "nodeStableList_Slot_Seized_" .. slotidx)
    slot.stallionIcon = (UI.createAndCopyBasePropertyControl)(Panel_NodeStable, "List_iconStallion", slot.button, "nodeStableList_Slot_Stallion_" .. slotidx)
    local slotConfig = (self._config).slot
    ;
    (slot.button):SetPosX(slotConfig.startX)
    ;
    (slot.button):SetPosY(slotConfig.startY + slotConfig.gapY * slotidx)
    local iconConfig = (self._config).icon
    ;
    (slot.icon):SetPosX(iconConfig.startX)
    ;
    (slot.icon):SetPosY(iconConfig.startY)
    ;
    (slot.name):SetPosX(iconConfig.startNameX)
    ;
    (slot.name):SetPosY(iconConfig.startNameY)
    ;
    (slot.effect):SetPosX(iconConfig.startEffectX)
    ;
    (slot.effect):SetPosY(iconConfig.startEffectY)
    ;
    (slot.maleIcon):SetPosX(iconConfig.startSexIconX)
    ;
    (slot.maleIcon):SetPosY(iconConfig.startSexIconY)
    ;
    (slot.femaleIcon):SetPosX(iconConfig.startSexIconX)
    ;
    (slot.femaleIcon):SetPosY(iconConfig.startSexIconY)
    ;
    (slot.registerMating):SetPosX(iconConfig.startStateX)
    ;
    (slot.registerMating):SetPosY(iconConfig.startStateY)
    ;
    (slot.registerMarket):SetPosX(iconConfig.startStateX)
    ;
    (slot.registerMarket):SetPosY(iconConfig.startStateY)
    ;
    (slot.grade):SetPosX(iconConfig.startGradeX)
    ;
    (slot.grade):SetPosY(iconConfig.startGradeY)
    ;
    (slot.level):SetPosX(iconConfig.startLevelX)
    ;
    (slot.level):SetPosY(iconConfig.startLevelY)
    ;
    (slot.coma):SetPosX(iconConfig.startStateX)
    ;
    (slot.coma):SetPosY(iconConfig.startStateY)
    ;
    (slot.link):SetPosX(iconConfig.startStateX)
    ;
    (slot.link):SetPosY(iconConfig.startStateY)
    ;
    (slot.mating):SetPosX(iconConfig.startStateX)
    ;
    (slot.mating):SetPosY(iconConfig.startStateY)
    ;
    (slot.matingComplete):SetPosX(iconConfig.startStateX)
    ;
    (slot.matingComplete):SetPosY(iconConfig.startStateY)
    ;
    (slot.isSeized):SetPosX(iconConfig.startStateX)
    ;
    (slot.isSeized):SetPosY(iconConfig.startStateY)
    ;
    (slot.icon):ActiveMouseEventEffect(true)
    -- DECOMPILER ERROR at PC302: Confused about usage of register: R8 in 'UnsetPending'

    ;
    (self._slots)[slotidx] = slot
    ;
    (UIScroll.InputEventByControl)(slot.button, "nodeStableList_ScrollEvent")
    ;
    (slot.effect):SetShow(false)
  end
  ;
  (self._scroll):SetControlPos(0)
end

nodeStableList.update = function(self)
  -- function num : 0_1 , upvalues : isContentsStallionEnable
  if self._nodeServantCount == 0 then
    return 
  end
  ;
  (self._staticSlotCount):SetText("( " .. self._nodeServantCount .. " )")
  for ii = 0, (self._config).slotCount - 1 do
    local slot = (self._slots)[ii]
    slot.index = -1
    ;
    (slot.button):SetShow(false)
  end
  do
    local uiIdx = 0
    for servantIdx = self._startSlotIndex, self._nodeServantCount - 1 do
      if (self._config).slotCount <= uiIdx then
        break
      end
      local servantInfo = stable_getServantFromWaypointKey(self._nodeWaypointKey, servantIdx)
      -- DECOMPILER ERROR at PC55: Unhandled construct in 'MakeBoolean' P1

      if servantInfo:isLink() and (CppEnums.VehicleType).Type_Horse ~= servantInfo:getVehicleType() then
        local isLinkedHorse = servantInfo == nil
        do
          if uiIdx <= (self._config).slotCount - 1 then
            local slot = (self._slots)[uiIdx]
            ;
            (slot.name):SetText(servantInfo:getName())
            ;
            (slot.icon):ChangeTextureInfoName(servantInfo:getIconPath1())
            ;
            (slot.level):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. tostring(servantInfo:getLevel()))
            ;
            (slot.maleIcon):SetShow(false)
            ;
            (slot.femaleIcon):SetShow(false)
            if servantInfo:doMating() then
              if servantInfo:isMale() then
                (slot.maleIcon):SetShow(true)
              else
                (slot.femaleIcon):SetShow(true)
              end
            end
            if servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Camel or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Donkey or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Elephant then
              (slot.maleIcon):SetShow(false)
              ;
              (slot.femaleIcon):SetShow(false)
            end
            ;
            (slot.isSeized):SetShow(false)
            ;
            (slot.registerMating):SetShow(false)
            ;
            (slot.registerMarket):SetShow(false)
            ;
            (slot.coma):SetShow(false)
            ;
            (slot.link):SetShow(false)
            ;
            (slot.grade):SetShow(false)
            ;
            (slot.mating):SetShow(false)
            ;
            (slot.matingComplete):SetShow(false)
            ;
            (slot.stallionIcon):SetShow(false)
            if servantInfo:isSeized() then
              (slot.isSeized):SetShow(true)
            elseif (CppEnums.ServantStateType).Type_RegisterMarket == servantInfo:getStateType() then
              (slot.registerMarket):SetShow(true)
            elseif (CppEnums.ServantStateType).Type_RegisterMating == servantInfo:getStateType() then
              (slot.registerMating):SetShow(true)
            elseif (CppEnums.ServantStateType).Type_Mating == servantInfo:getStateType() then
              if servantInfo:isMatingComplete() then
                (slot.matingComplete):SetShow(true)
              else
                (slot.mating):SetShow(true)
              end
            elseif (CppEnums.ServantStateType).Type_Coma == servantInfo:getStateType() then
              (slot.coma):SetShow(true)
            end
            if isLinkedHorse then
              (slot.link):SetShow(true)
            end
            if (CppEnums.VehicleType).Type_Horse == servantInfo:getVehicleType() then
              (slot.grade):SetShow(true)
              if servantInfo:getTier() == 9 and isContentsStallionEnable then
                (slot.grade):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_TEXT_TIER9"))
                ;
                (slot.stallionIcon):SetShow(false)
              else
                (slot.grade):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVANT_TIER", "tier", servantInfo:getTier()))
                if isContentsStallionEnable then
                  (slot.stallionIcon):SetShow(true)
                  if servantInfo:isStallion() == true then
                    (slot.stallionIcon):SetMonoTone(false)
                  else
                    (slot.stallionIcon):SetMonoTone(true)
                  end
                end
              end
            else
              (slot.grade):SetShow(false)
            end
            ;
            (slot.button):SetShow(true)
            ;
            (slot.button):addInputEvent("Mouse_LUp", "nodeStableList_SlotSelect(" .. servantIdx .. ", " .. uiIdx .. " )")
            slot.index = servantIdx
            uiIdx = uiIdx + 1
          end
          -- DECOMPILER ERROR at PC330: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC330: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
    ;
    (UIScroll.SetButtonSize)(self._scroll, (self._config).slotCount, self._nodeServantCount)
    if (self._config).slotCount < self._nodeServantCount then
      (self._scroll):SetShow(true)
    else
      (self._scroll):SetShow(false)
    end
    -- DECOMPILER ERROR: 21 unprocessed JMP targets
  end
end

nodeStableList_SlotSelect = function(servantIdx, uiIdx)
  -- function num : 0_2 , upvalues : nodeStableList
  local self = nodeStableList
  if servantIdx == nil then
    return 
  end
  for ii = 0, (self._config).slotCount - 1 do
    (((self._slots)[ii]).effect):SetShow(false)
  end
  ;
  (((self._slots)[uiIdx]).effect):SetShow(true)
  nodeStableInfo_Open(self._nodeWaypointKey, servantIdx)
end

nodeStableList.clear = function(self)
  -- function num : 0_3
  self._selectSlotNo = nil
  self._startSlotIndex = 0
  nodeStableInfo_Close()
end

StableOpen_FromWorldMap = function(waypointKey)
  -- function num : 0_4 , upvalues : nodeStableList
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  nodeStableList._nodeWaypointKey = nil
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R1 in 'UnsetPending'

  nodeStableList._nodeServantCount = 0
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  nodeStableList._nodeWaypointKey = waypointKey
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

  nodeStableList._nodeServantCount = stable_countFromWaypointKey(nodeStableList._nodeWaypointKey)
  if isWorldMapGrandOpen() then
    Panel_NodeStable:SetPosX(getScreenSizeX() - Panel_NodeStable:GetSizeX() - 10)
    Panel_NodeStable:SetPosY((getScreenSizeY() - Panel_NodeStable:GetSizeY()) / 2)
    Panel_NodeStableInfo:SetPosX(Panel_NodeStable:GetPosX() - Panel_NodeStableInfo:GetSizeX() - 5)
    Panel_NodeStableInfo:SetPosY(Panel_NodeStable:GetPosY())
  else
    if Panel_NodeOwnerInfo:GetShow() then
      Panel_NodeStable:SetPosX(Panel_NodeOwnerInfo:GetPosX() + Panel_NodeOwnerInfo:GetSizeX() + 10)
      Panel_NodeStableInfo:SetPosX(Panel_NodeStable:GetPosX() + Panel_NodeStable:GetSizeX())
    else
      Panel_NodeStable:SetPosX(240)
      Panel_NodeStableInfo:SetPosX(413)
    end
  end
  if nodeStableList._nodeServantCount <= 0 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAPGRAND_STABLE_NOTHAVEVIHICLE"))
    return 
  else
    if nodeStableList._nodeServantCount > 0 then
      WorldMapPopupManager:increaseLayer(true)
      WorldMapPopupManager:push(Panel_NodeStable, true)
    end
    ;
    (nodeStableList._scroll):SetControlPos(0)
    nodeStableList:clear()
    nodeStableList:update()
    return 
  end
end

StableClose_FromWorldMap = function()
  -- function num : 0_5 , upvalues : nodeStableList
  local self = nodeStableList
  self:clear()
  if Panel_NodeStableInfo:GetShow() then
    Panel_NodeStableInfo:SetShow(false)
  end
  if Panel_NodeStable:GetShow() then
    nodeStable_Close()
  end
end

nodeStable_Close = function()
  -- function num : 0_6 , upvalues : nodeStableList
  local self = nodeStableList
  self:clear()
  if Panel_NodeStableInfo:GetShow() then
    Panel_NodeStableInfo:SetShow(false)
  end
  if Panel_NodeStable:GetShow() then
    WorldMapPopupManager:pop()
  end
end

nodeStableList_ScrollEvent = function(isScrollUp)
  -- function num : 0_7 , upvalues : nodeStableList
  local self = nodeStableList
  local servantCount = self._nodeServantCount
  self._startSlotIndex = (UIScroll.ScrollEvent)(self._scroll, isScrollUp, (self._config).slotCount, self._nodeServantCount, self._startSlotIndex, 1)
  for ii = 0, (self._config).slotCount - 1 do
    (((self._slots)[ii]).effect):SetShow(false)
  end
  nodeStableInfo_Close()
  self:update()
end

nodeStableList.registEventHandler = function(self)
  -- function num : 0_8
  (self._staticListBG):addInputEvent("Mouse_UpScroll", "nodeStableList_ScrollEvent( true )")
  ;
  (self._staticListBG):addInputEvent("Mouse_DownScroll", "nodeStableList_ScrollEvent( false )")
  ;
  (self._List_Button_Close):addInputEvent("Mouse_LUp", "nodeStable_Close()")
  ;
  (UIScroll.InputEvent)(self._scroll, "nodeStableList_ScrollEvent")
end

nodeStableList:init()
nodeStableList:registEventHandler()

