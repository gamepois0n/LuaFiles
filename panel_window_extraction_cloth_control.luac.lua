-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\ui_data\x86\window\extraction\panel_window_extraction_cloth_control.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC2: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ExtractionCloth.setExtractionType = function(self, _type)
  -- function num : 0_0
  if _type == 0 then
    (self._radioBtnValks):SetCheck(true)
    ;
    (self._radioBtnCronStone):SetCheck(false)
  else
    ;
    (self._radioBtnValks):SetCheck(false)
    ;
    (self._radioBtnCronStone):SetCheck(true)
  end
  if (self._equipItem).icon then
    (self._textBalksCount):SetText((self.count)[_type])
    self:changeIconTexture(_type)
  end
end

-- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ExtractionCloth.changeIconTexture = function(self, _type)
  -- function num : 0_1
  local iconPath = ""
  if _type == 0 then
    iconPath = "/icon/new_icon/09_cash/00017643.dds"
  else
    iconPath = "/Icon/New_Icon/03_ETC/00016080.dds"
  end
  ;
  (self._balks):ChangeTextureInfoName(iconPath)
end

ExtractionCloth_InvenFiler_MainItem = function(slotNo, itemWrapper)
  -- function num : 0_2
  if itemWrapper == nil then
    return true
  end
  local itemCount = (itemWrapper:getStaticStatus()):getExtractionCount_s64()
  if itemCount == nil then
    return true
  else
    if Int64toInt32(itemCount) <= 0 then
      return true
    else
      return false
    end
  end
end

ExtractionCloth_InteractortionFromInventory = function(slotNo, itemWrapper, count_s64, inventoryType)
  -- function num : 0_3
  local self = PaGlobal_ExtractionCloth
  if self._currentTime > 0 then
    return 
  end
  if (self._equipItem).icon then
    audioPostEvent_SystemUi(0, 16)
    ;
    ((self._equipItem).icon):AddEffect("UI_Button_Hide", false, 0, 0)
    ;
    ((self._equipItem).slot_On):SetShow(true)
    ;
    ((self._equipItem).slot_Nil):SetShow(false)
    ;
    (self._effectCircleEff):ResetVertexAni()
    ;
    (self._effectCircleEff):SetVertexAniRun("Ani_Color_On", true)
    ;
    (self._effectCircleEff):SetVertexAniRun("Ani_Rotate_New", true)
    ;
    (self._buttonApply):SetIgnore(false)
    ;
    (self._buttonApply):SetMonoTone(false)
  end
  -- DECOMPILER ERROR at PC53: Confused about usage of register: R5 in 'UnsetPending'

  ;
  (self._equipItem).empty = false
  self._extraction_TargetWhereType = inventoryType
  self._extraction_TargetSlotNo = slotNo
  local itemWrapper = getInventoryItemByType(inventoryType, slotNo)
  ;
  (self._equipItem):setItem(itemWrapper)
  ;
  ((self._equipItem).icon):addInputEvent("Mouse_On", "Panel_Tooltip_Item_Show_GeneralNormal(" .. slotNo .. ", \"clothExtraction\", true)")
  ;
  ((self._equipItem).icon):addInputEvent("Mouse_Out", "Panel_Tooltip_Item_Show_GeneralNormal(" .. slotNo .. ", \"clothExtraction\", false)")
  Panel_Tooltip_Item_SetPosition(slotNo, self._equipItem, "clothExtraction")
  ;
  (self._balks):SetShow(true)
  ;
  (self._balks):SetMonoTone(true)
  ;
  (self._textBalksCount):SetShow(true)
  local _count = 0
  -- DECOMPILER ERROR at PC107: Confused about usage of register: R7 in 'UnsetPending'

  ;
  (self.count)[0] = Int64toInt32((itemWrapper:getStaticStatus()):getExtractionCount_s64())
  -- DECOMPILER ERROR at PC115: Confused about usage of register: R7 in 'UnsetPending'

  ;
  (self.count)[1] = Int64toInt32((itemWrapper:getStaticStatus()):getCronCount_s64())
  if (self._radioBtnValks):IsCheck() then
    _count = (self.count)[0]
    self:changeIconTexture(0)
  else
    _count = (self.count)[1]
    self:changeIconTexture(1)
  end
  ;
  (self._textBalksCount):SetText(_count)
  Inventory_SetFunctor(ExtractionCloth_InvenFiler_MainItem, ExtractionCloth_InteractortionFromInventory, ExtractionCloth_WindowClose, nil)
