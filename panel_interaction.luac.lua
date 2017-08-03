-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\widget\interaction\panel_interaction.luac 

-- params : ...
-- function num : 0
local UI_Color = Defines.Color
local UI_PP = CppEnums.PAUIMB_PRIORITY
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_TM = CppEnums.TextMode
local _needCollectTool = (UI.getChildControl)(Panel_Interaction, "Static_Cant")
local _background = (UI.getChildControl)(Panel_Interaction, "Static_Background")
_background:setGlassBackground(true)
local _houseDescBG = (UI.getChildControl)(Panel_Interaction_House, "Static_BuyHouse_DescBG")
local _houseDesc = (UI.getChildControl)(Panel_Interaction_House, "StaticText_BuyHouse_Desc")
local _contribute_Help = (UI.getChildControl)(Panel_Interaction_House, "StaticText_ContHelp")
local _globalGuide = (UI.getChildControl)(Panel_Interaction, "StaticText_Purpose")
Panel_Interaction:RegisterShowEventFunc(true, "Panel_Interaction_ShowAni()")
Panel_Interaction:RegisterShowEventFunc(false, "Panel_Interaction_HideAni()")
Panel_Interaction_ShowAni = function()
  -- function num : 0_0
end

Panel_Interaction_HideAni = function()
  -- function num : 0_1
end

local eInteractionTypeMax = (CppEnums.InteractionType).InteractionType_Count
local preUIMode = nil
local DESC_TEXT = {}
for ii = 0, eInteractionTypeMax - 1 do
  DESC_TEXT[ii] = PAGetString(Defines.StringSheet_GAME, "INTERACTION_TEXT" .. tostring(ii))
end
INETRACTION_BUTTON_TEXT = {}
for ii = 0, eInteractionTypeMax - 1 do
  -- DECOMPILER ERROR at PC91: Confused about usage of register: R17 in 'UnsetPending'

  INETRACTION_BUTTON_TEXT[ii] = PAGetString(Defines.StringSheet_GAME, "INTERACTION_MENU" .. tostring(ii))
end
local BUTTON_ID = {"Button_CharInfo", "Button_Exchange", "Button_Party_Invite", "Button_Dialog", "Button_Ride", "Button_Control", "Button_Looting", "Button_Collect", "Button_OpenDoor", "Button_OpenWarehouseInTent", "Button_ReBuildTent", "Button_InstallationMode", "Button_ViewHouseInfo", "Button_Havest", "Button_ParkingHorse", "Button_EquipInstallation", "Button_UnequipInstallation", "Button_OpenInventory", "Button_HorseInfo", "Button_Bussiness", "Button_Guild_Invite", "Button_Guild_Alliance_Invite", "Button_UseItem", "Button_UnbuildPersonalTent", "Button_Manufacture", "Button_Greet", "Button_Steal", "Button_Lottery", "Button_HarvestSeed", "Button_TopHouse", "Button_HouseRank", "Button_Lop", "Button_KillBug", "Button_UninstallTrap", "Button_Sympathetic", "Button_Observe", "Button_HarvestInformation", "Button_Clan_Invite", "Button_SiegeGateOpen", "Button_UnbuildKingOrLordTent", "Button_Eavesdrop", "Button_WaitComment", "Button_TakedownCannon", "Button_OpenWindow", "Button_ChangeLook", "Button_ChangeName", "Button_RepairKingOrLordTent", "Button_UserIntroduction", "Button_FollowActor", "Button_BuildingUpgrade", "Button_PvPBattle", "Button_SiegeObjectStart", "Button_SiegeObjectFinish", "Button_GateOpen", "Button_GateClose", "Button_UninstallBarricade", "Button_ServantRepair", "Button_LanternOn", "Button_LanternOff", "Button_Escape", "Button_Awake", "Button_Diving", "Button_Diving"; [0] = "Button_GamePlay"}
local UI_BUTTON = {}
for ii = 0, #BUTTON_ID do
  UI_BUTTON[ii] = (UI.getChildControl)(Panel_Interaction, BUTTON_ID[ii])
  ;
  (UI_BUTTON[ii]):addInputEvent("Mouse_LUp", "Interaction_ButtonPushed(" .. ii .. ")")
  ;
  (UI_BUTTON[ii]):addInputEvent("Mouse_On", "Interaction_ButtonOver(" .. ii .. ", true)")
  ;
  (UI_BUTTON[ii]):addInputEvent("Mouse_Out", "Interaction_ButtonOver(" .. ii .. ", false)")
  ;
  (UI_BUTTON[ii]):SetText(INETRACTION_BUTTON_TEXT[ii])
  ;
  (UI_BUTTON[ii]):SetFontAlpha(1)
  ;
  (UI_BUTTON[ii]):SetShow(false)
end
local getDefaultButtonInfo = function(actor, index)
  -- function num : 0_2 , upvalues : UI_BUTTON
  return UI_BUTTON[index], INETRACTION_BUTTON_TEXT[index]
end

