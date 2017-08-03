-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\stable\panel_window_stablefunction.luac 

-- params : ...
-- function num : 0
Panel_Window_StableFunction:SetShow(false, false)
Panel_Window_StableFunction:setMaskingChild(true)
Panel_Window_StableFunction:ActiveMouseEventEffect(true)
Panel_Window_StableFunction:RegisterShowEventFunc(true, "")
Panel_Window_StableFunction:RegisterShowEventFunc(false, "")
local _stableBG = (UI.getChildControl)(Panel_Window_StableFunction, "Static_StableTitle")
_stableBG:setGlassBackground(true)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local IM = CppEnums.EProcessorInputMode
local stableFunction = {
config = {}
, _buttonRegister = (UI.getChildControl)(Panel_Window_StableFunction, "Button_RegisterByItem"), _textRegist = (UI.getChildControl)(Panel_Window_StableFunction, "StaticText_Purpose"), _buttonMix = (UI.getChildControl)(Panel_Window_StableFunction, "Button_HorseMix"), _buttonMating = (UI.getChildControl)(Panel_Window_StableFunction, "Button_ListMating"), _buttonMarket = (UI.getChildControl)(Panel_Window_StableFunction, "Button_ListMarket"), _buttonExit = (UI.getChildControl)(Panel_Window_StableFunction, "Button_Exit"), _buttonLink = (UI.getChildControl)(Panel_Window_StableFunction, "Button_HorseLink")}
stableFunction.init = function(self)
  -- function num : 0_0 , upvalues : stableFunction
  (stableFunction._textRegist):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEFUNCTION_TEXTREGIST"))
  ;
  (stableFunction._textRegist):SetShow(false)
end

stableFunction.SetBtnPosition = function(self)
  -- function num : 0_1
  local btnRegisterSizeX = (self._buttonRegister):GetSizeX() + 23
  local btnRegisterTextPosX = btnRegisterSizeX - btnRegisterSizeX / 2 - (self._buttonRegister):GetTextSizeX() / 2
  local btnMixSizeX = (self._buttonMix):GetSizeX() + 23
  local btnMixTextPosX = btnMixSizeX - btnMixSizeX / 2 - (self._buttonMix):GetTextSizeX() / 2
  local btnMatingSizeX = (self._buttonMating):GetSizeX() + 23
  local btnMatingTextPosX = btnMatingSizeX - btnMatingSizeX / 2 - (self._buttonMating):GetTextSizeX() / 2
  local btnMarketSizeX = (self._buttonMarket):GetSizeX() + 23
  local btnMarketTextPosX = btnMarketSizeX - btnMarketSizeX / 2 - (self._buttonMarket):GetTextSizeX() / 2
  local btnExitSizeX = (self._buttonExit):GetSizeX() + 23
  local btnExitTextPosX = btnExitSizeX - btnExitSizeX / 2 - (self._buttonExit):GetTextSizeX() / 2
  local btnLinkSizeX = (self._buttonLink):GetSizeX() + 23
  local btnLinkTextPosX = btnLinkSizeX - btnLinkSizeX / 2 - (self._buttonLink):GetTextSizeX() / 2
  ;
  (self._buttonRegister):SetTextSpan(btnRegisterTextPosX, 5)
  ;
  (self._buttonMix):SetTextSpan(btnMixTextPosX, 5)
  ;
  (self._buttonMating):SetTextSpan(btnMatingTextPosX, 5)
  ;
  (self._buttonMarket):SetTextSpan(btnMarketTextPosX, 5)
  ;
  (self._buttonExit):SetTextSpan(btnExitTextPosX, 5)
  ;
  (self._buttonLink):SetTextSpan(btnLinkTextPosX, 5)
end

stableFunction.registEventHandler = function(self)
  -- function num : 0_2
  (self._buttonRegister):addInputEvent("Mouse_LUp", "StableFunction_Button_RegisterReady()")
  ;
  (self._buttonMating):addInputEvent("Mouse_LUp", "StableFunction_Button_Mating()")
  ;
  (self._buttonMarket):addInputEvent("Mouse_LUp", "StableFunction_Button_Market()")
  ;
  (self._buttonMix):addInputEvent("Mouse_LUp", "StableFunction_Button_Mix()")
  ;
  (self._buttonLink):addInputEvent("Mouse_LUp", "StableFunction_Button_Link()")
  ;
  (self._buttonExit):addInputEvent("Mouse_LUp", "StableFunction_Close()")
end

stableFunction.registMessageHandler = function(self)
  -- function num : 0_3
  registerEvent("onScreenResize", "StableFunction_Resize")
  registerEvent("FromClient_ServantUpdate", "StableFunction_RegisterAck")
