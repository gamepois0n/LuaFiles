-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\wharf\panel_window_wharflist.luac 

-- params : ...
-- function num : 0
Panel_Window_WharfList:SetShow(false, false)
Panel_Window_WharfList:setMaskingChild(true)
Panel_Window_WharfList:ActiveMouseEventEffect(true)
Panel_Window_WharfList:setGlassBackground(true)
Panel_Window_WharfList:RegisterShowEventFunc(true, "WharfListShowAni()")
Panel_Window_WharfList:RegisterShowEventFunc(false, "WharfListHideAni()")
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local wharfInvenAlert = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_SELL_WITHITEM_MSG")
WharfListShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV, UI_color
  local isShow = Panel_Window_WharfList:IsShow()
  if isShow == true then
    Panel_Window_WharfList:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
    local aniInfo1 = Panel_Window_WharfList:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
    aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
    aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
    aniInfo1:SetStartIntensity(3)
    aniInfo1:SetEndIntensity(1)
    aniInfo1.IsChangeChild = true
    aniInfo1:SetHideAtEnd(true)
    aniInfo1:SetDisableWhileAni(true)
  else
    do
      ;
      (UIAni.fadeInSCR_Down)(Panel_Window_WharfList)
      Panel_Window_WharfList:SetShow(true, false)
    end
  end
end

WharfListHideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color
  Inventory_SetFunctor(nil)
  Panel_Window_WharfList:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_Window_WharfList:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
  WharfList_ButtonClose()
end