local interactionTargetUIList = {}
local interactionTargetTextList = {}
local otherUIList = {[(CppEnums.InteractionType).InteractionType_HavestLop] = (UI.getChildControl)(Panel_Interaction, "Button_KillBugs"), [(CppEnums.InteractionType).InteractionType_HavestKillBug] = (UI.getChildControl)(Panel_Interaction, "Button_Feeding"), [(CppEnums.InteractionType).InteractionType_HarvestInformation] = (UI.getChildControl)(Panel_Interaction, "Button_DomesticAnimalInfo")}
;
(otherUIList[32]):addInputEvent("Mouse_LUp", "Interaction_ButtonPushed(" .. 32 .. ")")
;
(otherUIList[32]):addInputEvent("Mouse_On", "Interaction_ButtonOver(" .. 32 .. ", true)")
;
(otherUIList[32]):addInputEvent("Mouse_Out", "Interaction_ButtonOver(" .. 32 .. ", false)")
;
(otherUIList[32]):SetShow(false)
;
(otherUIList[33]):addInputEvent("Mouse_LUp", "Interaction_ButtonPushed(" .. 33 .. ")")
;
(otherUIList[33]):addInputEvent("Mouse_On", "Interaction_ButtonOver(" .. 33 .. ", true)")
;
(otherUIList[33]):addInputEvent("Mouse_Out", "Interaction_ButtonOver(" .. 33 .. ", false)")
;
(otherUIList[33]):SetShow(false)
;
(otherUIList[37]):addInputEvent("Mouse_LUp", "Interaction_ButtonPushed(" .. 37 .. ")")
;
(otherUIList[37]):addInputEvent("Mouse_On", "Interaction_ButtonOver(" .. 37 .. ", true)")
;
(otherUIList[37]):addInputEvent("Mouse_Out", "Interaction_ButtonOver(" .. 37 .. ", false)")
;
(otherUIList[37]):SetShow(false)
local otherTextList = {[(CppEnums.InteractionType).InteractionType_HavestLop] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC1_4"), [(CppEnums.InteractionType).InteractionType_HavestKillBug] = PAGetString(Defines.StringSheet_GAME, "LUA_INSTALLATIONMODE_FARMGUIDE_DESC1_5"), [(CppEnums.InteractionType).InteractionType_HarvestInformation] = PAGetString(Defines.StringSheet_GAME, "LUA_INTERACTIONBUTTON_NAME_DOMESTICANIMALINFO")}
local otherFunctionList = {[32] = function(actor, index)
  -- function num : 0_3 , upvalues : getDefaultButtonInfo, otherUIList, otherTextList
  if actor == nil then
    return getDefaultButtonInfo(actor, index)
  end
  local installationActorWrapper = getInstallationActorByProxy(actor:get())
  if installationActorWrapper == nil then
    return getDefaultButtonInfo(actor, index)
  end
  local installationType = ((installationActorWrapper:getStaticStatusWrapper()):getObjectStaticStatus()):getInstallationType()
  if (CppEnums.InstallationType).eType_LivestockHarvest ~= installationType then
    return getDefaultButtonInfo(actor, index)
  end
  if otherUIList[index] == nil or otherTextList[index] == nil then
    return getDefaultButtonInfo(actor, index)
  end
  return otherUIList[(CppEnums.InteractionType).InteractionType_HavestLop], otherTextList[(CppEnums.InteractionType).InteractionType_HavestLop]
end
, [33] = function(actor, index)
  -- function num : 0_4 , upvalues : getDefaultButtonInfo, otherUIList, otherTextList
  if actor == nil then
    return getDefaultButtonInfo(actor, index)
  end
  local installationActorWrapper = getInstallationActorByProxy(actor:get())
  if installationActorWrapper == nil then
    return getDefaultButtonInfo(actor, index)
  end
  local installationType = ((installationActorWrapper:getStaticStatusWrapper()):getObjectStaticStatus()):getInstallationType()
  if (CppEnums.InstallationType).eType_LivestockHarvest ~= installationType then
    return getDefaultButtonInfo(actor, index)
  end
  if otherUIList[index] == nil or otherTextList[index] == nil then
    return getDefaultButtonInfo(actor, index)
  end
  return otherUIList[(CppEnums.InteractionType).InteractionType_HavestKillBug], otherTextList[(CppEnums.InteractionType).InteractionType_HavestKillBug]
end
, [37] = function(actor, index)
  -- function num : 0_5 , upvalues : getDefaultButtonInfo, otherUIList, otherTextList
  if actor == nil then
    return getDefaultButtonInfo(actor, index)
  end
  local installationActorWrapper = getInstallationActorByProxy(actor:get())
  if installationActorWrapper == nil then
    return getDefaultButtonInfo(actor, index)
  end
  local installationType = ((installationActorWrapper:getStaticStatusWrapper()):getObjectStaticStatus()):getInstallationType()
  if (CppEnums.InstallationType).eType_LivestockHarvest ~= installationType then
    return getDefaultButtonInfo(actor, index)
  end
  if otherUIList[index] == nil or otherTextList[index] == nil then
    return getDefaultButtonInfo(actor, index)
  end
  return otherUIList[(CppEnums.InteractionType).InteractionType_HarvestInformation], otherTextList[(CppEnums.InteractionType).InteractionType_HarvestInformation]
end
}
local getButtonInfo = function(actor, index)
  -- function num : 0_6 , upvalues : otherFunctionList, getDefaultButtonInfo
  if otherFunctionList[index] ~= nil then
    return (otherFunctionList[index])(actor, index)
  end
  return getDefaultButtonInfo(actor, index)
end

local updateButtonList = function(actor)
  -- function num : 0_7 , upvalues : interactionTargetUIList, interactionTargetTextList, UI_BUTTON, getButtonInfo
  for key,value in pairs(interactionTargetUIList) do
    value:SetShow(false)
  end
  interactionTargetUIList = {}
  interactionTargetTextList = {}
  for ii = 0, #UI_BUTTON do
    -- DECOMPILER ERROR at PC24: Confused about usage of register: R6 in 'UnsetPending'

    -- DECOMPILER ERROR at PC25: Confused about usage of register: R5 in 'UnsetPending'

    interactionTargetUIList[ii] = getButtonInfo(actor, ii)
  end
end

;
((UI.getChildControl)(Panel_Interaction, "Button_Hunting")):SetShow(false)
;
((UI.getChildControl)(Panel_Interaction, "Button_VehicleTraining")):SetShow(false)
local UI_NAME = (UI.getChildControl)(Panel_Interaction, "Static_Text_CharacterName")
local UI_DESC = (UI.getChildControl)(Panel_Interaction, "Static_Icon_Font")
local INTERACTABLE_ACTOR_KEY = 0
local INTERACTABLE_FRAG = 0
local SHOW_BUTTON_COUNT = 0
local ANIMATING_BUTTON = false
local BUTTON_UPDATE_TIME = 0
local basicInteractionType = 0
local focusInteractionType = 0
local isFocusInteractionType = false
local isTargetNpc = false
local interactionShowableCheck = function(actor)
  -- function num : 0_8
  if actor == nil then
    return 
  end
  return true
end

local interactionTutorial = true
Interaction_Update = function(deltaTime)
  -- function num : 0_9 , upvalues : INTERACTABLE_ACTOR_KEY, INTERACTABLE_FRAG, interactionShowableCheck, ANIMATING_BUTTON
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil or selfPlayer:isDead() or Panel_Looting:GetShow() or Panel_Window_Exchange:GetShow() == true or (Defines.UIMode).eUIMode_Default ~= GetUIMode() then
    Interaction_Close()
    return 
  end
  local actor = interaction_getInteractable()
  local actorKey = 0
  local interactableFrag = nil
  if actor ~= nil then
    actorKey = actor:getActorKey()
    interactableFrag = actor:getInteractableFrag()
  end
  if actorKey ~= INTERACTABLE_ACTOR_KEY or interactableFrag ~= INTERACTABLE_FRAG then
    INTERACTABLE_ACTOR_KEY = actorKey
    INTERACTABLE_FRAG = interactableFrag
    if interactionShowableCheck(actor) then
      Interaction_Show(actor)
    else
      Interaction_Close()
      return 
    end
  end
  if actor ~= nil then
    Interaction_PositionUpdate(actor)
    if Panel_Interaction:GetShow() and ANIMATING_BUTTON then
      Interaction_ButtonPositionUpdate(deltaTime)
    end
  end
  Interaction_UpdatePerFrame_Desc()
end

interaction_Forceed = function()
  -- function num : 0_10 , upvalues : INTERACTABLE_ACTOR_KEY, INTERACTABLE_FRAG, interactionShowableCheck
  local actor = interaction_getInteractable()
  local actorKey = 0
  local interactableFrag = 0
  if actor ~= nil then
    actorKey = actor:getActorKey()
    interactableFrag = actor:getInteractableFrag()
    INTERACTABLE_ACTOR_KEY = actorKey
    INTERACTABLE_FRAG = interactableFrag
    if interactionShowableCheck(actor) then
      Interaction_Show(actor)
    else
      Interaction_Close()
    end
    Interaction_PositionUpdate(actor)
    Interaction_ButtonPositionUpdate(0)
  else
    return 
  end
end

local GetBottomPos = function(control)
  -- function num : 0_11
  if control == nil then
    (UI.ASSERT)(false, "GetBottomPos(control) , control nil")
    return 
  end
  return control:GetPosY() + control:GetSizeY()
end

local YSize = 0
local linkButtonAction = {}
Interaction_Show = function(actor)
  -- function num : 0_12 , upvalues : basicInteractionType, focusInteractionType, DESC_TEXT, isTargetNpc, UI_NAME, UI_DESC, updateButtonList, SHOW_BUTTON_COUNT, interactionTargetUIList, interactionTargetTextList, UI_Color, linkButtonAction, _globalGuide, _needCollectTool, ANIMATING_BUTTON, BUTTON_UPDATE_TIME
  audioPostEvent_SystemUi(1, 5)
  local firstInteractionType = actor:getSettedFirstInteractionType()
  basicInteractionType = firstInteractionType
  focusInteractionType = firstInteractionType
  if DESC_TEXT[firstInteractionType] == nil then
    return 
  end
  local houseShow = false
  do
    if (actor:get()):isHouseHold() then
      local houseHoldActor = getHouseHoldActor(actor:getActorKey())
      if (houseHoldActor:get()):isBuyable() then
        audioPostEvent_SystemUi(1, 5)
        houseShow = true
      end
    end
    Panel_Interaction_House:SetShow(houseShow)
    Panel_Interaction:SetShow(true)
    local actor = interaction_getInteractable()
    local actorKey = 0
    local interactableFrag = 0
    local actorName = actor:getName()
    if (actor:get()):isInstallationActor() or (actor:get()):isDeadBody() or (actor:get()):isCollect() then
      if not (actor:get()):isMonster() then
        actorName = (actor:get()):getStaticStatusName()
      end
      isTargetNpc = false
    else
      if (actor:get()):isNpc() then
        local npcTitle = actor:getCharacterTitle()
        if npcTitle == nil or npcTitle == "" then
          actorName = actor:getName()
        else
          actorName = npcTitle .. "\n" .. actor:getName()
        end
        isTargetNpc = true
      else
        do
          if (actor:get()):isHouseHold() then
            if ((actor:getCharacterStaticStatusWrapper()):getObjectStaticStatus()):isPersonalTent() then
              actorName = (actor:getCharacterStaticStatusWrapper()):getName()
            else
              actorName = actor:getAddress()
            end
            isTargetNpc = false
          end
          if actorName then
            if isTargetNpc then
              UI_NAME:SetSize(130, UI_NAME:GetSizeY())
              UI_NAME:SetPosX(-65)
            else
              UI_NAME:SetSize(100, UI_NAME:GetSizeY())
              UI_NAME:SetPosX(-56)
            end
            UI_NAME:SetTextHorizonCenter()
            UI_NAME:SetTextVerticalTop()
            UI_NAME:SetAutoResize(true)
            UI_NAME:SetText(actorName)
          else
            ;
            (UI.ASSERT)(false, "Interaction_Show // Actor Name is Nil!!!!")
          end
          UI_DESC:SetText(DESC_TEXT[firstInteractionType])
          updateButtonList(actor)
          SHOW_BUTTON_COUNT = 0
          for ii = 0, #interactionTargetUIList do
            local isShow = actor:isSetInteracatbleFrag(ii)
            ;
            (interactionTargetUIList[ii]):SetShow(isShow)
            if isShow then
              if (CppEnums.InteractionType).InteractionType_Observer == ii then
                local isLean = "LEAN_BACK_ING"
                if ToClient_SelfPlayerCheckAction(isLean) then
                  FGlobal_Tutorial_RequestLean()
                end
                local isSitDown = "SIT_DOWN_ING"
                if ToClient_SelfPlayerCheckAction(isSitDown) then
                  FGlobal_Tutorial_RequestSitDown()
                end
              end
              do
                local shortcuts = SHOW_BUTTON_COUNT
                if SHOW_BUTTON_COUNT == 0 then
                  if (CppEnums.InteractionType).InteractionType_InvitedParty == ii or (CppEnums.InteractionType).InteractionType_GuildInvite == ii or (CppEnums.InteractionType).InteractionType_ExchangeItem == ii then
                    (interactionTargetUIList[ii]):SetText(interactionTargetTextList[ii])
                  else
                    if (CppEnums.InteractionType).InteractionType_Talk == ii and ((actor:getCharacterStaticStatusWrapper()):get()):isSummonedCharacterBySiegeObject() then
                      (interactionTargetUIList[ii]):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INTERACTION_USE") .. " <PAColor0xFFFFD543>(" .. keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_Interaction) .. ")<PAOldColor>")
                    else
                      ;
                      (interactionTargetUIList[ii]):SetText(interactionTargetTextList[ii] .. " <PAColor0xFFFFD543>(" .. keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_Interaction) .. ")<PAOldColor>")
                    end
                  end
                  ;
                  (interactionTargetUIList[ii]):SetFontColor(UI_Color.C_FFEFEFEF)
                else
                  local _string = Interaction_ChangeString(SHOW_BUTTON_COUNT)
                  ;
                  (interactionTargetUIList[ii]):SetText(interactionTargetTextList[ii] .. " <PAColor0xFFFFD543>(" .. _string .. ")<PAOldColor>")
                  ;
                  (interactionTargetUIList[ii]):SetFontColor(UI_Color.C_FF999999)
                end
                do
                  do
                    -- DECOMPILER ERROR at PC323: Confused about usage of register: R13 in 'UnsetPending'

                    linkButtonAction[SHOW_BUTTON_COUNT] = ii
                    SHOW_BUTTON_COUNT = SHOW_BUTTON_COUNT + 1
                    -- DECOMPILER ERROR at PC327: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC327: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC327: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC327: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
            end
          end
          local npcActorProxyWrapper = getNpcActor(actor:getActorKey())
          if npcActorProxyWrapper ~= nil then
            local currentType = (npcActorProxyWrapper:get()):getOverHeadQuestInfoType()
            if actor:isSetInteracatbleFrag(4) == true and currentType == 3 then
              (interactionTargetUIList[4]):ChangeTextureInfoName("New_UI_Common_ForLua/Widget/Interaction/Interaction_00.dds")
              local x1, y1, x2, y2 = setTextureUV_Func(interactionTargetUIList[4], 1, 106, 35, 140)
              ;
              ((interactionTargetUIList[4]):getBaseTexture()):setUV(x1, y1, x2, y2)
              ;
              (interactionTargetUIList[4]):setRenderTexture((interactionTargetUIList[4]):getBaseTexture())
              UI_NAME:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "INTERACTION_TEXT_COMPLETE_QUEST", "actionInputType", keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_Interaction)))
            else
              do
                ;
                (interactionTargetUIList[4]):ChangeTextureInfoName("New_UI_Common_ForLua/Widget/Interaction/Interaction_00.dds")
                do
                  local x1, y1, x2, y2 = setTextureUV_Func(interactionTargetUIList[4], 1, 1, 35, 35)
                  ;
                  ((interactionTargetUIList[4]):getBaseTexture()):setUV(x1, y1, x2, y2)
                  ;
                  (interactionTargetUIList[4]):setRenderTexture((interactionTargetUIList[4]):getBaseTexture())
                  _globalGuide:SetPosX(60)
                  _globalGuide:SetPosY(Panel_Interaction:GetSizeY() * 0.5 - _globalGuide:GetSizeY() * 0.5)
                  _needCollectTool:SetShow(false)
                  Interaction_UpdateDesc(firstInteractionType)
                  ANIMATING_BUTTON = true
                  BUTTON_UPDATE_TIME = 0
                  Interaction_ButtonPositionUpdate(0)
                  isReloadState = false
                  local actorKeyRaw = (actor:get()):getActorKeyRaw()
                  Furniture_Check(actorKeyRaw)
                  PaGlobal_TutorialManager:handleInteractionShow(actor)
                  RemoteControl_Interaction_ShowToggloe()
                end
              end
            end
          end
        end
      end
    end
  end
