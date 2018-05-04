-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\guild\panel_guild_manufacture.luac 

-- params : ...
-- function num : 0
PaGlobal_Guild_Manufacture = {
_ui = {_guildBG = (UI.getChildControl)(Panel_Window_Guild, "Static_Frame_GuildManufactureBG"), _baseNoneStateBG = (UI.getChildControl)(Panel_Guild_Manufacture, "Static_NoneState"), _baseProceedingStateBG = (UI.getChildControl)(Panel_Guild_Manufacture, "Static_ProceedingState"), _baseReadyStateBG = (UI.getChildControl)(Panel_Guild_Manufacture, "Static_ReadyState"), _baseCompleteStateBG = (UI.getChildControl)(Panel_Guild_Manufacture, "Static_CompleteState"), _baseProductSlot = (UI.getChildControl)(Panel_Guild_Manufacture, "Static_Result_IconBG")}
, 
_slotConfig = {createIcon = true, createBorder = true, createEnchant = true}
, _slot = (Array.new)()}
-- DECOMPILER ERROR at PC51: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.initialize = function(self)
  -- function num : 0_0
  self:createControl()
  self:registEventHandler()
end

-- DECOMPILER ERROR at PC54: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.registEventHandler = function(self)
  -- function num : 0_1
  registerEvent("FromClient_Guild_Manufacture_Refresh", "FromClient_Guild_Manufacture_Refresh")
  registerEvent("FromClient_Guild_Manufacture_CompletePrice", "FromClient_Guild_Manufacture_CompletePrice")
end

