-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\panel_window_servantresurrection.luac 

-- params : ...
-- function num : 0
Panel_ServantResurrection:SetShow(false, false)
Panel_ServantResurrection:setGlassBackground(true)
Panel_ServantResurrection:SetDragAll(true)
Panel_ServantResurrection:RegisterShowEventFunc(true, "Panel_ServantResurrection_ShowAni()")
Panel_ServantResurrection:RegisterShowEventFunc(false, "Panel_ServantResurrection_HideAni()")
local UI_TM = CppEnums.TextMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_color = Defines.Color
Panel_ServantResurrection_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_ServantResurrection)
  local aniInfo1 = Panel_ServantResurrection:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_ServantResurrection:GetSizeX() / 2
  aniInfo1.AxisY = Panel_ServantResurrection:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_ServantResurrection:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_ServantResurrection:GetSizeX() / 2
  aniInfo2.AxisY = Panel_ServantResurrection:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_ServantResurrection_HideAni = function()
  -- function num : 0_1 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_ServantResurrection:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_ServantResurrection:addColorAnimation(0, 0.25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

local btnClose = (UI.getChildControl)(Panel_ServantResurrection, "Button_Close")
local radioBtn_Land = (UI.getChildControl)(Panel_ServantResurrection, "RadioButton_Land")
local radioBtn_Sea = (UI.getChildControl)(Panel_ServantResurrection, "RadioButton_Sea")
local btnResurrection = (UI.getChildControl)(Panel_ServantResurrection, "Button_Resurrection")
local selectTitle = (UI.getChildControl)(Panel_ServantResurrection, "StaticText_SelectTitle")
selectTitle:SetTextMode((CppEnums.TextMode).eTextMode_AutoWrap)
selectTitle:SetText(selectTitle:GetText())
btnClose:addInputEvent("Mouse_LUp", "Panel_ServantResurrection_Close()")
btnResurrection:addInputEvent("Mouse_LUp", "Do_ServantResurrection()")
local deadServantInfoArray = {}
local _fromWhereType, _fromSlotNo = nil, nil
Panel_ServantResurrection_Show = function()
  -- function num : 0_2 , upvalues : deadServantInfoArray, radioBtn_Land, radioBtn_Sea
  local landServantInfo = stable_getServantByServantNo(deadServantInfoArray[1])
  if landServantInfo == nil then
    return 
  end
  radioBtn_Land:SetText(landServantInfo:getName())
  local seaServantInfo = stable_getServantByServantNo(deadServantInfoArray[2])
  if seaServantInfo == nil then
    return 
  end
  radioBtn_Sea:SetText(seaServantInfo:getName())
  radioBtn_Land:SetCheck(true)
  radioBtn_Sea:SetCheck(false)
  Panel_ServantResurrection:SetShow(true, true)
end

Do_ServantResurrection = function()
  -- function num : 0_3 , upvalues : radioBtn_Land, deadServantInfoArray, _fromWhereType, _fromSlotNo
  local servantNo = nil
  if radioBtn_Land:IsCheck() then
    servantNo = deadServantInfoArray[1]
  else
    servantNo = deadServantInfoArray[2]
  end
  ToClient_RequestResurrectionServant(servantNo, _fromWhereType, _fromSlotNo)
end

Panel_ServantResurrection_Close = function()
  -- function num : 0_4
  Panel_ServantResurrection:SetShow(false, false)
end

FromClient_UseServantRespawnItem = function(fromWhereType, fromSlotNo, contentsEventParam1)
  -- function num : 0_5 , upvalues : deadServantInfoArray, _fromWhereType, _fromSlotNo
  local totalDeadServantCount = 0
  deadServantInfoArray = {}
  local count = ToClient_GetLastUnsealServantDataCount()
  for ii = 0, count - 1 do
    local servantInfo = ToClient_GetLastUnsealVehicleCaheDataAt(ii)
    if servantInfo ~= nil and servantInfo:getHp() == 0 then
      totalDeadServantCount = totalDeadServantCount + 1
      -- DECOMPILER ERROR at PC22: Confused about usage of register: R10 in 'UnsetPending'

      deadServantInfoArray[totalDeadServantCount] = servantInfo:getServantNo()
    end
  end
  if totalDeadServantCount == 1 then
    local servantNo = deadServantInfoArray[totalDeadServantCount]
    ToClient_RequestResurrectionServant(servantNo, fromWhereType, fromSlotNo)
  else
    do
      if totalDeadServantCount >= 2 then
        _fromWhereType = fromWhereType
        _fromSlotNo = fromSlotNo
        Panel_ServantResurrection_Show()
      end
    end
  end
end

FromClient_ServantResurrectionAck = function(servantNo, servantWhereType)
  -- function num : 0_6
  local servantInfo = stable_getServantByServantNo(servantNo)
  if servantInfo ~= nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SERVANTRESURRECTION_MSG"))
  end
end

registerEvent("FromClient_UseServantRespawnItem", "FromClient_UseServantRespawnItem")
registerEvent("FromClient_ServantResurrectionAck", "FromClient_ServantResurrectionAck")

