-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\fairyinfo\panel_window_fairylist.luac 

-- params : ...
-- function num : 0
local FairyMessageType = {eTurnOnLantern = 0, eTurnOffLantern = 1}
Panel_Window_FairyList:SetShow(false)
Panel_Window_FairyCompose:SetShow(false)
local UI_classType = CppEnums.ClassType
local UI_TM = CppEnums.TextMode
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_color = Defines.Color
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local IM = CppEnums.EProcessorInputMode
Panel_Window_FairyList:RegisterShowEventFunc(true, "PetNewListShowAni()")
Panel_Window_FairyList:RegisterShowEventFunc(false, "PetNewListHideAni()")
PetNewListShowAni = function()
  -- function num : 0_0
end

PetNewListHideAni = function()
  -- function num : 0_1
end

local isFairyOpen = true
local maxUnsealCount = 1
local nowFairyCompose = false
local composeFairyTier = 0
local ClassType_Valkiry = 24
local spiritClass = {12, 19, 20, 21, 23, 26, 30; [0] = 0}
local fairyMainPotionData = {513, 514, 517, 518, 519, 524, 525, 528, 529, 530, 538, 551, 552, 553, 554, 555, 17568, 17569, 19932, 19933, 19934, 19935; [0] = 502}
local fairySubPotionData = {
[1] = {520, 521, 522, 526, 527, 515, 516, 531, 532, 533, 810, 17570, 17571, 17680, 17685, 17686, 17687, 17688, 18854, 19936, 19937, 19938; [0] = 503}
, 
[2] = {592, 593, 594, 810, 827, 828, 829, 830, 16334, 17707, 17708, 17709, 17710; [0] = 591}
, 
[3] = {596, 597, 598, 810, 831, 832, 833, 834, 17711, 17712, 17713, 17714; [0] = 595}
}
local Static_FairySetting_all = (UI.getChildControl)(Panel_Window_FairyList, "Static_FairyListWindow")
local FairyHpRateText = {[0] = "체력 회복제를 등록해주세요.", [10] = "체력 10% 이하�\188 �\140 자동사용", [20] = "체력 20% 이하�\188 �\140 자동사용", [30] = "체력 30% 이하�\188 �\140 자동사용", [50] = "체력 50% 이하�\188 �\140 자동사용"}
local fairySubGageRateText = {
[1] = {[0] = "정신�\165 회복제를 등록해주세요.", [10] = "정신�\165 10% 이하�\188 �\140 자동사용", [20] = "정신�\165 20% 이하�\188 �\140 자동사용", [30] = "정신�\165 30% 이하�\188 �\140 자동사용", [50] = "정신�\165 50% 이하�\188 �\140 자동사용"}
, 
[2] = {[0] = "투지 회복제를 등록해주세요.", [10] = "투지 10% 이하�\188 �\140 자동사용", [20] = "투지 20% 이하�\188 �\140 자동사용", [30] = "투지 30% 이하�\188 �\140 자동사용", [50] = "투지 50% 이하�\188 �\140 자동사용"}
, 
[3] = {[0] = "신성�\165 회복제를 등록해주세요.", [10] = "신성�\165 10% 이하�\188 �\140 자동사용", [20] = "신성�\165 20% 이하�\188 �\140 자동사용", [30] = "신성�\165 30% 이하�\188 �\140 자동사용", [50] = "신성�\165 50% 이하�\188 �\140 자동사용"}
}
local FairyList = {BTN_Close = (UI.getChildControl)(Panel_Window_FairyList, "Button_Win_Close"), BTN_Question = (UI.getChildControl)(Panel_Window_FairyList, "Button_Question"), List2_FairyList = (UI.getChildControl)(Panel_Window_FairyList, "List2_FairyList"), Static_FairySetting = (UI.getChildControl)(Panel_Window_FairyList, "Static_FairyListWindow"), Static_SkillList = (UI.getChildControl)(Static_FairySetting_all, "Static_SkillListBG2"), 
Radio_HpRate = {[0] = (UI.getChildControl)(Static_FairySetting_all, "Radiobutton_HP50Percent"), [10] = (UI.getChildControl)(Static_FairySetting_all, "Radiobutton_HP10Percent"), [20] = (UI.getChildControl)(Static_FairySetting_all, "Radiobutton_HP20Percent"), [30] = (UI.getChildControl)(Static_FairySetting_all, "Radiobutton_HP30Percent"), [50] = (UI.getChildControl)(Static_FairySetting_all, "Radiobutton_HP50Percent")}
, 
Radio_MpRate = {[0] = (UI.getChildControl)(Static_FairySetting_all, "Radiobutton_MP50Percent"), [10] = (UI.getChildControl)(Static_FairySetting_all, "Radiobutton_MP10Percent"), [20] = (UI.getChildControl)(Static_FairySetting_all, "Radiobutton_MP20Percent"), [30] = (UI.getChildControl)(Static_FairySetting_all, "Radiobutton_MP30Percent"), [50] = (UI.getChildControl)(Static_FairySetting_all, "Radiobutton_MP50Percent")}
, Slot_HpItem = (UI.getChildControl)(Static_FairySetting_all, "Static_HPItemSlotBig"), Slot_MpItem = (UI.getChildControl)(Static_FairySetting_all, "Static_MPItemSlotBig"), BTN_SettingYes = (UI.getChildControl)(Static_FairySetting_all, "Button_Yes"), BTN_SettingNo = (UI.getChildControl)(Static_FairySetting_all, "Button_No"), _currentPetNoStr = nil, 
_cacheSetting = {_hpKey = 0, _mpKey = 0, _hpRate = 0, _mpRate = 0}
, _isSubGageClassType = nil}
;
(FairyList.Static_SkillList):SetShow(true)
FairyList.GetSubGageRateText = function(self, value)
  -- function num : 0_2 , upvalues : fairySubGageRateText
  if (fairySubGageRateText[1])[value] == nil then
    value = 0
  end
  return (fairySubGageRateText[self._isSubGageClassType])[value]
end

PaGlobal_FairySetting_IsOpen = function()
  -- function num : 0_3 , upvalues : FairyList
  return (FairyList.Static_FairySetting):GetShow()
end

FairyList.ClearCache = function(self)
  -- function num : 0_4
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  (self._cacheSetting)._hpKey = ItemEnchantKey(0, 0)
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._cacheSetting)._mpKey = ItemEnchantKey(0, 0)
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._cacheSetting)._hpRate = 50
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._cacheSetting)._mpRate = 50
end

FairyList.SetPosition = function(self)
  -- function num : 0_5
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelSizeX = Panel_Window_FairyList:GetSizeX()
  local panelSizeY = Panel_Window_FairyList:GetSizeY()
  Panel_Window_FairyList:SetPosX(scrSizeX / 2)
  Panel_Window_FairyList:SetPosY(scrSizeY / 2 - panelSizeY / 2 - 100)
end

