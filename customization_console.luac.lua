-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\customization\customization_console.luac 

-- params : ...
-- function num : 0
local panelmaxcount = 5
local customPanel = {[0] = nil, [1] = nil, [2] = nil, [3] = nil, [4] = nil}
local maxgroupindex = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0}
local groupcurrentx = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0}
local groupcurrenty = {[0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0}
Set_CustomizationUIPanel = function(panelindex, panel, groupcount)
  -- function num : 0_0 , upvalues : panelmaxcount, customPanel, maxgroupindex
  if (CppEnums.CountryType).DEV == getGameServiceType() then
    if panelmaxcount <= panelindex then
      return 
    end
    -- DECOMPILER ERROR at PC12: Confused about usage of register: R3 in 'UnsetPending'

    customPanel[panelindex] = panel
    ;
    (customPanel[panelindex]):setUsableConsolePanel(true)
    -- DECOMPILER ERROR at PC20: Confused about usage of register: R3 in 'UnsetPending'

    maxgroupindex[panelindex] = groupcount - 1
  end
end

Add_CustomizationUIGroup = function(panelindex, groupindex, controltype, isclearcurrentindex)
  -- function num : 0_1 , upvalues : customPanel
  if (CppEnums.CountryType).DEV == getGameServiceType() and customPanel[panelindex] ~= nil then
    local group = (customPanel[panelindex]):addConsoleUIGroup(groupindex, controltype)
    if isclearcurrentindex ~= nil then
      group:setisClearCurrentIndex(isclearcurrentindex)
    end
  end
end

Delete_CustomizationUIGroup = function(panelindex, groupindex, refreshGroup)
  -- function num : 0_2 , upvalues : customPanel
  if (CppEnums.CountryType).DEV == getGameServiceType() then
    (customPanel[panelindex]):deleteConsoleUIGroup(groupindex, refreshGroup)
  end
end

Clear_CustomizationUIGroup = function(panelindex, groupindex)
  -- function num : 0_3 , upvalues : customPanel, maxgroupindex
  if (CppEnums.CountryType).DEV == getGameServiceType() and customPanel[panelindex] ~= nil and groupindex <= maxgroupindex[panelindex] then
    (customPanel[panelindex]):deleteConsoleUIGroup(groupindex)
  end
end

ClearAll_CustomizationUIGroup = function(panelindex)
  -- function num : 0_4 , upvalues : customPanel
  if (CppEnums.CountryType).DEV == getGameServiceType() then
    (customPanel[panelindex]):clearGruop()
  end
end

Add_CustomizationUIControl = function(panelindex, groupindex, x, y, xcount, ycount, control)
  -- function num : 0_5 , upvalues : customPanel
  if (CppEnums.CountryType).DEV == getGameServiceType() then
    local group = (customPanel[panelindex]):getConsoleUIGroup(groupindex)
    group:addControl(x, y, xcount, ycount, control)
  end
end

Set_CustomizationUIgroupcount = function(panelindex, groupcount)
  -- function num : 0_6 , upvalues : panelmaxcount, maxgroupindex
  if (CppEnums.CountryType).DEV == getGameServiceType() then
    if panelmaxcount <= panelindex then
      return 
    end
    -- DECOMPILER ERROR at PC13: Confused about usage of register: R2 in 'UnsetPending'

    maxgroupindex[panelindex] = groupcount - 1
  end
end

Set_CustomizationUIgroupCurrentIndex = function(panelindex, groupindex, indexX, indexY)
  -- function num : 0_7 , upvalues : panelmaxcount, customPanel
  if (CppEnums.CountryType).DEV == getGameServiceType() then
    if panelmaxcount <= panelindex then
      return 
    end
    local group = (customPanel[panelindex]):getConsoleUIGroup(groupindex)
    group:setCurrentIndex(indexX, indexY)
  end
end

Get_CustomizationUIgroupCurrentIndexX = function(panelindex, groupindex)
  -- function num : 0_8 , upvalues : panelmaxcount, customPanel
  if (CppEnums.CountryType).DEV == getGameServiceType() then
    if panelmaxcount <= panelindex then
      return -1
    end
    local group = (customPanel[panelindex]):getConsoleUIGroup(groupindex)
    if group ~= nil then
      return group:getCurrentIndexX()
    else
      return -1
    end
  end
end

Get_CustomizationUIgroupCurrentIndexY = function(panelindex, groupindex)
  -- function num : 0_9 , upvalues : panelmaxcount, customPanel
  if (CppEnums.CountryType).DEV == getGameServiceType() then
    if panelmaxcount <= panelindex then
      return -1
    end
    local group = (customPanel[panelindex]):getConsoleUIGroup(groupindex)
    if group ~= nil then
      return group:getCurrentIndexY()
    else
      return -1
    end
  end
end

Set_CustomizationUIgroupConsoleEvent = function(panelindex, groupindex, eventname, keytype)
  -- function num : 0_10 , upvalues : panelmaxcount, customPanel
  if (CppEnums.CountryType).DEV == getGameServiceType() then
    if panelmaxcount <= panelindex then
      return 
    end
    local group = (customPanel[panelindex]):getConsoleUIGroup(groupindex)
    if group ~= nil then
      group:setConsoleKeyEventForLUA(eventname, keytype)
    end
  end
end


