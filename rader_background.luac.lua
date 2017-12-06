-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\rader\rader_background.luac 

-- params : ...
-- function num : 0
Panel_RadarRealLine = {panel = nil, 
mapImage = {}
, 
mapValue = {}
, 
desertMapImage = {}
, 
desertMapValue = {}
, maxAlphaDesert = 0}
local const = {imageSize = 256, size = 5}
local currentPosition = int3(0, 0, 0)
local currentRate = 0
local currentSelfPos = {x = 0, y = 0}
local currentAlpha = 1
local PIM = CppEnums.EProcessorInputMode
local floor = math.floor
RadarMap_Init = function()
  -- function num : 0_0 , upvalues : const, floor
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R0 in 'UnsetPending'

  Panel_RadarRealLine.panel = Panel_Radar
  local constImageSize = const.imageSize
  local constSize = const.size
  local reciprocalConstSize = 1 / constSize
  local loopCount = constSize * constSize - 1
  for index = 0, loopCount do
    -- DECOMPILER ERROR at PC26: Confused about usage of register: R8 in 'UnsetPending'

    (Panel_RadarRealLine.mapImage)[index] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Radar, "Static_minimap_Image_" .. index)
    ;
    ((Panel_RadarRealLine.mapImage)[index]):SetShow(true)
    ;
    ((Panel_RadarRealLine.mapImage)[index]):SetSize(constImageSize, constImageSize)
    ;
    ((Panel_RadarRealLine.mapImage)[index]):SetIgnore(true)
    ;
    ((Panel_RadarRealLine.mapImage)[index]):SetPosX(index % constSize * constImageSize)
    ;
    ((Panel_RadarRealLine.mapImage)[index]):SetPosY(floor(index * reciprocalConstSize) * constImageSize)
    ;
    ((Panel_RadarRealLine.mapImage)[index]):SetColor((Defines.Color).C_FFFFFFFF)
    ;
    ((Panel_RadarRealLine.mapImage)[index]):SetDepth(2)
    -- DECOMPILER ERROR at PC82: Confused about usage of register: R8 in 'UnsetPending'

    ;
    (Panel_RadarRealLine.mapValue)[index] = int2(9999, 9999)
    ;
    (Panel_RadarRealLine.panel):SetChildIndex((Panel_RadarRealLine.mapImage)[index], index)
  end
  for index = 0, loopCount do
    -- DECOMPILER ERROR at PC108: Confused about usage of register: R8 in 'UnsetPending'

    (Panel_RadarRealLine.desertMapImage)[index] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Radar, "Static_minimap_ImageDesert_" .. index)
    ;
    ((Panel_RadarRealLine.desertMapImage)[index]):SetShow(false)
    ;
    ((Panel_RadarRealLine.desertMapImage)[index]):SetSize(constImageSize, constImageSize)
    ;
    ((Panel_RadarRealLine.desertMapImage)[index]):SetIgnore(true)
    ;
    ((Panel_RadarRealLine.desertMapImage)[index]):SetPosX(index % constSize * constImageSize)
    ;
    ((Panel_RadarRealLine.desertMapImage)[index]):SetPosY(floor(index * reciprocalConstSize) * constImageSize)
    ;
    ((Panel_RadarRealLine.desertMapImage)[index]):SetColor((Defines.Color).C_FFFFFFFF)
    ;
    ((Panel_RadarRealLine.desertMapImage)[index]):SetDepth(1)
    -- DECOMPILER ERROR at PC164: Confused about usage of register: R8 in 'UnsetPending'

    ;
    (Panel_RadarRealLine.desertMapValue)[index] = int2(9999, 9999)
    ;
    (Panel_RadarRealLine.panel):SetChildIndex((Panel_RadarRealLine.desertMapImage)[index], index + constSize * constSize)
  end
  local selfPlayerWrapper = getSelfPlayer()
  if selfPlayerWrapper == nil then
    return 
  end
  local regionInfoWrapper = selfPlayerWrapper:getRegionInfoWrapper()
  if regionInfoWrapper == nil then
    return 
  end
  local desertMapImageContainer = Panel_RadarRealLine.desertMapImage
  -- DECOMPILER ERROR at PC200: Confused about usage of register: R7 in 'UnsetPending'

  if (regionInfoWrapper:isDesert() and selfPlayerWrapper:isResistDesert() == false) or regionInfoWrapper:isOcean() then
    Panel_RadarRealLine.maxAlphaDesert = 1
    for key,value in pairs(desertMapImageContainer) do
      value:SetShow(true)
      value:SetAlpha(1)
    end
  else
    do
      -- DECOMPILER ERROR at PC215: Confused about usage of register: R7 in 'UnsetPending'

      Panel_RadarRealLine.maxAlphaDesert = 0
      for key,value in pairs(desertMapImageContainer) do
        value:SetShow(false)
        value:SetAlpha(0)
      end
    end
  end
