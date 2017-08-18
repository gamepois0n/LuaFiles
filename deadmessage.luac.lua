-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\deadmessage\deadmessage.luac 

-- params : ...
-- function num : 0
Panel_DeadNodeSelect:SetShow(false)
Panel_DeadNodeSelect:setIgnoreFlashPanel(true)
Panel_DeadMessage:setIgnoreFlashPanel(true)
local _deadBlackHole = (UI.getChildControl)(Panel_DeadMessage, "deadBlackHole")
local _deadQuestion = (UI.getChildControl)(Panel_DeadMessage, "Button_Question")
local _deadMessage = (UI.getChildControl)(Panel_DeadMessage, "Static_DeadText")
local _button_MoveTown = (UI.getChildControl)(Panel_DeadMessage, "Button_MoveTown")
local _button_MoveExploration = (UI.getChildControl)(Panel_DeadMessage, "Button_MoveExploration")
local _button_Immediate = (UI.getChildControl)(Panel_DeadMessage, "Button_Immediate")
local _button_AdvancedBase = (UI.getChildControl)(Panel_DeadMessage, "Button_AdvancedBase")
local _button_LocalWar = (UI.getChildControl)(Panel_DeadMessage, "Button_LocalWar")
local _button_GuildSpawn = (UI.getChildControl)(Panel_DeadMessage, "Button_GuildSpawn")
local _button_SavageOut = (UI.getChildControl)(Panel_DeadMessage, "Button_SavageOut")
local _text_ImmediateCount = (UI.getChildControl)(Panel_DeadMessage, "StaticText_ImmediateCount")
local _text_reviveNotify = (UI.getChildControl)(Panel_DeadMessage, "StaticText_reviveNotify")
local _button_SiegeIng = (UI.getChildControl)(Panel_DeadMessage, "Button_Siegeing")
local _button_Volunteer = (UI.getChildControl)(Panel_DeadMessage, "Button_MoveValunteer")
local _regenTime = (UI.getChildControl)(Panel_DeadMessage, "ResurrectionTime")
local _useCashItemBG = (UI.getChildControl)(Panel_DeadMessage, "Static_UseCasheItemBG")
local _checkBoxUseCache = (UI.getChildControl)(Panel_DeadMessage, "CheckBox_UseCacheItem")
local _tooltip = (UI.getChildControl)(Panel_DeadMessage, "StaticText_Tooltip")
local _text_AdvancedBaseAlert = (UI.getChildControl)(Panel_DeadMessage, "StaticText_AdvancedBase_Alert")
local _button_ObserverMode = (UI.getChildControl)(Panel_DeadMessage, "Button_ObserverMode")
local reviveBG = (UI.getChildControl)(Panel_DeadNodeSelect, "Static_AllBG")
local reviveScroll = (UI.getChildControl)(Panel_DeadNodeSelect, "Scroll_List")
local _deadNodeSelectClose = (UI.getChildControl)(Panel_DeadNodeSelect, "Button_Close")
reviveScroll:SetShow(false)
reviveScroll:SetShow(false)
_deadNodeSelectClose:addInputEvent("Mouse_LUp", "deadNodeSelectClose()")
local STATIC_DROP_ITEM = {}
for ii = 0, 9 do
  STATIC_DROP_ITEM[ii] = (UI.getChildControl)(Panel_DeadMessage, "Static_DropItem_" .. ii)
end
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local CPP_slotNoString = CppEnums.EquipSlotNoString
enRespawnType = {respawnType_None = 0, respawnType_Immediate = 1, respawnType_ByOtherPlayer = 2, respawnType_Exploration = 3, respawnType_NearTown = 4, respawnType_TimeOver = 5, respawnType_InSiegeingFortress = 6, respawnType_LocalWar = 7, respawnType_AdvancedBase = 8, respawnType_GuildSpawn = 9, respawnType_Competition = 10, respawnType_SavageDefence = 11, respawnType_Volunteer = 12, respawnType_GuildBatle = 13, respawnType_Count = 14}
local revivalTime = 600
local DROP_ITEM_COUNT = 1
local startTimer = false
local isEnableImmediateRevival = false
local isPvPMatchRevive = false
local matchReviveTime = 10
local buttonAbleTime = 10
local isUseButtonAbleTime = false
local isSiegeBeingInDead = false
local ResurrectionTime = revivalTime
local CurrentTime = 0
local revivalCacheItemCount = 0
local isHasRestoreExperience = false
local reviveStartIdx = 0
local reviveListPool = {}
local reviveListCount = 5
local deadMessage_ClearDropItems = function()
  -- function num : 0_0 , upvalues : STATIC_DROP_ITEM, DROP_ITEM_COUNT
  for ii = 0, #STATIC_DROP_ITEM do
    (STATIC_DROP_ITEM[ii]):SetShow(false)
  end
  DROP_ITEM_COUNT = 1
end

local create_reviveList = function()
  -- function num : 0_1 , upvalues : reviveListCount, reviveBG, reviveListPool
  for idx = 0, reviveListCount - 1 do
    local slot = {}
    do
      slot.bg = (UI.createAndCopyBasePropertyControl)(Panel_DeadNodeSelect, "Static_Channel_BG", reviveBG, "DeadNodeSelect_SlotBG_" .. idx)
      slot.text = (UI.createAndCopyBasePropertyControl)(Panel_DeadNodeSelect, "StaticText_ChannelName", slot.bg, "DeadNodeSelect_Slot_" .. idx)
      slot.btn = (UI.createAndCopyBasePropertyControl)(Panel_DeadNodeSelect, "Button_Select", slot.bg, "DeadNodeSelect_Slot_Count_" .. idx)
      ;
      (slot.btn):addInputEvent("Mouse_LUp", "deadNodeSelect( " .. idx .. " )")
      ;
      (slot.bg):SetPosX(5)
      ;
      (slot.bg):SetPosY(5 + ((slot.bg):GetSizeY() + 5) * idx)
      ;
      (slot.text):SetPosX(10)
      ;
      (slot.text):SetPosY((slot.bg):GetSizeY() / 2 - (slot.text):GetSizeY() / 2)
      ;
      (slot.btn):SetPosX((slot.bg):GetSizeX() - ((slot.btn):GetSizeX() + 5))
      ;
      (slot.btn):SetPosY((slot.bg):GetSizeY() / 2 - (slot.btn):GetSizeY() / 2)
      slot.showControl = function(self, isVisible)
    -- function num : 0_1_0 , upvalues : slot
    (slot.bg):SetShow(isVisible)
    ;
    (slot.text):SetShow(isVisible)
    ;
    (slot.btn):SetShow(isVisible)
  end

      slot.SetRegionText = function(self, regionText)
    -- function num : 0_1_1 , upvalues : slot
    (slot.text):SetText(regionText)
  end

      slot.clear = function(self)
    -- function num : 0_1_2 , upvalues : slot
    (slot.showControl)(false)
    ;
    (slot.setDisable)(true)
    ;
    (slot.text):SetText("")
  end

      slot.setDisable = function(self, isDisable)
    -- function num : 0_1_3 , upvalues : slot
    if isDisable then
      (slot.btn):SetShow(false)
    else
      ;
      (slot.btn):SetShow(true)
    end
    ;
    (slot.bg):SetDisableColor(isDisable)
    ;
    (slot.text):SetDisableColor(isDisable)
  end

      -- DECOMPILER ERROR at PC109: Confused about usage of register: R5 in 'UnsetPending'

      reviveListPool[idx] = slot
    end
  end
end

create_reviveList()
local fillFortressInfo = function()
  -- function num : 0_2 , upvalues : reviveListCount, reviveListPool
  local temporaryWrapper = getTemporaryInformationWrapper()
  do
    local fortressSize = temporaryWrapper:getMyFortressSize()
    for idx = 0, reviveListCount - 1 do
      ((reviveListPool[idx]).clear)()
    end
    for ii = 0, fortressSize do
      if ii < reviveListCount then
        local buildingInfo = temporaryWrapper:getMyfortressAt(ii)
        if buildingInfo ~= nil then
          local buildingRegionKey = nil
          if ToClient_IsVillageSiegeBeing() then
            buildingRegionKey = buildingInfo:getBuildingRegionKey()
          else
            buildingRegionKey = buildingInfo:getAffiliatedRegionKey()
          end
          local regionInfo = getRegionInfoByRegionKey(buildingRegionKey)
          if regionInfo ~= nil then
            (reviveListPool[ii]):showControl(true)
            local posi = buildingInfo:getPosition()
            local fortressToPlayerDistance = ((Util.Math).calculateDistance)(posi, ((getSelfPlayer()):get()):getPosition())
            fortressToPlayerDistance = fortressToPlayerDistance / 100
            local fortressToPlayerDistance2 = (string.format)("%.1f", fortressToPlayerDistance)
            local linkSiegeWrapper = ToClient_getVillageSiegeRegionInfoWrapperByPosition(posi)
            local explorationWrapper = linkSiegeWrapper:getExplorationStaticStatusWrapper()
            local villageWarZone = (linkSiegeWrapper:get()):isVillageWarZone()
            local warZoneName = ""
            if explorationWrapper ~= nil and villageWarZone == true then
              warZoneName = explorationWrapper:getName()
            else
              warZoneName = regionInfo:getAreaName()
            end
            if fortressToPlayerDistance > 100000 then
              ((reviveListPool[ii]).btn):SetShow(false)
            end
            ;
            (reviveListPool[ii]):SetRegionText(warZoneName .. "\n" .. tostring(fortressToPlayerDistance2) .. "m")
          end
        end
      end
    end
    fortressSize = temporaryWrapper:getMyFortressSize()
    Panel_DeadNodeSelect:SetShow(fortressSize > 0)
    if fortressSize == 0 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_NoPossibleRevivalPostion"))
    end
    if fortressSize == 1 then
      deadNodeSelect(0)
    end
    -- DECOMPILER ERROR: 3 unprocessed JMP targets
  end