end

Interaction_ChangeString = function(index)
  -- function num : 0_13
  local _string = "F6"
  if index == 1 then
    _string = keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_Interaction_1)
  else
    if index == 2 then
      _string = keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_Interaction_2)
    else
      if index == 3 then
        _string = keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_Interaction_3)
      else
        if index == 4 then
          _string = keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_Interaction_4)
        else
          if index == 5 then
            _string = keyCustom_GetString_UiKey((CppEnums.UiInputType).UiInputType_Interaction_5)
          end
        end
      end
    end
  end
  return _string
end

FGlobal_InteractionButtonCount = function()
  -- function num : 0_14 , upvalues : SHOW_BUTTON_COUNT
  return SHOW_BUTTON_COUNT
end

FGlobal_InteractionButtonActionRun = function(keyIdx)
  -- function num : 0_15 , upvalues : linkButtonAction
  Interaction_ButtonPushed(linkButtonAction[keyIdx])
end

Panel_Interaction_GetGlobalGuidePosX = function()
  -- function num : 0_16 , upvalues : _globalGuide
  return Panel_Interaction:GetPosX() + _globalGuide:GetPosX()
end

Panel_Interaction_GetGlobalGuidePosY = function()
  -- function num : 0_17 , upvalues : _globalGuide
  return Panel_Interaction:GetPosY() + _globalGuide:GetPosY()
