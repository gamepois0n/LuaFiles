-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\housing\panel_housename.luac 

-- params : ...
-- function num : 0
local UI_color = Defines.Color
Panel_HouseName:SetShow(false)
Panel_HouseName:SetIgnore(true)
Panel_HouseName:RegisterShowEventFunc(true, "Panel_HouseName_ShowAni()")
Panel_HouseName:RegisterShowEventFunc(false, "Panel_HouseName_HideAni()")
local ui = {_houseName = (UI.getChildControl)(Panel_HouseName, "StaticText_HouseName"), _hosueIcon = (UI.getChildControl)(Panel_HouseName, "Static_HouseIcon"), _btnInstallationMode = (UI.getChildControl)(Panel_HouseName, "Button_Install"), _btnNoticeLighting = (UI.getChildControl)(Panel_HouseName, "StaticText_NoticeLighting"), _btnInstallGift = (UI.getChildControl)(Panel_HouseName, "Button_InstallGift"), _btnShowRank = (UI.getChildControl)(Panel_HouseName, "Button_ShowRank"), _btnScreenShot = (UI.getChildControl)(Panel_HouseName, "Button_Capture"), _btnSetUnderWear = (UI.getChildControl)(Panel_HouseName, "Button_SetUnderwear"), _btnToggleHideMaid = (UI.getChildControl)(Panel_HouseName, "Button_ToggleHideMaid"), _btnToggleHidePet = (UI.getChildControl)(Panel_HouseName, "Button_ToggleHidePet")}
;
(ui._btnSetUnderWear):addInputEvent("Mouse_LUp", "HandleClicked_SetShowUnderWearToggle()")
;
(ui._btnSetUnderWear):addInputEvent("Mouse_On", "HouseName_ButtonTooltip( true, " .. 0 .. " )")
;
(ui._btnSetUnderWear):addInputEvent("Mouse_Out", "HouseName_ButtonTooltip( false )")
;
(ui._btnToggleHideMaid):addInputEvent("Mouse_LUp", "HandleClicked_ToggleHideMaidToggle()")
;
(ui._btnToggleHideMaid):addInputEvent("Mouse_On", "HouseName_ButtonTooltip( true, " .. 5 .. " )")
;
(ui._btnToggleHideMaid):addInputEvent("Mouse_Out", "HouseName_ButtonTooltip( false )")
;
(ui._btnToggleHidePet):addInputEvent("Mouse_LUp", "HandleClicked_ToggleHidePet()")
;
(ui._btnToggleHidePet):addInputEvent("Mouse_On", "HouseName_ButtonTooltip( true, " .. 4 .. " )")
;
(ui._btnToggleHidePet):addInputEvent("Mouse_Out", "HouseName_ButtonTooltip( false )")
;
(ui._btnInstallationMode):addInputEvent("Mouse_LUp", "HouseName_Click_InstallationMode()")
;
(ui._btnInstallationMode):addInputEvent("Mouse_On", "HouseName_ButtonTooltip( true, " .. 1 .. " )")
;
(ui._btnInstallationMode):addInputEvent("Mouse_Out", "HouseName_ButtonTooltip( false )")
;
(ui._btnInstallationMode):SetShow(false)
;
(ui._btnInstallGift):addInputEvent("Mouse_LUp", "HouseName_Click_InstallationMode()")
;
(ui._btnInstallGift):addInputEvent("Mouse_On", "HouseName_ButtonTooltip( true, " .. 3 .. " )")
;
(ui._btnInstallGift):addInputEvent("Mouse_Out", "HouseName_ButtonTooltip( false )")
;
(ui._btnInstallGift):SetShow(false)
;
(ui._btnShowRank):addInputEvent("Mouse_LUp", "Housename_Click_ShowRank()")
;
(ui._btnShowRank):addInputEvent("Mouse_On", "HouseName_ButtonTooltip( true, " .. 2 .. " )")
;
(ui._btnShowRank):addInputEvent("Mouse_Out", "HouseName_ButtonTooltip( false )")
;
(ui._btnShowRank):SetShow(false)
;
(ui._btnSetUnderWear):setTooltipEventRegistFunc("HouseName_ButtonTooltip( true, " .. 0 .. " )")
;
(ui._btnInstallationMode):setTooltipEventRegistFunc("HouseName_ButtonTooltip( true, " .. 1 .. " )")
;
(ui._btnInstallGift):setTooltipEventRegistFunc("HouseName_ButtonTooltip( true, " .. 3 .. " )")
;
(ui._btnShowRank):setTooltipEventRegistFunc("HouseName_ButtonTooltip( true, " .. 2 .. " )")
;
(ui._btnScreenShot):addInputEvent("Mouse_LUp", "")
;
(ui._btnScreenShot):SetShow(false)
local _isMyHouse = false
local updateTime = 0
local isAlertHouseLighting = false
HouseName_ButtonTooltip = function(isShow, buttonNo)
  -- function num : 0_0 , upvalues : ui
  local control, name, desc = nil
  if buttonNo == 0 then
    control = ui._btnSetUnderWear
    name = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSINGNAME_TOOLTIP_TITLE_UNDERWEAR")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSINGNAME_TOOLTIP_DESC_UNDERWEAR")
  else
    if buttonNo == 1 then
      control = ui._btnInstallationMode
      name = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSINGNAME_TOOLTIP_TITLE_INSTALLATIONMODE")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSINGNAME_TOOLTIP_DESC_INSTALLATIONMODE")
    else
      if buttonNo == 2 then
        control = ui._btnShowRank
        name = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSINGNAME_TOOLTIP_TITLE_SHOWRANK")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSINGNAME_TOOLTIP_DESC_SHOWRANK")
      else
        if buttonNo == 3 then
          control = ui._btnInstallGift
          name = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSINGNAME_TOOLTIP_TITLE_INSTALLGIFT")
          desc = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSINGNAME_TOOLTIP_DESC_INSTALLGIFT")
        else
          if buttonNo == 4 then
            control = ui._btnToggleHidePet
            name = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSENAME_PET_TOOLTIP_NAME")
            desc = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSENAME_PET_TOOLTIP_DESC")
          else
            if buttonNo == 5 then
              control = ui._btnToggleHideMaid
              name = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSENAME_MAID_TOOLTIP_NAME")
              desc = PAGetString(Defines.StringSheet_GAME, "LUA_HOUSENAME_MAID_TOOLTIP_DESC")
            end
          end
        end
      end
    end
  end
  if isShow == true then
    registTooltipControl(control, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

HouseName_Click_InstallationMode = function()
  -- function num : 0_1
  if getInputMode() == (CppEnums.EProcessorInputMode).eProcessorInputMode_ChattingInputMode then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_NOT_ENTER_HOUSINGMODE_CHATMODE"))
    return 
  end
  HouseName_ButtonTooltip(false)
  FGlobal_House_InstallationMode_Open()
  local isShow = housing_getIsHideMaidActors()
end

Housename_Click_ShowRank = function()
  -- function num : 0_2
  toClient_RequestHouseRankerList()
end

HandleClicked_LetsWorkerParty = function()
  -- function num : 0_3
  local currentWayPointKey = getCurrentWaypointKey()
  local plantKey = ToClient_convertWaypointKeyToPlantKey(currentWayPointKey)
  local workerCount = ToClient_getPlantWaitWorkerListCount(plantKey, 0)
  if workerCount > 0 then
    local houseWrapper = housing_getHouseholdActor_CurrentPosition()
    if houseWrapper ~= nil then
      local characterKeyRaw = (houseWrapper:getStaticStatusWrapper()):getCharacterKey()
      local housePlantKey = PlantKey()
      housePlantKey:setHouseKeyRaw(characterKeyRaw)
      ToClient_requestStartHousePartyAll(housePlantKey)
    end
  end
end

HandleClicked_SetShowUnderWearToggle = function()
  -- function num : 0_4 , upvalues : ui
  if not IsSelfPlayerWaitAction() or IsSelfPlayerBattleWaitAction() then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_CURRENTACTION_NOT_UNDERWEAR"))
    if (ui._btnSetUnderWear):IsCheck() then
      (ui._btnSetUnderWear):SetCheck(false)
    else
      ;
      (ui._btnSetUnderWear):SetCheck(true)
    end
    return 
  end
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  if (selfPlayer:get()):getUnderwearModeInhouse() then
    (selfPlayer:get()):setUnderwearModeInhouse(false)
    Toclient_setShowAvatarEquip()
  else
    ;
    (selfPlayer:get()):setUnderwearModeInhouse(true)
  end
end

HandleClicked_ToggleHideMaidToggle = function()
  -- function num : 0_5
  local houseWrapper = housing_getHouseholdActor_CurrentPosition()
  local isHide = housing_getIsHideMaidActors()
  if houseWrapper ~= nil then
    if isHide == true then
      housing_setHideMaidInHouse(false)
    else
      if isHide == false then
        housing_setHideMaidInHouse(true)
      end
    end
  end
end

HandleClicked_ToggleHidePet = function()
  -- function num : 0_6
  local houseWrapper = housing_getHouseholdActor_CurrentPosition()
  local isHide = housing_getIsHidePetActors()
  if houseWrapper ~= nil then
    if isHide == true then
      housing_setHidePetInHouse(false)
    else
      if isHide == false then
        housing_setHidePetInHouse(true)
      end
    end
  end
end

FromClient_ChangeUnderwearModeInHouse = function(isUnderwearModeInHouse)
  -- function num : 0_7 , upvalues : ui
  (ui._btnSetUnderWear):SetCheck(isUnderwearModeInHouse)
end

Panel_HouseName_ShowAni = function()
  -- function num : 0_8
  (UIAni.AlphaAnimation)(1, Panel_HouseName, 0, 1)
end

Panel_HouseName_HideAni = function()
  -- function num : 0_9
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_HouseName, 0, 0.35)
  aniInfo:SetHideAtEnd(true)
