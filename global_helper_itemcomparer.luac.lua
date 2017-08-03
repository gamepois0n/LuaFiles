-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\include\global_helper_itemcomparer.luac 

-- params : ...
-- function num : 0
local itemTypePriorityMap = {3, 2, 1, 1, 1, 1, 1, 1, 1, 1; [0] = 0}
local equipTypePriorityMap = {9900, 9800, 9700, 9600, 9500, 9400, 9300, 8700, 8200, 8100, 8000, 7900, 7800, 7700, 7600, 7500, 7400, 7300, 7200, 9200, 8600, 7100, 7000, 6900, 6800, 6700, 6600, 9100, 9000, 8900, 8800, 8500, 8400, 8300, 9200, 9100, 8800; [0] = 0}
local itemType_Equip = (CppEnums.ItemType).Equip
Global_ItemComparer = function(ii, jj, getFunction, inventoryType)
  -- function num : 0_0 , upvalues : itemTypePriorityMap, itemType_Equip, equipTypePriorityMap
  local self = inven
  local invenItemII = nil
  if inventoryType ~= nil then
    invenItemII = getFunction(inventoryType, ii)
  else
    invenItemII = getFunction(ii)
  end
  local emptyII = invenItemII == nil
  local itemStaticWrapperII, itemTypeII, equipTypeII, minLevelII, gradeTypeII, itemKeyII = nil, nil, nil, nil, nil, nil
  if not emptyII then
    itemStaticWrapperII = invenItemII:getStaticStatus()
    itemTypeII = itemStaticWrapperII:getItemType()
    equipTypeII = itemStaticWrapperII:getEquipType()
    minLevelII = (itemStaticWrapperII:get())._minLevel
    gradeTypeII = itemStaticWrapperII:getGradeType()
    itemKeyII = ((invenItemII:get()):getKey()):getItemKey()
  end
  local invenItemJJ = nil
  if inventoryType ~= nil then
    invenItemJJ = getFunction(inventoryType, jj)
  else
    invenItemJJ = getFunction(jj)
  end
  local emptyJJ = invenItemJJ == nil
  local itemStaticWrapperJJ, itemTypeJJ, equipTypeJJ, minLevelJJ, gradeTypeJJ, itemKeyJJ = nil, nil, nil, nil, nil, nil
  if not emptyJJ then
    itemStaticWrapperJJ = invenItemJJ:getStaticStatus()
    itemTypeJJ = itemStaticWrapperJJ:getItemType()
    equipTypeJJ = itemStaticWrapperJJ:getEquipType()
    minLevelJJ = (itemStaticWrapperJJ:get())._minLevel
    gradeTypeJJ = itemStaticWrapperJJ:getGradeType()
    itemKeyJJ = ((invenItemJJ:get()):getKey()):getItemKey()
  end
  if emptyII and emptyJJ then
    return 0
  elseif emptyII then
    return -1
  elseif emptyJJ then
    return 1
  end
  local itemPriorityII = itemTypePriorityMap[itemTypeII] or 0
  local itemPriorityJJ = itemTypePriorityMap[itemTypeJJ] or 0
  if itemPriorityII ~= itemPriorityJJ then
    return itemPriorityII - itemPriorityJJ
  end
  if not equipTypePriorityMap[equipTypeII] then
    local equipPriorityII = itemType_Equip ~= itemTypeII or itemType_Equip ~= itemTypeJJ or 0
  end
  do
    do
      local equipPriorityJJ = equipTypePriorityMap[equipTypeJJ] or 0
      if equipPriorityII ~= equipPriorityJJ then
        return equipPriorityII - equipPriorityJJ
      end
      if gradeTypeII ~= gradeTypeJJ then
        return gradeTypeII - gradeTypeJJ
      end
      if minLevelII ~= minLevelJJ then
        return minLevelII - minLevelJJ
      end
      do return itemKeyII - itemKeyJJ end
      if gradeTypeII ~= gradeTypeJJ then
        return gradeTypeII - gradeTypeJJ
      end
      do return itemKeyII - itemKeyJJ end
      -- DECOMPILER ERROR: 20 unprocessed JMP targets
    end
  end
end


