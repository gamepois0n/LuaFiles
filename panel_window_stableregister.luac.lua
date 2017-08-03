-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\stable\panel_window_stableregister.luac 

-- params : ...
-- function num : 0
Panel_Window_StableRegister:SetShow(false, false)
Panel_Window_StableRegister:setMaskingChild(true)
Panel_Window_StableRegister:ActiveMouseEventEffect(true)
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local IM = CppEnums.EProcessorInputMode
local UI_TM = CppEnums.TextMode
local stableRegister = {_staticIcon = (UI.getChildControl)(Panel_Window_StableRegister, "Static_Icon"), _staticHp = (UI.getChildControl)(Panel_Window_StableRegister, "Static_Hp"), _staticHpValue = (UI.getChildControl)(Panel_Window_StableRegister, "Static_HpValue"), _staticMp = (UI.getChildControl)(Panel_Window_StableRegister, "Static_Stamina"), _staticMpValue = (UI.getChildControl)(Panel_Window_StableRegister, "Static_StaminaValue"), _staticWeight = (UI.getChildControl)(Panel_Window_StableRegister, "Static_Weight"), _staticWeightValue = (UI.getChildControl)(Panel_Window_StableRegister, "Static_WeightValue"), _staticLife = (UI.getChildControl)(Panel_Window_StableRegister, "Static_Life"), _staticLifeValue = (UI.getChildControl)(Panel_Window_StableRegister, "Static_LifeValue"), _staticMaxMoveSpeed = (UI.getChildControl)(Panel_Window_StableRegister, "Static_MaxMoveSpeed"), _staticMaxMoveSpeedValue = (UI.getChildControl)(Panel_Window_StableRegister, "Static_MaxMoveSpeedValue"), _staticAcceleration = (UI.getChildControl)(Panel_Window_StableRegister, "Static_Acceleration"), _staticAccelerationValue = (UI.getChildControl)(Panel_Window_StableRegister, "Static_AccelerationValue"), _staticCorneringSpeed = (UI.getChildControl)(Panel_Window_StableRegister, "Static_CorneringSpeed"), _staticCorneringSpeedValue = (UI.getChildControl)(Panel_Window_StableRegister, "Static_CorneringSpeedValue"), _staticBrakeSpeed = (UI.getChildControl)(Panel_Window_StableRegister, "Static_BrakeSpeed"), _staticBrakeSpeedValue = (UI.getChildControl)(Panel_Window_StableRegister, "Static_BrakeSpeedValue"), _staticCreateServantNameBG = (UI.getChildControl)(Panel_Window_StableRegister, "Static_NamingPolicyBG"), _staticCreateServantNameTitle = (UI.getChildControl)(Panel_Window_StableRegister, "StaticText_NamingPolicyTitle"), _staticCreateServantName = (UI.getChildControl)(Panel_Window_StableRegister, "StaticText_NamingPolicy"), _staticMarketIcon = (UI.getChildControl)(Panel_Servant_Market_Input, "Static_Icon"), _staticMarketHp = (UI.getChildControl)(Panel_Servant_Market_Input, "Static_Hp"), _staticMarketHpValue = (UI.getChildControl)(Panel_Servant_Market_Input, "Static_HpValue"), _staticMarketMp = (UI.getChildControl)(Panel_Servant_Market_Input, "Static_Stamina"), _staticMarketMpValue = (UI.getChildControl)(Panel_Servant_Market_Input, "Static_StaminaValue"), _staticMarketWeight = (UI.getChildControl)(Panel_Servant_Market_Input, "Static_Weight"), _staticMarketWeightValue = (UI.getChildControl)(Panel_Servant_Market_Input, "Static_WeightValue"), _staticMarketLife = (UI.getChildControl)(Panel_Servant_Market_Input, "Static_Life"), _staticMarketLifeValue = (UI.getChildControl)(Panel_Servant_Market_Input, "Static_LifeValue"), _staticMarketMaxMoveSpeed = (UI.getChildControl)(Panel_Servant_Market_Input, "Static_MaxMoveSpeed"), _staticMarketMaxMoveSpeedValue = (UI.getChildControl)(Panel_Servant_Market_Input, "Static_MaxMoveSpeedValue"), _staticMarketAcceleration = (UI.getChildControl)(Panel_Servant_Market_Input, "Static_Acceleration"), _staticMarketAccelerationValue = (UI.getChildControl)(Panel_Servant_Market_Input, "Static_AccelerationValue"), _staticMarketCorneringSpeed = (UI.getChildControl)(Panel_Servant_Market_Input, "Static_CorneringSpeed"), _staticMarketCorneringSpeedValue = (UI.getChildControl)(Panel_Servant_Market_Input, "Static_CorneringSpeedValue"), _staticMarketBrakeSpeed = (UI.getChildControl)(Panel_Servant_Market_Input, "Static_BrakeSpeed"), _staticMarketBrakeSpeedValue = (UI.getChildControl)(Panel_Servant_Market_Input, "Static_BrakeSpeedValue"), _editEditName = (UI.getChildControl)(Panel_Window_StableRegister, "Edit_Naming"), _buttonOk = (UI.getChildControl)(Panel_Window_StableRegister, "Button_Yes"), _buttonClose = (UI.getChildControl)(Panel_Window_StableRegister, "Button_No"), _buttonQuestion = (UI.getChildControl)(Panel_Servant_Market_Input, "Button_Question"), _staticMinIcon = (UI.getChildControl)(Panel_Servant_Market_Input, "Static_Down"), _staticMaxIcon = (UI.getChildControl)(Panel_Servant_Market_Input, "Static_Up"), _staticMinPrice = (UI.getChildControl)(Panel_Servant_Market_Input, "StaticText_MinPrice"), _staticMaxPrice = (UI.getChildControl)(Panel_Servant_Market_Input, "StaticText_MaxPrice"), _textMinPriceValue = (UI.getChildControl)(Panel_Servant_Market_Input, "StaticText_MinPriceValue"), _textMaxPriceValue = (UI.getChildControl)(Panel_Servant_Market_Input, "StaticText_MaxPriceValue"), _textSelfPrice = (UI.getChildControl)(Panel_Servant_Market_Input, "StaticText_SelfPrice"), _buttonMarketOk = (UI.getChildControl)(Panel_Servant_Market_Input, "Button_Yes"), _buttonMarketClose = (UI.getChildControl)(Panel_Servant_Market_Input, "Button_No"), _editEditMarketName = (UI.getChildControl)(Panel_Servant_Market_Input, "Edit_Naming"), _radioButtonNormal = (UI.getChildControl)(Panel_Servant_Market_Input, "RadioButton_Normal"), _radioButtonMy = (UI.getChildControl)(Panel_Servant_Market_Input, "RadioButton_My"), _textDefaultPrice = (UI.getChildControl)(Panel_Servant_Market_Input, "StaticText_DefaultPrice"), _textRegister = (UI.getChildControl)(Panel_Window_StableRegister, "StaticText_DefaultPrice"), _staticPriceBG = (UI.getChildControl)(Panel_Servant_Market_Input, "Static_PriceBG"), _staticAllBG = (UI.getChildControl)(Panel_Servant_Market_Input, "Static_NamingBG"), _iconMale = (UI.getChildControl)(Panel_Window_StableRegister, "Static_MaleIcon"), _iconFemale = (UI.getChildControl)(Panel_Window_StableRegister, "Static_FemaleIcon"), _statusTitle = (UI.getChildControl)(Panel_Window_StableRegister, "StaticText_Status_Title"), _inventoryType = nil, _inventorySlotNo = nil, _characterKey = nil, _level = nil, _type = nil, _minPrice = nil, _maxPrice = nil}
stableRegister.init = function(self)
  -- function num : 0_0 , upvalues : UI_TM
  (self._editEditName):SetMaxInput(getGameServiceTypeServantNameLength())
  ;
  (self._staticIcon):SetShow(true)
  ;
  (self._staticHp):SetShow(true)
  ;
  (self._staticHpValue):SetShow(true)
  ;
  (self._staticMp):SetShow(true)
  ;
  (self._staticMpValue):SetShow(true)
  ;
  (self._staticWeight):SetShow(true)
  ;
  (self._staticWeightValue):SetShow(true)
  ;
  (self._staticLife):SetShow(true)
  ;
  (self._staticLifeValue):SetShow(true)
  ;
  (self._textRegister):SetShow(false)
  ;
  (self._staticMaxMoveSpeed):SetShow(true)
  ;
  (self._staticMaxMoveSpeedValue):SetShow(true)
  ;
  (self._staticAcceleration):SetShow(true)
  ;
  (self._staticAccelerationValue):SetShow(true)
  ;
  (self._staticCorneringSpeed):SetShow(true)
  ;
  (self._staticCorneringSpeedValue):SetShow(true)
  ;
  (self._staticBrakeSpeed):SetShow(true)
  ;
  (self._staticBrakeSpeedValue):SetShow(true)
  ;
  (self._editEditName):SetShow(true)
  ;
  (self._buttonOk):SetShow(true)
  ;
  (self._buttonClose):SetShow(true)
  if isGameTypeEnglish() or isGameTypeTaiwan() then
    (self._staticCreateServantName):SetTextMode(UI_TM.eTextMode_AutoWrap)
    ;
    (self._staticCreateServantName):SetText(PAGetString(Defines.StringSheet_GAME, "COMMON_CHARACTERCREATEPOLICY_EN"))
    ;
    (self._staticCreateServantName):SetShow(true)
    ;
    (self._staticCreateServantNameBG):SetShow(true)
    ;
    (self._staticCreateServantNameTitle):SetShow(true)
  else
    ;
    (self._staticCreateServantName):SetShow(false)
    ;
    (self._staticCreateServantNameBG):SetShow(false)
    ;
    (self._staticCreateServantNameTitle):SetShow(false)
  end
