-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\rader\rader_background.luac 

-- params : ...
-- function num : 0
Panel_RadarRealLine = {panel = nil, 
mapImage = {}
, 
desertMapImage = {}
, maxAlphaDesert = 0}
local const = {imageSize = 256, size = 5}
local currentPosition = int3(0, 0, 0)
local currentRate = 0
local currentSelfPos = {x = 0, y = 0}
local currentAlpha = 1
RadarMap_Init = function()
  -- function num : 0_0 , upvalues : const
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R0 in 'UnsetPending'

  Panel_RadarRealLine.panel = Panel_Radar
  for index = 0, const.size * const.size - 1 do
    -- DECOMPILER ERROR at PC24: Confused about usage of register: R4 in 'UnsetPending'

    (Panel_RadarRealLine.mapImage)[index] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Radar, "Static_minimap_Image_" .. index)
    ;
    ((Panel_RadarRealLine.mapImage)[index]):SetShow(true)
    ;
    ((Panel_RadarRealLine.mapImage)[index]):SetSize(const.imageSize, const.imageSize)
    ;
    ((Panel_RadarRealLine.mapImage)[index]):SetIgnore(true)
    ;
    ((Panel_RadarRealLine.mapImage)[index]):SetPosX(index % const.size * const.imageSize)
    ;
    ((Panel_RadarRealLine.mapImage)[index]):SetPosY((math.floor)(index / const.size) * const.imageSize)
    ;
    ((Panel_RadarRealLine.mapImage)[index]):SetColor((Defines.Color).C_FFFFFFFF)
    ;
    ((Panel_RadarRealLine.mapImage)[index]):SetDepth(2)
    ;
    (Panel_RadarRealLine.panel):SetChildIndex((Panel_RadarRealLine.mapImage)[index], index)
  end
  for index = 0, const.size * const.size - 1 do
    -- DECOMPILER ERROR at PC115: Confused about usage of register: R4 in 'UnsetPending'

    (Panel_RadarRealLine.desertMapImage)[index] = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_Radar, "Static_minimap_ImageDesert_" .. index)
    ;
    ((Panel_RadarRealLine.desertMapImage)[index]):SetShow(false)
    ;
    ((Panel_RadarRealLine.desertMapImage)[index]):SetSize(const.imageSize, const.imageSize)
    ;
    ((Panel_RadarRealLine.desertMapImage)[index]):SetIgnore(true)
    ;
    ((Panel_RadarRealLine.desertMapImage)[index]):SetPosX(index % const.size * const.imageSize)
    ;
    ((Panel_RadarRealLine.desertMapImage)[index]):SetPosY((math.floor)(index / const.size) * const.imageSize)
    ;
    ((Panel_RadarRealLine.desertMapImage)[index]):SetColor((Defines.Color).C_FFFFFFFF)
    ;
    ((Panel_RadarRealLine.desertMapImage)[index]):SetDepth(1)
    ;
    (Panel_RadarRealLine.panel):SetChildIndex((Panel_RadarRealLine.desertMapImage)[index], index + const.size * const.size)
  end
  local selfPlayerWrapper = getSelfPlayer()
  if selfPlayerWrapper == nil then
    return 
  end
  local regionInfoWrapper = selfPlayerWrapper:getRegionInfoWrapper()
  if regionInfoWrapper == nil then
    return 
  end
  -- DECOMPILER ERROR at PC213: Confused about usage of register: R2 in 'UnsetPending'

  if (regionInfoWrapper:isDesert() and selfPlayerWrapper:isResistDesert() == false) or regionInfoWrapper:isOcean() then
    Panel_RadarRealLine.maxAlphaDesert = 1
    for key,value in pairs(Panel_RadarRealLine.desertMapImage) do
      value:SetShow(true)
      value:SetAlpha(1)
    end
  else
    do
      -- DECOMPILER ERROR at PC229: Confused about usage of register: R2 in 'UnsetPending'

      Panel_RadarRealLine.maxAlphaDesert = 0
      for key,value in pairs(Panel_RadarRealLine.desertMapImage) do
        value:SetShow(false)
        value:SetAlpha(0)
      end
    end
  end
end

local updatePanel = function()
  -- function num : 0_1
  if (CppEnums.EProcessorInputMode).eProcessorInputMode_UiMode ~= getInputMode() and (CppEnums.EProcessorInputMode).eProcessorInputMode_ChattingInputMode ~= getInputMode() then
    local isUiMode = not getEnableSimpleUI()
    do
      local IsMouseOver = Panel_Radar:GetPosX() < getMousePosX() and getMousePosX() < Panel_Radar:GetPosX() + Panel_Radar:GetSizeX() and Panel_Radar:GetPosY() < getMousePosY() and getMousePosY() < Panel_Radar:GetPosY() + Panel_Radar:GetSizeY()
      if isUiMode then
        isUiMode = IsMouseOver
      end
      -- DECOMPILER ERROR: 4 unprocessed JMP targets
    end
  end
end

