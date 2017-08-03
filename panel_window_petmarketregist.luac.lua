-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\petinfo\panel_window_petmarketregist.luac 

-- params : ...
-- function num : 0
Panel_Window_PetMarketRegist:SetShow(false, false)
Panel_Window_PetMarketRegist:setMaskingChild(true)
Panel_Window_PetMarketRegist:ActiveMouseEventEffect(true)
Panel_Window_PetMarketRegist:setGlassBackground(true)
Panel_Window_PetMarketRegist:RegisterShowEventFunc(true, "PetMarketRegist_ShowAni()")
Panel_Window_PetMarketRegist:RegisterShowEventFunc(false, "PetMarketRegist_HideAni()")
local auctionInfo = RequestGetAuctionInfo()
PetMarketRegist_ShowAni = function()
  -- function num : 0_0
end

PetMarketRegist_HideAni = function()
  -- function num : 0_1
end

local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local PetMarketRegist = {btnClose = (UI.getChildControl)(Panel_Window_PetMarketRegist, "Button_Win_Close"), btnQuestion = (UI.getChildControl)(Panel_Window_PetMarketRegist, "Button_Question"), petIcon = (UI.getChildControl)(Panel_Window_PetMarketRegist, "Static_Icon"), tier = (UI.getChildControl)(Panel_Window_PetMarketRegist, "StaticText_TierValue"), level = (UI.getChildControl)(Panel_Window_PetMarketRegist, "StaticText_LevelValue"), base = (UI.getChildControl)(Panel_Window_PetMarketRegist, "StaticText_BaseValue"), special = (UI.getChildControl)(Panel_Window_PetMarketRegist, "StaticText_SpecialValue"), maxPrice = (UI.getChildControl)(Panel_Window_PetMarketRegist, "StaticText_MaxValue"), minPrice = (UI.getChildControl)(Panel_Window_PetMarketRegist, "StaticText_MinValue"), actionSlotBg = (UI.getChildControl)(Panel_Window_PetMarketRegist, "Static_ActionSlotBg"), actionSlot = (UI.getChildControl)(Panel_Window_PetMarketRegist, "Static_ActionSlot"), skillSlotBg = (UI.getChildControl)(Panel_Window_PetMarketRegist, "Static_SkillSlotBg"), skillSlot = (UI.getChildControl)(Panel_Window_PetMarketRegist, "Static_SkillSlot"), btnNextPage = (UI.getChildControl)(Panel_Window_PetMarketRegist, "Button_NextPage"), btnPrevPage = (UI.getChildControl)(Panel_Window_PetMarketRegist, "Button_PrevPage"), editPriceValue = (UI.getChildControl)(Panel_Window_PetMarketRegist, "Edit_Price"), btnRegist = (UI.getChildControl)(Panel_Window_PetMarketRegist, "Button_Yes"), btnCancel = (UI.getChildControl)(Panel_Window_PetMarketRegist, "Button_No"), _slots = (Array.new)(), _maxSlotCount = 5, _slotGap = 5, _maxValue = toInt64(0, 0), _minValue = toInt64(0, 0), _registPrice = toInt64(0, 0), _nextPage = false, _currentPetNo = nil}
PetMarketRegist.EventHandler = function(self)
  -- function num : 0_2 , upvalues : PetMarketRegist
  (PetMarketRegist.btnClose):addInputEvent("Mouse_LUp", "PetMarketRegist_Close()")
  ;
  (PetMarketRegist.btnQuestion):addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"Pet\" )")
  ;
  (PetMarketRegist.btnQuestion):addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"Pet\", \"true\")")
  ;
  (PetMarketRegist.btnQuestion):addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"Pet\", \"false\")")
  ;
  (PetMarketRegist.btnRegist):addInputEvent("Mouse_LUp", "PetMarketRegist_Confirm()")
  ;
  (PetMarketRegist.btnCancel):addInputEvent("Mouse_LUp", "PetMarketRegist_Close()")
  registerEvent("FromClient_RegisterPetInAuction", "FromClient_RegisterPetInAuction")
end