-- DECOMPILER ERROR at PC57: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.createControl = function(self)
  -- function num : 0_2
  self._messageNowCompleteAck = {title = "길드�\128�\181 즉시 완료", content = "", functionYes = FGlobal_Guild_Manufacture_Now_Complete_Yes, functionNo = FGlobal_Guild_Manufacture_Now_Complete_No, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW, itemEnchantKey = nil, index = nil, price_s64 = nil}
  self._messageDelete = {title = "길드�\128�\181 삭제", content = "길드 물품 삭제. *진행�\156 아이템은 환수�\188 받지 못합니다.", functionYes = FGlobal_Guild_Manufacture_Delete_Yes, functionNo = FGlobal_Guild_Manufacture_Delete_No, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW, index = nil}
  self._messageStart = {title = "길드�\128�\181 시작", content = "", functionYes = FGlobal_Guild_Manufacture_Start_Yes, functionNo = FGlobal_Guild_Manufacture_Start_No, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW, index = nil}
  local baseRequiredSlot = (UI.getChildControl)((self._ui)._baseProceedingStateBG, "Static_Resource_IconBG")
  local baseRequiredSlotText = (UI.getChildControl)((self._ui)._baseProceedingStateBG, "StaticText_ResourcesCount")
  for ii = 0, __eGuildManufactureProductItemCount - 1 do
    local slot = {_productItemEnchantKey = nil, _productItemCount_s64 = nil, 
[__eGuildManufactureStateNone] = {_backGround = nil, _productSlot = nil, _productItemName = nil, _productItemCount = nil, _selectButton = nil, _setButton = nil}
, 
[__eGuildManufactureStateProceeding] = {_backGround = nil, _productSlot = nil, _productItemName = nil, _productItemCount = nil, _startButton = nil, _deleteButton = nil, _requiredSlot = (Array.new)(), _requiredItem = (Array.new)()}
, 
[__eGuildManufactureStateCreating] = {_backGround = nil, _productSlot = nil, _productItemName = nil, _productItemCount = nil, _completeDate = nil, _completeButton = nil}
, 
[__eGuildManufactureStateComplete] = {_backGround = nil, _productSlot = nil, _productItemName = nil, _productItemCount = nil, _receiveButton = nil}
}
    do
      -- DECOMPILER ERROR at PC115: Confused about usage of register: R8 in 'UnsetPending'

      (slot[__eGuildManufactureStateNone])._backGround = (UI.cloneControl)((self._ui)._baseNoneStateBG, Panel_Guild_Manufacture, "NoneBG_" .. ii)
      -- DECOMPILER ERROR at PC127: Confused about usage of register: R8 in 'UnsetPending'

      ;
      (slot[__eGuildManufactureStateProceeding])._backGround = (UI.cloneControl)((self._ui)._baseProceedingStateBG, Panel_Guild_Manufacture, "ProceedingBG_" .. ii)
      -- DECOMPILER ERROR at PC139: Confused about usage of register: R8 in 'UnsetPending'

      ;
      (slot[__eGuildManufactureStateCreating])._backGround = (UI.cloneControl)((self._ui)._baseReadyStateBG, Panel_Guild_Manufacture, "ReadyBG_" .. ii)
      -- DECOMPILER ERROR at PC151: Confused about usage of register: R8 in 'UnsetPending'

      ;
      (slot[__eGuildManufactureStateComplete])._backGround = (UI.cloneControl)((self._ui)._baseCompleteStateBG, Panel_Guild_Manufacture, "CompleteBG_" .. ii)
      slot.SetShow = function(self, isShow)
    -- function num : 0_2_0 , upvalues : slot
    ((slot[__eGuildManufactureStateNone])._backGround):SetShow(isShow)
    ;
    ((slot[__eGuildManufactureStateProceeding])._backGround):SetShow(isShow)
    ;
    ((slot[__eGuildManufactureStateCreating])._backGround):SetShow(isShow)
    ;
    ((slot[__eGuildManufactureStateComplete])._backGround):SetShow(isShow)
  end

      slot.SetPos = function(self, posX, posY)
    -- function num : 0_2_1 , upvalues : slot
    ((slot[__eGuildManufactureStateNone])._backGround):SetPosX(posX)
    ;
    ((slot[__eGuildManufactureStateNone])._backGround):SetPosY(posY)
    ;
    ((slot[__eGuildManufactureStateProceeding])._backGround):SetPosX(posX)
    ;
    ((slot[__eGuildManufactureStateProceeding])._backGround):SetPosY(posY)
    ;
    ((slot[__eGuildManufactureStateCreating])._backGround):SetPosX(posX)
    ;
    ((slot[__eGuildManufactureStateCreating])._backGround):SetPosY(posY)
    ;
    ((slot[__eGuildManufactureStateComplete])._backGround):SetPosX(posX)
    ;
    ((slot[__eGuildManufactureStateComplete])._backGround):SetPosY(posY)
  end

      local noneSlot = slot[__eGuildManufactureStateNone]
      local tempProductSlot_0 = {}
      tempProductSlot_0.bg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, noneSlot._backGround, "ProductItemBG_0_" .. ii)
      CopyBaseProperty((self._ui)._baseProductSlot, tempProductSlot_0.bg)
      ;
      (tempProductSlot_0.bg):SetPosX(10)
      ;
      (tempProductSlot_0.bg):SetShow(true)
      ;
      (SlotItem.new)(tempProductSlot_0, "ProductItemIcon_" .. ii, ii, tempProductSlot_0.bg, self._slotConfig)
      tempProductSlot_0:createChild()
      ;
      (tempProductSlot_0.icon):SetPosX(4)
      ;
      (tempProductSlot_0.icon):SetPosY(4)
      ;
      (tempProductSlot_0.icon):SetShow(true)
      ;
      (tempProductSlot_0.icon):addInputEvent("Mouse_On", "PaGlobal_Guild_Manufacture:productItemTooltip_Show(" .. ii .. ", __eGuildManufactureStateNone)")
      ;
      (tempProductSlot_0.icon):addInputEvent("Mouse_Out", "PaGlobal_Guild_Manufacture:itemTooltip_Hide()")
      noneSlot._productSlot = tempProductSlot_0
      noneSlot._productItemName = (UI.getChildControl)(noneSlot._backGround, "Static_Result_Name")
      noneSlot._productItemCount = (UI.getChildControl)(noneSlot._backGround, "StaticText_Count")
      noneSlot._selectButton = (UI.getChildControl)(noneSlot._backGround, "Button_Select")
      noneSlot._setButton = (UI.getChildControl)(noneSlot._backGround, "Button_Set")
      ;
      (noneSlot._productItemCount):addInputEvent("Mouse_LUp", "PaGlobal_Guild_Manufacture:setProductItemCount(" .. ii .. ")")
      ;
      (noneSlot._selectButton):addInputEvent("Mouse_LUp", "PaGlobal_Guild_Manufacture:select(" .. ii .. ")")
      ;
      (noneSlot._setButton):addInputEvent("Mouse_LUp", "PaGlobal_Guild_Manufacture:set(" .. ii .. ")")
      ;
      (noneSlot._productItemName):SetShow(false)
      local proceedingSlot = slot[__eGuildManufactureStateProceeding]
      local tempProductSlot_1 = {}
      tempProductSlot_1.bg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, proceedingSlot._backGround, "ProductItemBG_1_" .. ii)
      CopyBaseProperty((self._ui)._baseProductSlot, tempProductSlot_1.bg)
      ;
      (tempProductSlot_1.bg):SetPosX(10)
      ;
      (tempProductSlot_1.bg):SetShow(true)
      ;
      (SlotItem.new)(tempProductSlot_1, "ProductItemIcon_" .. ii, ii, tempProductSlot_1.bg, self._slotConfig)
      tempProductSlot_1:createChild()
      ;
      (tempProductSlot_1.icon):SetPosX(4)
      ;
      (tempProductSlot_1.icon):SetPosY(4)
      ;
      (tempProductSlot_1.icon):SetShow(true)
      ;
      (tempProductSlot_1.icon):addInputEvent("Mouse_On", "PaGlobal_Guild_Manufacture:productItemTooltip_Show(" .. ii .. ", __eGuildManufactureStateProceeding)")
      ;
      (tempProductSlot_1.icon):addInputEvent("Mouse_Out", "PaGlobal_Guild_Manufacture:itemTooltip_Hide()")
      proceedingSlot._productSlot = tempProductSlot_1
      proceedingSlot._productItemName = (UI.getChildControl)(proceedingSlot._backGround, "Static_Result_Name")
      proceedingSlot._productItemCount = (UI.getChildControl)(proceedingSlot._backGround, "StaticText_Count")
      proceedingSlot._startButton = (UI.getChildControl)(proceedingSlot._backGround, "Button_Start")
      proceedingSlot._deleteButton = (UI.getChildControl)(proceedingSlot._backGround, "Button_Delete")
      proceedingSlot._progressBar = (UI.getChildControl)(proceedingSlot._backGround, "Progress2_Gathering")
      proceedingSlot._progressText = (UI.getChildControl)(proceedingSlot._backGround, "StaticText_Progress")
      ;
      (proceedingSlot._startButton):addInputEvent("Mouse_LUp", "PaGlobal_Guild_Manufacture:start(" .. ii .. ")")
      ;
      (proceedingSlot._deleteButton):addInputEvent("Mouse_LUp", "PaGlobal_Guild_Manufacture:delete(" .. ii .. ")")
      for jj = 0, __eGuildManufactureRequiredItemCount - 1 do
        local tempSlot = {}
        tempSlot.bg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, proceedingSlot._backGround, "RequiredItemBG_" .. ii .. "_" .. jj)
        CopyBaseProperty(baseRequiredSlot, tempSlot.bg)
        ;
        (tempSlot.bg):SetPosX(jj * 60 + 340)
        ;
        (tempSlot.bg):SetShow(true)
        ;
        (SlotItem.new)(tempSlot, "RequiredItemIcon_" .. ii .. "_" .. jj, jj, tempSlot.bg, self._slotConfig)
        tempSlot:createChild()
        ;
        (tempSlot.icon):SetPosX(4)
        ;
        (tempSlot.icon):SetPosY(4)
        ;
        (tempSlot.icon):SetShow(true)
        ;
        (tempSlot.icon):addInputEvent("Mouse_LUp", "PaGlobal_Guild_Manufacture:updateItem(" .. ii .. "," .. jj .. ")")
        ;
        (tempSlot.icon):addInputEvent("Mouse_On", "PaGlobal_Guild_Manufacture:requiredItemTooltip_Show(" .. ii .. ", " .. jj .. ")")
        ;
        (tempSlot.icon):addInputEvent("Mouse_Out", "PaGlobal_Guild_Manufacture:itemTooltip_Hide()")
        -- DECOMPILER ERROR at PC476: Confused about usage of register: R17 in 'UnsetPending'

        ;
        (proceedingSlot._requiredSlot)[jj] = tempSlot
        local tempItemInfo = {enchantKey = nil, countText = nil, countValue_s64 = nil}
        tempItemInfo.countText = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, proceedingSlot._backGround, "RequiredItemCount_" .. ii .. "_" .. jj)
        CopyBaseProperty(baseRequiredSlotText, tempItemInfo.countText)
        ;
        (tempItemInfo.countText):SetPosX(jj * 60 + 340)
        ;
        (tempItemInfo.countText):SetShow(true)
        -- DECOMPILER ERROR at PC508: Confused about usage of register: R18 in 'UnsetPending'

        ;
        (proceedingSlot._requiredItem)[jj] = tempItemInfo
      end
      local readySlot = slot[__eGuildManufactureStateCreating]
      local tempProductSlot_2 = {}
      tempProductSlot_2.bg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, readySlot._backGround, "ProductItemBG_2_" .. ii)
      CopyBaseProperty((self._ui)._baseProductSlot, tempProductSlot_2.bg)
      ;
      (tempProductSlot_2.bg):SetPosX(10)
      ;
      (tempProductSlot_2.bg):SetShow(true)
      ;
      (SlotItem.new)(tempProductSlot_2, "ProductItemIcon_" .. ii, ii, tempProductSlot_2.bg, self._slotConfig)
      tempProductSlot_2:createChild()
      ;
      (tempProductSlot_2.icon):SetPosX(4)
      ;
      (tempProductSlot_2.icon):SetPosY(4)
      ;
      (tempProductSlot_2.icon):SetShow(true)
      ;
      (tempProductSlot_2.icon):addInputEvent("Mouse_On", "PaGlobal_Guild_Manufacture:productItemTooltip_Show(" .. ii .. ", __eGuildManufactureStateCreating)")
      ;
      (tempProductSlot_2.icon):addInputEvent("Mouse_Out", "PaGlobal_Guild_Manufacture:itemTooltip_Hide()")
      readySlot._productSlot = tempProductSlot_2
      readySlot._productItemName = (UI.getChildControl)(readySlot._backGround, "Static_Result_Name")
      readySlot._productItemCount = (UI.getChildControl)(readySlot._backGround, "StaticText_Count")
      readySlot._completeDate = (UI.getChildControl)(readySlot._backGround, "StaticText_CompleteTime")
      readySlot._completeButton = (UI.getChildControl)(readySlot._backGround, "Button_Complete")
      ;
      (readySlot._completeButton):addInputEvent("Mouse_LUp", "PaGlobal_Guild_Manufacture:complete(" .. ii .. ")")
      local completeSlot = slot[__eGuildManufactureStateComplete]
      local tempProductSlot_3 = {}
      tempProductSlot_3.bg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, completeSlot._backGround, "ProductItemBG_3_" .. ii)
      CopyBaseProperty((self._ui)._baseProductSlot, tempProductSlot_3.bg)
      ;
      (tempProductSlot_3.bg):SetPosX(10)
      ;
      (tempProductSlot_3.bg):SetShow(true)
      ;
      (SlotItem.new)(tempProductSlot_3, "ProductItemIcon_" .. ii, ii, tempProductSlot_3.bg, self._slotConfig)
      tempProductSlot_3:createChild()
      ;
      (tempProductSlot_3.icon):SetPosX(4)
      ;
      (tempProductSlot_3.icon):SetPosY(4)
      ;
      (tempProductSlot_3.icon):SetShow(true)
      ;
      (tempProductSlot_3.icon):addInputEvent("Mouse_On", "PaGlobal_Guild_Manufacture:productItemTooltip_Show(" .. ii .. ", __eGuildManufactureStateComplete)")
      ;
      (tempProductSlot_3.icon):addInputEvent("Mouse_Out", "PaGlobal_Guild_Manufacture:itemTooltip_Hide()")
      completeSlot._productSlot = tempProductSlot_3
      completeSlot._productItemName = (UI.getChildControl)(completeSlot._backGround, "Static_Result_Name")
      completeSlot._productItemCount = (UI.getChildControl)(completeSlot._backGround, "StaticText_Count")
      completeSlot._receiveButton = (UI.getChildControl)(completeSlot._backGround, "Button_Receive")
      ;
      (completeSlot._receiveButton):addInputEvent("Mouse_LUp", "PaGlobal_Guild_Manufacture:receive(" .. ii .. ")")
      slot:SetPos(0, ii * 195 + 45)
      slot:SetShow(false)
      -- DECOMPILER ERROR at PC707: Confused about usage of register: R16 in 'UnsetPending'

      ;
      (self._slot)[ii] = slot
    end
  end
  Panel_Guild_Manufacture:SetShow(true)
  deleteControl((self._ui)._baseNoneStateBG)
  -- DECOMPILER ERROR at PC719: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui)._baseNoneStateBG = nil
  deleteControl((self._ui)._baseProceedingStateBG)
  -- DECOMPILER ERROR at PC725: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui)._baseProceedingStateBG = nil
  deleteControl((self._ui)._baseReadyStateBG)
  -- DECOMPILER ERROR at PC731: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui)._baseReadyStateBG = nil
  deleteControl((self._ui)._baseCompleteStateBG)
  -- DECOMPILER ERROR at PC737: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui)._baseCompleteStateBG = nil
  deleteControl((self._ui)._baseProductSlot)
  -- DECOMPILER ERROR at PC743: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (self._ui)._baseProductSlot = nil
  ;
  ((self._ui)._guildBG):MoveChilds(((self._ui)._guildBG):GetID(), Panel_Guild_Manufacture)
  ;
  (UI.deletePanel)(Panel_Guild_Manufacture:GetID())
  Panel_Guild_Manufacture = nil
