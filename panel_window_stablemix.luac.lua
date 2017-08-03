-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\stable\panel_window_stablemix.luac 

-- params : ...
-- function num : 0
Panel_Window_StableMix:SetShow(false, false)
Panel_Window_StableMix:setMaskingChild(true)
Panel_Window_StableMix:ActiveMouseEventEffect(true)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_WHERETYPE = CppEnums.ItemWhereType
local UI_TM = CppEnums.TextMode
local isContentsStallionEnable = ToClient_IsContentsGroupOpen("243")
local isContentsNineTierEnable = ToClient_IsContentsGroupOpen("80")
local stableMix = {_staticIcon1 = (UI.getChildControl)(Panel_Window_StableMix, "Static_ServantIcon_1"), _staticIcon2 = (UI.getChildControl)(Panel_Window_StableMix, "Static_ServantIcon_2"), _staticInfo1 = (UI.getChildControl)(Panel_Window_StableMix, "StaticText_Info1"), _staticInfo2 = (UI.getChildControl)(Panel_Window_StableMix, "StaticText_Info2"), _iconStallion1 = (UI.getChildControl)(Panel_Window_StableMix, "Static_iconStallion1"), _iconStallion2 = (UI.getChildControl)(Panel_Window_StableMix, "Static_iconStallion2"), _staticNotify = (UI.getChildControl)(Panel_Window_StableMix, "StaticText_Notify"), _editName = (UI.getChildControl)(Panel_Window_StableMix, "Edit_Naming"), _buttonMix = (UI.getChildControl)(Panel_Window_StableMix, "Button_Mix"), _buttonCancel = (UI.getChildControl)(Panel_Window_StableMix, "Button_Cancel"), _buttonClose = (UI.getChildControl)(Panel_Window_StableMix, "Button_Close"), _staticPrice = (UI.getChildControl)(Panel_Window_StableMix, "StaticText_Price"), _chkInven = (UI.getChildControl)(Panel_Window_StableMix, "RadioButton_Icon_Money"), _chkWare = (UI.getChildControl)(Panel_Window_StableMix, "RadioButton_Icon_Money2"), _invenMoney = (UI.getChildControl)(Panel_Window_StableMix, "Static_Text_Money"), _wareMoney = (UI.getChildControl)(Panel_Window_StableMix, "Static_Text_Money2"), _servantNo1 = nil, _servantNo2 = nil}
stableMix.init = function(self)
  -- function num : 0_0 , upvalues : UI_TM
  (self._staticInfo1):SetText("")
  ;
  (self._staticInfo2):SetText("")
  ;
  (self._staticIcon1):SetShow(false)
  ;
  (self._staticIcon2):SetShow(false)
  ;
  (self._editName):SetMaxInput(getGameServiceTypeServantNameLength())
  ;
  (self._editName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEINFO_EDITBOX_COMMENT"), true)
  ;
  (self._staticNotify):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (self._staticNotify):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SERVANTMIX_NOTIFY"))
  ;
  (self._staticNotify):SetShow(true)
  ;
  (self._editName):SetShow(false)
  Panel_Window_StableMix:SetPosX((getScreenSizeX() - Panel_Window_StableMix:GetSizeX()) / 2)
  Panel_Window_StableMix:SetPosY((getScreenSizeY() - Panel_Window_StableMix:GetSizeY()) / 3)
end

stableMix.update = function(self)
  -- function num : 0_1 , upvalues : isContentsStallionEnable
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    return 
  end
  local invenMoney = ((selfPlayer:get()):getInventory()):getMoney_s64()
  local wareMoney = warehouse_moneyFromNpcShop_s64()
  ;
  (self._staticIcon1):SetShow(false)
  ;
  (self._staticIcon2):SetShow(false)
  ;
  (self._staticInfo1):SetShow(false)
  ;
  (self._staticInfo2):SetShow(false)
  ;
  (self._iconStallion1):SetShow(false)
  ;
  (self._iconStallion2):SetShow(false)
  local matingServantPrice = getServantSelfMatingPrice()
  if self._servantNo1 ~= nil then
    local servantInfo1 = stable_getServantByServantNo(self._servantNo1)
    if servantInfo1 ~= nil then
      (self._staticIcon1):ChangeTextureInfoName(servantInfo1:getIconPath1())
      if isContentsStallionEnable then
        (self._iconStallion1):SetShow(true)
        local isStallion = servantInfo1:isStallion()
        if isStallion == true then
          (self._iconStallion1):SetMonoTone(false)
        else
          ;
          (self._iconStallion1):SetMonoTone(true)
        end
      end
      do
        do
          ;
          (self._staticInfo1):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. servantInfo1:getLevel() .. " " .. servantInfo1:getName())
          ;
          (self._staticInfo1):SetShow(true)
          ;
          (self._staticIcon1):SetShow(true)
          if self._servantNo2 ~= nil then
            local servantInfo2 = stable_getServantByServantNo(self._servantNo2)
            if servantInfo2 ~= nil then
              (self._staticIcon2):ChangeTextureInfoName(servantInfo2:getIconPath1())
              if isContentsStallionEnable then
                (self._iconStallion2):SetShow(true)
                local isStallion = servantInfo2:isStallion()
                if isStallion == true then
                  (self._iconStallion2):SetMonoTone(false)
                else
                  ;
                  (self._iconStallion2):SetMonoTone(true)
                end
              end
              do
                do
                  ;
                  (self._staticInfo2):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. "." .. servantInfo2:getLevel() .. " " .. servantInfo2:getName())
                  ;
                  (self._staticInfo2):SetShow(true)
                  ;
                  (self._staticIcon2):SetShow(true)
                  if self._servantNo1 ~= nil or self._servantNo2 ~= nil then
                    (self._staticNotify):SetShow(true)
                    ;
                    (self._editName):SetShow(false)
                  end
                  if self._servantNo1 ~= nil and self._servantNo2 ~= nil then
                    (self._staticNotify):SetShow(false)
                    ;
                    (self._staticPrice):SetShow(true)
                    ;
                    (self._editName):SetShow(true)
                    ;
                    (self._staticPrice):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_STABLEMIX_MATINGPRICE", "matingServantPrice", makeDotMoney(matingServantPrice)))
                  end
                  ;
                  (self._chkInven):SetEnableArea(0, 0, (self._chkInven):GetTextSizeX() + (self._invenMoney):GetTextSizeX(), (self._chkInven):GetTextSizeY())
                  ;
                  (self._chkWare):SetEnableArea(0, 0, (self._chkWare):GetTextSizeX() + (self._wareMoney):GetTextSizeX(), (self._chkWare):GetTextSizeY())
                  ;
                  (self._invenMoney):SetText(makeDotMoney(invenMoney))
                  ;
                  (self._wareMoney):SetText(makeDotMoney(wareMoney))
                end
              end
            end
          end
        end
      end
    end
  end