PetMarketRegist:EventHandler()
PetMarketRegist.Init = function(self)
  -- function num : 0_3 , upvalues : UI_PUCT
  for index = 0, self._maxSlotCount - 1 do
    local temp = {}
    local actionSlotBg = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_Window_PetMarketRegist, "Static_ActionSlotBg_" .. index)
    CopyBaseProperty(self.actionSlotBg, actionSlotBg)
    actionSlotBg:SetPosX((self.actionSlotBg):GetPosX() + ((self.actionSlotBg):GetSizeX() + self._slotGap) * index)
    temp.actionSlot = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, actionSlotBg, "Static_ActionSlot_" .. index)
    CopyBaseProperty(self.actionSlot, temp.actionSlot)
    local skillSlotBg = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, Panel_Window_PetMarketRegist, "Static_SkillSlotBg_" .. index)
    CopyBaseProperty(self.skillSlotBg, skillSlotBg)
    skillSlotBg:SetPosX((self.skillSlotBg):GetPosX() + ((self.skillSlotBg):GetSizeX() + self._slotGap) * index)
    temp.skillSlot = (UI.createControl)(UI_PUCT.PA_UI_CONTROL_STATIC, skillSlotBg, "Static_SkillSlot_" .. index)
    CopyBaseProperty(self.skillSlot, temp.skillSlot)
    -- DECOMPILER ERROR at PC85: Confused about usage of register: R8 in 'UnsetPending'

    ;
    (self._slots)[index] = temp
  end
  ;
  (self.actionSlotBg):SetShow(false)
  ;
  (self.actionSlot):SetShow(false)
  ;
  (self.skillSlotBg):SetShow(false)
  ;
  (self.skillSlot):SetShow(false)
end