FairyList.Open = function(self)
  -- function num : 0_6 , upvalues : spiritClass, ClassType_Valkiry
  if self._isSubGageClassType == nil then
    local selfPlayer = getSelfPlayer()
    local classType = selfPlayer:getClassType()
    self._isSubGageClassType = 1
    for ii = 0, #spiritClass do
      if classType == spiritClass[ii] then
        self._isSubGageClassType = 2
      end
    end
    if ClassType_Valkiry == classType then
      self._isSubGageClassType = 3
    end
  end
  do
    self:SetPosition()
    Panel_Window_FairyList:SetShow(true, true)
    ;
    (self.Static_FairySetting):SetShow(false, false)
    self:ClearCache()
    self:SetFairyList()
  end
end

FairyList.SetFairyList = function(self, noclearscroll)
  -- function num : 0_7
  if not Panel_Window_FairyList:GetShow() then
    return 
  end
  local toIndex = 0
  local scrollvalue = 0
  local vscroll = (self.List2_FairyList):GetVScroll()
  local hscroll = (self.List2_FairyList):GetHScroll()
  if noclearscroll then
    toIndex = (self.List2_FairyList):getCurrenttoIndex()
    if (self.List2_FairyList):IsIgnoreVerticalScroll() == false then
      scrollvalue = vscroll:GetControlPos()
    else
      if (self.List2_FairyList):IsIgnoreHorizontalScroll() == false then
        scrollvalue = hscroll:GetControlPos()
      end
    end
  end
  ;
  ((self.List2_FairyList):getElementManager()):clearKey()
  self.UnSealDATACount = ToClient_getFairyUnsealedList()
  self.SealDATACount = ToClient_getFairySealedList()
  local petCount = self.UnSealDATACount + self.SealDATACount
  for index = 0, petCount do
    local petNo = nil
    if index == 0 and self.UnSealDATACount == 0 then
      petNo = toInt64(0, -1)
    else
      if index < self.UnSealDATACount then
        local petData = ToClient_getFairyUnsealedDataByIndex(index)
        if petData ~= nil then
          petNo = petData:getPcPetNo()
        end
      else
        do
          index = index - self.UnSealDATACount
          if self.UnSealDATACount == 0 then
            index = index - 1
          end
          do
            do
              local petData = ToClient_getFairySealedDataByIndex(index)
              if petData ~= nil then
                petNo = petData._petNo
              end
              if petNo ~= nil then
                ((self.List2_FairyList):getElementManager()):pushKey(petNo)
              end
              -- DECOMPILER ERROR at PC99: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC99: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC99: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC99: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC99: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC99: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
  if noclearscroll then
    (self.List2_FairyList):setCurrenttoIndex(toIndex)
    if (self.List2_FairyList):IsIgnoreVerticalScroll() == false then
      vscroll:SetControlPos(scrollvalue)
    else
      if (self.List2_FairyList):IsIgnoreHorizontalScroll() == false then
        hscroll:SetControlPos(scrollvalue)
      end
    end
  end
end

