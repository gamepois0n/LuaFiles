-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\competition\competition.luac 

-- params : ...
-- function num : 0
local width = 390
local height = 220
local posAndRot = {
[1] = {multipleSize = 12.32, posX = 190704.656, posY = -832.209, posZ = 402490.156, rotX = 286, rotY = -1.7, rotZ = 0, ownerTexture = nil, openUrl = "coui://UI_Data/UI_Html/FightStateBoard.html", openEndFunction = function(childControl)
  -- function num : 0_0
  if ToClient_CompetitionIsFight() then
    childControl:TriggerEvent("UpdateFightState_Competition_Force", "true")
  else
    childControl:TriggerEvent("UpdateFightState_Competition_Force", "false")
  end
end
}
, 
[2] = {multipleSize = 12.32, posX = 176628.188, posY = -832.715, posZ = 402490.094, rotX = 434.96, rotY = -1.7, rotZ = 0, ownerTexture = nil, openUrl = "coui://UI_Data/UI_Html/FightStateBoard.html", openEndFunction = function(childControl)
  -- function num : 0_1
  if ToClient_CompetitionIsFight() then
    childControl:TriggerEvent("UpdateFightState_Competition_Force", "true")
  else
    childControl:TriggerEvent("UpdateFightState_Competition_Force", "false")
  end
end
}
}
local posAndRotCount = #posAndRot
local panelList = {}
local childControlList = {}
local createNewPanel = function(name, posAndRot, width, height)
  -- function num : 0_2
  local newPanel = (UI.createOtherPanel)(name, (CppEnums.OtherListType).OtherPanelType_TagName)
  newPanel:SetSize(width * posAndRot.multipleSize, height * posAndRot.multipleSize)
  newPanel:Set3DRenderType(4)
  newPanel:SetDepth(10000)
  newPanel:SetIgnore(true)
  newPanel:SetShow(true, false)
  newPanel:SetPosX(-10000)
  newPanel:SetPosY(-10000)
  newPanel:SetWorldPosX(posAndRot.posX)
  newPanel:SetWorldPosY(posAndRot.posY)
  newPanel:SetWorldPosZ(posAndRot.posZ)
  newPanel:Set3DRotationX(posAndRot.rotX * math.pi / 180)
  newPanel:Set3DRotationY(posAndRot.rotY * math.pi / 180)
  newPanel:Set3DRotationZ(posAndRot.rotZ * math.pi / 180)
  local control = nil
  if posAndRot.ownerTexture == nil then
    control = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_WEBCONTROL, newPanel, "WebControl_CustomizingAlbum")
    control:SetShow(true)
    control:SetIgnore(true)
    control:SetPosX(0)
    control:SetPosY(0)
    control:SetSize(width, height)
    control:SetUrl(width, height, posAndRot.openUrl)
    control:SetAlpha(1)
    control:SetHorizonCenter()
    control:SetVerticalMiddle()
    newPanel:SetAlpha(0)
  else
    newPanel:SetAlpha(1)
  end
  return newPanel, control
end

Competition_UpdatePerFrame = function(delta)
  -- function num : 0_3 , upvalues : posAndRotCount, posAndRot, childControlList, panelList
  do return  end
  for value = 1, posAndRotCount do
    local distance = distanceFromCamera((posAndRot[value]).posX, (posAndRot[value]).posY, (posAndRot[value]).posZ)
    if childControlList[value] ~= nil then
      (childControlList[value]):SetScaleChild((posAndRot[value]).multipleSize / getGlobalScale(), (posAndRot[value]).multipleSize / getGlobalScale())
      ;
      (panelList[value]):SetDepth(distance * distance)
    else
      ;
      (panelList[value]):SetScaleChild(1 / getGlobalScale(), 1 / getGlobalScale())
    end
    ;
    (panelList[value]):SetShow(distance < 18000)
  end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

FromWeb_WebPageError_Competition = function(url, statusCode)
  -- function num : 0_4 , upvalues : posAndRotCount, posAndRot, childControlList
  do return  end
  if statusCode ~= 200 then
    return 
  end
  for value = 1, posAndRotCount do
    if (string.lower)((posAndRot[value]).openUrl) == (string.lower)(url) and childControlList[value] ~= nil then
      ((posAndRot[value]).openEndFunction)(childControlList[value])
    end
  end
end

FromClient_luaLoadComplete_Competition = function()
  -- function num : 0_5 , upvalues : posAndRotCount, panelList, childControlList, createNewPanel, posAndRot, width, height
  do return  end
  for value = 1, posAndRotCount do
    -- DECOMPILER ERROR at PC18: Confused about usage of register: R5 in 'UnsetPending'

    -- DECOMPILER ERROR at PC19: Confused about usage of register: R4 in 'UnsetPending'

    panelList[value] = createNewPanel("testPanel_" .. tostring(value), posAndRot[value], width, height)
  end
  for value = 1, posAndRotCount do
    if (posAndRot[value]).ownerTexture ~= nil then
      local baseTexture = (childControlList[(posAndRot[value]).ownerTexture]):getBaseTexture()
      ;
      (panelList[value]):ChangeTextureInfoPtr(baseTexture:getTexture(), 0)
      ;
      (panelList[value]):SetTexturePreload(true)
    end
  end
end

FromClient_UpdateFightState_Competition = function(fightState)
  -- function num : 0_6 , upvalues : posAndRotCount, childControlList
  do return  end
  for value = 1, posAndRotCount do
    if (CppEnums.CompetitionFightState).eCompetitionFightState_Fight == fightState then
      (childControlList[value]):TriggerEvent("UpdateFightState_Competition", "true")
    else
      if (CppEnums.CompetitionFightState).eCompetitionFightState_Done == fightState then
        (childControlList[value]):TriggerEvent("UpdateFightState_Competition", "false")
      end
    end
  end
end

registerEvent("FromWeb_WebPageError", "FromWeb_WebPageError_Competition")
registerEvent("FromClient_luaLoadComplete", "FromClient_luaLoadComplete_Competition")
registerEvent("FromClient_UpdateFightState", "FromClient_UpdateFightState_Competition")

