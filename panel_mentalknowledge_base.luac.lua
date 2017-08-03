-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\dialogue\panel_mentalknowledge_base.luac 

-- params : ...
-- function num : 0
MentalKnowledgeBase = {}
local defaultPos = float3(0, 0, 0)
local zOrder = 21
local ItemLineIdx = 1
local ItemLine = {}
local ItemLineEdgeIndex = {}
local ItemCircleIdx = 1
local ItemCircle = {}
local ItemPositionIdx = 1
local ItemPosition = {}
-- DECOMPILER ERROR at PC22: Confused about usage of register: R9 in 'UnsetPending'

MentalKnowledgeBase.color = float4(1, 1, 1, 0.5)
-- DECOMPILER ERROR at PC24: Confused about usage of register: R9 in 'UnsetPending'

MentalKnowledgeBase.circleSize = 10
-- DECOMPILER ERROR at PC26: Confused about usage of register: R9 in 'UnsetPending'

MentalKnowledgeBase.circleWidth = 1
-- DECOMPILER ERROR at PC28: Confused about usage of register: R9 in 'UnsetPending'

MentalKnowledgeBase.lineWidth = 1
-- DECOMPILER ERROR at PC30: Confused about usage of register: R9 in 'UnsetPending'

MentalKnowledgeBase.usingEndArrow = false
-- DECOMPILER ERROR at PC32: Confused about usage of register: R9 in 'UnsetPending'

MentalKnowledgeBase.arrowHeight = 10
-- DECOMPILER ERROR at PC34: Confused about usage of register: R9 in 'UnsetPending'

MentalKnowledgeBase.arrowWidth = 1
-- DECOMPILER ERROR at PC42: Confused about usage of register: R9 in 'UnsetPending'

MentalKnowledgeBase.arrowColor = float4(1, 1, 1, 0.5)
-- DECOMPILER ERROR at PC44: Confused about usage of register: R9 in 'UnsetPending'

MentalKnowledgeBase.arrowLineWidth = 1
local circleRotation = function(circle, targetPos, rotation, circleWidth)
  -- function num : 0_0
  if circle ~= nil then
    if targetPos ~= nil then
      circle._position = targetPos
    end
    -- DECOMPILER ERROR at PC7: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (circle._rotation).x = rotation.x
    -- DECOMPILER ERROR at PC14: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (circle._rotation).y = math.pi / 2 + rotation.y
    -- DECOMPILER ERROR at PC16: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (circle._rotation).z = 0
    local cameraDistance = distanceFromCamera((circle._position).x, (circle._position).y, (circle._position).z)
    local rate = (3000 - cameraDistance) / 3000
    if rate > 1 then
      rate = 1
    else
      if rate < 0 then
        rate = 0
      end
    end
    circle._lineWidth = 3 * rate * rate * circleWidth + 0.5
  end
end

-- DECOMPILER ERROR at PC48: Confused about usage of register: R10 in 'UnsetPending'

MentalKnowledgeBase.init = function()
  -- function num : 0_1
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R0 in 'UnsetPending'

  MentalKnowledgeBase.color = float4(1, 1, 1, 0.3)
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R0 in 'UnsetPending'

  MentalKnowledgeBase.circleSize = 10
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R0 in 'UnsetPending'

  MentalKnowledgeBase.circleWidth = 1
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  MentalKnowledgeBase.lineWidth = 1
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

  MentalKnowledgeBase.usingEndArrow = false
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

  MentalKnowledgeBase.arrowHeight = 10
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

  MentalKnowledgeBase.arrowWidth = 1
  -- DECOMPILER ERROR at PC27: Confused about usage of register: R0 in 'UnsetPending'

  MentalKnowledgeBase.arrowColor = float4(1, 1, 1, 0.3)
  -- DECOMPILER ERROR at PC29: Confused about usage of register: R0 in 'UnsetPending'

  MentalKnowledgeBase.arrowLineWidth = 1
end