local wharfList = {
_const = {eTypeSealed = 0, eTypeUnsealed = 1}
, 
_config = {
slot = {startX = 15, startY = 15, gapY = 158}
, 
icon = {startX = 0, startY = 0, startNameX = 5, startNameY = 120, startEffectX = -1, startEffectY = -1}
, 
unseal = {startX = 230, startY = 0, startButtonX = 25, startButtonY = 25, startIconX = 25, startIconY = 35}
, 
button = {startX = 180, startY = 0, startButtonX = 15, startButtonY = 10, gapY = 40, sizeY = 40, sizeYY = 10}
, slotCount = 4}
, _staticListBG = (UI.getChildControl)(Panel_Window_WharfList, "Static_ListBG"), _staticButtonListBG = (UI.getChildControl)(Panel_Window_WharfList, "Static_ButtonBG"), _staticUnsealBG = (UI.getChildControl)(Panel_Window_WharfList, "Static_UnsealBG"), _staticNoticeText = (UI.getChildControl)(Panel_Window_WharfList, "StaticText_Notice"), _staticSlotCount = (UI.getChildControl)(Panel_Window_WharfList, "StaticText_Slot_Count"), _scroll = (UI.getChildControl)(Panel_Window_WharfList, "Scroll_Slot_List"), _slots = (Array.new)(), _selectSlotNo = 0, _startSlotIndex = 0, _selectSceneIndex = -1, 
_unseal = {}
}
wharfList.init = function(self)
  -- function num : 0_2
  for ii = 0, (self._config).slotCount - 1 do
    local slot = {}
    slot.slotNo = ii
    slot.panel = Panel_Window_WharfList
    slot.button = (UI.createAndCopyBasePropertyControl)(Panel_Window_WharfList, "Static_Button", self._staticListBG, "WharfList_Slot_" .. ii)
    slot.effect = (UI.createAndCopyBasePropertyControl)(Panel_Window_WharfList, "Static_Button_Effect", slot.button, "WharfList_Slot_Effect_" .. ii)
    slot.icon = (UI.createAndCopyBasePropertyControl)(Panel_Window_WharfList, "Static_Icon", slot.button, "WharfList_Slot_Icon_" .. ii)
    slot.name = (UI.createAndCopyBasePropertyControl)(Panel_Window_WharfList, "StaticText_Name", slot.button, "WharfList_Slot_Name_" .. ii)
    slot.stateComa = (UI.createAndCopyBasePropertyControl)(Panel_Window_WharfList, "StaticText_Coma", slot.button, "WharfList_Slot_StateComa_" .. ii)
    slot.isSeized = (UI.createAndCopyBasePropertyControl)(Panel_Window_WharfList, "StaticText_Attachment", slot.button, "WharfList_Slot_Seize_" .. ii)
    local slotConfig = (self._config).slot
    ;
    (slot.button):SetPosX(slotConfig.startX)
    ;
    (slot.button):SetPosY(slotConfig.startY + slotConfig.gapY * ii)
    local iconConfig = (self._config).icon
    ;
    (slot.icon):SetPosX(iconConfig.startX)
    ;
    (slot.icon):SetPosY(iconConfig.startY)
    ;
    (slot.name):SetPosX(iconConfig.startNameX)
    ;
    (slot.name):SetPosY(iconConfig.startNameY)
    ;
    (slot.stateComa):SetPosX(iconConfig.startX)
    ;
    (slot.stateComa):SetPosY(iconConfig.startY)
    ;
    (slot.isSeized):SetPosX(iconConfig.startX)
    ;
    (slot.isSeized):SetPosY(iconConfig.startY)
    ;
    (slot.effect):SetPosX(iconConfig.startEffectX)
    ;
    (slot.effect):SetPosY(iconConfig.startEffectY)
    ;
    (slot.icon):ActiveMouseEventEffect(true)
    ;
    (slot.button):addInputEvent("Mouse_LUp", "WharfList_SlotSelect(" .. ii .. ")")
    ;
    (UIScroll.InputEventByControl)(slot.button, "WharfList_ScrollEvent")
    -- DECOMPILER ERROR at PC143: Confused about usage of register: R8 in 'UnsetPending'

    ;
    (self._slots)[ii] = slot
  end
  -- DECOMPILER ERROR at PC153: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._unseal)._button = (UI.createAndCopyBasePropertyControl)(Panel_Window_WharfList, "Static_Button", self._staticUnsealBG, "WharfList_Unseal_Button")
  -- DECOMPILER ERROR at PC162: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._unseal)._icon = (UI.createAndCopyBasePropertyControl)(Panel_Window_WharfList, "Static_Icon", self._staticUnsealBG, "WharfList_Unseal_Icon")
  local unsealConfig = (self._config).unseal
  ;
  ((self._unseal)._button):SetPosX(unsealConfig.startButtonX)
  ;
  ((self._unseal)._button):SetPosY(unsealConfig.startButtonY)
  ;
  ((self._unseal)._icon):SetPosX(unsealConfig.startIconX)
  ;
  ((self._unseal)._icon):SetPosY(unsealConfig.startIconY)
  ;
  ((self._unseal)._icon):SetIgnore(true)
  ;
  ((self._unseal)._button):addInputEvent("Mouse_LUp", "WharfList_ButtonOpen( 1, 0 )")
  self._buttonSeal = (UI.createAndCopyBasePropertyControl)(Panel_Window_WharfList, "Button_Seal", self._staticButtonListBG, "WharfList_Button_Seal")
  self._buttonCompulsionSeal = (UI.createAndCopyBasePropertyControl)(Panel_Window_WharfList, "Button_CompulsionSeal", self._staticButtonListBG, "WharfList_Button_CompulsionSeal")
  self._buttonUnseal = (UI.createAndCopyBasePropertyControl)(Panel_Window_WharfList, "Button_Unseal", self._staticButtonListBG, "WharfList_Button_Unseal")
  self._buttonRepair = (UI.createAndCopyBasePropertyControl)(Panel_Window_WharfList, "Button_Repair", self._staticButtonListBG, "WharfList_Button_Repair")
  self._buttonSell = (UI.createAndCopyBasePropertyControl)(Panel_Window_WharfList, "Button_Sell", self._staticButtonListBG, "WharfList_Button_Sell")
  self._buttonChangeName = (UI.createAndCopyBasePropertyControl)(Panel_Window_WharfList, "Button_ChangeName", self._staticButtonListBG, "WharfList_Button_ChangeName")
  self._buttonClearDeadCount = (UI.createAndCopyBasePropertyControl)(Panel_Window_WharfList, "Button_KillReset", self._staticButtonListBG, "WharfList_DeadCountReset")
  ;
  (self._scroll):SetControlPos(0)
  Panel_Window_WharfList:SetChildIndex(self._staticButtonListBG, 9999)
