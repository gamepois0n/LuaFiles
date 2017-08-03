-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\servant\stable\panel_window_stablemating.luac 

-- params : ...
-- function num : 0
Panel_Window_StableMating:SetShow(false, false)
Panel_Window_StableMating:setMaskingChild(true)
Panel_Window_StableMating:ActiveMouseEventEffect(true)
Panel_Window_StableMating:SetDragEnable(true)
Panel_Window_StableMating:RegisterShowEventFunc(true, "StableMatingShowAni()")
Panel_Window_StableMating:RegisterShowEventFunc(false, "StableMatingHideAni()")
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local isContentsStallionEnable = ToClient_IsContentsGroupOpen("243")
local isContentsNineTierEnable = ToClient_IsContentsGroupOpen("80")
StableMatingShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV, UI_color
  local isShow = Panel_Window_StableMating:IsShow()
  if isShow then
    Panel_Window_StableMating:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
    local aniInfo1 = Panel_Window_StableMating:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
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
      (UIAni.fadeInSCR_Down)(Panel_Window_StableMating)
      Panel_Window_StableMating:SetShow(true, false)
    end
  end
end

StableMatingHideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV, UI_color
  Inventory_SetFunctor(nil)
  Panel_Window_StableMating:SetShowWithFade((CppEnums.PAUI_SHOW_FADE_TYPE).PAUI_ANI_TYPE_FADE_OUT)
  local aniInfo1 = Panel_Window_StableMating:addColorAnimation(0, 0.22, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  aniInfo1:SetStartColor(UI_color.C_FFFFFFFF)
  aniInfo1:SetEndColor(UI_color.C_00FFFFFF)
  aniInfo1:SetStartIntensity(3)
  aniInfo1:SetEndIntensity(1)
  aniInfo1.IsChangeChild = true
  aniInfo1:SetHideAtEnd(true)
  aniInfo1:SetDisableWhileAni(true)
end

local stableMating = {
_config = {
slot = {startX = 0, startY = 10, gapY = 127}
, 
icon = {startX = 15, startY = 10, startValueX = 0, startValueY = 0, startKindX = -15, startKindY = -10, startMatingX = 0, startMatingY = 90, gapMatingX = 100, size = 150}
, 
stat = {startX = 120, startY = 10, startValueX = 10, startValueY = 0, startMoneyX = 0, startMoneyY = 0, gapX = 50, gapY = 20}
, 
skill = {startX = 330, startY = 10, iconX = 10, iconY = 15, textX = 0, textY = 55, gapX = 69, count = 5}
, 
button = {startX = 710, startY = 10}
, 
tab = {eNormal = 0, eMy = 1, eGroup = 2}
, slotCount = 4}
, _mainBG = (UI.getChildControl)(Panel_Window_StableMating, "Static_MainBG"), _buttonQuestion = (UI.getChildControl)(Panel_Window_StableMating, "Button_Question"), _buttonClose = (UI.getChildControl)(Panel_Window_StableMating, "Button_Close"), _staticPageNo = (UI.getChildControl)(Panel_Window_StableMating, "Static_PageNo"), _buttonNext = (UI.getChildControl)(Panel_Window_StableMating, "Button_Next"), _buttonPrev = (UI.getChildControl)(Panel_Window_StableMating, "Button_Prev"), _buttonTabMarket = (UI.getChildControl)(Panel_Window_StableMating, "RadioButton_List"), _buttonTabMy = (UI.getChildControl)(Panel_Window_StableMating, "RadioButton_ListMy"), _buttonTabGroup = (UI.getChildControl)(Panel_Window_StableMating, "RadioButton_Group"), _buttonStart = (UI.getChildControl)(Panel_Window_StableMating, "Button_Start"), _buttonMating = (UI.getChildControl)(Panel_Window_StableMating, "Button_Mating"), _buttonCancel = (UI.getChildControl)(Panel_Window_StableMating, "Button_Cancel"), _buttonReceive = (UI.getChildControl)(Panel_Window_StableMating, "Button_Receive"), _buttonEnd = (UI.getChildControl)(Panel_Window_StableMating, "Button_End"), _radioInven = (UI.getChildControl)(Panel_Window_StableMating, "RadioButton_Icon_Money"), _radioWarehouse = (UI.getChildControl)(Panel_Window_StableMating, "RadioButton_Icon_Money2"), _staticInven = (UI.getChildControl)(Panel_Window_StableMating, "Static_Text_Money"), _staticWarehouse = (UI.getChildControl)(Panel_Window_StableMating, "Static_Text_Money2"), _slots = (Array.new)(), _selectSlotNo = 0, _selectPage = 0, _selectMaxPage = 0, _currentTab = 0}
stableMating.init = function(self)
  -- function num : 0_2
  for ii = 0, (self._config).slotCount - 1 do
    local slot = {}
    slot._slotNo = ii
    slot._panel = Panel_Window_StableMating
    slot._startSlotIndex = 0
    slot._learnSkillCount = 0
    slot._baseSlot = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_Slot", self._mainBG, "ServantMating_Slot_" .. ii)
    slot._iconBack = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_IconBack", slot._baseSlot, "ServantMating_Slot_IconBack_" .. ii)
    slot._icon = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_Icon", slot._iconBack, "ServantMating_Slot_Icon_" .. ii)
    slot._grade = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "StaticText_Grade", slot._iconBack, "ServantMating_Slot_Grade_" .. ii)
    slot._iconMale = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_Male", slot._iconBack, "ServantMating_Slot_Male_" .. ii)
    slot._iconFemale = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_Female", slot._iconBack, "ServantMating_Slot_Female_" .. ii)
    slot._iconStallion = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_iconStallion", slot._iconBack, "ServantMating_Slot_iconStallion" .. ii)
    slot._statusBack = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_StatusBack", slot._baseSlot, "ServantMating_Slot_StatusBack_" .. ii)
    slot._staticLv = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_Lv", slot._statusBack, "ServantMating_Slot_StatusLv_" .. ii)
    slot._staticLvValue = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_LvValue", slot._statusBack, "ServantMating_Slot_StatusLvValue_" .. ii)
    slot._staticHp = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_Hp", slot._statusBack, "ServantMating_Slot_StatusHp_" .. ii)
    slot._staticHpValue = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_HpValue", slot._statusBack, "ServantMating_Slot_StatusHpValue_" .. ii)
    slot._staticStamina = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_Stamina", slot._statusBack, "ServantMating_Slot_StatusStamina_" .. ii)
    slot._staticStaminaValue = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_StaminaValue", slot._statusBack, "ServantMating_Slot_StatusStaminaValue_" .. ii)
    slot._staticWeight = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_Weight", slot._statusBack, "ServantMating_Slot_StatusWeight_" .. ii)
    slot._staticWeightValue = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_WeightValue", slot._statusBack, "ServantMating_Slot_StatusWeightValue_" .. ii)
    slot._staticPrice = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_Price", slot._statusBack, "ServantMating_Slot_StatusPrice_" .. ii)
    slot._staticPriceValue = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_PriceValue", slot._statusBack, "ServantMating_Slot_StatusPriceValue_" .. ii)
    slot._staticMoveSpeed = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_MoveSpeed", slot._statusBack, "ServantMating_Slot_MoveSpeed" .. ii)
    slot._staticMoveSpeedValue = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_MoveSpeedValue", slot._statusBack, "ServantMating_Slot_MoveSpeedValue" .. ii)
    slot._staticAcceleration = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_Acceleration", slot._statusBack, "ServantMating_Slot_Acceleration" .. ii)
    slot._staticAccelerationValue = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_AccelerationValue", slot._statusBack, "ServantMating_Slot_AccelerationValue" .. ii)
    slot._staticCornering = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_Cornering", slot._statusBack, "ServantMating_Slot_Cornering" .. ii)
    slot._staticCorneringValue = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_CorneringValue", slot._statusBack, "ServantMating_Slot_CorneringValue" .. ii)
    slot._staticBrake = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_Brake", slot._statusBack, "ServantMating_Slot_Brake" .. ii)
    slot._staticBrakeValue = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_BrakeValue", slot._statusBack, "ServantMating_Slot_BrakeValue" .. ii)
    slot._skillBack = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_SkillBack", slot._baseSlot, "ServantMating_Slot_SkillBack_" .. ii)
    slot.skillNextPage = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Button_NextPage", slot._skillBack, "ServantMating_Slot_SkillNextPage_" .. ii)
    slot.skillPrevPage = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Button_PrevPage", slot._skillBack, "ServantMating_Slot_SkillPrevPage_" .. ii)
    slot.skillPageValue = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "StaticText_PageValue", slot._skillBack, "ServantMating_Slot_SkillPageValue_" .. ii)
    slot._staticDeadCount = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "StaticText_DeadCount", slot._statusBack, "ServantMarket_Slot_DeadCount_" .. ii)
    slot._staticDeadCountValue = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "StaticText_DeadCountValue", slot._statusBack, "ServantMarket_Slot_DeadCountValue_" .. ii)
    slot._skill = (Array.new)()
    for jj = 0, ((self._config).skill).count - 1 do
      local skill = {}
      skill._expBG = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_Texture_Learn_Background", slot._skillBack, "ServantMating_Slot_SkillExpBG_" .. ii .. "_" .. jj)
      skill._exp = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "SkillLearn_Gauge", slot._skillBack, "ServantMating_Slot_SkillExp_" .. ii .. "_" .. jj)
      skill._skillIcon = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_SkillIcon", slot._skillBack, "ServantMating_Slot_SkillIcon_" .. ii .. "_" .. jj)
      skill._skillText = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Static_SkillText", slot._skillBack, "ServantMating_Slot_SkillText_" .. ii .. "_" .. jj)
      skill._expText = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "SkillLearn_PercentString", slot._skillBack, "ServantMating_Slot_SkillExpStr_" .. ii .. "_" .. jj)
      -- DECOMPILER ERROR at PC405: Confused about usage of register: R11 in 'UnsetPending'

      ;
      (slot._skill)[jj] = skill
    end
    slot._buttonStart = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Button_Start", slot._baseSlot, "ServantMating_Start_" .. ii)
    slot._buttonMating = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Button_Mating", slot._baseSlot, "ServantMating_Mating_" .. ii)
    slot._buttonCancel = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Button_Cancel", slot._baseSlot, "ServantMating_Cancel_" .. ii)
    slot._buttonReceive = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Button_Receive", slot._baseSlot, "ServantMating_Receive_" .. ii)
    slot._buttonEnd = (UI.createAndCopyBasePropertyControl)(Panel_Window_StableMating, "Button_End", slot._baseSlot, "ServantMating_End_" .. ii)
    local slotConfig = (self._config).slot
    ;
    (slot._baseSlot):SetPosX(slotConfig.startX)
    ;
    (slot._baseSlot):SetPosY(slotConfig.startY + slotConfig.gapY * ii)
    local iconConfig = (self._config).icon
    ;
    (slot._iconBack):SetPosX(iconConfig.startX)
    ;
    (slot._iconBack):SetPosY(iconConfig.startY)
    ;
    (slot._icon):SetPosX(iconConfig.startValueX)
    ;
    (slot._icon):SetPosY(iconConfig.startValueY)
    ;
    (slot._grade):SetPosX(iconConfig.startKindX + 70)
    ;
    (slot._grade):SetPosY(iconConfig.startKindY + 5)
    ;
    (slot._iconMale):SetPosX(iconConfig.startKindX)
    ;
    (slot._iconMale):SetPosY(iconConfig.startKindY)
    ;
    (slot._iconFemale):SetPosX(iconConfig.startKindX)
    ;
    (slot._iconFemale):SetPosY(iconConfig.startKindY)
    ;
    (slot._iconStallion):SetPosX(iconConfig.startKindX + 20)
    ;
    (slot._iconStallion):SetPosY(iconConfig.startKindY + 3)
    local statConfig = (self._config).stat
    ;
    (slot._statusBack):SetPosX(statConfig.startX)
    ;
    (slot._statusBack):SetPosY(statConfig.startY)
    ;
    (slot._staticLv):SetPosX(statConfig.startValueX + statConfig.gapX * 0)
    ;
    (slot._staticLv):SetPosY(statConfig.startValueY + statConfig.gapY * 0)
    ;
    (slot._staticHp):SetPosX(statConfig.startValueX + statConfig.gapX * 0)
    ;
    (slot._staticHp):SetPosY(statConfig.startValueY + statConfig.gapY * 1)
    ;
    (slot._staticStamina):SetPosX(statConfig.startValueX + statConfig.gapX * 0)
    ;
    (slot._staticStamina):SetPosY(statConfig.startValueY + statConfig.gapY * 2)
    ;
    (slot._staticWeight):SetPosX(statConfig.startValueX + statConfig.gapX * 0)
    ;
    (slot._staticWeight):SetPosY(statConfig.startValueY + statConfig.gapY * 3)
    ;
    (slot._staticLvValue):SetPosX(statConfig.startValueX + statConfig.gapX * 1)
    ;
    (slot._staticLvValue):SetPosY(statConfig.startValueY + statConfig.gapY * 0)
    ;
    (slot._staticHpValue):SetPosX(statConfig.startValueX + statConfig.gapX * 1)
    ;
    (slot._staticHpValue):SetPosY(statConfig.startValueY + statConfig.gapY * 1)
    ;
    (slot._staticStaminaValue):SetPosX(statConfig.startValueX + statConfig.gapX * 1)
    ;
    (slot._staticStaminaValue):SetPosY(statConfig.startValueY + statConfig.gapY * 2)
    ;
    (slot._staticWeightValue):SetPosX(statConfig.startValueX + statConfig.gapX * 1)
    ;
    (slot._staticWeightValue):SetPosY(statConfig.startValueY + statConfig.gapY * 3)
    ;
    (slot._staticMoveSpeed):SetPosX(statConfig.startValueX + statConfig.gapX * 2)
    ;
    (slot._staticMoveSpeed):SetPosY(statConfig.startValueY + statConfig.gapY * 0)
    ;
    (slot._staticAcceleration):SetPosX(statConfig.startValueX + statConfig.gapX * 2)
    ;
    (slot._staticAcceleration):SetPosY(statConfig.startValueY + statConfig.gapY * 1)
    ;
    (slot._staticCornering):SetPosX(statConfig.startValueX + statConfig.gapX * 2)
    ;
    (slot._staticCornering):SetPosY(statConfig.startValueY + statConfig.gapY * 2)
    ;
    (slot._staticBrake):SetPosX(statConfig.startValueX + statConfig.gapX * 2)
    ;
    (slot._staticBrake):SetPosY(statConfig.startValueY + statConfig.gapY * 3)
    ;
    (slot._staticMoveSpeedValue):SetPosX(statConfig.startValueX + statConfig.gapX * 3)
    ;
    (slot._staticMoveSpeedValue):SetPosY(statConfig.startValueY + statConfig.gapY * 0)
    ;
    (slot._staticAccelerationValue):SetPosX(statConfig.startValueX + statConfig.gapX * 3)
    ;
    (slot._staticAccelerationValue):SetPosY(statConfig.startValueY + statConfig.gapY * 1)
    ;
    (slot._staticCorneringValue):SetPosX(statConfig.startValueX + statConfig.gapX * 3)
    ;
    (slot._staticCorneringValue):SetPosY(statConfig.startValueY + statConfig.gapY * 2)
    ;
    (slot._staticBrakeValue):SetPosX(statConfig.startValueX + statConfig.gapX * 3)
    ;
    (slot._staticBrakeValue):SetPosY(statConfig.startValueY + statConfig.gapY * 3)
    ;
    (slot._staticPrice):SetPosX(statConfig.startValueX + statConfig.gapX * 0)
    ;
    (slot._staticPrice):SetPosY(statConfig.startValueY + statConfig.gapY * 4)
    ;
    (slot._staticPriceValue):SetPosX(statConfig.startValueX + statConfig.gapX * 1.6)
    ;
    (slot._staticPriceValue):SetPosY(statConfig.startValueY + statConfig.gapY * 4)
    ;
    (slot._staticDeadCount):SetPosX(statConfig.startValueX + statConfig.gapX * 3.3)
    ;
    (slot._staticDeadCount):SetPosY(statConfig.startValueY + statConfig.gapY * 3.9)
    ;
    (slot._staticDeadCountValue):SetPosX(statConfig.startValueX + statConfig.gapX * 4.8)
    ;
    (slot._staticDeadCountValue):SetPosY(statConfig.startValueY + statConfig.gapY * 3.9)
    local skillConfig = (self._config).skill
    ;
    (slot._skillBack):SetPosX(skillConfig.startX)
    ;
    (slot._skillBack):SetPosY(skillConfig.startY)
    ;
    (slot.skillPrevPage):SetPosX((slot._skillBack):GetSizeX())
    ;
    (slot.skillPrevPage):SetPosY(skillConfig.startY)
    ;
    (slot.skillPageValue):SetPosX((slot._skillBack):GetSizeX())
    ;
    (slot.skillPageValue):SetPosY(skillConfig.startY + (slot.skillPrevPage):GetSizeY())
    ;
    (slot.skillNextPage):SetPosX((slot._skillBack):GetSizeX())
    ;
    (slot.skillNextPage):SetPosY((slot.skillPageValue):GetPosY() + (slot.skillPageValue):GetSizeY())
    for jj = 0, ((self._config).skill).count - 1 do
      (((slot._skill)[jj])._expBG):SetPosX(skillConfig.iconX + skillConfig.gapX * jj - 5)
      ;
      (((slot._skill)[jj])._expBG):SetPosY(skillConfig.iconY - 5)
      ;
      (((slot._skill)[jj])._exp):SetPosX(skillConfig.iconX + skillConfig.gapX * jj - 3)
      ;
      (((slot._skill)[jj])._exp):SetPosY(skillConfig.iconY - 3)
      ;
      (((slot._skill)[jj])._skillIcon):SetPosX(skillConfig.iconX + skillConfig.gapX * jj)
      ;
      (((slot._skill)[jj])._skillIcon):SetPosY(skillConfig.iconY)
      ;
      (((slot._skill)[jj])._skillText):SetPosX(skillConfig.textX + skillConfig.gapX * jj)
      ;
      (((slot._skill)[jj])._skillText):SetPosY(skillConfig.textY)
      ;
      (((slot._skill)[jj])._expText):SetPosX(skillConfig.iconX + skillConfig.gapX * jj + 20)
      ;
      (((slot._skill)[jj])._expText):SetPosY(skillConfig.iconY + 30)
      ;
      (((slot._skill)[jj])._skillIcon):addInputEvent("Mouse_UpScroll", "StableMating_ScrollEvent(" .. ii .. ", true)")
      ;
      (((slot._skill)[jj])._skillIcon):addInputEvent("Mouse_DownScroll", "StableMating_ScrollEvent(" .. ii .. ", false)")
    end
    local buttonConfig = (self._config).button
    ;
    (slot._buttonStart):SetPosX(buttonConfig.startX)
    ;
    (slot._buttonStart):SetPosY(buttonConfig.startY)
    ;
    (slot._buttonMating):SetPosX(buttonConfig.startX)
    ;
    (slot._buttonMating):SetPosY(buttonConfig.startY)
    ;
    (slot._buttonCancel):SetPosX(buttonConfig.startX)
    ;
    (slot._buttonCancel):SetPosY(buttonConfig.startY)
    ;
    (slot._buttonReceive):SetPosX(buttonConfig.startX)
    ;
    (slot._buttonReceive):SetPosY(buttonConfig.startY)
    ;
    (slot._buttonEnd):SetPosX(buttonConfig.startX)
    ;
    (slot._buttonEnd):SetPosY(buttonConfig.startY)
    ;
    (slot._buttonStart):addInputEvent("Mouse_LUp", "StableMating_Mating(" .. ii .. ")")
    ;
    (slot._buttonCancel):addInputEvent("Mouse_LUp", "StableMating_Cancel(" .. ii .. ")")
    ;
    (slot._buttonEnd):addInputEvent("Mouse_LUp", "StableMating_Cancel(" .. ii .. ")")
    ;
    (slot._buttonReceive):addInputEvent("Mouse_LUp", "StableMating_Receive(" .. ii .. ")")
    ;
    (slot._baseSlot):addInputEvent("Mouse_UpScroll", "StableMating_ScrollEvent(" .. ii .. ", true)")
    ;
    (slot._baseSlot):addInputEvent("Mouse_DownScroll", "StableMating_ScrollEvent(" .. ii .. ", false)")
    ;
    (slot._buttonStart):SetAutoDisableTime(4)
    ;
    (slot._buttonCancel):SetAutoDisableTime(4)
    ;
    (slot._buttonEnd):SetAutoDisableTime(4)
    ;
    (slot._buttonReceive):SetAutoDisableTime(4)
    ;
    (slot._baseSlot):SetShow(false)
    -- DECOMPILER ERROR at PC1084: Confused about usage of register: R11 in 'UnsetPending'

    ;
    (self._slots)[ii] = slot
  end
