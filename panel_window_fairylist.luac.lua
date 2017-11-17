-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\fairyinfo\panel_window_fairylist.luac 

-- params : ...
-- function num : 0
Panel_Window_FairyList:SetShow(false)
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
local spiritClass = {0, 12, 19, 20, 21, 23, 26, 30}
local fairyPotionData = {
hp = {[0] = 502, [1] = 513, [2] = 514, [3] = 517, [4] = 518, [5] = 519, [6] = 524, [7] = 525, [8] = 528, [9] = 529, [10] = 530, [11] = 538, [12] = 551, [13] = 552, [14] = 553, [15] = 554, [16] = 555, [17] = 17568, [18] = 17569, [19] = 19932, [20] = 19933, [21] = 19934, [22] = 19935}
, 
mp = {[0] = 503, [1] = 520, [2] = 521, [3] = 522, [4] = 526, [5] = 527, [6] = 515, [7] = 516, [8] = 531, [9] = 532, [10] = 533, [11] = 810}
, 
tp = {[0] = 591, [1] = 592, [2] = 593, [3] = 594, [4] = 810, [5] = 827, [6] = 828, [7] = 829, [8] = 830, [9] = 16334, [10] = 17707, [11] = 17708, [12] = 17709, [13] = 17710}
}
local petRaceCount = {[1] = "고양�\180", [2] = "�\156", [3] = "�\164", [4] = "펭귄", [5] = "사막여우", [6] = "고슴도치", [7] = "눈사�\140", [8] = "고슴도치", [9] = "오목눈이", [10] = "렛서팬더", [11] = "앵무�\136", [12] = "북극�\176", [13] = "돌맨�\140", [14] = "이벤트할로윈1", [15] = "이벤트할로윈2", [16] = "이벤트할로윈3", [17] = "이벤트할로윈4", [18] = "이벤트할로윈5", [19] = "이벤트할로윈6", [20] = "어린 �\145", [22] = "까마�\128", [23] = "아무거나1", [24] = "아무거나2", [25] = "아무거나3", [26] = "아무거나4", [27] = "아무거나5", [28] = "아무거나6", [29] = "아무거나7", [30] = "아무거나8", [99] = "합성�\169 �\171"}
local Static_FairySetting_all = (UI.getChildControl)(Panel_Window_FairyList, "Static_FairyListWindow")
local FairyHpRateText = {[0] = "None", [10] = "체력 10% 이하�\188 �\140 자동사용", [20] = "체력 20% 이하�\188 �\140 자동사용", [30] = "체력 30% 이하�\188 �\140 자동사용", [50] = "체력 50% 이하�\188 �\140 자동사용"}
local FairyMpRateText = {[0] = "None", [10] = "정신�\165 10% 이하�\188 �\140 자동사용", [20] = "정신�\165 20% 이하�\188 �\140 자동사용", [30] = "정신�\165 30% 이하�\188 �\140 자동사용", [50] = "정신�\165 50% 이하�\188 �\140 자동사용"}
local FairyTpRateText = {[0] = "None", [10] = "투지 10% 이하�\188 �\140 자동사용", [20] = "투지 20% 이하�\188 �\140 자동사용", [30] = "투지 30% 이하�\188 �\140 자동사용", [50] = "투지 50% 이하�\188 �\140 자동사용"}
local FairyList = {BTN_Close = (UI.getChildControl)(Panel_Window_FairyList, "Button_Win_Close"), BTN_Question = (UI.getChildControl)(Panel_Window_FairyList, "Button_Question"), List2_FairyList = (UI.getChildControl)(Panel_Window_FairyList, "List2_FairyList"), Static_FairySetting = (UI.getChildControl)(Panel_Window_FairyList, "Static_FairyListWindow"), Static_SkillList = (UI.getChildControl)(Static_FairySetting_all, "Static_SkillListBG2"), 
Radio_HpRate = {[0] = (UI.getChildControl)(Static_FairySetting_all, "Radiobutton_HP10Percent"), [10] = (UI.getChildControl)(Static_FairySetting_all, "Radiobutton_HP10Percent"), [20] = (UI.getChildControl)(Static_FairySetting_all, "Radiobutton_HP20Percent"), [30] = (UI.getChildControl)(Static_FairySetting_all, "Radiobutton_HP30Percent"), [50] = (UI.getChildControl)(Static_FairySetting_all, "Radiobutton_HP50Percent")}
, 
Radio_MpRate = {[0] = (UI.getChildControl)(Static_FairySetting_all, "Radiobutton_HP10Percent"), [10] = (UI.getChildControl)(Static_FairySetting_all, "Radiobutton_MP10Percent"), [20] = (UI.getChildControl)(Static_FairySetting_all, "Radiobutton_MP20Percent"), [30] = (UI.getChildControl)(Static_FairySetting_all, "Radiobutton_MP30Percent"), [50] = (UI.getChildControl)(Static_FairySetting_all, "Radiobutton_MP50Percent")}
, Slot_HpItem = (UI.getChildControl)(Static_FairySetting_all, "Static_HPItemSlotBig"), Slot_MpItem = (UI.getChildControl)(Static_FairySetting_all, "Static_MPItemSlotBig"), BTN_SettingYes = (UI.getChildControl)(Static_FairySetting_all, "Button_Yes"), BTN_SettingNo = (UI.getChildControl)(Static_FairySetting_all, "Button_No"), _currentPetNoStr = nil, 
_cacheSetting = {_hpKey = 0, _mpKey = 0, _hpRate = 0, _mpRate = 0}
}
PaGlobal_FairySetting_IsOpen = function()
  -- function num : 0_2 , upvalues : FairyList
  return (FairyList.Static_FairySetting):GetShow()
