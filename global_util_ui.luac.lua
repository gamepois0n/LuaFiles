-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\include\global_util_ui.luac 

-- params : ...
-- function num : 0
if UI == nil then
  UI = {}
end
local defaultRenderMode = PAUIRenderModeBitSet({(Defines.RenderMode).eRenderMode_Default})
-- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

UI.createPanel = function(strID, groupID)
  -- function num : 0_0 , upvalues : defaultRenderMode
  tempUIBaseForLua = nil
  createPanel(strID, groupID, defaultRenderMode)
  return tempUIBaseForLua
end

-- DECOMPILER ERROR at PC18: Confused about usage of register: R1 in 'UnsetPending'

UI.createPanelAndSetPanelRenderMode = function(strID, groupID, renderModeBitSet)
  -- function num : 0_1
  tempUIBaseForLua = nil
  createPanel(strID, groupID, renderModeBitSet)
  return tempUIBaseForLua
end

-- DECOMPILER ERROR at PC21: Confused about usage of register: R1 in 'UnsetPending'

UI.createControl = function(uiType, parent, strID)
  -- function num : 0_2
  tempUIBaseForLua = nil
  createControl(uiType, parent, strID)
  return tempUIBaseForLua
end

-- DECOMPILER ERROR at PC24: Confused about usage of register: R1 in 'UnsetPending'

UI.createAndCopyBasePropertyControl = function(fromParent, fromStrID, parent, strID)
  -- function num : 0_3
  local fromControl = (UI.getChildControl)(fromParent, fromStrID)
  if fromControl == nil or type(fromControl) == "number" then
    (UI.ASSERT)(fromControl ~= nil, fromStrID)
    do return nil end
    fromControl:SetShow(false)
    tempUIBaseForLua = nil
    createControl(fromControl:GetType(), parent, strID)
    if tempUIBaseForLua == nil or type(tempUIBaseForLua) == "number" then
      do
        (UI.ASSERT)(tempUIBaseForLua ~= nil, strID)
        do return nil end
        CopyBaseProperty(fromControl, tempUIBaseForLua)
        tempUIBaseForLua:SetShow(true)
        do return tempUIBaseForLua end
        -- DECOMPILER ERROR: 5 unprocessed JMP targets
      end
    end
  end
end

-- DECOMPILER ERROR at PC27: Confused about usage of register: R1 in 'UnsetPending'

UI.createCustomControl = function(typeStr, parent, strID)
  -- function num : 0_4
  tempUIBaseForLua = nil
  createCustomControl(typeStr, parent, strID)
  return tempUIBaseForLua
end

-- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

UI.deleteControl = function(conrol)
  -- function num : 0_5
  deleteControl(conrol)
end

-- DECOMPILER ERROR at PC33: Confused about usage of register: R1 in 'UnsetPending'

UI.getChildControl = function(parent, strID)
  -- function num : 0_6
  tempUIBaseForLua = nil
  parent:getChildControl(strID)
  if tempUIBaseForLua == nil or type(tempUIBaseForLua) == "number" then
    (UI.ASSERT)(tempUIBaseForLua ~= nil, strID)
    do return nil end
    do return tempUIBaseForLua end
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC36: Confused about usage of register: R1 in 'UnsetPending'

UI.getChildControlByIndex = function(parent, index)
  -- function num : 0_7
  tempUIBaseForLua = nil
  parent:getChildControlByIndex(index)
  return tempUIBaseForLua
end

-- DECOMPILER ERROR at PC39: Confused about usage of register: R1 in 'UnsetPending'

UI.deletePanel = function(strID)
  -- function num : 0_8
  deletePanel(strID, groupID)
end

-- DECOMPILER ERROR at PC42: Confused about usage of register: R1 in 'UnsetPending'

UI.createOtherPanel = function(strID, groupID)
  -- function num : 0_9
  tempUIBaseForLua = nil
  createOtherPanel(strID, groupID)
  return tempUIBaseForLua
end

-- DECOMPILER ERROR at PC45: Confused about usage of register: R1 in 'UnsetPending'