end

wharfList.update = function(self)
  -- function num : 0_3
  local servantCount = stable_count()
  if servantCount == 0 then
    (self._staticNoticeText):SetShow(true)
  else
    ;
    (self._staticNoticeText):SetShow(false)
    wharfList_SortDataupdate()
  end
  ;
  (self._staticSlotCount):SetText(stable_currentSlotCount() .. " / " .. stable_maxSlotCount())
  for ii = 0, (self._config).slotCount - 1 do
    local slot = (self._slots)[ii]
    slot.index = -1
    ;
    (slot.button):SetShow(false)
  end
  local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
  local regionName = regionInfo:getAreaName()
  local slotNo = 0
  for ii = self._startSlotIndex, servantCount - 1 do
    local sortIndex = wharfList_SortByWayPointKey(ii)
    local servantInfo = stable_getServant(sortIndex)
    if servantInfo ~= nil then
      local servantRegionName = servantInfo:getRegionName()
      if slotNo <= (self._config).slotCount - 1 then
        local slot = (self._slots)[slotNo]
        ;
        (slot.name):SetText(servantInfo:getName(ii) .. "\n(" .. servantInfo:getRegionName(ii) .. ")")
        ;
        (slot.icon):ChangeTextureInfoName(servantInfo:getIconPath1())
        ;
        (slot.stateComa):SetShow(false)
        ;
        (slot.isSeized):SetShow(false)
        if servantInfo:isSeized() then
          (slot.isSeized):SetShow(true)
        else
          if (CppEnums.ServantStateType).Type_Coma == servantInfo:getStateType() then
            (slot.stateComa):SetShow(true)
          end
        end
        ;
        (slot.button):SetShow(true)
        slot.index = ii
        slotNo = slotNo + 1
        if regionName == servantRegionName then
          (slot.button):SetMonoTone(false)
        else
          ;
          (slot.button):SetMonoTone(true)
        end
      end
    end
  end
  ;
  (self._staticUnsealBG):SetShow(false)
  local temporaryWrapper = getTemporaryInformationWrapper()
  local servantInfo = temporaryWrapper:getUnsealVehicle(stable_getServantType())
  if servantInfo ~= nil then
    ((self._unseal)._icon):ChangeTextureInfoName(servantInfo:getIconPath1())
    ;
    (self._staticUnsealBG):SetShow(true)
  end
  ;
  (UIScroll.SetButtonSize)(self._scroll, (self._config).slotCount, servantCount)
end

wharfList.registEventHandler = function(self)
  -- function num : 0_4
  (UIScroll.InputEvent)(self._scroll, "WharfList_ScrollEvent")
  Panel_Window_WharfList:addInputEvent("Mouse_UpScroll", "WharfList_ScrollEvent( true  )")
  Panel_Window_WharfList:addInputEvent("Mouse_DownScroll", "WharfList_ScrollEvent( false )")
  ;
  (self._buttonSeal):addInputEvent("Mouse_LUp", "WharfList_Seal( false )")
  ;
  (self._buttonCompulsionSeal):addInputEvent("Mouse_LUp", "WharfList_Seal( true  )")
  ;
  (self._buttonUnseal):addInputEvent("Mouse_LUp", "WharfList_Unseal()")
  ;
  (self._buttonRepair):addInputEvent("Mouse_LUp", "WharfList_Recovery()")
  ;
  (self._buttonSell):addInputEvent("Mouse_LUp", "WharfList_SellToNpc()")
  ;
  (self._buttonChangeName):addInputEvent("Mouse_LUp", "WharfList_ChangeName()")
  ;
  (self._buttonClearDeadCount):addInputEvent("Mouse_LUp", "WharfList_ClearDeadCount()")
end

wharfList.registMessageHandler = function(self)
  -- function num : 0_5
  registerEvent("onScreenResize", "WharfList_Resize")
  registerEvent("FromClient_ServantUpdate", "WharfList_updateSlotData")
  registerEvent("FromClient_GroundMouseClick", "WharfList_ButtonClose")