end

stableRegister.update = function(self)
  -- function num : 0_1
  local servantInfo = nil
  if (CppEnums.ServantRegist).eEventType_RegisterMating == self._type or (CppEnums.ServantRegist).eEventType_RegisterMarket == self._type then
    servantInfo = stable_getServant(StableList_SelectSlotNo())
  else
    servantInfo = stable_getServantByCharacterKey(self._characterKey, self._level)
  end
  if servantInfo == nil then
    return 
  end
  local vehicleType = servantInfo:getVehicleType()
  local isMale = servantInfo:isMale()
  ;
  (self._iconMale):SetShow(false)
  ;
  (self._iconFemale):SetShow(false)
  if (CppEnums.VehicleType).Type_Horse == vehicleType then
    if isMale then
      (self._iconMale):SetShow(true)
      ;
      (self._iconFemale):SetShow(false)
    else
      ;
      (self._iconMale):SetShow(false)
      ;
      (self._iconFemale):SetShow(true)
    end
  else
    ;
    (self._iconMale):SetShow(false)
    ;
    (self._iconFemale):SetShow(false)
  end
  if (CppEnums.VehicleType).Type_Carriage == vehicleType or (CppEnums.VehicleType).Type_CowCarriage == vehicleType or (CppEnums.VehicleType).Type_RepairableCarriage == vehicleType then
    (self._staticHp):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEREGISTER_CARRIAGE_HP"))
    ;
    (self._staticMp):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEREGISTER_CARRIAGE_MP"))
    ;
    (self._staticLife):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEREGISTER_CARRIAGE_LIFE"))
    ;
    (self._staticMarketHp):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEREGISTER_CARRIAGE_HP"))
    ;
    (self._staticMarketMp):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEREGISTER_CARRIAGE_MP"))
    ;
    (self._staticMarketLife):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEREGISTER_CARRIAGE_LIFE"))
    ;
    (self._statusTitle):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SERVANT_NAMING_INPUT_STATUS_TITLE"))
  else
    ;
    (self._staticHp):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEREGISTER_HP"))
    ;
    (self._staticMp):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEREGISTER_MP"))
    ;
    (self._staticLife):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEREGISTER_LIFE"))
    ;
    (self._staticMarketHp):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEREGISTER_HP"))
    ;
    (self._staticMarketMp):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEREGISTER_MP"))
    ;
    (self._staticMarketLife):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEREGISTER_LIFE"))
    ;
    (self._statusTitle):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_SERVANTREGIST_BASETITLE"))
  end
  ;
  (self._editEditName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEINFO_EDITBOX_COMMENT"), true)
  ;
  (self._staticIcon):ChangeTextureInfoName(servantInfo:getIconPath1())
  ;
  (self._staticHpValue):SetText(makeDotMoney(servantInfo:getMaxHp()))
  ;
  (self._staticMpValue):SetText(makeDotMoney(servantInfo:getMaxMp()))
  ;
  (self._staticWeightValue):SetText(makeDotMoney(servantInfo:getMaxWeight_s64() / (Defines.s64_const).s64_10000))
  ;
  (self._staticMaxMoveSpeedValue):SetText((string.format)("%.1f", servantInfo:getStat((CppEnums.ServantStatType).Type_MaxMoveSpeed) / 10000) .. "%")
  ;
  (self._staticAccelerationValue):SetText((string.format)("%.1f", servantInfo:getStat((CppEnums.ServantStatType).Type_Acceleration) / 10000) .. "%")
  ;
  (self._staticCorneringSpeedValue):SetText((string.format)("%.1f", servantInfo:getStat((CppEnums.ServantStatType).Type_CorneringSpeed) / 10000) .. "%")
  ;
  (self._staticBrakeSpeedValue):SetText((string.format)("%.1f", servantInfo:getStat((CppEnums.ServantStatType).Type_BrakeSpeed) / 10000) .. "%")
  if servantInfo:isPeriodLimit() then
    (self._staticLifeValue):SetText(servantInfo:getStaticExpiredTime() / 60 / 60 / 24 .. PAGetString(Defines.StringSheet_RESOURCE, "STABLE_INFO_TEXT_LIFETIME"))
    ;
    (self._staticMarketLifeValue):SetText(servantInfo:getStaticExpiredTime() / 60 / 60 / 24 .. PAGetString(Defines.StringSheet_RESOURCE, "STABLE_INFO_TEXT_LIFETIME"))
  else
    ;
    (self._staticLifeValue):SetText(PAGetString(Defines.StringSheet_RESOURCE, "STABLE_INFO_TEXT_LIFEVALUE"))
    ;
    (self._staticMarketLifeValue):SetText(PAGetString(Defines.StringSheet_RESOURCE, "STABLE_INFO_TEXT_LIFEVALUE"))
  end
  StableRegister_Tab(0)
  if self._minPrice ~= nil and self._maxPrice ~= nil then
    (self._editEditMarketName):SetShow(false)
    ;
    (self._textDefaultPrice):SetShow(true)
    ;
    (self._staticPriceBG):SetSize((self._staticPriceBG):GetSizeX(), 40)
    ;
    (self._staticAllBG):SetSize((self._staticAllBG):GetSizeX(), 175)
    ;
    (self._textDefaultPrice):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_CONSIGNMENTSALE_STATICBUYPRICE_0") .. "<PAColor0xFF00C0D7>" .. makeDotMoney(self._minPrice) .. "<PAOldColor>")
    Panel_Servant_Market_Input:SetSize(Panel_Servant_Market_Input:GetSizeX(), 250)
    ;
    (self._buttonMarketOk):SetSpanSize(((self._buttonMarketOk):GetSpanSize()).x, 10)
    ;
    (self._buttonMarketClose):SetSpanSize(((self._buttonMarketClose):GetSpanSize()).x, 10)
    ;
    (self._staticMinIcon):SetShow(false)
    ;
    (self._staticMaxIcon):SetShow(false)
    ;
    (self._staticMinPrice):SetShow(false)
    ;
    (self._staticMaxPrice):SetShow(false)
    ;
    (self._textMinPriceValue):SetShow(false)
    ;
    (self._textMaxPriceValue):SetShow(false)
    ;
    (self._staticMarketIcon):ChangeTextureInfoName(servantInfo:getIconPath1())
    ;
    (self._staticMarketHpValue):SetText(servantInfo:getMaxHp())
    ;
    (self._staticMarketMpValue):SetText(servantInfo:getMaxMp())
    ;
    (self._staticMarketWeightValue):SetText(tostring(servantInfo:getMaxWeight_s64() / (Defines.s64_const).s64_10000))
    ;
    (self._staticMarketMaxMoveSpeedValue):SetText((string.format)("%.1f", servantInfo:getStat((CppEnums.ServantStatType).Type_MaxMoveSpeed) / 10000) .. "%")
    ;
    (self._staticMarketAccelerationValue):SetText((string.format)("%.1f", servantInfo:getStat((CppEnums.ServantStatType).Type_Acceleration) / 10000) .. "%")
    ;
    (self._staticMarketCorneringSpeedValue):SetText((string.format)("%.1f", servantInfo:getStat((CppEnums.ServantStatType).Type_CorneringSpeed) / 10000) .. "%")
    ;
    (self._staticMarketBrakeSpeedValue):SetText((string.format)("%.1f", servantInfo:getStat((CppEnums.ServantStatType).Type_BrakeSpeed) / 10000) .. "%")
  else
    ;
    (self._textRegister):SetShow(false)
    ;
    (self._editEditName):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_STABLEINFO_EDITBOX_COMMENT"))
  end
end

stableRegister.registEventHandler = function(self)
  -- function num : 0_2
  (self._buttonOk):addInputEvent("Mouse_LUp", "StableRegister_Register()")
  ;
  (self._buttonMarketOk):addInputEvent("Mouse_LUp", "StableRegister_MarketRegister()")
  ;
  (self._buttonClose):addInputEvent("Mouse_LUp", "StableRegister_Close()")
  ;
  (self._buttonMarketClose):addInputEvent("Mouse_LUp", "StableMarketInput_Close()")
  ;
  (self._radioButtonNormal):addInputEvent("Mouse_LUp", "StableRegister_Tab( 0 )")
  ;
  (self._radioButtonMy):addInputEvent("Mouse_LUp", "StableRegister_Tab( 1 )")
  ;
  (self._editEditName):addInputEvent("Mouse_LUp", "StableRegister_ClearEdit( 1 )")
  ;
  (self._editEditName):RegistReturnKeyEvent("StableRegister_Register()")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelWindowStableRegister\" )")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelWindowStableRegister\", \"true\")")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelWindowStableRegister\", \"false\")")