PetMarketRegist.SetPetInfo = function(self, petNo)
  -- function num : 0_4 , upvalues : PetMarketRegist
  local _petNo = tonumber64(petNo)
  local petCount = ToClient_getPetSealedList()
  if petCount == 0 then
    return 
  end
  self._currentPetNo = petNo
  for ii = 0, self._maxSlotCount - 1 do
    (((self._slots)[ii]).actionSlot):ChangeTextureInfoName("")
    ;
    (((self._slots)[ii]).skillSlot):ChangeTextureInfoName("")
  end
  do
    for index = 0, petCount - 1 do
      local petInfo = ToClient_getPetSealedDataByIndex(index)
      local petNo_s64 = petInfo._petNo
      if _petNo == petNo_s64 then
        local petStaticStatus = petInfo:getPetStaticStatus()
        local iconPath = petInfo:getIconPath()
        local petLevel = petInfo._level
        local petTier = petStaticStatus:getPetTier() + 1
        local basePrice = Int64toInt32(petStaticStatus:getBasePrice())
        self._maxValue = tonumber64(basePrice * petStaticStatus:getMaxPricePercent() / 1000000)
        self._minValue = tonumber64(basePrice * petStaticStatus:getMinPricePercent() / 1000000)
        ;
        (self.maxPrice):SetText(makeDotMoney(self._maxValue))
        ;
        (self.minPrice):SetText(makeDotMoney(self._minValue))
        ;
        (self.petIcon):ChangeTextureInfoName(iconPath)
        ;
        (self.tier):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_SERVANT_TIER", "tier", petTier))
        ;
        (self.level):SetText(petLevel .. " Lv")
        local petSkillType = function(param)
    -- function num : 0_4_0 , upvalues : petInfo, self
    local skillParam = petInfo:getSkillParam(param)
    local paramText = ""
    if skillParam._type == 1 then
      paramText = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_PETMARKETREGIST_PICKUPTIME", "time", (string.format)("%.1f", skillParam:getParam(0)) / 1000)
    else
      if skillParam._type == 2 then
        paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_FINDGATHER")
      else
        if skillParam._type == 3 then
          paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_FINDPK")
        else
          if skillParam._type == 4 then
            paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_FINDPLACE")
          else
            if skillParam._type == 5 then
              paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_MOBAGGRO")
            else
              if skillParam._type == 6 then
                paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_FINDRAREMONSTER")
              else
                if skillParam._type == 7 then
                  paramText = PAGetString(Defines.StringSheet_GAME, "LUA_PETINFO_PETSKILLTYPE_REDUCEAUTOFISHINGTIME")
                end
              end
            end
          end
        end
      end
    end
    if param == 0 then
      (self.base):SetText(paramText)
    else
      if param == 1 then
        (self.special):SetText(paramText)
      end
    end
  end

        petSkillType(0)
        petSkillType(1)
        if (self.btnNextPage):GetShow() then
          self._nextPage = false
        end
        local actionMaxCount = ToClient_getPetActionMax()
        local uiIdx = 0
        local nextIndex = 0
        for action_idx = 0, actionMaxCount - 1 do
          local actionStaticStatus = ToClient_getPetActionStaticStatus(action_idx)
          local isLearn = petInfo:isPetActionLearned(action_idx)
          if isLearn == true then
            if not self._nextPage then
              if uiIdx < self._maxSlotCount then
                (((self._slots)[uiIdx]).actionSlot):ChangeTextureInfoName("Icon/" .. actionStaticStatus:getIconPath())
                ;
                (((self._slots)[uiIdx]).actionSlot):addInputEvent("Mouse_On", "PetMarketRegist_ShowActionToolTip( " .. action_idx .. ", " .. uiIdx .. " )")
                ;
                (((self._slots)[uiIdx]).actionSlot):addInputEvent("Mouse_Out", "PetMarketRegist_HideActionToolTip( " .. action_idx .. " )")
                uiIdx = uiIdx + 1
              else
                self._nextPage = true
                ;
                (self.btnNextPage):SetShow(true)
                ;
                (self.btnNextPage):addInputEvent("Mouse_LUp", "PetMarketRegist_NextAction_Show()")
                break
              end
            else
              uiIdx = uiIdx + 1
              if self._maxSlotCount < uiIdx then
                (((self._slots)[nextIndex]).actionSlot):ChangeTextureInfoName("Icon/" .. actionStaticStatus:getIconPath())
                ;
                (((self._slots)[nextIndex]).actionSlot):addInputEvent("Mouse_On", "PetMarketRegist_ShowActionToolTip( " .. action_idx .. ", " .. nextIndex .. " )")
                ;
                (((self._slots)[nextIndex]).actionSlot):addInputEvent("Mouse_Out", "PetMarketRegist_HideActionToolTip( " .. action_idx .. " )")
                nextIndex = nextIndex + 1
              end
            end
          end
        end
        do
          do
            local skillMaxCount = ToClient_getPetEquipSkillMax()
            uiIdx = 0
            for skill_idx = 0, skillMaxCount - 1 do
              local skillStaticStatus = ToClient_getPetEquipSkillStaticStatus(skill_idx)
              local isLearn = petInfo:isPetEquipSkillLearned(skill_idx)
              if isLearn == true and skillStaticStatus ~= nil then
                local skillTypeStaticWrapper = skillStaticStatus:getSkillTypeStaticStatusWrapper()
                do
                  do
                    if skillTypeStaticWrapper ~= nil then
                      local skillNo = skillStaticStatus:getSkillNo()
                      ;
                      (((self._slots)[uiIdx]).skillSlot):ChangeTextureInfoName("Icon/" .. skillTypeStaticWrapper:getIconPath())
                      ;
                      (((self._slots)[uiIdx]).skillSlot):addInputEvent("Mouse_On", "PetMarketRegist_ShowSkillToolTip( " .. skill_idx .. ", " .. uiIdx .. " )")
                      ;
                      (((self._slots)[uiIdx]).skillSlot):addInputEvent("Mouse_Out", "PetMarketRegist_HideSkillToolTip()")
                      Panel_SkillTooltip_SetPosition(skillNo, ((self._slots)[uiIdx]).skillSlot, "PetSkill")
                    end
                    uiIdx = uiIdx + 1
                    -- DECOMPILER ERROR at PC273: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC273: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC273: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
            end
            -- DECOMPILER ERROR at PC275: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC275: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC275: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  ;
  (PetMarketRegist.editPriceValue):SetEditText(PAGetString(Defines.StringSheet_GAME, "LUA_PETMARKETREGIST_INPUTPRICE"))
  ;
  (PetMarketRegist.editPriceValue):addInputEvent("Mouse_LUp", "HandleClicked_PriceBox( \"" .. tostring(_petNo) .. "\" )")
end

PetMarketRegist_NextAction_Show = function()
  -- function num : 0_5 , upvalues : PetMarketRegist
  (PetMarketRegist.btnNextPage):SetShow(false)
  ;
  (PetMarketRegist.btnPrevPage):SetShow(true)
  ;
  (PetMarketRegist.btnPrevPage):addInputEvent("Mouse_LUp", "HandleClicked_NextAction_Show()")
  PetMarketRegist:SetPetInfo(PetMarketRegist._currentPetNo)
end