end

WharfList_Resize = function()
  -- function num : 0_6 , upvalues : wharfList
  local screenX = getScreenSizeX()
  local screenY = getScreenSizeY()
  local self = wharfList
  local panelSize = 0
  local panelBGSize = 0
  local scrollSize = 0
  local slotCount = 4
  if screenY > 1000 then
    panelSize = 700
    panelBGSize = 660
    scrollSize = 660
    slotCount = 4
    if (self._slots)[3] ~= nil then
      (((self._slots)[3]).button):SetShow(true)
    end
  else
    panelSize = 540
    panelBGSize = 500
    scrollSize = 500
    slotCount = 3
    if (self._slots)[3] ~= nil then
      (((self._slots)[3]).button):SetShow(false)
    end
  end
  Panel_Window_WharfList:SetSize(Panel_Window_WharfList:GetSizeX(), panelSize)
  ;
  (self._staticListBG):SetSize((self._staticListBG):GetSizeX(), panelBGSize)
  ;
  (self._scroll):SetSize((self._scroll):GetSizeX(), scrollSize)
  -- DECOMPILER ERROR at PC62: Confused about usage of register: R7 in 'UnsetPending'

  ;
  (self._config).slotCount = slotCount
end

local beforeSlotNo, beforeEType = nil, nil
WharfList_ButtonOpen = function(eType, slotNo)
  -- function num : 0_7 , upvalues : wharfList, beforeSlotNo, beforeEType
  local self = wharfList
  if (self._staticButtonListBG):GetShow() and beforeSlotNo ~= nil and beforeSlotNo == slotNo and beforeEType ~= nil and beforeEType == eType then
    (self._staticButtonListBG):SetShow(false)
    return 
  end
  beforeSlotNo = slotNo
  beforeEType = eType
  ;
  (self._buttonSeal):SetShow(false)
  ;
  (self._buttonCompulsionSeal):SetShow(false)
  ;
  (self._buttonUnseal):SetShow(false)
  ;
  (self._buttonRepair):SetShow(false)
  ;
  (self._buttonSell):SetShow(false)
  ;
  (self._buttonChangeName):SetShow(false)
  ;
  (self._buttonClearDeadCount):SetShow(false)
  local buttonList = {}
  local button_Index = 0
  local buttonConfig = (self._config).button
  local positionX = 0
  local positionY = 0
  local regionInfo = getRegionInfoByPosition(((getSelfPlayer()):get()):getPosition())
  local regionName = regionInfo:getAreaName()
  if eType == (self._const).eTypeSealed then
    local index = WharfList_SelectSlotNo()
    local servantInfo = stable_getServant(index)
    if servantInfo == nil then
      return 
    end
    WharfList_SlotSound(slotNo)
    local servantRegionName = servantInfo:getRegionName()
    local getState = servantInfo:getStateType()
    local nowHp = servantInfo:getHp()
    local maxHp = servantInfo:getMaxHp()
    local nowMp = servantInfo:getMp()
    local maxMp = servantInfo:getMaxMp()
    local vehicleType = servantInfo:getVehicleType()
    if regionName == servantRegionName then
      buttonList[button_Index] = self._buttonUnseal
      button_Index = button_Index + 1
      if nowHp < maxHp then
        buttonList[button_Index] = self._buttonRepair
        button_Index = button_Index + 1
      end
      if nowHp == maxHp and nowMp < maxMp and ((CppEnums.VehicleType).Type_PersonTradeShip == vehicleType or (CppEnums.VehicleType).Type_PersonalBattleShip == vehicleType) then
        buttonList[button_Index] = self._buttonRepair
        button_Index = button_Index + 1
      end
      _PA_LOG("GG", "GGGGGGGGGGG:" .. tostring(vehicleType))
      if FGlobal_IsCommercialService() then
        buttonList[button_Index] = self._buttonChangeName
        button_Index = button_Index + 1
      end
      if servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Horse or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Camel or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Donkey or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Elephant then
        (self._buttonClearDeadCount):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLELIST_KILLCOUNTRESET"))
      else
        if servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Carriage or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_CowCarriage or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_RepairableCarriage then
          (self._buttonClearDeadCount):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLELIST_DESTROYCOUNTRESET"))
        else
          if servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Boat or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_Raft or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_FishingBoat or servantInfo:getVehicleType() == (CppEnums.VehicleType).Type_SailingBoat then
            (self._buttonClearDeadCount):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLELIST_DESTROYCOUNTRESET"))
          end
        end
      end
      if FGlobal_IsCommercialService() then
        buttonList[button_Index] = self._buttonClearDeadCount
        button_Index = button_Index + 1
      end
      buttonList[button_Index] = self._buttonSell
    else
      if nowHp == 0 then
        buttonList[button_Index] = self._buttonRepair
        button_Index = button_Index + 1
      end
    end
    positionX = (((self._slots)[slotNo]).button):GetPosX() + buttonConfig.startX
    positionY = (((self._slots)[slotNo]).button):GetPosY() + buttonConfig.startY
  else
    do
      if eType == (self._const).eTypeUnsealed then
        buttonList[button_Index] = self._buttonSeal
        buttonList[button_Index + 1] = self._buttonCompulsionSeal
        button_Index = button_Index + 2
        positionX = (self._staticUnsealBG):GetPosX() + (self._staticUnsealBG):GetSizeX()
        positionY = (self._staticUnsealBG):GetPosY() + 20
      end
      local sizeX = (self._staticButtonListBG):GetSizeX()
      local sizeY = buttonConfig.sizeYY
      if #buttonList > 0 then
        for index,button in pairs(buttonList) do
          button:SetShow(true)
          button:SetPosX(buttonConfig.startButtonX)
          button:SetPosY(buttonConfig.startButtonY + buttonConfig.gapY * index)
          sizeY = sizeY + buttonConfig.sizeY
        end
        ;
        (self._staticButtonListBG):SetPosX(positionX)
        ;
        (self._staticButtonListBG):SetPosY(positionY)
        ;
        (self._staticButtonListBG):SetSize(sizeX, sizeY)
        ;
        (self._staticButtonListBG):SetShow(true)
      else
        ;
        (self._staticButtonListBG):SetShow(false)
      end
      button_Index = 0
    end
  end