end

stableRegister.registMessageHandler = function(self)
  -- function num : 0_3
  registerEvent("FromClient_ServantChildInfo", "StableRegister_OpenByMating")
  registerEvent("FromClient_ServantRegisterToAuction", "StableRegister_Close")
  registerEvent("onScreenResize", "StableRegister_Resize")
end

StableRegister_Resize = function()
  -- function num : 0_4 , upvalues : stableRegister
  local self = stableRegister
  local screenX = getScreenSizeX()
  local screenY = getScreenSizeY()
  Panel_Window_StableRegister:ComputePos()
  ;
  (self._staticIcon):ComputePos()
  ;
  (self._staticHp):ComputePos()
  ;
  (self._staticHpValue):ComputePos()
  ;
  (self._staticMp):ComputePos()
  ;
  (self._staticMpValue):ComputePos()
  ;
  (self._staticWeight):ComputePos()
  ;
  (self._staticWeightValue):ComputePos()
  ;
  (self._staticLife):ComputePos()
  ;
  (self._staticLifeValue):ComputePos()
  ;
  (self._staticMaxMoveSpeed):ComputePos()
  ;
  (self._staticMaxMoveSpeedValue):ComputePos()
  ;
  (self._staticAcceleration):ComputePos()
  ;
  (self._staticAccelerationValue):ComputePos()
  ;
  (self._staticCorneringSpeed):ComputePos()
  ;
  (self._staticCorneringSpeedValue):ComputePos()
  ;
  (self._staticBrakeSpeed):ComputePos()
  ;
  (self._staticBrakeSpeedValue):ComputePos()