end

FairyList.ClearCache = function(self)
  -- function num : 0_3
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  (self._cacheSetting)._hpKey = ItemEnchantKey(0, 0)
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._cacheSetting)._mpKey = ItemEnchantKey(0, 0)
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._cacheSetting)._hpRate = 10
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._cacheSetting)._mpRate = 10
end

FairyList.SetPosition = function(self)
  -- function num : 0_4
  local scrSizeX = getScreenSizeX()
  local scrSizeY = getScreenSizeY()
  local panelSizeX = Panel_Window_FairyList:GetSizeX()
  local panelSizeY = Panel_Window_FairyList:GetSizeY()
  Panel_Window_FairyList:SetPosX(scrSizeX / 2)
  Panel_Window_FairyList:SetPosY(scrSizeY / 2 - panelSizeY / 2 - 100)
end

FairyList.Open = function(self)
  -- function num : 0_5
  self:SetPosition()
  Panel_Window_FairyList:SetShow(true, true)
  ;
  (self.Static_FairySetting):SetShow(false, false)
  self:ClearCache()
  self:SetFairyList()
end

FairyList.SetFairyList = function(self, noclearscroll)
  -- function num : 0_6
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

FairyListCreate = function(control, key)
  -- function num : 0_7 , upvalues : UI_TM, FairyHpRateText, FairyMpRateText
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
    -- function num : 0_7_0 , upvalues : unsealPetCount
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
          text_MpItem:SetText(FairyMpRateText[SettingData._mpMinRate])
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
              text_MpItem:SetText(FairyMpRateText[50])
              slot_MpItem:SetShow(false)
              slot_HpItem:SetShow(false)
              btn_unSeal:SetShow(false)
              btn_Seal:SetShow(true)
              -- DECOMPILER ERROR at PC319: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC319: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC319: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC319: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC319: LeaveBlock: unexpected jumping out IF_STMT

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
              text_MpItem:SetText(FairyMpRateText[SettingData._mpMinRate])
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
                  text_MpItem:SetText(FairyMpRateText[50])
                  slot_MpItem:SetShow(false)
                  slot_HpItem:SetShow(false)
                  btn_unSeal:SetShow(true)
                  btn_Seal:SetShow(false)
                  -- DECOMPILER ERROR at PC519: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC519: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC519: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC519: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC519: LeaveBlock: unexpected jumping out IF_STMT

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
  -- function num : 0_8
  _PA_LOG("�\128민혁", "요정 도움말정보를 요청합니�\164. 함수 내부구현해주세요...")
end

PaGlobal_FairyList_Close = function()
  -- function num : 0_9 , upvalues : Static_FairySetting_all
  Panel_Window_FairyList:SetShow(false, false)
  Static_FairySetting_all:SetShow(false, false)
end