end

stableMix.registEventHandler = function(self)
  -- function num : 0_2
  (self._buttonMix):addInputEvent("Mouse_LUp", "StableMix_Mix()")
  ;
  (self._buttonCancel):addInputEvent("Mouse_LUp", "StableMix_Close()")
  ;
  (self._buttonClose):addInputEvent("Mouse_LUp", "StableMix_Close()")
  ;
  (self._editName):addInputEvent("Mouse_LUp", "StableMix_ClearEdit()")
  ;
  (self._staticIcon1):addInputEvent("Mouse_RUp", "stableMix_ClearSlot( 1 )")
  ;
  (self._staticIcon2):addInputEvent("Mouse_RUp", "stableMix_ClearSlot( 2 )")
end

stableMix.registMessageHandler = function(self)
  -- function num : 0_3
  registerEvent("onScreenResize", "StableMix_Resize")
  registerEvent("FromClient_ServantMix", "FromClient_ServantMix")
end

StableMix_Mix = function()
  -- function num : 0_4 , upvalues : stableMix, UI_WHERETYPE, isContentsStallionEnable
  local self = stableMix
  local name = (self._editName):GetEditText()
  local isEditShow = (self._editName):GetShow()
  if not isEditShow then
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_STABLEMIX_SELECTMIX_PLS")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_STABLELIST_EXCHANGE_CONFIRM"), content = messageBoxMemo, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
    return 
  end
  do
    local editNameString = PAGetString(Defines.StringSheet_GAME, "LUA_STABLEINFO_EDITBOX_COMMENT")
    if editNameString == name then
      local messageBoxMemo = editNameString
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_STABLELIST_EXCHANGE_CONFIRM"), content = messageBoxMemo, functionApply = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
      return 
    end
    do
      if self._servantNo1 == nil or self._servantNo2 == nil then
        return 
      end
      local whereType = UI_WHERETYPE.eInventory
      local servantMix = function()
    -- function num : 0_4_0 , upvalues : self, whereType, UI_WHERETYPE, name
    if (self._chkInven):IsCheck() then
      whereType = UI_WHERETYPE.eInventory
    else
      whereType = UI_WHERETYPE.eWarehouse
    end
    stable_mix(self._servantNo1, self._servantNo2, whereType, name)
  end

      local messageBoxMemo = ""
      if isContentsStallionEnable then
        messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_STABLEMIX_TEXT_MIXHELPMSG")
      else
        messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_STABLEMIX_TEXT_MIXHELPMSG2")
      end
      local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_STABLELIST_EXCHANGE_CONFIRM"), content = messageBoxMemo, functionYes = servantMix, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
      ;
      (MessageBox.showMessageBox)(messageBoxData)
      ;
      (self._editName):SetEditText("", true)
    end
  end