end

StableRegister_Register = function()
  -- function num : 0_5 , upvalues : stableRegister
  audioPostEvent_SystemUi(0, 0)
  local self = stableRegister
  local name = (self._editEditName):GetEditText()
  local do_regist = function()
    -- function num : 0_5_0 , upvalues : self, name
    if (CppEnums.ServantRegist).eEventType_Mating == self._type then
      stable_receiveServantMatingChild(StableList_SelectSlotNo(), name)
    else
      if (CppEnums.ServantRegist).eEventType_Taming == self._type then
        ServantIcon_TamingServant_Registed()
        stable_register(name)
      else
        if (CppEnums.ServantRegist).eEventType_Inventory == self._type then
          stable_registerByItem(self._inventoryType, self._inventorySlotNo, name)
        else
          if (CppEnums.ServantRegist).eEventType_ChangeName == self._type then
            stable_changeName(StableList_SelectSlotNo(), name)
          else
            ;
            (UI.ASSERT)(false, "에러!")
          end
        end
      end
    end
    ;
    (self._editEditName):SetEditText("", true)
    Panel_Window_StableRegister:SetShow(false)
  end

  ClearFocusEdit()
  local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_STABLEREGISTER_THISNAMEREGISTER", "name", name)
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY"), content = messageBoxMemo, functionYes = do_regist, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