end

-- DECOMPILER ERROR at PC60: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.__updateNoneState = function(self, index, infoWrapper)
  -- function num : 0_3
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R3 in 'UnsetPending'

  ((self._slot)[index])._productItemEnchantKey = nil
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R3 in 'UnsetPending'

  ;
  ((self._slot)[index])._productItemCount_s64 = nil
  local slot = ((self._slot)[index])[__eGuildManufactureStateNone]
  ;
  (slot._productSlot):clearItem()
  ;
  (slot._productItemName):SetShow(false)
  ;
  (slot._productItemCount):SetText("")
  ;
  (slot._backGround):SetShow(true)
end

-- DECOMPILER ERROR at PC63: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.__updateProceedingState = function(self, index, infoWrapper, isReady)
  -- function num : 0_4
  local itemEnchantKey = infoWrapper:getProductItemEnchantKey()
  local itemStatic = getItemEnchantStaticStatus(itemEnchantKey)
  if itemStatic == nil then
    return 
  end
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R6 in 'UnsetPending'

  ;
  ((self._slot)[index])._productItemEnchantKey = itemEnchantKey
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R6 in 'UnsetPending'

  ;
  ((self._slot)[index])._productItemCount_s64 = infoWrapper:getProductItemCount()
  local slot = ((self._slot)[index])[__eGuildManufactureStateProceeding]
  ;
  (slot._productSlot):setItemByStaticStatus(itemStatic)
  ;
  (slot._productItemName):SetText(itemStatic:getName())
  ;
  (slot._productItemCount):SetText("x" .. tostring(infoWrapper:getProductItemCount()))
  local fullCount = 0
  local requiredItemCount = 0
  for ii = 0, __eGuildManufactureRequiredItemCount - 1 do
    itemEnchantKey = infoWrapper:getRequiredItemEnchantKey(R15_PC47)
    itemStatic = getItemEnchantStaticStatus(itemEnchantKey)
    itemCount_s64 = infoWrapper:getRequiredItemCount(R15_PC47)
    -- DECOMPILER ERROR at PC62: Overwrote pending register: R15 in 'AssignReg'

    if itemStatic ~= nil then
      ((slot._requiredSlot)[ii]):setItemByStaticStatus(R15_PC47)
      -- DECOMPILER ERROR at PC68: Overwrote pending register: R15 in 'AssignReg'

      ;
      (((slot._requiredItem)[ii]).countText):SetText(R15_PC47(itemCount_s64))
      requiredItemCount = requiredItemCount + 1
      if Int64toInt32(itemCount_s64) <= 0 then
        fullCount = fullCount + 1
      end
    else
      ;
      ((slot._requiredSlot)[ii]):clearItem()
      ;
      (((slot._requiredItem)[ii]).countText):SetText("")
    end
    -- DECOMPILER ERROR at PC92: Confused about usage of register: R13 in 'UnsetPending'

    ;
    ((slot._requiredItem)[ii]).enchantKey = itemEnchantKey
    -- DECOMPILER ERROR at PC96: Confused about usage of register: R13 in 'UnsetPending'

    ;
    ((slot._requiredItem)[ii]).countValue_s64 = itemCount_s64
    if Int64toInt32(itemCount_s64) <= 0 then
      (((slot._requiredSlot)[ii]).bg):SetEnable(false)
      ;
      (((slot._requiredSlot)[ii]).icon):SetMonoTone(true)
    else
      ;
      (((slot._requiredSlot)[ii]).bg):SetEnable(true)
      ;
      (((slot._requiredSlot)[ii]).icon):SetMonoTone(false)
    end
  end
  local curPct = (math.floor)((fullCount) * 100 / (requiredItemCount))
  ;
  (slot._progressBar):SetProgressRate(curPct)
  ;
  (slot._progressBar):SetCurrentProgressRate(curPct)
  ;
  (slot._progressText):SetText((string.format)("진행�\160 : %d", curPct) .. " %")
  if isReady == true then
    (slot._startButton):SetEnable(true)
    ;
    (slot._startButton):SetMonoTone(false)
  else
    ;
    (slot._startButton):SetEnable(false)
    ;
    (slot._startButton):SetMonoTone(true)
  end
  ;
  (slot._backGround):SetShow(true)