end

stableMating.updateSlot = function(self, isClear)
  -- function num : 0_3 , upvalues : isContentsStallionEnable
  StableMating_UpdateMoney()
  for ii = 0, (self._config).slotCount - 1 do
    local slot = (self._slots)[ii]
    if isClear then
      slot._learnSkillCount = 0
      slot._startSlotIndex = 0
    end
    ;
    (slot._baseSlot):SetShow(false)
    ;
    (slot.skillPrevPage):SetShow(false)
    ;
    (slot.skillNextPage):SetShow(false)
    ;
    (slot.skillPageValue):SetShow(false)
    ;
    (slot._iconStallion):SetShow(false)
  end
  local myAuctionInfo = RequestGetAuctionInfo()
  local startSlotNo = 0
  local endSlotNo = 0
  if ((self._config).tab).eMy == StableMating_CurrentTab() then
    startSlotNo = self._selectPage * (self._config).slotCount
    endSlotNo = startSlotNo + (self._config).slotCount - 1
    local maxCount = myAuctionInfo:getServantAuctionListCount()
    self._selectMaxPage = (math.floor)(maxCount / (self._config).slotCount) - 1
    if maxCount % (self._config).slotCount > 0 then
      self._selectMaxPage = self._selectMaxPage + 1
    end
  else
    do
      startSlotNo = 0
      endSlotNo = myAuctionInfo:getServantAuctionListCount() - 1
      local slotNo = 0
      for ii = startSlotNo, endSlotNo do
        local auctionServantInfo = myAuctionInfo:getServantAuctionListAt(ii)
        if auctionServantInfo ~= nil and slotNo < (self._config).slotCount then
          local slot = (self._slots)[slotNo]
          ;
          (slot._icon):ChangeTextureInfoName(auctionServantInfo:getIconPath1())
          if auctionServantInfo:isMale() then
            (slot._iconMale):SetShow(true)
            ;
            (slot._iconFemale):SetShow(false)
          else
            ;
            (slot._iconMale):SetShow(false)
            ;
            (slot._iconFemale):SetShow(true)
          end
          if auctionServantInfo:getTier() == 9 and isContentsStallionEnable then
            (slot._grade):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_TEXT_TIER9"))
            ;
            (slot._iconStallion):SetShow(false)
          else
            ;
            (slot._grade):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_SERVANT_TIER", "tier", auctionServantInfo:getTier()))
            if isContentsStallionEnable then
              (slot._iconStallion):SetShow(true)
              local isStallion = auctionServantInfo:isStallion()
              if isStallion == true then
                (slot._iconStallion):SetMonoTone(false)
              else
                ;
                (slot._iconStallion):SetMonoTone(true)
              end
            end
          end
          do
            ;
            (slot._staticLvValue):SetText(auctionServantInfo:getLevel())
            ;
            (slot._staticHpValue):SetText(auctionServantInfo:getMaxHp())
            ;
            (slot._staticStaminaValue):SetText(auctionServantInfo:getMaxMp())
            ;
            (slot._staticWeightValue):SetText(tostring(auctionServantInfo:getMaxWeight_s64() / (Defines.s64_const).s64_10000))
            ;
            (slot._staticMoveSpeedValue):SetText((string.format)("%.1f", auctionServantInfo:getStat((CppEnums.ServantStatType).Type_MaxMoveSpeed) / 10000) .. "%")
            ;
            (slot._staticAccelerationValue):SetText((string.format)("%.1f", auctionServantInfo:getStat((CppEnums.ServantStatType).Type_Acceleration) / 10000) .. "%")
            ;
            (slot._staticCorneringValue):SetText((string.format)("%.1f", auctionServantInfo:getStat((CppEnums.ServantStatType).Type_CorneringSpeed) / 10000) .. "%")
            ;
            (slot._staticBrakeValue):SetText((string.format)("%.1f", auctionServantInfo:getStat((CppEnums.ServantStatType).Type_BrakeSpeed) / 10000) .. "%")
            ;
            (slot._staticPriceValue):SetText(makeDotMoney(auctionServantInfo:getAuctoinPrice_s64()))
            local deadCount = auctionServantInfo:getDeadCount()
            ;
            (slot._staticDeadCountValue):SetText(deadCount)
            for ii = 0, ((self._config).skill).count - 1 do
              (((slot._skill)[ii])._expBG):SetShow(false)
              ;
              (((slot._skill)[ii])._skillIcon):SetShow(false)
              ;
              (((slot._skill)[ii])._skillText):SetShow(false)
              ;
              (((slot._skill)[ii])._exp):SetShow(false)
              ;
              (((slot._skill)[ii])._expText):SetShow(false)
            end
            slot._learnSkillCount = 0
            local skillSlotNo = 0
            local tempIndex = 0
            local learnSkillCount = vehicleSkillStaticStatus_skillCount()
            for jj = 1, learnSkillCount - 1 do
              local skillWrapper = auctionServantInfo:getSkill(jj)
              if skillWrapper ~= nil then
                if skillSlotNo < ((self._config).skill).count then
                  do
                    do
                      if slot._startSlotIndex <= tempIndex then
                        local expTxt = tonumber((string.format)("%.0f", auctionServantInfo:getSkillExp(jj) / ((skillWrapper:get())._maxExp / 100)))
                        if expTxt >= 100 then
                          expTxt = 100
                        end
                        ;
                        (((slot._skill)[skillSlotNo])._skillIcon):ChangeTextureInfoName("Icon/" .. skillWrapper:getIconPath())
                        ;
                        (((slot._skill)[skillSlotNo])._skillText):SetText(skillWrapper:getName())
                        ;
                        (((slot._skill)[skillSlotNo])._exp):SetProgressRate(auctionServantInfo:getSkillExp(jj) / ((skillWrapper:get())._maxExp / 100))
                        ;
                        (((slot._skill)[skillSlotNo])._expText):SetText(expTxt .. "%")
                        ;
                        (((slot._skill)[skillSlotNo])._expBG):SetShow(true)
                        ;
                        (((slot._skill)[skillSlotNo])._exp):SetShow(true)
                        ;
                        (((slot._skill)[skillSlotNo])._expText):SetShow(true)
                        ;
                        (((slot._skill)[skillSlotNo])._skillIcon):SetShow(true)
                        ;
                        (((slot._skill)[skillSlotNo])._skillText):SetShow(true)
                        skillSlotNo = skillSlotNo + 1
                      end
                      tempIndex = tempIndex + 1
                      slot._learnSkillCount = slot._learnSkillCount + 1
                      -- DECOMPILER ERROR at PC418: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC418: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC418: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC418: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC418: LeaveBlock: unexpected jumping out IF_STMT

                    end
                  end
                end
              end
            end
            if slot._learnSkillCount > 5 then
              (slot.skillPageValue):SetText((string.format)("%.0f", slot._startSlotIndex / ((self._config).skill).count) + 1)
              ;
              (slot.skillPrevPage):addInputEvent("Mouse_LUp", "StableMating_ScrollEvent( " .. ii .. ", true )")
              ;
              (slot.skillNextPage):addInputEvent("Mouse_LUp", "StableMating_ScrollEvent( " .. ii .. ", false )")
              ;
              (slot.skillPrevPage):SetShow(true)
              ;
              (slot.skillNextPage):SetShow(true)
              ;
              (slot.skillPageValue):SetShow(true)
            end
            ;
            (slot._buttonStart):SetShow(false)
            ;
            (slot._buttonMating):SetShow(false)
            ;
            (slot._buttonCancel):SetShow(false)
            ;
            (slot._buttonReceive):SetShow(false)
            ;
            (slot._buttonEnd):SetShow(false)
            if ((self._config).tab).eMy == StableMating_CurrentTab() then
              local isAuctionEnd = auctionServantInfo:isAuctionEnd()
              local servantInfo = stable_getServantByServantNo(auctionServantInfo:getServantNo())
              if servantInfo ~= nil then
                if (CppEnums.ServantStateType).Type_RegisterMating == servantInfo:getStateType() then
                  if isAuctionEnd then
                    (slot._buttonEnd):SetShow(true)
                  else
                    ;
                    (slot._buttonCancel):SetShow(true)
                  end
                else
                  if (CppEnums.ServantStateType).Type_Mating == servantInfo:getStateType() then
                    if servantInfo:isMatingComplete() then
                      (slot._buttonReceive):SetShow(true)
                    else
                      ;
                      (slot._buttonMating):SetShow(true)
                    end
                  end
                end
              end
            else
              do
                do
                  ;
                  (slot._buttonStart):SetShow(true)
                  ;
                  (slot._baseSlot):SetShow(true)
                  slotNo = slotNo + 1
                  -- DECOMPILER ERROR at PC547: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC547: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC547: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC547: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC547: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC547: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
      if ((self._config).tab).eMy == StableMating_CurrentTab() then
        (self._staticPageNo):SetText(self._selectPage + 1)
      else
        ;
        (self._staticPageNo):SetText(myAuctionInfo:getCurrentPage() + 1)
      end
    end
  end