FairyList = function(control, key)
  -- function num : 0_8 , upvalues : UI_TM, FairyHpRateText, FairyList
  local bg = (UI.getChildControl)(control, "Template_Static_ListContentBG")
  local iconBg = (UI.getChildControl)(control, "Template_Static_IconFairyBG")
  local icon = (UI.getChildControl)(control, "Template_Static_IconFairy")
  local name = (UI.getChildControl)(control, "Template_StaticText_FairyName")
  local btn_Setting = (UI.getChildControl)(control, "Template_Button_Setting")
  local btn_unSeal = (UI.getChildControl)(control, "Template_Button_Unseal")
  local btn_Seal = (UI.getChildControl)(control, "Template_Button_Seal")
  local slot_HpItem = (UI.getChildControl)(control, "Static_HPItemSlot")
  local slot_MpItem = (UI.getChildControl)(control, "Static_MPItemSlot")
  local text_HpItem = (UI.getChildControl)(control, "StaticText_HPItemSlotBG")
  local text_MpItem = (UI.getChildControl)(control, "StaticText_MPItemSlotBG")
  local noUnsealpet = (UI.getChildControl)(control, "StaticText_NoneUnsealFairy")
  local sealPetCount = ToClient_getFairySealedList()
  local unsealPetCount = ToClient_getFairyUnsealedList()
  local isUnsealPet = function(petNo_s64)
    -- function num : 0_8_0 , upvalues : unsealPetCount
    if unsealPetCount > 0 then
      for index = 0, unsealPetCount - 1 do
        local pcPetData = ToClient_getFairyUnsealedDataByIndex(index)
        if petNo_s64 == pcPetData:getPcPetNo() then
          return true
        end
      end
    end
    do
      return false
    end
  end

  local isShow = nil
  if toInt64(0, -1) == key then
    isShow = false
  else
    isShow = true
  end
  iconBg:SetShow(isShow)
  icon:SetShow(isShow)
  name:SetShow(isShow)
  name:SetIgnore(false)
  btn_Setting:SetShow(isShow)
  btn_unSeal:SetShow(isShow)
  btn_Seal:SetShow(isShow)
  slot_HpItem:SetShow(isShow)
  slot_MpItem:SetShow(isShow)
  text_HpItem:SetShow(isShow)
  text_MpItem:SetShow(isShow)
  noUnsealpet:SetShow(not isShow)
  if not isShow then
    return 
  end
  local petStaticStatus, iconPath, petNo_s64, petName, petLevel, petLovely, pethungry, petMaxLevel, petMaxHungry, petRace, petTier, petState, skillType, isPassive, tempIndex = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
  if isUnsealPet(key) then
    for index = 0, unsealPetCount - 1 do
      local pcPetData = ToClient_getFairyUnsealedDataByIndex(index)
      if pcPetData ~= nil and key == pcPetData:getPcPetNo() then
        petStaticStatus = pcPetData:getPetStaticStatus()
        iconPath = pcPetData:getIconPath()
        petNo_s64 = pcPetData:getPcPetNo()
        petName = pcPetData:getName()
        if pcPetData:getSkillParam(1) ~= nil then
          skillType = (pcPetData:getSkillParam(1))._type
          isPassive = (pcPetData:getSkillParam(1)):isPassiveSkill()
        end
        name:SetTextMode(UI_TM.eTextMode_LimitText)
        name:SetText(petName)
        if name:IsLimitText() then
          name:addInputEvent("Mouse_On", "PetListNew_NameSimpleTooltip( true,\t" .. index .. ", " .. tostring(true) .. ", " .. tostring(key) .. ")")
          name:addInputEvent("Mouse_Out", "PetListNew_NameSimpleTooltip( false,\t" .. index .. ", " .. tostring(true) .. ", " .. tostring(key) .. ")")
        else
          name:addInputEvent("Mouse_On", "")
          name:addInputEvent("Mouse_Out", "")
        end
        btn_unSeal:addInputEvent("Mouse_LUp", "PaGlobal_FairyList_UnSeal( \"" .. tostring(petNo_s64) .. "\")")
        btn_Seal:addInputEvent("Mouse_LUp", "PaGlobal_FairyList_Seal( \"" .. tostring(petNo_s64) .. "\")")
        btn_Setting:addInputEvent("Mouse_LUp", "PaGlobal_FairyList_Setting(\"" .. tostring(petNo_s64) .. "\")")
        local SettingData = ToClient_getFairySettingData(petNo_s64)
        if SettingData ~= nil then
          text_HpItem:SetText(FairyHpRateText[SettingData._hpMinRate])
          text_MpItem:SetText(FairyList:GetSubGageRateText(SettingData._mpMinRate))
          local ItemSSW = getItemEnchantStaticStatus(SettingData._hpItemKey)
          if ItemSSW ~= nil then
            slot_HpItem:ChangeTextureInfoName("Icon/" .. ItemSSW:getIconPath())
            slot_HpItem:setRenderTexture(slot_HpItem:getBaseTexture())
            slot_HpItem:SetShow(true)
          else
            slot_HpItem:SetShow(false)
          end
          ItemSSW = getItemEnchantStaticStatus(SettingData._mpItemKey)
          if ItemSSW ~= nil then
            slot_MpItem:ChangeTextureInfoName("Icon/" .. ItemSSW:getIconPath())
            slot_MpItem:setRenderTexture(slot_MpItem:getBaseTexture())
            slot_MpItem:SetShow(true)
          else
            slot_MpItem:SetShow(false)
          end
        else
          do
            do
              text_HpItem:SetText(FairyHpRateText[50])
              text_MpItem:SetText(FairyList:GetSubGageRateText(50))
              slot_MpItem:SetShow(false)
              slot_HpItem:SetShow(false)
              btn_unSeal:SetShow(false)
              btn_Seal:SetShow(true)
              -- DECOMPILER ERROR at PC322: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC322: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC322: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC322: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC322: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
    local uiIndex = 0
  else
    do
      do
        local unsealPetIndex = -1
        for index = 0, sealPetCount - 1 do
          local pcPetData = ToClient_getFairySealedDataByIndex(index)
          if pcPetData ~= nil and key == pcPetData._petNo then
            petStaticStatus = pcPetData:getPetStaticStatus()
            iconPath = pcPetData:getIconPath()
            petNo_s64 = pcPetData._petNo
            petName = pcPetData:getName()
            petRace = petStaticStatus:getPetRace()
            if pcPetData:getSkillParam(1) ~= nil then
              skillType = (pcPetData:getSkillParam(1))._type
              isPassive = (pcPetData:getSkillParam(1)):isPassiveSkill()
            end
            name:SetTextMode(UI_TM.eTextMode_LimitText)
            name:SetText(petName)
            if name:IsLimitText() then
              name:addInputEvent("Mouse_On", "PetListNew_NameSimpleTooltip( true,\t" .. index .. ", " .. tostring(false) .. ", " .. tostring(key) .. ")")
              name:addInputEvent("Mouse_Out", "PetListNew_NameSimpleTooltip( false,\t" .. index .. ", " .. tostring(false) .. ", " .. tostring(key) .. ")")
            else
              name:addInputEvent("Mouse_On", "")
              name:addInputEvent("Mouse_Out", "")
            end
            unsealPetIndex = index
            btn_unSeal:addInputEvent("Mouse_LUp", "PaGlobal_FairyList_UnSeal( \"" .. tostring(petNo_s64) .. "\")")
            btn_Seal:addInputEvent("Mouse_LUp", "PaGlobal_FairyList_Seal( \"" .. tostring(petNo_s64) .. "\")")
            btn_Setting:addInputEvent("Mouse_LUp", "PaGlobal_FairyList_Setting(\"" .. tostring(petNo_s64) .. "\")")
            local SettingData = ToClient_getFairySettingData(petNo_s64)
            if SettingData ~= nil then
              text_HpItem:SetText(FairyHpRateText[SettingData._hpMinRate])
              text_MpItem:SetText(FairyList:GetSubGageRateText(SettingData._mpMinRate))
              local ItemSSW = getItemEnchantStaticStatus(SettingData._hpItemKey)
              if ItemSSW ~= nil then
                slot_HpItem:ChangeTextureInfoName("Icon/" .. ItemSSW:getIconPath())
                slot_HpItem:setRenderTexture(slot_HpItem:getBaseTexture())
                slot_HpItem:SetShow(true)
              else
                slot_HpItem:SetShow(false)
              end
              ItemSSW = getItemEnchantStaticStatus(SettingData._mpItemKey)
              if ItemSSW ~= nil then
                slot_MpItem:ChangeTextureInfoName("Icon/" .. ItemSSW:getIconPath())
                slot_MpItem:setRenderTexture(slot_MpItem:getBaseTexture())
                slot_MpItem:SetShow(true)
              else
                slot_MpItem:SetShow(false)
              end
            else
              do
                do
                  text_HpItem:SetText(FairyHpRateText[50])
                  text_MpItem:SetText(FairyList:GetSubGageRateText(50))
                  slot_MpItem:SetShow(false)
                  slot_HpItem:SetShow(false)
                  btn_unSeal:SetShow(true)
                  btn_Seal:SetShow(false)
                  btn_unSeal:addInputEvent("Mouse_RUp", "PaGlobal_FairyComposeSetting(\"" .. tostring(petNo_s64) .. "," .. petRace .. "," .. unsealPetIndex .. "\")")
                  -- DECOMPILER ERROR at PC541: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC541: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC541: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC541: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC541: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
        icon:ChangeTextureInfoName(iconPath)
      end
    end
  end
end

PaGlobal_FairyList_Question = function()
  -- function num : 0_9
  _PA_LOG("�\128민혁", "요정 도움말정보를 요청합니�\164. 함수 내부구현해주세요...")
end

PaGlobal_FairyList_Close = function()
  -- function num : 0_10 , upvalues : Static_FairySetting_all
  Panel_Window_FairyList:SetShow(false, false)
  Static_FairySetting_all:SetShow(false, false)
end

PaGlobal_FairyList_UnSeal = function(petNoStr)
  -- function num : 0_11 , upvalues : FairyList
  audioPostEvent_SystemUi(1, 40)
  local self = FairyList
  local petNo_s64 = tonumber64(petNoStr)
  if self.UnSealDATACount ~= 0 then
    Proc_ShowMessage_Ack_WithOut_ChattingMessage(PAGetString(Defines.StringSheet_GAME, "LUA_UNABLE_SUMMON_PET"))
    return 
  end
  ToClient_requestPetUnseal(petNo_s64)
end

PaGlobal_FairyList_Seal = function(petNoStr)
  -- function num : 0_12 , upvalues : FairyList
  audioPostEvent_SystemUi(1, 40)
  local self = FairyList
  local petNo_s64 = tonumber64(petNoStr)
  ToClient_requestPetSeal(petNo_s64)
end