end

WharfList_ButtonClose = function()
  -- function num : 0_8 , upvalues : wharfList
  local self = wharfList
  if not (self._staticButtonListBG):GetShow() then
    return false
  end
  ;
  (self._staticButtonListBG):SetShow(false)
  return false
end

WharfList_SlotSelect = function(slotNo)
  -- function num : 0_9 , upvalues : wharfList
  if not Panel_Window_WharfList:GetShow() then
    return 
  end
  audioPostEvent_SystemUi(0, 0)
  local self = wharfList
  if (self._config).slotCount <= slotNo then
    self._startSlotIndex = slotNo - (self._config).slotCount
    self:update()
    return 
  end
  if ((self._slots)[slotNo]).index == -1 then
    return 
  end
  for ii = 0, (self._config).slotCount - 1 do
    (((self._slots)[ii]).effect):SetShow(false)
  end
  ;
  (((self._slots)[slotNo]).effect):SetShow(true)
  self._selectSlotNo = ((self._slots)[slotNo]).index
  local servantInfo = stable_getServant(WharfList_SelectSlotNo())
  if servantInfo == nil then
    return 
  end
  self._selectSceneIndex = Servant_ScenePushObject(servantInfo, self._selectSceneIndex)
  WharfInfo_Open()
  WharfList_ButtonOpen((self._const).eTypeSealed, slotNo)
end

WharfList_UnsealSlotSelect = function()
  -- function num : 0_10
  WharfList_ButtonClose()
  WharfList_ButtonOpen(0, slotNo)
end