StableRegister_MarketRegister = function()
  -- function num : 0_6 , upvalues : stableRegister
  local self = stableRegister
  audioPostEvent_SystemUi(0, 0)
  local price = self._minPrice
  if (CppEnums.ServantRegist).eEventType_RegisterMarket == self._type then
    StableList_RegisterMarketXXXXXX(price)
    StableMarketInput_Close()
  else
    if (CppEnums.ServantRegist).eEventType_RegisterMating == self._type then
      if (CppEnums.TransferType).TransferType_Self == StableRegister_GetTransferType() then
        price = getServantSelfMatingPrice()
      end
      StableList_RegisterMatingXXXXX(price)
      StableMarketInput_Close()
    else
      ;
      (UI.ASSERT)(false, "에러!")
    end
  end
end

StableRegister_ClearEdit = function(clearIdx)
  -- function num : 0_7 , upvalues : stableRegister, IM
  local self = stableRegister
  if clearIdx == 1 then
    (self._editEditName):SetEditText("", true)
  else
  end
  if clearIdx == 2 then
    (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_ChattingInputMode)
  end
end

StableRegister_GetTransferType = function()
  -- function num : 0_8 , upvalues : stableRegister
  local self = stableRegister
  if (self._radioButtonNormal):IsCheck() then
    return (CppEnums.TransferType).TransferType_Normal
  else
    return (CppEnums.TransferType).TransferType_Self
  end