end

StableMating_SimpleTooltips = function(tipType, isShow)
  -- function num : 0_4 , upvalues : stableMating
  local name, desc, control = nil, nil, nil
  local self = stableMating
  if tipType == 0 then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_INVEN_NAME")
    desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_INVEN_DESC")
    control = self._radioInven
  else
    if tipType == 1 then
      name = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_WAREHOUSE_NAME")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_TOOLTIP_WAREHOUSE_DESC")
      control = self._radioWarehouse
    end
  end
  if isShow == true then
    registTooltipControl(control, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

stableMating.registEventHandler = function(self)
  -- function num : 0_5
  (self._buttonTabMarket):addInputEvent("Mouse_LUp", "StableMating_TabEvent( 0 )")
  ;
  (self._buttonTabMy):addInputEvent("Mouse_LUp", "StableMating_TabEvent( 1 )")
  ;
  (self._buttonTabGroup):addInputEvent("Mouse_LUp", "StableMating_TabEvent( 2 )")
  ;
  (self._buttonNext):addInputEvent("Mouse_LUp", "StableMating_NextPage()")
  ;
  (self._buttonPrev):addInputEvent("Mouse_LUp", "StableMating_PrevPage()")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"PanelWindowStableMating\" )")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"PanelWindowStableMating\", \"true\")")
  ;
  (self._buttonQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"PanelWindowStableMating\", \"false\")")
  ;
  (self._buttonClose):addInputEvent("Mouse_LUp", "StableMating_Close()")
  ;
  (self._radioInven):addInputEvent("Mouse_On", "StableMating_SimpleTooltips( 0, true )")
  ;
  (self._radioInven):addInputEvent("Mouse_Out", "StableMating_SimpleTooltips( false )")
  ;
  (self._radioWarehouse):addInputEvent("Mouse_On", "StableMating_SimpleTooltips( 1, true )")
  ;
  (self._radioWarehouse):addInputEvent("Mouse_Out", "StableMating_SimpleTooltips( false )")
  ;
  (self._radioInven):setTooltipEventRegistFunc("StableMating_SimpleTooltips( 0, true )")
  ;
  (self._radioWarehouse):setTooltipEventRegistFunc("StableMating_SimpleTooltips( 1, true )")
  ;
  (self._buttonTabMarket):SetAutoDisableTime(4)
  ;
  (self._buttonTabMy):SetAutoDisableTime(4)
  ;
  (self._buttonTabGroup):SetAutoDisableTime(4)
  ;
  (self._buttonNext):SetAutoDisableTime(4)
  ;
  (self._buttonPrev):SetAutoDisableTime(4)