end

-- DECOMPILER ERROR at PC12: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ExtractionCloth.handleMRUpEquipSlot = function(self)
  -- function num : 0_4
  (self._effectCircleEff):ResetVertexAni()
  ;
  (self._effectCircleEff):SetVertexAniRun("Ani_Color_Off", true)
  ;
  (self._effectCircleEff):SetVertexAniRun("Ani_Rotate_New", true)
  self:clear()
  Inventory_SetFunctor(ExtractionCloth_InvenFiler_MainItem, ExtractionCloth_InteractortionFromInventory, ExtractionCloth_WindowClose, nil)
end

-- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ExtractionCloth.applyReady = function(self)
  -- function num : 0_5
  self._currentTime = 0
  self._doExtracting = false
  local resultItem = ""
  if (self._radioBtnValks):IsCheck() then
    resultItem = "<" .. (getItemEnchantStaticStatus(ItemEnchantKey(17643))):getName() .. ">"
  else
    resultItem = "<" .. (getItemEnchantStaticStatus(ItemEnchantKey(16080))):getName() .. ">"
  end
  local messageContent = PAGetStringParam1(Defines.StringSheet_GAME, "LUA_EXTRACTION_CLOTH_3", "resultItem", resultItem)
  local messageboxData = {title = PAGetString(Defines.StringSheet_RESOURCE, "UI_WINDOW_EXTRACTION_CLOTH_TITLE"), content = messageContent, functionYes = function()
    -- function num : 0_5_0 , upvalues : self
    ExtractionCloth_Success()
    Panel_Window_Extraction_Cloth:RegisterUpdateFunc("ExtractionCloth_CheckTime")
    ;
    (self._radioBtnValks):SetIgnore(self._doExtracting)
    ;
    (self._radioBtnCronStone):SetIgnore(self._doExtracting)
    audioPostEvent_SystemUi(5, 10)
  end
, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageboxData)
end

-- DECOMPILER ERROR at PC18: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ExtractionCloth.registMessageHandler = function(self)
  -- function num : 0_6
  registerEvent("FromClient_ExtractionCloth_Success", "ExtractionCloth_Success")
  registerEvent("FromClient_ExtractItemFromExtractionCount", "ExtractionCloth_SuccessMessage")
end

ExtractionCloth_SuccessMessage = function()
  -- function num : 0_7
  local self = PaGlobal_ExtractionCloth
  self:resultShow()
end

ExtractionCloth_Success = function()
  -- function num : 0_8
  local self = PaGlobal_ExtractionCloth
  FGlobal_ExtractionEffect_Init()
  ;
  (self._radioBtnValks):SetIgnore(self._doExtracting)
  ;
  (self._radioBtnCronStone):SetIgnore(self._doExtracting)
  ;
  (self._extracting_Effect_Step1):EraseAllEffect()
  ;
  (self._balks):EraseAllEffect()
end

-- DECOMPILER ERROR at PC25: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_ExtractionCloth.successXXX = function(self)
  -- function num : 0_9
  local isValks = (self._radioBtnValks):IsCheck()
  ToClient_RequestExtracItemFromExtractionCount(self._extraction_TargetWhereType, self._extraction_TargetSlotNo, isValks)
  self._doExtracting = false
  self._currentTime = 0
  ;
  (self._radioBtnValks):SetIgnore(self._doExtracting)
  ;
  (self._radioBtnCronStone):SetIgnore(self._doExtracting)
  self:clear()
end