end

StableRegister_Tab = function(tab)
  -- function num : 0_9 , upvalues : stableRegister
  local self = stableRegister
  ;
  (self._staticMinIcon):SetShow(false)
  ;
  (self._staticMaxIcon):SetShow(false)
  ;
  (self._staticMinPrice):SetShow(false)
  ;
  (self._staticMaxPrice):SetShow(false)
  ;
  (self._textMinPriceValue):SetShow(false)
  ;
  (self._textMaxPriceValue):SetShow(false)
  ;
  (self._textSelfPrice):SetShow(false)
  ;
  (self._editEditMarketName):SetShow(false)
  ;
  (self._textDefaultPrice):SetShow(false)
  if (CppEnums.TransferType).TransferType_Normal == tab then
    (self._textDefaultPrice):SetShow(true)
  else
    ;
    (self._textSelfPrice):SetShow(true)
    ;
    (self._textSelfPrice):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_STABLEREGISTER_MATING_PRICE", "matingPrice", tostring(getServantSelfMatingPrice())))
  end
end

StableRegister_OpenByMating = function(characterKey)
  -- function num : 0_10 , upvalues : stableRegister
  if (CppEnums.ServantType).Type_Vehicle ~= stable_getServantType() then
    return 
  end
  local self = stableRegister
  self._type = (CppEnums.ServantRegist).eEventType_Mating
  self._characterKey = characterKey
  self._level = 1
  self._minPrice = nil
  self._maxPrice = nil
  StableRegister_Open()
end

StableRegister_OpenByTaming = function()
  -- function num : 0_11 , upvalues : stableRegister
  local self = stableRegister
  local characterKey = stable_getTamingServantCharacterKey()
  if characterKey == nil then
    return 
  end
  self._type = (CppEnums.ServantRegist).eEventType_Taming
  self._characterKey = characterKey
  self._level = 1
  self._minPrice = nil
  self._maxPrice = nil
  StableRegister_Open()
end