end

-- DECOMPILER ERROR at PC66: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.__updateCreatingState = function(self, index, infoWrapper)
  -- function num : 0_5
  local itemEnchantKey = infoWrapper:getProductItemEnchantKey()
  local itemStatic = getItemEnchantStaticStatus(itemEnchantKey)
  if itemStatic == nil then
    return 
  end
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R5 in 'UnsetPending'

  ;
  ((self._slot)[index])._productItemEnchantKey = itemEnchantKey
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R5 in 'UnsetPending'

  ;
  ((self._slot)[index])._productItemCount_s64 = infoWrapper:getProductItemCount()
  local slot = ((self._slot)[index])[__eGuildManufactureStateCreating]
  ;
  (slot._productSlot):setItemByStaticStatus(itemStatic)
  ;
  (slot._productItemName):SetText(itemStatic:getName())
  ;
  (slot._productItemCount):SetText("x" .. tostring(infoWrapper:getProductItemCount()))
  local time_s64 = PATime(infoWrapper:getCompleteDate())
  local completeDate = (string.format)("%s�\132 %s�\148 %s�\188 %s�\156 %s�\132 작업 완료 예정 입니�\164.", time_s64:GetYear(), time_s64:GetMonth(), time_s64:GetDay(), time_s64:GetHour(), time_s64:GetMinute())
  ;
  (slot._completeDate):SetText(completeDate)
  ;
  (slot._backGround):SetShow(true)