end

stableMating.registMessageHandler = function(self)
  -- function num : 0_6
  registerEvent("onScreenResize", "StableMating_Resize")
  registerEvent("FromClient_AuctionServantList", "StableMating_UpdateSlotData")
  registerEvent("FromClient_ServantRegisterToAuction", "StableMating_TabEventFromRegister")
  registerEvent("FromClient_InventoryUpdate", "StableMating_UpdateMoney")
  registerEvent("EventWarehouseUpdate", "StableMating_UpdateMoney")
end

StableMating_Resize = function()
  -- function num : 0_7 , upvalues : stableMating
  local self = stableMating
  screenX = getScreenSizeX()
  screenY = getScreenSizeY()
end

StableMating_CurrentTab = function()
  -- function num : 0_8 , upvalues : stableMating
  local self = stableMating
  return self._currentTab
end

StableMating_TransferType = function(tab)
  -- function num : 0_9 , upvalues : stableMating
  local self = stableMating
  local transferType = (CppEnums.TransferType).TransferType_Normal
  if ((self._config).tab).eGroup == tab then
    transferType = (CppEnums.TransferType).TransferType_Self
  end
  return transferType
end

StableMating_UpdateSlotData = function()
  -- function num : 0_10 , upvalues : stableMating
  if not Panel_Window_StableMating:GetShow() then
    return 
  end
  local self = stableMating
  self:updateSlot(true)