end

Interaction_Close = function()
  -- function num : 0_18 , upvalues : INTERACTABLE_ACTOR_KEY, INTERACTABLE_FRAG, _globalGuide
  if Panel_Interaction:IsShow() or Panel_Interaction_House:IsShow() then
    Panel_Interaction:SetShow(false)
    Panel_Interaction_House:SetShow(false)
    INTERACTABLE_ACTOR_KEY = 0
    INTERACTABLE_FRAG = 0
    _globalGuide:SetShow(false)
    Panel_Interaction_HouseRanke_Close()
    FriendHouseRank_Close()
    RemoteControl_Interaction_ShowToggloe()
  end
  Funiture_Endurance_Hide()
end

Interaction_PositionUpdate = function(actor)
  -- function num : 0_19
  local pos2d = actor:get2DPosForInterAction()
  if pos2d.x < 0 and pos2d.y < 0 then
    if Panel_Interaction_House:IsShow() then
      Panel_Interaction_House:SetPosX(-1000)
      Panel_Interaction_House:SetPosY(-1000)
    end
    Panel_Interaction:SetPosX(-1000)
    Panel_Interaction:SetPosY(-1000)
  else
    if Panel_Interaction_House:IsShow() then
      Panel_Interaction_House:SetPosX(pos2d.x - Panel_Interaction_House:GetSizeX() / 2)
      Panel_Interaction_House:SetPosY(pos2d.y + 100)
    end
    Panel_Interaction:SetPosX(pos2d.x + 0)
    Panel_Interaction:SetPosY(pos2d.y - 100)
  end
