-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\include\global_util_ui_treemenu.luac 

-- params : ...
-- function num : 0
if UI == nil then
  UI = {}
end
local UCT = CppEnums.PA_UI_CONTROL_TYPE
local TreeMenuGroupState = {Closed = 1, Opened = 2}
TreeMenuItem = {}
-- DECOMPILER ERROR at PC14: Confused about usage of register: R2 in 'UnsetPending'

TreeMenuItem.__index = TreeMenuItem
-- DECOMPILER ERROR at PC17: Confused about usage of register: R2 in 'UnsetPending'

TreeMenuItem.new = function(control, tree, parentItem)
  -- function num : 0_0
  local menuItem = {}
  setmetatable(menuItem, TreeMenuItem)
  menuItem.control = control
  menuItem.tree = tree
  menuItem.parent = parentItem
  ;
  (tree.items):push_back(menuItem)
  menuItem.index = (tree.items):length()
  menuItem.startAni = false
  return menuItem
end

-- DECOMPILER ERROR at PC20: Confused about usage of register: R2 in 'UnsetPending'

TreeMenuItem.isRootItem = function(self)
  -- function num : 0_1
  do return self.parent == nil end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

-- DECOMPILER ERROR at PC23: Confused about usage of register: R2 in 'UnsetPending'

TreeMenuItem.isLeafItem = function(self)
  -- function num : 0_2
  do return self.groupInfo == nil end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

-- DECOMPILER ERROR at PC27: Confused about usage of register: R2 in 'UnsetPending'

TreeMenuItem.SetAsParentNode = function(self, _radius, _lineTemplate, _linePosFactor, _startRadian, _maxRadian)
  -- function num : 0_3 , upvalues : TreeMenuGroupState
  local lineLength = _lineTemplate:GetSizeY()
  self.groupInfo = {childs = (Array.new)(), radius = _radius, startRadian = _startRadian, maxRadian = _maxRadian, state = TreeMenuGroupState.Closed, lineTemplate = _lineTemplate, calculatedLinePosFactor = 1 - ((_radius - lineLength) * _linePosFactor + lineLength / 2) / _radius}
end

-- DECOMPILER ERROR at PC31: Confused about usage of register: R2 in 'UnsetPending'

TreeMenuItem.addItem = function(self, buttonTemplate, id, imageControl)
  -- function num : 0_4 , upvalues : TreeMenuGroupState
  if self:isLeafItem() then
    return nil
  end
  local isChildShow = (self.groupInfo).state ~= TreeMenuGroupState.Closed
  if not id then
    local controlID = (self.tree).id .. "_" .. ((self.tree).items):length()
  end
  local control = (UI.createControl)(buttonTemplate:GetType(), self.control, controlID)
  CopyBaseProperty(buttonTemplate, control)
  control:SetShow(isChildShow)
  local childMenuItem = (TreeMenuItem.new)(control, self.tree, self)
  ;
  ((self.groupInfo).childs):push_back(childMenuItem)
  local line = (UI.createControl)(((self.groupInfo).lineTemplate):GetType(), control, controlID .. "_line")
  CopyBaseProperty((self.groupInfo).lineTemplate, line)
  line:SetIgnore(true)
  line:SetShow(isChildShow)
  childMenuItem.line = line
  do
    do
      if imageControl ~= nil then
        local imageStatic = (UI.createControl)(imageControl:GetType(), self.control, controlID .. "_Image")
        CopyBaseProperty(imageControl, imageStatic)
        imageStatic:SetIgnore(true)
        imageStatic:SetShow(isChildShow)
        childMenuItem.imageStatic = imageStatic
      end
      do return childMenuItem end
      -- DECOMPILER ERROR: 3 unprocessed JMP targets
    end
  end
end

-- DECOMPILER ERROR at PC34: Confused about usage of register: R2 in 'UnsetPending'

TreeMenuItem.addEvent = function(self, event)
  -- function num : 0_5
  (self.control):SetIgnore(false)
  ;
  (self.control):addInputEvent("Mouse_LUp", event)
end

