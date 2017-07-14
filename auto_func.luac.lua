-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\auto\auto_func.luac 

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


