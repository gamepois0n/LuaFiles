-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\customization\panel_action_pose.luac 

-- params : ...
-- function num : 0
local FrameTemplate = (UI.getChildControl)(Panel_CustomizationMotion, "Frame_Template")
local Frame_Content = (UI.getChildControl)(FrameTemplate, "Frame_Content")
local Frame_ContentImage = (UI.getChildControl)(Frame_Content, "Frame_Content_Image")
local Frame_Scroll = (UI.getChildControl)(FrameTemplate, "Frame_Scroll")
local Static_SelectMark = (UI.getChildControl)(Frame_Content, "Static_SelectMark")
local Static_Frame = (UI.getChildControl)(Panel_CustomizationMotion, "Static_Frame")
local Button_Close = (UI.getChildControl)(Panel_CustomizationMotion, "Button_Close")
local StaticText_Title = ((UI.getChildControl)(Panel_CustomizationMotion, "StaticText_Title"))
local selectedClassType = nil
StaticText_Title:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CUSTOMIZATIONMOTION_STATICTEXT_TITLE"))
Button_Close:addInputEvent("Mouse_LUp", "closeMotionUi()")
local textureColumnCount = 4
local ColumnCount = 4
local ImageGap = 10
local columnWidth = Frame_ContentImage:GetSizeX() + ImageGap
local columnHeight = Frame_ContentImage:GetSizeY() + ImageGap
local contentsOffsetX = 10
local contentsOffsetY = 10
local ContentImage = {}
registerEvent("EventOpenMotionUI", "openMotionUi")
registerEvent("EventCloseMotionUI", "closeMotionUi")
local UpdateMarkPosition = function(index)
  -- function num : 0_0 , upvalues : Static_SelectMark, ColumnCount, columnWidth, contentsOffsetX, columnHeight, contentsOffsetY
  if index ~= -1 then
    Static_SelectMark:SetShow(true)
    Static_SelectMark:SetPosX(index % ColumnCount * columnWidth + contentsOffsetX)
    Static_SelectMark:SetPosY((math.floor)(index / ColumnCount) * columnHeight + contentsOffsetY)
  else
    Static_SelectMark:SetShow(false)
  end
end

local clearContentList = function()
  -- function num : 0_1 , upvalues : ContentImage
  for _,content in pairs(ContentImage) do
    content:SetShow(false)
    ;
    (UI.deleteControl)(content)
  end
  ContentImage = {}
end

createMotionList = function()
  -- function num : 0_2 , upvalues : clearContentList, selectedClassType, Frame_Content, Frame_ContentImage, textureColumnCount, ColumnCount, columnWidth, contentsOffsetX, columnHeight, contentsOffsetY, ContentImage, FrameTemplate, Frame_Scroll, Static_Frame
  clearContentList()
  local TYPE = CppEnums.CountryType
  local ServiceType = getGameServiceType()
  local minusIndex = 0
  if TYPE.DEV == ServiceType or TYPE.JPN_ALPHA == ServiceType or TYPE.JPN_REAL == ServiceType then
    minusIndex = 3
  end
  local count = getMotionCount(selectedClassType) - minusIndex
  local textureName = getMotionTextureName(selectedClassType)
  local texSize = 48.25
  for itemIdx = 0, count - 1 do
    local tempContentImage = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Frame_Content, "Frame_Image_" .. itemIdx)
    CopyBaseProperty(Frame_ContentImage, tempContentImage)
    tempContentImage:addInputEvent("Mouse_LUp", "UpdateMotion(" .. itemIdx .. ")")
    local mod = itemIdx % textureColumnCount
    local divi = (math.floor)(itemIdx / textureColumnCount)
    local texUV = {x1, y1, x2, y2}
    texUV.x1 = mod * texSize
    texUV.y1 = divi * texSize
    texUV.x2 = texUV.x1 + texSize
    texUV.y2 = texUV.y1 + texSize
    tempContentImage:ChangeTextureInfoName("New_UI_Common_ForLua/Window/Lobby/" .. textureName)
    local x1, y1, x2, y2 = setTextureUV_Func(tempContentImage, texUV.x1, texUV.y1, texUV.x2, texUV.y2)
    ;
    (tempContentImage:getBaseTexture()):setUV(x1, y1, x2, y2)
    tempContentImage:SetPosX(itemIdx % ColumnCount * columnWidth + contentsOffsetX)
    tempContentImage:SetPosY((math.floor)(itemIdx / ColumnCount) * columnHeight + contentsOffsetY)
    tempContentImage:setRenderTexture(tempContentImage:getBaseTexture())
    tempContentImage:SetShow(true)
    -- DECOMPILER ERROR at PC120: Confused about usage of register: R18 in 'UnsetPending'

    ContentImage[itemIdx] = tempContentImage
  end
  FrameTemplate:UpdateContentScroll()
  Frame_Scroll:SetControlTop()
  FrameTemplate:UpdateContentPos()
  FrameTemplate:SetShow(true)
  Static_Frame:SetSize(Static_Frame:GetSizeX(), FrameTemplate:GetSizeY() + 20)
  Panel_CustomizationMotion:SetSize(Panel_CustomizationMotion:GetSizeX(), FrameTemplate:GetPosY() + FrameTemplate:GetSizeY() + 20)
end

UpdateMotion = function(index)
  -- function num : 0_3 , upvalues : UpdateMarkPosition
  applyMotion(index)
  UpdateMarkPosition(index)
end

openMotionUi = function(classType)
  -- function num : 0_4 , upvalues : UpdateMarkPosition, selectedClassType
  UpdateMarkPosition(-1)
  clearAllPoseBone()
  selectedClassType = classType
  createMotionList()
  Panel_CustomizationMotion:SetShow(true)
  CameraLookEnable(false)
  CloseFrameForPoseUI()
  Panel_CustomizationMotion:SetPosX(Panel_CustomizationFrame:GetPosX())
  Panel_CustomizationMotion:SetPosY(Panel_CustomizationFrame:GetPosY())
  setPresetCamera(4)
end

closeMotionUi = function()
  -- function num : 0_5 , upvalues : clearContentList
  if Panel_CustomizationImage:GetShow() then
    CloseTextureUi()
    return 
  end
  Panel_CustomizationMotion:SetShow(false)
  Panel_CustomizationFrame:SetPosX(Panel_CustomizationMotion:GetPosX())
  Panel_CustomizationFrame:SetPosY(Panel_CustomizationMotion:GetPosY())
  applyMotion(-1)
  clearContentList()
  CustomizationMainUIShow(true)
  selectPoseControl(0)
  setPresetCamera(10)
end