-- DECOMPILER ERROR at PC38: Confused about usage of register: R2 in 'UnsetPending'

TreeMenuItem.expand = function(self)
  -- function num : 0_6 , upvalues : TreeMenuGroupState
  if self:isLeafItem() then
    return 
  end
  for _,child in ipairs((self.groupInfo).childs) do
    child.startAni = false
    ;
    (child.control):EraseAllEffect()
    ;
    (child.control):SetShow(true)
    ;
    (child.control):SetAlpha(0)
    ;
    (UIAni.AlphaAnimation)(1, child.control, 0, 0.2)
    ;
    (child.line):SetShow(true)
    ;
    (child.line):SetAlpha(0)
    ;
    (UIAni.AlphaAnimation)(1, child.line, 0, 0.2)
    if child.imageStatic ~= nil then
      (child.imageStatic):SetShow(true)
      ;
      (child.imageStatic):SetAlpha(0)
      ;
      (UIAni.AlphaAnimation)(1, child.imageStatic, 0, 0.2)
    end
  end
  -- DECOMPILER ERROR at PC67: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.groupInfo).state = TreeMenuGroupState.Opened
end

-- DECOMPILER ERROR at PC42: Confused about usage of register: R2 in 'UnsetPending'

TreeMenuItem.collapse = function(self)
  -- function num : 0_7 , upvalues : TreeMenuGroupState
  if self:isLeafItem() then
    return 
  end
  for _,child in ipairs((self.groupInfo).childs) do
    local aniInfo = (UIAni.AlphaAnimation)(0, child.control, 0, 0.2)
    aniInfo:SetHideAtEnd(true)
    if child.imageStatic ~= nil then
      aniInfo = (UIAni.AlphaAnimation)(0, child.imageStatic, 0, 0.2)
      aniInfo:SetHideAtEnd(true)
    end
    ;
    (child.line):SetShow(false)
  end
  -- DECOMPILER ERROR at PC43: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self.groupInfo).state = TreeMenuGroupState.Closed
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R2 in 'UnsetPending'

TreeMenuItem.isExpand = function(self)
  -- function num : 0_8 , upvalues : TreeMenuGroupState
  do return (self.groupInfo).state == TreeMenuGroupState.Opened end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

local computeRadPos = function(radian, radius)
  -- function num : 0_9
  return radius * (math.cos)(radian), -radius * (math.sin)(radian)
end

-- DECOMPILER ERROR at PC51: Confused about usage of register: R3 in 'UnsetPending'

TreeMenuItem.computePos = function(self, parentBasePos, radian, radius, linePosFactor)
  -- function num : 0_10 , upvalues : computeRadPos
  local control = self.control
  local line = self.line
  local imageStatic = self.imageStatic
  local basePosX = control:GetSizeX() / 2
  local basePosY = control:GetSizeY() / 2
  local dx, dy = computeRadPos(radian, radius)
  do
    if self.startAni == false then
      local aniInfo = control:addMoveAnimation(0, 0.2, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_LINEAR)
      aniInfo:SetStartPosition(parentBasePos.x - basePosX, parentBasePos.y - basePosY)
      aniInfo:SetEndPosition(parentBasePos.x + dx - basePosX, parentBasePos.y + dy - basePosY)
      control:CalcUIAniPos(aniInfo)
      if imageStatic ~= nil then
        aniInfo = imageStatic:addMoveAnimation(0, 0.2, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_LINEAR)
        aniInfo:SetStartPosition(parentBasePos.x - basePosX, parentBasePos.y - basePosY)
        aniInfo:SetEndPosition(parentBasePos.x + dx - basePosX, parentBasePos.y + dy - basePosY)
        imageStatic:CalcUIAniPos(aniInfo)
      end
      self.startAni = true
    end
    line:SetPosX(basePosX - dx * linePosFactor - line:GetSizeX() / 2)
    line:SetPosY(basePosY - dy * linePosFactor - line:GetSizeY() / 2)
    line:SetRotate((math.atan2)(-dx, dy))
  end
end