WharfList_Seal = function(isCompulsionSeal)
  -- function num : 0_11 , upvalues : wharfList
  local self = wharfList
  audioPostEvent_SystemUi(0, 0)
  WharfList_ButtonClose()
  if isCompulsionSeal then
    local needGold = tostring(getServantCompulsionSealPrice())
    local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_STABLEFUNCTION_MESSAGEBOX_TITLE")
    local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_WHAFT_COMPULSIONSEALDESC", "needMoney", needGold)
    Servant_Confirm(messageBoxTitle, messageBoxMemo, WharfList_Button_CompulsionSeal, MessageBox_Empty_function)
  else
    do
      stable_seal(false)
    end
  end
end

WharfList_Button_CompulsionSeal = function()
  -- function num : 0_12
  stable_seal(true)
end

WharfList_Unseal = function()
  -- function num : 0_13
  audioPostEvent_SystemUi(0, 0)
  stable_unseal(WharfList_SelectSlotNo())
  WharfList_ButtonClose()
end

WharfList_Recovery = function()
  -- function num : 0_14
  local servantInfo = stable_getServant(WharfList_SelectSlotNo())
  if servantInfo == nil then
    return 
  end
  local needMoney = 0
  local confirmFunction = nil
  if servantInfo:getHp() == 0 then
    needMoney = Int64toInt32(servantInfo:getReviveCost_s64())
    confirmFunction = WharfList_ReviveXXX
  else
    needMoney = Int64toInt32(servantInfo:getRecoveryCost_s64())
    confirmFunction = WharfList_RecoveryXXX
  end
  Servant_Confirm(PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_STABEL_RECOVERY_NOTIFY_TITLE"), PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVANT_STABEL_CARRIAGE_RECOVERY_NOTIFY_MSG", "needMoney", needMoney), confirmFunction, MessageBox_Empty_function)
end

WharfList_RecoveryXXX = function()
  -- function num : 0_15
  audioPostEvent_SystemUi(5, 7)
  WharfList_ButtonClose()
  stable_recovery(WharfList_SelectSlotNo())
end

WharfList_ReviveXXX = function()
  -- function num : 0_16
  WharfList_ButtonClose()
  stable_revive(WharfList_SelectSlotNo())
end

WharfList_SellToNpc = function()
  -- function num : 0_17 , upvalues : wharfInvenAlert
  local servantInfo = stable_getServant(WharfList_SelectSlotNo())
  if servantInfo == nil then
    return 
  end
  local resultMoney = makeDotMoney(servantInfo:getSellCost_s64())
  Servant_Confirm(PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_STABEL_SELL_NOTIFY_TITLE"), PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVANT_STABEL_SELL_NOTIFY_MSG", "resultMoney", resultMoney) .. wharfInvenAlert, WharfList_SellToNpcXXX, MessageBox_Empty_function)
end

WharfList_SellToNpcXXX = function()
  -- function num : 0_18
  WharfList_ButtonClose()
  stable_changeToReward(WharfList_SelectSlotNo(), (CppEnums.ServantToRewardType).Type_Experience)
end

WharfList_ChangeName = function()
  -- function num : 0_19
  WharfList_ButtonClose()
  WharfRegister_OpenByChangeName()
end

WharfList_ClearDeadCount = function()
  -- function num : 0_20
  WharfList_ButtonClose()
  audioPostEvent_SystemUi(0, 0)
  local clearDeadCountDo = function()
    -- function num : 0_20_0
    stable_clearDeadCount(WharfList_SelectSlotNo())
  end

  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_STABLELIST_KILLCOUNTRESET_ALLRECOVERY")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_ALERT_NOTIFICATIONS"), content = messageBoxMemo, functionYes = clearDeadCountDo, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

WharfList_SelectSlotNo = function()
  -- function num : 0_21 , upvalues : wharfList
  local self = wharfList
  return wharfList_SortByWayPointKey(self._selectSlotNo)
end

WharfList_SlotSound = function(slotNo)
  -- function num : 0_22
  if isFirstSlot then
    isFirstSlot = false
  else
    audioPostEvent_SystemUi(1, 0)
  end
end

WharfList_ScrollEvent = function(isScrollUp)
  -- function num : 0_23 , upvalues : wharfList
  local self = wharfList
  local servantCount = stable_count()
  self._startSlotIndex = (UIScroll.ScrollEvent)(self._scroll, isScrollUp, (self._config).slotCount, servantCount, self._startSlotIndex, 1)
  self:update()
  ;
  (self._staticButtonListBG):SetShow(false)
