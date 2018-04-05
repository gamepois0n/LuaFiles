-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\worldmap\worldminimap.luac 

-- params : ...
-- function num : 0
PaGlobal_WorldMiniMap = {
_ui = {}
, _panelSizeScale = false, _isRotate = false, _nodeWarRegionName = nil, _initialize = false, _isAlphaOver = false, _alphaMinUnit = 0.05}
local swapRadar = function(radarType)
  -- function num : 0_0
  if radarType == true then
    ToClient_setRadorUIPanel(Panel_WorldMiniMap)
    ToClient_updateCameraWorldMiniMap()
    setChangeUiSettingRadarUI(Panel_WorldMiniMap)
  else
    ToClient_setRadorUIPanel(Panel_Radar)
    setChangeUiSettingRadarUI(Panel_Radar)
  end
  ToClient_setRadarType(radarType)
  ;
  (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListBool((CppEnums.GlobalUIOptionType).RadarSwap, radarType, (CppEnums.VariableStorageType).eVariableStorageType_User)
  if radarType == true then
    Panel_WorldMiniMap:SetShow(true)
    Panel_Radar:SetShow(false)
    FromClient_SetRotateMode(radarMap.isRotateMode)
    FromClient_reSizeWorldMiniMap()
  else
    Panel_WorldMiniMap:SetShow(false)
    Panel_Radar:SetShow(true)
    setRotateRadarMode(radarMap.isRotateMode)
    Panel_Radar:ComputePos()
  end
  local self = PaGlobal_WorldMiniMap
  self._panelSizeScale = true
  self:changePanelSize()
  ToClient_SaveUiInfo(false)
end

PaGlobal_changeRadarUI = function()
  -- function num : 0_1 , upvalues : swapRadar
  GLOBAL_CHECK_WORLDMINIMAP = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListBool((CppEnums.GlobalUIOptionType).RadarSwap)
  GLOBAL_CHECK_WORLDMINIMAP = not GLOBAL_CHECK_WORLDMINIMAP
  swapRadar(GLOBAL_CHECK_WORLDMINIMAP)
end

FromClient_SetRotateMode = function(isRotate)
  -- function num : 0_2
  local self = PaGlobal_WorldMiniMap
  local camRot = getCameraRotation()
  local rot = 0
  if isRotate == false then
    rot = 0
  else
    resetRadorActorListRotateValue()
    rot = math.pi
  end
  self._isRotate = isRotate
  ;
  ((self._ui).static_selfPlayerArrow):SetRotate(rot)
  FGlobal_WorldMiniMap_GuildPinRotateMode(isRotate)
end

-- DECOMPILER ERROR at PC18: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_WorldMiniMap.resetPanelSize = function(self)
  -- function num : 0_3
  local miniMap = ToClient_getWorldMiniMapPanel()
  local iconPath = "new_ui_common_forlua/Widget/Rader/Minimap_01.dds"
  miniMap:SetSize(300, 260)
  Panel_WorldMiniMap:SetSize(300, 260)
  Panel_WorldMiniMap:SetPosX(getScreenSizeX() - Panel_WorldMiniMap:GetSizeX() - 15)
  ;
  ((self._ui).btn_changeScale):ChangeTextureInfoName(iconPath)
  local x1, y1, x2, y2 = setTextureUV_Func((self._ui).btn_changeScale, 157, 54, 182, 79)
  ;
  (((self._ui).btn_changeScale):getBaseTexture()):setUV(x1, y1, x2, y2)
  ;
  ((self._ui).btn_changeScale):setRenderTexture(((self._ui).btn_changeScale):getBaseTexture())
  ;
  ((self._ui).btn_changeScale):ChangeOnTextureInfoName(iconPath)
  local x1, y1, x2, y2 = setTextureUV_Func((self._ui).btn_changeScale, 184, 54, 208, 79)
  ;
  (((self._ui).btn_changeScale):getOnTexture()):setUV(x1, y1, x2, y2)
  ;
  ((self._ui).btn_changeScale):ChangeClickTextureInfoName(iconPath)
  local x1, y1, x2, y2 = setTextureUV_Func((self._ui).btn_changeScale, 209, 54, 234, 79)
  ;
  (((self._ui).btn_changeScale):getClickTexture()):setUV(x1, y1, x2, y2)
  ;
  ((self._ui).btn_changeScale):ComputePos()
  ;
  ((self._ui).static_selfPlayerArrow):ComputePos()
  PaGlobal_WorldMiniMap:setPositionRegionNameList()
  self._panelSizeScale = false
  FGlobal_PersonalIcon_ButtonPosUpdate()
  Panel_PlayerEndurance_Position()
  Panel_HorseEndurance_Position()
  Panel_ShipEndurance_Position()
  Panel_CarriageEndurance_Position()
end

-- DECOMPILER ERROR at PC21: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_WorldMiniMap.changePanelSize = function(self)
  -- function num : 0_4
  local miniMap = ToClient_getWorldMiniMapPanel()
  local iconPath = "new_ui_common_forlua/Widget/Rader/Minimap_01.dds"
  if self._panelSizeScale == true then
    miniMap:SetSize(300, 260)
    Panel_WorldMiniMap:SetSize(300, 260)
    Panel_WorldMiniMap:SetPosX(getScreenSizeX() - Panel_WorldMiniMap:GetSizeX() - 15)
    ;
    ((self._ui).btn_changeScale):ChangeTextureInfoName(iconPath)
    local x1, y1, x2, y2 = setTextureUV_Func((self._ui).btn_changeScale, 157, 54, 182, 79)
    ;
    (((self._ui).btn_changeScale):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    ((self._ui).btn_changeScale):setRenderTexture(((self._ui).btn_changeScale):getBaseTexture())
    ;
    ((self._ui).btn_changeScale):ChangeOnTextureInfoName(iconPath)
    local x1, y1, x2, y2 = setTextureUV_Func((self._ui).btn_changeScale, 184, 54, 208, 79)
    ;
    (((self._ui).btn_changeScale):getOnTexture()):setUV(x1, y1, x2, y2)
    ;
    ((self._ui).btn_changeScale):ChangeClickTextureInfoName(iconPath)
    local x1, y1, x2, y2 = setTextureUV_Func((self._ui).btn_changeScale, 209, 54, 234, 79)
    ;
    (((self._ui).btn_changeScale):getClickTexture()):setUV(x1, y1, x2, y2)
  else
    do
      miniMap:SetSize(500, 460)
      Panel_WorldMiniMap:SetSize(500, 460)
      Panel_WorldMiniMap:SetPosX(getScreenSizeX() - Panel_WorldMiniMap:GetSizeX() - 15)
      ;
      ((self._ui).btn_changeScale):ChangeTextureInfoName(iconPath)
      local x1, y1, x2, y2 = setTextureUV_Func((self._ui).btn_changeScale, 79, 54, 104, 79)
      ;
      (((self._ui).btn_changeScale):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      ((self._ui).btn_changeScale):setRenderTexture(((self._ui).btn_changeScale):getBaseTexture())
      ;
      ((self._ui).btn_changeScale):ChangeOnTextureInfoName(iconPath)
      local x1, y1, x2, y2 = setTextureUV_Func((self._ui).btn_changeScale, 105, 54, 130, 79)
      ;
      (((self._ui).btn_changeScale):getOnTexture()):setUV(x1, y1, x2, y2)
      ;
      ((self._ui).btn_changeScale):ChangeClickTextureInfoName(iconPath)
      do
        local x1, y1, x2, y2 = setTextureUV_Func((self._ui).btn_changeScale, 131, 54, 156, 79)
        ;
        (((self._ui).btn_changeScale):getClickTexture()):setUV(x1, y1, x2, y2)
        ;
        ((self._ui).btn_changeScale):ComputePos()
        ;
        ((self._ui).btn_changeAlphaPlus):ComputePos()
        ;
        ((self._ui).btn_changeAlphaMinus):ComputePos()
        ;
        ((self._ui).static_selfPlayerArrow):ComputePos()
        PaGlobal_WorldMiniMap:setPositionRegionNameList()
        self._panelSizeScale = not self._panelSizeScale
        FGlobal_PersonalIcon_ButtonPosUpdate()
        Panel_PlayerEndurance_Position()
        Panel_HorseEndurance_Position()
        Panel_ShipEndurance_Position()
        Panel_CarriageEndurance_Position()
      end
    end
  end
end

-- DECOMPILER ERROR at PC24: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_WorldMiniMap.changePanelAlpha = function(self, isIncrease)
  -- function num : 0_5
  local currentAlphaValue = ToClient_get3DMiniMapAlpha()
  if isIncrease then
    currentAlphaValue = currentAlphaValue + self._alphaMinUnit
  else
    currentAlphaValue = currentAlphaValue - self._alphaMinUnit
  end
  ToClient_set3DMiniMapAlpha(currentAlphaValue)
  ;
  (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).RadarAlpha, (currentAlphaValue) * 100, (CppEnums.VariableStorageType).eVariableStorageType_User)
end

-- DECOMPILER ERROR at PC27: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_WorldMiniMap.handleOnEvent = function(self, isOver)
  -- function num : 0_6
  ((self._ui).sequenceAni):SetShow(isOver)
  if not isOver then
    ((self._ui).btn_changeAlphaPlus):SetShow(self._isAlphaOver)
    if not isOver then
      ((self._ui).btn_changeAlphaMinus):SetShow(self._isAlphaOver)
    end
  end
end

-- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_WorldMiniMap.alphaBtnOverEvent = function(self, isOver)
  -- function num : 0_7
  self._isAlphaOver = isOver
  ;
  ((self._ui).btn_changeAlphaPlus):SetShow(isOver)
  ;
  ((self._ui).btn_changeAlphaMinus):SetShow(isOver)
  if isOver then
    TooltipSimple_Show((self._ui).btn_changeAlphaPlus, PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMINIMAP_ALPHABUTTON_TOOLTIP"))
  else
    TooltipSimple_Hide()
  end
end

PaGlobal_WorldMiniMap_luaLoadComplete = function()
  -- function num : 0_8
  local self = PaGlobal_WorldMiniMap
  if _ContentsGroup_3DMiniMapOpen == true then
    PaGlobal_WorldMiniMap:InitWorldMiniMap()
  else
    self._initialize = false
    return 
  end
end

worldMiniMap_updateRegion = function(regionData)
  -- function num : 0_9
  local self = PaGlobal_WorldMiniMap
  ;
  ((self._ui).regionName):SetAutoResize(true)
  ;
  ((self._ui).regionName):SetNotAbleMasking(true)
  local isArenaZone = (regionData:get()):isArenaZone()
  local isSafetyZone = (regionData:get()):isSafeZone()
  ;
  ((self._ui).regionName):SetFontColor((Defines.Color).C_FFEFEFEF)
  ;
  ((self._ui).regionName):useGlowFont(false)
  ;
  ((self._ui).regionNodeName):SetFontColor((Defines.Color).C_FFEFEFEF)
  ;
  ((self._ui).regionNodeName):useGlowFont(false)
  ;
  ((self._ui).regionWarName):SetFontColor((Defines.Color).C_FFEFEFEF)
  ;
  ((self._ui).regionWarName):useGlowFont(false)
  if isSafetyZone then
    ((self._ui).regionName):SetFontColor(4292276981)
    ;
    ((self._ui).regionName):useGlowFont(true, "BaseFont_12_Glow", 4281961144)
    ;
    ((self._ui).regionNodeName):SetFontColor(4292276981)
    ;
    ((self._ui).regionNodeName):useGlowFont(true, "BaseFont_8_Glow", 4281961144)
    ;
    ((self._ui).regionWarName):SetFontColor(4292276981)
    ;
    ((self._ui).regionWarName):useGlowFont(true, "BaseFont_8_Glow", 4281961144)
  else
    if isArenaZone then
      ((self._ui).regionName):SetFontColor(4294495693)
      ;
      ((self._ui).regionName):useGlowFont(true, "BaseFont_12_Glow", 4286580487)
      ;
      ((self._ui).regionNodeName):SetFontColor(4294495693)
      ;
      ((self._ui).regionNodeName):useGlowFont(true, "BaseFont_8_Glow", 4286580487)
      ;
      ((self._ui).regionWarName):SetFontColor(4294495693)
      ;
      ((self._ui).regionWarName):useGlowFont(true, "BaseFont_8_Glow", 4286580487)
    else
      ;
      ((self._ui).regionName):SetFontColor(4294495693)
      ;
      ((self._ui).regionName):useGlowFont(true, "BaseFont_12_Glow", 4286580487)
      ;
      ((self._ui).regionNodeName):SetFontColor(4294495693)
      ;
      ((self._ui).regionNodeName):useGlowFont(true, "BaseFont_8_Glow", 4286580487)
      ;
      ((self._ui).regionWarName):SetFontColor(4294495693)
      ;
      ((self._ui).regionWarName):useGlowFont(true, "BaseFont_8_Glow", 4286580487)
    end
  end
  ;
  ((self._ui).regionName):SetText(regionData:getAreaName())
  local selfPlayerWrapper = getSelfPlayer()
  local selfPlayerPos = selfPlayerWrapper:get3DPos()
  local linkSiegeWrapper = ToClient_getInstallableVillageSiegeRegionInfoWrapper(selfPlayerPos)
  self._nodeWarRegionName = ""
  if linkSiegeWrapper ~= nil then
    local villageWarZone = (linkSiegeWrapper:get()):isVillageWarZone()
    if villageWarZone == true then
      self._nodeWarRegionName = linkSiegeWrapper:getvillageSiegeName()
    end
    ;
    ((self._ui).regionName):SetText(regionData:getAreaName())
  end
end

worldMiniMap_NodeLevelRegionNameShow = function(wayPointKey)
  -- function num : 0_10
  local self = PaGlobal_WorldMiniMap
  local nodeName = ToClient_GetNodeNameByWaypointKey(wayPointKey)
  if nodeName == "" or nodeName == nil then
    ((self._ui).regionNodeName):SetShow(false)
  else
    ;
    ((self._ui).regionNodeName):SetShow(true)
    ;
    ((self._ui).regionNodeName):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_RADER_REGIONNODENAME", "getName", nodeName))
    ;
    ((self._ui).regionNodeName):SetSize(((self._ui).regionNodeName):GetTextSizeX(), ((self._ui).regionNodeName):GetSizeY())
    ;
    ((self._ui).regionNodeName):SetPosX(Panel_WorldMiniMap:GetSizeX() - ((self._ui).regionNodeName):GetSizeX())
    ;
    ((self._ui).regionNodeName):SetPosY(Panel_WorldMiniMap:GetSizeY() - ((self._ui).regionNodeName):GetSizeY())
    ;
    ((self._ui).regionNodeName):ComputePos()
  end
  if self._nodeWarRegionName == "" or self._nodeWarRegionName == nil then
    ((self._ui).regionWarName):SetShow(false)
  else
    ;
    ((self._ui).regionWarName):SetShow(true)
    ;
    ((self._ui).regionWarName):SetText(self._nodeWarRegionName .. " " .. PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TOOLTIP_VILLAGEWARABLE_NAME"))
    ;
    ((self._ui).regionWarName):SetSize(((self._ui).regionWarName):GetTextSizeX(), ((self._ui).regionWarName):GetSizeY())
    ;
    ((self._ui).regionWarName):SetPosX(Panel_WorldMiniMap:GetSizeX() - ((self._ui).regionWarName):GetSizeX())
    ;
    ((self._ui).regionWarName):SetPosY(Panel_WorldMiniMap:GetSizeY() - ((self._ui).regionWarName):GetSizeY())
    ;
    ((self._ui).regionWarName):ComputePos()
  end
end

-- DECOMPILER ERROR at PC39: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_WorldMiniMap.setPositionRegionNameList = function(self)
  -- function num : 0_11
  ((self._ui).regionName):SetPosX(5)
  ;
  ((self._ui).regionName):SetPosY(5)
  ;
  ((self._ui).regionName):SetSize(((self._ui).regionName):GetTextSizeX() + 40, ((self._ui).regionName):GetSizeY())
  ;
  ((self._ui).regionName):ComputePos()
  ;
  ((self._ui).regionNodeName):SetPosX(Panel_WorldMiniMap:GetSizeX() - ((self._ui).regionNodeName):GetSizeX())
  ;
  ((self._ui).regionNodeName):SetPosY(Panel_WorldMiniMap:GetSizeY() - ((self._ui).regionNodeName):GetSizeY())
  ;
  ((self._ui).regionNodeName):ComputePos()
  ;
  ((self._ui).regionWarName):SetPosX(Panel_WorldMiniMap:GetSizeX() - ((self._ui).regionWarName):GetSizeX())
  ;
  ((self._ui).regionWarName):SetPosY(Panel_WorldMiniMap:GetSizeY() - ((self._ui).regionWarName):GetSizeY())
  ;
  ((self._ui).regionWarName):ComputePos()
end

Panel_WorldMiniMap_UpdatePerFrame = function(deltaTime)
  -- function num : 0_12
  local self = PaGlobal_WorldMiniMap
  if self._isRotate == false then
    ((self._ui).static_selfPlayerArrow):SetRotate(getCameraRotation())
  end
  FGlobal_WorldMiniMap_UpdateRadarPin()
end

FromClient_RClickedWorldMiniMap = function(position, clickActor)
  -- function num : 0_13
  local self = PaGlobal_WorldMiniMap
  if ToClient_IsShowNaviGuideGroup(0) then
    ToClient_DeleteNaviGuideByGroup(0)
  else
    if clickActor == true then
      FromClient_RClickWorldmapPanel(position, true, false)
    else
      if ToClient_GetMyTeamNoLocalWar() ~= 0 then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_NEW_WORLDMAP_LOCALWAR_CANTNAVI_ACK"))
        return 
      end
      if ((getSelfPlayer()):get()):getLevel() < 11 then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TUTORIAL_PROGRSS_ACK"))
        FGlobal_QuestWidget_UpdateList()
        if not isQuest160524_chk() then
          updateQuestWindowList(FGlobal_QuestWindowGetStartPosition())
        end
        return 
      end
      ToClient_WorldMapNaviStart(position, NavigationGuideParam(), false, true)
      audioPostEvent_SystemUi(0, 14)
    end
  end
end

FromClient_worldMiniMapSetNameOfMouseOverIcon = function(actorProxyWrapper, targetUI, targetUIposX, targetUIposY)
  -- function num : 0_14
  local actorName = ""
  if (actorProxyWrapper:get()):isNpc() then
    if actorProxyWrapper:getCharacterTitle() ~= "" then
      actorName = actorProxyWrapper:getName() .. " " .. actorProxyWrapper:getCharacterTitle()
    else
      actorName = actorProxyWrapper:getName()
    end
  else
    if (actorProxyWrapper:get()):isHouseHold() then
      actorName = getHouseHoldName(actorProxyWrapper:get())
    else
      do
        if (actorProxyWrapper:get()):isPlayer() then
          local playerActorProxyWrapper = getPlayerActor(actorProxyWrapper:getActorKey())
          if playerActorProxyWrapper ~= nil and (playerActorProxyWrapper:get()):isVolunteer() then
            return 
          end
        end
        actorName = actorProxyWrapper:getName()
        local self = PaGlobal_WorldMiniMap
        targetUIposX = targetUI:GetPosX()
        targetUIposY = targetUI:GetPosY()
        ;
        ((self._ui).static_overName):SetShow(true)
        ;
        ((self._ui).static_overName):SetText(actorName)
        ;
        ((self._ui).static_overName):SetSize(((self._ui).static_overName):GetTextSizeX() + 15, ((self._ui).static_overName):GetTextSizeY() + (((self._ui).static_overName):GetSpanSize()).y)
        Panel_WorldMiniMap:SetChildIndex((self._ui).static_overName, 9999)
        calcPosUseToTextUI(targetUIposX, targetUIposY, (self._ui).static_overName)
        ;
        ((self._ui).static_overName):SetDepth(-1000)
      end
    end
  end
end

calcPosUseToTextUI = function(targetUIposX, targetUIposY, textUI)
  -- function num : 0_15
  if Panel_WorldMiniMap:GetSizeX() < targetUIposX + textUI:GetTextSizeX() then
    textUI:SetPosX(Panel_WorldMiniMap:GetSizeX() - textUI:GetTextSizeX())
  else
    textUI:SetPosX(targetUIposX)
  end
  if targetUIposY - textUI:GetTextSizeY() < Panel_WorldMiniMap:GetPosY() then
    textUI:SetPosY(Panel_WorldMiniMap:GetPosY())
  else
    textUI:SetPosY(targetUIposY - textUI:GetTextSizeY())
  end
end

FromClient_worldMiniMapNameOff = function()
  -- function num : 0_16
  local self = PaGlobal_WorldMiniMap
  if (self._ui).static_overName == nil then
    return 
  end
  if ((self._ui).static_overName):GetShow() then
    ((self._ui).static_overName):SetShow(false)
  end
end

-- DECOMPILER ERROR at PC53: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_WorldMiniMap.InitWorldMiniMap = function(self)
  -- function num : 0_17 , upvalues : swapRadar
  ToClient_initializeWorldMiniMap()
  if Panel_WorldMiniMap ~= nil then
    Panel_WorldMiniMap:SetPosX(getScreenSizeX() - Panel_WorldMiniMap:GetSizeX() - 15)
    Panel_WorldMiniMap:SetPosY(30)
    Panel_WorldMiniMap:SetShow(false)
  end
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).regionName = (UI.getChildControl)(Panel_WorldMiniMap, "StaticText_RegionName")
  ;
  ((self._ui).regionName):SetShow(true)
  -- DECOMPILER ERROR at PC41: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).regionNodeName = (UI.getChildControl)(Panel_WorldMiniMap, "StaticText_RegionNodeName")
  ;
  ((self._ui).regionNodeName):SetShow(true)
  -- DECOMPILER ERROR at PC53: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).regionWarName = (UI.getChildControl)(Panel_WorldMiniMap, "StaticText_RegionWarName")
  ;
  ((self._ui).regionWarName):SetShow(true)
  PaGlobal_WorldMiniMap:setPositionRegionNameList()
  -- DECOMPILER ERROR at PC68: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).btn_changeScale = (UI.getChildControl)(Panel_WorldMiniMap, "Button_changeScale")
  ;
  ((self._ui).btn_changeScale):SetShow(true)
  -- DECOMPILER ERROR at PC80: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).btn_changeRadar = (UI.getChildControl)(Panel_WorldMiniMap, "Button_changeRadar")
  ;
  ((self._ui).btn_changeRadar):SetShow(true)
  -- DECOMPILER ERROR at PC92: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).sequenceAni = (UI.getChildControl)(Panel_WorldMiniMap, "Static_SequenceAni")
  ;
  ((self._ui).sequenceAni):SetShow(false)
  -- DECOMPILER ERROR at PC104: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).btn_changeAlphaPlus = (UI.getChildControl)(Panel_WorldMiniMap, "Button_AlphaPlus")
  ;
  ((self._ui).btn_changeAlphaPlus):SetShow(false)
  -- DECOMPILER ERROR at PC116: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).btn_changeAlphaMinus = (UI.getChildControl)(Panel_WorldMiniMap, "Button_AlphaMinus")
  ;
  ((self._ui).btn_changeAlphaMinus):SetShow(false)
  -- DECOMPILER ERROR at PC125: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).minimap = ToClient_getWorldMiniMapPanel()
  if (self._ui).minimap ~= nil then
    ((self._ui).minimap):addInputEvent("Mouse_On", "PaGlobal_WorldMiniMap:handleOnEvent(true)")
    ;
    ((self._ui).minimap):addInputEvent("Mouse_Out", "PaGlobal_WorldMiniMap:handleOnEvent(false)")
  end
  ;
  ((self._ui).btn_changeScale):addInputEvent("Mouse_LUp", "PaGlobal_WorldMiniMap:changePanelSize()")
  ;
  ((self._ui).btn_changeRadar):addInputEvent("Mouse_LUp", "PaGlobal_changeRadarUI()")
  ;
  ((self._ui).btn_changeAlphaPlus):addInputEvent("Mouse_On", "PaGlobal_WorldMiniMap:alphaBtnOverEvent(true)")
  ;
  ((self._ui).btn_changeAlphaPlus):addInputEvent("Mouse_Out", "PaGlobal_WorldMiniMap:alphaBtnOverEvent(false)")
  ;
  ((self._ui).btn_changeAlphaPlus):addInputEvent("Mouse_LUp", "PaGlobal_WorldMiniMap:changePanelAlpha(true)")
  ;
  ((self._ui).btn_changeAlphaMinus):addInputEvent("Mouse_On", "PaGlobal_WorldMiniMap:alphaBtnOverEvent(true)")
  ;
  ((self._ui).btn_changeAlphaMinus):addInputEvent("Mouse_Out", "PaGlobal_WorldMiniMap:alphaBtnOverEvent(false)")
  ;
  ((self._ui).btn_changeAlphaMinus):addInputEvent("Mouse_LUp", "PaGlobal_WorldMiniMap:changePanelAlpha(false)")
  -- DECOMPILER ERROR at PC196: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_selfPlayerArrow = (UI.getChildControl)(Panel_WorldMiniMap, "Static_SelfPlayerArrow")
  ;
  ((self._ui).static_selfPlayerArrow):SetShow(true)
  ;
  ((self._ui).static_selfPlayerArrow):SetSize(25, 21)
  ;
  ((self._ui).static_selfPlayerArrow):SetPosX()
  Panel_WorldMiniMap:SetChildIndex((self._ui).static_selfPlayerArrow, 9998)
  ;
  ((self._ui).static_selfPlayerArrow):SetDepth(-1000)
  ;
  ((self._ui).static_selfPlayerArrow):ComputePos()
  -- DECOMPILER ERROR at PC233: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._ui).static_overName = (UI.getChildControl)(Panel_WorldMiniMap, "Static_OverName")
  GLOBAL_CHECK_WORLDMINIMAP = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListBool((CppEnums.GlobalUIOptionType).RadarSwap)
  local selfPlayer = (getSelfPlayer()):get()
  if ToClient_getTutorialLimitLevel() < selfPlayer:getLevel() then
    swapRadar(GLOBAL_CHECK_WORLDMINIMAP)
  else
    GLOBAL_CHECK_WORLDMINIMAP = false
    ToClient_setRadorUIPanel(Panel_Radar)
    setChangeUiSettingRadarUI(Panel_Radar)
    ToClient_setRadarType(GLOBAL_CHECK_WORLDMINIMAP)
    ;
    (ToClient_getGameUIManagerWrapper()):setLuaCacheDataListBool((CppEnums.GlobalUIOptionType).RadarSwap, GLOBAL_CHECK_WORLDMINIMAP, (CppEnums.VariableStorageType).eVariableStorageType_User)
    ToClient_SaveUiInfo(false)
  end
  local radarAlphaValue = (ToClient_getGameUIManagerWrapper()):getLuaCacheDataListNumber((CppEnums.GlobalUIOptionType).RadarAlpha)
  if radarAlphaValue > 0 then
    ToClient_set3DMiniMapAlpha(radarAlphaValue / 100)
  end
  Panel_WorldMiniMap:RegisterUpdateFunc("Panel_WorldMiniMap_UpdatePerFrame")
  registerEvent("selfPlayer_regionChanged", "worldMiniMap_updateRegion")
  registerEvent("FromClint_EventChangedExplorationNode", "worldMiniMap_NodeLevelRegionNameShow")
  registerEvent("FromClient_RClickedWorldMiniMap", "FromClient_RClickedWorldMiniMap")
  registerEvent("FromClient_ChangeRadarRotateMode", "FromClient_SetRotateMode")
  -- DECOMPILER ERROR at PC314: Confused about usage of register: R3 in 'UnsetPending'

  PaGlobal_WorldMiniMap._initialize = true
end

FromClient_reSizeWorldMiniMap = function()
  -- function num : 0_18
  if PaGlobal_WorldMiniMap._initialize == true and Panel_WorldMiniMap:GetShow() then
    Panel_WorldMiniMap:SetPosX(getScreenSizeX() - Panel_WorldMiniMap:GetSizeX() - 15)
    Panel_WorldMiniMap:ComputePos()
  end
end

FGlobal_Panel_WorldMiniMapPosX = function()
  -- function num : 0_19
  return Panel_WorldMiniMap:GetPosX()
end

FGlobal_Panel_WorldMiniMapPosY = function()
  -- function num : 0_20
  return Panel_WorldMiniMap:GetPosY()
end

registerEvent("FromClient_luaLoadComplete", "PaGlobal_WorldMiniMap_luaLoadComplete")
registerEvent("FromClient_worldMiniMapNameOff", "FromClient_worldMiniMapNameOff")
registerEvent("FromClient_worldMiniMapSetNameOfMouseOverIcon", "FromClient_worldMiniMapSetNameOfMouseOverIcon")
registerEvent("onScreenResize", "FromClient_reSizeWorldMiniMap")

