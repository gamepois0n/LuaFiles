-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\customization\panel_customization_mesh.luac 

-- params : ...
-- function num : 0
local UI_GroupType = CppEnums.PA_CONSOLE_UI_CONTROL_TYPE
local Frame_ContentImage = (UI.getChildControl)(Panel_CustomizationMesh, "Frame_Content_Image")
local Static_PayMark = (UI.getChildControl)(Panel_CustomizationMesh, "Static_PayMark")
local Static_SelectMark = (UI.getChildControl)(Panel_CustomizationMesh, "Static_SelectMark")
local paramValueList = {}
local ContentImage = {}
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local NoCashType = CppEnums.CustomizationNoCashType
local NoCashMesh = CppEnums.CustomizationNoCashMesh
local NoCashDeco = CppEnums.CustomizationNoCashDeco
local selectedMeshIndex = -1
local textureColumnCount = 4
local meshColumnCount = 5
local meshImageGap = 5
local columnWidth = Frame_ContentImage:GetSizeX() + meshImageGap
local columnHeight = Frame_ContentImage:GetSizeY() + meshImageGap
local contentsOffsetX = 10
local contentsOffsetY = 10
local texSize = 48
local selectedClassType, selectedListParamType, selectedListParamIndex, selectedItemIndex = nil, nil, nil, nil
local currentclassType = -1
local currentuiId = -1
registerEvent("EventOpenSelectMeshUi", "OpenSelectMeshUi")
registerEvent("EventCloseSelectMeshUi", "CloseSelectMeshUi")
local UpdateSelectedMark = function(meshUiIndex)
  -- function num : 0_0 , upvalues : Static_SelectMark, contentsOffsetX, meshColumnCount, columnWidth, contentsOffsetY, columnHeight
  if meshUiIndex ~= -1 then
    Static_SelectMark:SetShow(true)
    Static_SelectMark:SetPosX(contentsOffsetX + meshUiIndex % meshColumnCount * columnWidth)
    Static_SelectMark:SetPosY(contentsOffsetY + (math.floor)(meshUiIndex / meshColumnCount) * columnHeight)
  else
    Static_SelectMark:SetShow(false)
  end
end

local clearMeshUI = function()
  -- function num : 0_1 , upvalues : ContentImage
  for _,v in pairs(ContentImage) do
    v:SetShow(false)
    ;
    (UI.deleteControl)(v)
  end
  ContentImage = {}
end

CloseSelectMeshUi = function()
  -- function num : 0_2
  globalcurrentclassType = -2
  globalcurrentuiId = -2
end