end

Interaction_ButtonPositionUpdate = function(deltaTime)
  -- function num : 0_20 , upvalues : isTargetNpc, _background, UI_NAME, BUTTON_UPDATE_TIME, ANIMATING_BUTTON, interactionTargetUIList, SHOW_BUTTON_COUNT, _needCollectTool
  local ANIMATION_TIME = 0.35
  local BUTTON_OFFSET_X = 0
  local BUTTON_OFFSET_Y = 0
  local CIRCLE_RADIUS = 0
  if isTargetNpc then
    _background:SetSize(140, 140)
    BUTTON_OFFSET_X = -18
    BUTTON_OFFSET_Y = 42
    CIRCLE_RADIUS = 60
  else
    _background:SetSize(128, 128)
    BUTTON_OFFSET_X = -25
    BUTTON_OFFSET_Y = 35
    CIRCLE_RADIUS = 50
  end
  UI_NAME:SetPosY(_background:GetPosY() + _background:GetSizeY() / 2 - UI_NAME:GetSizeY() * 0.5)
  local ANGLE_OFFSET = math.pi * -0.5
  if ANIMATION_TIME < BUTTON_UPDATE_TIME then
    ANIMATING_BUTTON = false
  else
    BUTTON_UPDATE_TIME = BUTTON_UPDATE_TIME + deltaTime
    local aniRate = BUTTON_UPDATE_TIME / ANIMATION_TIME
    if aniRate > 1 then
      aniRate = 1
    end
    local actor = interaction_getInteractable()
    local jj = 0
    for ii = 0, #interactionTargetUIList do
      local isShow = actor:isSetInteracatbleFrag(ii)
      if isShow then
        local div = jj / SHOW_BUTTON_COUNT
        local buttonPosX = BUTTON_OFFSET_X + CIRCLE_RADIUS * aniRate * (math.cos)(math.pi * 2 * div * aniRate + ANGLE_OFFSET)
        local buttonPosY = BUTTON_OFFSET_Y + CIRCLE_RADIUS * aniRate * (math.sin)(math.pi * 2 * div * aniRate + ANGLE_OFFSET)
        ;
        (interactionTargetUIList[ii]):SetPosX(buttonPosX)
        ;
        (interactionTargetUIList[ii]):SetPosY(buttonPosY)
        ;
        (interactionTargetUIList[ii]):SetAlpha(aniRate)
        _needCollectTool:SetPosX(buttonPosX + 2)
        _needCollectTool:SetPosY(buttonPosY + 2)
        local verticalSize = (interactionTargetUIList[ii]):GetSizeY()
        if buttonPosY < BUTTON_OFFSET_Y then
          verticalSize = verticalSize * -0.5
        end
        ;
        (interactionTargetUIList[ii]):SetTextSpan(0, verticalSize)
        if (math.floor)(buttonPosX) == (math.floor)(BUTTON_OFFSET_X) then
          (interactionTargetUIList[ii]):SetTextHorizonCenter()
        else
          if buttonPosX < BUTTON_OFFSET_X then
            (interactionTargetUIList[ii]):SetTextHorizonRight()
          else
            if BUTTON_OFFSET_X < buttonPosX then
              (interactionTargetUIList[ii]):SetTextHorizonLeft()
            end
          end
        end
        jj = jj + 1
      end
    end
  end
end

Interaction_Reset = function()
  -- function num : 0_21 , upvalues : INTERACTABLE_ACTOR_KEY
  INTERACTABLE_ACTOR_KEY = 0
end