TreeMenu = {}
-- DECOMPILER ERROR at PC56: Confused about usage of register: R3 in 'UnsetPending'

TreeMenu.__index = TreeMenu
-- DECOMPILER ERROR at PC59: Confused about usage of register: R3 in 'UnsetPending'

TreeMenu.new = function(id, parent)
  -- function num : 0_11
  local treeData = {}
  setmetatable(treeData, TreeMenu)
  treeData.items = (Array.new)()
  treeData.id = id
  treeData.lastExpandItemIndex = 0
  local control = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, parent, id .. "_1")
  control:SetIgnore(true)
  control:SetSize(1, 1)
  ;
  (TreeMenuItem.new)(control, treeData, nil)
  return treeData
end

-- DECOMPILER ERROR at PC62: Confused about usage of register: R3 in 'UnsetPending'

TreeMenu.new_Button = function(id, parent)
  -- function num : 0_12
  local treeData = {}
  setmetatable(treeData, TreeMenu)
  treeData.items = (Array.new)()
  treeData.id = id
  treeData.lastExpandItemIndex = 0
  local control = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_BUTTON, parent, id .. "_1")
  control:SetIgnore(false)
  control:SetSize(1, 1)
  ;
  (TreeMenuItem.new)(control, treeData, nil)
  return treeData
end

-- DECOMPILER ERROR at PC65: Confused about usage of register: R3 in 'UnsetPending'

TreeMenu.getRootItem = function(self)
  -- function num : 0_13
  return (self.items)[1]
end

-- DECOMPILER ERROR at PC68: Confused about usage of register: R3 in 'UnsetPending'

TreeMenu.getItemByIndex = function(self, index)
  -- function num : 0_14
  return (self.items)[index]
end

-- DECOMPILER ERROR at PC71: Confused about usage of register: R3 in 'UnsetPending'

TreeMenu.expandAll = function(self)
  -- function num : 0_15
  for _,menuItem in ipairs(self.items) do
    menuItem:expand()
  end
end

-- DECOMPILER ERROR at PC74: Confused about usage of register: R3 in 'UnsetPending'

TreeMenu.collapseAll = function(self)
  -- function num : 0_16
  for _,menuItem in ipairs(self.items) do
    menuItem:collapse()
  end
end

-- DECOMPILER ERROR at PC77: Confused about usage of register: R3 in 'UnsetPending'

TreeMenu.SetShow = function(self, bShow)
  -- function num : 0_17
  ((self:getRootItem()).control):SetShow(bShow)
end

local updatePos = function(menuItem, recursiveFunc)
  -- function num : 0_18
  local childList = (menuItem.groupInfo).childs
  local childCount = childList:length()
  if childCount == 0 then
    return 
  end
  local basePos = float2((menuItem.control):GetSizeX() / 2, (menuItem.control):GetSizeY() / 2)
  if childCount == 1 then
    local radian = ((menuItem.groupInfo).startRadian + (menuItem.groupInfo).maxRadian) / 2
    local child = childList[1]
    child:computePos(basePos, radian, (menuItem.groupInfo).radius, (menuItem.groupInfo).calculatedLinePosFactor)
    if not child:isLeafItem() then
      recursiveFunc(child, recursiveFunc)
    end
    return 
  end
  do
    local radianPerChild = ((menuItem.groupInfo).maxRadian - (menuItem.groupInfo).startRadian) / (childCount - 1)
    local radian = (menuItem.groupInfo).startRadian
    for idx,child in ipairs(childList) do
      child:computePos(basePos, radian, (menuItem.groupInfo).radius, (menuItem.groupInfo).calculatedLinePosFactor)
      radian = radian + radianPerChild
      if not child:isLeafItem() then
        recursiveFunc(child, recursiveFunc)
      end
    end
  end
end

-- DECOMPILER ERROR at PC82: Confused about usage of register: R4 in 'UnsetPending'

TreeMenu.update = function(self)
  -- function num : 0_19 , upvalues : updatePos
  local rootItem = self:getRootItem()
  if not rootItem:isLeafItem() then
    updatePos(rootItem, updatePos)
  end
end