OpenSelectMeshUi = function(classType, uiId, historyapply)
  -- function num : 0_3 , upvalues : UI_GroupType, clearMeshUI, paramValueList, currentclassType, currentuiId, selectedClassType, Frame_ContentImage, Static_PayMark, textureColumnCount, texSize, meshColumnCount, columnWidth, contentsOffsetX, columnHeight, contentsOffsetY, ContentImage, UpdateSelectedMark, meshImageGap
  if historyapply == nil then
    Set_CustomizationUIPanel(0, Panel_CustomizationFrame, 10)
    ClearAll_CustomizationUIGroup(0)
    Add_CustomizationUIGroup(0, 0, UI_GroupType.eCONSOLE_UI_CONTROL_TYPE_CUSTOMIZATION)
    Set_CustomizationUIgroupConsoleEvent(0, 0, "InConsolePrevFrame", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_LB2)
    Set_CustomizationUIgroupConsoleEvent(0, 0, "InConsoleNextFrame", (CppEnums.PA_CONSOLE_UI_EVENT_TYPE).eCONSOLE_UI_EVENT_TYPE_RB2)
  end
  clearMeshUI()
  paramValueList = {}
  globalcurrentclassType = classType
  globalcurrentuiId = uiId
  currentclassType = classType
  currentuiId = uiId
  selectedClassType = classType
  local defaultContentsIndex = 0
  local listCount = getUiListCount(classType, uiId, defaultContentsIndex)
  local detailListCount = getUiDetailListCount(classType, uiId, defaultContentsIndex)
  if listCount == 1 then
    local listIndex = 0
    local luaListIndex = listIndex + 1
    local listTexture = getUiListTextureName(classType, uiId, defaultContentsIndex, listIndex)
    local listParamType = getUiListParamType(classType, uiId, defaultContentsIndex, listIndex)
    local listParamIndex = getUiListParamIndex(classType, uiId, defaultContentsIndex, listIndex)
    local meshCount = getParamMax(classType, listParamType, listParamIndex) + 1
    local normalLastIndex = 0
    local maxcountx = 5
    local maxcounty = meshCount / maxcountx
    if meshCount % 5 ~= 0 then
      maxcounty = maxcounty + 1
    end
    for itemIndex = 0, meshCount - 1 do
      local luaShapeIdx = itemIndex + 1
      local tempContentImage = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_CustomizationMesh, "Frame_Image_" .. itemIndex)
      CopyBaseProperty(Frame_ContentImage, tempContentImage)
      tempContentImage:addInputEvent("Mouse_LUp", "UpdateMeshIndexMessage(" .. listParamType .. "," .. listParamIndex .. "," .. itemIndex .. ")")
      local staticPayMark = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, tempContentImage, "Static_PayMark_" .. itemIndex)
      CopyBaseProperty(Static_PayMark, staticPayMark)
      local col = itemIndex % textureColumnCount
      local row = (math.floor)(itemIndex / textureColumnCount)
      local texUV = {x1, y1, x2, y2}
      texUV.x1 = col * texSize
      texUV.y1 = row * texSize
      texUV.x2 = texUV.x1 + texSize
      texUV.y2 = texUV.y1 + texSize
      tempContentImage:ChangeTextureInfoName(listTexture)
      local x1, y1, x2, y2 = setTextureUV_Func(tempContentImage, texUV.x1, texUV.y1, texUV.x2, texUV.y2)
      ;
      (tempContentImage:getBaseTexture()):setUV(x1, y1, x2, y2)
      tempContentImage:SetPosX(itemIndex % meshColumnCount * columnWidth + contentsOffsetX)
      tempContentImage:SetPosY((math.floor)(itemIndex / meshColumnCount) * columnHeight + contentsOffsetY)
      tempContentImage:setRenderTexture(tempContentImage:getBaseTexture())
      if not FGlobal_IsInGameMode() and not isNormalCustomizingIndex(selectedClassType, listParamType, listParamIndex, itemIndex) and isServerFixedCharge() then
        tempContentImage:SetShow(false)
      else
        tempContentImage:SetShow(true)
      end
      if not isNormalCustomizingIndex(selectedClassType, listParamType, listParamIndex, itemIndex) then
        staticPayMark:SetShow(true)
      else
        staticPayMark:SetShow(false)
        normalLastIndex = normalLastIndex + 1
      end
      -- DECOMPILER ERROR at PC239: Confused about usage of register: R29 in 'UnsetPending'

      ContentImage[luaShapeIdx] = tempContentImage
      Add_CustomizationUIControl(0, 0, itemIndex % 5, itemIndex / 5, maxcountx, maxcounty, ContentImage[luaShapeIdx])
    end
    local param = getParam(listParamType, listParamIndex)
    UpdateSelectedMark(param)
    Panel_CustomizationMesh:SetSize(Panel_CustomizationMesh:GetSizeX(), (1 + (math.floor)((meshCount - 1) / meshColumnCount)) * columnHeight - meshImageGap + 2 * contentsOffsetY)
    updateGroupFrameControls(Panel_CustomizationMesh:GetSizeY(), Panel_CustomizationMesh)
  end
  do
    if detailListCount == 1 then
      local detailListIndex = 0
      local luaDetailListIndex = detailListIndex + 1
      local detailListParamType = getUiDetailListParamType(classType, uiId, defaultContentsIndex, detailListIndex)
      local detailListParamIndex = getUiDetailListParamIndex(classType, uiId, defaultContentsIndex, detailListIndex)
      local currentParamValue = (getParam(detailListParamType, detailListParamIndex))
      local currenelementIndex = nil
      local defaultDetailListIndex = 0
      local meshCount = getUiDetailListElementCount(classType, uiId, defaultContentsIndex, defaultDetailListIndex)
      local normalLastIndex = 0
      local maxcountx = 5
      local maxcounty = meshCount / maxcountx
      if meshCount % 5 ~= 0 then
        maxcounty = maxcounty + 1
      end
      for elementIndex = 0, meshCount - 1 do
        local luaElementIndex = elementIndex + 1
        local tempContentImage = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_CustomizationMesh, "Frame_Image_" .. elementIndex)
        CopyBaseProperty(Frame_ContentImage, tempContentImage)
        local paramValue = getUiDetailListElementParamValue(classType, uiId, defaultContentsIndex, defaultDetailListIndex, elementIndex)
        -- DECOMPILER ERROR at PC346: Confused about usage of register: R24 in 'UnsetPending'

        paramValueList[luaElementIndex] = paramValue
        if paramValue == currentParamValue then
          currenelementIndex = elementIndex
        end
        tempContentImage:addInputEvent("Mouse_LUp", "UpdateMeshIndexMessage(" .. detailListParamType .. "," .. detailListParamIndex .. "," .. elementIndex .. ")")
        local staticPayMark = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, tempContentImage, "Static_PayMark_" .. elementIndex)
        CopyBaseProperty(Static_PayMark, staticPayMark)
        local texUV = {x1, y1, x2, y2}
        texUV.x1 = 1
        texUV.y1 = 1
        texUV.x2 = texSize
        texUV.y2 = texSize
        local detailListElementTexture = getUiDetailListElementTextureName(classType, uiId, defaultContentsIndex, defaultDetailListIndex, elementIndex)
        tempContentImage:ChangeTextureInfoName(detailListElementTexture)
        local x1, y1, x2, y2 = setTextureUV_Func(tempContentImage, texUV.x1, texUV.y1, texUV.x2, texUV.y2)
        ;
        (tempContentImage:getBaseTexture()):setUV(x1, y1, x2, y2)
        tempContentImage:SetPosX(elementIndex % meshColumnCount * columnWidth + contentsOffsetX)
        tempContentImage:SetPosY((math.floor)(elementIndex / meshColumnCount) * columnHeight + contentsOffsetY)
        tempContentImage:setRenderTexture(tempContentImage:getBaseTexture())
        if not FGlobal_IsCommercialService() and not isNormalCustomizingIndex(selectedClassType, detailListParamType, detailListParamIndex, paramValue) then
          tempContentImage:SetShow(false)
        else
          if not FGlobal_IsInGameMode() and not isNormalCustomizingIndex(selectedClassType, detailListParamType, detailListParamIndex, paramValue) and isServerFixedCharge() then
            tempContentImage:SetShow(false)
          else
            tempContentImage:SetShow(true)
          end
        end
        if not isNormalCustomizingIndex(selectedClassType, detailListParamType, detailListParamIndex, paramValue) then
          staticPayMark:SetShow(true)
        else
          staticPayMark:SetShow(false)
          normalLastIndex = normalLastIndex + 1
        end
        -- DECOMPILER ERROR at PC491: Confused about usage of register: R31 in 'UnsetPending'

        ContentImage[luaElementIndex] = tempContentImage
        Add_CustomizationUIControl(0, 0, elementIndex % 5, elementIndex / 5, maxcountx, maxcounty, ContentImage[luaElementIndex])
      end
      UpdateSelectedMark(currenelementIndex)
      if not FGlobal_IsCommercialService() then
        Panel_CustomizationMesh:SetSize(Panel_CustomizationMesh:GetSizeX(), (1 + (math.floor)((normalLastIndex - 1) / meshColumnCount)) * columnHeight - meshImageGap + 2 * contentsOffsetY)
      else
        Panel_CustomizationMesh:SetSize(Panel_CustomizationMesh:GetSizeX(), (1 + (math.floor)((meshCount - 1) / meshColumnCount)) * columnHeight - meshImageGap + 2 * contentsOffsetY)
      end
      updateGroupFrameControls(Panel_CustomizationMesh:GetSizeY(), Panel_CustomizationMesh)
    end
  end