PaGlobal_FairyList_UnSeal = function(petNoStr)
  -- function num : 0_10 , upvalues : FairyList
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
  -- function num : 0_11 , upvalues : FairyList
  audioPostEvent_SystemUi(1, 40)
  local self = FairyList
  local petNo_s64 = tonumber64(petNoStr)
  ToClient_requestPetSeal(petNo_s64)
end

PaGlobal_FairyList_Setting = function(petNoStr)
  -- function num : 0_12 , upvalues : FairyList
  audioPostEvent_SystemUi(1, 40)
  self = FairyList
  if (self.Static_FairySetting):GetShow() == true then
    PaGlobal_FairyList_SetNo()
    return 
  end
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R1 in 'UnsetPending'

  self._currentPetNoStr = petNoStr
  ;
  (self.Static_FairySetting):SetShow(true, true)
  self:Update_Setting(petNoStr, true)
end

PaGlobal_FairyList_SetYes = function()
  -- function num : 0_13 , upvalues : FairyList
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
  -- function num : 0_14 , upvalues : FairyList
  local self = FairyList
  self._currentPetNoStr = nil
  self:ClearCache()
  ;
  (self.Static_FairySetting):SetShow(false, false)
end

FairyList.Update_Setting = function(self, petNoStr, notDataUpdate)
  -- function num : 0_15
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
  -- function num : 0_16 , upvalues : FairyList
  local self = FairyList
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._cacheSetting)._hpRate = tonumber(rate)
end

PaGlobal_FairyList_MpRateCheck = function(mpCheck)
  -- function num : 0_17 , upvalues : FairyList
  local self = FairyList
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._cacheSetting)._mpRate = tonumber(mpCheck)
end

PaGlobal_FairyList_IsHp = function(hpKeyStr)
  -- function num : 0_18 , upvalues : fairyPotionData
  local key = tonumber(hpKeyStr)
  for idx,value in pairs(fairyPotionData.hp) do
    if key == value then
      return true
    end
  end
  return false
end

PaGlobal_FairyList_IsMp = function(mpKeyStr)
  -- function num : 0_19 , upvalues : fairyPotionData
  local classType = (getSelfPlayer()):getClassType()
  local key = tonumber(mpKeyStr)
  for idx,value in pairs(fairyPotionData.mp) do
    if key == value then
      return true
    end
  end
  return false
end

PaGlobal_FairySetting_SetPortion = function(itemKey)
  -- function num : 0_20 , upvalues : FairyList
  local isSetting = false
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R2 in 'UnsetPending'

  if PaGlobal_FairyList_IsHp(tostring(itemKey:get())) == true then
    (self._cacheSetting)._hpKey = itemKey
    isSetting = true
  end
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R2 in 'UnsetPending'

  if PaGlobal_FairyList_IsMp(tostring(itemKey:get())) == true then
    (self._cacheSetting)._mpKey = itemKey
    isSetting = true
  end
  if isSetting == false then
    Proc_ShowMessage_Ack_WithOut_ChattingMessage("회복제만 등록�\160 �\152 있습니다.")
  end
  FairyList:Update_Setting(self._currentPetNoStr, false)
end

FromClient_FairyUpdate = function()
  -- function num : 0_21 , upvalues : FairyList
  FairyList:SetFairyList()
end

PaGlobal_FairySetting_HpReset = function()
  -- function num : 0_22 , upvalues : FairyList
  local self = FairyList
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._cacheSetting)._hpKey = ItemEnchantKey(0, 0)
  Panel_Tooltip_Item_hideTooltip()
  self:Update_Setting(self._currentPetNoStr, false)
end

PaGlobal_FairySetting_MpReset = function()
  -- function num : 0_23 , upvalues : FairyList
  local self = FairyList
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._cacheSetting)._mpKey = ItemEnchantKey(0, 0)
  Panel_Tooltip_Item_hideTooltip()
  self:Update_Setting(self._currentPetNoStr, false)
end

FairyList.Initialize = function(self)
  -- function num : 0_24
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
  -- function num : 0_25 , upvalues : FairyList
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
  -- function num : 0_26 , upvalues : FairyList
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

FairyList:Initialize()
OpenFairyList = function()
  -- function num : 0_27 , upvalues : isFairyOpen, FairyList
  if isFairyOpen == false then
    return 
  end
  FairyList:Open()
end


