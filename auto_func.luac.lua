-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\auto\auto_func.luac 

-- params : ...
-- function num : 0
Auto_MouseMove = function(posX, posY)
  -- function num : 0_0
  if posX < 0 or posY < 0 then
    return true
  end
  local nowX = getMousePosX()
  local nowY = getMousePosY()
  local updateMoveSize = 8
  if updateMoveSize < (math.abs)(nowX - posX) then
    if nowX < posX then
      nowX = nowX + updateMoveSize
    else
      if posX < nowX then
        nowX = nowX - updateMoveSize
      end
    end
  end
  if updateMoveSize < (math.abs)(nowY - posY) then
    if nowY < posY then
      nowY = nowY + updateMoveSize
    else
      if posY < nowY then
        nowY = nowY - updateMoveSize
      end
    end
  end
  ToClient_setMousePosition(nowX, nowY)
  if (math.abs)(nowX - posX) <= updateMoveSize and (math.abs)(nowY - posY) <= updateMoveSize then
    return false
  end
  return true
end

Auto_IsPlayerInsideQuestArea = function(uiQuestInfo)
  -- function num : 0_1
  local checkCount = 0
  local selfPlayer = (getSelfPlayer()):get()
  local positionList = Auto_GetTargetQuestArea(uiQuestInfo)
  local selfPos = float3(selfPlayer:getPositionX(), selfPlayer:getPositionY(), selfPlayer:getPositionZ())
  for index,value in pairs(positionList) do
    local valuePos = float3((value._position).x, (value._position).y, (value._position).z)
    local distance = ((Util.Math).calculateDistance)(valuePos, selfPos)
    if distance < value._radius then
      return 0
    end
    checkCount = checkCount + 1
  end
  if checkCount == 0 then
    return -2
  end
  return -1
end

Auto_IsMonsterInsideQuestArea = function(uiQuestInfo)
  -- function num : 0_2
  local checkCount = 0
  local selfPlayer = (getSelfPlayer()):get()
  local positionList = Auto_GetTargetQuestArea(uiQuestInfo)
  for index,value in pairs(positionList) do
    if findNearQuestMonster(Auto_GetPlayerPos_Float3(), value._radius) == true then
      return 0
    end
    checkCount = checkCount + 1
  end
  if checkCount == 0 then
    return -2
  end
  return -1
end

Auto_GetTargetQuestArea = function(uiQuestInfo)
  -- function num : 0_3
  local selfPlayer = (getSelfPlayer()):get()
  local questPosCount = uiQuestInfo:getQuestPositionCount()
  local positionList = {}
  local naviMovePathIndex = selfPlayer:getNavigationMovePathIndex()
  for questPositionIndex = 0, questPosCount - 1 do
    local questPosInfo = uiQuestInfo:getQuestPositionAt(questPositionIndex)
    local posX = (questPosInfo._position).x
    local posY = (questPosInfo._position).y
    local posZ = (questPosInfo._position).z
    positionList[questPositionIndex] = {}
    -- DECOMPILER ERROR at PC26: Confused about usage of register: R13 in 'UnsetPending'

    ;
    (positionList[questPositionIndex])._radius = questPosInfo._radius
    -- DECOMPILER ERROR at PC29: Confused about usage of register: R13 in 'UnsetPending'

    ;
    (positionList[questPositionIndex])._startRate = totalLength
    -- DECOMPILER ERROR at PC32: Confused about usage of register: R13 in 'UnsetPending'

    ;
    (positionList[questPositionIndex])._position = questPosInfo._position
  end
  return positionList
end

Auto_GetPlayerPos_Float3 = function()
  -- function num : 0_4
  local selfPlayer = (getSelfPlayer()):get()
  local pos = float3(selfPlayer:getPositionX(), selfPlayer:getPositionY(), selfPlayer:getPositionZ())
  return pos
end

Auto_FindNearQuestMonster = function()
  -- function num : 0_5
  return findNearQuestMonster(Auto_GetPlayerPos_Float3(), 2000)
end