end

-- DECOMPILER ERROR at PC69: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.__updateCompleteState = function(self, index, infoWrapper)
  -- function num : 0_6
  local itemEnchantKey = infoWrapper:getProductItemEnchantKey()
  local itemStatic = getItemEnchantStaticStatus(itemEnchantKey)
  if itemStatic == nil then
    return 
  end
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R5 in 'UnsetPending'

  ;
  ((self._slot)[index])._productItemEnchantKey = itemEnchantKey
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R5 in 'UnsetPending'

  ;
  ((self._slot)[index])._productItemCount_s64 = infoWrapper:getProductItemCount()
  local slot = ((self._slot)[index])[__eGuildManufactureStateComplete]
  ;
  (slot._productSlot):setItemByStaticStatus(itemStatic)
  ;
  (slot._productItemName):SetText(itemStatic:getName())
  ;
  (slot._productItemCount):SetText("x" .. tostring(infoWrapper:getProductItemCount()))
  ;
  (slot._backGround):SetShow(true)
end

-- DECOMPILER ERROR at PC72: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.refresh = function(self)
  -- function num : 0_7
  for ii = 0, __eGuildManufactureProductItemCount - 1 do
    ((self._slot)[ii]):SetShow(false)
  end
  local listWrapper = ToClient_GetGuildManufactureListWrapper()
  if listWrapper ~= nil then
    for ii = 0, __eGuildManufactureProductItemCount - 1 do
      local infoWrapper = listWrapper:getInfo(ii)
      if infoWrapper ~= nil then
        local state = infoWrapper:getState()
        if __eGuildManufactureStateNone == state then
          self:__updateNoneState(ii, infoWrapper)
        else
          if __eGuildManufactureStateProceeding == state then
            self:__updateProceedingState(ii, infoWrapper, false)
          else
            if __eGuildManufactureStateReady == state then
              self:__updateProceedingState(ii, infoWrapper, true)
            else
              if __eGuildManufactureStateCreating == state then
                self:__updateCreatingState(ii, infoWrapper)
              else
                if __eGuildManufactureStateComplete == state then
                  self:__updateCompleteState(ii, infoWrapper)
                else
                  _PA_ASSERT(false, "PaGlobal_Guild_Manufacture:refresh() 없는 state �\146 입니�\164. %s", state)
                end
              end
            end
          end
        end
      else
        do
          do
            ;
            ((((self._slot)[ii])[__eGuildManufactureStateNone])._backGround):SetShow(true)
            -- DECOMPILER ERROR at PC83: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC83: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC83: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  else
    for ii = 0, __eGuildManufactureProductItemCount - 1 do
      ((((self._slot)[ii])[__eGuildManufactureStateNone])._backGround):SetShow(true)
    end
  end