end

Panel_HouseName_Resize = function()
  -- function num : 0_10
  Panel_HouseName:SetPosX(getScreenSizeX() / 2 - Panel_HouseName:GetSizeX() / 2)
end

EventHousingShowVisitHouse = function(isShow, houseName, userNickname, point, isMine)
  -- function num : 0_11 , upvalues : ui, _isMyHouse
  local isShowUnderwear = ((getSelfPlayer()):get()):getUnderwearModeInhouse()
  ;
  (ui._btnSetUnderWear):SetCheck(isShowUnderwear)
  local isPet = housing_getIsHidePetActors()
  local isMaid = housing_getIsHideMaidActors()
  ;
  (ui._btnToggleHidePet):SetCheck(isPet)
  ;
  (ui._btnToggleHideMaid):SetCheck(isMaid)
  local houseWrapper = housing_getHouseholdActor_CurrentPosition()
  if houseWrapper == nil then
    Panel_HouseName:SetShow(false, false)
    FGlobal_AlertHouseLightingReset()
    ;
    (ui._btnNoticeLighting):SetShow(false)
    return 
  end
  _isMyHouse = isMine
  local isInnRoom = ((houseWrapper:getStaticStatusWrapper()):getObjectStaticStatus()):isInnRoom()
  local isFixedHouse = ((houseWrapper:getStaticStatusWrapper()):getObjectStaticStatus()):isFixedHouse()
  if isFixedHouse then
    (ui._btnShowRank):SetShow(false)
    ;
    (ui._btnInstallationMode):SetShow(false)
    ;
    (ui._btnInstallGift):SetShow(false)
    return 
  else
    if isInnRoom then
      (ui._btnShowRank):SetShow(false)
      if isMine then
        (ui._btnInstallationMode):SetShow(true)
        ;
        (ui._btnInstallGift):SetShow(false)
      else
        ;
        (ui._btnInstallationMode):SetShow(false)
        if FGlobal_IsCommercialService() then
          (ui._btnInstallGift):SetShow(true)
        else
          ;
          (ui._btnInstallGift):SetShow(false)
        end
      end
    else
      ;
      (ui._btnShowRank):SetShow(false)
      ;
      (ui._btnInstallationMode):SetShow(false)
      ;
      (ui._btnInstallGift):SetShow(false)
    end
  end
  local desc = "<PAColor0xFFFFD649>" .. userNickname .. "<PAOldColor> " .. PAGetString(Defines.StringSheet_GAME, "LUA_HOUSING_HOUSENAME_LIVING") .. "( " .. houseName .. " ) " .. tostring(point)
  ;
  (ui._houseName):SetText(desc)
  if Panel_Housing:IsShow() then
    return 
  end
  if Panel_House_InstallationMode:GetShow() then
    return 
  end
  if Panel_Interaction_HouseRank:GetShow() then
    Panel_Interaction_HouseRanke_Close()
  end
  if isGameTypeKR2() then
    (ui._btnSetUnderWear):SetShow(false)
  end
  Panel_HouseName:SetShow(isShow, true)