end

deadNodeSelect = function(idx)
  -- function num : 0_3 , upvalues : deadMessage_ClearDropItems
  local temporaryWrapper = getTemporaryInformationWrapper()
  local buildingInfo = temporaryWrapper:getMyfortressAt(idx)
  if buildingInfo ~= nil then
    local buildingRegionKey = nil
    if ToClient_IsVillageSiegeBeing() then
      buildingRegionKey = buildingInfo:getBuildingRegionKey()
    else
      buildingRegionKey = buildingInfo:getAffiliatedRegionKey()
    end
    if buildingRegionKey:get() == 0 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_NoPossibleRevivalPostion"))
      return 
    end
    deadMessage_Revival(enRespawnType.respawnType_InSiegeingFortress, 255, 0, buildingRegionKey, false, toInt64(0, 0))
    deadMessage_ClearDropItems()
    Panel_DeadNodeSelect:SetShow(false)
  else
    do
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_NoPossibleRevivalPostion"))
      do return  end
    end
  end
end

deadNodeSelectClose = function()
  -- function num : 0_4
  Panel_DeadNodeSelect:SetShow(false)
end

deadMessage_Resize = function()
  -- function num : 0_5 , upvalues : _deadBlackHole, _deadMessage, _button_Immediate, _useCashItemBG, _checkBoxUseCache, _text_reviveNotify, _button_ObserverMode, _deadQuestion, _text_ImmediateCount, _button_MoveTown, _button_SavageOut, _button_MoveExploration, _button_Volunteer, _button_SiegeIng, _button_AdvancedBase, _text_AdvancedBaseAlert, _button_GuildSpawn, _button_LocalWar, _regenTime, STATIC_DROP_ITEM
  local screenX = getScreenSizeX()
  local screenY = getScreenSizeY()
  Panel_DeadMessage:SetSize(screenX, screenY)
  _deadBlackHole:SetPosX(screenX / 2 - _deadBlackHole:GetSizeX() / 2)
  _deadBlackHole:SetPosY(screenY / 2 - _deadBlackHole:GetSizeY() / 2)
  _deadMessage:SetPosX(screenX / 2 - 25)
  _deadMessage:SetPosY(100)
  local buttonHalfSizeX = _button_Immediate:GetSizeX() / 2
  local buttonSizeY = _button_Immediate:GetSizeY()
  _useCashItemBG:SetPosX(screenX / 2 - buttonHalfSizeX)
  _useCashItemBG:SetPosY(screenY / 2 + buttonSizeY * 2.4)
  _checkBoxUseCache:SetPosX(screenX / 2 - (buttonHalfSizeX - 5))
  _checkBoxUseCache:SetPosY(screenY / 2 + buttonSizeY * 2.43)
  _text_reviveNotify:SetPosX(screenX / 2 - _text_reviveNotify:GetSizeX() / 2)
  _text_reviveNotify:SetPosY(_checkBoxUseCache:GetPosY() - _text_reviveNotify:GetSizeY() - 20)
  _button_ObserverMode:SetPosX(screenX / 2 - buttonHalfSizeX)
  _button_ObserverMode:SetPosY(screenY / 2 + buttonSizeY + 30)
  _button_Immediate:SetPosX(screenX / 2 - buttonHalfSizeX)
  _button_Immediate:SetPosY(screenY / 2 + buttonSizeY * 2 + 50)
  _deadQuestion:SetPosX(screenX / 2 + buttonHalfSizeX - 40)
  _deadQuestion:SetPosY(screenY / 2 + buttonSizeY * 2 + 10)
  _text_ImmediateCount:SetPosX(screenX / 2 - _text_ImmediateCount:GetSizeX() / 2)
  _text_ImmediateCount:SetPosY(_button_Immediate:GetPosY() + 33)
  _button_MoveTown:SetPosX(screenX / 2 - buttonHalfSizeX)
  _button_MoveTown:SetPosY(screenY / 2 + buttonSizeY * 2 + 115)
  _button_SavageOut:SetPosX(screenX / 2 - buttonHalfSizeX)
  _button_SavageOut:SetPosY(_button_ObserverMode:GetPosY() + _button_ObserverMode:GetSizeY())
  _button_MoveExploration:SetPosX(screenX / 2 - buttonHalfSizeX)
  _button_MoveExploration:SetPosY(screenY / 2 + buttonSizeY * 2 + 165)
  _button_Volunteer:SetPosX(screenX / 2 - buttonHalfSizeX)
  _button_Volunteer:SetPosY(screenY / 2 + buttonSizeY * 2 + 215)
  _button_SiegeIng:SetPosX(_button_Immediate:GetPosX())
  _button_SiegeIng:SetPosY(_button_Immediate:GetPosY())
  _button_AdvancedBase:SetPosX(screenX / 2 - buttonHalfSizeX)
  _button_AdvancedBase:SetPosY(screenY / 2 + buttonSizeY * 2 + 215)
  _text_AdvancedBaseAlert:SetPosX(screenX / 2 - _text_AdvancedBaseAlert:GetSizeX() / 2)
  _text_AdvancedBaseAlert:SetPosY(screenY / 2 + buttonSizeY * 2 + 245)
  _button_GuildSpawn:SetPosX(screenX / 2 - _button_GuildSpawn:GetSizeX() / 2)
  _button_GuildSpawn:SetPosY(screenY / 2 + buttonSizeY * 2 + 280)
  _button_LocalWar:SetPosX(_button_Immediate:GetPosX())
  _button_LocalWar:SetPosY(_button_Immediate:GetPosY())
  _regenTime:SetPosX(screenX / 2 - _regenTime:GetSizeX() / 2)
  _regenTime:SetPosY(_deadMessage:GetPosY() + 45)
  local dropItemPosX = screenX / 2 - (STATIC_DROP_ITEM[0]):GetSizeX() / 2
  local dropItemPosY = _regenTime:GetPosY() + 100
  for ii = 0, #STATIC_DROP_ITEM do
    (STATIC_DROP_ITEM[ii]):SetShow(true)
    ;
    (STATIC_DROP_ITEM[ii]):SetPosX(dropItemPosX)
    ;
    (STATIC_DROP_ITEM[ii]):SetPosY(dropItemPosY + ii * (STATIC_DROP_ITEM[ii]):GetSizeY() + ii * 40)
  end
  _checkBoxUseCache:SetCheck(false)
end