end

UpdateMeshIndexMessage = function(listParamType, listParamIndex, itemIndex)
  -- function num : 0_4 , upvalues : selectedListParamType, selectedListParamIndex, selectedItemIndex, paramValueList, selectedClassType
  selectedListParamType = listParamType
  selectedListParamIndex = listParamIndex
  selectedItemIndex = itemIndex
  local luaSelectedItemIndex = selectedItemIndex + 1
  local selectedParamValue = paramValueList[luaSelectedItemIndex]
  if Panel_Win_System:GetShow() then
    MessageBox_Empty_function()
    allClearMessageData()
  end
  if not FGlobal_IsInGameMode() and not isNormalCustomizingIndex(selectedClassType, listParamType, listParamIndex, selectedParamValue) then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATION_MSGBOX_APPLY_CASHITEM")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = UpdateMeshIndex, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData, "top")
  else
    do
      UpdateMeshIndex()
      add_CurrentHistory()
    end
  end
end

UpdateMeshIndex = function()
  -- function num : 0_5 , upvalues : selectedItemIndex, paramValueList, selectedClassType, selectedListParamType, selectedListParamIndex, UpdateSelectedMark
  local luaSelectedItemIndex = selectedItemIndex + 1
  local selectedParamValue = paramValueList[luaSelectedItemIndex]
  setParam(selectedClassType, selectedListParamType, selectedListParamIndex, selectedParamValue)
  UpdateSelectedMark(selectedItemIndex)
  applyInitializeToGroupCustomizedBoneInfo()
end

MeshHistoryApplyUpdate = function()
  -- function num : 0_6 , upvalues : currentclassType, currentuiId
  if globalcurrentclassType ~= currentclassType or globalcurrentuiId ~= currentuiId then
    return 
  end
  OpenSelectMeshUi(currentclassType, currentuiId, true)
end