-- DECOMPILER ERROR at PC53: Confused about usage of register: R10 in 'UnsetPending'

MentalKnowledgeBase.InsertPosition = function(pos)
  -- function num : 0_2 , upvalues : ItemPositionIdx, ItemPosition
  local index = ItemPositionIdx
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R2 in 'UnsetPending'

  ItemPosition[index] = float3(pos.x, pos.y, pos.z)
  ItemPositionIdx = index + 1
  return index
end

-- DECOMPILER ERROR at PC57: Confused about usage of register: R10 in 'UnsetPending'

MentalKnowledgeBase.getPosition = function(index)
  -- function num : 0_3 , upvalues : ItemPosition
  return ItemPosition[index]
end

-- DECOMPILER ERROR at PC62: Confused about usage of register: R10 in 'UnsetPending'

MentalKnowledgeBase.ClearPosition = function()
  -- function num : 0_4 , upvalues : ItemPosition, ItemPositionIdx
  ItemPosition = {}
  ItemPositionIdx = 1
end

-- DECOMPILER ERROR at PC70: Confused about usage of register: R10 in 'UnsetPending'

MentalKnowledgeBase.InsertCircle = function(targetPos, angle)
  -- function num : 0_5 , upvalues : ItemCircleIdx, ItemCircle, defaultPos, zOrder, circleRotation
  local index = ItemCircleIdx
  local angleNoNil = angle
  if angleNoNil == nil then
    angleNoNil = 1
  end
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R4 in 'UnsetPending'

  ItemCircle[index] = {color = MentalKnowledgeBase.color, circleSize = MentalKnowledgeBase.circleSize, circleWidth = MentalKnowledgeBase.circleWidth}
  -- DECOMPILER ERROR at PC38: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (ItemCircle[index]).circleKey = insertArcLine("MentalGame", defaultPos, MentalKnowledgeBase.color, MentalKnowledgeBase.color, float3(MentalKnowledgeBase.circleSize, MentalKnowledgeBase.circleWidth, angleNoNil * 2 * math.pi), zOrder)
  circleRotation(getLine("MentalGame", (ItemCircle[index]).circleKey, zOrder), targetPos, getCameraYawPitchRoll(), MentalKnowledgeBase.circleWidth)
  ItemCircleIdx = index + 1
  return index
end

-- DECOMPILER ERROR at PC75: Confused about usage of register: R10 in 'UnsetPending'

MentalKnowledgeBase.getCircle = function(index)
  -- function num : 0_6 , upvalues : ItemCircle, zOrder
  if ItemCircle[index] == nil then
    return nil
  end
  return getLine("MentalGame", (ItemCircle[index]).circleKey, zOrder)
end

-- DECOMPILER ERROR at PC81: Confused about usage of register: R10 in 'UnsetPending'

MentalKnowledgeBase.UpdateCircle = function(rotation)
  -- function num : 0_7 , upvalues : ItemCircle, zOrder, circleRotation
  for _,value in pairs(ItemCircle) do
    local lineData = getLine("MentalGame", value.circleKey, zOrder)
    circleRotation(lineData, nil, rotation, value.circleWidth)
  end
end

-- DECOMPILER ERROR at PC87: Confused about usage of register: R10 in 'UnsetPending'

MentalKnowledgeBase.ClearCircle = function()
  -- function num : 0_8 , upvalues : ItemCircle, zOrder, ItemCircleIdx
  for key,value in pairs(ItemCircle) do
    deleteLine("MentalGame", value.circleKey, zOrder)
  end
  ItemCircle = {}
  ItemCircleIdx = 1
end