PaGlobal_FairyList_Setting = function(petNoStr)
  -- function num : 0_13 , upvalues : FairyList
  audioPostEvent_SystemUi(1, 40)
  local self = FairyList
  if (self.Static_FairySetting):GetShow() == true then
    PaGlobal_FairyList_SetNo()
    return 
  end
  self._currentPetNoStr = petNoStr
  ;
  (self.Static_FairySetting):SetShow(true, true)
  self:Update_Setting(petNoStr, true)
end

PaGlobal_FairySettingList_GetShow = function()
  -- function num : 0_14 , upvalues : FairyList
  local self = FairyList
  return (self.Static_FairySetting):GetShow()
end

PaGlobal_FairyList_SetYes = function()
  -- function num : 0_15 , upvalues : FairyList
  local self = FairyList
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R1 in 'UnsetPending'

  if ItemEnchantKey(0, 0) == (self._cacheSetting)._hpKey then
    (self._cacheSetting)._hpRate = 0
  end
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R1 in 'UnsetPending'

  if ItemEnchantKey(0, 0) == (self._cacheSetting)._mpKey then
    (self._cacheSetting)._mpRate = 0
  end
  ToClient_setFairySettingData(tonumber64(self._currentPetNoStr), (self._cacheSetting)._hpKey, (self._cacheSetting)._hpRate, (self._cacheSetting)._mpKey, (self._cacheSetting)._mpRate)
  ;
  (self.Static_FairySetting):SetShow(false, false)
  self:SetFairyList()
end

PaGlobal_FairyList_SetNo = function()
  -- function num : 0_16 , upvalues : FairyList
  local self = FairyList
  self._currentPetNoStr = nil
  self:ClearCache()
  ;
  (self.Static_FairySetting):SetShow(false, false)
end

FairyList.Update_Setting = function(self, petNoStr, notDataUpdate)
  -- function num : 0_17
  local petNo_s64 = tonumber64(petNoStr)
  local settingData = ToClient_getFairySettingData(petNo_s64)
  if notDataUpdate then
    if settingData == nil then
      self:ClearCache()
    else
      -- DECOMPILER ERROR at PC15: Confused about usage of register: R5 in 'UnsetPending'

      ;
      (self._cacheSetting)._hpKey = settingData._hpItemKey
      -- DECOMPILER ERROR at PC18: Confused about usage of register: R5 in 'UnsetPending'

      ;
      (self._cacheSetting)._mpKey = settingData._mpItemKey
      -- DECOMPILER ERROR at PC21: Confused about usage of register: R5 in 'UnsetPending'

      ;
      (self._cacheSetting)._hpRate = settingData._hpMinRate
      -- DECOMPILER ERROR at PC24: Confused about usage of register: R5 in 'UnsetPending'

      ;
      (self._cacheSetting)._mpRate = settingData._mpMinRate
      -- DECOMPILER ERROR at PC30: Confused about usage of register: R5 in 'UnsetPending'

      if (self._cacheSetting)._hpRate <= 0 then
        (self._cacheSetting)._hpRate = 50
      end
      -- DECOMPILER ERROR at PC36: Confused about usage of register: R5 in 'UnsetPending'

      if (self._cacheSetting)._mpRate <= 0 then
        (self._cacheSetting)._mpRate = 50
      end
    end
  end
  for key,value in pairs(self.Radio_HpRate) do
    value:SetCheck(false)
  end
  for key,value in pairs(self.Radio_MpRate) do
    value:SetCheck(false)
  end
  ;
  ((self.Radio_HpRate)[(self._cacheSetting)._hpRate]):SetCheck(true)
  ;
  ((self.Radio_MpRate)[(self._cacheSetting)._mpRate]):SetCheck(true)
  local ItemHpSSW, ItemMpSSW = nil, nil
  if (self._cacheSetting)._hpKey ~= 0 then
    ItemHpSSW = getItemEnchantStaticStatus((self._cacheSetting)._hpKey)
  end
  if ItemHpSSW ~= nil then
    (self.Slot_HpItem):ChangeTextureInfoName("Icon/" .. ItemHpSSW:getIconPath())
    ;
    (self.Slot_HpItem):setRenderTexture((self.Slot_HpItem):getBaseTexture())
    ;
    (self.Slot_HpItem):SetShow(true)
  else
    ;
    (self.Slot_HpItem):SetShow(false)
  end
  if (self._cacheSetting)._mpKey ~= 0 then
    ItemMpSSW = getItemEnchantStaticStatus((self._cacheSetting)._mpKey)
  end
  if ItemMpSSW ~= nil then
    (self.Slot_MpItem):ChangeTextureInfoName("Icon/" .. ItemMpSSW:getIconPath())
    ;
    (self.Slot_MpItem):setRenderTexture((self.Slot_MpItem):getBaseTexture())
    ;
    (self.Slot_MpItem):SetShow(true)
  else
    ;
    (self.Slot_MpItem):SetShow(false)
  end
end

PaGlobal_FairyList_HpRateCheck = function(rate)
  -- function num : 0_18 , upvalues : FairyList
  local self = FairyList
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._cacheSetting)._hpRate = tonumber(rate)
end

PaGlobal_FairyList_MpRateCheck = function(mpCheck)
  -- function num : 0_19 , upvalues : FairyList
  local self = FairyList
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._cacheSetting)._mpRate = tonumber(mpCheck)
end

PaGlobal_FairyList_IsHp = function(hpKeyStr)
  -- function num : 0_20 , upvalues : fairyMainPotionData
  local key = tonumber(hpKeyStr)
  for idx,value in pairs(fairyMainPotionData) do
    if key == value then
      return true
    end
  end
  return false
end

PaGlobal_FairyList_IsMp = function(mpKeyStr)
  -- function num : 0_21 , upvalues : fairySubPotionData, FairyList
  local key = tonumber(mpKeyStr)
  for idx,value in pairs(fairySubPotionData[FairyList._isSubGageClassType]) do
    if key == value then
      return true
    end
  end
  return false
end

FromClient_FairyUpdate = function()
  -- function num : 0_22 , upvalues : FairyList
  FairyList:SetFairyList()
end

PaGlobal_FairySetting_HpReset = function()
  -- function num : 0_23 , upvalues : FairyList
  local self = FairyList
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._cacheSetting)._hpKey = ItemEnchantKey(0, 0)
  Panel_Tooltip_Item_hideTooltip()
  self:Update_Setting(self._currentPetNoStr, false)
end

PaGlobal_FairySetting_MpReset = function()
  -- function num : 0_24 , upvalues : FairyList
  local self = FairyList
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._cacheSetting)._mpKey = ItemEnchantKey(0, 0)
  Panel_Tooltip_Item_hideTooltip()
  self:Update_Setting(self._currentPetNoStr, false)
end

FromClient_ShowFairyMessageByType = function(msgType)
  -- function num : 0_25 , upvalues : FairyMessageType
  if ToClient_IsDevelopment() == false then
    return 
  end
  if FairyMessageType.eTurnOnLantern == msgType then
    Proc_ShowMessage_Ack("요정�\180 주변�\132 밝혀줍니�\164.")
  else
    if FairyMessageType.eTurnOffLantern == msgType then
      Proc_ShowMessage_Ack("요정�\152 밝은 빛이 사라집니�\164.")
    else
      _PA_LOG("�\128민혁", "정의되지 않은 값이 들어왔습니다. msgType = " .. tostring(msgType) .. " , GameEnginePetManager.h �\144 enum �\146 확인해주세요.")
    end
  end