Interaction_ButtonPushed = function(interactionType)
  -- function num : 0_22 , upvalues : preUIMode
  if FGlobal_GetIsCutScenePlay() == true then
    return 
  end
  preUIMode = GetUIMode()
  local isTakedownCannon = false
  local isTakedownCannonFuncPass = function()
    -- function num : 0_22_0 , upvalues : interactionType
    interaction_processInteraction(interactionType)
  end

  if (CppEnums.InteractionType).InteractionType_TakedownCannon == interactionType then
    isTakedownCannon = true
  else
    if (CppEnums.InteractionType).InteractionType_Talk == interactionType then
      SetUIMode((Defines.UIMode).eUIMode_NpcDialog)
    else
      if (CppEnums.InteractionType).InteractionType_InvitedParty == interactionType then
        local actor = interaction_getInteractable()
        if actor == nil then
          return 
        else
          local targetName = actor:getName()
          Proc_ShowMessage_Ack(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INTERACTION_ACK_INVITE", "targetName", targetName))
        end
      else
        do
          if (CppEnums.InteractionType).InteractionType_UseItem == interactionType and isCurrentPositionInWater() == true then
            NotifyDisplay(PAGetString(Defines.StringSheet_GAME, "LUA_USEITEM_INTERACTION_IN_WATER"))
            return 
          else
            if (CppEnums.InteractionType).InteractionType_PvPBattle == interactionType then
              local actor = interaction_getInteractable()
              if actor == nil then
                return 
              else
                local targetCharacterName = actor:getOriginalName()
                PaGlobal_PvPBattle:notifyRequest(targetCharacterName)
              end
            end
          end
          do
            if isTakedownCannon then
              local messageTitle = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS")
              local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "INTERACTION_TEXT_TAKEDOWN_CANNON")
              local messageBoxData = {title = messageTitle, content = messageBoxMemo, functionYes = isTakedownCannonFuncPass, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
              ;
              (MessageBox.showMessageBox)(messageBoxData)
            else
              do
                interaction_processInteraction(interactionType)
              end
            end
          end
        end
      end
    end
  end
end

FromClient_InteractionFail = function()
  -- function num : 0_23 , upvalues : preUIMode
  if preUIMode == nil then
    return 
  end
  SetUIMode(preUIMode)
end

Interaction_ButtonOver = function(interactionType, isOver)
  -- function num : 0_24 , upvalues : interactionTargetUIList, UI_Color, isFocusInteractionType, focusInteractionType, basicInteractionType
  local button = interactionTargetUIList[interactionType]
  button:ResetVertexAni()
  button:SetColor(UI_Color.C_FFFFFFFF)
  if button == nil then
    return 
  end
  if isOver then
    audioPostEvent_SystemUi(0, 13)
    button:SetVertexAniRun("Ani_Color_Light", true)
    button:SetFontAlpha(1)
  else
    button:ResetVertexAni()
    button:SetFontAlpha(1)
  end
  isFocusInteractionType = isOver
  if isOver then
    focusInteractionType = interactionType
    Interaction_UpdateDesc(interactionType)
  else
    focusInteractionType = basicInteractionType
    Interaction_UpdateDesc(focusInteractionType)
  end
end

Interaction_UpdatePerFrame_Desc = function()
  -- function num : 0_25 , upvalues : focusInteractionType, interactionTargetUIList, isFocusInteractionType, basicInteractionType
  if focusInteractionType == (CppEnums.InteractionType).InteractionType_Sympathetic then
    Interaction_UpdateDesc(focusInteractionType)
  else
    if focusInteractionType == (CppEnums.InteractionType).InteractionType_Observer then
      Interaction_UpdateDesc(focusInteractionType)
    end
  end
  local actor = interaction_getInteractable()
  if actor == nil then
    return 
  end
  if actor:isSetInteracatbleFrag((CppEnums.InteractionType).InteractionType_Sympathetic) then
    local vehicleWrapper = getVehicleActor((actor:get()):getActorKeyRaw())
    if vehicleWrapper ~= nil then
      isSympatheticEnable = vehicleWrapper:checkUsableSympathetic()
      ;
      (interactionTargetUIList[(CppEnums.InteractionType).InteractionType_Sympathetic]):SetMonoTone(not isSympatheticEnable)
      -- DECOMPILER ERROR at PC64: Unhandled construct in 'MakeBoolean' P1

      if isFocusInteractionType == false and not isSympatheticEnable and focusInteractionType == basicInteractionType then
        focusInteractionType = (CppEnums.InteractionType).InteractionType_Sympathetic
      end
    end
  end
  focusInteractionType = basicInteractionType
end

Interaction_UpdateDesc = function(indteractionType)
  -- function num : 0_26 , upvalues : basicInteractionType, interactionTargetTextList, DESC_TEXT, _needCollectTool, interactionTargetUIList, _globalGuide
  local actor = interaction_getInteractable()
  if actor == nil then
    return 
  end
  if not actor:isSetInteracatbleFrag(indteractionType) then
    return 
  end
  local interactionDesc = nil
  if indteractionType == basicInteractionType and (not (actor:get()):isPlayer() or (actor:get()):isSelfPlayer()) then
    if indteractionType ~= 61 then
      interactionDesc = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_INTERACTION_PURPOSE_0", "interactionkey", keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_Interaction), "interaction", interactionTargetTextList[indteractionType])
    else
      interactionDesc = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_INTERACTION_PURPOSE_2", "interactionkey", keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_Interaction), "interaction", interactionTargetTextList[indteractionType])
    end
  else
    interactionDesc = DESC_TEXT[indteractionType]
  end
  do
    if indteractionType == (CppEnums.InteractionType).InteractionType_Collect and ((actor:get()):isCollect() or (actor:get()):isDeadBody()) then
      local collectWrapper = getCollectActor(actor:getActorKey())
      if collectWrapper == nil then
        collectWrapper = getMonsterActor(actor:getActorKey())
        if collectWrapper == nil then
          collectWrapper = getDeadBodyActor(actor:getActorKey())
          if collectWrapper == nil then
            _PA_ASSERT(false, "채집인터랙션�\132 수행중인�\176 �\128상이 채집물이 아닙니다. 비정상임")
            return 
          end
        end
      end
      if collectWrapper:isCollectable() and collectWrapper:isCollectableUsingMyCollectTool() == false then
        _needCollectTool:SetShow(true)
        interactionDesc = ""
        for loop = 0, (CppEnums.CollectToolType).TypeCount do
          local isAble = (collectWrapper:getCharacterStaticStatusWrapper()):isCollectableToolType(loop)
          if isAble then
            if (string.len)(interactionDesc) > 0 then
              interactionDesc = "<PAColor0xFFFFD649>\'" .. interactionDesc .. "\'<PAOldColor>, <PAColor0xFFFFD649>\'" .. (CppEnums.CollectToolTypeName)[loop] .. "\'<PAOldColor>"
            else
              interactionDesc = "<PAColor0xFFFFD649>\'" .. (CppEnums.CollectToolTypeName)[loop] .. "\'<PAOldColor>"
            end
          end
        end
        interactionDesc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INTERACTION_TEXT_NEEDGUIDE", "interactionDesc", interactionDesc)
      end
    end
    if indteractionType == (CppEnums.InteractionType).InteractionType_Sympathetic then
      local isSympathetic = actor:isSetInteracatbleFrag((CppEnums.InteractionType).InteractionType_Sympathetic)
      if isSympathetic then
        local vehicleWrapper = getVehicleActor((actor:get()):getActorKeyRaw())
        if vehicleWrapper ~= nil then
          isSympatheticEnable = vehicleWrapper:checkUsableSympathetic()
          ;
          (interactionTargetUIList[(CppEnums.InteractionType).InteractionType_Sympathetic]):SetMonoTone(not isSympatheticEnable)
          if not isSympatheticEnable then
            local sympatheticCooltime = (math.ceil)(vehicleWrapper:getSympatheticCoolTime() / 1000) * 1000
            interactionDesc = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SYMPATHETIC_COOLTIME_DESC", "cooltime", convertStringFromMillisecondtime(toUint64(0, sympatheticCooltime)))
          else
            do
              do
                interactionDesc = PAGetString(Defines.StringSheet_GAME, "LUA_SYMPATHETIC_DESC")
                if indteractionType == (CppEnums.InteractionType).InteractionType_Observer and isObserverMode() then
                  if indteractionType == basicInteractionType then
                    interactionDesc = PAGetStringParam2(Defines.StringSheet_GAME, "LUA_INTERACTION_PURPOSE_1", "interactionkey", keyCustom_GetString_ActionKey((CppEnums.ActionInputType).ActionInputType_Interaction), "interaction", interactionTargetTextList[indteractionType])
                  else
                    interactionDesc = DESC_TEXT[indteractionType]
                  end
                  ShowCommandFunc()
                end
                _globalGuide:SetText(interactionDesc)
                _globalGuide:SetShow(true)
              end
            end
          end
        end
      end
    end
  end
end

FromClient_NotifyObserverModeEnd = function()
  -- function num : 0_27
  Panel_WatchingMode:SetShow(false)
  local selfPlayer = getSelfPlayer()
  if selfPlayer:isDead() then
    Panel_DeadMessage:SetShow(true, true)
  end
end

FromClient_ConfirmInstallationBuff = function(currentEndurance)
  -- function num : 0_28 , upvalues : UI_PP
  if (MessageBox.isPopUp)() then
    return 
  end
  local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INTERACTION_MSGBOX_MEMO_BUFF", "currentEndurance", tostring(currentEndurance))
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_INTERACTION_MSGBOX_DATA_TITLE"), content = messageBoxMemo, functionYes = Interaction_InstallationBuff, functionNo = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

Interaction_InstallationBuff = function()
  -- function num : 0_29
  toClient_RequestInstallationBuff()
end

registerEvent("FromClient_InterAction_UpdatePerFrame", "Interaction_Update")
registerEvent("FromClient_ConfirmInstallationBuff", "FromClient_ConfirmInstallationBuff")
registerEvent("FromClient_InteractionFail", "FromClient_InteractionFail")
registerEvent("FromClient_NotifyObserverModeEnd", "FromClient_NotifyObserverModeEnd")
local isReloadState = true
local interactionReload = function()
  -- function num : 0_30 , upvalues : isReloadState, INTERACTABLE_ACTOR_KEY, INTERACTABLE_FRAG, _globalGuide, interactionShowableCheck
  if isReloadState == false then
    Interaction_Close()
    return 
  end
  local actor = interaction_getInteractable()
  if actor == nil then
    Interaction_Close()
    return 
  end
  if (actor:get()):isHouseHold() then
    Panel_Interaction:SetShow(false)
    Panel_Interaction_House:SetShow(false)
    INTERACTABLE_ACTOR_KEY = 0
    INTERACTABLE_FRAG = 0
    _globalGuide:SetShow(false)
    if interactionShowableCheck(actor) then
      Interaction_Show(actor)
    else
      Interaction_Close()
    end
  end
end

renderModeChange_interactionReload = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_31 , upvalues : interactionReload
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  interactionReload()
end

registerEvent("FromClient_RenderModeChangeState", "renderModeChange_interactionReload")
Interaction_SetReloadState = function()
  -- function num : 0_32 , upvalues : isReloadState, interactionReload
  isReloadState = true
  if isFlushedUI() == false then
    interactionReload()
  end
end

FromClient_InteractionHarvest = function()
  -- function num : 0_33
  interaction_setInteractingState((CppEnums.InteractionType).InteractionType_Havest)
end

FromClient_InteractionSeedHarvest = function()
  -- function num : 0_34
  interaction_setInteractingState((CppEnums.InteractionType).InteractionType_SeedHavest)
end

local _buildingUpgradeActoKeyRaw = 0
FromClient_InteractionBuildingUpgrade = function(actorKeyRaw)
  -- function num : 0_35 , upvalues : _buildingUpgradeActoKeyRaw, UI_PP
  local actorProxy = getActor(actorKeyRaw)
  if actorProxy == nil then
    return 
  end
  local upgradeStaticWrapper = (actorProxy:getCharacterStaticStatusWrapper()):getBuildingUpgradeStaticStatus()
  if upgradeStaticWrapper == nil then
    _PA_ASSERT(false, "FromClient_InteractionBuildingUpgrade --- upgradeStaticWrapper�\180 비어있습니다. ")
    return 
  end
  if upgradeStaticWrapper:getTargetCharacter() == nil then
    _PA_ASSERT(false, "FromClient_InteractionBuildingUpgrade --- upgradeStaticWrapper:getTargetCharacter()�\180 비어있습니다. ")
    return 
  end
  local strNeedItems = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INTERACTION_UPGRADE_BARRICADE", "getName", (upgradeStaticWrapper:getTargetCharacter()):getName())
  local sourceItemCount = upgradeStaticWrapper:getSourceItemCount()
  for index = 0, sourceItemCount - 1 do
    local iessw = upgradeStaticWrapper:getSourceItemEnchantStaticStatus(R11_PC44)
    if iessw ~= nil then
      local name = iessw:getName()
      -- DECOMPILER ERROR at PC49: Overwrote pending register: R11 in 'AssignReg'

      R11_PC44 = R11_PC44(upgradeStaticWrapper, R13_PC51)
      local itemNeedCount = nil
      strNeedItems = strNeedItems .. R13_PC51 .. name .. " " .. tostring(itemNeedCount) .. " "
    end
  end
  _buildingUpgradeActoKeyRaw = actorKeyRaw
  local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INTERACTION_UPGRADE_BARRICADE_NEEDITEMS", "strNeedItems", strNeedItems)
  local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_INTERACTION_UPGRADE_MESSAGEBOX_TITLE"), content = messageBoxMemo, functionYes = InteractionBuildingUpgrade_Confirm, functionNo = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

InteractionBuildingUpgrade_Confirm = function()
  -- function num : 0_36 , upvalues : _buildingUpgradeActoKeyRaw
  toClient_RequestBuildingUpgrade(_buildingUpgradeActoKeyRaw)
end

FromClient_InteractionSiegeObject = function(actorKeyRaw, funcState)
  -- function num : 0_37 , upvalues : _buildingUpgradeActoKeyRaw, UI_PP
  local actorProxyWrapper = getActor(actorKeyRaw)
  if actorProxyWrapper == nil then
    return 
  end
  local actorProxy = actorProxyWrapper:get()
  _buildingUpgradeActoKeyRaw = actorKeyRaw
  if funcState == 0 then
    local price = Int64toInt32(((actorProxyWrapper:getCharacterStaticStatusWrapper()):getObjectStaticStatus()):getUsingPrice())
    local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INTERACTION_WARBUILDING_MEMO_DESC2", "price", makeDotMoney(price))
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_INTERACTION_WARBUILDING_MEMO_TITLE"), content = messageBoxMemo, functionYes = InteractSiegeObjectControlStart_Confirm, functionNo = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  else
    do
      if ((actorProxyWrapper:getCharacterStaticStatusWrapper()):getObjectStaticStatus()):isElephantBarn() then
        local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_INTERACTION_WARBUILDING_ELEPHANTBARN_MEMO_DESC")
        local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_INTERACTION_WARBUILDING_MEMO_TITLE"), content = messageBoxMemo, functionYes = InteractSiegeObjectControlFinish_Confirm, functionNo = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
        ;
        (MessageBox.showMessageBox)(messageboxData)
      else
        do
          local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_INTERACTION_WARBUILDING_MEMO_DESC")
          local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_INTERACTION_WARBUILDING_MEMO_TITLE"), content = messageBoxMemo, functionYes = InteractSiegeObjectControlFinish_Confirm, functionNo = MessageBox_Empty_function, priority = UI_PP.PAUIMB_PRIORITY_LOW}
          ;
          (MessageBox.showMessageBox)(messageboxData)
        end
      end
    end
  end
end

InteractSiegeObjectControlStart_Confirm = function()
  -- function num : 0_38 , upvalues : _buildingUpgradeActoKeyRaw
  toClient_RequestSiegeObjectControlStart(_buildingUpgradeActoKeyRaw)
end

InteractSiegeObjectControlFinish_Confirm = function()
  -- function num : 0_39 , upvalues : _buildingUpgradeActoKeyRaw
  toClient_RequestSiegeObjectControlFinish(_buildingUpgradeActoKeyRaw)
end

InteractionTooltipResize_ByFontSize = function()
  -- function num : 0_40 , upvalues : _globalGuide
  if (ToClient_getGameOptionControllerWrapper()):getUIFontSizeType() > 0 then
    _globalGuide:SetSize(_globalGuide:GetSizeX(), 30)
  else
    _globalGuide:SetSize(_globalGuide:GetSizeX(), 23)
  end
end

registerEvent("FromClient_ReceiveBuyHouse", "Interaction_SetReloadState")
registerEvent("FromClient_ReceiveChangeUseType", "Interaction_SetReloadState")
registerEvent("FromClient_ReceiveReturnHouse", "Interaction_SetReloadState")
registerEvent("FromClient_ReceiveSetMyHouse", "Interaction_SetReloadState")
registerEvent("FromClient_InteractionHarvest", "FromClient_InteractionHarvest")
registerEvent("FromClient_InteractionSeedHarvest", "FromClient_InteractionSeedHarvest")
registerEvent("FromClient_InteractionBuildingUpgrade", "FromClient_InteractionBuildingUpgrade")
registerEvent("FromClient_InteractionSiegeObject", "FromClient_InteractionSiegeObject")
registerEvent("FromClient_luaLoadComplete", "InteractionTooltipResize_ByFontSize")
local myContributeValue = Panel_Expgauge_MyContributeValue
local buyHouseButton = (UI.getChildControl)(Panel_Interaction_House, "Button_BuyHouse")
local houseInit = function()
  -- function num : 0_41 , upvalues : myContributeValue, buyHouseButton, UI_Color, _houseDesc, UI_TM, _houseDescBG, YSize, GetBottomPos
  if myContributeValue == 0 then
    buyHouseButton:SetFontColor(UI_Color.C_FFD20000)
    buyHouseButton:addInputEvent("Mouse_LUp", "")
    buyHouseButton:addInputEvent("Mouse_On", "Panel_Interaction_House_HelpDesc_Func( 0, true )")
    buyHouseButton:addInputEvent("Mouse_Out", "Panel_Interaction_House_HelpDesc_Func( 0, false )")
  else
    buyHouseButton:SetFontColor(UI_Color.C_FFC4BEBE)
    buyHouseButton:addInputEvent("Mouse_LUp", "FGlobal_OpenWorldMapWithHouse()")
    buyHouseButton:addInputEvent("Mouse_On", "Panel_Interaction_House_HelpDesc_Func( 1, true )")
    buyHouseButton:addInputEvent("Mouse_Out", "Panel_Interaction_House_HelpDesc_Func( 1, false )")
  end
  _houseDesc:SetAutoResize(true)
  _houseDesc:SetTextMode(UI_TM.eTextMode_AutoWrap)
  _houseDesc:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_INTERACTION_HouseDesc"))
  _houseDescBG:SetSize(_houseDesc:GetSizeX() + 13, _houseDesc:GetSizeY() + 10)
  YSize = GetBottomPos(_houseDescBG)
  Panel_Interaction_House:SetSize(Panel_Interaction_House:GetSizeX(), YSize + 50)
  buyHouseButton:ComputePos()
end

Panel_Interaction_House_HelpDesc_Func = function(contribute, isOn)
  -- function num : 0_42 , upvalues : _contribute_Help, buyHouseButton, UI_Color, UI_TM, myContributeValue
  local mouse_posX = getMousePosX()
  local mouse_posY = getMousePosY()
  local panel_posX = Panel_Interaction_House:GetPosX()
  local panel_posY = Panel_Interaction_House:GetPosY()
  _contribute_Help:SetAlpha(0)
  if isOn == true and contribute == 0 then
    buyHouseButton:SetFontColor(UI_Color.C_FFF26A6A)
    _contribute_Help:SetAutoResize(true)
    _contribute_Help:SetTextMode(UI_TM.eTextMode_AutoWrap)
    _contribute_Help:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_INTERACTION_ContributeHelp", "myContributeValue", myContributeValue))
    _contribute_Help:SetSize(_contribute_Help:GetSizeX() + 5, _contribute_Help:GetSizeY() + 10)
    _contribute_Help:SetPosY(Panel_Interaction_House:GetSizeY())
    local aniInfo = (UIAni.AlphaAnimation)(1, _contribute_Help, 0, 0.2)
    _contribute_Help:SetShow(true)
  else
    do
      if isOn == false and contribute == 0 then
        buyHouseButton:SetFontColor(UI_Color.C_FFD20000)
        _contribute_Help:SetSize(270, 100)
        local aniInfo = (UIAni.AlphaAnimation)(0, _contribute_Help, 0, 0.2)
        aniInfo:SetHideAtEnd(true)
      end
      do
        if isOn == true and contribute == 1 then
          buyHouseButton:SetFontColor(UI_Color.C_FFEFEFEF)
        else
          if isOn == false and contribute == 1 then
            buyHouseButton:SetFontColor(UI_Color.C_FFC4BEBE)
          end
        end
      end
    end
  end
end

houseInit()