end

-- DECOMPILER ERROR at PC75: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.refreshState = function(self, index)
  -- function num : 0_8
  ((self._slot)[index]):SetShow(false)
  local infoWrapper = ToClient_GetGuildManufactureInfoWrapper(index)
  if infoWrapper ~= nil then
    local state = infoWrapper:getState()
    if __eGuildManufactureStateNone == state then
      self:__updateNoneState(index, infoWrapper)
    else
      if __eGuildManufactureStateProceeding == state then
        self:__updateProceedingState(index, infoWrapper, false)
      else
        if __eGuildManufactureStateReady == state then
          self:__updateProceedingState(index, infoWrapper, true)
        else
          if __eGuildManufactureStateCreating == state then
            self:__updateCreatingState(index, infoWrapper)
          else
            if __eGuildManufactureStateComplete == state then
              self:__updateCompleteState(index, infoWrapper)
            else
              _PA_ASSERT(false, "PaGlobal_Guild_Manufacture:refresh() 없는 state �\146 입니�\164. %s", state)
            end
          end
        end
      end
    end
  else
    do
      ;
      ((((self._slot)[ii])[__eGuildManufactureStateNone])._backGround):SetShow(true)
    end
  end
end

-- DECOMPILER ERROR at PC78: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.SetShow = function(self, isShow)
  -- function num : 0_9
  if isShow == true then
    self:refresh()
  else
    PaGlobal_Guild_ManufactureSelect:close()
  end
  ;
  ((self._ui)._guildBG):SetShow(isShow)
end

-- DECOMPILER ERROR at PC81: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.start = function(self, index)
  -- function num : 0_10
  local completePrice_s64 = ToClient_GetGuildManufactureCompletePrice(index)
  if Int64toInt32(completePrice_s64) < 0 then
    Proc_ShowMessage_Ack("[길드 �\128공] 잘못�\156 �\146 입니�\164.")
    return 
  end
  local selfPlayer = getSelfPlayer()
  if selfPlayer ~= nil and (selfPlayer:get()):isGuildMaster() == true then
    local msg = self._messageStart
    msg.content = (string.format)("�\128공을 시작 합니�\164. 길드자금 %s 사용하면 즉시 완료�\128 됩니�\164. 사용 하시겠습니까?", tostring(completePrice_s64))
    msg.index = index
    ;
    (MessageBox.showMessageBox)(msg, "top")
  else
    do
      Proc_ShowMessage_Ack("[길드 �\128공] 권한�\180 없습니다.")
    end
  end
end

-- DECOMPILER ERROR at PC84: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.delete = function(self, index)
  -- function num : 0_11
  local selfPlayer = getSelfPlayer()
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R3 in 'UnsetPending'

  if selfPlayer ~= nil and (selfPlayer:get()):isGuildMaster() == true then
    (self._messageDelete).index = index
    ;
    (MessageBox.showMessageBox)(self._messageDelete, "top")
  else
    Proc_ShowMessage_Ack("[길드 �\128공] 권한�\180 없습니다.")
  end
end

-- DECOMPILER ERROR at PC87: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.complete = function(self, index)
  -- function num : 0_12
  local selfPlayer = getSelfPlayer()
  if selfPlayer ~= nil and (selfPlayer:get()):isGuildMaster() == true then
    ToClient_Guild_Manufacture_NowComplete(index, ((self._slot)[index])._productItemEnchantKey, toInt64(0, 0), 0)
  else
    Proc_ShowMessage_Ack("[길드 �\128공] 권한�\180 없습니다.")
  end
end

-- DECOMPILER ERROR at PC90: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.receive = function(self, index)
  -- function num : 0_13
  local selfPlayer = getSelfPlayer()
  if selfPlayer ~= nil and (selfPlayer:get()):isGuildMaster() == true then
    ToClient_Guild_Manufacture_Receive(index, ((self._slot)[index])._productItemEnchantKey)
  else
    Proc_ShowMessage_Ack("[길드 �\128공] 권한�\180 없습니다.")
  end