end

local sortByExploreKey = {}
wharfList_ServantCountInit = function(nums)
  -- function num : 0_24 , upvalues : sortByExploreKey
  for i = 1, nums do
    -- DECOMPILER ERROR at PC10: Confused about usage of register: R5 in 'UnsetPending'

    sortByExploreKey[i] = {_index = nil, _servantNo = nil, _exploreKey = nil, _areaName = nil}
  end
end

wharfList_SortDataupdate = function()
  -- function num : 0_25 , upvalues : sortByExploreKey
  local maxWharfServantCount = stable_count()
  wharfList_ServantCountInit(maxWharfServantCount)
  for ii = 1, maxWharfServantCount do
    local servantInfo = stable_getServant(ii - 1)
    if servantInfo ~= nil then
      local regionKey = servantInfo:getRegionKeyRaw()
      local regionInfoWrapper = getRegionInfoWrapper(regionKey)
      -- DECOMPILER ERROR at PC22: Confused about usage of register: R8 in 'UnsetPending'

      ;
      (sortByExploreKey[ii])._index = ii - 1
      -- DECOMPILER ERROR at PC27: Confused about usage of register: R8 in 'UnsetPending'

      ;
      (sortByExploreKey[ii])._servantNo = servantInfo:getServantNo()
      -- DECOMPILER ERROR at PC32: Confused about usage of register: R8 in 'UnsetPending'

      ;
      (sortByExploreKey[ii])._exploreKey = regionInfoWrapper:getExplorationKey()
      -- DECOMPILER ERROR at PC37: Confused about usage of register: R8 in 'UnsetPending'

      ;
      (sortByExploreKey[ii])._areaName = regionInfoWrapper:getAreaName()
    end
  end
  local sortExplaoreKey = function(a, b)
    -- function num : 0_25_0
    if a._exploreKey < b._exploreKey then
      return true
    end
    return false
  end

  ;
  (table.sort)(sortByExploreKey, sortExplaoreKey)
  local myRegionKey = ((getSelfPlayer()):getRegionKey()):get()
  local myRegionInfoWrapper = getRegionInfoWrapper(myRegionKey)
  local myWayPointKey = myRegionInfoWrapper:getExplorationKey()
  local areaName = myRegionInfoWrapper:getAreaName()
  local matchCount = 0
  local areaSortCount = 0
  local temp = {}
  local temp1 = {}
  for i = 1, maxWharfServantCount do
    if myWayPointKey == (sortByExploreKey[i])._exploreKey then
      temp1[matchCount] = sortByExploreKey[i]
      matchCount = matchCount + 1
    end
  end
  for ii = 0, matchCount - 1 do
    if areaName == (temp1[ii])._areaName then
      temp[areaSortCount] = temp1[ii]
      areaSortCount = areaSortCount + 1
    end
  end
  for ii = 0, matchCount - 1 do
    if areaName ~= (temp1[ii])._areaName then
      temp[areaSortCount] = temp1[ii]
      areaSortCount = areaSortCount + 1
    end
  end
  for i = 1, maxWharfServantCount do
    if myWayPointKey ~= (sortByExploreKey[i])._exploreKey then
      temp[matchCount] = sortByExploreKey[i]
      matchCount = matchCount + 1
    end
  end
  for i = 1, maxWharfServantCount do
    -- DECOMPILER ERROR at PC121: Confused about usage of register: R14 in 'UnsetPending'

    sortByExploreKey[i] = temp[i - 1]
  end
  local affiliatedTerritory = function(exploerKey)
    -- function num : 0_25_1
    local territoryKey = -1
    if exploerKey > 0 and exploerKey <= 300 then
      territoryKey = 0
    else
      if exploerKey > 300 and exploerKey <= 600 then
        territoryKey = 1
      else
        if exploerKey > 600 and exploerKey <= 1100 then
          territoryKey = 2
        else
          if exploerKey > 1100 and exploerKey <= 1300 then
            territoryKey = 3
          else
            if exploerKey > 1300 and exploerKey < 1395 then
              territoryKey = 4
            else
              territoryKey = 5
            end
          end
        end
      end
    end
    return territoryKey
  end

  local sIndex = 0
  local sortByTerritory = function(territoryKey)
    -- function num : 0_25_2 , upvalues : maxWharfServantCount, affiliatedTerritory, sortByExploreKey, temp, sIndex
    for servantIndex = 1, maxWharfServantCount do
      -- DECOMPILER ERROR at PC15: Confused about usage of register: R5 in 'UnsetPending'

      if affiliatedTerritory((sortByExploreKey[servantIndex])._exploreKey) == territoryKey then
        temp[sIndex] = sortByExploreKey[servantIndex]
        sIndex = sIndex + 1
      end
    end
  end

  local myTerritoriKey = affiliatedTerritory(myWayPointKey)
  if myTerritoriKey == 0 then
    sortByTerritory(0)
    sortByTerritory(1)
    sortByTerritory(2)
    sortByTerritory(3)
    sortByTerritory(4)
    sortByTerritory(5)
  else
    if myTerritoriKey == 1 then
      sortByTerritory(1)
      sortByTerritory(0)
      sortByTerritory(2)
      sortByTerritory(3)
      sortByTerritory(4)
      sortByTerritory(5)
    else
      if myTerritoriKey == 2 then
        sortByTerritory(2)
        sortByTerritory(1)
        sortByTerritory(0)
        sortByTerritory(3)
        sortByTerritory(4)
        sortByTerritory(5)
      else
        if myTerritoriKey == 3 then
          sortByTerritory(3)
          sortByTerritory(1)
          sortByTerritory(0)
          sortByTerritory(2)
          sortByTerritory(4)
          sortByTerritory(5)
        else
          if myTerritoriKey == 4 then
            sortByTerritory(4)
            sortByTerritory(3)
            sortByTerritory(1)
            sortByTerritory(0)
            sortByTerritory(2)
            sortByTerritory(5)
          else
            if myTerritoriKey == 5 then
              sortByTerritory(5)
              sortByTerritory(0)
              sortByTerritory(2)
              sortByTerritory(3)
              sortByTerritory(4)
              sortByTerritory(1)
            end
          end
        end
      end
    end
  end
  for i = 1, maxWharfServantCount do
    -- DECOMPILER ERROR at PC266: Confused about usage of register: R18 in 'UnsetPending'

    sortByExploreKey[i] = temp[i - 1]
  end