end

FairyList.Initialize = function(self)
  -- function num : 0_26
  (self.List2_FairyList):registEvent((CppEnums.PAUIList2EventType).luaChangeContent, "FairyListCreate")
  ;
  (self.List2_FairyList):createChildContent((CppEnums.PAUIList2ElementManagerType).list)
  ;
  (self.BTN_Close):addInputEvent("Mouse_LUp", "PaGlobal_FairyList_Close()")
  ;
  (self.BTN_Question):addInputEvent("Mouse_LUp", "PaGlobal_FairyList_Question()")
  ;
  (self.Static_FairySetting):SetShow(false, false)
  ;
  (self.BTN_SettingYes):addInputEvent("Mouse_LUp", "PaGlobal_FairyList_SetYes()")
  ;
  (self.BTN_SettingNo):addInputEvent("Mouse_LUp", "PaGlobal_FairyList_SetNo()")
  registerEvent("FromClient_PetAddSealedList", "FromClient_FairyUpdate")
  registerEvent("FromClient_PetDelSealedList", "FromClient_FairyUpdate")
  registerEvent("FromClient_PetDelList", "FromClient_FairyUpdate")
  registerEvent("FromClient_InputPetName", "FromClient_FairyUpdate")
  registerEvent("FromClient_PetInfoChanged", "FromClient_FairyUpdate")
  registerEvent("FromClient_ShowFairyMessageByType", "FromClient_ShowFairyMessageByType")
  ;
  ((self.Radio_HpRate)[10]):addInputEvent("Mouse_LUp", "PaGlobal_FairyList_HpRateCheck(10)")
  ;
  ((self.Radio_HpRate)[20]):addInputEvent("Mouse_LUp", "PaGlobal_FairyList_HpRateCheck(20)")
  ;
  ((self.Radio_HpRate)[30]):addInputEvent("Mouse_LUp", "PaGlobal_FairyList_HpRateCheck(30)")
  ;
  ((self.Radio_HpRate)[50]):addInputEvent("Mouse_LUp", "PaGlobal_FairyList_HpRateCheck(50)")
  ;
  ((self.Radio_MpRate)[10]):addInputEvent("Mouse_LUp", "PaGlobal_FairyList_MpRateCheck(10)")
  ;
  ((self.Radio_MpRate)[20]):addInputEvent("Mouse_LUp", "PaGlobal_FairyList_MpRateCheck(20)")
  ;
  ((self.Radio_MpRate)[30]):addInputEvent("Mouse_LUp", "PaGlobal_FairyList_MpRateCheck(30)")
  ;
  ((self.Radio_MpRate)[50]):addInputEvent("Mouse_LUp", "PaGlobal_FairyList_MpRateCheck(50)")
  ;
  (self.Slot_HpItem):addInputEvent("Mouse_RUp", "PaGlobal_FairySetting_HpReset()")
  ;
  (self.Slot_MpItem):addInputEvent("Mouse_RUp", "PaGlobal_FairySetting_MpReset()")
  ;
  (self.Slot_HpItem):addInputEvent("Mouse_On", "HandleClicked_OnOut_ShowHpEquipItemToolTip(true)")
  ;
  (self.Slot_HpItem):addInputEvent("Mouse_Out", "HandleClicked_OnOut_ShowHpEquipItemToolTip(false)")
  ;
  (self.Slot_MpItem):addInputEvent("Mouse_On", "HandleClicked_OnOut_ShowMpEquipItemToolTip(true)")
  ;
  (self.Slot_MpItem):addInputEvent("Mouse_Out", "HandleClicked_OnOut_ShowMpEquipItemToolTip(false)")
end

HandleClicked_OnOut_ShowHpEquipItemToolTip = function(isShow)
  -- function num : 0_27 , upvalues : FairyList
  local self = FairyList
  local selfPlayer = (getSelfPlayer()):get()
  local inventory = selfPlayer:getInventoryByType((CppEnums.ItemWhereType).eInventory)
  local slotNo = inventory:getSlot((self._cacheSetting)._hpKey)
  if isShow == true then
    local itemWrapper = getInventoryItem(slotNo)
    if itemWrapper == nil then
      return 
    end
    local SlotIcon = self.Slot_HpItem
    Panel_Tooltip_Item_Show(itemWrapper, SlotIcon, false, true)
  else
    do
      Panel_Tooltip_Item_hideTooltip()
    end
  end
end

HandleClicked_OnOut_ShowMpEquipItemToolTip = function(isShow)
  -- function num : 0_28 , upvalues : FairyList
  local self = FairyList
  local selfPlayer = (getSelfPlayer()):get()
  local inventory = selfPlayer:getInventoryByType((CppEnums.ItemWhereType).eInventory)
  local slotNo = inventory:getSlot((self._cacheSetting)._mpKey)
  if isShow == true then
    local itemWrapper = getInventoryItem(slotNo)
    if itemWrapper == nil then
      return 
    end
    local SlotIcon = self.Slot_HpItem
    Panel_Tooltip_Item_Show(itemWrapper, SlotIcon, false, true)
  else
    do
      Panel_Tooltip_Item_hideTooltip()
    end
  end
end