local CreateEndArrow = function(fromPos, toPos, ownerLineKey)
  -- function num : 0_9 , upvalues : ItemLine
  local cameraView = ((Util.Math).AddVectorToVector)(toPos, ((Util.Math).MulNumberToVector)(fromPos, -1))
  local cameraUp = ((Util.Math).AddVectorToVector)(getCameraPosition(), ((Util.Math).MulNumberToVector)(toPos, -1))
  local cameraRight = ((Util.Math).calculateNormalVector)(((Util.Math).calculateCross)(cameraUp, cameraView))
  local direction = ((Util.Math).calculateNormalVector)(float3(cameraView.x, cameraView.y, cameraView.z))
  local ArrowStart = ((Util.Math).AddVectorToVector)(toPos, ((Util.Math).MulNumberToVector)(direction, -MentalKnowledgeBase.arrowHeight))
  local ArrowRight = ((Util.Math).AddVectorToVector)(ArrowStart, ((Util.Math).MulNumberToVector)(cameraRight, MentalKnowledgeBase.arrowWidth))
  local ArrowLeft = ((Util.Math).AddVectorToVector)(ArrowStart, ((Util.Math).MulNumberToVector)(cameraRight, -MentalKnowledgeBase.arrowWidth))
  -- DECOMPILER ERROR at PC91: Confused about usage of register: R10 in 'UnsetPending'

  ;
  (ItemLine[ownerLineKey]).arrow1 = (MentalKnowledgeBase.InsertLine)(ArrowRight, ArrowLeft, MentalKnowledgeBase.arrowColor, MentalKnowledgeBase.arrowLineWidth)
  -- DECOMPILER ERROR at PC103: Confused about usage of register: R10 in 'UnsetPending'

  ;
  (ItemLine[ownerLineKey]).arrow2 = (MentalKnowledgeBase.InsertLine)(toPos, ArrowLeft, MentalKnowledgeBase.arrowColor, MentalKnowledgeBase.arrowLineWidth)
  -- DECOMPILER ERROR at PC115: Confused about usage of register: R10 in 'UnsetPending'

  ;
  (ItemLine[ownerLineKey]).arrow3 = (MentalKnowledgeBase.InsertLine)(ArrowRight, toPos, MentalKnowledgeBase.arrowColor, MentalKnowledgeBase.arrowLineWidth)
end

-- DECOMPILER ERROR at PC96: Confused about usage of register: R11 in 'UnsetPending'

MentalKnowledgeBase.InsertLine = function(fromPos, toPos, color, width)
  -- function num : 0_10 , upvalues : ItemLineIdx, ItemLineEdgeIndex, ItemLine, zOrder
  local index = ItemLineIdx
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R5 in 'UnsetPending'

  if ItemLineEdgeIndex[index] == nil then
    ItemLineEdgeIndex[index] = {}
  end
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R5 in 'UnsetPending'

  ItemLine[index] = {lineWidth = width, usingEndArrow = MentalKnowledgeBase.usingEndArrow}
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (ItemLine[index]).lineKey = insertLine("MentalGame", fromPos, toPos, color, width, zOrder)
  ItemLineIdx = index + 1
  return index
end

-- DECOMPILER ERROR at PC101: Confused about usage of register: R11 in 'UnsetPending'

MentalKnowledgeBase.InsertLineByCircle = function(fromIdx, toIdx)
  -- function num : 0_11 , upvalues : ItemLineEdgeIndex, CreateEndArrow
  if fromIdx > -1 and toIdx > -1 then
    local fromPos = ((MentalKnowledgeBase.getCircle)(fromIdx))._position
    local toPos = ((MentalKnowledgeBase.getCircle)(toIdx))._position
    if fromPos == nil or toPos == nil then
      return 
    end
    local lineKey = (MentalKnowledgeBase.InsertLine)(fromPos, toPos, MentalKnowledgeBase.color, MentalKnowledgeBase.lineWidth)
    -- DECOMPILER ERROR at PC32: Confused about usage of register: R5 in 'UnsetPending'

    ItemLineEdgeIndex[lineKey] = {from = fromIdx, to = toIdx}
    if MentalKnowledgeBase.usingEndArrow then
      CreateEndArrow(fromPos, toPos, lineKey)
    end
  end
end

-- DECOMPILER ERROR at PC108: Confused about usage of register: R11 in 'UnsetPending'