end

EventHousingShowChangeTopRanker = function(houseName, userNo, userNickname, point)
  -- function num : 0_12
end

HouseLightingCheck = function(deltaTime)
  -- function num : 0_13 , upvalues : updateTime, isAlertHouseLighting, ui
  updateTime = updateTime + deltaTime
  if isAlertHouseLighting == false and (math.ceil)(updateTime) == 5 then
    local houseWrapper = housing_getHouseholdActor_CurrentPosition()
    local isHaveLightInstallation = houseWrapper:isHaveLightInstallation()
    if isHaveLightInstallation == true then
      (ui._btnNoticeLighting):SetShow(false)
    else
      ;
      (ui._btnNoticeLighting):SetShow(true)
    end
    isAlertHouseLighting = true
  end
end

FGlobal_AlertHouseLightingReset = function()
  -- function num : 0_14 , upvalues : updateTime, isAlertHouseLighting
  updateTime = 0
  isAlertHouseLighting = false
end

Panel_HouseName_CheckHouse = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_15
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  if Panel_HouseName:GetShow() then
    local houseWrapper = housing_getHouseholdActor_CurrentPosition()
    if houseWrapper == nil then
      Panel_HouseName:SetShow(false, false)
    end
  end
end

InitializeModeClose_PetMaidInit = function()
  -- function num : 0_16 , upvalues : ui
  local isPet = housing_getIsHidePetActors()
  local isMaid = housing_getIsHideMaidActors()
  ;
  (ui._btnToggleHidePet):SetCheck(isPet)
  ;
  (ui._btnToggleHideMaid):SetCheck(isMaid)
end

registerEvent("FromClient_RenderModeChangeState", "Panel_HouseName_CheckHouse")
registerEvent("EventHousingShowVisitHouse", "EventHousingShowVisitHouse")
registerEvent("FromClient_ChangeUnderwearModeInHouse", "FromClient_ChangeUnderwearModeInHouse")
registerEvent("EventHousingShowChangeTopRanker", "EventHousingShowChangeTopRanker")
registerEvent("onScreenResize", "Panel_HouseName_Resize")
Panel_HouseName:RegisterUpdateFunc("HouseLightingCheck")