local FairyCompose = {_button_Compose = (UI.getChildControl)(Panel_Window_FairyList, "Button_Compose"), icon_1 = (UI.getChildControl)(Panel_Window_FairyCompose, "Static_Icon_1"), icon_2 = (UI.getChildControl)(Panel_Window_FairyCompose, "Static_Icon_2"), icon_3 = (UI.getChildControl)(Panel_Window_FairyCompose, "Static_Icon_3"), icon_question = (UI.getChildControl)(Panel_Window_FairyCompose, "StaticText_QuestionMark"), editName = (UI.getChildControl)(Panel_Window_FairyCompose, "Edit_Naming"), desc = (UI.getChildControl)(Panel_Window_FairyCompose, "StaticText_Desc"), descBg = (UI.getChildControl)(Panel_Window_FairyCompose, "Static_DescBg"), btn_Yes = (UI.getChildControl)(Panel_Window_FairyCompose, "Button_Yes"), btn_No = (UI.getChildControl)(Panel_Window_FairyCompose, "Button_No"), btn_Question = (UI.getChildControl)(Panel_Window_FairyCompose, "Button_Question"), radioBtn_PetSkill_1 = (UI.getChildControl)(Panel_Window_FairyCompose, "RadioButton_Skill_1"), radioBtn_PetSkill_2 = (UI.getChildControl)(Panel_Window_FairyCompose, "RadioButton_Skill_2"), radioBtn_PetSkill_3 = (UI.getChildControl)(Panel_Window_FairyCompose, "RadioButton_Skill_3"), radioBtn_PetLook_1 = (UI.getChildControl)(Panel_Window_FairyCompose, "RadioButton_Look_1"), radioBtn_PetLook_2 = (UI.getChildControl)(Panel_Window_FairyCompose, "RadioButton_Look_2"), radioBtn_PetLook_3 = (UI.getChildControl)(Panel_Window_FairyCompose, "RadioButton_Look_3"), 
skillSlotBg = {
[1] = {[1] = (UI.getChildControl)(Panel_Window_FairyCompose, "Static_SkillSlotBg_1_1"), [2] = (UI.getChildControl)(Panel_Window_FairyCompose, "Static_SkillSlotBg_1_2"), [3] = (UI.getChildControl)(Panel_Window_FairyCompose, "Static_SkillSlotBg_1_3")}
, 
[2] = {[1] = (UI.getChildControl)(Panel_Window_FairyCompose, "Static_SkillSlotBg_2_1"), [2] = (UI.getChildControl)(Panel_Window_FairyCompose, "Static_SkillSlotBg_2_2"), [3] = (UI.getChildControl)(Panel_Window_FairyCompose, "Static_SkillSlotBg_2_3")}
, 
[3] = {[1] = (UI.getChildControl)(Panel_Window_FairyCompose, "Static_SkillSlotBg_3_1"), [2] = (UI.getChildControl)(Panel_Window_FairyCompose, "Static_SkillSlotBg_3_2"), [3] = (UI.getChildControl)(Panel_Window_FairyCompose, "Static_SkillSlotBg_3_3")}
}
, 
skillSlot = {
[1] = {[1] = (UI.getChildControl)(Panel_Window_FairyCompose, "Static_SkillPetSlot_1_1"), [2] = (UI.getChildControl)(Panel_Window_FairyCompose, "Static_SkillPetSlot_1_2"), [3] = (UI.getChildControl)(Panel_Window_FairyCompose, "Static_SkillPetSlot_1_3")}
, 
[2] = {[1] = (UI.getChildControl)(Panel_Window_FairyCompose, "Static_SkillPetSlot_2_1"), [2] = (UI.getChildControl)(Panel_Window_FairyCompose, "Static_SkillPetSlot_2_2"), [3] = (UI.getChildControl)(Panel_Window_FairyCompose, "Static_SkillPetSlot_2_3")}
, 
[3] = {[1] = (UI.getChildControl)(Panel_Window_FairyCompose, "Static_SkillPetSlot_3_1"), [2] = (UI.getChildControl)(Panel_Window_FairyCompose, "Static_SkillPetSlot_3_2"), [3] = (UI.getChildControl)(Panel_Window_FairyCompose, "Static_SkillPetSlot_3_3")}
}
, 
skillNoList = {nil, nil, nil, nil, nil; [0] = nil}
, preserveSkillNo = nil, 
FairyComposeNo = {[0] = nil, [1] = nil}
, race = nil}
FairyCompose.Initialize = function(self)
  -- function num : 0_29
  (self._button_Compose):addInputEvent("Mouse_LUp", "PaGlobal_FairyComposeOpen()")
  ;
  (self.btn_Yes):addInputEvent("Mouse_LUp", "Confirm_FairyCompose()")
  ;
  (self.btn_No):addInputEvent("Mouse_LUp", "PaGlobal_FairyComposeClose()")
  ;
  (self.editName):addInputEvent("Mouse_LUp", "HandleClicked_FairyCompose_ClearEdit()")
  ;
  (self.radioBtn_PetSkill_1):addInputEvent("Mouse_LUp", "FairyCompose_UpdateFairySkillList()")
  ;
  (self.radioBtn_PetSkill_2):addInputEvent("Mouse_LUp", "FairyCompose_UpdateFairySkillList()")
  ;
  (self.radioBtn_PetSkill_3):addInputEvent("Mouse_LUp", "FairyCompose_UpdateFairySkillList()")
  ;
  (self.radioBtn_PetLook_1):addInputEvent("Mouse_LUp", "FairyCompose_UpdateFairySkillList()")
  ;
  (self.radioBtn_PetLook_2):addInputEvent("Mouse_LUp", "FairyCompose_UpdateFairySkillList()")
  ;
  (self.radioBtn_PetLook_3):addInputEvent("Mouse_LUp", "FairyCompose_UpdateFairySkillList()")
end

FairyCompose_Init = function()
  -- function num : 0_30 , upvalues : FairyCompose
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R0 in 'UnsetPending'

  (FairyCompose.FairyComposeNo)[0] = nil
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

  ;
  (FairyCompose.FairyComposeNo)[1] = nil
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R0 in 'UnsetPending'

  FairyCompose._race = nil
  ;
  (FairyCompose.icon_1):ChangeTextureInfoName("")
  ;
  (FairyCompose.icon_2):ChangeTextureInfoName("")
  ;
  (FairyCompose.icon_3):ChangeTextureInfoName("")
  ;
  (FairyCompose.icon_1):SetShow(false)
  ;
  (FairyCompose.icon_2):SetShow(false)
  ;
  (FairyCompose.icon_3):SetShow(false)
  composableCheck = false
  -- DECOMPILER ERROR at PC41: Confused about usage of register: R0 in 'UnsetPending'

  FairyCompose.preserveSkillNo = nil
  ClearFocusEdit(FairyCompose.editName)
  ;
  (FairyCompose.radioBtn_PetSkill_1):SetCheck(false)
  ;
  (FairyCompose.radioBtn_PetSkill_2):SetCheck(false)
  ;
  (FairyCompose.radioBtn_PetSkill_3):SetCheck(true)
  ;
  (FairyCompose.radioBtn_PetLook_1):SetCheck(false)
  ;
  (FairyCompose.radioBtn_PetLook_2):SetCheck(false)
  ;
  (FairyCompose.radioBtn_PetLook_3):SetCheck(true)
  ;
  (FairyCompose.radioBtn_PetLook_2):SetShow(true)
  ;
  (FairyCompose.radioBtn_PetSkill_2):SetShow(true)
  for index = 1, 3 do
    (((FairyCompose.skillSlotBg)[index])[1]):SetShow(true)
    ;
    (((FairyCompose.skillSlotBg)[index])[2]):SetShow(true)
    ;
    (((FairyCompose.skillSlotBg)[index])[3]):SetShow(true)
    ;
    (((FairyCompose.skillSlot)[index])[1]):SetShow(false)
    ;
    (((FairyCompose.skillSlot)[index])[2]):SetShow(false)
    ;
    (((FairyCompose.skillSlot)[index])[3]):SetShow(false)
  end
  FairyCompose_UpdateFairySkillList()
end