UI.deleteOtherPanel = function(strID)
  -- function num : 0_10
  deleteOtherPanel(strID)
end

-- DECOMPILER ERROR at PC48: Confused about usage of register: R1 in 'UnsetPending'

UI.deleteOtherControl = function(panel, control)
  -- function num : 0_11
  deleteOtherControl(panel, control)
end

-- DECOMPILER ERROR at PC51: Confused about usage of register: R1 in 'UnsetPending'

UI.isFlushedUI = function()
  -- function num : 0_12
  return isFlushedUI()
end

-- DECOMPILER ERROR at PC54: Confused about usage of register: R1 in 'UnsetPending'

UI.ASSERT = function(test, message)
  -- function num : 0_13
  if not message then
    message = tostring(test)
  end
  if type(message) ~= "string" then
    message = tostring(message)
  end
  test = test ~= nil and test ~= false and test ~= 0
  _PA_ASSERT(test, message)
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

-- DECOMPILER ERROR at PC57: Confused about usage of register: R1 in 'UnsetPending'

UI.Set_ProcessorInputMode = function(UIModeType)
  -- function num : 0_14
  if getInputMode() ~= UIModeType then
    setInputMode(UIModeType)
  end
end

-- DECOMPILER ERROR at PC60: Confused about usage of register: R1 in 'UnsetPending'

UI.isGameOptionMouseMode = function()
  -- function num : 0_15
  do return getOptionMouseMode() == true end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

-- DECOMPILER ERROR at PC63: Confused about usage of register: R1 in 'UnsetPending'

UI.Get_ProcessorInputMode = function()
  -- function num : 0_16
  return getInputMode()
end

setTextureUV_Func = function(control, pixX, pixY, pixEndX, pixEndY)
  -- function num : 0_17
  local sizeX = control:getTextureWidth()
  local sizeY = control:getTextureHeight()
  if sizeX == 0 and sizeY == 0 then
    return 0, 0, 0, 0
  end
  return pixX / sizeX, pixY / sizeY, pixEndX / sizeX, pixEndY / sizeY
end

-- DECOMPILER ERROR at PC68: Confused about usage of register: R1 in 'UnsetPending'

UI.getFocusEdit = function()
  -- function num : 0_18
  return GetFocusEdit()
end

-- DECOMPILER ERROR at PC71: Confused about usage of register: R1 in 'UnsetPending'

UI.isInPositionForLua = function(control, posX, posY)
  -- function num : 0_19
  return isInPostion(control, posX, posY)
end

-- DECOMPILER ERROR at PC74: Confused about usage of register: R1 in 'UnsetPending'

UI.checkShowWindow = function()
  -- function num : 0_20
  return check_ShowWindow()
end

-- DECOMPILER ERROR at PC77: Confused about usage of register: R1 in 'UnsetPending'

UI.checkIsInMouse = function(panel)
  -- function num : 0_21
  do
    local IsMouseOver = panel:GetPosX() < getMousePosX() and getMousePosX() < panel:GetPosX() + panel:GetSizeX() and panel:GetPosY() < getMousePosY() and getMousePosY() < panel:GetPosY() + panel:GetSizeY() and (CppEnums.EProcessorInputMode).eProcessorInputMode_UiMode == (UI.Get_ProcessorInputMode)()
    do return not IsMouseOver or isCharacterCameraRotateMode() == false end
    -- DECOMPILER ERROR: 3 unprocessed JMP targets
  end
end

-- DECOMPILER ERROR at PC80: Confused about usage of register: R1 in 'UnsetPending'

UI.checkIsInMouseAndEventPanel = function(panel)
  -- function num : 0_22
  local isOverEvent = (UI.checkIsInMouse)(panel)
  local eventControl = getEventControl()
  do
    do
      if eventControl ~= nil then
        local parentPanel = eventControl:GetParentPanel()
        return (parentPanel:GetKey() == panel:GetKey() and isOverEvent)
      end
      do return isOverEvent end
      -- DECOMPILER ERROR: 3 unprocessed JMP targets
    end
  end
end