MentalKnowledgeBase.UpdateLine = function(rotation)
  -- function num : 0_12 , upvalues : ItemLine, zOrder, ItemLineEdgeIndex, ItemCircle
  for ItemLineIdx,value in pairs(ItemLine) do
    local inputFrom = getLineBuffer("MentalGame", value.lineKey, zOrder)
    local direction = float3(0, 0, 0)
    if (ItemLineEdgeIndex[ItemLineIdx]).to ~= nil and (ItemLineEdgeIndex[ItemLineIdx]).from then
      local fromCircle = (MentalKnowledgeBase.getCircle)((ItemLineEdgeIndex[ItemLineIdx]).from)
      local toCircle = (MentalKnowledgeBase.getCircle)((ItemLineEdgeIndex[ItemLineIdx]).to)
      local fromCircleData = ItemCircle[(ItemLineEdgeIndex[ItemLineIdx]).from]
      local toCircleData = ItemCircle[(ItemLineEdgeIndex[ItemLineIdx]).to]
      if fromCircle ~= nil and toCircle ~= nil then
        local fromPos = fromCircle._position
        local toPos = toCircle._position
        local cameraView = ((Util.Math).AddVectorToVector)(fromPos, ((Util.Math).MulNumberToVector)(getCameraPosition(), -1))
        local distance = ((Util.Math).calculateLength)(cameraView)
        cameraView = ((Util.Math).calculateNormalVector)(cameraView)
        local cameraUp = float3(0, 1, 0)
        local cameraRight = ((Util.Math).calculateNormalVector)(((Util.Math).calculateCross)(cameraUp, cameraView))
        cameraUp = ((Util.Math).calculateNormalVector)(((Util.Math).calculateCross)(cameraView, cameraRight))
        direction.x = toPos.x - fromPos.x
        direction.y = toPos.y - fromPos.y
        direction.z = toPos.z - fromPos.z
        direction = ((Util.Math).calculateNormalVector)(direction)
        local dotUp = ((Util.Math).calculateDot)(direction, cameraUp)
        local dotRight = ((Util.Math).calculateDot)(direction, cameraRight)
        local reNormal = ((Util.Math).calculateNormalVector)(float3(dotUp, dotRight, 0))
        dotUp = reNormal.x
        dotRight = reNormal.y
        local upDir = float3(cameraUp.x * dotUp, cameraUp.y * dotUp, cameraUp.z * dotUp)
        local rightDir = float3(cameraRight.x * dotRight, cameraRight.y * dotRight, cameraRight.z * dotRight)
        local fromSum = float3(0, 0, 0)
        fromSum.x = fromPos.x + cameraUp.x * dotUp * fromCircleData.circleSize + cameraRight.x * dotRight * fromCircleData.circleSize
        fromSum.y = fromPos.y + cameraUp.y * dotUp * fromCircleData.circleSize + cameraRight.y * dotRight * fromCircleData.circleSize
        fromSum.z = fromPos.z + cameraUp.z * dotUp * fromCircleData.circleSize + cameraRight.z * dotRight * fromCircleData.circleSize
        inputFrom:set(0, fromSum)
        cameraView = ((Util.Math).calculateNormalVector)(((Util.Math).AddVectorToVector)(toPos, ((Util.Math).MulNumberToVector)(getCameraPosition(), -1)))
        distance = (distance + ((Util.Math).calculateLength)(cameraView)) / 2
        cameraUp = float3(0, 1, 0)
        cameraRight = ((Util.Math).calculateNormalVector)(((Util.Math).calculateCross)(cameraUp, cameraView))
        cameraUp = ((Util.Math).calculateNormalVector)(((Util.Math).calculateCross)(cameraView, cameraRight))
        direction.x = toPos.x - fromPos.x
        direction.y = toPos.y - fromPos.y
        direction.z = toPos.z - fromPos.z
        direction = ((Util.Math).calculateNormalVector)(direction)
        dotUp = ((Util.Math).calculateDot)(direction, cameraUp)
        dotRight = ((Util.Math).calculateDot)(direction, cameraRight)
        reNormal = ((Util.Math).calculateNormalVector)(float3(dotUp, dotRight, 0))
        dotUp = reNormal.x
        dotRight = reNormal.y
        upDir = float3(cameraUp.x * dotUp, cameraUp.y * dotUp, cameraUp.z * dotUp)
        rightDir = float3(cameraRight.x * dotRight, cameraRight.y * dotRight, cameraRight.z * dotRight)
        local toSum = float3(0, 0, 0)
        toSum.x = toPos.x - cameraUp.x * dotUp * toCircleData.circleSize - cameraRight.x * dotRight * toCircleData.circleSize
        toSum.y = toPos.y - cameraUp.y * dotUp * toCircleData.circleSize - cameraRight.y * dotRight * toCircleData.circleSize
        toSum.z = toPos.z - cameraUp.z * dotUp * toCircleData.circleSize - cameraRight.z * dotRight * toCircleData.circleSize
        inputFrom:set(1, toSum)
        local calcDirection = ((Util.Math).calculateDirection)(fromSum, toSum)
        local originalDirection = ((Util.Math).calculateDirection)(fromPos, toPos)
        local fromSumProc = toScreenPosition(fromSum.x, fromSum.y, fromSum.z)
        local toSumProc = toScreenPosition(toSum.x, toSum.y, toSum.z)
        local fromPosProc = toScreenPosition(fromPos.x, fromPos.y, fromPos.z)
        local toPosProc = toScreenPosition(toPos.x, toPos.y, toPos.z)
        local calcDir = ((Util.Math).calculateDirection)(fromSumProc, toSumProc)
        local originalDir = ((Util.Math).calculateDirection)(fromPosProc, toPosProc)
        local lineData = getLine("MentalGame", (ItemLine[ItemLineIdx]).lineKey, zOrder)
        lineData._isRender = ((Util.Math).calculateDot)(calcDir, originalDir) > 0
        if value.usingEndArrow then
          local diffVector = ((Util.Math).AddVectorToVector)(toSum, ((Util.Math).MulNumberToVector)(toPos, -1))
          for idx = 1, 3 do
            local lineKey = (ItemLine[value["arrow" .. tostring(idx)]]).lineKey
            local lineBuffer = getLineBuffer("MentalGame", lineKey, zOrder)
            lineBuffer:set(0, ((Util.Math).AddVectorToVector)(lineBuffer:get(0), diffVector))
            lineBuffer:set(1, ((Util.Math).AddVectorToVector)(lineBuffer:get(1), diffVector))
          end
        end
      end
    end
  end
  -- DECOMPILER ERROR: 2 unprocessed JMP targets