StableRegister_OpenByInventory = function(inventoryType, inventorySlotNo)
  -- function num : 0_12 , upvalues : stableRegister
  local self = stableRegister
  local itemWrapper = getInventoryItemByType(inventoryType, inventorySlotNo)
  if itemWrapper == nil then
    return 
  end
  self._type = (CppEnums.ServantRegist).eEventType_Inventory
  self._inventoryType = inventoryType
  self._inventorySlotNo = inventorySlotNo
  self._characterKey = (itemWrapper:getStaticStatus()):getObjectKey()
  self._level = 1
  self._minPrice = nil
  self._maxPrice = nil
  StableRegister_Open()
end

StableRegister_OpenByEventType = function(eventType)
  -- function num : 0_13 , upvalues : stableRegister
  local self = stableRegister
  local servantInfo = stable_getServant(StableList_SelectSlotNo())
  if servantInfo == nil then
    return 
  end
  self._type = eventType
  self._characterKey = servantInfo:getCharacterKey()
  self._level = servantInfo:getLevel()
  ;
  (self._radioButtonNormal):SetShow(false)
  ;
  (self._radioButtonMy):SetShow(false)
  if (CppEnums.ServantRegist).eEventType_RegisterMating == eventType then
    self._minPrice = servantInfo:getMinRegisterMatingPrice_s64()
    self._maxPrice = servantInfo:getMaxRegisterMatingPrice_s64()
    ;
    (self._radioButtonNormal):SetCheck(true)
    ;
    (self._radioButtonMy):SetCheck(false)
    ;
    (self._radioButtonNormal):SetShow(true)
    ;
    (self._radioButtonMy):SetShow(true)
    StableMarketInput_Open(eventType)
  else
    if (CppEnums.ServantRegist).eEventType_RegisterMarket == eventType then
      self._minPrice = servantInfo:getMinRegisterMarketPrice_s64()
      self._maxPrice = servantInfo:getMaxRegisterMarketPrice_s64()
      StableMarketInput_Open(eventType)
    else
      self._minPrice = nil
      self._maxPrice = nil
      StableRegister_Open()
    end
  end
end

StableRegister_Open = function()
  -- function num : 0_14 , upvalues : stableRegister
  local self = stableRegister
  self:update()
  Panel_Window_StableRegister:SetShow(true)
end

StableRegister_Close = function()
  -- function num : 0_15 , upvalues : IM
  audioPostEvent_SystemUi(0, 0)
  if not Panel_Window_StableRegister:GetShow() then
    return 
  end
  audioPostEvent_SystemUi(1, 1)
  Panel_Window_StableRegister:SetShow(false)
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
end

StableMarketInput_Open = function(marketType)
  -- function num : 0_16 , upvalues : stableRegister
  if Panel_Servant_Market_Input:GetShow() then
    return 
  end
  local self = stableRegister
  self:update()
  ;
  (self._radioButtonNormal):SetCheck(true)
  ;
  (self._radioButtonMy):SetCheck(false)
  if marketType == 5 then
    Panel_Servant_Market_Input:SetSize(Panel_Servant_Market_Input:GetSizeX(), 270)
    ;
    (self._staticPriceBG):SetSize((self._staticPriceBG):GetSizeX(), 60)
    ;
    (self._staticAllBG):SetSize((self._staticAllBG):GetSizeX(), 195)
    ;
    (self._buttonMarketOk):SetSpanSize(((self._buttonMarketOk):GetSpanSize()).x, 10)
    ;
    (self._buttonMarketClose):SetSpanSize(((self._buttonMarketClose):GetSpanSize()).x, 10)
  else
  end
  if marketType == 4 then
    Panel_Servant_Market_Input:SetShow(true)
  end
end

StableMarketInput_Close = function()
  -- function num : 0_17 , upvalues : IM
  audioPostEvent_SystemUi(0, 0)
  if not Panel_Servant_Market_Input:GetShow() then
    return 
  end
  audioPostEvent_SystemUi(1, 1)
  Panel_Servant_Market_Input:SetShow(false)
  ;
  (UI.Set_ProcessorInputMode)(IM.eProcessorInputMode_UiMode)
end

stableRegister:init()
stableRegister:registEventHandler()
stableRegister:registMessageHandler()
StableRegister_Resize()