end

StableFunction_Resize = function()
  -- function num : 0_4 , upvalues : stableFunction, _stableBG
  local self = stableFunction
  local screenX = getScreenSizeX()
  local screenY = getScreenSizeY()
  Panel_Window_StableFunction:SetSize(screenX, Panel_Window_StableFunction:GetSizeY())
  _stableBG:SetSize(screenX, Panel_Window_StableFunction:GetSizeY())
  Panel_Window_StableFunction:ComputePos()
  _stableBG:ComputePos()
  ;
  (self._buttonRegister):ComputePos()
  ;
  (self._buttonMating):ComputePos()
  ;
  (self._buttonMarket):ComputePos()
  ;
  (self._buttonMix):ComputePos()
  ;
  (self._buttonExit):ComputePos()
  ;
  (self._textRegist):ComputePos()
  ;
  (self._buttonMix):ComputePos()
  ;
  (self._textRegist):SetSpanSize(0, -screenY * 3 / 4)
end

StableFunction_Button_RegisterReady = function(slotNo)
  -- function num : 0_5
  if Panel_Window_StableMarket:GetShow() then
    StableMarket_Close()
  end
  if Panel_Window_StableMating:GetShow() then
    StableMating_Close()
  end
  if Panel_Window_StableMix:GetShow() then
    StableMix_Close()
  end
  Inventory_SetFunctor(InvenFiler_Mapae, StableFunction_Button_Register, Servant_InventoryClose, nil)
  Inventory_ShowToggle()
  audioPostEvent_SystemUi(0, 0)
end

StableFunction_Button_Register = function(slotNo, itemWrapper, count_s64, inventoryType)
  -- function num : 0_6
  StableRegister_OpenByInventory(inventoryType, slotNo)
end

StableFunction_Button_Mating = function()
  -- function num : 0_7
  audioPostEvent_SystemUi(0, 0)
  StableList_ButtonClose()
  audioPostEvent_SystemUi(1, 0)
  StableMating_Open((CppEnums.AuctionType).AuctionGoods_ServantMating)
end

StableFunction_Button_Market = function()
  -- function num : 0_8
  audioPostEvent_SystemUi(0, 0)
  StableList_ButtonClose()
  audioPostEvent_SystemUi(1, 0)
  StableMarket_Open()
end

StableFunction_Button_Mix = function()
  -- function num : 0_9
  StableList_ButtonClose()
  StableMix_Open()
end

StableFunction_Button_Link = function()
  -- function num : 0_10
  StableList_ButtonClose()
  stableCarriage_Open()
end

StableFunction_RegisterAck = function()
  -- function num : 0_11 , upvalues : stableFunction
  if GetUIMode() == (Defines.UIMode).eUIMode_Default then
    return 
  end
  if Panel_Window_StableList:GetShow() == false then
    return 
  end
  if Panel_Window_StableStallion:GetShow() then
    return 
  end
  Inventory_SetFunctor(nil)
  InventoryWindow_Close()
  StableRegister_Close()
  local self = stableFunction
  ;
  (self._buttonRegister):EraseAllEffect()
end