end

-- DECOMPILER ERROR at PC115: Confused about usage of register: R11 in 'UnsetPending'

MentalKnowledgeBase.ClearLine = function()
  -- function num : 0_13 , upvalues : ItemLine, zOrder, ItemLineEdgeIndex, ItemLineIdx
  for key,value in pairs(ItemLine) do
    deleteLine("MentalGame", value.lineKey, zOrder)
  end
  ItemLineEdgeIndex = {}
  ItemLine = {}
  ItemLineIdx = 1
end

-- DECOMPILER ERROR at PC118: Confused about usage of register: R11 in 'UnsetPending'

MentalKnowledgeBase.UpdateLineAndCircle = function()
  -- function num : 0_14
  local rotation = getCameraYawPitchRoll()
  ;
  (MentalKnowledgeBase.UpdateCircle)(rotation)
  ;
  (MentalKnowledgeBase.UpdateLine)(rotation)
end

-- DECOMPILER ERROR at PC121: Confused about usage of register: R11 in 'UnsetPending'

MentalKnowledgeBase.ClearLineAndCircle = function()
  -- function num : 0_15
  (MentalKnowledgeBase.ClearCircle)()
  ;
  (MentalKnowledgeBase.ClearLine)()
  ;
  (MentalKnowledgeBase.ClearPosition)()
end