end

local updatePanel = function()
  -- function num : 0_1 , upvalues : PIM
  if getEnableSimpleUI() then
    local inputMode = getInputMode()
    local isUiMode = PIM.eProcessorInputMode_UiMode == inputMode or PIM.eProcessorInputMode_ChattingInputMode == inputMode
    local radarPosX = Panel_Radar:GetPosX()
    local radarPosY = Panel_Radar:GetPosY()
    local mousePosX = getMousePosX()
    local mousePosY = getMousePosY()
    local IsMouseOver = radarPosX < mousePosX and mousePosX < radarPosX + Panel_Radar:GetSizeX() and radarPosY < mousePosY and mousePosY < radarPosY + Panel_Radar:GetSizeY()
    if isUiMode then
      isUiMode = IsMouseOver
    end
  end
  -- DECOMPILER ERROR: 4 unprocessed JMP targets
end

local prevMaxAlpha = nil
local updateMapImage = function(position, deltaTime)
  -- function num : 0_2 , upvalues : currentPosition, currentRate, currentSelfPos, prevMaxAlpha, currentAlpha, const, floor
  if position.x == currentPosition.x and position.z == currentPosition.z and currentRate == RaderMap_GetDistanceToPixelRate() and currentSelfPos.x == (RaderMap_GetSelfPosInRader()).x and currentSelfPos.y == (RaderMap_GetSelfPosInRader()).y and Panel_RadarRealLine.maxAlphaDesert == prevMaxAlpha then
    return 
  end
  prevMaxAlpha = Panel_RadarRealLine.maxAlphaDesert
  local regionInfoWrapper = (getSelfPlayer()):getRegionInfoWrapper()
  local isResistDesert = (getSelfPlayer()):isResistDesert()
  local isDesert = regionInfoWrapper:isDesert()
  local isOcean = regionInfoWrapper:isOcean()
  local desertMapImageContainer = Panel_RadarRealLine.desertMapImage
  -- DECOMPILER ERROR at PC63: Confused about usage of register: R7 in 'UnsetPending'

  if (isDesert and isResistDesert == false) or isOcean then
    Panel_RadarRealLine.maxAlphaDesert = Panel_RadarRealLine.maxAlphaDesert + deltaTime / 2
    -- DECOMPILER ERROR at PC69: Confused about usage of register: R7 in 'UnsetPending'

    if Panel_RadarRealLine.maxAlphaDesert > 1 then
      Panel_RadarRealLine.maxAlphaDesert = 1
    end
    local calcAlpha = Panel_RadarRealLine.maxAlphaDesert * currentAlpha
    for key,value in pairs(desertMapImageContainer) do
      value:SetShow(true)
      value:SetAlpha(calcAlpha)
    end
  else
    do
      -- DECOMPILER ERROR at PC96: Confused about usage of register: R7 in 'UnsetPending'

      if Panel_RadarRealLine.maxAlphaDesert > 0 then
        Panel_RadarRealLine.maxAlphaDesert = Panel_RadarRealLine.maxAlphaDesert - deltaTime / 2
        -- DECOMPILER ERROR at PC102: Confused about usage of register: R7 in 'UnsetPending'

        if Panel_RadarRealLine.maxAlphaDesert < 0 then
          Panel_RadarRealLine.maxAlphaDesert = 0
        end
        local calcAlpha = Panel_RadarRealLine.maxAlphaDesert * currentAlpha
        for key,value in pairs(desertMapImageContainer) do
          value:SetShow(true)
          value:SetAlpha(calcAlpha)
        end
      else
        do
          for key,value in pairs(desertMapImageContainer) do
            value:SetShow(false)
            value:SetAlpha(0)
          end
          do
            currentSelfPos = {x = (RaderMap_GetSelfPosInRader()).x, y = (RaderMap_GetSelfPosInRader()).y}
            currentRate = RaderMap_GetDistanceToPixelRate()
            -- DECOMPILER ERROR at PC150: Confused about usage of register: R7 in 'UnsetPending'

            const.imageSize = floor(currentRate * 256)
            local constImageSize = const.imageSize
            local constSize = const.size
            local halfConstSize = floor(constSize / 2)
            local reciprocalConstSize = 1 / constSize
            currentPosition = position
            local currentSector = convertPosToSector(currentPosition)
            local inSectorPos = convertPosToInSectorPos(currentPosition)
            local startX = floor(-(inSectorPos.x * 0.01 * currentRate) * 2 - constImageSize * 2 + currentSelfPos.x)
            local startY = floor(inSectorPos.z * 0.01 * currentRate * 2 - constImageSize * 3 + currentSelfPos.y)
            local calcAlpha = (1 - Panel_RadarRealLine.maxAlphaDesert) * currentAlpha
            local radarPath = ToClient_getRadarPath() .. "Rader_"
            local loopCount = constSize * constSize - 1
            for index = 0, loopCount do
              local indexModConstSize = index % constSize
              local floorIndexDivConstSize = floor(index * reciprocalConstSize)
              local xSector = currentSector.x - halfConstSize + indexModConstSize
              local zSector = currentSector.z + halfConstSize - floorIndexDivConstSize
              local mapImage = (Panel_RadarRealLine.mapImage)[index]
              local mapValue = (Panel_RadarRealLine.mapValue)[index]
              if mapValue.x ~= xSector or mapValue.y ~= zSector then
                mapValue.x = xSector
                mapValue.y = zSector
                mapImage:ChangeTextureInfoName(radarPath .. xSector .. "_" .. zSector .. ".dds")
              end
              mapImage:SetPosX(startX + indexModConstSize * constImageSize)
              mapImage:SetPosY(startY + floorIndexDivConstSize * constImageSize)
              mapImage:SetSize(constImageSize, constImageSize)
              mapImage:SetAlpha(calcAlpha)
              mapImage:SetShow(true)
              local xValue = (currentSector.x + index) % constSize
              local zValue = constSize - (currentSector.z - floorIndexDivConstSize) % constSize - 1
              local desertMapImage = (Panel_RadarRealLine.desertMapImage)[index]
              local desertMapValue = (Panel_RadarRealLine.desertMapValue)[index]
              if desertMapValue.x ~= xValue or desertMapValue.y ~= zValue or Panel_RadarRealLine.maxAlphaDesert > 0 and Panel_RadarRealLine.maxAlphaDesert < 1 then
                desertMapValue.x = xValue
                desertMapValue.y = zValue
                if isDesert and not isResistDesert then
                  desertMapImage:ChangeTextureInfoName("New_UI_Common_forLua/Widget/Rader/Rader_Desert_" .. xValue .. "_" .. zValue .. ".dds")
                else
                  if isOcean then
                    desertMapImage:ChangeTextureInfoName("New_UI_Common_forLua/Widget/Rader/Rader_Ocean_" .. xValue .. "_" .. zValue .. ".dds")
                  end
                end
              end
              desertMapImage:SetPosX(startX + indexModConstSize * constImageSize)
              desertMapImage:SetPosY(startY + floorIndexDivConstSize * constImageSize)
              desertMapImage:SetSize(constImageSize, constImageSize)
            end
          end
        end
      end
    end
  end