local deadMessage_Animation = function()
  -- function num : 0_6 , upvalues : _deadBlackHole, UI_ANI_ADV, UI_color, _button_MoveTown, _deadQuestion, _text_reviveNotify, _button_MoveExploration, _button_ObserverMode, _button_Immediate, _text_ImmediateCount, _button_SiegeIng, _button_AdvancedBase, _text_AdvancedBaseAlert, _button_LocalWar, _button_SavageOut, _button_GuildSpawn, _button_Volunteer, _checkBoxUseCache, _useCashItemBG, _deadMessage, _regenTime, startTimer
  Panel_DeadMessage:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_IN)
  local aniInfo1 = _deadBlackHole:addColorAnimation(0, 3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo1:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo1.IsChangeChild = false
  local aniInfo2 = _deadBlackHole:addScaleAnimation(3, 15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_LINEAR_2)
  aniInfo2:SetStartScale(1)
  aniInfo2:SetEndScale(1.5)
  aniInfo2.AxisX = 128
  aniInfo2.AxisY = 128
  aniInfo2.IsChangeChild = false
  local aniInfo3 = _button_MoveTown:addColorAnimation(0, 3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo3:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo3.IsChangeChild = true
  aniInfo3:SetDisableWhileAni(true)
  local aniInfo3 = _button_MoveTown:addColorAnimation(3, 4, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo3:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo3.IsChangeChild = true
  aniInfo3:SetDisableWhileAni(true)
  local aniInfo4 = _button_MoveTown:addScaleAnimation(2.5, 3.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo4:SetStartScale(0.5)
  aniInfo4:SetEndScale(1)
  aniInfo4.IsChangeChild = true
  aniInfo4:SetDisableWhileAni(true)
  local aniQuestion1 = _deadQuestion:addColorAnimation(0, 3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniQuestion1:SetStartColor(UI_color.C_00FFFFFF)
  aniQuestion1:SetEndColor(UI_color.C_00FFFFFF)
  aniQuestion1.IsChangeChild = true
  aniQuestion1:SetDisableWhileAni(true)
  local aniQuestion1 = _deadQuestion:addColorAnimation(3, 4, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniQuestion1:SetStartColor(UI_color.C_00FFFFFF)
  aniQuestion1:SetEndColor(UI_color.C_FFFFFFFF)
  aniQuestion1.IsChangeChild = true
  aniQuestion1:SetDisableWhileAni(true)
  local aniQuestion2 = _deadQuestion:addScaleAnimation(2.5, 3.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniQuestion2:SetStartScale(0.5)
  aniQuestion2:SetEndScale(1)
  aniQuestion2.IsChangeChild = true
  aniQuestion2:SetDisableWhileAni(true)
  local aniInfoNotify1 = _text_reviveNotify:addColorAnimation(0, 3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoNotify1:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoNotify1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfoNotify1.IsChangeChild = true
  aniInfoNotify1:SetDisableWhileAni(true)
  local aniInfoNotify2 = _text_reviveNotify:addColorAnimation(3, 4, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoNotify2:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoNotify2:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfoNotify2.IsChangeChild = true
  aniInfoNotify2:SetDisableWhileAni(true)
  local aniInfoNotify3 = _text_reviveNotify:addScaleAnimation(2.5, 3.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoNotify3:SetStartScale(0.5)
  aniInfoNotify3:SetEndScale(1)
  aniInfoNotify3.IsChangeChild = true
  aniInfoNotify3:SetDisableWhileAni(true)
  local aniInfoExplore3 = _button_MoveExploration:addColorAnimation(0, 3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoExplore3:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoExplore3:SetEndColor(UI_color.C_00FFFFFF)
  aniInfoExplore3.IsChangeChild = true
  aniInfoExplore3:SetDisableWhileAni(true)
  aniInfoExplore3 = _button_MoveExploration:addColorAnimation(3, 4, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoExplore3:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoExplore3:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfoExplore3.IsChangeChild = true
  aniInfoExplore3:SetDisableWhileAni(true)
  local aniInfoExplore4 = _button_MoveExploration:addScaleAnimation(2.5, 3.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoExplore4:SetStartScale(0.5)
  aniInfoExplore4:SetEndScale(1)
  aniInfoExplore4.IsChangeChild = true
  aniInfoExplore4:SetDisableWhileAni(true)
  local aniInfoObserverMode = _button_ObserverMode:addColorAnimation(0, 3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoObserverMode:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoObserverMode:SetEndColor(UI_color.C_00FFFFFF)
  aniInfoObserverMode.IsChangeChild = true
  aniInfoObserverMode:SetDisableWhileAni(true)
  aniInfoObserverMode = _button_ObserverMode:addColorAnimation(3, 4, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoObserverMode:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoObserverMode:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfoObserverMode.IsChangeChild = true
  aniInfoObserverMode:SetDisableWhileAni(true)
  local aniInfoImmediate3 = _button_Immediate:addColorAnimation(0, 3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoImmediate3:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoImmediate3:SetEndColor(UI_color.C_00FFFFFF)
  aniInfoImmediate3.IsChangeChild = true
  aniInfoImmediate3:SetDisableWhileAni(true)
  aniInfoImmediate3 = _button_Immediate:addColorAnimation(3, 4, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoImmediate3:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoImmediate3:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfoImmediate3.IsChangeChild = true
  aniInfoImmediate3:SetDisableWhileAni(true)
  local aniInfoImmediate4 = _text_ImmediateCount:addScaleAnimation(2.5, 3.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoImmediate4:SetStartScale(0.5)
  aniInfoImmediate4:SetEndScale(1)
  aniInfoImmediate4.IsChangeChild = true
  aniInfoImmediate4:SetDisableWhileAni(true)
  local aniInfoImmediate5 = _text_ImmediateCount:addColorAnimation(0, 3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoImmediate5:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoImmediate5:SetEndColor(UI_color.C_00FFFFFF)
  aniInfoImmediate5.IsChangeChild = true
  aniInfoImmediate5:SetDisableWhileAni(true)
  aniInfoImmediate5 = _text_ImmediateCount:addColorAnimation(3, 4, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoImmediate5:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoImmediate5:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfoImmediate5.IsChangeChild = true
  aniInfoImmediate5:SetDisableWhileAni(true)
  local aniInfoImmediate6 = _text_ImmediateCount:addScaleAnimation(2.5, 3.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoImmediate6:SetStartScale(0.5)
  aniInfoImmediate6:SetEndScale(1)
  aniInfoImmediate6.IsChangeChild = true
  aniInfoImmediate6:SetDisableWhileAni(true)
  local aniInfoSiege3 = _button_SiegeIng:addColorAnimation(0, 3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoSiege3:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoSiege3:SetEndColor(UI_color.C_00FFFFFF)
  aniInfoSiege3.IsChangeChild = true
  aniInfoSiege3 = _button_SiegeIng:addColorAnimation(3, 4, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoSiege3:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoSiege3:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfoSiege3.IsChangeChild = true
  local aniInfoSiege4 = _button_SiegeIng:addScaleAnimation(2.5, 3.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoSiege4:SetStartScale(0.5)
  aniInfoSiege4:SetEndScale(1)
  aniInfoSiege4.IsChangeChild = true
  local aniInfoAdvancedBase = _button_AdvancedBase:addColorAnimation(0, 3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoAdvancedBase:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoAdvancedBase:SetEndColor(UI_color.C_00FFFFFF)
  aniInfoAdvancedBase.IsChangeChild = true
  aniInfoAdvancedBase = _button_AdvancedBase:addColorAnimation(3, 4, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoAdvancedBase:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoAdvancedBase:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfoAdvancedBase.IsChangeChild = true
  local aniInfoAdvancedBase2 = _button_AdvancedBase:addScaleAnimation(2.5, 3.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoAdvancedBase2:SetStartScale(0.5)
  aniInfoAdvancedBase2:SetEndScale(1)
  aniInfoAdvancedBase2.IsChangeChild = true
  local aniInfoAdvancedBaseText1 = _text_AdvancedBaseAlert:addColorAnimation(0, 3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoAdvancedBaseText1:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoAdvancedBaseText1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfoAdvancedBaseText1.IsChangeChild = true
  aniInfoAdvancedBaseText1:SetDisableWhileAni(true)
  local aniInfoAdvancedBaseText2 = _text_AdvancedBaseAlert:addColorAnimation(3, 4, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoAdvancedBaseText2:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoAdvancedBaseText2:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfoAdvancedBaseText2.IsChangeChild = true
  aniInfoAdvancedBaseText2:SetDisableWhileAni(true)
  local aniInfoAdvancedBaseText3 = _text_AdvancedBaseAlert:addScaleAnimation(2.5, 3.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoAdvancedBaseText3:SetStartScale(0.5)
  aniInfoAdvancedBaseText3:SetEndScale(1)
  aniInfoAdvancedBaseText3.IsChangeChild = true
  aniInfoAdvancedBaseText3:SetDisableWhileAni(true)
  local aniInfoLocalWar = _button_LocalWar:addColorAnimation(0, 3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoLocalWar:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoLocalWar:SetEndColor(UI_color.C_00FFFFFF)
  aniInfoLocalWar.IsChangeChild = true
  aniInfoLocalWar = _button_LocalWar:addColorAnimation(3, 4, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoLocalWar:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoLocalWar:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfoLocalWar.IsChangeChild = true
  local aniInfoLocalWar2 = _button_LocalWar:addScaleAnimation(2.5, 3.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoLocalWar2:SetStartScale(0.5)
  aniInfoLocalWar2:SetEndScale(1)
  aniInfoLocalWar2.IsChangeChild = true
  local aniInfoSavage = _button_SavageOut:addColorAnimation(0, 3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoSavage:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoSavage:SetEndColor(UI_color.C_00FFFFFF)
  aniInfoSavage.IsChangeChild = true
  aniInfoSavage = _button_SavageOut:addColorAnimation(3, 4, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoSavage:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoSavage:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfoSavage.IsChangeChild = true
  local aniInfoSavage2 = _button_SavageOut:addScaleAnimation(2.5, 3.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoSavage2:SetStartScale(0.5)
  aniInfoSavage2:SetEndScale(1)
  aniInfoSavage2.IsChangeChild = true
  local aniInfoGuildSpawn = _button_GuildSpawn:addColorAnimation(0, 3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoGuildSpawn:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoGuildSpawn:SetEndColor(UI_color.C_00FFFFFF)
  aniInfoGuildSpawn.IsChangeChild = true
  aniInfoGuildSpawn = _button_GuildSpawn:addColorAnimation(3, 4, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoGuildSpawn:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoGuildSpawn:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfoGuildSpawn.IsChangeChild = true
  local aniInfoGuildSpawn2 = _button_GuildSpawn:addScaleAnimation(2.5, 3.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoGuildSpawn2:SetStartScale(0.5)
  aniInfoGuildSpawn2:SetEndScale(1)
  aniInfoGuildSpawn2.IsChangeChild = true
  local aniInfoVolunteer = _button_Volunteer:addColorAnimation(0, 3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoVolunteer:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoVolunteer:SetEndColor(UI_color.C_00FFFFFF)
  aniInfoVolunteer.IsChangeChild = true
  aniInfoVolunteer = _button_Volunteer:addColorAnimation(3, 4, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoVolunteer:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoVolunteer:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfoVolunteer.IsChangeChild = true
  local aniInfoVolunteer2 = _button_Volunteer:addScaleAnimation(2.5, 3.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoVolunteer2:SetStartScale(0.5)
  aniInfoVolunteer2:SetEndScale(1)
  aniInfoVolunteer2.IsChangeChild = true
  local aniInfoCheckBox5 = _checkBoxUseCache:addColorAnimation(0, 3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoCheckBox5:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoCheckBox5:SetEndColor(UI_color.C_00FFFFFF)
  aniInfoCheckBox5.IsChangeChild = true
  aniInfoCheckBox5 = _checkBoxUseCache:addColorAnimation(3, 4, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoCheckBox5:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoCheckBox5:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfoCheckBox5.IsChangeChild = true
  local aniInfoCheckBoxBG5 = _useCashItemBG:addColorAnimation(0, 3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoCheckBoxBG5:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoCheckBoxBG5:SetEndColor(UI_color.C_00FFFFFF)
  aniInfoCheckBoxBG5:SetDisableWhileAni(true)
  aniInfoCheckBoxBG5.IsChangeChild = true
  aniInfoCheckBoxBG5 = _useCashItemBG:addColorAnimation(3, 4, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfoCheckBoxBG5:SetStartColor(UI_color.C_00FFFFFF)
  aniInfoCheckBoxBG5:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfoCheckBoxBG5.IsChangeChild = true
  local aniInfo3 = _deadMessage:addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo3:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo3:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo3.IsChangeChild = true
  local aniInfo7 = _deadMessage:addScaleAnimation(0.7, 2.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo7:SetStartScale(0.5)
  aniInfo7:SetEndScale(1)
  aniInfo7.IsChangeChild = true
  local aniInfo8 = _deadMessage:addColorAnimation(1.5, 2.3, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo8:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo8:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo8.IsChangeChild = true
  local aniInfo9 = _regenTime:addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo9:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo9:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo9.IsChangeChild = true
  local aniInfo9 = _regenTime:addColorAnimation(2.2, 2.7, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo9:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo9:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo9.IsChangeChild = true
  startTimer = true
end

deadMessage_Show = function(attackerActorKeyRaw, isSkipDeathPenalty, isHasRestoreExp, isAblePvPMatchRevive, respawnTime)
  -- function num : 0_7 , upvalues : _button_SavageOut, _button_ObserverMode, isPvPMatchRevive, _button_SiegeIng, _button_MoveExploration, _button_MoveTown, _button_AdvancedBase, _text_AdvancedBaseAlert, _text_reviveNotify, _button_Immediate, _button_GuildSpawn, _useCashItemBG, _checkBoxUseCache, _text_ImmediateCount, _button_LocalWar, _button_Volunteer, _deadQuestion, _deadMessage, ResurrectionTime, revivalTime, deadMessage_Animation, _regenTime, isHasRestoreExperience, isSiegeBeingInDead, buttonAbleTime, isUseButtonAbleTime, STATIC_DROP_ITEM, revivalCacheItemCount
  if Panel_GameExit:GetShow() then
    Panel_GameExit:SetShow(false)
  end
  if Panel_ChannelSelect:GetShow() then
    FGlobal_ChannelSelect_Hide()
  end
  SetUIMode((Defines.UIMode).eUIMode_DeadMessage)
  local selfProxy = getSelfPlayer()
  if selfProxy == nil then
    return 
  end
  _button_SavageOut:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_MENU_WAVE_OUT"))
  _button_ObserverMode:SetShow(false)
  local attackerActorProxyWrapper = getActor(attackerActorKeyRaw)
  isPvPMatchRevive = isAblePvPMatchRevive
  local isMilitia = false
  local playerActorProxyWrapper = getPlayerActor(attackerActorKeyRaw)
  if playerActorProxyWrapper ~= nil then
    isMilitia = (playerActorProxyWrapper:get()):isVolunteer()
  end
  if (selfProxy:get()):isBattleGroundDefine() then
    _button_SiegeIng:SetShow(false)
    _button_MoveExploration:SetShow(false)
    _button_MoveTown:SetShow(false)
    _button_AdvancedBase:SetShow(false)
    _text_AdvancedBaseAlert:SetShow(false)
    _text_reviveNotify:SetShow(false)
    _button_Immediate:SetShow(true)
    _button_GuildSpawn:SetShow(false)
    _button_Immediate:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_DEADMESSAGE_IMMEDIATE_RESURRECTION"))
    _useCashItemBG:SetShow(false)
    _checkBoxUseCache:SetShow(false)
    _text_ImmediateCount:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PVPBATTLE_IMMEDIATECOUNT_TEXT"))
    _text_ImmediateCount:SetShow(true)
    _button_LocalWar:SetShow(false)
    _button_SavageOut:SetShow(false)
    _button_Volunteer:SetShow(false)
    _deadQuestion:SetShow(false)
    if attackerActorProxyWrapper == nil then
      _deadMessage:SetText(PAGetString(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_DisplayMsg"))
    else
      if isMilitia then
        _deadMessage:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_KilledDisplayMsg", "attackerName", PAGetString(Defines.StringSheet_GAME, "LUA_WARINFOMESSAGE_MILITIA")))
      else
        _deadMessage:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_KilledDisplayMsg", "attackerName", attackerActorProxyWrapper:getOriginalName()))
      end
    end
    ResurrectionTime = revivalTime
    Panel_DeadMessage:SetShow(true, false)
    deadMessage_Animation()
    return 
  end
  do
    if (selfProxy:get()):isCompetitionDefined() then
      local hostCanSelfRebirth = (selfProxy:get()):isCompetitionHost()
      _button_SiegeIng:SetShow(false)
      _button_MoveExploration:SetShow(false)
      _button_MoveTown:SetShow(false)
      _button_AdvancedBase:SetShow(false)
      _text_AdvancedBaseAlert:SetShow(false)
      _text_reviveNotify:SetShow(false)
      _button_Immediate:SetShow(hostCanSelfRebirth)
      _button_Immediate:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_DEADMESSAGE_IMMEDIATE_RESURRECTION"))
      _text_ImmediateCount:SetShow(hostCanSelfRebirth)
      _text_ImmediateCount:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PVPBATTLE_IMMEDIATECOUNT_TEXT"))
      _button_GuildSpawn:SetShow(false)
      _useCashItemBG:SetShow(false)
      _checkBoxUseCache:SetShow(false)
      _button_SavageOut:SetShow(false)
      _button_Volunteer:SetShow(false)
      _deadQuestion:SetShow(false)
      _button_LocalWar:SetShow(false)
      _button_ObserverMode:SetShow(true)
      if attackerActorProxyWrapper == nil then
        _deadMessage:SetText(PAGetString(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_DisplayMsg"))
      else
        if isMilitia then
          _deadMessage:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_KilledDisplayMsg", "attackerName", PAGetString(Defines.StringSheet_GAME, "LUA_WARINFOMESSAGE_MILITIA")))
        else
          _deadMessage:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_KilledDisplayMsg", "attackerName", attackerActorProxyWrapper:getOriginalName()))
        end
      end
      Panel_DeadMessage:SetShow(true, false)
      ResurrectionTime = ToClient_CompetitionMatchTimeLimit() + ToClient_GetMaxWaitTime()
      _regenTime:SetShow(false)
      if (selfProxy:get()):isCompetitionHost() == false then
        _text_ImmediateCount:SetShow(false)
      end
      deadMessage_Animation()
      return 
    end
    if ToClient_getPlayNowSavageDefence() then
      _button_SiegeIng:SetShow(false)
      _button_MoveExploration:SetShow(false)
      _button_MoveTown:SetShow(false)
      _button_AdvancedBase:SetShow(false)
      _text_AdvancedBaseAlert:SetShow(false)
      _text_reviveNotify:SetShow(false)
      _button_Immediate:SetShow(false)
      _button_GuildSpawn:SetShow(false)
      _button_Immediate:SetShow(false)
      _useCashItemBG:SetShow(false)
      _checkBoxUseCache:SetShow(false)
      _text_ImmediateCount:SetShow(false)
      _text_ImmediateCount:SetShow(false)
      _button_LocalWar:SetShow(false)
      _button_ObserverMode:SetShow(true)
      _button_SavageOut:SetShow(true)
      _button_Volunteer:SetShow(false)
      _deadQuestion:SetShow(false)
      ResurrectionTime = revivalTime
      Panel_DeadMessage:SetShow(true, false)
      deadMessage_Animation()
      return 
    end
    if ToClient_getJoinGuildBattle() then
      _button_SiegeIng:SetShow(false)
      _button_MoveExploration:SetShow(false)
      _button_MoveTown:SetShow(false)
      _button_AdvancedBase:SetShow(false)
      _text_AdvancedBaseAlert:SetShow(false)
      _text_reviveNotify:SetShow(false)
      _button_GuildSpawn:SetShow(false)
      _useCashItemBG:SetShow(false)
      _checkBoxUseCache:SetShow(false)
      _button_Immediate:SetShow(true)
      _button_Immediate:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_DEADMESSAGE_IMMEDIATE_RESURRECTION"))
      _text_ImmediateCount:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PVPBATTLE_IMMEDIATECOUNT_TEXT"))
      _text_ImmediateCount:SetShow(true)
      _button_LocalWar:SetShow(false)
      _button_ObserverMode:SetShow(true)
      _button_SavageOut:SetShow(false)
      _button_Volunteer:SetShow(false)
      _deadQuestion:SetShow(false)
      ResurrectionTime = revivalTime
      Panel_DeadMessage:SetShow(true, false)
      deadMessage_Animation()
      return 
    end
    if isPvPMatchRevive then
      _button_SiegeIng:SetShow(false)
      _button_MoveExploration:SetShow(false)
      _button_MoveTown:SetShow(false)
      _button_AdvancedBase:SetShow(false)
      _text_AdvancedBaseAlert:SetShow(false)
      _text_reviveNotify:SetShow(false)
      _button_Immediate:SetShow(true)
      _button_GuildSpawn:SetShow(false)
      _button_Immediate:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_DEADMESSAGE_IMMEDIATE_RESURRECTION"))
      _useCashItemBG:SetShow(false)
      _checkBoxUseCache:SetShow(false)
      _text_ImmediateCount:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PVPBATTLE_IMMEDIATECOUNT_TEXT"))
      _text_ImmediateCount:SetShow(true)
      _button_LocalWar:SetShow(false)
      _button_SavageOut:SetShow(false)
      _button_Volunteer:SetShow(false)
      _deadQuestion:SetShow(false)
      if attackerActorProxyWrapper == nil then
        _deadMessage:SetText(PAGetString(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_DisplayMsg"))
      else
        if isMilitia then
          _deadMessage:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_KilledDisplayMsg", "attackerName", PAGetString(Defines.StringSheet_GAME, "LUA_WARINFOMESSAGE_MILITIA")))
        else
          _deadMessage:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_KilledDisplayMsg", "attackerName", attackerActorProxyWrapper:getOriginalName()))
        end
      end
      ResurrectionTime = revivalTime
      Panel_DeadMessage:SetShow(true, false)
      deadMessage_Animation()
      return 
    end
    if ToClient_GetMyTeamNoLocalWar() ~= 0 then
      _button_SiegeIng:SetShow(false)
      _button_MoveExploration:SetShow(false)
      _button_MoveTown:SetShow(false)
      _button_AdvancedBase:SetShow(false)
      _text_AdvancedBaseAlert:SetShow(false)
      _text_reviveNotify:SetShow(false)
      _button_Immediate:SetShow(false)
      _button_GuildSpawn:SetShow(false)
      _useCashItemBG:SetShow(false)
      _checkBoxUseCache:SetShow(false)
      _text_ImmediateCount:SetShow(false)
      _button_LocalWar:SetShow(true)
      _button_SavageOut:SetShow(false)
      _button_Volunteer:SetShow(false)
      _deadQuestion:SetShow(false)
      Panel_DeadMessage:SetShow(true, false)
      return 
    end
    local regionInfo = getRegionInfoByPosition((selfProxy:get()):getPosition())
    if regionInfo:isPrison() or goToPrison() then
      _button_SiegeIng:SetShow(false)
      _button_MoveExploration:SetShow(false)
      _button_MoveTown:SetShow(false)
      _button_AdvancedBase:SetShow(false)
      _text_AdvancedBaseAlert:SetShow(false)
      _text_reviveNotify:SetShow(false)
      _button_Immediate:SetShow(false)
      _button_GuildSpawn:SetShow(false)
      _useCashItemBG:SetShow(false)
      _checkBoxUseCache:SetShow(false)
      _text_ImmediateCount:SetShow(false)
      _button_LocalWar:SetShow(false)
      _button_SavageOut:SetShow(false)
      _button_Volunteer:SetShow(false)
      _deadQuestion:SetShow(false)
      Panel_DeadMessage:SetShow(true, false)
      ResurrectionTime = 2
      return 
    end
    if ToClient_GetMyTeamNoLocalWar() == 0 and ToClient_getPlayNowSavageDefence() == false and ToClient_isSpecialCharacter() == true then
      _button_SiegeIng:SetShow(false)
      _button_MoveExploration:SetShow(false)
      _button_MoveTown:SetShow(false)
      _button_AdvancedBase:SetShow(false)
      _text_AdvancedBaseAlert:SetShow(false)
      _text_reviveNotify:SetShow(false)
      _button_Immediate:SetShow(true)
      _button_GuildSpawn:SetShow(false)
      _button_Immediate:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_DEADMESSAGE_IMMEDIATE_RESURRECTION"))
      _useCashItemBG:SetShow(false)
      _checkBoxUseCache:SetShow(false)
      _text_ImmediateCount:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_PVPBATTLE_IMMEDIATECOUNT_TEXT"))
      _text_ImmediateCount:SetShow(true)
      _button_LocalWar:SetShow(false)
      _button_SavageOut:SetShow(false)
      _button_Volunteer:SetShow(false)
      _deadQuestion:SetShow(false)
      if attackerActorProxyWrapper == nil then
        _deadMessage:SetText(PAGetString(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_DisplayMsg"))
      else
        if isMilitia then
          _deadMessage:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_KilledDisplayMsg", "attackerName", PAGetString(Defines.StringSheet_GAME, "LUA_WARINFOMESSAGE_MILITIA")))
        else
          _deadMessage:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_KilledDisplayMsg", "attackerName", attackerActorProxyWrapper:getOriginalName()))
        end
      end
      ResurrectionTime = revivalTime
      Panel_DeadMessage:SetShow(true, false)
      deadMessage_Animation()
      return 
    end
    isHasRestoreExperience = isHasRestoreExp
    local linkedSiegeRegionInfoWrapper = ToClient_getVillageSiegeRegionInfoWrapperByPosition((selfProxy:get()):getPosition())
    local isKingOrLordWarZone = (regionInfo:get()):isKingOrLordWarZone()
    local isVillageWarZone = (linkedSiegeRegionInfoWrapper:get()):isVillageWarZone()
    isSiegeBeingInDead = deadMessage_isSiegeBeingInCurrentPosition()
    local isArena = (regionInfo:get()):isArenaArea()
    local isMyChannelSiegeBeing = deadMessage_isSiegeBeingMyChannel()
    buttonAbleTime = -1
    isUseButtonAbleTime = false
    if (isSiegeBeingInDead and deadMessage_isInSiegeBattle()) or (selfProxy:get()):getVolunteerTeamNoForLua() ~= 0 then
      respawnTime = respawnTime / 1000
      local buttonDelayTime = respawnTime
      if buttonDelayTime ~= 0 then
        isUseButtonAbleTime = true
        buttonAbleTime = respawnTime
        _button_SiegeIng:SetEnable(false)
        _button_MoveExploration:SetEnable(false)
        _button_MoveTown:SetEnable(false)
        _button_AdvancedBase:SetEnable(false)
        _button_Immediate:SetEnable(false)
        _button_GuildSpawn:SetEnable(false)
        _button_Volunteer:SetEnable(false)
      end
      ResurrectionTime = respawnTime
      _regenTime:SetShow(true)
    else
      do
        ResurrectionTime = 0
        _regenTime:SetShow(false)
        local freeRevivalLevel = FromClient_getFreeRevivalLevel()
        local isFreeArea = (regionInfo:get()):isFreeRevivalArea()
        FGlobal_PopCloseWorldMap()
        local selfPlayerExp = (selfProxy:get()):getExp_s64()
        if isSkipDeathPenalty then
          local static = STATIC_DROP_ITEM[0]
          static:SetShow(true)
          static:SetText(PAGetString(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_NoDeathPenalty"))
        else
          do
            if (Defines.s64_const).s64_0 < selfPlayerExp and isArena == false then
              deadMessage_ExpDown()
            end
            Panel_DeadMessage:SetShow(true, false)
            deadMessage_Animation()
            local displayText = ""
            if attackerActorKeyRaw == selfProxy:getActorKey() then
              displayText = PAGetString(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_DisplayMsg")
            else
              if attackerActorProxyWrapper ~= nil then
                if isMilitia then
                  displayText = PAGetStringParam1(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_KilledDisplayMsg", "attackerName", PAGetString(Defines.StringSheet_GAME, "LUA_WARINFOMESSAGE_MILITIA"))
                else
                  displayText = PAGetStringParam1(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_KilledDisplayMsg", "attackerName", attackerActorProxyWrapper:getOriginalName())
                end
              else
                displayText = PAGetString(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_DisplayMsg")
              end
            end
            _deadMessage:SetText(displayText)
            _button_SiegeIng:SetShow(false)
            _button_MoveExploration:SetShow(true)
            _button_MoveTown:SetShow(true)
            _button_AdvancedBase:SetShow(false)
            _text_AdvancedBaseAlert:SetShow(false)
            _button_LocalWar:SetShow(false)
            _button_SavageOut:SetShow(false)
            _text_reviveNotify:SetShow(false)
            _button_Volunteer:SetShow(false)
            _button_GuildSpawn:SetShow(false)
            do
              if attackerActorProxyWrapper ~= nil then
                local isAttackPlayer = (attackerActorProxyWrapper:get()):isPlayer()
                if isAttackPlayer then
                  _deadQuestion:SetShow(true)
                else
                  _deadQuestion:SetShow(false)
                end
              end
              if FGlobal_IsCommercialService() then
                _button_Immediate:SetShow(true)
                _useCashItemBG:SetShow(true)
                if (selfProxy:get()):getLevel() <= freeRevivalLevel and isFreeArea then
                  _checkBoxUseCache:SetShow(false)
                  _useCashItemBG:SetShow(false)
                else
                  _checkBoxUseCache:SetShow(true)
                  _useCashItemBG:SetShow(true)
                end
                _button_Immediate:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_DEADMESSAGE_IMMEDIATE_RESURRECTION"))
                _text_ImmediateCount:SetShow(true)
                local setMessage = ""
                local revivalItemCount = ToClient_InventorySizeByProductCategory((CppEnums.ItemWhereType).eCashInventory, (CppEnums.ItemProductCategory).eItemProductCategory_Revival)
                if isFreeArea and (selfProxy:get()):getLevel() <= freeRevivalLevel then
                  setMessage = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_DEADMESSAGE_RESURRECTION_POSSIBLE", "freeRevivalLevel", freeRevivalLevel)
                else
                  if revivalItemCount <= 0 then
                    setMessage = PAGetString(Defines.StringSheet_GAME, "LUA_DEADMESSAGE_ITEM_RESURRECTION")
                  else
                    setMessage = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_DEADMESSAGE_GET_ITEM_RESURRECTION", "revivalItemCount", revivalItemCount)
                  end
                end
                _text_ImmediateCount:SetText(setMessage)
              else
                do
                  if isArena == true then
                    _button_Immediate:SetShow(true)
                    _button_Immediate:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_DEADMESSAGE_IMMEDIATE_RESURRECTION"))
                  else
                    _button_Immediate:SetShow(false)
                  end
                  _text_ImmediateCount:SetShow(false)
                  _useCashItemBG:SetShow(false)
                  _checkBoxUseCache:SetShow(false)
                  local temporaryWrapper = getTemporaryInformationWrapper()
                  local fortressSize = temporaryWrapper:getMyFortressSize()
                  if isMyChannelSiegeBeing == true then
                    if deadMessage_isInSiegeBattle() == true then
                      _button_Immediate:SetShow(false)
                      _text_ImmediateCount:SetShow(false)
                      _button_SiegeIng:SetShow(true)
                    else
                      if isSiegeBeingInDead == true then
                        _button_Immediate:SetShow(false)
                        _text_ImmediateCount:SetShow(false)
                      else
                        if isHasFortress() == true and isSiegeBeingInDead == false then
                          _text_reviveNotify:SetShow(true)
                        else
                          if getNoAccessArea() == false then
                            _button_MoveTown:SetShow(false)
                            _button_Immediate:SetShow(false)
                            _text_ImmediateCount:SetShow(false)
                          end
                        end
                      end
                    end
                    _deadQuestion:SetShow(false)
                    if (regionInfo:get()):isMajorSiegeBeing() or (linkedSiegeRegionInfoWrapper:get()):isMinorSiegeBeing() then
                      _button_MoveExploration:SetShow(false)
                    end
                    _button_Immediate:SetShow(false)
                    _text_ImmediateCount:SetShow(false)
                    if (selfProxy:get()):isVolunteer() then
                      _button_Volunteer:SetShow(true)
                    end
                    local myGuildInfo = ToClient_GetMyGuildInfoWrapper()
                    if myGuildInfo ~= nil then
                      local guildNo = myGuildInfo:getGuildNo_s64()
                      if ToClient_IsInSiegeBattle(guildNo) then
                        _button_ObserverMode:SetShow(true)
                      end
                    end
                  else
                    do
                      if getNoAccessArea() == false then
                        _button_Immediate:SetShow(false)
                        _text_ImmediateCount:SetShow(false)
                      end
                      local guildUnSealCount = guildstable_getUnsealGuildServantCount()
                      if guildUnSealCount ~= 0 then
                        for index = 0, guildUnSealCount - 1 do
                          local servantInfo = guildStable_getUnsealGuildServantAt(index)
                          if servantInfo ~= nil and (servantInfo:getVehicleType() == 34 or servantInfo:getVehicleType() == 44) then
                            _button_GuildSpawn:SetShow(true)
                          end
                        end
                      end
                      do
                        if (selfProxy:get()):isGuildMember() and (selfProxy:get()):isAdvancedBaseActorKey() then
                          _button_AdvancedBase:SetShow(true)
                          _text_AdvancedBaseAlert:SetShow(true)
                        end
                        revivalCacheItemCount = ToClient_InventorySizeByProductCategory((CppEnums.ItemWhereType).eCashInventory, (CppEnums.ItemProductCategory).eItemProductCategory_Revival)
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

deadMessage_UpdatePerFrame = function(deltaTime)
  -- function num : 0_8 , upvalues : isUseButtonAbleTime, buttonAbleTime, _button_SiegeIng, _button_MoveExploration, _button_MoveTown, _button_AdvancedBase, _button_Immediate, _button_GuildSpawn, _button_Volunteer, ResurrectionTime, CurrentTime, isSiegeBeingInDead, _regenTime, UI_ANI_ADV, UI_color, deadMessage_ClearDropItems, _button_ObserverMode
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil or not selfPlayer:isDead() then
    Panel_DeadMessage:SetShow(false, false)
    return 
  end
  if isUseButtonAbleTime then
    buttonAbleTime = buttonAbleTime - deltaTime
    if buttonAbleTime < 0 then
      isUseButtonAbleTime = false
      _button_SiegeIng:SetEnable(true)
      _button_MoveExploration:SetEnable(true)
      _button_MoveTown:SetEnable(true)
      _button_AdvancedBase:SetEnable(true)
      _button_Immediate:SetEnable(true)
      _button_GuildSpawn:SetEnable(true)
      _button_Volunteer:SetEnable(true)
    end
  end
  if ResurrectionTime > 0 then
    ResurrectionTime = ResurrectionTime - deltaTime
    local regenTime = (math.floor)(ResurrectionTime)
    if CurrentTime ~= regenTime then
      if isUseButtonAbleTime and not isSiegeBeingInDead then
        _regenTime:SetText(PAGetString(Defines.StringSheet_GAME, DEADMESSAGE_TEXT_RespawnWaitting))
      else
        _regenTime:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_RESPAWN_TIME", "regenTime", tostring(regenTime)))
      end
      CurrentTime = regenTime
      if regenTime <= 0 then
        if goToPrison() then
          deadMessage_Revival(enRespawnType.respawnType_TimeOver, 255, 0, (getSelfPlayer()):getRegionKey(), false, toInt64(0, 0))
          SetUIMode((Defines.UIMode).eUIMode_Default)
          return 
        end
        _regenTime:SetShow(false)
      end
    end
    if not isSiegeBeingInDead then
      if ((getSelfPlayer()):get()):getVolunteerTeamNoForLua() ~= 0 then
        Panel_DeadMessage:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
        do
          local aniInfo1 = Panel_DeadMessage:addColorAnimation(0, 1, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
          aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
          aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
          aniInfo1.IsChangeChild = true
          aniInfo1:SetHideAtEnd(true)
          aniInfo1:SetDisableWhileAni(true)
          deadMessage_ClearDropItems()
          deadMessage_Revival(enRespawnType.respawnType_TimeOver, 255, 0, (getSelfPlayer()):getRegionKey(), false, toInt64(0, 0))
          SetUIMode((Defines.UIMode).eUIMode_Default)
          local isObserverMode = false
          if ((getSelfPlayer()):get()):isCompetitionDefined() then
            isObserverMode = true
          end
          _button_ObserverMode:SetShow(isObserverMode)
          _regenTime:SetShow(false)
        end
      end
    end
  end
end

local undefinedEnchantLevel = 0
deadMessage_AddDropItem = function(itemName, count, enchantLevel, dropType)
  -- function num : 0_9 , upvalues : STATIC_DROP_ITEM, DROP_ITEM_COUNT, undefinedEnchantLevel, UI_color, UI_ANI_ADV
  if #STATIC_DROP_ITEM < DROP_ITEM_COUNT then
    return 
  end
  local strDropType = PAGetString(Defines.StringSheet_GAME, "LUA_DEADMESSAGE_DRIPTYPE1")
  if dropType == 1 then
    strDropType = PAGetString(Defines.StringSheet_GAME, "LUA_DEADMESSAGE_DRIPTYPE2")
  end
  local static = STATIC_DROP_ITEM[DROP_ITEM_COUNT]
  static:SetShow(true)
  if undefinedEnchantLevel ~= enchantLevel then
    static:SetText("+" .. enchantLevel .. " " .. itemName .. "[" .. count .. "]" .. " (" .. strDropType .. ")")
  else
    static:SetText(itemName .. "[" .. count .. "]" .. " (" .. strDropType .. ")")
  end
  static:SetFontColor(UI_color.C_FFD20000)
  local aniInfo5 = static:addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo5:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo5:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo5.IsChangeChild = true
  local aniInfo6 = static:addColorAnimation(3, 3.4, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo6:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo6:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo6.IsChangeChild = true
  DROP_ITEM_COUNT = DROP_ITEM_COUNT + 1
end

deadMessage_WeakEquipCantPushinventory = function(notify)
  -- function num : 0_10 , upvalues : STATIC_DROP_ITEM, DROP_ITEM_COUNT, UI_color, UI_ANI_ADV
  if #STATIC_DROP_ITEM < DROP_ITEM_COUNT then
    return 
  end
  local static = STATIC_DROP_ITEM[DROP_ITEM_COUNT]
  DROP_ITEM_COUNT = DROP_ITEM_COUNT + 1
  static:SetText(notify)
  static:SetFontColor(UI_color.C_FF96D4FC)
  static:SetShow(true)
  local aniInfo5 = static:addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo5:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo5:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo5.IsChangeChild = true
  local aniInfo6 = static:addColorAnimation(3, 3.4, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo6:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo6:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo6.IsChangeChild = true
end

deadMessage_WeakEquip = function(slotNo)
  -- function num : 0_11 , upvalues : STATIC_DROP_ITEM, DROP_ITEM_COUNT, CPP_slotNoString, UI_color, UI_ANI_ADV
  if #STATIC_DROP_ITEM < DROP_ITEM_COUNT then
    return 
  end
  local static = STATIC_DROP_ITEM[DROP_ITEM_COUNT]
  DROP_ITEM_COUNT = DROP_ITEM_COUNT + 1
  static:SetText(PAGetStringParam1(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_DownEnchantMsg", "enchantDownSlot", CPP_slotNoString[slotNo]))
  static:SetFontColor(UI_color.C_FF96D4FC)
  static:SetShow(true)
  local aniInfo5 = static:addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo5:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo5:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo5.IsChangeChild = true
  local aniInfo6 = static:addColorAnimation(3, 3.4, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo6:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo6:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo6.IsChangeChild = true
end

deadMessage_DestroyJewel = function(destoryJewel01, destoryJewel02, destoryJewel03, destoryJewel04, destoryJewel05)
  -- function num : 0_12 , upvalues : STATIC_DROP_ITEM, DROP_ITEM_COUNT, UI_color, UI_ANI_ADV
  if #STATIC_DROP_ITEM < DROP_ITEM_COUNT then
    return 
  end
  local jewelKey = {[0] = destoryJewel01, [1] = destoryJewel02, [2] = destoryJewel03, [3] = destoryJewel04, [4] = destoryJewel05}
  local jewelName = ""
  for idx = 0, #jewelKey do
    -- DECOMPILER ERROR at PC30: Unhandled construct in 'MakeBoolean' P1

    if jewelName ~= "" and jewelKey[idx] ~= nil and jewelKey[idx] ~= 0 then
      local itemStaticStatus = getItemEnchantStaticStatus(ItemEnchantKey(jewelKey[idx]))
      local itemName = itemStaticStatus:getName()
      jewelName = jewelName .. ", " .. itemName
    end
    do
      do
        jewelName = (getItemEnchantStaticStatus(ItemEnchantKey(jewelKey[idx]))):getName()
        -- DECOMPILER ERROR at PC45: LeaveBlock: unexpected jumping out DO_STMT

      end
    end
  end
  local static = STATIC_DROP_ITEM[DROP_ITEM_COUNT]
  static:SetShow(true)
  static:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_DEADMESSAGE_JEWELDESTROYED") .. " " .. jewelName)
  static:SetFontColor(UI_color.C_FFD20000)
  local aniInfo5 = static:addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo5:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo5:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo5.IsChangeChild = true
  local aniInfo6 = static:addColorAnimation(3, 3.4, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo6:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo6:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo6.IsChangeChild = true
  DROP_ITEM_COUNT = DROP_ITEM_COUNT + 1
end

deadMessage_ExpDown = function()
  -- function num : 0_13 , upvalues : STATIC_DROP_ITEM, UI_ANI_ADV, UI_color
  local static = STATIC_DROP_ITEM[0]
  local aniInfo5 = static:addColorAnimation(0, 0.5, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo5:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo5:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo5.IsChangeChild = true
  local aniInfo6 = static:addColorAnimation(3, 3.4, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo6:SetStartColor(UI_color.C_00FFFFFF)
  aniInfo6:SetEndColor(UI_color.C_FFFFFFFF)
  aniInfo6.IsChangeChild = true
end

deadMessage_ButtonPushed_MoveToVillage = function()
  -- function num : 0_14 , upvalues : _checkBoxUseCache, isHasRestoreExperience, deadMessage_ClearDropItems
  local selfProxy = getSelfPlayer()
  if selfProxy == nil then
    return 
  end
  local regionInfo = getRegionInfoByPosition((selfProxy:get()):getPosition())
  local linkedSiegeRegionInfoWrapper = ToClient_getVillageSiegeRegionInfoWrapperByPosition((selfProxy:get()):getPosition())
  local isVillageWarZone = (linkedSiegeRegionInfoWrapper:get()):isVillageWarZone()
  local isSiegeHasFortress = deadMessage_isSiegingGuildInCurrentPosition()
  local isKingOrLordWarZone = (regionInfo:get()):isKingOrLordWarZone()
  local isSiegeBeing = deadMessage_isSiegeBeingInCurrentPosition()
  local prevExp = (selfProxy:get()):getPrevExp_s64()
  local currentExp = (selfProxy:get()):getExp_s64()
  local isBadPlayer = false
  if (selfProxy:get()):getTendency() < 0 then
    isBadPlayer = true
  end
  local isCheck = _checkBoxUseCache:IsCheck()
  local isArena = (regionInfo:get()):isArenaArea()
  local freeRevivalLevel = FromClient_getFreeRevivalLevel()
  local isFreeArea = (regionInfo:get()):isFreeRevivalArea()
  if isCheck and isArena == false and (isHasRestoreExperience or currentExp < prevExp) then
    useCheckCacheItem(enRespawnType.respawnType_NearTown)
  else
    local contentString = PAGetString(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_RESPAWN_TO_VILLAGE")
    -- DECOMPILER ERROR at PC96: Unhandled construct in 'MakeBoolean' P1

    if isSiegeBeing and isKingOrLordWarZone ~= true then
      if (isVillageWarZone == true and isHasRestoreExperience) or currentExp < prevExp then
        contentString = contentString .. "\n" .. PAGetString(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_EXP_DOWN")
      end
      if ToClient_IsOpendDesertPK() and isBadPlayer == true and regionInfo:getVillainRespawnWaypointKey() ~= 0 then
        contentString = contentString .. "\n" .. PAGetString(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_BadPlayerMoveVillage")
      end
    end
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_RESPAWN_MB_TITLE"), content = contentString, functionYes = deadMessage_RevivalVillage_Confirm, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_1}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  end
  do
    deadMessage_ClearDropItems()
  end
end

deadMessage_RevivalVillage_Confirm = function()
  -- function num : 0_15
  deadMessage_Revival(enRespawnType.respawnType_NearTown, 255, 0, (getSelfPlayer()):getRegionKey(), false, toInt64(0, 0))
  SetUIMode((Defines.UIMode).eUIMode_Default)
end

deadMessage_ButtonPushed_Volunteer = function()
  -- function num : 0_16
  deadMessage_Revival(enRespawnType.respawnType_Volunteer, 255, 0, (getSelfPlayer()):getRegionKey(), false, toInt64(0, 0))
  SetUIMode((Defines.UIMode).eUIMode_Default)
end

deadMessage_ButtonPushed_MoveExploration = function()
  -- function num : 0_17 , upvalues : _checkBoxUseCache, isHasRestoreExperience, deadMessage_ClearDropItems
  local selfProxy = getSelfPlayer()
  if selfProxy == nil then
    return 
  end
  local regionInfo = getRegionInfoByPosition((selfProxy:get()):getPosition())
  local linkedSiegeRegionInfoWrapper = ToClient_getVillageSiegeRegionInfoWrapperByPosition((selfProxy:get()):getPosition())
  local isVillageWarZone = (linkedSiegeRegionInfoWrapper:get()):isVillageWarZone()
  local isKingOrLordWarZone = (regionInfo:get()):isKingOrLordWarZone()
  local isSiegeBeing = deadMessage_isSiegeBeingInCurrentPosition()
  local prevExp = (selfProxy:get()):getPrevExp_s64()
  local currentExp = (selfProxy:get()):getExp_s64()
  local isCheck = _checkBoxUseCache:IsCheck()
  local freeRevivalLevel = FromClient_getFreeRevivalLevel()
  local isFreeArea = (regionInfo:get()):isFreeRevivalArea()
  local isArena = (regionInfo:get()):isArenaArea()
  if isCheck and isArena == false and (isHasRestoreExperience or currentExp < prevExp) then
    useCheckCacheItem(enRespawnType.respawnType_Exploration)
  else
    local contentString = PAGetString(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_RESPAWN_TO_EXPLORE")
    if not isSiegeBeing or ((isVillageWarZone == true and isHasRestoreExperience) or currentExp < prevExp) then
      contentString = contentString .. "\n" .. PAGetString(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_EXP_DOWN")
    end
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_RESPAWN_MB_TITLE"), content = contentString, functionYes = deadMessage_RevivalExploration_Confirm, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_1}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  end
  do
    deadMessage_ClearDropItems()
  end
end

deadMessage_RevivalExploration_Confirm = function()
  -- function num : 0_18
  deadMessage_Revival(enRespawnType.respawnType_Exploration, 255, 0, (getSelfPlayer()):getRegionKey(), false, toInt64(0, 0))
  SetUIMode((Defines.UIMode).eUIMode_Default)
end

deadMessage_ButtonPushed_Immediate = function()
  -- function num : 0_19 , upvalues : isPvPMatchRevive, deadMessage_ClearDropItems
  local revivalItemCount = 0
  revivalItemCount = ToClient_InventorySizeByProductCategory((CppEnums.ItemWhereType).eCashInventory, (CppEnums.ItemProductCategory).eItemProductCategory_Revival)
  local selfProxy = getSelfPlayer()
  if selfProxy == nil then
    return 
  end
  local regionInfo = getRegionInfoByPosition((selfProxy:get()):getPosition())
  local isArena = (regionInfo:get()):isArenaArea()
  local isCompetition = (selfProxy:get()):isCompetitionDefined()
  local isGuildBattle = ToClient_getJoinGuildBattle()
  local freeRevivalLevel = FromClient_getFreeRevivalLevel()
  local isFreeArea = (regionInfo:get()):isFreeRevivalArea()
  if isArena == true then
    deadMessage_Revival(enRespawnType.respawnType_Immediate, 0, (CppEnums.ItemWhereType).eCashInventory, (getSelfPlayer()):getRegionKey(), false, toInt64(0, 0))
  else
    if isFreeArea and (selfProxy:get()):getLevel() <= freeRevivalLevel then
      deadMessage_Revival(enRespawnType.respawnType_Immediate, 0, (CppEnums.ItemWhereType).eCashInventory, (getSelfPlayer()):getRegionKey(), false, toInt64(0, 0))
    else
      if isPvPMatchRevive == true or isCompetition == true then
        deadMessage_Revival(enRespawnType.respawnType_Immediate, 0, (CppEnums.ItemWhereType).eCashInventory, (getSelfPlayer()):getRegionKey(), isPvPMatchRevive, toInt64(0, 0))
      else
        if isGuildBattle then
          deadMessage_Revival(enRespawnType.respawnType_GuildBatle, 255, 0, (getSelfPlayer()):getRegionKey(), false, toInt64(0, 0))
        else
          if revivalItemCount == 1 then
            HandleClicked_Apply_CashRevivalItem(enRespawnType.respawnType_Immediate)
          else
            if revivalItemCount > 1 then
              CashRevivalBuy_Open(enRespawnType.respawnType_Immediate)
            else
              HandleClicked_Buy_CashRevivalItem(enRespawnType.respawnType_Immediate)
            end
          end
        end
      end
    end
  end
  FGlobal_ImmediatelyResurrection((selfProxy:get()):getMaxHp())
  deadMessage_ClearDropItems()
end

deadMessage_ButtonPushed_SiegeIng = function()
  -- function num : 0_20 , upvalues : deadMessage_ClearDropItems
  local buildingRegionKey = 0
  local currentBuildInfo = ToClient_getCurrentBuildingInfo()
  if currentBuildInfo == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_NOSIEGEBUILDING"))
    return 
  end
  if ToClient_IsVillageSiegeBeing() then
    buildingRegionKey = currentBuildInfo:getBuildingRegionKey()
  else
    buildingRegionKey = currentBuildInfo:getAffiliatedRegionKey()
  end
  deadMessage_Revival(enRespawnType.respawnType_InSiegeingFortress, 255, 0, buildingRegionKey, false, toInt64(0, 0))
  deadMessage_ClearDropItems()
end

deadMessage_ButtonPushed_AdvancedBase = function()
  -- function num : 0_21
  deadMessage_Revival(enRespawnType.respawnType_AdvancedBase, 255, 0, (getSelfPlayer()):getRegionKey(), false, toInt64(0, 0))
end

deadMessage_ButtonPushed_LocalWar = function()
  -- function num : 0_22
  deadMessage_Revival(enRespawnType.respawnType_LocalWar, 255, 0, (getSelfPlayer()):getRegionKey(), false, toInt64(0, 0))
end

deadMessage_ButtonPushed_SavageDefence = function()
  -- function num : 0_23
  local executeUnjoin = function()
    -- function num : 0_23_0
    ToClient_SavageDefenceUnJoin()
  end

  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_DEADMESSAGE_SAVAGEDEAD")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = executeUnjoin, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

deadMessage_RevivalGuildSpawn_Confirm = function()
  -- function num : 0_24
  local servantNo = 0
  local guildServantCount = guildServant_count()
  local selfPosition = ((getSelfPlayer()):get()):getPosition()
  local distance = 99999999
  for index = 0, guildServantCount do
    local servantInfo = guildStable_getServantByOrder(index)
    if servantInfo ~= nil then
      local giantActorPosition = getGiantActorPosition(servantInfo:getActorKeyRaw())
      if giantActorPosition ~= nil then
        local shipToPlayerDistance = ((Util.Math).calculateDistance)(giantActorPosition, selfPosition)
        if shipToPlayerDistance < distance then
          distance = shipToPlayerDistance
          servantNo = servantInfo:getServantNo()
        end
      end
    end
  end
  if servantNo == 0 then
    return 
  end
  deadMessage_Revival(enRespawnType.respawnType_GuildSpawn, 255, 0, (getSelfPlayer()):getRegionKey(), false, servantNo)
  SetUIMode((Defines.UIMode).eUIMode_Default)
end

deadMessage_ButtonPushed_GuildSpawn = function()
  -- function num : 0_25 , upvalues : _checkBoxUseCache, isHasRestoreExperience, deadMessage_ClearDropItems
  local selfProxy = getSelfPlayer()
  if selfProxy == nil then
    return 
  end
  local regionInfo = getRegionInfoByPosition((selfProxy:get()):getPosition())
  local linkedSiegeRegionInfoWrapper = ToClient_getVillageSiegeRegionInfoWrapperByPosition((selfProxy:get()):getPosition())
  local isVillageWarZone = (linkedSiegeRegionInfoWrapper:get()):isVillageWarZone()
  local isKingOrLordWarZone = (regionInfo:get()):isKingOrLordWarZone()
  local isSiegeBeing = deadMessage_isSiegeBeingInCurrentPosition()
  local prevExp = (selfProxy:get()):getPrevExp_s64()
  local currentExp = (selfProxy:get()):getExp_s64()
  local isCheck = _checkBoxUseCache:IsCheck()
  local isArena = (regionInfo:get()):isArenaArea()
  local freeRevivalLevel = FromClient_getFreeRevivalLevel()
  if isCheck and isArena == false and (isHasRestoreExperience or currentExp < prevExp) then
    useCheckCacheItem(enRespawnType.respawnType_GuildSpawn)
  else
    local contentString = PAGetString(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_RESPAWN_GUILDSPAWN")
    if not isSiegeBeing or ((isVillageWarZone == true and isHasRestoreExperience) or currentExp < prevExp) then
      contentString = contentString .. "\n" .. PAGetString(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_EXP_DOWN")
    end
    local messageboxData = {title = PAGetString(Defines.StringSheet_GAME, "DEADMESSAGE_TEXT_RESPAWN_MB_TITLE"), content = contentString, functionYes = deadMessage_RevivalGuildSpawn_Confirm, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_1}
    ;
    (MessageBox.showMessageBox)(messageboxData)
  end
  do
    deadMessage_ClearDropItems()
  end
end

useCheckCacheItem = function(respawnType)
  -- function num : 0_26
  local revivalItemCount = 0
  revivalItemCount = ToClient_InventorySizeByProductCategory((CppEnums.ItemWhereType).eCashInventory, (CppEnums.ItemProductCategory).eItemProductCategory_Revival)
  local selfProxy = getSelfPlayer()
  if selfProxy == nil then
    return 
  end
  local regionInfo = getRegionInfoByPosition((selfProxy:get()):getPosition())
  local isArena = (regionInfo:get()):isArenaArea()
  if isArena == true and respawnType == enRespawnType.respawnType_Immediate then
    deadMessage_Revival(enRespawnType.respawnType_Immediate, 0, (CppEnums.ItemWhereType).eCashInventory, (getSelfPlayer()):getRegionKey(), false, toInt64(0, 0))
  else
    if revivalItemCount == 1 then
      HandleClicked_Apply_CashRevivalItem(respawnType)
    else
      if revivalItemCount > 1 then
        CashRevivalBuy_Open(respawnType)
      else
        HandleClicked_Buy_CashRevivalItem(respawnType)
      end
    end
  end
end

deadMessage_SimpleTooltips = function(isShow)
  -- function num : 0_27 , upvalues : _useCashItemBG
  local uiControl, name, desc = nil, nil, nil
  name = PAGetString(Defines.StringSheet_GAME, "LUA_DEADMESSAGE_TOOLTIP_NAME")
  desc = PAGetString(Defines.StringSheet_GAME, "LUA_DEADMESSAGE_TOOLTIP_DESC")
  uiControl = _useCashItemBG
  registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
  if isShow == true then
    TooltipSimple_Show(uiControl, name, desc)
  else
    TooltipSimple_Hide()
  end
end

deadMessage_PkPenalty_Tooltip = function(isShow)
  -- function num : 0_28 , upvalues : _deadQuestion
  if not isShow then
    TooltipSimple_Hide()
    return 
  end
  local name, desc, control = nil, nil, nil
  name = PAGetString(Defines.StringSheet_GAME, "LUA_DEADMESSAGE_PK_PENALTY_TOOLTIP_TITLE")
  if isGameTypeKorea() or isGameTypeJapan() then
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_DEADMESSAGE_PK_PENALTY_TOOLTIP_DESC")
  else
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_DEADMESSAGE_PK_PENALTY_TOOLTIP_DESC_OTHER")
  end
  control = _deadQuestion
  TooltipSimple_Show(control, name, desc)
end

deadMessage_ButtonPushed_ObserverMode = function()
  -- function num : 0_29 , upvalues : ResurrectionTime
  if Panel_DeadMessage:GetShow() then
    Panel_DeadMessage:SetShow(false)
  end
  observerCameraModeStart()
  ShowCommandFunc(ResurrectionTime)
end

deadMessage_ResurrectionTimeReturn = function(Rtime)
  -- function num : 0_30 , upvalues : ResurrectionTime, buttonAbleTime
  ResurrectionTime = Rtime
  buttonAbleTime = Rtime
end

FromClient_ResurrectionTimeResetByKingOrLordTentDestroy = function(notifyType, regionKeyRaw)
  -- function num : 0_31
  local regionInfoWrapper = getRegionInfoWrapper(regionKeyRaw)
  if regionInfoWrapper == nil then
    return 
  end
  deadMessage_ResurrectionTimeReturn(0)
end

deadMessage_registEventHandler = function()
  -- function num : 0_32 , upvalues : _button_MoveTown, _button_MoveExploration, _button_Immediate, _button_SiegeIng, _button_AdvancedBase, _button_LocalWar, _button_SavageOut, _button_GuildSpawn, _useCashItemBG, _button_ObserverMode, _button_Volunteer, _deadQuestion
  _button_MoveTown:addInputEvent("Mouse_LUp", "deadMessage_ButtonPushed_MoveToVillage()")
  _button_MoveExploration:addInputEvent("Mouse_LUp", "deadMessage_ButtonPushed_MoveExploration()")
  _button_Immediate:addInputEvent("Mouse_LUp", "deadMessage_ButtonPushed_Immediate()")
  _button_SiegeIng:addInputEvent("Mouse_LUp", "deadMessage_ButtonPushed_SiegeIng()")
  _button_AdvancedBase:addInputEvent("Mouse_LUp", "deadMessage_ButtonPushed_AdvancedBase()")
  _button_LocalWar:addInputEvent("Mouse_LUp", "deadMessage_ButtonPushed_LocalWar()")
  _button_SavageOut:addInputEvent("Mouse_LUp", "deadMessage_ButtonPushed_SavageDefence()")
  _button_GuildSpawn:addInputEvent("Mouse_LUp", "deadMessage_ButtonPushed_GuildSpawn()")
  _useCashItemBG:addInputEvent("Mouse_On", "deadMessage_SimpleTooltips( true )")
  _useCashItemBG:addInputEvent("Mouse_Out", "deadMessage_SimpleTooltips( false )")
  _useCashItemBG:setTooltipEventRegistFunc("deadMessage_SimpleTooltips( true )")
  _button_ObserverMode:addInputEvent("Mouse_LUp", "deadMessage_ButtonPushed_ObserverMode()")
  _button_Volunteer:addInputEvent("Mouse_LUp", "deadMessage_ButtonPushed_Volunteer()")
  _deadQuestion:addInputEvent("Mouse_On", "deadMessage_PkPenalty_Tooltip(true)")
  _deadQuestion:addInputEvent("Mouse_Out", "deadMessage_PkPenalty_Tooltip(false)")
end

deadMessage_registMessageHandler = function()
  -- function num : 0_33
  registerEvent("EventSelfPlayerDead", "deadMessage_Show")
  registerEvent("Event_DeadMessage_AddDropItem", "deadMessage_AddDropItem")
  registerEvent("Event_DeadMessage_WeakEquip", "deadMessage_WeakEquip")
  registerEvent("Event_DeadMessage_WeakEquipCantPushInventory", "deadMessage_WeakEquipCantPushinventory")
  registerEvent("Event_DeadMessage_DestroyJewel", "deadMessage_DestroyJewel")
  registerEvent("onScreenResize", "deadMessage_Resize")
end

Panel_DeadMessage:RegisterUpdateFunc("deadMessage_UpdatePerFrame")
deadMessage_Resize()
deadMessage_registEventHandler()
deadMessage_registMessageHandler()