local petComposeString = PAGetString(Defines.StringSheet_GAME, "PANEL_PETLIST_PETCOMPOSE_NAME")
local petComposeDesc = PAGetString(Defines.StringSheet_GAME, "PANEL_PETLIST_PETCOMPOSE_DESC")
FairyCompose.Open = function(self)
  -- function num : 0_31 , upvalues : nowFairyCompose, FairyCompose, petComposeString, composeFairyTier
  nowFairyCompose = true
  Panel_Window_FairyCompose:SetShow(true)
  Panel_Window_FairyCompose:SetPosX(Panel_Window_FairyList:GetPosX() + Panel_Window_FairyList:GetSizeX() + 10)
  Panel_Window_FairyCompose:SetPosY(Panel_Window_FairyList:GetPosY())
  FairyCompose_Init()
  ;
  (FairyCompose.editName):SetEditText(petComposeString)
  composeFairyTier = 0
end

FairyCompose.Clear = function(self)
  -- function num : 0_32
end

FairyCompose.Close = function(self)
  -- function num : 0_33 , upvalues : nowFairyCompose
  nowFairyCompose = false
  Panel_Window_FairyCompose:SetShow(false)
end

FairyList_Compose = function()
  -- function num : 0_34
end

PaGlobal_FairyComposeOpen = function()
  -- function num : 0_35 , upvalues : FairyCompose
  FairyCompose:Open()
end

PaGlobal_FairyComposeClose = function()
  -- function num : 0_36 , upvalues : FairyCompose
  FairyCompose:Close()
end

testFairy1 = function()
  -- function num : 0_37
  PaGlobal_FairyComposeSetting("2404", 1, 1)
end

testFairy2 = function()
  -- function num : 0_38
  PaGlobal_FairyComposeSetting("2405", 1, 1)
end

testFairy3 = function()
  -- function num : 0_39
  PaGlobal_FairyComposeSetting("2422", 1, 3)
end

PaGlobal_FairyComposeSetting = function(fairyNoStr, fairyRace, sealFairyIndex)
  -- function num : 0_40 , upvalues : FairyCompose, FairyList
  local self = FairyCompose
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R4 in 'UnsetPending'

  if (self.FairyComposeNo)[0] == nil then
    (self.FairyComposeNo)[0] = tonumber64(fairyNoStr)
    PaGlobal_FairyImgChange((self.FairyComposeNo)[0], 0)
    -- DECOMPILER ERROR at PC16: Confused about usage of register: R4 in 'UnsetPending'

    FairyCompose._curRace = fairyRace
    FairyCompose_UpdateFairySkillList()
    composePetTier = composeFairyNo((self.FairyComposeNo)[0])
    FairyCompose_SkillSet(sealFairyIndex, 1)
  else
    -- DECOMPILER ERROR at PC37: Confused about usage of register: R4 in 'UnsetPending'

    if (self.FairyComposeNo)[1] == nil then
      (self.FairyComposeNo)[1] = tonumber64(fairyNoStr)
      PaGlobal_FairyImgChange((self.FairyComposeNo)[1], 1)
      FairyCompose_UpdateFairySkillList()
      FairyCompose_SkillSet(sealFairyIndex, 2)
    end
  end
  FairyList:SetFairyList(true)
end

composeFairyNo = function(fairyNo)
  -- function num : 0_41
  for sealFairyIndex = 0, ToClient_getFairySealedList() - 1 do
    local fairyData = ToClient_getFairySealedDataByIndex(sealFairyIndex)
    local _fairyNo = fairyData._petNo
    if fairyNo == _fairyNo then
      local fairySS = fairyData:getPetStaticStatus()
      local fairyTier = fairySS:getPetTier() + 1
      return fairyTier
    end
  end
end

PaGlobal_FairyImgChange = function(fairyNo, index)
  -- function num : 0_42 , upvalues : FairyCompose
  for sealFairyIndex = 0, ToClient_getFairySealedList() - 1 do
    local fairyData = ToClient_getPetSealedDataByIndex(sealFairyIndex)
    local _fairyNo = fairyData._petNo
    if fairyNo == _fairyNo then
      local petSS = fairyData:getPetStaticStatus()
      local iconPath = fairyData:getIconPath()
      if index == 0 then
        (FairyCompose.icon_1):ChangeTextureInfoName(iconPath)
        ;
        (FairyCompose.icon_1):SetShow(true)
      else
        if index == 1 then
          (FairyCompose.icon_2):ChangeTextureInfoName(iconPath)
          ;
          (FairyCompose.icon_2):SetShow(true)
        end
      end
    end
  end
end

FairyCompose_SkillSet = function(fairyIndex, uiIndex)
  -- function num : 0_43 , upvalues : FairyCompose
  local self = FairyCompose
  local fairyData = ToClient_getFairySealedDataByIndex(fairyIndex)
  if fairyData == nil then
    return 
  end
  local skillMaxCount = ToClient_getPetEquipSkillMax()
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (FairyCompose.skillNoList)[0] = nil
  skillLearnCount = 0
  petSkillCheck = {}
  for skill_idx = 0, skillMaxCount - 1 do
    local skillStaticStatus = ToClient_getPetEquipSkillStaticStatus(skill_idx)
    local isLearn = fairyData:isPetEquipSkillLearned(skill_idx)
    if isLearn == true and skillStaticStatus ~= nil and petSkillCheck[skill_idx] ~= true then
      skillLearnCount = skillLearnCount + 1
      -- DECOMPILER ERROR at PC38: Confused about usage of register: R11 in 'UnsetPending'

      petSkillCheck[skill_idx] = true
      local skillTypeStaticWrapper = skillStaticStatus:getSkillTypeStaticStatusWrapper()
      if skillTypeStaticWrapper ~= nil and skillLearnCount <= #FairyCompose.skillSlot then
        local skillNo = skillStaticStatus:getSkillNo()
        -- DECOMPILER ERROR at PC54: Confused about usage of register: R13 in 'UnsetPending'

        ;
        (FairyCompose.skillNoList)[skillLearnCount] = skill_idx
        ;
        (((FairyCompose.skillSlot)[uiIndex])[skillLearnCount]):SetShow(true)
        ;
        (((FairyCompose.skillSlot)[uiIndex])[skillLearnCount]):SetIgnore(false)
        ;
        (((FairyCompose.skillSlot)[uiIndex])[skillLearnCount]):ChangeTextureInfoName("Icon/" .. skillTypeStaticWrapper:getIconPath())
        Panel_SkillTooltip_SetPosition(skillNo, ((FairyCompose.skillSlot)[uiIndex])[skillLearnCount], "FairySkill")
      end
    end
  end
  if uiIndex == 2 and (fairyData:getPetStaticStatus()):getPetRace() == 99 then
    (FairyCompose.radioBtn_PetLook_2):SetShow(false)
    ;
    (FairyCompose.radioBtn_PetSkill_2):SetShow(false)
  else
    ;
    (FairyCompose.radioBtn_PetLook_2):SetShow(true)
    ;
    (FairyCompose.radioBtn_PetSkill_2):SetShow(true)
  end
end

FairyComposeSkill_Init = function()
  -- function num : 0_44 , upvalues : FairyCompose
  for ii,aSkillSlot in pairs((FairyCompose.skillSlot)[3]) do
    aSkillSlot:SetShow(false)
    aSkillSlot:addInputEvent("Mouse_On", "")
    aSkillSlot:addInputEvent("Mouse_Out", "")
  end