end

RaderBackground_updatePerFrame = function(deltaTime)
  -- function num : 0_3 , upvalues : updatePanel, updateMapImage
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  updatePanel()
  updateMapImage((selfPlayer:get()):getPosition(), deltaTime)
end

FGlobal_Panel_RadarRealLine_Show = function(isShow)
  -- function num : 0_4
  (Panel_RadarRealLine.panel):SetShow(isShow)
end

RaderBackground_Show = function()
  -- function num : 0_5
  (Panel_RadarRealLine.panel):SetShow(true)
end

RaderBackground_Hide = function()
  -- function num : 0_6
  (Panel_RadarRealLine.panel):SetShow(false)
end

RadarBackground_SetRotateMode = function(isRotateMode)
  -- function num : 0_7 , upvalues : const
  local loopCount = const.size * const.size - 1
  for index = 0, loopCount do
    ((Panel_RadarRealLine.mapImage)[index]):SetParentRotCalc(isRotateMode)
  end
end

RaderMapBG_SetAlphaValue = function(alpha)
  -- function num : 0_8 , upvalues : currentAlpha, const
  local isShowFront = true
  if Panel_RadarRealLine.maxAlphaDesert >= 1 then
    isShowFront = false
  end
  currentAlpha = alpha
  local loopCount = const.size * const.size - 1
  for index = 0, loopCount do
    ((Panel_RadarRealLine.mapImage)[index]):SetAlpha((1 - Panel_RadarRealLine.maxAlphaDesert) * currentAlpha)
    ;
    ((Panel_RadarRealLine.mapImage)[index]):SetShow(isShowFront)
  end
end

RadarMapBG_EnableSimpleUI_Force_Over = function()
  -- function num : 0_9
  RadarMapBG_EnableSimpleUI(true)
end

RadarMapBG_EnableSimpleUI_Force_Out = function()
  -- function num : 0_10
  RadarMapBG_EnableSimpleUI(false)
end

registerEvent("EventSimpleUIEnable", "RadarMapBG_EnableSimpleUI_Force_Over")
registerEvent("EventSimpleUIDisable", "RadarMapBG_EnableSimpleUI_Force_Out")
RadarMapBG_EnableSimpleUI = function(isEnable)
  -- function num : 0_11
  cacheSimpleUI_ShowButton = true
end