local funcBtnCount = 0
local funcBtnRePos = {}
StableFunction_Open = function()
  -- function num : 0_12 , upvalues : stableFunction, funcBtnRePos, funcBtnCount
  if not stable_doHaveRegisterItem() then
    (stableFunction._textRegist):SetShow(false)
  end
  if Panel_Window_StableFunction:GetShow() then
    Servant_SceneOpen(Panel_Window_StableFunction)
    StableList_Open()
    ;
    (stableFunction._textRegist):SetShow(false)
    stableFunction:SetBtnPosition()
    funcBtnRePos = {}
    funcBtnCount = 0
    local self = stableFunction
    local talker = dialog_getTalker()
    local npcActorproxy = talker:get()
    local npcPosition = npcActorproxy:getPosition()
    local npcRegionInfo = getRegionInfoByPosition(npcPosition)
    local horseCheck = false
    local carriageCheck = false
    do
      local isCarriage = false
      for index = 0, stable_count() - 1 do
        local servantInfo = stable_getServant(index)
        if servantInfo:isLink() or (CppEnums.VehicleType).Type_Horse ~= servantInfo:getVehicleType() then
          local isUnLinkedHorse = npcRegionInfo:getAreaName() ~= servantInfo:getRegionName()
          if isUnLinkedHorse then
            horseCheck = true
          end
          if (CppEnums.VehicleType).Type_Carriage == servantInfo:getVehicleType() then
            local maxLinkCount = servantInfo:getLinkCount()
            local currentLinkCount = servantInfo:getCurrentLinkCount()
            if currentLinkCount < maxLinkCount then
              carriageCheck = true
            end
            isCarriage = true
          end
          -- DECOMPILER ERROR at PC90: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC90: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
      ;
      (self._buttonLink):SetShow(false)
      ;
      (self._buttonMix):SetShow(false)
      if stable_isCarriage() then
        (self._buttonLink):SetShow(true)
        -- DECOMPILER ERROR at PC110: Confused about usage of register: R8 in 'UnsetPending'

        funcBtnRePos[funcBtnCount] = self._buttonLink
        funcBtnCount = funcBtnCount + 1
      end
      if stable_isMix() then
        (self._buttonMix):SetShow(true)
        -- DECOMPILER ERROR at PC125: Confused about usage of register: R8 in 'UnsetPending'

        funcBtnRePos[funcBtnCount] = self._buttonMix
        funcBtnCount = funcBtnCount + 1
      end
      ;
      (self._buttonMating):SetShow(false)
      ;
      (self._buttonMarket):SetShow(false)
      if stable_isMating() then
        (self._buttonMating):SetShow(true)
        -- DECOMPILER ERROR at PC148: Confused about usage of register: R8 in 'UnsetPending'

        funcBtnRePos[funcBtnCount] = self._buttonMating
        funcBtnCount = funcBtnCount + 1
      end
      if stable_isMarket() then
        (self._buttonMarket):SetShow(true)
        -- DECOMPILER ERROR at PC163: Confused about usage of register: R8 in 'UnsetPending'

        funcBtnRePos[funcBtnCount] = self._buttonMarket
        funcBtnCount = funcBtnCount + 1
      end
      if stable_doHaveRegisterItem() then
        local messageboxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE")
        local messageboxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_STABEL_REGISTERITEM_MSG")
        local messageboxData = {title = messageboxTitle, content = messageboxMemo, functionApply = FGlobal_NeedStableRegistItem_Print, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
        ;
        (MessageBox.showMessageBox)(messageboxData)
        ;
        (stableFunction._buttonRegister):EraseAllEffect()
        ;
        (stableFunction._buttonRegister):AddEffect("UI_ArrowMark01", true, 25, -38)
      else
        (stableFunction._buttonRegister):EraseAllEffect()
      end
      -- DECOMPILER ERROR at PC214: Confused about usage of register: R8 in 'UnsetPending'

      funcBtnRePos[funcBtnCount] = self._buttonRegister
      funcBtnCount = funcBtnCount + 1
      -- DECOMPILER ERROR at PC221: Confused about usage of register: R8 in 'UnsetPending'

      funcBtnRePos[funcBtnCount] = self._buttonExit
      funcBtnCount = funcBtnCount + 1
      funcButtonRePosition(funcBtnCount)
      -- DECOMPILER ERROR: 10 unprocessed JMP targets
    end
  end
end

funcButtonRePosition = function(funcBtnCount)
  -- function num : 0_13 , upvalues : stableFunction, funcBtnRePos
  local gapX = 16
  local startPosX = getScreenSizeX() / 2 - ((stableFunction._buttonExit):GetSizeX() / 2 * funcBtnCount + (funcBtnCount - 1) * gapX)
  for index = 0, funcBtnCount - 1 do
    (funcBtnRePos[index]):SetPosX(startPosX + index * ((stableFunction._buttonExit):GetSizeX() + gapX))
  end
end

FGlobal_NeedStableRegistItem_Print = function()
  -- function num : 0_14 , upvalues : stableFunction
  if stable_doHaveRegisterItem() then
    (stableFunction._textRegist):SetShow(true)
  else
    ;
    (stableFunction._textRegist):SetShow(false)
  end
end

StableFunction_Close = function()
  -- function num : 0_15 , upvalues : stableFunction
  audioPostEvent_SystemUi(0, 0)
  local self = stableFunction
  ;
  (self._buttonRegister):EraseAllEffect()
  InventoryWindow_Close()
  StableList_Close()
  StableInfo_Close()
  StableShop_Close()
  StableMating_Close()
  StableMarket_Close()
  StableMix_Close()
  if not Panel_Window_StableFunction:GetShow() then
    return 
  end
  Servant_SceneClose(Panel_Window_StableFunction)
  Dialog_updateButtons(true)
end

StableFunction_Buttonclose = function()
  -- function num : 0_16
  Panel_Window_StableFunction:SetShow(false)
end

StableFunction_ButtonOpen = function()
  -- function num : 0_17
  Panel_Window_StableFunction:SetShow(true)
end

stableFunction:init()
stableFunction:registEventHandler()
stableFunction:registMessageHandler()
StableFunction_Resize()