end

local fairySkillCheck = nil
FairyCompose_UpdateFairySkillList = function()
  -- function num : 0_45 , upvalues : FairyCompose, fairySkillCheck
  local fairyNo0 = (FairyCompose.FairyComposeNo)[0]
  local fairyNo1 = (FairyCompose.FairyComposeNo)[1]
  FairyComposeSkill_Init()
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (FairyCompose.skillNoList)[0] = nil
  fairySkillCheck = {}
  local havePetSkillCheck = function(fairyNo)
    -- function num : 0_45_0 , upvalues : fairySkillCheck, FairyCompose
    if fairyNo ~= nil then
      local skillLearnCount = 0
      local skillMaxCount = ToClient_getPetEquipSkillMax()
      for sealFairyIndex = 0, ToClient_getFairySealedList() - 1 do
        local fairyData = ToClient_getFairySealedDataByIndex(sealFairyIndex)
        local _fairyNo = fairyData._petNo
        if _fairyNo ~= nil and fairyNo == _fairyNo then
          for skill_idx = 0, skillMaxCount - 1 do
            local skillStaticStatus = ToClient_getPetEquipSkillStaticStatus(skill_idx)
            local isLearn = fairyData:isPetEquipSkillLearned(skill_idx)
            if isLearn == true and skillStaticStatus ~= nil and fairySkillCheck[skill_idx] ~= true then
              skillLearnCount = skillLearnCount + 1
              -- DECOMPILER ERROR at PC39: Confused about usage of register: R15 in 'UnsetPending'

              fairySkillCheck[skill_idx] = true
              local skillTypeStaticWrapper = skillStaticStatus:getSkillTypeStaticStatusWrapper()
              if skillTypeStaticWrapper ~= nil and skillLearnCount <= #FairyCompose.skillSlot then
                local skillNo = skillStaticStatus:getSkillNo()
                -- DECOMPILER ERROR at PC53: Confused about usage of register: R17 in 'UnsetPending'

                ;
                (FairyCompose.skillNoList)[skillLearnCount] = skill_idx
                ;
                (((FairyCompose.skillSlot)[3])[skillLearnCount]):SetShow(true)
                ;
                (((FairyCompose.skillSlot)[3])[skillLearnCount]):SetIgnore(false)
                ;
                (((FairyCompose.skillSlot)[3])[skillLearnCount]):ChangeTextureInfoName("Icon/" .. skillTypeStaticWrapper:getIconPath())
              end
            end
          end
        end
      end
    end
  end

  if (FairyCompose.radioBtn_PetSkill_1):IsCheck() and fairyNo0 ~= nil then
    havePetSkillCheck(fairyNo0)
  else
    if (FairyCompose.radioBtn_PetSkill_2):IsCheck() and fairyNo1 ~= nil then
      havePetSkillCheck(fairyNo1)
    end
  end
  local fairyIconChange = function(fairyNo)
    -- function num : 0_45_1 , upvalues : FairyCompose
    for sealPetIndex = 0, ToClient_getFairySealedList() - 1 do
      local fairyData = ToClient_getFairySealedDataByIndex(sealPetIndex)
      local _fairyNo = fairyData._petNo
      if _fairyNo == fairyNo then
        local iconPath = fairyData:getIconPath()
        ;
        (FairyCompose.icon_3):ChangeTextureInfoName(iconPath)
        ;
        (FairyCompose.icon_3):SetShow(true)
      end
    end
  end

  ;
  (FairyCompose.icon_question):SetShow(false)
  if (FairyCompose.radioBtn_PetLook_1):IsCheck() and fairyNo0 ~= nil then
    fairyIconChange(fairyNo0)
  else
    if (FairyCompose.radioBtn_PetLook_2):IsCheck() and fairyNo1 ~= nil then
      fairyIconChange(fairyNo1)
    else
      ;
      (FairyCompose.icon_3):SetShow(false)
      ;
      (FairyCompose.icon_question):SetShow(true)
    end
  end
end

HandleClicked_FairyCompose_ClearEdit = function()
  -- function num : 0_46 , upvalues : FairyCompose
  (FairyCompose.editName):SetMaxInput(getGameServiceTypePetNameLength())
  SetFocusEdit(FairyCompose.editName)
  ;
  (FairyCompose.editName):SetEditText("", true)
end

Confirm_FairyCompose = function()
  -- function num : 0_47 , upvalues : FairyCompose, petComposeString
  ClearFocusEdit(FairyCompose.editName)
  local fairyName = (FairyCompose.editName):GetEditText()
  if fairyName == "" or petComposeString == fairyName then
    Proc_ShowMessage_Ack(petComposeString)
    return 
  end
  if (FairyCompose.FairyComposeNo)[1] ~= nil then
    local confirm_compose = function()
    -- function num : 0_47_0 , upvalues : FairyCompose, fairyName
    -- DECOMPILER ERROR at PC7: Confused about usage of register: R0 in 'UnsetPending'

    if FairyCompose.preserveSkillNo == nil then
      FairyCompose.preserveSkillNo = ToClient_getPetEquipSkillMax()
    end
    local isInherit = 0
    local isLookChange = 0
    local fairyNo_1 = (FairyCompose.FairyComposeNo)[0]
    local fairyNo_2 = (FairyCompose.FairyComposeNo)[1]
    if (FairyCompose.radioBtn_PetSkill_1):IsCheck() then
      isInherit = 2
    else
      if (FairyCompose.radioBtn_PetSkill_2):IsCheck() then
        isInherit = 1
      end
    end
    if (FairyCompose.radioBtn_PetLook_1):IsCheck() then
      isLookChange = 2
    else
      if (FairyCompose.radioBtn_PetLook_2):IsCheck() then
        isLookChange = 1
      end
    end
    ToClient_requestPetFusion(fairyName, fairyNo_1, fairyNo_2, isInherit, isLookChange)
    PaGlobal_FairyComposeClose()
  end

    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "PANEL_PETLIST_PETCOMPOSE_MSGCONTENT")
    local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "PANEL_SERVANTMIX_TITLE"), content = messageBoxMemo, functionYes = confirm_compose, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
    ;
    (MessageBox.showMessageBox)(messageBoxData)
  else
    do
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "PANEL_PETLIST_PETCOMPOSE_REGIST"))
      do return  end
    end
  end
end

FairyList:Initialize()
FairyCompose:Initialize()
PaGlobal_FairyList_Open = function()
  -- function num : 0_48 , upvalues : FairyList
  FairyList:Open()
end

OpenFairyList = function()
  -- function num : 0_49 , upvalues : isFairyOpen, FairyList
  if isFairyOpen == false then
    return 
  end
  FairyList:Open()
end

TestLua = function()
  -- function num : 0_50
  if ToClient_IsDevelopment() == false then
    return 
  end
  ToClient_SettingSiegeCamera()
end