end

StableMating_TabEventFromRegister = function()
  -- function num : 0_11 , upvalues : stableMating
  if not Panel_Window_StableMating:GetShow() then
    return 
  end
  local self = stableMating
  StableMating_TabEventXXX(StableMating_CurrentTab())
end

StableMating_UpdateMoney = function()
  -- function num : 0_12 , upvalues : stableMating
  local self = stableMating
  ;
  (self._staticInven):SetText(makeDotMoney((((getSelfPlayer()):get()):getInventory()):getMoney_s64()))
  ;
  (self._staticWarehouse):SetText(makeDotMoney(warehouse_moneyFromNpcShop_s64()))
end

StableMating_TabEvent = function(tab)
  -- function num : 0_13 , upvalues : stableMating
  local self = stableMating
  if StableMating_CurrentTab() == tab then
    return 
  end
  StableMating_TabEventXXX(tab)
end

StableMating_TabEventXXX = function(tab)
  -- function num : 0_14 , upvalues : stableMating
  local self = stableMating
  self._selectPage = 0
  self._selectMaxPage = 100
  self._currentTab = tab
  if ((self._config).tab).eMy == StableMating_CurrentTab() then
    requestMyServantMatingList()
  else
    requestServantMatingListPage(StableMating_TransferType(StableMating_CurrentTab()))
  end