end

-- DECOMPILER ERROR at PC93: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.updateItem = function(self, mainIndex, subIndex)
  -- function num : 0_14
  local slot = ((self._slot)[mainIndex])[__eGuildManufactureStateProceeding]
  local itemEnchantKey = ((slot._requiredItem)[subIndex]).enchantKey
  local slotNo = ToClient_InventoryGetSlotNo(itemEnchantKey)
  if __eTInventorySlotNoUndefined == slotNo then
    if ToClient_IsDevelopment() == true then
      Proc_ShowMessage_Ack((string.format)("[길드 �\128공] 인벤토리�\144 해당 %s 아이템이 없습니다.", itemEnchantKey:get()))
    else
      Proc_ShowMessage_Ack((string.format)("[길드 �\128공] 인벤토리�\144 해당 아이템이 없습니다."))
    end
    return 
  end
  local itemWrapper = getInventoryItem(slotNo)
  if itemWrapper ~= nil and itemWrapper:empty() == false then
    local stackCount_s64 = itemWrapper:getCount()
    local requiredCount_s64 = ((slot._requiredItem)[subIndex]).countValue_s64
    if requiredCount_s64 < stackCount_s64 then
      Panel_NumberPad_Show(true, requiredCount_s64, slotNo, FGlobal_Guild_Manufacture_Update_RequiredItemCount, nil, mainIndex, nil, subIndex)
    else
      Panel_NumberPad_Show(true, stackCount_s64, slotNo, FGlobal_Guild_Manufacture_Update_RequiredItemCount, nil, mainIndex, nil, subIndex)
    end
  end
end

-- DECOMPILER ERROR at PC96: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.select = function(self, index)
  -- function num : 0_15
  local selfPlayer = getSelfPlayer()
  if selfPlayer ~= nil and (selfPlayer:get()):isGuildMaster() == true then
    PaGlobal_Guild_ManufactureSelect:open(index)
  else
    Proc_ShowMessage_Ack("[길드 �\128공] 권한�\180 없습니다.")
  end
end

-- DECOMPILER ERROR at PC99: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.setProductItemCount = function(self, index)
  -- function num : 0_16
  local itemEnchantKey = ((self._slot)[index])._productItemEnchantKey
  if itemEnchantKey == nil then
    Proc_ShowMessage_Ack("[길드 �\128공] 아이템이 선택되지 않았습니�\164.")
    return 
  end
  local selfPlayer = getSelfPlayer()
  if selfPlayer ~= nil and (selfPlayer:get()):isGuildMaster() == true then
    local itemStatic = getItemEnchantStaticStatus(itemEnchantKey)
    if (itemStatic:get()):isStackableXXX() == true then
      Panel_NumberPad_Show(true, toInt64(0, __eGuildManufactureProductItemCountRateMax), index, FGlobal_Guild_Manufacture_Set_ProductItemCount)
    else
      Proc_ShowMessage_Ack("[길드 �\128공] 스택�\149 아이템만 �\128�\165 합니�\164.")
    end
  else
    do
      Proc_ShowMessage_Ack("[길드 �\128공] 권한�\180 없습니다.")
    end
  end
end

-- DECOMPILER ERROR at PC102: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.set = function(self, index)
  -- function num : 0_17
  if ((self._slot)[index])._productItemEnchantKey == nil then
    Proc_ShowMessage_Ack("[길드 �\128공] 아이템이 선택되지 않았습니�\164.")
    return 
  end
  local selfPlayer = getSelfPlayer()
  if selfPlayer ~= nil and (selfPlayer:get()):isGuildMaster() == true then
    ToClient_Guild_Manufacture_Set(index, ((self._slot)[index])._productItemEnchantKey, ((self._slot)[index])._productItemCount_s64)
  else
    Proc_ShowMessage_Ack("[길드 �\128공] 권한�\180 없습니다.")
  end
end

-- DECOMPILER ERROR at PC105: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.setProductItem = function(self, index, itemEnchantKey)
  -- function num : 0_18
  local itemEnchantKey = itemEnchantKey
  local itemStatic = getItemEnchantStaticStatus(itemEnchantKey)
  if itemStatic == nil then
    return 
  end
  -- DECOMPILER ERROR at PC9: Confused about usage of register: R5 in 'UnsetPending'

  ;
  ((self._slot)[index])._productItemEnchantKey = itemEnchantKey
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R5 in 'UnsetPending'

  ;
  ((self._slot)[index])._productItemCount_s64 = toInt64(0, 1)
  local slot = ((self._slot)[index])[__eGuildManufactureStateNone]
  ;
  (slot._productSlot):setItemByStaticStatus(itemStatic)
  ;
  (slot._productItemName):SetText(itemStatic:getName())
  ;
  (slot._productItemName):SetShow(true)
  ;
  (slot._productItemCount):SetText("x1")
end