end

wharfList_SortByWayPointKey = function(index)
  -- function num : 0_26 , upvalues : sortByExploreKey
  if index == nil then
    return nil
  else
    return (sortByExploreKey[index + 1])._index
  end
end

WharfList_updateSlotData = function()
  -- function num : 0_27 , upvalues : wharfList
  if not Panel_Window_WharfList:GetShow() then
    return 
  end
  local self = wharfList
  self:update()
end

WharfList_Open = function()
  -- function num : 0_28 , upvalues : wharfList
  if Panel_Window_WharfList:IsShow() then
    return 
  end
  local self = wharfList
  self._selectSlotNo = 0
  self._startSlotIndex = 0
  self:update()
  Panel_Window_WharfList:SetShow(true)
  for ii = 0, (self._config).slotCount - 1 do
    (((self._slots)[ii]).effect):SetShow(false)
  end
  if not Panel_Window_WharfList:GetShow() then
    Panel_Window_WharfList:SetShow(true)
  end
  self._selectSceneIndex = -1
end

WharfList_Close = function()
  -- function num : 0_29 , upvalues : wharfList
  if not Panel_Window_WharfList:GetShow() then
    return 
  end
  local self = wharfList
  Servant_ScenePopObject(self._selectSceneIndex)
  WharfList_ButtonClose()
  WharfInfo_Close()
  WharfRegister_Close()
  Panel_Window_WharfList:SetShow(false, false)
end

wharfList:init()
wharfList:registEventHandler()
wharfList:registMessageHandler()
WharfList_Resize()

