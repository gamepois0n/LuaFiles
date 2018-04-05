-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\goldentreasurebox\panel_treasurebox.luac 

-- params : ...
-- function num : 0
Panel_GoldenTreasureBox:SetShow(false, false)
Panel_GoldenTreasureBox:setMaskingChild(true)
Panel_GoldenTreasureBox:setGlassBackground(true)
Panel_GoldenTreasureBox:SetDragAll(true)
Panel_GoldenTreasureBox:RegisterShowEventFunc(true, "Panel_GoldenTreasureBox_ShowAni()")
Panel_GoldenTreasureBox:RegisterShowEventFunc(false, "Panel_GoldenTreasureBox_HideAni()")
local UI_TM = CppEnums.TextMode
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_color = Defines.Color
Panel_GoldenTreasureBox_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  (UIAni.fadeInSCR_Down)(Panel_GoldenTreasureBox)
  local aniInfo1 = Panel_GoldenTreasureBox:addScaleAnimation(0, 0.08, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.1)
  aniInfo1.AxisX = Panel_GoldenTreasureBox:GetSizeX() / 2
  aniInfo1.AxisY = Panel_GoldenTreasureBox:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_GoldenTreasureBox:addScaleAnimation(0.08, 0.15, UI_ANI_ADV.PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.1)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_GoldenTreasureBox:GetSizeX() / 2
  aniInfo2.AxisY = Panel_GoldenTreasureBox:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Panel_GoldenTreasureBox_HideAni = function()
  -- function num : 0_1 , upvalues : UI_PSFT, UI_ANI_ADV, UI_color
  Panel_GoldenTreasureBox:SetShowWithFade(UI_PSFT.PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_GoldenTreasureBox:addColorAnimation(0, 0.25, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

local treasureBox = {_fromWhereType, _fromSlotNo, materialWhereType; btnClose = (UI.getChildControl)(Panel_GoldenTreasureBox, "Button_CloseIcon"), closeBox_Head = (UI.getChildControl)(Panel_GoldenTreasureBox, "Static_CloseBox_Head"), closeBox_Body = (UI.getChildControl)(Panel_GoldenTreasureBox, "Static_CloseBox_Body"), openBox = (UI.getChildControl)(Panel_GoldenTreasureBox, "Static_OpenBox"), windowTitle = (UI.getChildControl)(Panel_GoldenTreasureBox, "StaticText_Title"), txt_Title = (UI.getChildControl)(Panel_GoldenTreasureBox, "Static_PartLine"), boxBG = (UI.getChildControl)(Panel_GoldenTreasureBox, "Static_BoxBg"), radioBG = (UI.getChildControl)(Panel_GoldenTreasureBox, "Static_RadioBtnBg"), radioBtn_NormalKey = (UI.getChildControl)(Panel_GoldenTreasureBox, "RadioButton_GoldenKey"), radioBtn_CashKey = (UI.getChildControl)(Panel_GoldenTreasureBox, "RadioButton_GoldenCashKey"), descBG = (UI.getChildControl)(Panel_GoldenTreasureBox, "Static_DescBg"), txt_Desc = (UI.getChildControl)(Panel_GoldenTreasureBox, "StaticText_1"), btn_Open = (UI.getChildControl)(Panel_GoldenTreasureBox, "Button_Open"), normalKeyCount = 0, cashKeyCount = 0, keyContentsEventType = 50, 
materialSlotNo = {[0] = nil, [1] = nil}
, _driganBoxItemKey = 750041, _driganKeyItemKey = 750042}
;
(treasureBox.btnClose):addInputEvent("Mouse_LUp", "Panel_GoldenTreasureBox_Close()")
;
(treasureBox.btn_Open):addInputEvent("Mouse_LUp", "GoldenTreasureBox_Open()")
GoldenTreasureData_Init = function(isDrigan)
  -- function num : 0_2 , upvalues : treasureBox, UI_TM
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  treasureBox.normalKeyCount = 0
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R1 in 'UnsetPending'

  treasureBox.cashKeyCount = 0
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (treasureBox.materialSlotNo)[0] = nil
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (treasureBox.materialSlotNo)[1] = nil
  GoldenKey_CheckInventory(isDrigan)
  ;
  (treasureBox.radioBtn_NormalKey):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TREASUREBOX_GOLDKEY", "count", treasureBox.normalKeyCount))
  ;
  (treasureBox.radioBtn_CashKey):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TREASUREBOX_GOLDENKEY", "count", treasureBox.cashKeyCount))
  local checkBtnTextSizeX = (math.max)((treasureBox.radioBtn_NormalKey):GetTextSizeX(), (treasureBox.radioBtn_CashKey):GetTextSizeX())
  ;
  (treasureBox.radioBtn_NormalKey):SetPosX((treasureBox.radioBG):GetSizeX() / 2 - checkBtnTextSizeX / 2 - 10)
  ;
  (treasureBox.radioBtn_CashKey):SetPosX((treasureBox.radioBG):GetSizeX() / 2 - checkBtnTextSizeX / 2 - 10)
  ;
  (treasureBox.txt_Desc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  if isDrigan then
    (treasureBox.radioBtn_NormalKey):SetPosY(432)
    ;
    (treasureBox.radioBtn_CashKey):SetShow(false)
    ;
    (treasureBox.windowTitle):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TREASUREBOX_DRIGANTITLE"))
    ;
    (treasureBox.radioBtn_NormalKey):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_TREASUREBOX_DRIGANGOLDKEY", "count", treasureBox.normalKeyCount))
    ;
    (treasureBox.txt_Desc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_TREASUREBOX_DRIGANDESC"))
  else
    ;
    (treasureBox.radioBtn_NormalKey):SetPosY(445)
    ;
    (treasureBox.radioBtn_CashKey):SetShow(true)
    ;
    (treasureBox.windowTitle):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GOLDENTREASUREBOX_TITLE"))
    ;
    (treasureBox.txt_Desc):SetText(PAGetString(Defines.StringSheet_RESOURCE, "PANEL_GOLDENTREASUREBOX_DESC"))
  end
  ;
  (treasureBox.descBG):SetSize((treasureBox.descBG):GetSizeX(), (treasureBox.txt_Desc):GetTextSizeY() + 20)
  Panel_GoldenTreasureBox:SetSize(Panel_GoldenTreasureBox:GetSizeX(), (treasureBox.txt_Title):GetSizeY() + (treasureBox.boxBG):GetSizeY() + (treasureBox.radioBG):GetSizeY() + (treasureBox.txt_Desc):GetTextSizeY() + 100)
  ;
  (treasureBox.btn_Open):ComputePos()
end

FromClient_RequestUseSealItemBox = function(fromWhereType, fromSlotNo)
  -- function num : 0_3 , upvalues : treasureBox
  Panel_TresureBox_RePos()
  Panel_GoldenTreasureBox:SetShow(true, true)
  ;
  (treasureBox.radioBtn_NormalKey):SetCheck(true)
  ;
  (treasureBox.radioBtn_CashKey):SetCheck(false)
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R2 in 'UnsetPending'

  treasureBox._fromWhereType = fromWhereType
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R2 in 'UnsetPending'

  treasureBox._fromSlotNo = fromSlotNo
  local isDrigan = treasureBox:CheckDriganBox(fromWhereType, fromSlotNo)
  GoldenTreasureData_Init(isDrigan)
end

treasureBox.CheckDriganBox = function(self, fromWhereType, fromSlotNo)
  -- function num : 0_4 , upvalues : treasureBox
  local itemWrapper = getInventoryItemByType(fromWhereType, fromSlotNo)
  do
    if itemWrapper ~= nil then
      local itemKey = (((itemWrapper:getStaticStatus()):get())._key):getItemKey()
      if treasureBox._driganBoxItemKey == itemKey then
        return true
      end
    end
    return false
  end
end

GoldenKey_CheckInventory = function(isDrigan)
  -- function num : 0_5 , upvalues : treasureBox
  local self = treasureBox
  local inventory = Inventory_GetCurrentInventory()
  local invenMaxSize = inventory:sizeXXX()
  if isDrigan then
    for index = 1, invenMaxSize - 1 do
      local itemWrapper = getInventoryItemByType(0, index)
      if itemWrapper ~= nil and self.keyContentsEventType == ((itemWrapper:getStaticStatus()):get()):getContentsEventType() then
        local itemKey = (((itemWrapper:getStaticStatus()):get())._key):getItemKey()
        if treasureBox._driganKeyItemKey == itemKey then
          self.normalKeyCount = self.normalKeyCount + Int64toInt32((itemWrapper:get()):getCount_s64())
          -- DECOMPILER ERROR at PC51: Confused about usage of register: R10 in 'UnsetPending'

          if (self.materialSlotNo)[0] == nil then
            (self.materialSlotNo)[0] = index
            break
          end
        end
      end
    end
  else
    do
      for index = 1, invenMaxSize - 1 do
        local itemWrapper = getInventoryItemByType(0, index)
        do
          if itemWrapper ~= nil and self.keyContentsEventType == ((itemWrapper:getStaticStatus()):get()):getContentsEventType() then
            local itemKey = (((itemWrapper:getStaticStatus()):get())._key):getItemKey()
            if treasureBox._driganKeyItemKey ~= itemKey then
              self.normalKeyCount = self.normalKeyCount + Int64toInt32((itemWrapper:get()):getCount_s64())
              -- DECOMPILER ERROR at PC99: Confused about usage of register: R10 in 'UnsetPending'

              if (self.materialSlotNo)[0] == nil then
                (self.materialSlotNo)[0] = index
              end
            end
          end
          do
            local cashItemWrapper = getInventoryItemByType(17, index)
            if cashItemWrapper ~= nil and self.keyContentsEventType == ((cashItemWrapper:getStaticStatus()):get()):getContentsEventType() then
              self.cashKeyCount = self.cashKeyCount + Int64toInt32((cashItemWrapper:get()):getCount_s64())
              -- DECOMPILER ERROR at PC129: Confused about usage of register: R10 in 'UnsetPending'

              if (self.materialSlotNo)[1] == nil then
                (self.materialSlotNo)[1] = index
              end
            end
            -- DECOMPILER ERROR at PC130: LeaveBlock: unexpected jumping out DO_STMT

          end
        end
      end
    end
  end
end

local isAni = false
local _time = 0
GoldenTreasureBox_Open = function()
  -- function num : 0_6 , upvalues : treasureBox, isAni, _time
  local self = treasureBox
  local isDrigan = self:CheckDriganBox(self._fromWhereType, self._fromSlotNo)
  local normalKeyUse = ((self.radioBtn_NormalKey):IsCheck())
  local materialWhereType, materialSlotNo = nil, nil
  if normalKeyUse then
    if self.normalKeyCount <= 0 then
      if isDrigan then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_TREASUREBOX_NEEDDRIGANGOLDKEY"))
      else
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_TREASUREBOX_NEEDGOLDKEY"))
      end
      return 
    end
    materialWhereType = 0
    materialSlotNo = (self.materialSlotNo)[0]
  else
    if self.cashKeyCount <= 0 then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_TREASUREBOX_NEEDGOLDENKEY"))
      return 
    end
    materialWhereType = 17
    materialSlotNo = (self.materialSlotNo)[1]
  end
  ;
  (treasureBox.closeBox_Head):SetShow(false)
  ;
  (treasureBox.closeBox_Body):SetShow(false)
  ;
  (treasureBox.openBox):SetShow(true)
  ;
  (self.openBox):EraseAllEffect()
  ;
  (self.openBox):AddEffect("fCO_Egg_Random_01B", false, 0, 0)
  isAni = true
  _time = 0
  ToClient_requestOpenSealItemBox(self._fromWhereType, self._fromSlotNo, materialWhereType, materialSlotNo)
  audioPostEvent_SystemUi(11, 14)
end

GoldenTreasureBox_Animation = function(deltaTime)
  -- function num : 0_7 , upvalues : isAni, _time, treasureBox
  if not isAni then
    return 
  end
  _time = _time + deltaTime
  if _time > 5 then
    (treasureBox.closeBox_Head):SetShow(true)
    ;
    (treasureBox.closeBox_Body):SetShow(true)
    ;
    (treasureBox.openBox):SetShow(false)
    isAni = false
    _time = 0
    audioPostEvent_SystemUi(11, 15)
    isTreasureBoxCheck()
  end
end

isTreasureBoxCheck = function()
  -- function num : 0_8 , upvalues : treasureBox
  local itemWrapper = getInventoryItemByType(treasureBox._fromWhereType, treasureBox._fromSlotNo)
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

  if itemWrapper == nil then
    treasureBox._fromWhereType = nil
    -- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

    treasureBox._fromSlotNo = nil
    Panel_GoldenTreasureBox_Close()
  end
end

FromClient_ResponseSealItemBox = function(itemKey)
  -- function num : 0_9 , upvalues : treasureBox
  local isDrigan = treasureBox:CheckDriganBox(treasureBox._fromWhereType, treasureBox._fromSlotNo)
  GoldenTreasureData_Init(isDrigan)
  local itemESSW = getItemEnchantStaticStatus(ItemEnchantKey(itemKey))
  local sendMsg = {main = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_GACHA_ROULETTE_GETITEM", "getName", itemESSW:getName()), sub = "", addMsg = ""}
  Proc_ShowMessage_Ack_WithOut_ChattingMessage_For_RewardSelect(sendMsg, 3.5, 17)
end

Panel_GoldenTreasureBox_Close = function()
  -- function num : 0_10
  Panel_GoldenTreasureBox:SetShow(false, true)
end

Panel_TresureBox_RePos = function()
  -- function num : 0_11 , upvalues : treasureBox
  Panel_GoldenTreasureBox:SetPosX(getScreenSizeX() / 2 - Panel_GoldenTreasureBox:GetSizeX() / 2)
  Panel_GoldenTreasureBox:SetPosY(getScreenSizeY() / 2 - Panel_GoldenTreasureBox:GetSizeY() / 2)
  local strNormalKey = (treasureBox.radioBtn_NormalKey):GetTextSizeX()
  local strCashKey = (treasureBox.radioBtn_CashKey):GetTextSizeX()
  local normalPosX = (treasureBox.radioBtn_NormalKey):GetPosX()
  local cashPosX = (treasureBox.radioBtn_CashKey):GetPosX()
  local strPos = 0
  local strSize = 0
  if strCashKey < strNormalKey then
    strPos = normalPosX
    strSize = strNormalKey
  else
    strPos = cashPosX
    strSize = strCashKey
  end
  local panelSizeX = Panel_GoldenTreasureBox:GetSizeX()
end

Panel_GoldenTreasureBox:RegisterUpdateFunc("GoldenTreasureBox_Animation")
registerEvent("FromClient_RequestUseSealItemBox", "FromClient_RequestUseSealItemBox")
registerEvent("FromClient_ResponseSealItemBox", "FromClient_ResponseSealItemBox")
registerEvent("onScreenResize", "Panel_TresureBox_RePos")