local updateMapImage = function(position, deltaTime)
  -- function num : 0_2 , upvalues : currentAlpha, currentPosition, currentRate, currentSelfPos, const
  local prevMaxAlpha = Panel_RadarRealLine.maxAlphaDesert
  local regionInfoWrapper = (getSelfPlayer()):getRegionInfoWrapper()
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R4 in 'UnsetPending'

  if (regionInfoWrapper:isDesert() and (getSelfPlayer()):isResistDesert() == false) or regionInfoWrapper:isOcean() then
    Panel_RadarRealLine.maxAlphaDesert = Panel_RadarRealLine.maxAlphaDesert + deltaTime / 2
    -- DECOMPILER ERROR at PC31: Confused about usage of register: R4 in 'UnsetPending'

    if Panel_RadarRealLine.maxAlphaDesert > 1 then
      Panel_RadarRealLine.maxAlphaDesert = 1
    end
    for key,value in pairs(Panel_RadarRealLine.desertMapImage) do
      value:SetShow(true)
      value:SetAlpha(Panel_RadarRealLine.maxAlphaDesert * currentAlpha)
    end
  else
    do
      -- DECOMPILER ERROR at PC58: Confused about usage of register: R4 in 'UnsetPending'

      if Panel_RadarRealLine.maxAlphaDesert > 0 then
        Panel_RadarRealLine.maxAlphaDesert = Panel_RadarRealLine.maxAlphaDesert - deltaTime / 2
        -- DECOMPILER ERROR at PC64: Confused about usage of register: R4 in 'UnsetPending'

        if Panel_RadarRealLine.maxAlphaDesert < 0 then
          Panel_RadarRealLine.maxAlphaDesert = 0
        end
        for key,value in pairs(Panel_RadarRealLine.desertMapImage) do
          value:SetShow(true)
          value:SetAlpha(Panel_RadarRealLine.maxAlphaDesert * currentAlpha)
        end
      else
        do
          for key,value in pairs(Panel_RadarRealLine.desertMapImage) do
            value:SetShow(false)
            value:SetAlpha(0)
          end
          do
            if position.x == currentPosition.x and position.z == currentPosition.z and currentRate == RaderMap_GetDistanceToPixelRate() and currentSelfPos.x == (RaderMap_GetSelfPosInRader()).x and currentSelfPos.y == (RaderMap_GetSelfPosInRader()).y and Panel_RadarRealLine.maxAlphaDesert == prevMaxAlpha then
              return 
            end
            currentSelfPos = {x = (RaderMap_GetSelfPosInRader()).x, y = (RaderMap_GetSelfPosInRader()).y}
            currentRate = RaderMap_GetDistanceToPixelRate()
            -- DECOMPILER ERROR at PC148: Confused about usage of register: R4 in 'UnsetPending'

            const.imageSize = (math.floor)(currentRate * 256)
            currentPosition = position
            local currentSector = convertPosToSector(currentPosition)
            -- DECOMPILER ERROR at PC154: Confused about usage of register: R5 in 'UnsetPending'

            int3Value.y = 0
            local inSectorPos = convertPosToInSectorPos(currentPosition)
            local startX = (math.floor)(-(inSectorPos.x / 100 * currentRate) * 2 - const.imageSize * 2 + currentSelfPos.x)
            local startY = (math.floor)(inSectorPos.z / 100 * currentRate * 2 - const.imageSize * 3 + currentSelfPos.y)
            for index = 0, const.size * const.size - 1 do
              local filePath = ToClient_getRadarPath() .. "Rader_" .. currentSector.x - (math.floor)(const.size / 2) + index % const.size .. "_" .. currentSector.z + (math.floor)(const.size / 2) - (math.floor)(index / const.size) .. ".dds"
              ;
              ((Panel_RadarRealLine.mapImage)[index]):ChangeTextureInfoName(filePath)
              ;
              ((Panel_RadarRealLine.mapImage)[index]):SetPosX(startX + index % const.size * const.imageSize)
              ;
              ((Panel_RadarRealLine.mapImage)[index]):SetPosY(startY + (math.floor)(index / const.size) * const.imageSize)
              ;
              ((Panel_RadarRealLine.mapImage)[index]):SetSize(const.imageSize, const.imageSize)
              ;
              ((Panel_RadarRealLine.mapImage)[index]):SetAlpha((1 - Panel_RadarRealLine.maxAlphaDesert) * currentAlpha)
              ;
              ((Panel_RadarRealLine.mapImage)[index]):SetShow(true)
              local xValue = (currentSector.x + index) % const.size
              local zValue = const.size - (currentSector.z - (math.floor)(index / const.size)) % const.size - 1
              if regionInfoWrapper:isDesert() and (getSelfPlayer()):isResistDesert() == false then
                ((Panel_RadarRealLine.desertMapImage)[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Rader/Rader_Desert_" .. xValue .. "_" .. zValue .. ".dds")
              else
                if regionInfoWrapper:isOcean() then
                  ((Panel_RadarRealLine.desertMapImage)[index]):ChangeTextureInfoName("New_UI_Common_forLua/Widget/Rader/Rader_Ocean_" .. xValue .. "_" .. zValue .. ".dds")
                end
              end
              ;
              ((Panel_RadarRealLine.desertMapImage)[index]):SetPosX(startX + index % const.size * const.imageSize)
              ;
              ((Panel_RadarRealLine.desertMapImage)[index]):SetPosY(startY + (math.floor)(index / const.size) * const.imageSize)
              ;
              ((Panel_RadarRealLine.desertMapImage)[index]):SetSize(const.imageSize, const.imageSize)
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
  for index = 0, const.size * const.size - 1 do
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
  for index = 0, const.size * const.size - 1 do
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