-- DECOMPILER ERROR at PC108: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.productItemTooltip_Show = function(self, index, state)
  -- function num : 0_19
  local slot = (self._slot)[index]
  if slot._productItemEnchantKey == nil then
    return 
  end
  local itemStatic = getItemEnchantStaticStatus(slot._productItemEnchantKey)
  if itemStatic ~= nil then
    Panel_Tooltip_Item_SetPosition(index, slot[state], "guildManufactureProductItem")
    Panel_Tooltip_Item_Show(itemStatic, (self._ui)._guildBG, true)
  end
end

-- DECOMPILER ERROR at PC111: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.requiredItemTooltip_Show = function(self, mainIndex, subIndex)
  -- function num : 0_20
  local slot = ((self._slot)[mainIndex])[__eGuildManufactureStateProceeding]
  local itemStatic = getItemEnchantStaticStatus(((slot._requiredItem)[subIndex]).enchantKey)
  if itemStatic ~= nil then
    Panel_Tooltip_Item_SetPosition(subIndex, (self._slot)[mainIndex], "guildManufactureRequiredItem")
    Panel_Tooltip_Item_Show(itemStatic, (self._ui)._guildBG, true)
  end
end

-- DECOMPILER ERROR at PC114: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_Guild_Manufacture.itemTooltip_Hide = function(self)
  -- function num : 0_21
  Panel_Tooltip_Item_hideTooltip()
end

FromClient_Guild_Manufacture_Refresh = function(index)
  -- function num : 0_22
  local self = PaGlobal_Guild_Manufacture
  if ((self._ui)._guildBG):GetShow() == false then
    return 
  end
  self:refreshState(index)
end

FromClient_Guild_Manufacture_CompletePrice = function(index, itemEnchantKey, price_s64)
  -- function num : 0_23
  local self = PaGlobal_Guild_Manufacture
  local msg = self._messageNowCompleteAck
  msg.content = (string.format)("즉시 완료 하려�\180, 길드 자금 %s 정도�\128 소모 됩니�\164.", tostring(price_s64))
  msg.itemEnchantKey = itemEnchantKey
  msg.index = index
  msg.price_s64 = price_s64
  ;
  (MessageBox.showMessageBox)(msg, "top")
end

FGlobal_Guild_Manufacture_Now_Complete_Yes = function()
  -- function num : 0_24
  local self = PaGlobal_Guild_Manufacture
  local msg = self._messageNowCompleteAck
  ToClient_Guild_Manufacture_NowComplete(msg.index, msg.itemEnchantKey, msg.price_s64, 1)
  msg.itemEnchantKey = nil
  msg.index = nil
  msg.price_s64 = nil
end

FGlobal_Guild_Manufacture_Now_Complete_No = function()
  -- function num : 0_25
  local self = PaGlobal_Guild_Manufacture
  local msg = self._messageNowCompleteAck
  msg.itemEnchantKey = nil
  msg.index = nil
  msg.price_s64 = nil
end

FGlobal_Guild_Manufacture_Delete_Yes = function()
  -- function num : 0_26
  local self = PaGlobal_Guild_Manufacture
  local index = (self._messageDelete).index
  ToClient_Guild_Manufacture_Delete(index, ((self._slot)[index])._productItemEnchantKey)
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._messageDelete).index = nil
end

FGlobal_Guild_Manufacture_Delete_No = function()
  -- function num : 0_27
  local self = PaGlobal_Guild_Manufacture
  -- DECOMPILER ERROR at PC2: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (self._messageDelete).index = nil
end

FGlobal_Guild_Manufacture_Start_Yes = function()
  -- function num : 0_28
  local self = PaGlobal_Guild_Manufacture
  local index = (self._messageStart).index
  ToClient_Guild_Manufacture_Start(index, ((self._slot)[index])._productItemEnchantKey, true)
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._messageStart).index = nil
end

FGlobal_Guild_Manufacture_Start_No = function()
  -- function num : 0_29
  local self = PaGlobal_Guild_Manufacture
  local index = (self._messageStart).index
  ToClient_Guild_Manufacture_Start(index, ((self._slot)[index])._productItemEnchantKey, false)
  -- DECOMPILER ERROR at PC11: Confused about usage of register: R2 in 'UnsetPending'

  ;
  (self._messageStart).index = nil
end

FGlobal_Guild_Manufacture_Set_ProductItemCount = function(inputNumber, index)
  -- function num : 0_30
  local self = PaGlobal_Guild_Manufacture
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R3 in 'UnsetPending'

  ;
  ((self._slot)[index])._productItemCount_s64 = inputNumber
  local slot = ((self._slot)[index])[__eGuildManufactureStateNone]
  ;
  (slot._productItemCount):SetText("x" .. tostring(inputNumber))
end

FGlobal_Guild_Manufacture_Update_RequiredItemCount = function(inputNumber, slotNo, mainIndex, subIndex)
  -- function num : 0_31
  local self = PaGlobal_Guild_Manufacture
  local slot = ((self._slot)[mainIndex])[__eGuildManufactureStateProceeding]
  local itemEnchantKey = ((slot._requiredItem)[subIndex]).enchantKey
  ToClient_Guild_Manufacture_Update(mainIndex, subIndex, itemEnchantKey, (CppEnums.ItemWhereType).eInventory, slotNo, inputNumber)
end

PaGlobal_Guild_Manufacture:initialize()