end

stableMix_ClearSlot = function(slotType)
  -- function num : 0_5 , upvalues : stableMix
  local self = stableMix
  if slotType == 1 then
    self._servantNo1 = nil
    ;
    (self._staticPrice):SetShow(false)
    ;
    (self._editName):SetShow(false)
    ;
    (self._staticNotify):SetShow(true)
  else
    self._servantNo2 = nil
    ;
    (self._staticPrice):SetShow(false)
    ;
    (self._editName):SetShow(false)
    ;
    (self._staticNotify):SetShow(true)
  end
  self:update()
end

StableMix_Set = function(slotNo)
  -- function num : 0_6 , upvalues : stableMix
  local self = stableMix
  local servantInfo = stable_getServant(slotNo)
  if servantInfo == nil then
    return 
  end
  local vehicleType = servantInfo:getVehicleType()
  if (CppEnums.VehicleType).Type_Horse ~= vehicleType then
    return 
  end
  if servantInfo:isMale() then
    self._servantNo1 = servantInfo:getServantNo()
  else
    self._servantNo2 = servantInfo:getServantNo()
  end
  self:update()
end

StableMix_ClearEdit = function()
  -- function num : 0_7 , upvalues : stableMix
  local self = stableMix
  ;
  (self._editName):SetEditText("", true)
  SetFocusEdit(self._editName)
end

FromClient_ServantMix = function(servantNo1, servantNo2)
  -- function num : 0_8 , upvalues : stableMix
  local self = stableMix
  local servantInfo1 = stable_getServantByServantNo(servantNo1)
  local servantName1 = servantInfo1:getName()
  local servantInfo2 = stable_getServantByServantNo(servantNo2)
  local servantName2 = servantInfo2:getName()
  Proc_ShowMessage_Ack(PAGetStringParam2(Defines.StringSheet_GAME, "LUA_STABLEMIX_MIX_ACK", "servantName1", servantName1, "servantName2", servantName2))
  StableMix_Close()
end

StableMix_Open = function()
  -- function num : 0_9 , upvalues : stableMix
  local self = stableMix
  if Panel_Window_StableMix:GetShow() then
    return 
  end
  if Panel_Window_StableMarket:GetShow() then
    StableMarket_Close()
  end
  if Panel_Window_StableMating:GetShow() then
    StableMating_Close()
  end
  if Panel_AddToCarriage:GetShow() then
    stableCarriage_Close()
  end
  self:init()
  self:update()
  stableMix_ClearSlot(1)
  stableMix_ClearSlot(2)
  ;
  (self._chkInven):SetCheck(false)
  ;
  (self._chkWare):SetCheck(true)
  Panel_Window_StableMix:SetShow(true)
end

StableMix_Close = function()
  -- function num : 0_10
  local self = StableMix
  if not Panel_Window_StableMix:GetShow() then
    return 
  end
  Panel_Window_StableMix:SetShow(false)
end

StableMix_Resize = function()
  -- function num : 0_11 , upvalues : stableMix
  local self = stableMix
  local screenX = getScreenSizeX()
  local screenY = getScreenSizeY()
  Panel_Window_StableMix:ComputePos()
  ;
  (self._staticIcon1):ComputePos()
  ;
  (self._staticIcon2):ComputePos()
end

stableMix:init()
stableMix:registEventHandler()
stableMix:registMessageHandler()
StableMix_Resize()