end

StableMating_NextPage = function()
  -- function num : 0_15 , upvalues : stableMating
  audioPostEvent_SystemUi(0, 0)
  local self = stableMating
  if self._selectMaxPage <= self._selectPage then
    return 
  end
  self._selectPage = self._selectPage + 1
  if ((self._config).tab).eMy == StableMating_CurrentTab() then
    self:updateSlot()
  else
    RequestAuctionNextPage(StableMating_TransferType(StableMating_CurrentTab()))
  end
end

StableMating_PrevPage = function()
  -- function num : 0_16 , upvalues : stableMating
  audioPostEvent_SystemUi(0, 0)
  local self = stableMating
  if self._selectPage > 0 then
    self._selectPage = self._selectPage - 1
  end
  if ((self._config).tab).eMy == StableMating_CurrentTab() then
    self:updateSlot()
  else
    RequestAuctionPrevPage(StableMating_TransferType(StableMating_CurrentTab()))
  end
end

StableMating_Mating = function(slotNo)
  -- function num : 0_17 , upvalues : stableMating
  local self = stableMating
  self._selectSlotNo = slotNo
  local _listSelectSlot = StableList_SelectSlotNo()
  if _listSelectSlot == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_STABLE_MATING_PLZSELECT"))
    return 
  end
  local titleString = PAGetString(Defines.StringSheet_GAME, "LUA_MESSAGEBOX_NOTIFY")
  local contentString = PAGetString(Defines.StringSheet_GAME, "LUA_STABLE_MATING_NOTIFY")
  local messageboxData = {title = titleString, content = contentString, functionYes = StableMating_MatingXXX, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

StableMating_MatingXXX = function()
  -- function num : 0_18 , upvalues : stableMating
  local self = stableMating
  local transferType = StableMating_TransferType(StableMating_CurrentTab())
  local fromWhereType = (CppEnums.ItemWhereType).eInventory
  if (self._radioWarehouse):IsCheck() then
    fromWhereType = (CppEnums.ItemWhereType).eWarehouse
  end
  stable_startServantMating(StableList_SelectSlotNo(), self._selectSlotNo, transferType, fromWhereType)
  self._selectSlotNo = nil
end

StableMating_Cancel = function(slotNo)
  -- function num : 0_19 , upvalues : stableMating
  local stableMating_CancelDo = function()
    -- function num : 0_19_0 , upvalues : stableMating, slotNo
    local selectSlotNo = stableMating._selectPage * (stableMating._config).slotCount + slotNo
    stable_cancelServantFromSomeWhereElse(selectSlotNo, (CppEnums.AuctionType).AuctionGoods_ServantMating)
  end

  local titleString = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE")
  local contentString = PAGetString(Defines.StringSheet_GAME, "LUA_ITEMMARKET_ITEMSET_REGISTCANCEL_DO")
  local messageboxData = {title = titleString, content = contentString, functionYes = stableMating_CancelDo, functionCancel = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

StableMating_Receive = function(slotNo)
  -- function num : 0_20 , upvalues : stableMating
  local self = stableMating
  local selectSlotNo = self._selectPage * (self._config).slotCount + slotNo
  local toWhereType = (CppEnums.ItemWhereType).eInventory
  if (self._radioWarehouse):IsCheck() then
    toWhereType = (CppEnums.ItemWhereType).eWarehouse
  end
  stable_popServantPrice(selectSlotNo, (CppEnums.AuctionType).AuctionGoods_ServantMating, toWhereType)
end

StableMating_ScrollEvent = function(slotNo, isUp)
  -- function num : 0_21 , upvalues : stableMating
  local self = stableMating
  local slot = (self._slots)[slotNo]
  local maxSlotNo = slot._learnSkillCount - ((self._config).skill).count
  -- DECOMPILER ERROR at PC18: Unhandled construct in 'MakeBoolean' P1

  if isUp and slot._startSlotIndex > 0 then
    slot._startSlotIndex = slot._startSlotIndex - ((self._config).skill).count
  end
  if slot._startSlotIndex < maxSlotNo then
    slot._startSlotIndex = slot._startSlotIndex + ((self._config).skill).count
  end
  self:updateSlot(false)
end

StableMating_Open = function()
  -- function num : 0_22 , upvalues : stableMating
  local self = stableMating
  Panel_Window_StableMating:SetPosX(getScreenSizeX() / 2 - Panel_Window_StableMating:GetSizeX() / 2)
  Panel_Window_StableMating:SetPosY(getScreenSizeY() / 2 - Panel_Window_StableMating:GetSizeY() / 2 - 10)
  if Panel_Window_StableMating:GetShow() then
    return 
  end
  if Panel_Window_StableMarket:GetShow() then
    StableMarket_Close()
  end
  if Panel_Window_StableMix:GetShow() then
    StableMix_Close()
  end
  warehouse_requestInfoFromNpc()
  ;
  (self._radioInven):SetEnableArea(0, 0, 230, (self._radioInven):GetSizeY())
  ;
  (self._radioWarehouse):SetEnableArea(0, 0, 230, (self._radioInven):GetSizeY())
  ;
  (self._radioInven):SetCheck(false)
  ;
  (self._radioWarehouse):SetCheck(true)
  self._selectSlotNo = nil
  self._selectPage = 0
  self._selectMaxPage = 100
  self._currentTab = ((self._config).tab).eMy
  ;
  (self._buttonTabMy):SetCheck(false)
  ;
  (self._buttonTabMarket):SetCheck(true)
  ;
  (self._buttonTabGroup):SetCheck(false)
  StableMating_TabEvent(((self._config).tab).eNormal)
  Panel_Window_StableMating:SetShow(true)
end

StableMating_Close = function()
  -- function num : 0_23
  if not Panel_Window_StableMating:GetShow() then
    return 
  end
  Panel_Window_StableMating:SetShow(false)
end

stableMating:init()
stableMating:registEventHandler()
stableMating:registMessageHandler()
StableMating_Resize()