HandleClicked_NextAction_Show = function()
  -- function num : 0_6 , upvalues : PetMarketRegist
  (PetMarketRegist.btnNextPage):SetShow(true)
  ;
  (PetMarketRegist.btnPrevPage):SetShow(false)
  PetMarketRegist:SetPetInfo(PetMarketRegist._currentPetNo)
end

HandleClicked_PriceBox = function(petNoStr)
  -- function num : 0_7 , upvalues : PetMarketRegist
  param = {[0] = petNoStr}
  local maxPrice = PetMarketRegist._maxValue
  Panel_NumberPad_Show(true, maxPrice, param, PetMarket_SetEditBox)
end

PetMarket_SetEditBox = function(inputNumber)
  -- function num : 0_8 , upvalues : PetMarketRegist
  local price = makeDotMoney(inputNumber)
  ;
  (PetMarketRegist.editPriceValue):SetEditText(price)
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R2 in 'UnsetPending'

  PetMarketRegist._registPrice = inputNumber
end

PetMarketRegist_Confirm = function()
  -- function num : 0_9 , upvalues : PetMarketRegist
  PetMarket_Register_ConfirmFunction(PetMarketRegist._registPrice, param)
end

PetMarket_Register_ConfirmFunction = function(inputNumber, param)
  -- function num : 0_10 , upvalues : PetMarketRegist
  if toInt64(0, 0) == inputNumber then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PETMARKETREGIST_INPUTPRICE"))
    return 
  else
    if inputNumber < PetMarketRegist._minValue then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PETMARKETREGIST_LOWPRICE"))
      return 
    else
      if PetMarketRegist._maxValue < inputNumber then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PETMARKETREGIST_HIGHPRICE"))
        return 
      end
    end
  end
  ToClient_registerPetInAuctionReq(tonumber64(param[0]), inputNumber)
end

PetMarketRegist_ShowActionToolTip = function(action_idx, uiIdx)
  -- function num : 0_11 , upvalues : PetMarketRegist
  local actionStaticStatus = ToClient_getPetActionStaticStatus(action_idx)
  if actionStaticStatus == nil then
    return 
  end
  local actionIconPath = actionStaticStatus:getIconPath()
  local actionName = actionStaticStatus:getName()
  local actionDesc = actionStaticStatus:getDescription()
  local uiBase = ((PetMarketRegist._slots)[uiIdx]).actionSlot
  if actionDesc == "" then
    actionDesc = nil
  end
  TooltipSimple_Show(uiBase, actionName, actionDesc)
end

PetMarketRegist_HideActionToolTip = function(action_idx)
  -- function num : 0_12
  TooltipSimple_Hide()
end

PetMarketRegist_ShowSkillToolTip = function(skill_idx, uiIdx)
  -- function num : 0_13 , upvalues : PetMarketRegist
  local skillStaticStatus = ToClient_getPetEquipSkillStaticStatus(skill_idx)
  local skillTypeStaticWrapper = skillStaticStatus:getSkillTypeStaticStatusWrapper()
  local petSkillNo = skillStaticStatus:getSkillNo()
  local uiBase = ((PetMarketRegist._slots)[uiIdx]).skillSlot
  Panel_SkillTooltip_Show(petSkillNo, false, "PetSkill")
end

PetMarketRegist_HideSkillToolTip = function()
  -- function num : 0_14
  Panel_SkillTooltip_Hide()
end

FGlobal_PetMarketRegist_Show = function(petNo)
  -- function num : 0_15 , upvalues : PetMarketRegist
  if petNo == nil then
    return 
  end
  if not Panel_Window_PetMarketRegist:GetShow() then
    Panel_Window_PetMarketRegist:SetShow(true)
  end
  local self = PetMarketRegist
  self._currentPetNo = nil
  self._nextPage = false
  ;
  (self.btnNextPage):SetShow(false)
  ;
  (self.btnPrevPage):SetShow(false)
  self:SetPetInfo(petNo)
end

PetMarketRegist_Close = function()
  -- function num : 0_16 , upvalues : PetMarketRegist
  if Panel_Window_PetMarketRegist:GetShow() then
    Panel_Window_PetMarketRegist:SetShow(false)
    -- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

    PetMarketRegist._registPrice = toInt64(0, 0)
  end
  if not Panel_Window_PetListNew:GetShow() then
    FGlobal_PetListNew_Open()
  end
end

FromClient_RegisterPetInAuction = function()
  -- function num : 0_17
  Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_PETMARKETREGIST_REGISTCONFIRM"))
  PetMarketRegist_Close()
end

PetMarketRegist:Init()

